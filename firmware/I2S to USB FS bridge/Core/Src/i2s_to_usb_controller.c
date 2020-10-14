/*
 * i2s_to_usb_controller.c
 *
 *  Created on: 15 Sep 2020
 *      Author: Mark
 */

#include "i2s_to_usb_controller.h"
#include "usbd_i2s_to_usb.h"

#include "debug_funcs.h"

#define DEBUG_COUNTER

/* GLOBALS */
/***********/
/* State machine state */
volatile static Controller_State g_state;

/* Error flag */
volatile static Controller_StatusTypeDef g_error;

/* Acquisition channel. 0 => left, 1 => right */
static uint8_t g_channel;

/* I2S input data buffer. */
#if defined ( __ICCARM__ ) /*!< IAR Compiler */
#pragma data_alignment=4
#endif
__ALIGN_BEGIN volatile static uint32_t g_i2s_buffer[I2S_BUFFER_WORDS] __ALIGN_END;

/* I2S input data buffer read position. */
static uint16_t g_i2s_buffer_pos;

/* Sample counter. Stores the 0-based index of the sample that is at g_i2s_buffer_pos */
static uint32_t g_sample_counter;

/* Debug assertion variables, for use with I2S counter generator */
#ifdef DEBUG_COUNTER
uint8_t g_last_value_set;			/* Has the last value been set? */
uint8_t g_last_packed_value[3];		/* Last read padded value */
#endif


/* EXTERNAL IMPORTS */
/********************/
/* I2S2 device handle, defined in main.c */
extern I2S_HandleTypeDef hi2s2;


/* PRIVATE FUNCTIONS */
/*********************/
Controller_StatusTypeDef i2s_read_start()
{
	HAL_StatusTypeDef hal_status;

	// Disable interrupts for maximum speed
	__disable_irq();

	// Empty the I2S RX buffer
	// From the manual:
	//   Clearing the RXNE bit is performed by reading the SPIx_DR register.
	//   To switch off the I2S in reception mode, I2SE has to be cleared immediately after receiving the last RXNE = 1.
	volatile uint16_t sink;
	while (__HAL_I2S_GET_FLAG(&hi2s2, I2S_FLAG_RXNE))
		sink = hi2s2.Instance->DR;
	(void)sink;

	// Disable I2S
	__HAL_I2S_DISABLE(&hi2s2);

	// Ensure that ASTRTEN = 0, so that data will be synced to the WS frame.
	 CLEAR_BIT(hi2s2.Instance->I2SCFGR, SPI_I2SCFGR_ASTRTEN);

	// Re-enable interrupts
	__enable_irq();

	// Set up DMA. This will enable I2S as a side effect, so __HAL_I2S_ENABLE(&hi2s2) is not required.
	hal_status = HAL_I2S_Receive_DMA(&hi2s2, (uint16_t*) &g_i2s_buffer[0], I2S_BUFFER_WORDS);
	if (hal_status != HAL_OK)
	{
		DEBUG_PRINT("\r\nDMA error");
		return CONTROLLER_I2S_DMA_ERROR;
	}

#ifdef DEBUG_COUNTER
	g_last_value_set = 0;
#endif

	return CONTROLLER_OK;
}


Controller_StatusTypeDef i2s_read_stop()
{
	HAL_StatusTypeDef hal_status;

	// Stop the DMA transfer, as a side effect stopping the I2S with __HAL_I2S_DISABLE(&hi2s2);
	hal_status = HAL_I2S_DMAStop(&hi2s2);
	if (hal_status != HAL_OK)
	{
		DEBUG_PRINT("\r\nDMA ERROR");
		return CONTROLLER_I2S_DMA_ERROR;
	}

	// Clear any OVR flag
	__HAL_I2S_CLEAR_OVRFLAG(&hi2s2);

	return CONTROLLER_OK;
}


Controller_StatusTypeDef usb_flush()
{
	USBD_I2S_to_USB_Transmit(NULL, 0);		// Send USB ZLP to indicate end of data
	USBD_StatusTypeDef status = USBD_I2S_to_USB_FlushIN();
	if (status == USBD_OK)
		return CONTROLLER_OK;
	else
		return CONTROLLER_USB_ERROR;
}


uint8_t packed_value_inconsistent(const uint8_t* new_value, const uint8_t* old_value)
{
	// Constraint: new - old == 2 mod 0x400
	uint32_t old_int = (((uint32_t) old_value[0]) << 16) | (((uint32_t) old_value[1]) << 8) | (((uint32_t) old_value[2]));
	uint32_t new_int = (((uint32_t) new_value[0]) << 16) | (((uint32_t) new_value[1]) << 8) | (((uint32_t) new_value[2]));
	if ((old_int == 0x3FE && new_int != 0x000) || (old_int == 0x3FF && new_int != 0x001) || (old_int < 0x3FE && new_int - old_int != 0x002))
		return 1;	// Inconsistent
	return 0;
}


/* PUBLIC FUNCTIONS */
/********************/
Controller_StatusTypeDef controller_reset()
{
	g_state = STATE_IDLE;
	g_i2s_buffer_pos = 0;
	g_sample_counter = 0;
	return CONTROLLER_OK;
}


/* Attempt an upload of captured data to the IN bulk endpoint (0x81).
 * A nop returning CONTROLLER_OK if not data are ready for upload.
 *
 * Data format:
 * Transfer size: Up to MAX_USB_XFERSIZE=1024 bytes
 * Transfer format:
 * Byte  Interpretation
 *    0           Current state machine state
 *    1   MSB  -+ Number of samples in transmission
 *    2   LSB  -+
 *    3   MSB  -+
 *    4   ...   | Index of first sample in packet.
 *    5   ...   |
 *    6   LSB  -+
 *    7   MSB  -+
 *    8   ...   | First sample
 *    9   LSB  -+
 *    10  MSB  -+
 *    11  ...   | Second sample
 *    12  LSB  -+
 *    ... etc
 *
 * At most floor((MAX_USB_XFERSIZE-7)/3) samples can be transferred in one packet.
 * For MAX_USB_XFERSIZE = 1024, this is 339 samples.
 *
 * Transmission end is signaled by a ZLP.
 */
Controller_StatusTypeDef controller_attempt_upload()
{
	USBD_StatusTypeDef usb_status;
	uint16_t samples_available_to_xfer;
	uint16_t samples_to_xfer;
	const uint16_t max_samples_in_xfer = (MAX_USB_XFERSIZE-7)/3;

	// Check I2S state
	if (__HAL_I2S_GET_FLAG(&hi2s2, I2S_FLAG_FRE) == SET)
	{
		DEBUG_PRINT("\r\nSYNC ERR");
		i2s_read_stop();
		usb_flush();
		g_state = STATE_ERROR;
		g_error = CONTROLLER_I2S_ERROR;
	}
	else if ((g_state == STATE_ACQ10 || g_state == STATE_ACQ21 || g_state == STATE_ACQ31 || g_state == STATE_ACQ12) && __HAL_I2S_GET_FLAG(&hi2s2, I2S_FLAG_OVR) == SET)
	{
		DEBUG_PRINT("\r\nOVR ERR");
		i2s_read_stop();
		usb_flush();
		g_state = STATE_ERROR;
		g_error = CONTROLLER_I2S_OVERRUN;
	}

	if (g_state == STATE_ACQ21)
	{
		/* We're reading from the first half of g_i2s_buffer, up to
		 * but not including g_i2s_buffer[I2S_BUFFER_WORDS/2]. Each
		 * sample is two 32-bit words; we only send one of the two
		 * depending on the active channel.
		 */
		samples_available_to_xfer = (I2S_BUFFER_WORDS/2 - g_i2s_buffer_pos)/2;
	}
	else if (g_state == STATE_ACQ12)
	{
		/* We're reading from the second half of g_i2s_buffer, up to
		 * but not including g_i2s_buffer[I2S_BUFFER_WORDS]. Each
		 * sample is two 32-bit words; we only send one of the two
		 * depending on the active channel.
		 */
		samples_available_to_xfer = (I2S_BUFFER_WORDS - g_i2s_buffer_pos)/2;
	}
	else
	{
		/* If we're not in an ACQ state with data ready, there's nothing to do */
		return CONTROLLER_OK;
	}

	DEBUG_PRINT("%d", g_state);

	/* Truncate the number of samples to transfer, if it exceeds the max transfer size
	 * of 19 samples */
	if (samples_available_to_xfer > max_samples_in_xfer)
		samples_to_xfer = max_samples_in_xfer;
	else
		samples_to_xfer = samples_available_to_xfer;

	/* Fill the transmission buffer */
	uint8_t transmission_buffer[MAX_USB_XFERSIZE];
	transmission_buffer[0] = g_state;
	transmission_buffer[1] = samples_to_xfer >> 8;
	transmission_buffer[2] = samples_to_xfer & 0xFF;
	transmission_buffer[3] = g_sample_counter >> 24;
	transmission_buffer[4] = (g_sample_counter >> 16) & 0xFF;
	transmission_buffer[5] = (g_sample_counter >> 8) & 0xFF;
	transmission_buffer[6] = g_sample_counter & 0xFF;

	/* Bit pack the 32 bit data in g_i2s_buffer into 24 bits for USB upload.
	 * The g_i2s_buffer data are organised as follows:
	 *   L2 00 L0 L1 R2 00 R0 R1
	 * Where L2 is the left channel MSB, L0 is the left channel LSB, and
	 * equivalently for the right channel. 00 are always zero and can be
	 * discarded -- in fact this is required to achieve sufficient throughput --
	 * therefore the bit packing.
	 *
	 * Bit pack to the following format:
	 *   C2 C1 C0
	 *
	 * Where C is either L or R, depending on which channel is being sampled.
	 */
	uint16_t pack_sample_i;
	uint32_t unpacked_word;
	for (pack_sample_i = 0; pack_sample_i < samples_to_xfer; pack_sample_i++)
	{
		unpacked_word = g_i2s_buffer[g_i2s_buffer_pos + pack_sample_i*2 + g_channel];
		transmission_buffer[pack_sample_i*3+7] = (uint8_t) ((unpacked_word >> 0) & 0xFF);
		transmission_buffer[pack_sample_i*3+8] = (uint8_t) ((unpacked_word >> 24) & 0xFF);
		transmission_buffer[pack_sample_i*3+9] = (uint8_t) ((unpacked_word >> 16) & 0xFF);
#ifdef DEBUG_COUNTER
		if (g_last_value_set == 1 && packed_value_inconsistent(&transmission_buffer[pack_sample_i*3+7], &g_last_packed_value[0]))
		{
			// Delta assertion failure.
			DEBUG_PRINT("\r\nDELTA FAIL");
			DEBUG_PRINT("\r\n  State: %d", g_state);
			DEBUG_PRINT("\r\n  samples_to_xfer: %d", samples_to_xfer);
			DEBUG_PRINT("\r\n  g_i2s_buffer_pos: %d", g_i2s_buffer_pos);
			DEBUG_PRINT("\r\n  pack_sample_i: %d", pack_sample_i);
			DEBUG_PRINT("\r\n  Packed values: %02x%02x%02x -> %02x%02x%02x",
					g_last_packed_value[0], g_last_packed_value[1], g_last_packed_value[2],
					transmission_buffer[pack_sample_i*3+7], transmission_buffer[pack_sample_i*3+8], transmission_buffer[pack_sample_i*3+9]);
			DEBUG_PRINT("\r\n  g_i2s_buffer[%d..%d]: %08lx %08lx %08lx", g_i2s_buffer_pos-1, g_i2s_buffer_pos+1,
					g_i2s_buffer[g_i2s_buffer_pos-1+pack_sample_i*2 + g_channel],
					g_i2s_buffer[g_i2s_buffer_pos+pack_sample_i*2 + g_channel],
					g_i2s_buffer[g_i2s_buffer_pos+1+pack_sample_i*2 + g_channel]);
			DEBUG_PRINT("\r\n  packed_buffer[%d..%d]: %02x%02x%02x %02x%02x%02x", pack_sample_i*3-3, pack_sample_i*3+2,
					transmission_buffer[pack_sample_i*3+7-3], transmission_buffer[pack_sample_i*3+8-3], transmission_buffer[pack_sample_i*3+9-3],
					transmission_buffer[pack_sample_i*3+7], transmission_buffer[pack_sample_i*3+8], transmission_buffer[pack_sample_i*3+9]);
			DEBUG_PRINT("\r\n");
		}
		g_last_value_set = 1;
		g_last_packed_value[0] = transmission_buffer[pack_sample_i*3+7];
		g_last_packed_value[1] = transmission_buffer[pack_sample_i*3+8];
		g_last_packed_value[2] = transmission_buffer[pack_sample_i*3+9];
#endif
	}

	usb_status = USBD_I2S_to_USB_Transmit(&transmission_buffer[0], samples_to_xfer*3+7);
	//USBD_I2S_to_USB_Transmit(NULL, 0);
	if (usb_status == USBD_BUSY)
	{
		DEBUG_PRINT("\r\nUR2");
		return CONTROLLER_USB_BUSY;
	}
	else if (usb_status != USBD_OK)
	{
		DEBUG_PRINT("\r\nUR3");
		i2s_read_stop();
		usb_flush();
		g_state = STATE_ERROR;
		g_error = CONTROLLER_USB_ERROR;
		return CONTROLLER_USB_ERROR;
	}

	/* Update the buffer position */
	g_i2s_buffer_pos += samples_to_xfer*2;
	g_sample_counter += samples_to_xfer;

	/* Transition state if we've sent the whole half-buffer */
	if (g_state == STATE_ACQ21 && g_i2s_buffer_pos == I2S_BUFFER_WORDS/2)
	{
		g_state = STATE_ACQ31;
	}
	else if (g_state == STATE_ACQ12 && g_i2s_buffer_pos == I2S_BUFFER_WORDS)
	{
		g_state = STATE_ACQ10;
		g_i2s_buffer_pos = 0;
	}

	return CONTROLLER_OK;
}


Controller_StatusTypeDef controller_handle_usb_command(uint8_t bRequest,
		uint16_t wValue, uint16_t wIndex, uint16_t wLength, uint8_t *databuf,
		uint16_t databuf_len)
{
	/* Host to device signals to implement in this class:
	 *
	 * Signal	Command				Request data	Data packet from device follows?
	 * 0		Report status		None			Yes
	 * 1		Start acquisition	0 (left)		No
	 * 1		Start acquisition	1 (right)		No
	 * 2		Stop acquisition	None			No
	 * 3		Reset				None			No
	 *
	 * Signal is contained in the upper two bits of req->bRequest
	 * (req->bRequest & 0xC0)
	 * Request data are contained in the lower six bits of req->bRequest
	 * (req->bRequest & 0x3F)
	 */

	Controller_StatusTypeDef con_status;

	switch ((bRequest & 0xC0) >> 6)
	{
	case 0:
		/* Command: Report status.
		 * Request data: None
		 * Data packet follows: Yes (status)
		 */
		DEBUG_PRINT("P");

		/* Response data packet format: 5 bytes:
		 * Byte		Contents
		 * 0		State machine state
		 * 1		g_sample_counter, most significant byte
		 * 2		g_sample_counter
		 * 3		g_sample_counter
		 * 4		g_sample_counter, least significant byte
		 */

		/* This command requires that databuf_len be the exact size of
		 * the response (5 bytes).
		 */
		if (databuf_len != 5)
			return CONTROLLER_COMMAND_INVALID;

		/* Fill the data buffer and return */
		databuf[0] = (uint8_t) g_state;
		databuf[1] = (uint8_t) (g_sample_counter >> 24);
		databuf[2] = (uint8_t) ((g_sample_counter >> 16) & 0xFF);
		databuf[3] = (uint8_t) ((g_sample_counter >> 8) & 0xFF);
		databuf[4] = (uint8_t) (g_sample_counter & 0xFF);

		break;

	case 1:
		/* Command: Start acquisition.
		 * Request data: None
		 * Data packet follows: No
		 */
		DEBUG_PRINT("\r\nS");

		/* This command is only valid from IDLE state */
		if (g_state != STATE_IDLE)
			return CONTROLLER_COMMAND_INVALID;

		if ((bRequest & 0x3F) == 0)
			g_channel = 0;
		else if ((bRequest & 0x3F) == 1)
			g_channel = 1;
		else
			return CONTROLLER_COMMAND_INVALID;

		g_i2s_buffer_pos = 0;
		g_state = STATE_ACQ10;

		con_status = i2s_read_start();
		if (con_status != CONTROLLER_OK)
			return con_status;

		break;

	case 2:
		/* Command: Stop acquisition.
		 * Request data: None
		 * Data packet follows: No
		 */
		DEBUG_PRINT("H");

		/* This command is only valid from an ACQ state */
		if (g_state != STATE_ACQ10 && g_state != STATE_ACQ21 && g_state != STATE_ACQ31 && g_state != STATE_ACQ12)
			return CONTROLLER_COMMAND_INVALID;

		g_state = STATE_IDLE;
		con_status = i2s_read_stop();
		usb_flush();
		controller_reset();

		if (con_status != CONTROLLER_OK)
			return con_status;

		break;

	case 3:
		/* Command: Reset.
		 * Request data: None
		 * Data packet follows: No
		 */
		DEBUG_PRINT("\r\nR\r\n");

		/* This command is only valid from either IDLE or BUFOVR states */
		if (g_state != STATE_IDLE && g_state != STATE_ERROR)
			return CONTROLLER_COMMAND_INVALID;
		break;

		usb_flush();
		controller_reset();

	default:
		DEBUG_PRINT("\r\n%d Cunk%#x-%d\r\n", g_state, bRequest, (bRequest & 0xC0) >> 6)
		return CONTROLLER_COMMAND_UNKNOWN;
	}

	return CONTROLLER_OK;
}



/* INTERRUPT SERVICE ROUTINES */
/******************************/
/* These replace weak defs in stm32f7xx_hal_i2s.c */
void HAL_I2S_RxHalfCpltCallback(I2S_HandleTypeDef *hi2s)
{
	if (g_state == STATE_ACQ10)
	{
		/* The first half of the buffer is now complete and can be written to USB */
		g_state = STATE_ACQ21;
	}
	else if (g_state == STATE_ACQ12)
	{
		/* Buffer overrun */
		g_state = STATE_ERROR;
		g_error = CONTROLLER_I2S_OVERRUN;
		i2s_read_stop();
		usb_flush();
	}
}


void HAL_I2S_RxCpltCallback(I2S_HandleTypeDef *hi2s)
{
	if (g_state == STATE_ACQ31)
	{
		/* The second half of the buffer is now complete and can be written to USB */
		g_state = STATE_ACQ12;
	}
	else if (g_state == STATE_ACQ21)
	{
		/* Buffer overrun */
		g_state = STATE_ERROR;
		g_error = CONTROLLER_I2S_OVERRUN;
		i2s_read_stop();
		usb_flush();
	}
}


void HAL_I2S_ErrorCallback(I2S_HandleTypeDef *hi2s)
{
/*
 *
Clearing the OVR bit is done by a read operation on the SPIx_DR register followed by a
read access to the SPIx_SR register.

Frame error flag (FRE)
This flag can be set by hardware only if the I2S is configured in Slave mode. It is set if the
external master is changing the WS line while the slave is not expecting this change. If the
synchronization is lost, the following steps are required to recover from this state and
resynchronize the external master device with the I2S slave device:
1. Disable the I2S.
2. Re-enable the I2S interface again (Keeping ASTRTEN=0).
Desynchronization between master and slave devices may be due to noisy environment on
the CK communication clock or on the WS frame synchronization line. An error interrupt can
be generated if the ERRIE bit is set. The desynchronization flag (FRE) is cleared by
software when the status register is read.

 *
 */
	DEBUG_PRINT("\r\nISR: ERROR");
	if (__HAL_I2S_GET_FLAG(&hi2s2, I2S_FLAG_FRE) == SET)
	{
		DEBUG_PRINT("\r\n  SYNC ERR");
		g_state = STATE_ERROR;
		g_error = CONTROLLER_I2S_ERROR;
		i2s_read_stop();
		usb_flush();
	}
	else if (__HAL_I2S_GET_FLAG(&hi2s2, I2S_FLAG_OVR) == SET)
	{
		DEBUG_PRINT("\r\n  OVR ERR");
		g_state = STATE_ERROR;
		g_error = CONTROLLER_I2S_OVERRUN;
		i2s_read_stop();
		usb_flush();
	}
	if (g_state == STATE_ACQ10 || g_state == STATE_ACQ21 || g_state == STATE_ACQ31 || g_state == STATE_ACQ12)
	{
		DEBUG_PRINT("\r\n  ACQ HALTED");
		g_state = STATE_ERROR;
		g_error = CONTROLLER_I2S_ERROR;
		i2s_read_stop();
		usb_flush();
	}
}
