/**
  ******************************************************************************
  * @file    usbd_I2S_to_USB_core.h
  * @author  MCD Application Team
  * @brief   Header file for the usbd_I2S_to_USB_core.c file.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2015 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under Ultimate Liberty license
  * SLA0044, the "License"; You may not use this file except in compliance with
  * the License. You may obtain a copy of the License at:
  *                      www.st.com/SLA0044
  *
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __USB_I2S_to_USB_CORE_H
#define __USB_I2S_to_USB_CORE_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include  "usbd_ioreq.h"

/** @addtogroup STM32_USB_DEVICE_LIBRARY
  * @{
  */

/** @defgroup USBD_TEMPLATE
  * @brief This file is the header file for usbd_I2S_to_USB_core.c
  * @{
  */


/** @defgroup USBD_I2S_to_USB_Exported_Defines
  * @{
  */
#define I2S_TO_USB_EPIN_ADDR                 0x81U	/* 10000001 (input #1) */
#define I2S_TO_USB_EPOUT_ADDR                0x01U  /* 00000001 (output #1) */

#define I2S_TO_USB_CONFIG_DESC_SIZ       (USB_LEN_CFG_DESC+USB_LEN_IF_DESC+USB_LEN_EP_DESC+USB_LEN_EP_DESC)

/**
  * @}
  */


/** @defgroup USBD_CORE_Exported_TypesDefinitions
  * @{
  */

/**
  * @}
  */



/** @defgroup USBD_CORE_Exported_Macros
  * @{
  */

/**
  * @}
  */

/** @defgroup USBD_CORE_Exported_Variables
  * @{
  */

extern USBD_ClassTypeDef USBD_I2S_to_USB_ClassDriver;
/**
  * @}
  */

/** @defgroup USB_CORE_Exported_Functions
  * @{
  */
USBD_StatusTypeDef USBD_I2S_to_USB_Transmit(uint8_t* buf, uint16_t length);
USBD_StatusTypeDef USBD_I2S_to_USB_ClearINStall();

/**
  * @}
  */

#ifdef __cplusplus
}
#endif

#endif  /* __USB_I2S_to_USB_CORE_H */
/**
  * @}
  */

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
