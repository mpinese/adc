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
#include "i2s_to_usb_controller.h"

#ifdef DEBUG
#include <stdio.h>
#include <string.h>
char __debug_print_buf[256];
extern UART_HandleTypeDef huart2;
#define DEBUG_PRINT(...) { sprintf(&__debug_print_buf[0], __VA_ARGS__); HAL_UART_Transmit(&huart2, (uint8_t*) &__debug_print_buf[0], strlen(__debug_print_buf), 1000); }
#else
#define DEBUG_PRINT(...)
#endif


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
static uint8_t USBD_I2S_to_USB_EP0_TxReady(USBD_HandleTypeDef *pdev);
//static uint8_t USBD_I2S_to_USB_EP0_RxReady(USBD_HandleTypeDef *pdev);
static uint8_t USBD_I2S_to_USB_DataIn(USBD_HandleTypeDef *pdev, uint8_t epnum);
//static uint8_t USBD_I2S_to_USB_DataOut(USBD_HandleTypeDef *pdev, uint8_t epnum);
//static uint8_t USBD_I2S_to_USB_SOF(USBD_HandleTypeDef *pdev);
static uint8_t *USBD_I2S_to_USB_GetCfgDesc(uint16_t *length);
static uint8_t *USBD_I2S_to_USB_GetDeviceQualifierDesc(uint16_t *length);
/**
  * @}
  */

/** @defgroup USBD_I2S_to_USB_Private_Variables
  * @{
  */

static uint8_t g_datain_busy = 0;	/* Flag indicating if the IN bulk endpoint is busy (1) or not (0) */

/* Class callbacks */
USBD_ClassTypeDef USBD_I2S_to_USB_ClassDriver =
{
  USBD_I2S_to_USB_Init,			/* Init */
  USBD_I2S_to_USB_DeInit,		/* DeInit */

  /* Control endpoints */
  USBD_I2S_to_USB_Setup,		/* Setup (non-standard EP0 setup packets are forwarded here) */
  NULL,							/* EP0_TxSent  (EP0 IN) */
  NULL,							/* EP0_RxReady (EP0 OUT) */

  /* Class-specific endpoints */
  USBD_I2S_to_USB_DataIn,		/* DataIn */
  NULL,							/* DataOut */
  NULL,							/* SOF */
  NULL,							/* IsoINIncomplete */
  NULL,							/* IsoOUTIncomplete */
  USBD_I2S_to_USB_GetCfgDesc,	/* GetHSConfigDescriptor */
  USBD_I2S_to_USB_GetCfgDesc,	/* GetFSConfigDescriptor */
  NULL,							/* GetOtherSpeedConfigDescriptor */
  USBD_I2S_to_USB_GetDeviceQualifierDesc,	/* GetDeviceQualifierDescriptor */
};

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
  0x00,         /* MaxPower 0 mA (self-powered) */
  /* 09d */

  /* Interface 0 */
  USB_LEN_IF_DESC,         	/* bLength */
  USB_DESC_TYPE_INTERFACE,	/* bDescriptorType: Interface */
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
  *         Initialize the I2S_to_USB interface
  * @param  pdev: device instance
  * @param  cfgidx: Configuration index
  * @retval status
  */
static uint8_t USBD_I2S_to_USB_Init(USBD_HandleTypeDef *pdev, uint8_t cfgidx)
{
	DEBUG_PRINT("Init");
	USBD_LL_OpenEP(pdev, I2S_TO_USB_EPIN_ADDR, USBD_EP_TYPE_BULK,
			USB_FS_MAX_PACKET_SIZE);
	USBD_LL_OpenEP(pdev, I2S_TO_USB_EPOUT_ADDR, USBD_EP_TYPE_BULK,
			USB_FS_MAX_PACKET_SIZE);

	return (uint8_t) USBD_OK;
}

/**
  * @brief  USBD_I2S_to_USB_Init
  *         DeInitialize the I2S_to_USB layer
  * @param  pdev: device instance
  * @param  cfgidx: Configuration index
  * @retval status
  */
static uint8_t USBD_I2S_to_USB_DeInit(USBD_HandleTypeDef *pdev, uint8_t cfgidx)
{
	DEBUG_PRINT("Deinit");
  return (uint8_t)USBD_OK;
}

/**
  * @brief  USBD_I2S_to_USB_Setup
  *         Handle the I2S_to_USB specific requests
  * @param  pdev: instance
  * @param  req: usb requests
  * @retval status
  */
static uint8_t USBD_I2S_to_USB_Setup(USBD_HandleTypeDef *pdev,
		USBD_SetupReqTypedef *req)
{
	/*
	 * The library passes all the non-standard requests to the class-specific
	 * code with the callback pdev->pClass->Setup (pdev, req) function.
	 *
	 * The non-standard requests include the user-interpreted requests and the
	 * invalid requests. User-interpreted requests are class- specific requests,
	 * vendor-specific requests or the requests that the library considers as
	 * invalid requests that the application wants to interpret as valid requests.
	 *
	 * Invalid requests are the requests that are not standard requests and are
	 * not user-interpreted requests. Since pdev->pClass->Setup (pdev, req) is
	 * called after the SETUP stage and before the data stage, user code is
	 * responsible, in thepdev->pClass->Setup (pdev, req) to parse the content
	 * of the SETUP packet (req). If a request is invalid, the user code has to
	 * call USBD_CtlError(pdev , req) and return to the caller of
	 * pdev->pClass->Setup (pdev, req)
	 *
	 * For a user-interpreted request, the user code prepares the data buffer for
	 * the following data stage if the request has a data stage; otherwise the
	 * user code executes the request and returns to the caller of
	 * pdev->pClass->Setup (pdev, req).
	 *
	 * bmRequestType mask:
	 *   7		Direction
	 *   		0 = Host to device
	 *   		1 = Device to host
	 *   6..5	Type (USB_REQ_TYPE_MASK)
	 *   		0 = Standard
	 *   		1 = Class
	 *   		2 = Vendor
	 *   		3 = Reserved
	 *   4..0	Recipient
	 *   		0 = Device
	 *   		1 = Interface
	 *   		2 = Endpoint
	 *   		3 = Other
	 *   		4..31 = Reserved
	 */

	Controller_StatusTypeDef ret;
	uint8_t retdata[5];		/* Note that this size must never be less than req->wLength */

	/* This class only ever expects user-interpreted requests of type
	 * Vendor. Anything else that shows up is therefore an invalid request
	 * that was passed through by the library, so immediately call
	 * USBD_CtlError and return for these.
	 */
	if ((req->bmRequest & USB_REQ_TYPE_MASK) != USB_REQ_TYPE_VENDOR)
	{
		USBD_CtlError(pdev, req);
		return (uint8_t) USBD_FAIL;
	}

	/* We now know that we have a vendor request (ie
	 * req->bmRequest & USB_REQ_TYPE_MASK == USB_REQ_TYPE_VENDOR).
	 * Act on the signal by passing to handle_usb_command
	 * in i2s_to_usb_controller.c
	 */
	ret = controller_handle_usb_command(req->bRequest, req->wValue, req->wIndex, req->wLength, &retdata[0], sizeof(retdata));

	if (ret != CONTROLLER_OK)
	{
		USBD_CtlError(pdev, req);
		return (uint8_t) USBD_FAIL;
	}

	/* Acknowledge the control signal and return */
	USBD_CtlSendStatus(pdev);
	return (uint8_t) USBD_OK;
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
	/* If we need to transmit a zero length packet (the last packet was exactly USB_FS_MAX_PACKET_SIZE),
	 * then queue such a packet. This function will be called again when that packet has been sent,
	 * at which point the busy flag is cleared. If we do not have to transmit a ZLP, then just clear the
	 * g_datain_busy flag.
	 */
	DEBUG_PRINT("DatIn");
	if (pdev->ep_in[epnum].total_length > 0
			&& (pdev->ep_in[epnum].total_length % USB_FS_MAX_PACKET_SIZE) == 0)
	{
		pdev->ep_in[epnum].total_length = 0;
		USBD_LL_Transmit(pdev, epnum, NULL, 0);
	}
	else
		g_datain_busy = 0;

	return (uint8_t)USBD_OK;
}

/**
  * @brief  USBD_I2S_to_USB_EP0_RxReady
  *         handle EP0 Rx Ready event
  * @param  pdev: device instance
  * @retval status
  */
//static uint8_t USBD_I2S_to_USB_EP0_RxReady(USBD_HandleTypeDef *pdev)
//{
//DEBUG_PRINT("CRXR");
//
//  return (uint8_t)USBD_OK;
//}

/**
  * @brief  USBD_I2S_to_USB_EP0_TxReady
  *         handle EP0 TRx Ready event
  * @param  pdev: device instance
  * @retval status
  */
static uint8_t USBD_I2S_to_USB_EP0_TxReady(USBD_HandleTypeDef *pdev)
{
	DEBUG_PRINT("CTXR");

  return (uint8_t)USBD_OK;
}

/**
  * @brief  USBD_I2S_to_USB_DataOut
  *         handle data OUT Stage
  * @param  pdev: device instance
  * @param  epnum: endpoint index
  * @retval status
  */
//static uint8_t USBD_I2S_to_USB_DataOut(USBD_HandleTypeDef *pdev, uint8_t epnum)
//{
//
//  return (uint8_t)USBD_OK;
//}

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
* @brief  USBD_I2S_to_USB_GetDeviceQualifierDesc
*         return Device Qualifier descriptor
* @param  length : pointer data length
* @retval pointer to descriptor buffer
*/
static uint8_t *USBD_I2S_to_USB_GetDeviceQualifierDesc(uint16_t *length)
{
  *length = (uint16_t)sizeof(USBD_I2S_to_USB_DeviceQualifierDesc);

  return USBD_I2S_to_USB_DeviceQualifierDesc;
}

/**
* @brief  USBD_I2S_to_USB_Transmit
*         Convenience function to bulk transmit data back to the host,
*         handling ZLP bookkeeping.
* @param  buf: data buffer
* @param  length: data buffer size in bytes
* @retval pointer to descriptor buffer
*/
USBD_StatusTypeDef USBD_I2S_to_USB_Transmit(uint8_t* buf, uint16_t length)
{
	extern USBD_HandleTypeDef hUsbDeviceFS;
	DEBUG_PRINT("Xmit");
  if (g_datain_busy)
    return USBD_BUSY;

  g_datain_busy = 1;
  hUsbDeviceFS.ep_in[I2S_TO_USB_EPIN_ADDR & 0x7F].total_length = length;
  return USBD_LL_Transmit(&hUsbDeviceFS, I2S_TO_USB_EPIN_ADDR, buf, length);
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
