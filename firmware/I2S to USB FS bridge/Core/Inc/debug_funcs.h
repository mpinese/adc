/*
 * debug.h
 *
 *  Created on: Oct 1, 2020
 *      Author: Mark
 */

#ifndef INC_DEBUG_FUNCS_H_
#define INC_DEBUG_FUNCS_H_

/* CONVENIENCE MACROS */
/**********************/
#ifdef DEBUG
#include <stdio.h>
#include <string.h>
char __debug_print_buf[256];
extern UART_HandleTypeDef huart2;
#define DEBUG_PRINT(...) { sprintf(&__debug_print_buf[0], __VA_ARGS__); HAL_UART_Transmit(&huart2, (uint8_t*) &__debug_print_buf[0], strlen(__debug_print_buf), 1000); }
#else
#define DEBUG_PRINT(...)
#endif


#endif /* INC_DEBUG_FUNCS_H_ */
