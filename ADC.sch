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
Sheet 1 6
Title ""
Date "21 may 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 3600 3900 900  1300
U 535F19C2
F0 "PSU-internal" 50
F1 "PSU-internal.sch" 50
F2 "+5V_EXT" I L 3600 4050 60 
F3 "DGND_EXT" I L 3600 4200 60 
F4 "+18V_EXT" I L 3600 4750 60 
F5 "AGND_EXT" I L 3600 4900 60 
F6 "-18V_EXT" I L 3600 5050 60 
F7 "+15V" O R 4500 4750 60 
F8 "AGND" O R 4500 4900 60 
F9 "-15V" O R 4500 5050 60 
F10 "+5V" O R 4500 4050 60 
F11 "DGND" O R 4500 4200 60 
F12 "+4V" O R 4500 4600 60 
$EndSheet
$Sheet
S 900  3900 900  1300
U 53688C29
F0 "PSU-external" 50
F1 "PSU-external.sch" 50
F2 "+5V_EXT" O R 1800 4300 60 
F3 "+18V_EXT" O R 1800 4750 60 
F4 "AGND_EXT" O R 1800 4900 60 
F5 "-18V_EXT" O R 1800 5050 60 
F6 "DGND_EXT" O R 1800 4450 60 
F7 "SAF_GND" O R 1800 4050 60 
$EndSheet
$Comp
L CONN_6 P?
U 1 1 5368BA3A
P 2500 4550
F 0 "P?" V 2450 4550 60  0000 C CNN
F 1 "CONN_6" V 2550 4550 60  0000 C CNN
F 2 "" H 2500 4550 60  0000 C CNN
F 3 "" H 2500 4550 60  0000 C CNN
	1    2500 4550
	1    0    0    -1  
$EndComp
$Comp
L CONN_6 P?
U 1 1 5368BCA4
P 2900 4550
F 0 "P?" V 2850 4550 60  0000 C CNN
F 1 "CONN_6" V 2950 4550 60  0000 C CNN
F 2 "" H 2900 4550 60  0000 C CNN
F 3 "" H 2900 4550 60  0000 C CNN
	1    2900 4550
	-1   0    0    -1  
$EndComp
$Sheet
S 6450 2200 900  1200
U 536E28DC
F0 "Line Receiver" 50
F1 "Line_receiver.sch" 50
F2 "+15V" I L 6450 2950 60 
F3 "AGND" I L 6450 3100 60 
F4 "-15V" I L 6450 3250 60 
F5 "LIN" I L 6450 2350 60 
F6 "LOUT" O R 7350 2350 60 
F7 "RIN" I L 6450 2550 60 
F8 "ROUT" O R 7350 2550 60 
$EndSheet
$Sheet
S 7950 2200 900  1200
U 536E29C2
F0 "Clipper" 50
F1 "Clipper.sch" 50
F2 "LIN" I L 7950 2350 60 
F3 "ROUT" O R 8850 2550 60 
F4 "AGND" I L 7950 3100 60 
F5 "+15V" I L 7950 2950 60 
F6 "-15V" I L 7950 3250 60 
F7 "RIN" I L 7950 2550 60 
F8 "LOUT" O R 8850 2350 60 
$EndSheet
$Sheet
S 9650 2200 1100 3000
U 536E90DD
F0 "PCM4222EVM" 50
F1 "PCM4222EVM.sch" 50
F2 "+15V" I L 9650 4750 60 
F3 "AGND" I L 9650 4900 60 
F4 "+4V" I L 9650 4600 60 
F5 "-15V" I L 9650 5050 60 
F6 "+5V" I L 9650 4050 60 
F7 "DGND" I L 9650 4200 60 
F8 "LIN-" I L 9650 2350 60 
F9 "LIN+" I L 9650 2750 60 
F10 "RIN-" I L 9650 2550 60 
F11 "RIN+" I L 9650 2950 60 
$EndSheet
$Comp
L RCA J?
U 1 1 536ED27A
P 5600 1900
F 0 "J?" H 5850 1750 60  0000 L CNN
F 1 "RCA" H 5850 1650 60  0000 L CNN
F 2 "" H 5600 1900 60  0000 C CNN
F 3 "" H 5600 1900 60  0000 C CNN
	1    5600 1900
	1    0    0    -1  
$EndComp
$Comp
L RCA J?
U 1 1 536ED287
P 5600 2750
F 0 "J?" H 5850 2600 60  0000 L CNN
F 1 "RCA" H 5850 2500 60  0000 L CNN
F 2 "" H 5600 2750 60  0000 C CNN
F 3 "" H 5600 2750 60  0000 C CNN
	1    5600 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 4050 2150 4050
Wire Wire Line
	2150 4050 2150 4300
Wire Wire Line
	1800 4300 2100 4300
Wire Wire Line
	2100 4300 2100 4400
Wire Wire Line
	2100 4400 2150 4400
Wire Wire Line
	1800 4450 2050 4450
Wire Wire Line
	2050 4450 2050 4500
Wire Wire Line
	2050 4500 2150 4500
Wire Wire Line
	1800 4750 2050 4750
Wire Wire Line
	2050 4750 2050 4600
Wire Wire Line
	2050 4600 2150 4600
Wire Wire Line
	1800 4900 2100 4900
Wire Wire Line
	2100 4900 2100 4700
Wire Wire Line
	2100 4700 2150 4700
Wire Wire Line
	1800 5050 2150 5050
Wire Wire Line
	2150 5050 2150 4800
Wire Wire Line
	3250 4800 3250 5050
Wire Wire Line
	3300 4900 3300 4700
Wire Wire Line
	3300 4700 3250 4700
Wire Wire Line
	3250 4600 3350 4600
Wire Wire Line
	3350 4600 3350 4750
Wire Wire Line
	3350 4200 3350 4500
Wire Wire Line
	3350 4500 3250 4500
Wire Wire Line
	3300 4400 3250 4400
Wire Wire Line
	3300 4050 3300 4400
Wire Wire Line
	3350 4750 3600 4750
Wire Wire Line
	3600 4900 3300 4900
Wire Wire Line
	3250 5050 3600 5050
Wire Wire Line
	6450 3250 6350 3250
Wire Wire Line
	6350 3250 6350 5050
Wire Wire Line
	6450 3100 6250 3100
Wire Wire Line
	6250 3100 6250 4900
Wire Wire Line
	6450 2950 6150 2950
Wire Wire Line
	6150 2950 6150 4750
Wire Wire Line
	7950 2950 7650 2950
Wire Wire Line
	7650 2950 7650 4750
Connection ~ 6150 4750
Wire Wire Line
	7950 3100 7750 3100
Wire Wire Line
	7750 3100 7750 4900
Connection ~ 6250 4900
Wire Wire Line
	7950 3250 7850 3250
Wire Wire Line
	7850 3250 7850 5050
Connection ~ 6350 5050
Wire Wire Line
	7350 2350 7950 2350
Wire Wire Line
	7950 2550 7350 2550
Wire Wire Line
	9650 2350 8850 2350
Wire Wire Line
	8850 2550 9650 2550
Connection ~ 7650 4750
Connection ~ 7750 4900
Connection ~ 7850 5050
Wire Wire Line
	9650 2750 9350 2750
Wire Wire Line
	9350 2750 9350 4900
Connection ~ 9350 4900
Wire Wire Line
	9350 2950 9650 2950
Connection ~ 9350 2950
Wire Wire Line
	5600 2200 5350 2200
Wire Wire Line
	5350 2200 5350 4900
Connection ~ 5350 4900
Wire Wire Line
	5600 3050 5350 3050
Connection ~ 5350 3050
Wire Wire Line
	5900 2750 5900 2550
Wire Wire Line
	5900 1900 5900 2350
Wire Wire Line
	5900 2350 6450 2350
Wire Wire Line
	5900 2550 6450 2550
Wire Wire Line
	4500 4050 9650 4050
Wire Wire Line
	9650 4200 4500 4200
Wire Wire Line
	4500 4600 9650 4600
Wire Wire Line
	9650 4750 4500 4750
Wire Wire Line
	4500 4900 9650 4900
Wire Wire Line
	9650 5050 4500 5050
Wire Wire Line
	3600 4200 3350 4200
Wire Wire Line
	3300 4050 3600 4050
Text Notes 1000 2050 0    60   ~ 0
TODO:\nPSU Internal:\n  * Determine feedback cap value\n  * Confirm selection of pass transistors\n  * Heatsinking of regs and trans?\n
$EndSCHEMATC
