EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Gajda_cmosieee
LIBS:Gajda_ttlieee
LIBS:my-4000
LIBS:my-adc-dac
LIBS:my-diode
LIBS:my-drivers
LIBS:my-linear
LIBS:my-mcu
LIBS:my-opto
LIBS:my-regul
LIBS:my-transistors
LIBS:my-transceivers
LIBS:my-xtal
LIBS:my-transformers
LIBS:my-device
LIBS:my-conn
LIBS:ADC-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 5
Title ""
Date "7 may 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 3800 5100 900  1300
U 535F19BB
F0 "PCM4222EVM" 50
F1 "PCM4222EVM.sch" 50
$EndSheet
$Sheet
S 4300 1400 900  1300
U 535F19C2
F0 "PSU-internal" 50
F1 "PSU-internal.sch" 50
F2 "+5V_EXT" I L 4300 1800 60 
F3 "DGND_EXT" I L 4300 1950 60 
F4 "+18V_EXT" I L 4300 2250 60 
F5 "AGND_EXT" I L 4300 2400 60 
F6 "-18V_EXT" I L 4300 2550 60 
F7 "+15V" O R 5200 2250 60 
F8 "AGND" O R 5200 2400 60 
F9 "-15V" O R 5200 2550 60 
F10 "+5V" O R 5200 1550 60 
F11 "DGND" O R 5200 1700 60 
$EndSheet
$Sheet
S 1800 4650 900  1300
U 535F19C9
F0 "Buffers" 50
F1 "Buffers.sch" 50
$EndSheet
$Sheet
S 1600 1400 900  1300
U 53688C29
F0 "PSU-external" 50
F1 "PSU-external.sch" 50
F2 "+5V_EXT" O R 2500 1800 60 
F3 "+18V_EXT" O R 2500 2250 60 
F4 "AGND_EXT" O R 2500 2400 60 
F5 "-18V_EXT" O R 2500 2550 60 
F6 "DGND_EXT" O R 2500 1950 60 
F7 "SAF_GND" O R 2500 1550 60 
$EndSheet
$Comp
L CONN_6 P?
U 1 1 5368BA3A
P 3200 2050
F 0 "P?" V 3150 2050 60  0000 C CNN
F 1 "CONN_6" V 3250 2050 60  0000 C CNN
F 2 "" H 3200 2050 60  0000 C CNN
F 3 "" H 3200 2050 60  0000 C CNN
	1    3200 2050
	1    0    0    -1  
$EndComp
$Comp
L CONN_6 P?
U 1 1 5368BCA4
P 3600 2050
F 0 "P?" V 3550 2050 60  0000 C CNN
F 1 "CONN_6" V 3650 2050 60  0000 C CNN
F 2 "" H 3600 2050 60  0000 C CNN
F 3 "" H 3600 2050 60  0000 C CNN
	1    3600 2050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2500 1550 2850 1550
Wire Wire Line
	2850 1550 2850 1800
Wire Wire Line
	2500 1800 2800 1800
Wire Wire Line
	2800 1800 2800 1900
Wire Wire Line
	2800 1900 2850 1900
Wire Wire Line
	2500 1950 2750 1950
Wire Wire Line
	2750 1950 2750 2000
Wire Wire Line
	2750 2000 2850 2000
Wire Wire Line
	2500 2250 2750 2250
Wire Wire Line
	2750 2250 2750 2100
Wire Wire Line
	2750 2100 2850 2100
Wire Wire Line
	2500 2400 2800 2400
Wire Wire Line
	2800 2400 2800 2200
Wire Wire Line
	2800 2200 2850 2200
Wire Wire Line
	2500 2550 2850 2550
Wire Wire Line
	2850 2550 2850 2300
Wire Wire Line
	3950 2300 3950 2550
Wire Wire Line
	4000 2400 4000 2200
Wire Wire Line
	4000 2200 3950 2200
Wire Wire Line
	3950 2100 4050 2100
Wire Wire Line
	4050 2100 4050 2250
Wire Wire Line
	4050 1950 4050 2000
Wire Wire Line
	4050 2000 3950 2000
Wire Wire Line
	3950 1900 4000 1900
Wire Wire Line
	4000 1900 4000 1800
Wire Wire Line
	4000 1800 4300 1800
Wire Wire Line
	4300 1950 4050 1950
Wire Wire Line
	4050 2250 4300 2250
Wire Wire Line
	4300 2400 4000 2400
Wire Wire Line
	3950 2550 4300 2550
$EndSCHEMATC
