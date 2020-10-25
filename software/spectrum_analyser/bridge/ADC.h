#pragma once

#include <exception>
#include <memory>
#include <string>
#include <vector>

#include <libusb-1.0/libusb.h>


class ADCException : virtual public std::exception
{
public:
	enum class Error
	{
		USB_OTHER,
		USB_MULTIPLE_DEVICES,
		USB_NO_DEVICES,
		USB_TRANSFER_FAILED,
		USB_BLOB_LOST,
		MALLOC,
		ALREADY_CONNECTED,
		NOT_CONNECTED
	};

protected:
	Error m_error_code;
	std::string m_error_msg;
	int m_libusb_error_code;

public:

	explicit ADCException(ADCException::Error error, const std::string& message, int libusb_error_code) :
		m_error_code(error),
		m_error_msg(message),
		m_libusb_error_code(libusb_error_code) {}

	virtual ~ADCException() throw () {}

	virtual const char* what() const throw () {
		return m_error_msg.c_str();
	}

	virtual Error get_error() const throw() {
		return m_error_code;
	}

	virtual int get_libusb_code() const throw() {
		return m_libusb_error_code;
	}
};


class ADC
{
private:
	bool m_connected;

	libusb_device_handle* m_bridge_handle;
	int m_libusb_errorcode;

	// Read buffer size. This must be large enough to hold the entire transmission from
	// the USB bridge, as determined by I2S_BUFFER_WORDS in i2s_to_usb_controller.h in
	// the USB bridge code. The requirement is buf_size > I2S_BUFFER_WORDS/4*3 + 7.
	const size_t c_buf_size = 7600;
	std::unique_ptr<uint8_t[]> m_usb_buffer;

	void open_claim_bridge_device();
	void flush_buffer() const;

public:
	enum class Command
	{
		GetStatus = 0x00,
		StartAcqLeft = 0x40,
		StartAcqRight = 0x41,
		StopAcq = 0x80,
		Reset = 0xC0
	};

	enum class Channel
	{
		Left,
		Right
	};

	ADC();
	~ADC();

	void connect();
	void disconnect();
	void send_command(ADC::Command command) const;
	std::vector<int32_t> get_samples(uint32_t n_samples, Channel channel) const;
};

