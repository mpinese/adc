# cd C:\Users\Mark\repos\electronics-adc\software\spectrum_analyser\spectrum_analyser\
# conda activate specanalyser
# python spectrum_analyser.py

import flatbuffers
import matplotlib.pyplot as plt
import numpy as np
import zmq

import BridgeMessages.CaptureRequest
import BridgeMessages.CaptureResponse
import BridgeMessages.Channel
import BridgeMessages.Window


if __name__ == '__main__':
	context = zmq.Context()
	socket = context.socket(zmq.REQ)
	socket.connect('tcp://127.0.0.1:5555')

	sample_rate = 88400
	sample_count = 80000
	bin_width = sample_rate / sample_count

	hl, = plt.plot([], [])

	builder = flatbuffers.Builder(128)
	BridgeMessages.CaptureRequest.CaptureRequestStart(builder)
	BridgeMessages.CaptureRequest.CaptureRequestAddChannel(builder, BridgeMessages.Channel.Channel().Left)
	BridgeMessages.CaptureRequest.CaptureRequestAddNSamples(builder, sample_count)
	BridgeMessages.CaptureRequest.CaptureRequestAddWindow(builder, BridgeMessages.Window.Window().Hann)
	request = BridgeMessages.CaptureRequest.CaptureRequestEnd(builder)
	builder.Finish(request)
	message_bytes = builder.Output()

	accum_spectrum = np.zeros(int(sample_count/2)+1)
	for i in range(32):
		print(i)
		socket.send(message_bytes)

		response_bytes = socket.recv()
		response = BridgeMessages.CaptureResponse.CaptureResponse.GetRootAsCaptureResponse(response_bytes, 0)

		# samples = response.SamplesAsNumpy()
		# plt.plot(np.linspace(start=0, stop=sample_count/sample_rate, num=sample_count), samples)
		# plt.show()
		spectrum = response.SpectrumAsNumpy()
		accum_spectrum += spectrum
		# hl.set_xdata(np.linspace(start=0, stop=sample_rate/2.0, num=int(sample_count/2)+1))
		# hl.set_ydata(spectrum)
		# plt.draw()
		# # 

	plt.plot(np.linspace(start=0, stop=sample_rate/2.0, num=int(sample_count/2)+1), 20*np.log10(accum_spectrum/np.max(accum_spectrum)))
	plt.show()
