#include <stdio.h>
#include <libusb-1.0/libusb.h>


enum Bridge_Status
{
	BRIDGE_OK						= 0U,
	BRIDGE_ERROR_LIBUSB				= 1U,
	BRIDGE_ERROR_MULTIPLE_DEVICES	= 2U,
	BRIDGE_ERROR_NO_DEVICES			= 3U
};


Bridge_Status find_bridge(libusb_device_handle** bridge_handle)
{
	libusb_device** device_list;
	libusb_device* bridge_device = NULL;
	int libusb_status;
	ssize_t n_devices, device_idx;

	// Search for the I2S to USB FS bridge device
	n_devices = libusb_get_device_list(NULL, &device_list);
	if (n_devices < 0)
	{
		fprintf(stderr, "\nError: could not get USB device list (libusb %s: %s)", libusb_error_name(n_devices), libusb_strerror(libusb_error(n_devices)));
		return BRIDGE_ERROR_LIBUSB;
	}
	for (device_idx = 0; device_idx < n_devices; device_idx++)
	{
		libusb_device* this_device = device_list[device_idx];
		struct libusb_device_descriptor this_device_desc;
		libusb_status = libusb_get_device_descriptor(this_device, &this_device_desc);
		if (libusb_status < 0)
		{
			fprintf(stderr, "\nError: could not get device descriptor (libusb %s: %s)", libusb_error_name(libusb_status), libusb_strerror(libusb_error(libusb_status)));
			return BRIDGE_ERROR_LIBUSB;
		}

		if (this_device_desc.idVendor == 0x1209 && this_device_desc.idProduct == 0x9e87)
		{
			if (bridge_device != NULL)
			{
				fprintf(stderr, "\nError: multiple I2S to USB bridges found.");
				return BRIDGE_ERROR_MULTIPLE_DEVICES;
			}
			bridge_device = this_device;
		}
	}

	if (bridge_device == NULL)
	{
		fprintf(stderr, "\nError: no I2S to USB bridge found.");
		return BRIDGE_ERROR_NO_DEVICES;
	}

	// Open the found device.
	libusb_status = libusb_error(libusb_open(bridge_device, bridge_handle));
	if (libusb_status != 0)
	{
		fprintf(stderr, "\nError: could not open I2S to USB bridge (libusb %s: %s)", libusb_error_name(libusb_status), libusb_strerror(libusb_error(libusb_status)));
		return BRIDGE_ERROR_LIBUSB;
	}

	libusb_free_device_list(device_list, 1);

	return BRIDGE_OK;
}


int main()
{
	libusb_device_handle* bridge_handle;
	int libusb_status;
	Bridge_Status bridge_status;

	libusb_status = libusb_init(NULL);
	if (libusb_status != LIBUSB_SUCCESS)
	{
		fprintf(stderr, "\nError: could not init libusb (libusb %s: %s)", libusb_error_name(libusb_status), libusb_strerror(libusb_error(libusb_status)));
		return BRIDGE_ERROR_LIBUSB;
	}

	bridge_status = find_bridge(&bridge_handle);
	if (bridge_status != BRIDGE_OK)
	{
		libusb_exit(NULL);
		return int(bridge_status);
	}

	// Issue 1: after hitting state BUFOVR, all xfers fail. Need to reset USB on device?? Reset from host doesn't help:
	libusb_status = libusb_reset_device(bridge_handle);
	if (libusb_status != LIBUSB_SUCCESS)
	{
		fprintf(stderr, "\nError: could not reset device (libusb %s: %s)", libusb_error_name(libusb_status), libusb_strerror(libusb_error(libusb_status)));
		return BRIDGE_ERROR_LIBUSB;
	}

	libusb_status = libusb_claim_interface(bridge_handle, 0);
	printf("\n%d %s %s", libusb_status, libusb_error_name(libusb_status), libusb_strerror(libusb_error(libusb_status)));

	libusb_status = libusb_control_transfer(bridge_handle, 0x40, 0x00, 0, 0, NULL, 0, 1000);
	libusb_status = libusb_control_transfer(bridge_handle, 0x40, 0x40, 0, 0, NULL, 0, 1000);
	libusb_status = libusb_control_transfer(bridge_handle, 0x40, 0x80, 0, 0, NULL, 0, 1000);
	libusb_status = libusb_control_transfer(bridge_handle, 0x40, 0xC0, 0, 0, NULL, 0, 1000);

	libusb_status = libusb_control_transfer(bridge_handle, 0x40, 0x40, 0, 0, NULL, 0, 1000);

	unsigned char buf[128];
	int n_bytes_received;

	for (int i = 0; i < 100; i++)
	{
		libusb_status = libusb_bulk_transfer(bridge_handle, 0x81, &buf[0], sizeof(buf), &n_bytes_received, 1000);
		//		printf("\n%d %d ", libusb_status, n_bytes_received);
		for (int j = 0; j < sizeof(buf) / 8; j++)
		{
			printf("\n%d %d ", libusb_status, n_bytes_received);
			for (int k = 0; k < 4; printf("%02X", buf[j * 8 + k++]));
			printf(" ");
			for (int k = 4; k < 8; printf("%02X", buf[j * 8 + k++]));
		}
	}

	libusb_status = libusb_release_interface(bridge_handle, 0);
	printf("\n%d %s %s", libusb_status, libusb_error_name(libusb_status), libusb_strerror(libusb_error(libusb_status)));

	return 0;
}
