#include <cassert>
#include <chrono>
#include <cmath>
#include <cstdio>
#include <iostream>

#include <fftw3.h>
#include <flatbuffers/flatbuffers.h>
#include <zmq.hpp>				// Windows: zmq must be included before libusb

#include "adc.h"
#include "messages_generated.h"	// Flatbuffers generated from messages.fbs


using namespace std;


vector<double> window_samples(vector<int32_t> samples, BridgeMessages::Window window)
{
	double a0, a1, a2, a3, correction_factor;

	switch (window)
	{
	case BridgeMessages::Window::Window_Rectangular:
		a0 = 1.0;
		a1 = 0.0;
		a2 = 0.0;
		a3 = 0.0;
		correction_factor = 1.0;
		break;
	case BridgeMessages::Window::Window_Hann:
		a0 = 0.5;
		a1 = 0.5;
		a2 = 0.0;
		a3 = 0.0;
		correction_factor = 1.22474;
		break;
	case BridgeMessages::Window::Window_BlackmanHarris:
		a0 = 0.35875;
		a1 = 0.48829;
		a2 = 0.14128;
		a3 = 0.01168;
		correction_factor = 1.31406;
		break;
	default:
		assert(false);
	}

	constexpr double twopi = 2.0l*3.14159265358979323846;
	const double N = samples.size() - 1.0l;

	vector<double> output;
	output.resize(samples.size());
	for (size_t i = 0; i < samples.size(); i++)
	{
		const double w = twopi * double(i) / N;
		const double raw_signal = double(samples[i]) / double(0xFFFFFF);
		const double window_factor = a0 - a1 * cos(w) + a2 * cos(2 * w) - a3 * cos(3 * w);
		output[i] = raw_signal * window_factor * correction_factor;
	}

	return output;
}


vector<double> calc_spectrum(const vector<double> windowed_samples)
{
	const size_t N = windowed_samples.size();
	const size_t dft_size = size_t(N / 2) + 1;

	double* fft_in;
	fftw_complex* fft_out;
	fftw_plan fft_plan;

	fft_in = (double*)fftw_malloc(sizeof(double) * N);
	if (fft_in == NULL)
		throw bad_alloc();
	fft_out = (fftw_complex*)fftw_malloc(sizeof(fftw_complex) * dft_size);
	if (fft_out == NULL)
	{
		fftw_free(fft_in);
		throw bad_alloc();
	}

	for (size_t i = 0; i < N; i++)
		fft_in[i] = windowed_samples[i];

	fft_plan = fftw_plan_dft_r2c_1d(N, fft_in, fft_out, FFTW_ESTIMATE);
	fftw_execute(fft_plan);

	vector<double> output;
	output.resize(dft_size);
	for (size_t i = 0; i < dft_size; i++)
		output[i] = hypot(fft_out[i][0], fft_out[i][1]) / double(N);

	fftw_destroy_plan(fft_plan);
	fftw_free(fft_out);
	fftw_free(fft_in);
	
	return output;
}


int main()
{
	try {
		ADC adc;
		adc.connect();

		zmq::context_t zmq_context(1);
		zmq::socket_t zmq_socket(zmq_context, zmq::socket_type::rep);
		zmq_socket.bind("tcp://127.0.0.1:5555");

		cout << "Bound to tcp://127.0.0.1:5555" << endl;
		while (true)
		{
			zmq::message_t zmq_request;

			// A. Wait for a work request from the client
			zmq_socket.recv(zmq_request);
			cout << "Received request" << endl;

			// B1. Parse the request
			auto t1 = std::chrono::high_resolution_clock::now();
			auto fb_req = flatbuffers::GetRoot<BridgeMessages::CaptureRequest>(zmq_request.data());
			auto t2 = std::chrono::high_resolution_clock::now();

			// B2. Get the sample
			const auto samples = adc.get_samples(fb_req->n_samples(), fb_req->channel() == BridgeMessages::Channel_Left ? ADC::Channel::Left : ADC::Channel::Right);
			auto t3 = std::chrono::high_resolution_clock::now();

			// B3. Window the sample for fft.
			const auto windowed_samples = window_samples(samples, fb_req->window());
			auto t4 = std::chrono::high_resolution_clock::now();

			// B4. Perform the FFT
			const auto spectrum = calc_spectrum(windowed_samples);
			auto t5 = std::chrono::high_resolution_clock::now();

			// B5. Serialise the results
			// Preallocate n_samples*4 for the int32_t array of samples,
			// (n_samples+1)/2*8 for the double array of spectral values,
			// plus 1 kb slack.
			flatbuffers::FlatBufferBuilder builder(fb_req->n_samples() * 8 + 1000);
			auto samples_offset = builder.CreateVector(samples);
			auto spectrum_offset = builder.CreateVector(spectrum);
			BridgeMessages::CaptureResponseBuilder response_builder(builder);
			response_builder.add_samples(samples_offset);
			response_builder.add_spectrum(spectrum_offset);
			auto fb_response = response_builder.Finish();
			builder.Finish(fb_response);
			auto t6 = std::chrono::high_resolution_clock::now();

			// C. Return the result
			zmq::message_t zmq_reply(builder.GetBufferPointer(), builder.GetSize());
			zmq_socket.send(zmq_reply, zmq::send_flags::none);
			auto t7 = std::chrono::high_resolution_clock::now();
			cout << "Sent response" << endl;
			cout << "Times:" << endl;
			cout << "  Parse request:    " << std::chrono::duration_cast<std::chrono::milliseconds>(t2 - t1).count() << endl;
			cout << "  Get sample:       " << std::chrono::duration_cast<std::chrono::milliseconds>(t3 - t2).count() << endl;
			cout << "  (Theoretical):    " << fb_req->n_samples() / 88.2 << endl;
			cout << "  Window sample:    " << std::chrono::duration_cast<std::chrono::milliseconds>(t4 - t3).count() << endl;
			cout << "  FFT:              " << std::chrono::duration_cast<std::chrono::milliseconds>(t5 - t4).count() << endl;
			cout << "  Serialise result: " << std::chrono::duration_cast<std::chrono::milliseconds>(t6 - t5).count() << endl;
			cout << "  Send result:      " << std::chrono::duration_cast<std::chrono::milliseconds>(t7 - t6).count() << endl;
		}
	}
	catch (const ADCException& e)
	{
		cout << "Error communicating with ADC. Message: " << e.what() << endl;
	}
	catch (const zmq::error_t& e)
	{
		cout << "Error reported by ZMQ. Code: " << e.num() << ", Message: " << e.what() << endl;
		if (e.num() == 13)
			cout << "Hint: VPNs or other infrastructure that block local loopback connections can cause this error." << endl;
	}

	return 0;
}
