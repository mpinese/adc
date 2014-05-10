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
Sheet 5 7
Title ""
Date "10 may 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 3900 4250 0    60   Input ~ 0
+15V
Text HLabel 3900 4450 0    60   Input ~ 0
AGND
Text HLabel 3900 4650 0    60   Input ~ 0
-15V
Text HLabel 3900 3150 0    60   Input ~ 0
LIN
Text HLabel 7650 3150 2    60   Output ~ 0
LOUT
$Sheet
S 4450 3050 900  900 
U 536DFDE9
F0 "Line Receiver" 50
F1 "Line_receiver.sch" 50
F2 "+15V" I L 4450 3550 60 
F3 "AGND" I L 4450 3700 60 
F4 "-15V" I L 4450 3850 60 
F5 "LIN" I L 4450 3150 60 
F6 "LOUT" O R 5350 3150 60 
F7 "RIN" I L 4450 3300 60 
F8 "ROUT" O R 5350 3300 60 
$EndSheet
$Sheet
S 6200 3050 900  900 
U 536DFDED
F0 "Clipper" 50
F1 "Clipper.sch" 50
F2 "LIN" I L 6200 3150 60 
F3 "ROUT" O R 7100 3300 60 
F4 "AGND" I L 6200 3700 60 
F5 "+15V" I L 6200 3550 60 
F6 "-15V" I L 6200 3850 60 
F7 "RIN" I L 6200 3300 60 
F8 "LOUT" O R 7100 3150 60 
$EndSheet
Wire Wire Line
	4450 3550 4050 3550
Wire Wire Line
	4050 3550 4050 4250
Wire Wire Line
	3900 4250 5800 4250
Wire Wire Line
	3900 4450 5950 4450
Wire Wire Line
	4200 4450 4200 3700
Wire Wire Line
	4200 3700 4450 3700
Wire Wire Line
	4450 3850 4350 3850
Wire Wire Line
	4350 3850 4350 4650
Wire Wire Line
	3900 4650 6100 4650
Text HLabel 3900 3300 0    60   Input ~ 0
RIN
Wire Wire Line
	3900 3150 4450 3150
Wire Wire Line
	4450 3300 3900 3300
Text HLabel 7650 3300 2    60   Output ~ 0
ROUT
Wire Wire Line
	6200 3850 6100 3850
Wire Wire Line
	6100 3850 6100 4650
Connection ~ 4350 4650
Wire Wire Line
	6200 3700 5950 3700
Wire Wire Line
	5950 3700 5950 4450
Connection ~ 4200 4450
Wire Wire Line
	6200 3550 5800 3550
Wire Wire Line
	5800 3550 5800 4250
Connection ~ 4050 4250
Wire Wire Line
	5350 3150 6200 3150
Wire Wire Line
	6200 3300 5350 3300
Wire Wire Line
	7100 3150 7650 3150
Wire Wire Line
	7650 3300 7100 3300
$EndSCHEMATC
