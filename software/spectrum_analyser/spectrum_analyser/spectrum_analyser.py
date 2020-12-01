# conda activate specanalyser
# cd C:\Users\Mark\repos\electronics-adc\software\spectrum_analyser\spectrum_analyser
# python spectrum_analyser.py

import collections
import copy
import queue
import math
import threading
import time

from tkinter import *
from tkinter import ttk
import matplotlib
import matplotlib.backends.backend_tkagg

import flatbuffers
import numpy as np
import zmq

import BridgeMessages.CaptureRequest
import BridgeMessages.CaptureResponse
import BridgeMessages.Channel
import BridgeMessages.Window



class SpectralAnalysis:
    def __init__(self, spectrum=None, samples=None, sample_rate=None, deltabins=None, background=None):
        self.update(spectrum, samples, sample_rate, deltabins, background)


    @staticmethod
    def calc_rms_bin(spectrum, bin0, bin1):
        """
        Compute the RMS amplitude in spectrum between bin0 and bin1.
        bin0 and bin1 may be non-integer, in which case the amplitude
        is interpolated. Spectrum is a numpy vector of shape (n,)

        >>> calc_rms_bin(np.array[2, 3, 4, 3], 0, 4)
        6.164414
        >>> calc_rms_bin(np.array[2, 3, 4, 3], 1, 4)
        6.403124
        >>> calc_rms_bin(np.array[2, 3, 4, 3], 0, 3)
        6
        >>> calc_rms_bin(np.array[2, 3, 4, 3], 0.6, 4)
        5.966574
        >>> calc_rms_bin(np.array[2, 3, 4, 3], 0, 3.4)
        5.865151
        """
        if bin0 < 0 or bin1 >= spectrum.shape[0]:
            return np.nan

        left_amplitude2 = (math.ceil(bin0) - bin0)*math.pow(spectrum[int(math.floor(bin0))], 2)
        mid_amplitude2 = np.sum(np.power(spectrum[int(math.ceil(bin0)):int(math.floor(bin1))], 2))
        right_amplitude2 = (bin1 - math.floor(bin1))*math.pow(spectrum[int(math.floor(bin1))], 2)

        return math.sqrt(left_amplitude2 + mid_amplitude2 + right_amplitude2)


    @staticmethod
    def calc_rms_freq(spectrum, bin_width, freq0, freq1):
        """
        Compute the RMS amplitude in spectrum between freq0 and freq1.
        freq0 and freq1 may not fall on bin boundaries, in which case
        the amplitude is interpolated. Spectrum is a numpy vector of 
        shape (n,)
        """
        return SpectralAnalysis.calc_rms_bin(spectrum, freq0/bin_width, freq1/bin_width)


    def get_spectrum_avg(self):
        if self.spectrum is None:
            return None
        return self.spectrum_avg, self.sample_count, self.sample_rate


    def update(self, spectrum, samples, sample_rate, deltabins, background):
        self.spectrum = spectrum
        self.samples = samples
        self.sample_rate = sample_rate
        self.deltabins = deltabins
        self.background = background

        if spectrum is None:
            self.max_ampl = np.nan
            self.dc_ampl = np.nan
            self.fundamental_freq = np.nan
            self.fundamental_max = np.nan
            self.thd = np.nan
            self.sinad = np.nan
            self.sfdr = np.nan
            self.enob = np.nan
            self.spectrum_avg = None
            self.sample_count = None
            self.valid = False
            return

        sample_count = self.samples.shape[1]
        spectrum_avg = np.mean(spectrum, 0)
        self.spectrum_avg = spectrum_avg
        self.sample_count = sample_count
        if background is not None:
            spectrum_avg -= background
        bin_width = sample_rate / sample_count

        # Identify the fundamental
        fundamental_bin = np.argmax(spectrum_avg, axis=0)
        fundamental_freq = bin_width*fundamental_bin
        fundamental_max = spectrum_avg[fundamental_bin]

        # Calculate RMS amplitude around the fundamental
        fundamental_amp = self.calc_rms_bin(spectrum_avg, fundamental_bin-deltabins, fundamental_bin+deltabins)

        # Calculate RMS amplitude from 20 Hz to 20 kHz
        audible_amp = self.calc_rms_freq(spectrum_avg, bin_width, 20, 20000)

        # Calculate RMS amplitude from 20 Hz to 20 kHz, excluding the fundamental
        audible_nonfundamental_amp = np.nan
        if audible_amp > fundamental_amp:
            audible_nonfundamental_amp = math.sqrt(math.pow(audible_amp, 2) - math.pow(fundamental_amp, 2))

        # Calculate RMS amplitude of harmonics to 20 kHz
        audible_harmonic_amp = np.nan
        if fundamental_freq != 0:
            audible_harmonic_amps = []
            for i in range(2, int(20000/fundamental_freq)+1):
                harmonic_bin = int((fundamental_freq*i)/bin_width)
                rms_temp = self.calc_rms_bin(spectrum_avg, harmonic_bin-deltabins, harmonic_bin+deltabins)
                if not math.isnan(rms_temp):
                    audible_harmonic_amps.append(rms_temp)
            audible_harmonic_amp = np.sqrt(np.sum(np.power(np.array(audible_harmonic_amps), 2.0)))

        # Calculate max non-fundamental amplitude from 20 Hz to 20 kHz
        temp = np.copy(spectrum_avg)
        temp[max(0, fundamental_bin-deltabins):(min(fundamental_bin+deltabins, spectrum_avg.shape[0])+1)] = 0.0
        temp = temp[int(20/bin_width):(min(int(20000/bin_width), spectrum_avg.shape[0])+1)]
        audible_nonfundamental_max = np.max(temp)

        fundamental_amp_db = 20*math.log10(fundamental_amp)
        fundamental_max_db = 20*math.log10(fundamental_max)
        audible_nonfundamental_amp_db = 20*math.log10(audible_nonfundamental_amp)
        audible_nonfundamental_max_db = 20*math.log10(audible_nonfundamental_max)
        audible_harmonic_amp_db = np.nan
        if not math.isnan(audible_harmonic_amp) and audible_harmonic_amp > 0:
            audible_harmonic_amp_db = 20*math.log10(audible_harmonic_amp)

        thd = fundamental_amp_db - audible_harmonic_amp_db
        sinad = fundamental_amp_db - audible_nonfundamental_amp_db
        enob = (sinad - 1.76) / 6.02
        sfdr = fundamental_max_db - audible_nonfundamental_max_db

        self.max_ampl = np.max(np.abs(samples)) / np.power(2, 23)
        self.dc_ampl = spectrum_avg[0]
        self.fundamental_freq = fundamental_freq
        self.fundamental_max = fundamental_max
        self.thd = thd
        self.sinad = sinad
        self.sfdr = sfdr
        self.enob = enob
        self.valid = True



class AcquisitionThread(threading.Thread):
    def run(self):
        while True:
            self._kwargs['data_lock'].acquire()
            acq_vars = self._kwargs
            acq_vars['config_stable'].set()
            self._kwargs['data_lock'].release()
            socket = acq_vars['socket']
            channel = acq_vars['channel']
            window = acq_vars['window']
            sample_rate = acq_vars['sample_rate']
            sample_count = acq_vars['sample_count']
            bin_width = sample_rate / sample_count

            builder = flatbuffers.Builder(128)
            BridgeMessages.CaptureRequest.CaptureRequestStart(builder)
            BridgeMessages.CaptureRequest.CaptureRequestAddChannel(builder, channel)
            BridgeMessages.CaptureRequest.CaptureRequestAddNSamples(builder, sample_count)
            BridgeMessages.CaptureRequest.CaptureRequestAddWindow(builder, window)
            request = BridgeMessages.CaptureRequest.CaptureRequestEnd(builder)
            builder.Finish(request)
            message_bytes = builder.Output()

            socket.send(message_bytes)

            response_bytes = socket.recv()
            response = BridgeMessages.CaptureResponse.CaptureResponse.GetRootAsCaptureResponse(response_bytes, 0)

            acq_vars['data_lock'].acquire()
            if acq_vars['config_stable'].is_set():
                # The config hasn't been changed by the GUI thread, so we're good to commit these new data
                samples = response.SamplesAsNumpy()
                spectrum = response.SpectrumAsNumpy()
                if acq_vars['samples'] is None:
                    acq_vars['samples'] = np.expand_dims(samples, axis=0)
                    acq_vars['spectrum'] = np.expand_dims(spectrum, axis=0)
                else:
                    if acq_vars['samples'].shape[0] >= acq_vars['acquisition_count']:
                        acq_vars['samples'] = acq_vars['samples'][(len(acq_vars['samples']) - acq_vars['acquisition_count'] + 1):,:]
                        acq_vars['spectrum'] = acq_vars['spectrum'][(len(acq_vars['spectrum']) - acq_vars['acquisition_count'] + 1):,:]
                    acq_vars['samples'] = np.vstack((acq_vars['samples'], samples))
                    acq_vars['spectrum'] = np.vstack((acq_vars['spectrum'], spectrum))
                acq_vars['data_good'].set()
                acq_vars['updated_event'].set()
            acq_vars['data_lock'].release()



class ConfigFrame:
    def __init__(self, parent):
        self.parent = parent
        self.frame = ttk.Frame(self.parent.frame)

        ratevar = IntVar()
        ttk.Label(self.frame, text='Sample rate').grid(column=0, row=0, sticky='w')
        ttk.Label(self.frame, text='Hz').grid(column=2, row=0, sticky='w')
        ratebox = ttk.Combobox(self.frame, textvariable=ratevar, justify=RIGHT)
        ratebox['values'] = (88200)
        ratebox.state(['readonly'])
        ratebox.current(0)
        ratebox.grid(column=1, row=0, sticky='ew')
        ratebox.bind('<<ComboboxSelected>>', self.on_config_change)

        nsampvar = IntVar()
        ttk.Label(self.frame, text='Sample count').grid(column=0, row=1, sticky='w')
        nsampbox = ttk.Combobox(self.frame, textvariable=nsampvar, justify=RIGHT)
        nsampbox['values'] = (4096, 8192, 16384, 32768, 65536, 131072)
        nsampbox.state(['readonly'])
        nsampbox.current(0)
        nsampbox.grid(column=1, row=1, sticky='ew')
        nsampbox.bind('<<ComboboxSelected>>', self.on_config_change)

        navgvar = IntVar()
        ttk.Label(self.frame, text='Averaging').grid(column=0, row=2, sticky='w')
        navgbox = ttk.Combobox(self.frame, textvariable=navgvar, justify=RIGHT)
        navgbox['values'] = (1, 4, 16, 64)
        navgbox.state(['readonly'])
        navgbox.current(0)
        navgbox.grid(column=1, row=2, sticky='ew')
        navgbox.bind('<<ComboboxSelected>>', self.on_config_change)

        deltabinsvar = IntVar(value=1)
        ttk.Label(self.frame, text='Delta bins').grid(column=0, row=3, sticky='w')
        deltabinsbox = ttk.Spinbox(self.frame, from_=1, to=50, textvariable=deltabinsvar, justify=RIGHT, command=lambda: self.on_config_change(None))
        deltabinsbox.grid(column=1, row=3, sticky='ew')

        windowvar = StringVar()
        ttk.Label(self.frame, text='Window').grid(column=0, row=4, sticky='w')
        windowbox = ttk.Combobox(self.frame, textvariable=windowvar, justify=RIGHT)
        windowbox['values'] = ('Hann', 'Blackman-Harris', 'Rectangular')
        windowbox.state(['readonly'])
        windowbox.current(1)
        windowbox.grid(column=1, row=4, sticky='ew')
        windowbox.bind('<<ComboboxSelected>>', self.on_config_change)

        channelvar = StringVar()
        ttk.Label(self.frame, text='Channel').grid(column=0, row=5, sticky='w')
        channelbox = ttk.Combobox(self.frame, textvariable=channelvar, justify=RIGHT)
        channelbox['values'] = ('Left', 'Right')
        channelbox.state(['readonly'])
        channelbox.current(0)
        channelbox.grid(column=1, row=5, sticky='ew')
        channelbox.bind('<<ComboboxSelected>>', self.on_config_change)

        ttk.Button(self.frame, text='Live capture', command=self.on_live_button).grid(column=0, row=6)
        self.livetext = ttk.Label(self.frame, text='ON')
        self.livetext.grid(column=1, row=6, sticky='w')

        ttk.Label(self.frame, text='Label').grid(column=0, row=7, sticky='w')
        labelvar = StringVar()
        labelbox = ttk.Entry(self.frame, textvariable=labelvar, justify=LEFT)
        labelbox.grid(column=1, row=7, sticky='ew')

        ttk.Button(self.frame, text='Reset', command=self.on_reset_button).grid(column=0, row=8)
        ttk.Button(self.frame, text='Background', command=self.on_background_button).grid(column=0, row=9)
        ttk.Button(self.frame, text='Sample', command=self.on_sample_button).grid(column=0, row=10)

        namesvar = ['rate', 'nsamp', 'navg', 'deltabins', 'window', 'channel', 'label']
        ConfigWidgets = collections.namedtuple('ConfigWidgets', namesvar)
        ConfigVars = collections.namedtuple('ConfigVars', namesvar)
        self.widgets = ConfigWidgets(ratebox, nsampbox, navgbox, deltabinsbox, windowbox, channelbox, labelbox)
        self.vars = ConfigVars(ratevar, nsampvar, navgvar, deltabinsvar, windowvar, channelvar, labelvar)


    def on_live_button(self):
        self.parent.toggle_live()
        if self.parent.get_live():
            self.livetext['text']='ON'
        else:
            self.livetext['text']='OFF'


    def on_reset_button(self):
        acq_vars = self.parent.get_acq_vars(mutable=True)
        acq_vars['data_lock'].acquire()
        acq_vars['samples'] = None
        acq_vars['spectrum'] = None
        acq_vars['data_good'].clear()
        acq_vars['data_lock'].release()


    def on_background_button(self):
        self.parent.capture_background()


    def on_sample_button(self):
        self.parent.capture_sample(self.vars.label.get())


    def on_config_change(self, event):
        for widget in self.widgets:
            widget.selection_clear()

        self.parent.clear_background()
        acq_vars = self.parent.get_acq_vars(mutable=True)
        acq_vars['data_lock'].acquire()
        acq_vars['samples'] = None
        acq_vars['spectrum'] = None
        acq_vars['data_good'].clear()
        acq_vars['config_stable'].clear()
        acq_vars['sample_rate'] = self.vars.rate.get()
        acq_vars['sample_count'] = self.vars.nsamp.get()
        acq_vars['acquisition_count'] = self.vars.navg.get()
        acq_vars['delta_bins'] = self.vars.deltabins.get()
        channel_str = self.vars.channel.get()
        if channel_str == 'Left':
            acq_vars['channel'] = BridgeMessages.Channel.Channel().Left
        else:
            acq_vars['channel'] = BridgeMessages.Channel.Channel().Right
        window_str = self.vars.window.get()
        if window_str == 'Hann':
            acq_vars['window'] = BridgeMessages.Window.Window().Hann
        elif window_str == 'Blackman-Harris':
            acq_vars['window'] = BridgeMessages.Window.Window().BlackmanHarris
        elif window_str == 'Rectangular':
            acq_vars['window'] = BridgeMessages.Window.Window().Rectangular
        acq_vars['data_lock'].release()



class PlotFrame:
    def __init__(self, parent):
        self.parent = parent
        self.frame = ttk.Frame(self.parent.frame)

        self.focusvar = IntVar(value=0)
        focus_check = ttk.Checkbutton(self.frame, text='Focus on fundamental', command=self.set_axis_limits, variable=self.focusvar)

        figure = matplotlib.figure.Figure(figsize=(12,6), dpi=100)
        self.ax = figure.add_subplot(111)
        self.clear_plot()

        self.figure_canvas = matplotlib.backends.backend_tkagg.FigureCanvasTkAgg(figure, self.frame)
        self.figure_canvas.get_tk_widget().grid(row=0, column=0, sticky='nsew')
        focus_check.grid(row=1, column=0, sticky='w')


    def set_axis_limits(self):
        self.ax.set_ylim(-190, 0)

        if self.focusvar.get() == 0:
            self.ax.set_xlim(-500, 20500)
            self.fundamental_limit_low.set_visible(False)
            self.fundamental_limit_high.set_visible(False)
        else:
            if self.parent.get_analysis() == None or self.parent.get_analysis().valid == False:
                return
            fund_freq = self.parent.get_analysis().fundamental_freq
            self.ax.set_xlim(fund_freq-50, fund_freq+50)
            self.fundamental_limit_low.set_visible(True)
            self.fundamental_limit_high.set_visible(True)


    def clear_plot(self):
        self.ax.clear()
        self.live_line, = self.ax.plot(np.zeros(1), np.zeros(1), label='Live')
        self.fundamental_limit_low = self.ax.axvline(x=0)
        self.fundamental_limit_high = self.ax.axvline(x=0)
        self.live_line.set_visible(False)
        self.fundamental_limit_low.set_visible(False)
        self.fundamental_limit_high.set_visible(False)
        self.ax.legend(bbox_to_anchor=(0., 1.02, 1., .102), loc='lower left', ncol=5, mode="expand", borderaxespad=0.)
        self.set_axis_limits()


    @staticmethod
    def spectrum_to_xy(spectrum, sample_count, sample_rate):
        max_bin = int(sample_count/2) - 1
        max_freq = max_bin * sample_rate / sample_count

        x = np.linspace(start=0, stop=max_freq, num=max_bin+1)
        y = spectrum[0:-1]      # Drop the last bin (at Fs/2)

        return x, y


    def update_live_plot(self, analysis):
        spectrum_avg, sample_count_config, sample_rate = self.parent.get_spectrum_avg()

        if not spectrum_avg is None:
            spectrum_avg_db = 20*np.log10(np.abs(spectrum_avg))
            x, y = self.spectrum_to_xy(spectrum_avg_db, sample_count_config, sample_rate)

            self.live_line.set_xdata(x)
            self.live_line.set_ydata(y)
            self.live_line.set_visible(True)

            if analysis.valid:
                binwidth = self.parent.data.get_binwidth()
                deltabins = analysis.deltabins
                deltawidth = binwidth * deltabins
                self.fundamental_limit_low.set_xdata(analysis.fundamental_freq - deltawidth)
                self.fundamental_limit_high.set_xdata(analysis.fundamental_freq + deltawidth)

            self.figure_canvas.draw()


    # def capture_plot(self, label):
    #     spectrum_avg_db, sample_count_config, sample_rate = self.get_spectrum_avg_db()
    #     if not spectrum_avg_db is None:
    #         x, y = self.spectrum_to_xy(spectrum_avg_db, sample_count_config, sample_rate)
    #         self.captured_plots[label] = (x, y)
    #         self.ax.plot(x, y, label=label)
    #         self.ax.legend(bbox_to_anchor=(0., 1.02, 1., .102), loc='lower left', ncol=5, mode="expand", borderaxespad=0.)



class ResultFrame:
    def __init__(self, parent):
        self.parent = parent
        self.frame = ttk.Frame(self.parent.frame)

        self.var_maxampl = DoubleVar()
        ttk.Label(self.frame, text='Signal ampl.').grid(column=0, row=0, sticky='w')
        ttk.Entry(self.frame, textvariable=self.var_maxampl).grid(column=1, row=0, sticky='ew')

        self.var_dcampl = DoubleVar()
        ttk.Label(self.frame, text='DC ampl.').grid(column=0, row=1, sticky='w')
        ttk.Entry(self.frame, textvariable=self.var_dcampl).grid(column=1, row=1, sticky='ew')

        self.var_fundfreq = DoubleVar()
        ttk.Label(self.frame, text='Fundamental freq.').grid(column=0, row=2, sticky='w')
        ttk.Entry(self.frame, textvariable=self.var_fundfreq).grid(column=1, row=2, sticky='ew')
        ttk.Label(self.frame, text='Hz').grid(column=2, row=2, sticky='w')

        self.var_fundampl = DoubleVar()
        ttk.Label(self.frame, text='Fundamental ampl.').grid(column=0, row=3, sticky='w')
        ttk.Entry(self.frame, textvariable=self.var_fundampl).grid(column=1, row=3, sticky='ew')
        
        self.var_thd = DoubleVar()
        ttk.Label(self.frame, text='THD').grid(column=0, row=4, sticky='w')
        ttk.Entry(self.frame, textvariable=self.var_thd).grid(column=1, row=4, sticky='ew')
        ttk.Label(self.frame, text='dB').grid(column=2, row=4, sticky='w')

        self.var_thdn = DoubleVar()
        ttk.Label(self.frame, text='THD+N').grid(column=0, row=5, sticky='w')
        ttk.Entry(self.frame, textvariable=self.var_thdn).grid(column=1, row=5, sticky='ew')
        ttk.Label(self.frame, text='dB').grid(column=2, row=5, sticky='w')

        self.var_sfdr = DoubleVar()
        ttk.Label(self.frame, text='SFDR').grid(column=0, row=6, sticky='w')
        ttk.Entry(self.frame, textvariable=self.var_sfdr).grid(column=1, row=6, sticky='ew')
        ttk.Label(self.frame, text='dBc').grid(column=2, row=6, sticky='w')

        self.var_enob = DoubleVar()
        ttk.Label(self.frame, text='ENOB').grid(column=0, row=7, sticky='w')
        ttk.Entry(self.frame, textvariable=self.var_enob).grid(column=1, row=7, sticky='ew')


    def update_result(self, analysis):
        self.var_maxampl.set(analysis.max_ampl)
        self.var_fundfreq.set(analysis.fundamental_freq)
        self.var_dcampl.set(analysis.dc_ampl)
        self.var_fundampl.set(analysis.fundamental_max)
        self.var_thd.set(analysis.thd)
        self.var_thdn.set(analysis.sinad)
        self.var_sfdr.set(analysis.sfdr)
        self.var_enob.set(analysis.enob)



class TableFrame:
    def __init__(self, parent):
        self.parent = parent
        self.frame = ttk.Frame(self.parent.frame)



class SpectrumAnalyserData:
    def __init__(self, acq_vars):
        self.analysis = SpectralAnalysis()
        self.captures = []
        self.analysis_background = SpectralAnalysis()
        self.background = None
        self.acq_vars = acq_vars


    def save_results(self, filename):
        pass


    def save_spectra(self, filename):
        pass


    def save_samples(self, filename):
        pass


    def update_analysis(self):
        acq_vars = self.acq_vars
        acq_vars['data_lock'].acquire()
        spectrum = acq_vars['spectrum']
        sample_rate = acq_vars['sample_rate']
        samples = acq_vars['samples']
        deltabins = acq_vars['delta_bins']
        acq_vars['data_lock'].release()
        self.analysis = SpectralAnalysis(spectrum, samples, sample_rate, deltabins, self.background)


    def get_mutable_acq_vars(self):
        return self.acq_vars


    def capture_background(self):
        self.analysis_background = copy.copy(self.analysis)
        self.background = self.analysis_background.get_spectrum_avg()[0]


    def clear_background(self):
        self.analysis_background = SpectralAnalysis()
        self.background = None


    def capture_result(self, label):
        analysis_copy = copy.copy(self.analysis)
        acq_vars = self.acq_vars
        acq_vars['data_lock'].acquire()
        config_copy = {
            'sample_rate': acq_vars['sample_rate'],
            'sample_count': acq_vars['sample_count'],
            'acquisition_count': acq_vars['acquisition_count'],
            'channel': acq_vars['channel'],
            'window': acq_vars['window'],
            'delta_bins': acq_vars['delta_bins']
        }
        samples_copy = np.copy(acq_vars['samples'])
        spectrum_copy = np.copy(acq_vars['spectrum'])
        acq_vars['data_lock'].release()
        self.captures.append((label, (config_copy, samples_copy, spectrum_copy, analysis_copy)))


    def get_binwidth(self):
        acq_vars['data_lock'].acquire()
        binwidth = acq_vars['sample_rate'] / acq_vars['sample_count']
        acq_vars['data_lock'].release()
        return binwidth



class SpectrumAnalyserApp:
    def __init__(self, parent, acq_vars):
        self.parent = parent
        self.data = SpectrumAnalyserData(acq_vars)
        parent.title('Spectrum Analyser')

        self.frame = ttk.Frame(parent)
        self.live = True

        self.configframe = ConfigFrame(self)
        self.resultframe = ResultFrame(self)
        self.plotframe = PlotFrame(self)
        self.tableframe = TableFrame(self)

        self.frame.grid(column=0, row=0)
        self.configframe.frame.grid(column=0, row=0)
        self.resultframe.frame.grid(column=0, row=1)
        self.plotframe.frame.grid(column=1, row=0, sticky='nsew')
        self.tableframe.frame.grid(column=1, row=1)

        self.frame.after(100, self.update)


    def update(self):
        acq_vars = self.get_acq_vars()
        if self.live and acq_vars['updated_event'].is_set() and acq_vars['data_good'].is_set():
            self.data.update_analysis()
            acq_vars['updated_event'].clear()
            self.resultframe.update_result(self.data.analysis)
            self.plotframe.update_live_plot(self.data.analysis)
        self.frame.after(100, self.update)


    def toggle_live(self):
        self.live = not self.live


    def get_live(self):
        return self.live


    def get_data(self):
        return self.data


    def get_acq_vars(self, mutable=True):
        acq_vars = self.data.get_mutable_acq_vars()
        if not mutable:
            acq_vars['data_lock'].acquire()
            acq_vars_copy = copy.deepcopy(acq_vars)
            acq_vars['data_lock'].release()
            acq_vars = acq_vars_copy
        return acq_vars


    def get_spectrum_avg(self):
        return self.data.analysis.get_spectrum_avg()


    def capture_result(self, label):
        self.data.capture_result(label)


    def capture_background(self):
        self.data.capture_background()


    def clear_background(self):
        self.data.clear_background()


    def get_analysis(self):
        return self.data.analysis



if __name__ == '__main__':
    context = zmq.Context()
    socket = context.socket(zmq.REQ)
    socket.connect('tcp://127.0.0.1:5555')

    data_lock = threading.RLock()
    updated_event = threading.Event()
    data_good = threading.Event()           # Flags if the data in acq_vars are good or not
    config_stable = threading.Event()       # Flags if the configuration is stable or not. Set by the acquisition thread, cleared by any config change in the gui.

    spectrum = np.zeros(0)

    acq_vars = {
        'data_lock': data_lock,
        'updated_event': updated_event,
        'data_good': data_good,
        'config_stable': config_stable,
        'socket': socket,
        'sample_rate': 88200,
        'sample_count': 4096,
        'acquisition_count': 1,
        'delta_bins': 1,
        'channel': BridgeMessages.Channel.Channel().Left,
        'window': BridgeMessages.Window.Window().BlackmanHarris,
        'samples': None,
        'spectrum':  None
    }

    acq_thread = AcquisitionThread(kwargs=acq_vars, daemon=True)
    acq_thread.start()

    root = Tk()
    app = SpectrumAnalyserApp(root, acq_vars)
    root.mainloop()
