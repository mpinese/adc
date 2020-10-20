#include <cmath>
#include <stdio.h>

#include <fftw3.h>
#include <libusb-1.0/libusb.h>

#include "adc.h"


constexpr double windowcf_bh = 1.31406;


double window_bh(uint32_t n, uint32_t N)
{
	constexpr double a0 = 0.35875;
	constexpr double a1 = 0.48829;
	constexpr double a2 = 0.14128;
	constexpr double a3 = 0.01168;
	constexpr double pi = 3.14159265358979323846;
	const double w = 2 * pi * n / double(N);

	return a0 - a1 * cos(w) + a2 * cos(2 * w) - a3 * cos(3 * w);
}


int main()
{
	ADC adc;

	adc.connect();

	uint32_t* data_words;

	const uint32_t sample_size = 65536;
	const uint32_t dft_size = sample_size / 2 + 1;
	const double sample_rate = 88200.0;
	const double bin_width = sample_rate / sample_size;

	data_words = new uint32_t[sample_size];
	
	adc.get_samples(sample_size, ADC::Channel::Right, &data_words[0]);

	double* fft_in;
	fftw_complex* fft_out;
	fftw_plan fft_plan;

	fft_in = (double*)fftw_malloc(sizeof(double) * sample_size);
	fft_out = (fftw_complex*)fftw_malloc(sizeof(fftw_complex) * dft_size);
	for (uint32_t i = 0; i < sample_size; i++)
	{
		int32_t raw_sample;
		raw_sample = -int32_t(data_words[i] & 0x800000) + int32_t(data_words[i] & 0x7FFFFF);
		fft_in[i] = double(raw_sample) / double(0xFFFFFF);
	}

	double max_signal = 0;
	for (uint32_t i = 0; i < sample_size; i++)
	{
		if (fft_in[i] > max_signal)
			max_signal = fft_in[i];
		else if (-fft_in[i] > max_signal)
			max_signal = -fft_in[i];
	}

	// Blackman-Harris window
	for (uint32_t i = 0; i < sample_size; i++)
		fft_in[i] = fft_in[i] * window_bh(i, sample_size);

	fft_plan = fftw_plan_dft_r2c_1d(sample_size, fft_in, fft_out, FFTW_ESTIMATE);
	fftw_execute(fft_plan);

	double fundamental_maxampl = 0;
	uint32_t fundamental_maxampl_bin;
	for (uint32_t i = 0; i < dft_size; i++)
	{
		if (hypot(fft_out[i][0], fft_out[i][1]) > fundamental_maxampl)
		{
			fundamental_maxampl = hypot(fft_out[i][0], fft_out[i][1]);
			fundamental_maxampl_bin = i;
		}
	}
	const double fundamental_frequency = fundamental_maxampl_bin * bin_width;

	// Calculate RMS power around the fundamental. Use a window of +/- 1 Hz.
	double fundamental_rms = 0;
	double noise_rms = 0;
	double noise_maxampl = 0;
	const double frequency_window = 1.0;
	for (uint32_t i = 0; i < dft_size; i++)
	{
		const double lower_frequency = i * bin_width - bin_width / 2;
		const double upper_frequency = i * bin_width + bin_width / 2;
		double this_ampl = hypot(fft_out[i][0], fft_out[i][1]);
		if (upper_frequency >= fundamental_frequency - frequency_window && lower_frequency <= fundamental_frequency + frequency_window)
			fundamental_rms += pow(this_ampl, 2.0);
		else if (i != 0 && lower_frequency >= 20000.0)
		{
			noise_rms += pow(this_ampl, 2.0);
			if (this_ampl > noise_maxampl)
				noise_maxampl = this_ampl;
		}
	}
	fundamental_rms = sqrt(fundamental_rms) * windowcf_bh;
	noise_rms = sqrt(noise_rms) * windowcf_bh;
	const double sinad = 20.0 * log10(fundamental_rms / noise_rms);
	const double enob = (sinad - 1.76) / 6.02;
	const double sfdr = 20.0 * log10(fundamental_maxampl / noise_maxampl);

	printf("\nMax signal:       %g", max_signal);
	printf("\nFundamental freq: %f Hz", fundamental_frequency);
	printf("\nFundamental peak: %f", fundamental_maxampl);
	printf("\nFundamental RMS:  %f", fundamental_rms);
	printf("\nNoise RMS:        %f", noise_rms);
	printf("\nSFDR:             %f", sfdr);
	printf("\nSINAD:            %f", sinad);
	printf("\nENOB:             %f", enob);
	
	fftw_destroy_plan(fft_plan);
	fftw_free(fft_in);
	fftw_free(fft_out);

	delete[] data_words;

	return 0;
}
