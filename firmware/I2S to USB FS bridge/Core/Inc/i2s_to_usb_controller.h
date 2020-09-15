/*
 * i2s_to_usb_controller.h
 *
 *  Created on: 15 Sep 2020
 *      Author: Mark
 */

#ifndef INC_I2S_TO_USB_CONTROLLER_H_
#define INC_I2S_TO_USB_CONTROLLER_H_

#include "stm32f7xx_hal.h"

#define I2S_BUFFER_WORDS	(192*1024/4)

typedef enum
{
	CONTROLLER_OK 				= 0x00U,
	CONTROLLER_UNKNOWN_COMMAND	= 0x01U,
	CONTROLLER_INVALID_COMMAND	= 0x02U
} Controller_StatusTypeDef;



/* STATE MACHINE
 *
 * STATES
 * State	Name		Description
 * 0		Idle		Waiting for command
 * 1		ACQ10		Acquisition, buffer state is FILLING/UNDEF
 * 2		ACQ21		Acquisition, buffer state is FULL-SENDING/FILLING
 * 3		ACQ31		Acquisition, buffer state is FULL-SENT/FILLING
 * 4		ACQ12		Acquisition, buffer state is FILLING/FULL-SENDING
 * 5		BUFOVR		Buffer overrun
 *
 * TRANSITIONS
 * Source	Dest		Condition														Location
 * 0-Idle	1-ACQ10		USB command: start acquisition									controller_handle_usb_command
 * 1-ACQ10	2-ACQ21		Interrupt: DMA half full
 * 2-ACQ21	3-ACQ31		g_i2s_buffer_pos = I2S_BUFFER_WORDS*4 / 2
 * 3-ACQ31	4-ACQ12		Interrupt: DMA full
 * 4-ACQ12	1-ACQ10		g_i2s_buffer_pos = 0 (rolled over from I2S_BUFFER_WORDS*4)
 * 1-ACQ10	0-Idle		USB command: stop acquisition									controller_handle_usb_command
 * 2-ACQ21	0-Idle		USB command: stop acquisition									controller_handle_usb_command
 * 3-ACQ31	0-Idle		USB command: stop acquisition									controller_handle_usb_command
 * 4-ACQ12	0-Idle		USB command: stop acquisition									controller_handle_usb_command
 * 2-ACQ21	5-BUFOVR	Interrupt: DMA full
 * 4-ACQ12	5-BUFOVR	Interrupt: DMA half full
 * 0-Idle	0-Idle		USB command: reset												controller_handle_usb_command
 * 5-BUFOVR	0-Idle		USB command: reset												controller_handle_usb_command
 */
typedef enum
{
	STATE_IDLE 		= 0x00U,
	STATE_ACQ10 	= 0x01U,
	STATE_ACQ21 	= 0x02U,
	STATE_ACQ31 	= 0x03U,
	STATE_ACQ12 	= 0x04U,
	STATE_BUFOVR 	= 0x05U
} Controller_State;

Controller_StatusTypeDef controller_reset();
Controller_StatusTypeDef controller_handle_usb_command(uint8_t bRequest,
		uint16_t wValue, uint16_t wIndex, uint16_t wLength, uint8_t *databuf,
		uint16_t databuf_len);

#endif /* INC_I2S_TO_USB_CONTROLLER_H_ */
