/*
 * i2s_to_usb_controller.c
 *
 *  Created on: 15 Sep 2020
 *      Author: Mark
 */

#include "i2s_to_usb_controller.h"
#include "usbd_i2s_to_usb.h"

#include "debug_funcs.h"


/* GLOBALS */
/***********/
/* State machine state */
volatile static Controller_State g_state;

/* Acquisition channel. 0 => left, 1 => right */
static uint8_t g_channel;

/* I2S input data buffer. */
#if defined ( __ICCARM__ ) /*!< IAR Compiler */
#pragma data_alignment=4
#endif
__ALIGN_BEGIN static uint32_t g_i2s_buffer[I2S_BUFFER_WORDS] __ALIGN_END;

/* I2S input data buffer read position. */
static uint16_t g_i2s_buffer_pos;

/* Sample counter. Stores the 0-based index of the sample that is at g_i2s_buffer_pos */
static uint32_t g_sample_counter;


/* EXTERNAL IMPORTS */
/********************/
/* I2S2 device handle, defined in main.c */
extern I2S_HandleTypeDef hi2s2;

static uint32_t idle_counter;
static Controller_State last_state;


/* PUBLIC FUNCTIONS */
/********************/
Controller_StatusTypeDef controller_reset()
{
	DEBUG_PRINT("\r\n *>0");
	g_state = STATE_IDLE;
	g_i2s_buffer_pos = 0;
	g_sample_counter = 0;
	USBD_I2S_to_USB_ClearINStall();
	last_state = STATE_IDLE;
	return CONTROLLER_OK;
}

Controller_StatusTypeDef controller_attempt_upload()
{
	USBD_StatusTypeDef usb_status;
	uint16_t samples_to_xfer;
	uint8_t last_xfer = 0;


	if (	(last_state != g_state) && (
			(last_state == STATE_ACQ10 && g_state != STATE_ACQ21) ||
			(last_state == STATE_ACQ21 && g_state != STATE_ACQ31) ||
			(last_state == STATE_ACQ31 && g_state != STATE_ACQ12) ||
			(last_state == STATE_ACQ12 && g_state != STATE_ACQ10)))
	{
		DEBUG_PRINT("\r\nINVALID TRANSITION: %d -> %d", last_state, g_state);
		HAL_Delay(10000);
	}
	last_state = g_state;

	if (g_state == STATE_ACQ21)
	{
		/* We're reading from the first half of g_i2s_buffer, up to
		 * but not including g_i2s_buffer[I2S_BUFFER_WORDS/2].
		 */
		samples_to_xfer = (I2S_BUFFER_WORDS/2 - g_i2s_buffer_pos)/2;
	}
	else if (g_state == STATE_ACQ12)
	{
		/* We're reading from the second half of g_i2s_buffer, up to
		 * but not including g_i2s_buffer[I2S_BUFFER_WORDS].
		 */
		samples_to_xfer = (I2S_BUFFER_WORDS - g_i2s_buffer_pos)/2;
	}
	else
	{
		/* If we're not in an ACQ state with data ready, there's nothing to do */
		idle_counter++;
		return CONTROLLER_OK;
	}
	DEBUG_PRINT("\r\nUE");
	idle_counter = 0;

//	DEBUG_PRINT("\r\n%lu\t%d\t%u\t%u\t%lu", HAL_GetTick(), g_state, g_i2s_buffer_pos, samples_to_xfer, g_sample_counter);

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
	uint8_t packed_buffer[MAX_USB_XFERSIZE];

	/* Truncate the number of samples to transfer, if it exceeds the max transfer size */
	if (samples_to_xfer > MAX_USB_XFERSIZE/3)
		samples_to_xfer = MAX_USB_XFERSIZE/3;
	else
		last_xfer = 1;

	/* Perform the bit packing */
	uint16_t pack_sample_i;
	union {
		uint32_t word;
		uint8_t bytes[4];
	} unpacked;
	for (pack_sample_i = 0; pack_sample_i < samples_to_xfer; pack_sample_i++)
	{
		unpacked.word = g_i2s_buffer[g_i2s_buffer_pos + pack_sample_i*2 + g_channel];
		packed_buffer[pack_sample_i*3] = unpacked.bytes[0];
		packed_buffer[pack_sample_i*3+1] = unpacked.bytes[3];
		packed_buffer[pack_sample_i*3+2] = unpacked.bytes[2];
	}

	usb_status = USBD_I2S_to_USB_Transmit((uint8_t*) &packed_buffer[0], samples_to_xfer*3);
	DEBUG_PRINT("\r\n XMIT %d", samples_to_xfer*3);
	if (usb_status == USBD_BUSY)
	{
		DEBUG_PRINT("\r\nUR2");
		return CONTROLLER_USB_BUSY;
	}
	else if (usb_status != USBD_OK)
	{
		DEBUG_PRINT("\r\nUR3");
		return CONTROLLER_USB_ERROR;
	}

	/* Update the buffer position */
	g_i2s_buffer_pos += samples_to_xfer*2;
	g_sample_counter += samples_to_xfer;

	if (last_xfer == 1)
	{
		/* Send a ZLP to flag that the xfer is done for now */
		usb_status = USBD_I2S_to_USB_Transmit(NULL, 0);
		if (usb_status == USBD_BUSY)
		{
			DEBUG_PRINT("\r\nUR4");
			return CONTROLLER_USB_BUSY;
		}
		else if (usb_status != USBD_OK)
		{
			DEBUG_PRINT("\r\nUR5");
			return CONTROLLER_USB_ERROR;
		}

		if (g_state == STATE_ACQ21)
		{
			DEBUG_PRINT("\r\n 2>3");
			g_state = STATE_ACQ31;
		}
		else /* STATE_ACQ12 */
		{
			DEBUG_PRINT("\r\n 4>1");
			g_state = STATE_ACQ10;
			g_i2s_buffer_pos = 0;
		}
	}

	DEBUG_PRINT("\r\nUR0");
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

	HAL_StatusTypeDef hal_status;

	switch ((bRequest & 0xC0) >> 6)
	{
	case 0:
		/* Command: Report status.
		 * Request data: None
		 * Data packet follows: Yes (status)
		 */
		DEBUG_PRINT("\r\n%d Csta", g_state);

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
		DEBUG_PRINT("\r\n%d Csaq", g_state);

		/* This command is only valid from IDLE state */
		if (g_state != STATE_IDLE)
			return CONTROLLER_COMMAND_INVALID;

		/* Steps:
		 * 1. Set up circular DMA request from I2S to g_i2s_buffer, with half and full interrupts
		 *    implicitly defined by the defs of HAL_I2S_RxHalfCpltCallback and HAL_I2S_RxCpltCallback
		 *    above.
		 * 2. Set state to STATE_ACQ10
		 */
		__HAL_I2S_CLEAR_OVRFLAG(&hi2s2);
		g_i2s_buffer_pos = 0;
		if ((bRequest & 0x3F) == 0)
			g_channel = 0;
		else if ((bRequest & 0x3F) == 1)
			g_channel = 1;
		else
			return CONTROLLER_COMMAND_INVALID;

		DEBUG_PRINT("\r\n Channel %d", g_channel);

		hal_status = HAL_I2S_Receive_DMA(&hi2s2, (uint16_t*) &g_i2s_buffer[0], I2S_BUFFER_WORDS);
		if (hal_status != HAL_OK)
		{
			DEBUG_PRINT("\r\nDMA error");
			return CONTROLLER_I2S_DMA_ERROR;
		}

		DEBUG_PRINT("\r\n 0>1");
		g_state = STATE_ACQ10;

		break;

	case 2:
		/* Command: Stop acquisition.
		 * Request data: None
		 * Data packet follows: No
		 */
		DEBUG_PRINT("\r\n%d Chaq", g_state);

		/* This command is only valid from an ACQ state */
		if (g_state != STATE_ACQ10 && g_state != STATE_ACQ21 && g_state != STATE_ACQ31 && g_state != STATE_ACQ12)
			return CONTROLLER_COMMAND_INVALID;

		/* Steps:
		 * 1. Stop DMA.
		 * 2. Send ZLP.
		 * 3. Reset.
		 */
		controller_reset();
		USBD_I2S_to_USB_Transmit(NULL, 0);
		hal_status = HAL_I2S_DMAStop(&hi2s2);
		if (hal_status != HAL_OK)
		{
			DEBUG_PRINT("\r\nDMA ERROR");
			return CONTROLLER_I2S_DMA_ERROR;
		}
		/* TODO: Currently does NOT reset properly and subsequent acqs fail */

		break;

	case 3:
		/* Command: Reset.
		 * Request data: None
		 * Data packet follows: No
		 */
		DEBUG_PRINT("\r\n%d Crst", g_state);

		/* This command is only valid from either IDLE or BUFOVR states */
		if (g_state != STATE_IDLE && g_state != STATE_OVERRUN)
			return CONTROLLER_COMMAND_INVALID;
		break;
		controller_reset();

	default:
		DEBUG_PRINT("\r\n%d Cunk%#x-%d ", g_state, bRequest, (bRequest & 0xC0) >> 6)
		return CONTROLLER_COMMAND_UNKNOWN;
	}

	return CONTROLLER_OK;
}



/* INTERRUPT SERVICE ROUTINES */
/******************************/
/* These replace weak defs in stm32f7xx_hal_i2s.c */
void HAL_I2S_RxHalfCpltCallback(I2S_HandleTypeDef *hi2s)
{
	DEBUG_PRINT("\r\nHE");
	if (g_state == STATE_ACQ10)
	{
		/* The first half of the buffer is now complete and can be written to USB */
		g_state = STATE_ACQ21;
		DEBUG_PRINT(" idle 1:%lu\r\n 1>2", idle_counter);
	}
	else if (g_state == STATE_ACQ12)
	{
		/* Buffer overrun */
		g_state = STATE_OVERRUN;
		HAL_I2S_DMAStop(hi2s);
		DEBUG_PRINT("\r\n 4>5");
	}
	DEBUG_PRINT("\r\nHR0");
}


void HAL_I2S_RxCpltCallback(I2S_HandleTypeDef *hi2s)
{
	DEBUG_PRINT("\r\nFE");
	if (g_state == STATE_ACQ31)
	{
		/* The second half of the buffer is now complete and can be written to USB */
		g_state = STATE_ACQ12;
		DEBUG_PRINT(" idle 3:%lu\r\n 3>4", idle_counter);
	}
	else if (g_state == STATE_ACQ21)
	{
		/* Buffer overrun */
		g_state = STATE_OVERRUN;
		HAL_I2S_DMAStop(hi2s);
		DEBUG_PRINT("\r\n 2>5");
	}
	DEBUG_PRINT("\r\nFR0");
}


void HAL_I2S_ErrorCallback(I2S_HandleTypeDef *hi2s)
{
/*	uint32_t errcode;
	errcode = HAL_I2S_GetError(hi2s);*/
	DEBUG_PRINT("\r\nEE");
	if (g_state == STATE_ACQ10 || g_state == STATE_ACQ21 || g_state == STATE_ACQ31 || g_state == STATE_ACQ12)
	{
		HAL_I2S_DMAStop(hi2s);
		DEBUG_PRINT("\r\n *>5");
		g_state = STATE_OVERRUN;
	}
	DEBUG_PRINT("\r\nER0");
}
