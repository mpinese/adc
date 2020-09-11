/**
  ******************************************************************************
  * @file    usbd_template.c
  * @author  MCD Application Team
  * @brief   This file provides the HID core functions.
  *
  * @verbatim
  *
  *          ===================================================================
  *                                TEMPLATE Class  Description
  *          ===================================================================
  *
  *
  *
  *
  *
  *
  * @note     In HS mode and when the DMA is used, all variables and data structures
  *           dealing with the DMA during the transaction process should be 32-bit aligned.
  *
  *
  *  @endverbatim
  *
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
#include "usbd_i2s_to_usb.h"
#include "usbd_ctlreq.h"


/** @addtogroup STM32_USB_DEVICE_LIBRARY
  * @{
  */


/** @defgroup USBD_TEMPLATE
  * @brief usbd core module
  * @{
  */

/** @defgroup USBD_I2S_to_USB_Private_TypesDefinitions
  * @{
  */
/**
  * @}
  */


/** @defgroup USBD_I2S_to_USB_Private_Defines
  * @{
  */

/**
  * @}
  */


/** @defgroup USBD_I2S_to_USB_Private_Macros
  * @{
  */

/**
  * @}
  */




/** @defgroup USBD_I2S_to_USB_Private_FunctionPrototypes
  * @{
  */


static uint8_t USBD_I2S_to_USB_Init(USBD_HandleTypeDef *pdev, uint8_t cfgidx);
static uint8_t USBD_I2S_to_USB_DeInit(USBD_HandleTypeDef *pdev, uint8_t cfgidx);
static uint8_t USBD_I2S_to_USB_Setup(USBD_HandleTypeDef *pdev, USBD_SetupReqTypedef *req);
static uint8_t USBD_I2S_to_USB_DataIn(USBD_HandleTypeDef *pdev, uint8_t epnum);
static uint8_t USBD_I2S_to_USB_DataOut(USBD_HandleTypeDef *pdev, uint8_t epnum);
static uint8_t USBD_I2S_to_USB_EP0_RxReady(USBD_HandleTypeDef *pdev);
static uint8_t USBD_I2S_to_USB_EP0_TxReady(USBD_HandleTypeDef *pdev);
static uint8_t USBD_I2S_to_USB_SOF(USBD_HandleTypeDef *pdev);
static uint8_t USBD_I2S_to_USB_IsoINIncomplete(USBD_HandleTypeDef *pdev, uint8_t epnum);
static uint8_t USBD_I2S_to_USB_IsoOutIncomplete(USBD_HandleTypeDef *pdev, uint8_t epnum);

static uint8_t *USBD_I2S_to_USB_GetCfgDesc(uint16_t *length);
static uint8_t *USBD_I2S_to_USB_GetDeviceQualifierDesc(uint16_t *length);
/**
  * @}
  */

/** @defgroup USBD_I2S_to_USB_Private_Variables
  * @{
  */

USBD_ClassTypeDef USBD_I2S_to_USB_ClassDriver =
{
  USBD_I2S_to_USB_Init,
  USBD_I2S_to_USB_DeInit,
  USBD_I2S_to_USB_Setup,
  USBD_I2S_to_USB_EP0_TxReady,
  USBD_I2S_to_USB_EP0_RxReady,
  USBD_I2S_to_USB_DataIn,
  USBD_I2S_to_USB_DataOut,
  USBD_I2S_to_USB_SOF,
  USBD_I2S_to_USB_IsoINIncomplete,
  USBD_I2S_to_USB_IsoOutIncomplete,
  USBD_I2S_to_USB_GetCfgDesc,
  USBD_I2S_to_USB_GetCfgDesc,
  USBD_I2S_to_USB_GetCfgDesc,
  USBD_I2S_to_USB_GetDeviceQualifierDesc,
};
//
//USBD_ClassTypeDef USBD_I2S_to_USB_ClassDriver =
//{
//  USBD_I2S_to_USB_Init,
//  USBD_I2S_to_USB_DeInit,
//  NULL,
//  NULL,
//  NULL,
//  USBD_I2S_to_USB_DataIn,
//  USBD_I2S_to_USB_DataOut,
//  NULL,
//  NULL,
//  NULL,
//  NULL,
//  USBD_I2S_to_USB_GetCfgDesc,
//  NULL,
//  USBD_I2S_to_USB_GetDeviceQualifierDesc,
//};

#if defined ( __ICCARM__ ) /*!< IAR Compiler */
#pragma data_alignment=4
#endif
/* USB TEMPLATE device Configuration Descriptor */
__ALIGN_BEGIN static uint8_t USBD_I2S_to_USB_CfgDesc[I2S_TO_USB_CONFIG_DESC_SIZ] __ALIGN_END =
{
  USB_LEN_CFG_DESC, 			/* bLength: Configuration Descriptor size */
  USB_DESC_TYPE_CONFIGURATION, 	/* bDescriptorType: Configuration */
  I2S_TO_USB_CONFIG_DESC_SIZ,	/* wTotalLength: Bytes returned */
  0x00,
  0x01,         /* bNumInterfaces: 1 interface*/
  0x01,         /* bConfigurationValue: Configuration value*/
  0x00,			/* iConfiguration: Index of string descriptor describing the configuration*/
  0xC0,         /* bmAttributes: self-powered */
//  0x00,         /* MaxPower 0 mA (self-powered) */
  0x32,         /* MaxPower 100 mA */
  /* 09d */

  /* Interface 0 */
  USB_LEN_IF_DESC,         /* bLength */
  USB_DESC_TYPE_INTERFACE,  		/* bDescriptorType: Interface */
  0x01,         /* bInterfaceNumber */
  0x00,         /* bAlternateSetting */
  0x02,         /* bNumEndpoints */
  0x0A,         /* bInterfaceClass: CDC data*/
  0x00,         /* bInterfaceSubClass */
  0x00,         /* bInterfaceProtocol */
  0x00,         /* iInterface */
  /* 18d */

  /* (Endpoint 0 is implicitly defined) */

  /* Endpoint OUT */
  USB_LEN_EP_DESC,                  /* bLength */
  USB_DESC_TYPE_ENDPOINT,          	/* bDescriptorType: Endpoint */
  I2S_TO_USB_EPOUT_ADDR,           	/* bEndpointAddress */
  0x02,                            	/* bmAttributes: bulk transfer type */
  LOBYTE(USB_FS_MAX_PACKET_SIZE),  	/* wMaxPacketSize */
  HIBYTE(USB_FS_MAX_PACKET_SIZE),
  0x00,                           	/* bInterval */
  /* 25d */

  /* Endpoint IN */
  USB_LEN_EP_DESC,                  /* bLength */
  USB_DESC_TYPE_ENDPOINT,          	/* bDescriptorType: Endpoint */
  I2S_TO_USB_EPIN_ADDR,             /* bEndpointAddress */
  0x02,                             /* bmAttributes: bulk transfer type */
  LOBYTE(USB_FS_MAX_PACKET_SIZE),   /* wMaxPacketSize */
  HIBYTE(USB_FS_MAX_PACKET_SIZE),
  0x00                           	/* bInterval */
  /* 32d <-- TOTAL DESCRIPTOR SIZE */
};

#if defined ( __ICCARM__ ) /*!< IAR Compiler */
#pragma data_alignment=4
#endif
/* USB Standard Device Descriptor */
__ALIGN_BEGIN static uint8_t USBD_I2S_to_USB_DeviceQualifierDesc[USB_LEN_DEV_QUALIFIER_DESC] __ALIGN_END =
{
  USB_LEN_DEV_QUALIFIER_DESC,
  USB_DESC_TYPE_DEVICE_QUALIFIER,
  0x00,
  0x02,
  0x00,
  0x00,
  0x00,
  0x40,
  0x01,
  0x00,
};

/**
  * @}
  */

/** @defgroup USBD_I2S_to_USB_Private_Functions
  * @{
  */

/**
  * @brief  USBD_I2S_to_USB_Init
  *         Initialize the TEMPLATE interface
  * @param  pdev: device instance
  * @param  cfgidx: Configuration index
  * @retval status
  */
static uint8_t USBD_I2S_to_USB_Init(USBD_HandleTypeDef *pdev, uint8_t cfgidx)
{

  return (uint8_t)USBD_OK;
}

/**
  * @brief  USBD_I2S_to_USB_Init
  *         DeInitialize the TEMPLATE layer
  * @param  pdev: device instance
  * @param  cfgidx: Configuration index
  * @retval status
  */
static uint8_t USBD_I2S_to_USB_DeInit(USBD_HandleTypeDef *pdev, uint8_t cfgidx)
{

  return (uint8_t)USBD_OK;
}

/**
  * @brief  USBD_I2S_to_USB_Setup
  *         Handle the TEMPLATE specific requests
  * @param  pdev: instance
  * @param  req: usb requests
  * @retval status
  */
static uint8_t USBD_I2S_to_USB_Setup(USBD_HandleTypeDef *pdev,
                                   USBD_SetupReqTypedef *req)
{
  USBD_StatusTypeDef ret = USBD_OK;

  switch (req->bmRequest & USB_REQ_TYPE_MASK)
  {
  case USB_REQ_TYPE_CLASS :
    switch (req->bRequest)
    {
    default:
      USBD_CtlError(pdev, req);
      ret = USBD_FAIL;
      break;
    }
    break;

  case USB_REQ_TYPE_STANDARD:
    switch (req->bRequest)
    {
    default:
      USBD_CtlError(pdev, req);
      ret = USBD_FAIL;
      break;
    }
    break;

  default:
    USBD_CtlError(pdev, req);
    ret = USBD_FAIL;
    break;
  }

  return (uint8_t)ret;
}


/**
  * @brief  USBD_I2S_to_USB_GetCfgDesc
  *         return configuration descriptor
  * @param  length : pointer data length
  * @retval pointer to descriptor buffer
  */
static uint8_t *USBD_I2S_to_USB_GetCfgDesc(uint16_t *length)
{
  *length = (uint16_t)sizeof(USBD_I2S_to_USB_CfgDesc);
  return USBD_I2S_to_USB_CfgDesc;
}

/**
* @brief  DeviceQualifierDescriptor
*         return Device Qualifier descriptor
* @param  length : pointer data length
* @retval pointer to descriptor buffer
*/
uint8_t *USBD_I2S_to_USB_DeviceQualifierDescriptor(uint16_t *length)
{
  *length = (uint16_t)sizeof(USBD_I2S_to_USB_DeviceQualifierDesc);
  return USBD_I2S_to_USB_DeviceQualifierDesc;
}


/**
  * @brief  USBD_I2S_to_USB_DataIn
  *         handle data IN Stage
  * @param  pdev: device instance
  * @param  epnum: endpoint index
  * @retval status
  */
static uint8_t USBD_I2S_to_USB_DataIn(USBD_HandleTypeDef *pdev, uint8_t epnum)
{

  return (uint8_t)USBD_OK;
}

/**
  * @brief  USBD_I2S_to_USB_EP0_RxReady
  *         handle EP0 Rx Ready event
  * @param  pdev: device instance
  * @retval status
  */
static uint8_t USBD_I2S_to_USB_EP0_RxReady(USBD_HandleTypeDef *pdev)
{

  return (uint8_t)USBD_OK;
}
/**
  * @brief  USBD_I2S_to_USB_EP0_TxReady
  *         handle EP0 TRx Ready event
  * @param  pdev: device instance
  * @retval status
  */
static uint8_t USBD_I2S_to_USB_EP0_TxReady(USBD_HandleTypeDef *pdev)
{

  return (uint8_t)USBD_OK;
}
/**
  * @brief  USBD_I2S_to_USB_SOF
  *         handle SOF event
  * @param  pdev: device instance
  * @retval status
  */
static uint8_t USBD_I2S_to_USB_SOF(USBD_HandleTypeDef *pdev)
{

  return (uint8_t)USBD_OK;
}
/**
  * @brief  USBD_I2S_to_USB_IsoINIncomplete
  *         handle data ISO IN Incomplete event
  * @param  pdev: device instance
  * @param  epnum: endpoint index
  * @retval status
  */
static uint8_t USBD_I2S_to_USB_IsoINIncomplete(USBD_HandleTypeDef *pdev, uint8_t epnum)
{

  return (uint8_t)USBD_OK;
}
/**
  * @brief  USBD_I2S_to_USB_IsoOutIncomplete
  *         handle data ISO OUT Incomplete event
  * @param  pdev: device instance
  * @param  epnum: endpoint index
  * @retval status
  */
static uint8_t USBD_I2S_to_USB_IsoOutIncomplete(USBD_HandleTypeDef *pdev, uint8_t epnum)
{

  return (uint8_t)USBD_OK;
}
/**
  * @brief  USBD_I2S_to_USB_DataOut
  *         handle data OUT Stage
  * @param  pdev: device instance
  * @param  epnum: endpoint index
  * @retval status
  */
static uint8_t USBD_I2S_to_USB_DataOut(USBD_HandleTypeDef *pdev, uint8_t epnum)
{

  return (uint8_t)USBD_OK;
}

/**
* @brief  DeviceQualifierDescriptor
*         return Device Qualifier descriptor
* @param  length : pointer data length
* @retval pointer to descriptor buffer
*/
uint8_t *USBD_I2S_to_USB_GetDeviceQualifierDesc(uint16_t *length)
{
  *length = (uint16_t)sizeof(USBD_I2S_to_USB_DeviceQualifierDesc);

  return USBD_I2S_to_USB_DeviceQualifierDesc;
}

/**
  * @}
  */


/**
  * @}
  */


/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
