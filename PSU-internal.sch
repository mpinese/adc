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
Sheet 2 6
Title ""
Date "11 may 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CP1 C8
U 1 1 535FAE07
P 8850 1800
F 0 "C8" H 8900 1900 50  0000 L CNN
F 1 "100u" H 8900 1700 50  0000 L CNN
F 2 "" H 8850 1800 60  0000 C CNN
F 3 "" H 8850 1800 60  0000 C CNN
	1    8850 1800
	1    0    0    -1  
$EndComp
$Comp
L BD241A Q3
U 1 1 535FB7FB
P 3750 1400
F 0 "Q3" H 3700 1250 40  0000 R CNN
F 1 "BD241A" H 3735 1550 40  0000 R CNN
F 2 "TO-220" H 3630 1505 29  0001 C CNN
F 3 "~" H 3750 1400 60  0000 C CNN
	1    3750 1400
	0    -1   -1   0   
$EndComp
$Comp
L R R11
U 1 1 535FB82B
P 3500 1700
F 0 "R11" V 3580 1700 40  0000 C CNN
F 1 "47" V 3507 1701 40  0000 C CNN
F 2 "" V 3430 1700 30  0000 C CNN
F 3 "" H 3500 1700 30  0000 C CNN
	1    3500 1700
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 535FBC8B
P 1900 2000
F 0 "R9" V 1980 2000 40  0000 C CNN
F 1 "4.99k" V 1907 2001 40  0000 C CNN
F 2 "~" V 1830 2000 30  0000 C CNN
F 3 "~" H 1900 2000 30  0000 C CNN
	1    1900 2000
	-1   0    0    1   
$EndComp
$Comp
L R R15
U 1 1 535FBC98
P 3100 1000
F 0 "R15" V 3180 1000 40  0000 C CNN
F 1 "10k" V 3107 1001 40  0000 C CNN
F 2 "~" V 3030 1000 30  0000 C CNN
F 3 "~" H 3100 1000 30  0000 C CNN
	1    3100 1000
	0    -1   -1   0   
$EndComp
$Comp
L CP1 C14
U 1 1 535FBC9E
P 3100 700
F 0 "C14" H 3150 800 50  0000 L CNN
F 1 "47u" H 3150 600 50  0000 L CNN
F 2 "" H 3100 700 60  0000 C CNN
F 3 "" H 3100 700 60  0000 C CNN
	1    3100 700 
	0    1    1    0   
$EndComp
$Comp
L R R12
U 1 1 535FC2AB
P 3000 2000
F 0 "R12" V 3080 2000 40  0000 C CNN
F 1 "3.32k" V 3007 2001 40  0000 C CNN
F 2 "~" V 2930 2000 30  0000 C CNN
F 3 "~" H 3000 2000 30  0000 C CNN
	1    3000 2000
	0    1    1    0   
$EndComp
$Comp
L CP1 C12
U 1 1 535FC430
P 2150 2350
F 0 "C12" H 2200 2450 50  0000 L CNN
F 1 "10u" H 2200 2250 50  0000 L CNN
F 2 "" H 2150 2350 60  0000 C CNN
F 3 "" H 2150 2350 60  0000 C CNN
	1    2150 2350
	1    0    0    -1  
$EndComp
Text HLabel 8550 1300 0    60   Input ~ 0
+5V_EXT
Text HLabel 6450 1300 2    60   Output ~ 0
+15V
Text HLabel 6450 5550 2    60   Output ~ 0
AGND
Text HLabel 6450 6800 2    60   Output ~ 0
-15V
$Comp
L OPA209-SOT23 U?
U 1 1 53644510
P 2650 1700
F 0 "U?" H 2750 1950 60  0000 L CNN
F 1 "OPA209-SOT23" H 2750 1850 60  0000 L CNN
F 2 "" H 2750 1700 60  0000 C CNN
F 3 "" H 2750 1700 60  0000 C CNN
	1    2650 1700
	1    0    0    -1  
$EndComp
$Comp
L REF02 U?
U 1 1 53644B79
P 4000 2100
F 0 "U?" H 4100 1850 60  0000 L CNN
F 1 "REF02" H 4100 1750 60  0000 L CNN
F 2 "" H 4000 2150 60  0000 C CNN
F 3 "" H 4000 2150 60  0000 C CNN
	1    4000 2100
	-1   0    0    -1  
$EndComp
NoConn ~ 4350 2200
NoConn ~ 3650 2200
$Comp
L C C?
U 1 1 536453AA
P 4450 2100
F 0 "C?" H 4450 2200 40  0000 L CNN
F 1 "100n" H 4456 2015 40  0000 L CNN
F 2 "" H 4488 1950 30  0000 C CNN
F 3 "" H 4450 2100 60  0000 C CNN
	1    4450 2100
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 536453B5
P 3500 2200
F 0 "C?" H 3500 2300 40  0000 L CNN
F 1 "100n" H 3506 2115 40  0000 L CNN
F 2 "" H 3538 2050 30  0000 C CNN
F 3 "" H 3500 2200 60  0000 C CNN
	1    3500 2200
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 53645A52
P 4750 1950
F 0 "C?" H 4800 2050 50  0000 L CNN
F 1 "100u" H 4800 1850 50  0000 L CNN
F 2 "" H 4750 1950 60  0000 C CNN
F 3 "" H 4750 1950 60  0000 C CNN
	1    4750 1950
	1    0    0    -1  
$EndComp
Text HLabel 8550 2300 0    60   Input ~ 0
DGND_EXT
Text Notes 9350 -900 0    60   ~ 0
TODO:\n* Determine feedback cap value\n* Confirm selection of pass transistors\n* Heatsinking of regs and trans?\n* Schkotty and voltage drop
$Comp
L C C?
U 1 1 53649175
P 1650 2000
F 0 "C?" H 1650 2100 40  0000 L CNN
F 1 "100n" H 1656 1915 40  0000 L CNN
F 2 "" H 1688 1850 30  0000 C CNN
F 3 "" H 1650 2000 60  0000 C CNN
F 4 "Bypass cap for OpAmp" H 1650 2000 60  0001 C CNN "Note"
	1    1650 2000
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5365AD18
P 5200 2300
F 0 "R?" V 5280 2300 40  0000 C CNN
F 1 "1k" V 5207 2301 40  0000 C CNN
F 2 "" V 5130 2300 30  0000 C CNN
F 3 "" H 5200 2300 30  0000 C CNN
	1    5200 2300
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5365AD2E
P 5450 2300
F 0 "C?" H 5450 2400 40  0000 L CNN
F 1 "47n" H 5456 2215 40  0000 L CNN
F 2 "" H 5488 2150 30  0000 C CNN
F 3 "" H 5450 2300 60  0000 C CNN
	1    5450 2300
	1    0    0    -1  
$EndComp
$Comp
L ZENER D?
U 1 1 5365B333
P 5200 1700
F 0 "D?" H 5200 1800 50  0000 C CNN
F 1 "ZENER" H 5200 1600 40  0000 C CNN
F 2 "" H 5200 1700 60  0000 C CNN
F 3 "" H 5200 1700 60  0000 C CNN
	1    5200 1700
	0    -1   -1   0   
$EndComp
$Comp
L DIODESCH D?
U 1 1 5365B634
P 6100 1300
F 0 "D?" H 6100 1400 40  0000 C CNN
F 1 "DIODESCH" H 6100 1200 40  0000 C CNN
F 2 "" H 6100 1300 60  0000 C CNN
F 3 "" H 6100 1300 60  0000 C CNN
	1    6100 1300
	1    0    0    -1  
$EndComp
$Comp
L SCR_SML U?
U 1 1 53659485
P 5750 1900
F 0 "U?" H 5850 2100 47  0000 L CNN
F 1 "SCR_SML" H 5850 2000 47  0000 L CNN
F 2 "" H 5750 1900 60  0000 C CNN
F 3 "" H 5750 1900 60  0000 C CNN
	1    5750 1900
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5368975C
P 1650 6100
F 0 "C?" H 1650 6200 40  0000 L CNN
F 1 "100n" H 1656 6015 40  0000 L CNN
F 2 "" H 1688 5950 30  0000 C CNN
F 3 "" H 1650 6100 60  0000 C CNN
F 4 "Bypass cap for OpAmp" H 1650 6100 60  0001 C CNN "Note"
	1    1650 6100
	1    0    0    -1  
$EndComp
$Comp
L OPA209-SOT23 U?
U 1 1 536899C8
P 2650 6400
F 0 "U?" H 2750 6650 60  0000 L CNN
F 1 "OPA209-SOT23" H 2750 6550 60  0000 L CNN
F 2 "" H 2750 6400 60  0000 C CNN
F 3 "" H 2750 6400 60  0000 C CNN
	1    2650 6400
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 53689A9F
P 2150 5750
F 0 "C?" H 2200 5850 50  0000 L CNN
F 1 "10u" H 2200 5650 50  0000 L CNN
F 2 "" H 2150 5750 60  0000 C CNN
F 3 "" H 2150 5750 60  0000 C CNN
	1    2150 5750
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 53689AAA
P 1900 6100
F 0 "R?" V 1980 6100 40  0000 C CNN
F 1 "4.99k" V 1907 6101 40  0000 C CNN
F 2 "~" V 1830 6100 30  0000 C CNN
F 3 "~" H 1900 6100 30  0000 C CNN
	1    1900 6100
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 53689F91
P 3000 6100
F 0 "R?" V 3080 6100 40  0000 C CNN
F 1 "3.32k" V 3007 6101 40  0000 C CNN
F 2 "~" V 2930 6100 30  0000 C CNN
F 3 "~" H 3000 6100 30  0000 C CNN
	1    3000 6100
	0    1    1    0   
$EndComp
$Comp
L C C?
U 1 1 53689F9C
P 3350 5900
F 0 "C?" H 3350 6000 40  0000 L CNN
F 1 "100n" H 3356 5815 40  0000 L CNN
F 2 "" H 3388 5750 30  0000 C CNN
F 3 "" H 3350 5900 60  0000 C CNN
	1    3350 5900
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 53689FA7
P 3500 6400
F 0 "R?" V 3580 6400 40  0000 C CNN
F 1 "47" V 3507 6401 40  0000 C CNN
F 2 "" V 3430 6400 30  0000 C CNN
F 3 "" H 3500 6400 30  0000 C CNN
	1    3500 6400
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5368A217
P 3100 7100
F 0 "R?" V 3180 7100 40  0000 C CNN
F 1 "10k" V 3107 7101 40  0000 C CNN
F 2 "~" V 3030 7100 30  0000 C CNN
F 3 "~" H 3100 7100 30  0000 C CNN
	1    3100 7100
	0    -1   -1   0   
$EndComp
$Comp
L CP1 C?
U 1 1 5368A222
P 3100 7400
F 0 "C?" H 3150 7500 50  0000 L CNN
F 1 "47u" H 3150 7300 50  0000 L CNN
F 2 "" H 3100 7400 60  0000 C CNN
F 3 "" H 3100 7400 60  0000 C CNN
	1    3100 7400
	0    1    1    0   
$EndComp
$Comp
L CP1 C?
U 1 1 5368A6C9
P 4750 6150
F 0 "C?" H 4800 6250 50  0000 L CNN
F 1 "100u" H 4800 6050 50  0000 L CNN
F 2 "" H 4750 6150 60  0000 C CNN
F 3 "" H 4750 6150 60  0000 C CNN
	1    4750 6150
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5368A964
P 5200 6550
F 0 "R?" V 5280 6550 40  0000 C CNN
F 1 "1k" V 5207 6551 40  0000 C CNN
F 2 "" V 5130 6550 30  0000 C CNN
F 3 "" H 5200 6550 30  0000 C CNN
	1    5200 6550
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5368A96A
P 5450 6550
F 0 "C?" H 5450 6650 40  0000 L CNN
F 1 "47n" H 5456 6465 40  0000 L CNN
F 2 "" H 5488 6400 30  0000 C CNN
F 3 "" H 5450 6550 60  0000 C CNN
	1    5450 6550
	1    0    0    -1  
$EndComp
$Comp
L ZENER D?
U 1 1 5368A970
P 5200 5950
F 0 "D?" H 5200 6050 50  0000 C CNN
F 1 "ZENER" H 5200 5850 40  0000 C CNN
F 2 "" H 5200 5950 60  0000 C CNN
F 3 "" H 5200 5950 60  0000 C CNN
	1    5200 5950
	0    -1   -1   0   
$EndComp
$Comp
L DIODESCH D?
U 1 1 5368A976
P 6100 6800
F 0 "D?" H 6100 6900 40  0000 C CNN
F 1 "DIODESCH" H 6100 6700 40  0000 C CNN
F 2 "" H 6100 6800 60  0000 C CNN
F 3 "" H 6100 6800 60  0000 C CNN
	1    6100 6800
	-1   0    0    -1  
$EndComp
$Comp
L SCR_SML U?
U 1 1 5368A97C
P 5750 6150
F 0 "U?" H 5850 6350 47  0000 L CNN
F 1 "SCR_SML" H 5850 6250 47  0000 L CNN
F 2 "" H 5750 6150 60  0000 C CNN
F 3 "" H 5750 6150 60  0000 C CNN
	1    5750 6150
	1    0    0    -1  
$EndComp
Text HLabel 9550 1300 2    60   Output ~ 0
+5V
Text HLabel 9550 2300 2    60   Output ~ 0
DGND
$Comp
L C C?
U 1 1 53689541
P 9250 1800
F 0 "C?" H 9250 1900 40  0000 L CNN
F 1 "1u" H 9256 1715 40  0000 L CNN
F 2 "" H 9288 1650 30  0000 C CNN
F 3 "" H 9250 1800 60  0000 C CNN
	1    9250 1800
	1    0    0    -1  
$EndComp
Connection ~ 8850 1300
Connection ~ 2650 1300
Connection ~ 2150 1600
Connection ~ 2150 5550
Wire Wire Line
	2250 1800 2150 1800
Wire Wire Line
	2150 1800 2150 2150
Connection ~ 2150 2000
Connection ~ 2650 5550
Wire Wire Line
	2250 1600 1900 1600
Wire Wire Line
	1900 1600 1900 1750
Connection ~ 1900 5550
Connection ~ 1650 5550
Wire Wire Line
	4000 2700 4000 2400
Wire Wire Line
	4450 2700 4450 2300
Wire Wire Line
	3250 2000 3650 2000
Connection ~ 3500 2000
Connection ~ 3350 5550
Wire Wire Line
	4750 1750 4750 1300
Connection ~ 4750 1300
Connection ~ 4750 5550
Connection ~ 8850 2300
Wire Wire Line
	1650 1800 1650 1300
Connection ~ 1650 1300
Wire Wire Line
	3750 1700 3750 1600
Wire Wire Line
	2750 2000 2150 2000
Wire Wire Line
	4000 1800 4000 1300
Wire Wire Line
	4050 1300 4050 1000
Wire Wire Line
	4050 1000 3350 1000
Wire Wire Line
	3450 1000 3450 700 
Connection ~ 3450 1000
Wire Wire Line
	2750 700  2750 1000
Wire Wire Line
	2150 1000 2850 1000
Connection ~ 2750 1000
Wire Wire Line
	2150 1600 2150 1000
Connection ~ 4050 1300
Connection ~ 4000 1300
Wire Wire Line
	4450 1900 4450 1700
Wire Wire Line
	4450 1700 4000 1700
Connection ~ 4000 1700
Wire Wire Line
	5450 2700 5450 2500
Wire Wire Line
	5450 2100 5450 2050
Connection ~ 5450 2050
Connection ~ 5200 5550
Wire Wire Line
	5200 2050 5600 2050
Connection ~ 5750 5550
Wire Wire Line
	5750 1700 5750 1300
Connection ~ 5750 1300
Wire Wire Line
	5200 1900 5200 2050
Wire Wire Line
	5200 1500 5200 1300
Connection ~ 5200 1300
Connection ~ 5200 2050
Wire Wire Line
	6450 1300 6300 1300
Wire Wire Line
	8850 2000 8850 2300
Wire Wire Line
	8850 1300 8850 1600
Wire Wire Line
	3950 1300 5900 1300
Wire Wire Line
	2750 700  2900 700 
Wire Wire Line
	3450 700  3300 700 
Wire Wire Line
	1650 6300 1650 6800
Connection ~ 1650 6800
Wire Wire Line
	3250 6100 3600 6100
Wire Wire Line
	2750 6100 2150 6100
Wire Wire Line
	2150 6100 2150 5950
Wire Wire Line
	3350 7100 4050 7100
Wire Wire Line
	4050 7100 4050 6800
Connection ~ 4050 6800
Wire Wire Line
	2150 7100 2850 7100
Wire Wire Line
	2150 6800 2150 7100
Wire Wire Line
	2900 7400 2750 7400
Wire Wire Line
	2750 7400 2750 7100
Connection ~ 2750 7100
Wire Wire Line
	3300 7400 3450 7400
Wire Wire Line
	3450 7400 3450 7100
Connection ~ 3450 7100
Wire Wire Line
	4750 6350 4750 6800
Connection ~ 4750 6800
Wire Wire Line
	5450 6750 5450 6800
Connection ~ 5450 6800
Wire Wire Line
	5450 6350 5450 6300
Connection ~ 5450 6300
Connection ~ 5200 6800
Wire Wire Line
	5200 6300 5600 6300
Wire Wire Line
	5750 6800 5750 6350
Connection ~ 5750 6800
Wire Wire Line
	5200 6150 5200 6300
Wire Wire Line
	5200 5750 5200 5550
Connection ~ 5200 6300
Wire Wire Line
	6450 6800 6300 6800
Wire Wire Line
	9250 1600 9250 1300
Connection ~ 9250 1300
Wire Wire Line
	9250 2000 9250 2300
Connection ~ 9250 2300
Wire Wire Line
	8550 1300 9550 1300
Wire Wire Line
	8550 2300 9550 2300
Wire Wire Line
	1200 1300 3550 1300
Text HLabel 1200 1300 0    60   Input ~ 0
+18V_EXT
Text HLabel 1450 5550 0    60   Input ~ 0
AGND_EXT
Text HLabel 1450 6800 0    60   Input ~ 0
-18V_EXT
$Comp
L BD242 Q?
U 1 1 536B497F
P 3750 6700
F 0 "Q?" H 3700 6550 40  0000 R CNN
F 1 "BD242" H 3750 6850 40  0000 R CNN
F 2 "TO220" H 3630 6805 29  0001 C CNN
F 3 "" H 3750 6700 60  0000 C CNN
	1    3750 6700
	0    -1   1    0   
$EndComp
Wire Wire Line
	3750 6400 3750 6500
Connection ~ 2150 6800
Connection ~ 2650 6800
Wire Wire Line
	5900 6800 3950 6800
Connection ~ 3350 6100
Text HLabel 6450 3650 2    60   Output ~ 0
+4V
Wire Wire Line
	1650 2200 1650 2700
Wire Wire Line
	1900 2700 1900 2250
Wire Wire Line
	2150 2700 2150 2550
Connection ~ 1900 2700
Wire Wire Line
	2650 2700 2650 2100
Connection ~ 2150 2700
Connection ~ 2650 2700
Connection ~ 3500 2700
Connection ~ 4000 2700
Wire Wire Line
	4750 2700 4750 2150
Connection ~ 4450 2700
Wire Wire Line
	5200 2700 5200 2550
Connection ~ 4750 2700
Connection ~ 5200 2700
Wire Wire Line
	5750 2700 5750 2100
Connection ~ 5450 2700
Connection ~ 1650 2700
Wire Wire Line
	1450 2700 6450 2700
Text HLabel 1450 2700 0    60   Input ~ 0
AGND_EXT
Text HLabel 6450 2700 2    60   Output ~ 0
AGND
Connection ~ 5750 2700
Wire Wire Line
	1650 5900 1650 5550
Wire Wire Line
	1900 5550 1900 5850
Wire Wire Line
	2650 5550 2650 6000
Wire Wire Line
	3350 5550 3350 5700
Wire Wire Line
	4750 5950 4750 5550
Wire Wire Line
	5750 5550 5750 5950
Wire Wire Line
	1450 5550 6450 5550
Wire Wire Line
	1450 6800 3550 6800
$Comp
L BD241A Q?
U 1 1 536ECFA7
P 3750 3750
F 0 "Q?" H 3700 3600 40  0000 R CNN
F 1 "BD241A" H 3735 3900 40  0000 R CNN
F 2 "TO-220" H 3630 3855 29  0001 C CNN
F 3 "~" H 3750 3750 60  0000 C CNN
	1    3750 3750
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 536ECFAD
P 3500 4050
F 0 "R?" V 3580 4050 40  0000 C CNN
F 1 "47" V 3507 4051 40  0000 C CNN
F 2 "" V 3430 4050 30  0000 C CNN
F 3 "" H 3500 4050 30  0000 C CNN
	1    3500 4050
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 536ECFB3
P 1900 4350
F 0 "R?" V 1980 4350 40  0000 C CNN
F 1 "4.99k" V 1907 4351 40  0000 C CNN
F 2 "~" V 1830 4350 30  0000 C CNN
F 3 "~" H 1900 4350 30  0000 C CNN
	1    1900 4350
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 536ECFB9
P 3100 3350
F 0 "R?" V 3180 3350 40  0000 C CNN
F 1 "4.99k" V 3107 3351 40  0000 C CNN
F 2 "~" V 3030 3350 30  0000 C CNN
F 3 "~" H 3100 3350 30  0000 C CNN
	1    3100 3350
	0    -1   -1   0   
$EndComp
$Comp
L CP1 C?
U 1 1 536ECFBF
P 3100 3050
F 0 "C?" H 3150 3150 50  0000 L CNN
F 1 "47u" H 3150 2950 50  0000 L CNN
F 2 "" H 3100 3050 60  0000 C CNN
F 3 "" H 3100 3050 60  0000 C CNN
	1    3100 3050
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 536ECFC5
P 3000 4350
F 0 "R?" V 3080 4350 40  0000 C CNN
F 1 "1.5k" V 3007 4351 40  0000 C CNN
F 2 "~" V 2930 4350 30  0000 C CNN
F 3 "~" H 3000 4350 30  0000 C CNN
	1    3000 4350
	0    1    1    0   
$EndComp
$Comp
L CP1 C?
U 1 1 536ECFCB
P 2150 4700
F 0 "C?" H 2200 4800 50  0000 L CNN
F 1 "10u" H 2200 4600 50  0000 L CNN
F 2 "" H 2150 4700 60  0000 C CNN
F 3 "" H 2150 4700 60  0000 C CNN
	1    2150 4700
	1    0    0    -1  
$EndComp
$Comp
L OPA209-SOT23 U?
U 1 1 536ECFD2
P 2650 4050
F 0 "U?" H 2750 4300 60  0000 L CNN
F 1 "OPA209-SOT23" H 2750 4200 60  0000 L CNN
F 2 "" H 2750 4050 60  0000 C CNN
F 3 "" H 2750 4050 60  0000 C CNN
	1    2650 4050
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 536ECFEC
P 4750 4300
F 0 "C?" H 4800 4400 50  0000 L CNN
F 1 "100u" H 4800 4200 50  0000 L CNN
F 2 "" H 4750 4300 60  0000 C CNN
F 3 "" H 4750 4300 60  0000 C CNN
	1    4750 4300
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 536ECFF3
P 1650 4350
F 0 "C?" H 1650 4450 40  0000 L CNN
F 1 "100n" H 1656 4265 40  0000 L CNN
F 2 "" H 1688 4200 30  0000 C CNN
F 3 "" H 1650 4350 60  0000 C CNN
F 4 "Bypass cap for OpAmp" H 1650 4350 60  0001 C CNN "Note"
	1    1650 4350
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 536ECFF9
P 5200 4650
F 0 "R?" V 5280 4650 40  0000 C CNN
F 1 "1k" V 5207 4651 40  0000 C CNN
F 2 "" V 5130 4650 30  0000 C CNN
F 3 "" H 5200 4650 30  0000 C CNN
	1    5200 4650
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 536ECFFF
P 5450 4650
F 0 "C?" H 5450 4750 40  0000 L CNN
F 1 "47n" H 5456 4565 40  0000 L CNN
F 2 "" H 5488 4500 30  0000 C CNN
F 3 "" H 5450 4650 60  0000 C CNN
	1    5450 4650
	1    0    0    -1  
$EndComp
$Comp
L ZENER D?
U 1 1 536ED005
P 5200 4050
F 0 "D?" H 5200 4150 50  0000 C CNN
F 1 "ZENER" H 5200 3950 40  0000 C CNN
F 2 "" H 5200 4050 60  0000 C CNN
F 3 "" H 5200 4050 60  0000 C CNN
	1    5200 4050
	0    -1   -1   0   
$EndComp
$Comp
L DIODESCH D?
U 1 1 536ED00B
P 6100 3650
F 0 "D?" H 6100 3750 40  0000 C CNN
F 1 "DIODESCH" H 6100 3550 40  0000 C CNN
F 2 "" H 6100 3650 60  0000 C CNN
F 3 "" H 6100 3650 60  0000 C CNN
	1    6100 3650
	1    0    0    -1  
$EndComp
$Comp
L SCR_SML U?
U 1 1 536ED011
P 5750 4250
F 0 "U?" H 5850 4450 47  0000 L CNN
F 1 "SCR_SML" H 5850 4350 47  0000 L CNN
F 2 "" H 5750 4250 60  0000 C CNN
F 3 "" H 5750 4250 60  0000 C CNN
	1    5750 4250
	1    0    0    -1  
$EndComp
Connection ~ 2650 3650
Connection ~ 2150 3950
Wire Wire Line
	2250 4150 2150 4150
Wire Wire Line
	2150 4150 2150 4500
Connection ~ 2150 4350
Wire Wire Line
	2250 3950 1900 3950
Wire Wire Line
	1900 3950 1900 4100
Wire Wire Line
	4750 4100 4750 3650
Connection ~ 4750 3650
Wire Wire Line
	1650 4150 1650 3650
Connection ~ 1650 3650
Wire Wire Line
	3750 4050 3750 3950
Wire Wire Line
	2750 4350 2150 4350
Wire Wire Line
	4050 3650 4050 3350
Wire Wire Line
	4050 3350 3350 3350
Wire Wire Line
	3450 3350 3450 3050
Connection ~ 3450 3350
Wire Wire Line
	2750 3050 2750 3350
Wire Wire Line
	2150 3350 2850 3350
Connection ~ 2750 3350
Wire Wire Line
	2150 3950 2150 3350
Connection ~ 4050 3650
Connection ~ 4000 3650
Wire Wire Line
	5450 5050 5450 4850
Wire Wire Line
	5450 4450 5450 4400
Connection ~ 5450 4400
Wire Wire Line
	5200 4400 5600 4400
Wire Wire Line
	5750 4050 5750 3650
Connection ~ 5750 3650
Wire Wire Line
	5200 4250 5200 4400
Wire Wire Line
	5200 3850 5200 3650
Connection ~ 5200 3650
Connection ~ 5200 4400
Wire Wire Line
	6450 3650 6300 3650
Wire Wire Line
	3950 3650 5900 3650
Wire Wire Line
	2750 3050 2900 3050
Wire Wire Line
	3450 3050 3300 3050
Wire Wire Line
	1200 3650 3550 3650
Text HLabel 1200 3650 0    60   Input ~ 0
+18V_EXT
Wire Wire Line
	1650 4550 1650 5050
Wire Wire Line
	1900 5050 1900 4600
Wire Wire Line
	2150 5050 2150 4900
Connection ~ 1900 5050
Wire Wire Line
	2650 5050 2650 4450
Connection ~ 2150 5050
Connection ~ 2650 5050
Wire Wire Line
	4750 5050 4750 4500
Wire Wire Line
	5200 5050 5200 4900
Connection ~ 4750 5050
Connection ~ 5200 5050
Wire Wire Line
	5750 5050 5750 4450
Connection ~ 5450 5050
Connection ~ 1650 5050
Wire Wire Line
	1450 5050 6450 5050
Text HLabel 1450 5050 0    60   Input ~ 0
AGND_EXT
Text HLabel 6450 5050 2    60   Output ~ 0
AGND
Connection ~ 5750 5050
$Comp
L R R?
U 1 1 536EC9B1
P 2400 4700
F 0 "R?" V 2480 4700 40  0000 C CNN
F 1 "1k" V 2407 4701 40  0000 C CNN
F 2 "~" V 2330 4700 30  0000 C CNN
F 3 "~" H 2400 4700 30  0000 C CNN
	1    2400 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 4450 2400 4350
Connection ~ 2400 4350
Wire Wire Line
	2400 4950 2400 5050
Connection ~ 2400 5050
Wire Wire Line
	3500 2400 3500 2700
Wire Wire Line
	3350 2000 3350 2900
Wire Wire Line
	3350 2900 4200 2900
Wire Wire Line
	4200 2900 4200 4350
Wire Wire Line
	4200 4350 3250 4350
Connection ~ 3350 2000
Text Notes 2150 1950 0    60   ~ 0
+5V
Text Notes 2150 4300 0    60   ~ 0
+2V
Text Notes 8350 3250 0    60   ~ 0
UC3903?
$EndSCHEMATC
