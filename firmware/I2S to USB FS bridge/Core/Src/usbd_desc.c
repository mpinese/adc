/**
  ******************************************************************************
  * @file    usbd_desc_template.c
  * @author  MCD Application Team
  * @brief   This file provides the USBD descriptors and string formatting method.
  *          This template should be copied to the user folder,
  *          renamed and customized following user needs.
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

/* Includes ------------------------------------------------------------------*/
#include "usbd_core.h"
#include "usbd_desc.h"
#include "usbd_conf.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define USBD_VID                      0x1209
#define USBD_PID                      0x9e87
//#define USBD_VID                      0x0483
//#define USBD_PID                      0x002A
#define USBD_LANGID_STRING            0x0409  /* English (United States) */
#define USBD_MANUFACTURER_STRING      "Mark Pinese"
#define USBD_PRODUCT_FS_STRING        "I2S to USB FS bridge"
#define USBD_CONFIGURATION_FS_STRING  "I2S to USB FS bridge Config"
#define USBD_INTERFACE_FS_STRING      "I2S to USB FS bridge Interface"
#define USBD_PRODUCT_HS_STRING        "I2S to USB HS bridge"
#define USBD_CONFIGURATION_HS_STRING  "I2S to USB HS bridge Config"
#define USBD_INTERFACE_HS_STRING      "I2S to USB HS bridge Interface"

/* Private macro -------------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
uint8_t *USBD_Class_DeviceDescriptor(USBD_SpeedTypeDef speed, uint16_t *length);
uint8_t *USBD_Class_LangIDStrDescriptor(USBD_SpeedTypeDef speed, uint16_t *length);
uint8_t *USBD_Class_ManufacturerStrDescriptor(USBD_SpeedTypeDef speed, uint16_t *length);
uint8_t *USBD_Class_ProductStrDescriptor(USBD_SpeedTypeDef speed, uint16_t *length);
uint8_t *USBD_Class_SerialStrDescriptor(USBD_SpeedTypeDef speed, uint16_t *length);
uint8_t *USBD_Class_ConfigStrDescriptor(USBD_SpeedTypeDef speed, uint16_t *length);
uint8_t *USBD_Class_InterfaceStrDescriptor(USBD_SpeedTypeDef speed, uint16_t *length);

/* Private variables ---------------------------------------------------------*/
USBD_DescriptorsTypeDef I2S_to_USB_Desc =
{
  USBD_Class_DeviceDescriptor,
  USBD_Class_LangIDStrDescriptor,
  USBD_Class_ManufacturerStrDescriptor,
  USBD_Class_ProductStrDescriptor,
  USBD_Class_SerialStrDescriptor,
  USBD_Class_ConfigStrDescriptor,
  USBD_Class_InterfaceStrDescriptor
};

/* USB Standard Device Descriptor */
#if defined ( __ICCARM__ ) /*!< IAR Compiler */
#pragma data_alignment=4
#endif
__ALIGN_BEGIN uint8_t USBD_DeviceDesc[USB_LEN_DEV_DESC] __ALIGN_END =
{
  USB_LEN_DEV_DESC,         /* bLength */
  USB_DESC_TYPE_DEVICE, 	/* bDescriptorType: Device */
  0x00,                     /* bcdUSB */
  0x02,
  0x00,                     /* bDeviceClass */
  0x00,                     /* bDeviceSubClass */
  0x00,                     /* bDeviceProtocol */
  USB_MAX_EP0_SIZE,         /* bMaxPacketSize */
  LOBYTE(USBD_VID),         /* idVendor */
  HIBYTE(USBD_VID),         /* idVendor */
  LOBYTE(USBD_PID),         /* idVendor */
  HIBYTE(USBD_PID),         /* idVendor */
  0x00,                     /* bcdDevice rel. 2.00 */
  0x02,
  USBD_IDX_MFC_STR,         /* Index of manufacturer string */
  USBD_IDX_PRODUCT_STR,     /* Index of product string */
  USBD_IDX_SERIAL_STR,      /* Index of serial number string */
  USBD_MAX_NUM_CONFIGURATION/* bNumConfigurations */
}; /* USB_DeviceDescriptor */


/* USB Standard Device Descriptor */
#if defined ( __ICCARM__ ) /*!< IAR Compiler */
#pragma data_alignment=4
#endif
__ALIGN_BEGIN uint8_t USBD_LangIDDesc[USB_LEN_LANGID_STR_DESC] __ALIGN_END =
{
  USB_LEN_LANGID_STR_DESC,
  USB_DESC_TYPE_STRING,
  LOBYTE(USBD_LANGID_STRING),
  HIBYTE(USBD_LANGID_STRING),
};

#if defined ( __ICCARM__ ) /*!< IAR Compiler */
#pragma data_alignment=4
#endif
__ALIGN_BEGIN uint8_t USBD_StringSerial[USB_SIZ_STRING_SERIAL] =
{
  USB_SIZ_STRING_SERIAL,
  USB_DESC_TYPE_STRING,
};

#if defined ( __ICCARM__ ) /*!< IAR Compiler */
#pragma data_alignment=4
#endif
__ALIGN_BEGIN uint8_t USBD_StrDesc[USBD_MAX_STR_DESC_SIZ] __ALIGN_END;

/* Private functions ---------------------------------------------------------*/
static void IntToUnicode(uint32_t value, uint8_t *pbuf, uint8_t len);
static void Get_SerialNum(void);

/**
  * @brief  Returns the device descriptor.
  * @param  speed: Current device speed
  * @param  length: Pointer to data length variable
  * @retval Pointer to descriptor buffer
  */
uint8_t *USBD_Class_DeviceDescriptor(USBD_SpeedTypeDef speed, uint16_t *length)
{
  *length = sizeof(USBD_DeviceDesc);
  return (uint8_t *)USBD_DeviceDesc;
}

/**
  * @brief  Returns the LangID string descriptor.
  * @param  speed: Current device speed
  * @param  length: Pointer to data length variable
  * @retval Pointer to descriptor buffer
  */
uint8_t *USBD_Class_LangIDStrDescriptor(USBD_SpeedTypeDef speed, uint16_t *length)
{
  *length = sizeof(USBD_LangIDDesc);
  return (uint8_t *)USBD_LangIDDesc;
}

/**
  * @brief  Returns the product string descriptor.
  * @param  speed: Current device speed
  * @param  length: Pointer to data length variable
  * @retval Pointer to descriptor buffer
  */
uint8_t *USBD_Class_ProductStrDescriptor(USBD_SpeedTypeDef speed, uint16_t *length)
{
  USBD_GetString((uint8_t *)USBD_PRODUCT_FS_STRING, USBD_StrDesc, length);
  return USBD_StrDesc;
}

/**
  * @brief  Returns the manufacturer string descriptor.
  * @param  speed: Current device speed
  * @param  length: Pointer to data length variable
  * @retval Pointer to descriptor buffer
  */
uint8_t *USBD_Class_ManufacturerStrDescriptor(USBD_SpeedTypeDef speed, uint16_t *length)
{
  USBD_GetString((uint8_t *)USBD_MANUFACTURER_STRING, USBD_StrDesc, length);
  return USBD_StrDesc;
}

/**
  * @brief  Returns the serial number string descriptor.
  * @param  speed: Current device speed
  * @param  length: Pointer to data length variable
  * @retval Pointer to descriptor buffer
  */
uint8_t *USBD_Class_SerialStrDescriptor(USBD_SpeedTypeDef speed, uint16_t *length)
{
  *length = USB_SIZ_STRING_SERIAL;

  /* Update the serial number string descriptor with the data from the unique ID*/
  Get_SerialNum();

  return (uint8_t *)USBD_StringSerial;
}

/**
  * @brief  Returns the configuration string descriptor.
  * @param  speed: Current device speed
  * @param  length: Pointer to data length variable
  * @retval Pointer to descriptor buffer
  */
uint8_t *USBD_Class_ConfigStrDescriptor(USBD_SpeedTypeDef speed, uint16_t *length)
{
  USBD_GetString((uint8_t *)USBD_CONFIGURATION_FS_STRING, USBD_StrDesc, length);
  return USBD_StrDesc;
}

/**
  * @brief  Returns the interface string descriptor.
  * @param  speed: Current device speed
  * @param  length: Pointer to data length variable
  * @retval Pointer to descriptor buffer
  */
uint8_t *USBD_Class_InterfaceStrDescriptor(USBD_SpeedTypeDef speed, uint16_t *length)
{
  USBD_GetString((uint8_t *)USBD_INTERFACE_FS_STRING, USBD_StrDesc, length);
  return USBD_StrDesc;
}

/**
  * @brief  Create the serial number string descriptor
  * @param  None
  * @retval None
  */
static void Get_SerialNum(void)
{
  uint32_t deviceserial0, deviceserial1, deviceserial2;

  deviceserial0 = *(uint32_t *)DEVICE_ID1;
  deviceserial1 = *(uint32_t *)DEVICE_ID2;
  deviceserial2 = *(uint32_t *)DEVICE_ID3;

  deviceserial0 += deviceserial2;

  if (deviceserial0 != 0U)
  {
    IntToUnicode(deviceserial0, &USBD_StringSerial[2], 8U);
    IntToUnicode(deviceserial1, &USBD_StringSerial[18], 4U);
  }
}


#if ((USBD_LPM_ENABLED == 1) || (USBD_CLASS_BOS_ENABLED == 1))
/**
  * @brief  USBD_USR_BOSDescriptor
  *         return the BOS descriptor
  * @param  speed : current device speed
  * @param  length : pointer to data length variable
  * @retval pointer to descriptor buffer
  */
uint8_t *USBD_USR_BOSDescriptor(USBD_SpeedTypeDef speed , uint16_t *length)
{
  *length = sizeof(USBD_BOSDesc);
  return (uint8_t*)USBD_BOSDesc;
}
#endif


#if (USBD_CLASS_USER_STRING_DESC == 1)
/**
  * @brief  Returns the Class User string descriptor.
  * @param  speed: Current device speed
  * @param  idx: index of string descriptor
  * @param  length: Pointer to data length variable
  * @retval Pointer to descriptor buffer
  */
uint8_t *USBD_Class_UserStrDescriptor(USBD_SpeedTypeDef speed, uint8_t idx, uint16_t *length)
{
  static uint8_t USBD_StrDesc[255];

  return USBD_StrDesc;
}
#endif


/**
  * @brief  Convert Hex 32Bits value into char
  * @param  value: value to convert
  * @param  pbuf: pointer to the buffer
  * @param  len: buffer length
  * @retval None
  */
static void IntToUnicode(uint32_t value, uint8_t *pbuf, uint8_t len)
{
  uint8_t idx = 0U;

  for (idx = 0U ; idx < len ; idx ++)
  {
    if (((value >> 28)) < 0xAU)
    {
      pbuf[ 2U * idx] = (value >> 28) + '0';
    }
    else
    {
      pbuf[2U * idx] = (value >> 28) + 'A' - 10U;
    }

    value = value << 4;

    pbuf[2U * idx + 1] = 0U;
  }
}

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
