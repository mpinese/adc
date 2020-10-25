#include "ADC.h"

#include <cassert>
#include <chrono>


ADC::ADC()
{
	this->m_connected = false;
}


ADC::~ADC()
{
	this->disconnect();
}


void ADC::open_claim_bridge_device()
{
	libusb_device** device_list;
	libusb_device* bridge_device = NULL;
	int libusb_status;
	ssize_t n_devices, device_idx;

	// Search for the I2S to USB FS bridge device
	this->m_libusb_errorcode = 0;
	n_devices = libusb_get_device_list(NULL, &device_list);
	if (n_devices < 0)
		throw ADCException(ADCException::Error::USB_OTHER, "Could not fetch USB device list", n_devices);

	for (device_idx = 0; device_idx < n_devices; device_idx++)
	{
		libusb_device* this_device = device_list[device_idx];
		struct libusb_device_descriptor this_device_desc;
		libusb_status = libusb_get_device_descriptor(this_device, &this_device_desc);
		if (libusb_status < 0)
			throw ADCException(ADCException::Error::USB_OTHER, "Could not get descriptor for USB device", libusb_status);

		if (this_device_desc.idVendor == 0x1209 && this_device_desc.idProduct == 0x9e87)
		{
			if (bridge_device != NULL)
				throw ADCException(ADCException::Error::USB_MULTIPLE_DEVICES, "Multiple ADC devices detected", libusb_status);
			bridge_device = this_device;
		}
	}

	if (bridge_device == NULL)
		throw ADCException(ADCException::Error::USB_NO_DEVICES, "No ADC devices found", libusb_status);

	// Open the found device.
	libusb_status = libusb_open(bridge_device, &this->m_bridge_handle);
	if (libusb_status != 0)
		throw ADCException(ADCException::Error::USB_OTHER, "Found ADC device, but failed to open it", libusb_status);

	libusb_free_device_list(device_list, 1);

	libusb_status = libusb_claim_interface(this->m_bridge_handle, 0);
	if (libusb_status != 0)
		throw ADCException(ADCException::Error::USB_OTHER, "Found and opened ADC device, but failed to claim it", libusb_status);
}


void ADC::connect()
{
	assert(!this->m_connected);

	int libusb_status;

	libusb_status = libusb_init(NULL);
	if (libusb_status != LIBUSB_SUCCESS)
		throw ADCException(ADCException::Error::USB_OTHER, "Could not initialize libusb", libusb_status);

	// Find, open, and claim the bridge device
	this->open_claim_bridge_device();

	// Allocate memory for the USB input buffer
	this->m_usb_buffer = std::unique_ptr<uint8_t[]>(new uint8_t[this->c_buf_size]);

	this->m_connected = true;
}


void ADC::disconnect()
{
	if (this->m_connected)
	{
		libusb_release_interface(this->m_bridge_handle, 0);
		libusb_close(this->m_bridge_handle);
		this->m_connected = false;
	}
}


void ADC::send_command(ADC::Command command) const
{
	int libusb_status = libusb_control_transfer(this->m_bridge_handle, 0x40, uint8_t(command), 0, 0, NULL, 0, 1000);
	if (libusb_status != 0)
		throw ADCException(ADCException::Error::USB_OTHER, "Failed to send command to ADC", libusb_status);
}


void ADC::flush_buffer() const
{
	assert(this->m_connected);

	while (true)
	{
		int n_bytes_received;
		libusb_bulk_transfer(this->m_bridge_handle, 0x81, this->m_usb_buffer.get(), this->c_buf_size, &n_bytes_received, 1000);
		if (n_bytes_received == 0)
			break;
	}
}


std::vector<int32_t> ADC::get_samples(uint32_t n_samples, ADC::Channel channel) const
{
	assert(this->m_connected);

	// Send the start acquisition command
	if (channel == ADC::Channel::Left)
		this->send_command(ADC::Command::StartAcqLeft);
	else
		this->send_command(ADC::Command::StartAcqRight);

	uint32_t n_samples_captured;

	int libusb_status;
	int n_bytes_received_libusb;
	std::vector<int32_t> samples;
	
	samples.reserve(n_samples);
	n_samples_captured = 0;
	while (n_samples_captured < n_samples)
	{
		// Read a data blob from the bridge
		libusb_status = libusb_bulk_transfer(this->m_bridge_handle, 0x81, this->m_usb_buffer.get(), this->c_buf_size, &n_bytes_received_libusb, 1000);
		if (libusb_status != LIBUSB_TRANSFER_COMPLETED)
			throw ADCException(ADCException::Error::USB_TRANSFER_FAILED, "Cannot get samples from ADC: bulk transfer failed", libusb_status);
		const size_t n_bytes_received = size_t(n_bytes_received_libusb);

		// Decode some state information in the blob
		uint8_t bridge_state = this->m_usb_buffer[n_bytes_received - 7];
		uint16_t n_samples_in_buf = (((uint16_t)this->m_usb_buffer[n_bytes_received - 6]) << 8) + this->m_usb_buffer[n_bytes_received - 5];
		uint32_t first_sample_idx =
			(uint32_t(this->m_usb_buffer[n_bytes_received - 4]) << 24) +
			(uint32_t(this->m_usb_buffer[n_bytes_received - 3]) << 16) +
			(uint32_t(this->m_usb_buffer[n_bytes_received - 2]) << 8) +
			(uint32_t(this->m_usb_buffer[n_bytes_received - 1]) << 0);

		// Check that the sample index matches what we expect. If it doesn't,
		// a blob's been lost.
		if (first_sample_idx != n_samples_captured)
			throw ADCException(ADCException::Error::USB_BLOB_LOST, "Cannot get samples from ADC: data blob was lost in transit", 0);

		// Copy the blob data to the destination, updating the total
		// sample counter n_samples_captured as we go. The buffer
		// contains 3-byte samples, which we need to pad to 4-byte
		// int32_t in dest.
		for (size_t sample_idx = 0; sample_idx < n_samples_in_buf && n_samples_captured < n_samples; sample_idx++, n_samples_captured++)
		{
			// Straight unpack to uint32
			uint32_t temp = 
				(uint32_t(this->m_usb_buffer[sample_idx * 3 + 2]) << 16) +
				(uint32_t(this->m_usb_buffer[sample_idx * 3 + 1]) << 8) +
				(uint32_t(this->m_usb_buffer[sample_idx * 3 + 0]) << 0);

			// 2s complement conversion to int32
			samples.push_back(-int32_t(temp & 0x800000) + int32_t(temp & 0x7FFFFF));
		}
	}

	assert(n_samples_captured == n_samples);

	// Stop acquisition and clean up
	this->send_command(ADC::Command::StopAcq);
	this->flush_buffer();

	return samples;
}
