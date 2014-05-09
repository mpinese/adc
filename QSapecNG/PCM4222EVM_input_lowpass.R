# PCM4222EVM differential input stage low pass filter modelling

# From QSapecNG:
gainfunc = function(s) { (s + 3.22373e+06) / (( - 1.21565e-13 ) * s^3 + ( - 1.05195e-06 ) * s^2 + ( - 4.20191 ) * s + ( - 6.68625e+06 )) }

lossfunc = function(s) { 20*log10(abs(gainfunc(s))) }
freq = 10^seq(3, 10, 0.01)
sval = 2*pi*freq
plot(freq/1e3, lossfunc(sval), type = "l", log = "x", xlab = "Frequency (kHz)", ylab = "Attenuation (dB)")
abline(v = 12.288*1e6/1e3/2, col = rgb(1, 0, 0, 0.5))
abline(v = 48, col = rgb(1, 0, 0, 0.5))
lossfunc(2*pi*48e3) - lossfunc(0)	# 0.84 dB down at 48 kHz
lossfunc(2*pi*20e3) - lossfunc(0)	# 0.35 dB down at 20 kHz

freq = 10^seq(0, log10(20000), 0.01)
sval = 2*pi*freq
plot(freq, lossfunc(sval) - lossfunc(0), type = "l", log = "x", xlab = "Frequency (Hz)", ylab = "Excess Attenuation (dB)")

