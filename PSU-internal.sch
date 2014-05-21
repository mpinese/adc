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
Date "21 may 2014"
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
P 7700 1800
F 0 "C8" H 7750 1900 50  0000 L CNN
F 1 "470u" H 7750 1700 50  0000 L CNN
F 2 "" H 7700 1800 60  0000 C CNN
F 3 "" H 7700 1800 60  0000 C CNN
	1    7700 1800
	1    0    0    -1  
$EndComp
$Comp
L BD241A Q3
U 1 1 535FB7FB
P 3650 1400
F 0 "Q3" H 3600 1250 40  0000 R CNN
F 1 "BD241A" H 3635 1550 40  0000 R CNN
F 2 "TO-220" H 3530 1505 29  0001 C CNN
F 3 "~" H 3650 1400 60  0000 C CNN
	1    3650 1400
	0    -1   -1   0   
$EndComp
$Comp
L R R11
U 1 1 535FB82B
P 3400 1700
F 0 "R11" V 3480 1700 40  0000 C CNN
F 1 "47" V 3407 1701 40  0000 C CNN
F 2 "" V 3330 1700 30  0000 C CNN
F 3 "" H 3400 1700 30  0000 C CNN
	1    3400 1700
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 535FBC8B
P 1800 2000
F 0 "R9" V 1880 2000 40  0000 C CNN
F 1 "4.99k" V 1807 2001 40  0000 C CNN
F 2 "~" V 1730 2000 30  0000 C CNN
F 3 "~" H 1800 2000 30  0000 C CNN
	1    1800 2000
	-1   0    0    1   
$EndComp
$Comp
L R R15
U 1 1 535FBC98
P 3000 1000
F 0 "R15" V 3080 1000 40  0000 C CNN
F 1 "10k" V 3007 1001 40  0000 C CNN
F 2 "~" V 2930 1000 30  0000 C CNN
F 3 "~" H 3000 1000 30  0000 C CNN
	1    3000 1000
	0    -1   -1   0   
$EndComp
$Comp
L CP1 C14
U 1 1 535FBC9E
P 3000 700
F 0 "C14" H 3050 800 50  0000 L CNN
F 1 "47u" H 3050 600 50  0000 L CNN
F 2 "" H 3000 700 60  0000 C CNN
F 3 "" H 3000 700 60  0000 C CNN
	1    3000 700 
	0    1    1    0   
$EndComp
$Comp
L R R12
U 1 1 535FC2AB
P 2900 2000
F 0 "R12" V 2980 2000 40  0000 C CNN
F 1 "3.32k" V 2907 2001 40  0000 C CNN
F 2 "~" V 2830 2000 30  0000 C CNN
F 3 "~" H 2900 2000 30  0000 C CNN
	1    2900 2000
	0    1    1    0   
$EndComp
$Comp
L CP1 C12
U 1 1 535FC430
P 2050 2350
F 0 "C12" H 2100 2450 50  0000 L CNN
F 1 "10u" H 2100 2250 50  0000 L CNN
F 2 "" H 2050 2350 60  0000 C CNN
F 3 "" H 2050 2350 60  0000 C CNN
	1    2050 2350
	1    0    0    -1  
$EndComp
Text HLabel 7300 1300 0    60   Input ~ 0
+5V_EXT
Text HLabel 5850 1300 2    60   Output ~ 0
+15V
Text HLabel 5850 5550 2    60   Output ~ 0
AGND
Text HLabel 5850 6950 2    60   Output ~ 0
-15V
$Comp
L OPA209-SOT23 U?
U 1 1 53644510
P 2550 1700
F 0 "U?" H 2650 1950 60  0000 L CNN
F 1 "OPA209-SOT23" H 2650 1850 60  0000 L CNN
F 2 "" H 2650 1700 60  0000 C CNN
F 3 "" H 2650 1700 60  0000 C CNN
	1    2550 1700
	1    0    0    -1  
$EndComp
$Comp
L REF02 U?
U 1 1 53644B79
P 7450 4100
F 0 "U?" H 7550 3850 60  0000 L CNN
F 1 "REF02" H 7550 3750 60  0000 L CNN
F 2 "" H 7450 4150 60  0000 C CNN
F 3 "" H 7450 4150 60  0000 C CNN
	1    7450 4100
	1    0    0    -1  
$EndComp
NoConn ~ 7800 4200
NoConn ~ 7100 4200
Text HLabel 7300 2300 0    60   Input ~ 0
DGND_EXT
$Comp
L R R?
U 1 1 5365AD18
P 4600 2300
F 0 "R?" V 4680 2300 40  0000 C CNN
F 1 "1k" V 4607 2301 40  0000 C CNN
F 2 "" V 4530 2300 30  0000 C CNN
F 3 "" H 4600 2300 30  0000 C CNN
	1    4600 2300
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5365AD2E
P 4850 2300
F 0 "C?" H 4850 2400 40  0000 L CNN
F 1 "47n" H 4856 2215 40  0000 L CNN
F 2 "" H 4888 2150 30  0000 C CNN
F 3 "" H 4850 2300 60  0000 C CNN
	1    4850 2300
	1    0    0    -1  
$EndComp
$Comp
L ZENER D?
U 1 1 5365B333
P 4600 1700
F 0 "D?" H 4600 1800 50  0000 C CNN
F 1 "1N4745" H 4600 1600 40  0000 C CNN
F 2 "" H 4600 1700 60  0000 C CNN
F 3 "" H 4600 1700 60  0000 C CNN
	1    4600 1700
	0    -1   -1   0   
$EndComp
$Comp
L SCR_SML U?
U 1 1 53659485
P 5150 1900
F 0 "U?" H 5250 2100 47  0000 L CNN
F 1 "2N6507" H 5250 2000 47  0000 L CNN
F 2 "TO-220AB" H 5150 1900 60  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N6504-D.PDF" H 5150 1900 60  0001 C CNN
F 4 "2N6507GOS-ND" H 5150 1900 60  0001 C CNN "DigiKey"
	1    5150 1900
	1    0    0    -1  
$EndComp
$Comp
L OPA209-SOT23 U?
U 1 1 536899C8
P 2550 6550
F 0 "U?" H 2650 6350 60  0000 L CNN
F 1 "OPA209-SOT23" H 2650 6250 60  0000 L CNN
F 2 "" H 2650 6550 60  0000 C CNN
F 3 "" H 2650 6550 60  0000 C CNN
	1    2550 6550
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 53689A9F
P 2050 5900
F 0 "C?" H 2100 6000 50  0000 L CNN
F 1 "10u" H 2100 5800 50  0000 L CNN
F 2 "" H 2050 5900 60  0000 C CNN
F 3 "" H 2050 5900 60  0000 C CNN
	1    2050 5900
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 53689AAA
P 1800 6250
F 0 "R?" V 1880 6250 40  0000 C CNN
F 1 "4.99k" V 1807 6251 40  0000 C CNN
F 2 "~" V 1730 6250 30  0000 C CNN
F 3 "~" H 1800 6250 30  0000 C CNN
	1    1800 6250
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 53689F91
P 2900 6250
F 0 "R?" V 2980 6250 40  0000 C CNN
F 1 "3.32k" V 2907 6251 40  0000 C CNN
F 2 "~" V 2830 6250 30  0000 C CNN
F 3 "~" H 2900 6250 30  0000 C CNN
	1    2900 6250
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 53689FA7
P 3400 6550
F 0 "R?" V 3480 6550 40  0000 C CNN
F 1 "47" V 3407 6551 40  0000 C CNN
F 2 "" V 3330 6550 30  0000 C CNN
F 3 "" H 3400 6550 30  0000 C CNN
	1    3400 6550
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5368A217
P 3000 7250
F 0 "R?" V 3080 7250 40  0000 C CNN
F 1 "10k" V 3007 7251 40  0000 C CNN
F 2 "~" V 2930 7250 30  0000 C CNN
F 3 "~" H 3000 7250 30  0000 C CNN
	1    3000 7250
	0    -1   -1   0   
$EndComp
$Comp
L CP1 C?
U 1 1 5368A222
P 3000 7550
F 0 "C?" H 3050 7650 50  0000 L CNN
F 1 "47u" H 3050 7450 50  0000 L CNN
F 2 "" H 3000 7550 60  0000 C CNN
F 3 "" H 3000 7550 60  0000 C CNN
	1    3000 7550
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5368A964
P 4600 6700
F 0 "R?" V 4680 6700 40  0000 C CNN
F 1 "1k" V 4607 6701 40  0000 C CNN
F 2 "" V 4530 6700 30  0000 C CNN
F 3 "" H 4600 6700 30  0000 C CNN
	1    4600 6700
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5368A96A
P 4850 6700
F 0 "C?" H 4850 6800 40  0000 L CNN
F 1 "47n" H 4856 6615 40  0000 L CNN
F 2 "" H 4888 6550 30  0000 C CNN
F 3 "" H 4850 6700 60  0000 C CNN
	1    4850 6700
	1    0    0    -1  
$EndComp
$Comp
L ZENER D?
U 1 1 5368A970
P 4600 6100
F 0 "D?" H 4600 6200 50  0000 C CNN
F 1 "1N4745" H 4600 6000 40  0000 C CNN
F 2 "" H 4600 6100 60  0000 C CNN
F 3 "" H 4600 6100 60  0000 C CNN
	1    4600 6100
	0    -1   -1   0   
$EndComp
Text HLabel 9750 1300 2    60   Output ~ 0
+5V
Text HLabel 9750 2300 2    60   Output ~ 0
DGND
Text HLabel 1350 1300 0    60   Input ~ 0
+18V_EXT
Text HLabel 1350 5550 0    60   Input ~ 0
AGND_EXT
Text HLabel 1350 6950 0    60   Input ~ 0
-18V_EXT
$Comp
L BD242 Q?
U 1 1 536B497F
P 3650 6850
F 0 "Q?" H 3600 6700 40  0000 R CNN
F 1 "BD242" H 3650 7000 40  0000 R CNN
F 2 "TO220" H 3530 6955 29  0001 C CNN
F 3 "" H 3650 6850 60  0000 C CNN
	1    3650 6850
	0    -1   1    0   
$EndComp
Text HLabel 5850 3650 2    60   Output ~ 0
+4V
Text HLabel 1350 2700 0    60   Input ~ 0
AGND_EXT
Text HLabel 5850 2700 2    60   Output ~ 0
AGND
$Comp
L BD241A Q?
U 1 1 536ECFA7
P 3650 3750
F 0 "Q?" H 3600 3600 40  0000 R CNN
F 1 "BD241A" H 3635 3900 40  0000 R CNN
F 2 "TO-220" H 3530 3855 29  0001 C CNN
F 3 "~" H 3650 3750 60  0000 C CNN
	1    3650 3750
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 536ECFAD
P 3400 4050
F 0 "R?" V 3480 4050 40  0000 C CNN
F 1 "47" V 3407 4051 40  0000 C CNN
F 2 "" V 3330 4050 30  0000 C CNN
F 3 "" H 3400 4050 30  0000 C CNN
	1    3400 4050
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 536ECFB3
P 1800 4350
F 0 "R?" V 1880 4350 40  0000 C CNN
F 1 "4.99k" V 1807 4351 40  0000 C CNN
F 2 "~" V 1730 4350 30  0000 C CNN
F 3 "~" H 1800 4350 30  0000 C CNN
	1    1800 4350
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 536ECFB9
P 3000 3350
F 0 "R?" V 3080 3350 40  0000 C CNN
F 1 "4.99k" V 3007 3351 40  0000 C CNN
F 2 "~" V 2930 3350 30  0000 C CNN
F 3 "~" H 3000 3350 30  0000 C CNN
	1    3000 3350
	0    -1   -1   0   
$EndComp
$Comp
L CP1 C?
U 1 1 536ECFBF
P 3000 3050
F 0 "C?" H 3050 3150 50  0000 L CNN
F 1 "47u" H 3050 2950 50  0000 L CNN
F 2 "" H 3000 3050 60  0000 C CNN
F 3 "" H 3000 3050 60  0000 C CNN
	1    3000 3050
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 536ECFC5
P 2900 4350
F 0 "R?" V 2980 4350 40  0000 C CNN
F 1 "1.5k" V 2907 4351 40  0000 C CNN
F 2 "~" V 2830 4350 30  0000 C CNN
F 3 "~" H 2900 4350 30  0000 C CNN
	1    2900 4350
	0    1    1    0   
$EndComp
$Comp
L CP1 C?
U 1 1 536ECFCB
P 2050 4700
F 0 "C?" H 2100 4800 50  0000 L CNN
F 1 "47u" H 2100 4600 50  0000 L CNN
F 2 "" H 2050 4700 60  0000 C CNN
F 3 "" H 2050 4700 60  0000 C CNN
	1    2050 4700
	1    0    0    -1  
$EndComp
$Comp
L OPA209-SOT23 U?
U 1 1 536ECFD2
P 2550 4050
F 0 "U?" H 2650 4300 60  0000 L CNN
F 1 "OPA209-SOT23" H 2650 4200 60  0000 L CNN
F 2 "" H 2650 4050 60  0000 C CNN
F 3 "" H 2650 4050 60  0000 C CNN
	1    2550 4050
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 536ECFF9
P 4600 4650
F 0 "R?" V 4680 4650 40  0000 C CNN
F 1 "1k" V 4607 4651 40  0000 C CNN
F 2 "" V 4530 4650 30  0000 C CNN
F 3 "" H 4600 4650 30  0000 C CNN
	1    4600 4650
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 536ECFFF
P 4850 4650
F 0 "C?" H 4850 4750 40  0000 L CNN
F 1 "47n" H 4856 4565 40  0000 L CNN
F 2 "" H 4888 4500 30  0000 C CNN
F 3 "" H 4850 4650 60  0000 C CNN
	1    4850 4650
	1    0    0    -1  
$EndComp
$Comp
L ZENER D?
U 1 1 536ED005
P 4600 4050
F 0 "D?" H 4600 4150 50  0000 C CNN
F 1 "1N4731" H 4600 3950 40  0000 C CNN
F 2 "" H 4600 4050 60  0000 C CNN
F 3 "" H 4600 4050 60  0000 C CNN
	1    4600 4050
	0    -1   -1   0   
$EndComp
Text HLabel 1350 3650 0    60   Input ~ 0
+18V_EXT
Text HLabel 1350 5050 0    60   Input ~ 0
AGND_EXT
Text HLabel 5850 5050 2    60   Output ~ 0
AGND
$Comp
L R R?
U 1 1 536EC9B1
P 2300 4700
F 0 "R?" V 2380 4700 40  0000 C CNN
F 1 "1k" V 2307 4701 40  0000 C CNN
F 2 "~" V 2230 4700 30  0000 C CNN
F 3 "~" H 2300 4700 30  0000 C CNN
	1    2300 4700
	1    0    0    -1  
$EndComp
Text Notes 2050 1950 0    60   ~ 0
+5V
Text Notes 2050 4300 0    60   ~ 0
+2V
$Comp
L OPA209-SOT23 U?
U 1 1 5370A729
P 9650 4000
F 0 "U?" H 9750 4250 60  0000 L CNN
F 1 "OPA209-SOT23" H 9750 4150 60  0000 L CNN
F 2 "" H 9750 4000 60  0000 C CNN
F 3 "" H 9750 4000 60  0000 C CNN
	1    9650 4000
	1    0    0    -1  
$EndComp
Text HLabel 9650 3600 0    60   Input ~ 0
+18V_EXT
Text HLabel 9650 4400 0    60   Input ~ 0
-18V_EXT
$Comp
L R R?
U 1 1 5370A731
P 8800 3900
F 0 "R?" V 8880 3900 40  0000 C CNN
F 1 "1.5k" V 8807 3901 40  0000 C CNN
F 2 "~" V 8730 3900 30  0000 C CNN
F 3 "~" H 8800 3900 30  0000 C CNN
	1    8800 3900
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5370A737
P 9700 3300
F 0 "R?" V 9780 3300 40  0000 C CNN
F 1 "1.5k" V 9707 3301 40  0000 C CNN
F 2 "~" V 9630 3300 30  0000 C CNN
F 3 "~" H 9700 3300 30  0000 C CNN
	1    9700 3300
	0    1    1    0   
$EndComp
Text HLabel 8450 4200 3    60   Output ~ 0
AGND
$Comp
L R R?
U 1 1 5370A73E
P 8800 4100
F 0 "R?" V 8880 4100 40  0000 C CNN
F 1 "750" V 8807 4101 40  0000 C CNN
F 2 "~" V 8730 4100 30  0000 C CNN
F 3 "~" H 8800 4100 30  0000 C CNN
	1    8800 4100
	0    1    1    0   
$EndComp
Text Notes 2100 6200 0    60   ~ 0
-5V
Text HLabel 7450 4800 2    60   Output ~ 0
AGND
Text Label 3350 2000 0    60   ~ 0
VREF+
Text Label 8000 3650 0    60   ~ 0
VREF+
Text Label 10550 4000 0    60   ~ 0
VREF-
Text Label 4100 1300 0    60   ~ 0
+15V_INTERNAL
Text Label 7450 3400 0    60   ~ 0
+15V_INTERNAL
Text Label 3350 4350 0    60   ~ 0
VREF+
Text Label 3350 6250 0    60   ~ 0
VREF-
$Comp
L C C?
U 1 1 5370E1EF
P 8450 5750
F 0 "C?" H 8450 5850 40  0000 L CNN
F 1 "470n" H 8456 5665 40  0000 L CNN
F 2 "" H 8488 5600 30  0000 C CNN
F 3 "" H 8450 5750 60  0000 C CNN
F 4 "Bypass cap for OpAmp" H 8450 5750 60  0001 C CNN "Note"
	1    8450 5750
	1    0    0    -1  
$EndComp
Text HLabel 8300 5450 0    60   Input ~ 0
+18V_EXT
Text HLabel 8300 6050 0    60   Input ~ 0
-18V_EXT
Connection ~ 7700 1300
Connection ~ 2550 1300
Connection ~ 2050 1600
Connection ~ 2050 5550
Wire Wire Line
	2150 1800 2050 1800
Wire Wire Line
	2050 1800 2050 2150
Connection ~ 2050 2000
Connection ~ 2550 5550
Wire Wire Line
	2150 1600 1800 1600
Wire Wire Line
	1800 1600 1800 1750
Connection ~ 1800 5550
Connection ~ 4150 5550
Connection ~ 7700 2300
Wire Wire Line
	3650 1700 3650 1600
Wire Wire Line
	2650 2000 2050 2000
Wire Wire Line
	3950 1300 3950 1000
Wire Wire Line
	3950 1000 3250 1000
Wire Wire Line
	3350 1000 3350 700 
Connection ~ 3350 1000
Wire Wire Line
	2650 700  2650 1000
Wire Wire Line
	2050 1000 2750 1000
Connection ~ 2650 1000
Wire Wire Line
	2050 1600 2050 1000
Connection ~ 3950 1300
Wire Wire Line
	6850 3900 6850 3700
Wire Wire Line
	4850 2700 4850 2500
Wire Wire Line
	4850 2100 4850 2050
Connection ~ 4850 2050
Wire Wire Line
	4600 2050 5000 2050
Connection ~ 5150 5550
Wire Wire Line
	5150 1100 5150 1700
Connection ~ 4600 1300
Wire Wire Line
	4600 1900 4600 2050
Connection ~ 4600 2050
Wire Wire Line
	3850 1300 5850 1300
Wire Wire Line
	7700 2000 7700 2300
Wire Wire Line
	7700 1300 7700 1600
Wire Wire Line
	2650 700  2800 700 
Wire Wire Line
	3350 700  3200 700 
Wire Wire Line
	2650 6250 2050 6250
Wire Wire Line
	2050 6100 2050 6650
Wire Wire Line
	3250 7250 3950 7250
Wire Wire Line
	3950 7250 3950 6950
Connection ~ 3950 6950
Wire Wire Line
	1950 7250 2750 7250
Wire Wire Line
	2800 7550 2650 7550
Wire Wire Line
	2650 7550 2650 7250
Connection ~ 2650 7250
Wire Wire Line
	3200 7550 3350 7550
Wire Wire Line
	3350 7550 3350 7250
Connection ~ 3350 7250
Wire Wire Line
	4150 6500 4150 6950
Connection ~ 4150 6950
Wire Wire Line
	4850 6900 4850 6950
Connection ~ 4850 6950
Wire Wire Line
	4850 6500 4850 6450
Connection ~ 4850 6450
Connection ~ 4600 6950
Wire Wire Line
	4600 6450 5000 6450
Wire Wire Line
	4600 6300 4600 6450
Wire Wire Line
	4600 5550 4600 5900
Connection ~ 4600 6450
Wire Wire Line
	3850 6950 5850 6950
Wire Wire Line
	3650 6550 3650 6650
Connection ~ 2550 6950
Wire Wire Line
	1800 2700 1800 2250
Wire Wire Line
	2050 2700 2050 2550
Connection ~ 1800 2700
Wire Wire Line
	2550 2700 2550 2100
Connection ~ 2050 2700
Connection ~ 2550 2700
Wire Wire Line
	4600 2700 4600 2550
Connection ~ 4600 2700
Wire Wire Line
	5150 2700 5150 2100
Connection ~ 4850 2700
Connection ~ 5150 2700
Wire Wire Line
	1800 5550 1800 6000
Wire Wire Line
	2550 5550 2550 6150
Wire Wire Line
	4150 5550 4150 6100
Wire Wire Line
	5150 5550 5150 6100
Wire Wire Line
	1350 6950 3450 6950
Connection ~ 2550 3650
Connection ~ 2050 3950
Wire Wire Line
	2150 4150 2050 4150
Wire Wire Line
	2050 4150 2050 4500
Connection ~ 2050 4350
Wire Wire Line
	2150 3950 1800 3950
Wire Wire Line
	1800 3950 1800 4100
Wire Wire Line
	3650 4050 3650 3950
Wire Wire Line
	2650 4350 2050 4350
Wire Wire Line
	3950 3650 3950 3350
Wire Wire Line
	3950 3350 3250 3350
Wire Wire Line
	3350 3350 3350 3050
Connection ~ 3350 3350
Wire Wire Line
	2650 3050 2650 3350
Wire Wire Line
	2050 3350 2750 3350
Connection ~ 2650 3350
Wire Wire Line
	2050 3950 2050 3350
Connection ~ 3950 3650
Wire Wire Line
	4850 5050 4850 4850
Wire Wire Line
	4850 4450 4850 4400
Connection ~ 4850 4400
Wire Wire Line
	4600 4400 5000 4400
Wire Wire Line
	4600 4250 4600 4400
Connection ~ 4600 4400
Wire Wire Line
	3850 3650 5850 3650
Wire Wire Line
	2650 3050 2800 3050
Wire Wire Line
	3350 3050 3200 3050
Wire Wire Line
	1800 5050 1800 4600
Wire Wire Line
	2050 5050 2050 4900
Connection ~ 1800 5050
Wire Wire Line
	2550 5050 2550 4450
Connection ~ 2050 5050
Connection ~ 2550 5050
Wire Wire Line
	4600 5050 4600 4900
Connection ~ 4600 5050
Wire Wire Line
	5150 5050 5150 4450
Connection ~ 4850 5050
Connection ~ 5150 5050
Wire Wire Line
	2300 4450 2300 4350
Connection ~ 2300 4350
Wire Wire Line
	2300 4950 2300 5050
Connection ~ 2300 5050
Wire Wire Line
	9450 3300 9150 3300
Wire Wire Line
	9150 3300 9150 3900
Wire Wire Line
	9050 3900 9250 3900
Connection ~ 9150 3900
Wire Wire Line
	9050 4100 9250 4100
Wire Wire Line
	8550 4100 8450 4100
Wire Wire Line
	8000 3900 8550 3900
Wire Wire Line
	1950 6450 2150 6450
Wire Wire Line
	1950 6450 1950 7250
Wire Wire Line
	2050 6650 2150 6650
Connection ~ 2050 6250
Wire Wire Line
	1800 6500 1800 6550
Wire Wire Line
	1800 6550 1950 6550
Connection ~ 1950 6550
Connection ~ 7450 4600
Wire Wire Line
	7450 4800 7400 4800
Wire Wire Line
	7400 4800 7400 4600
Connection ~ 7400 4600
Wire Wire Line
	7450 3400 7450 3800
Wire Wire Line
	6850 4600 6850 4300
Wire Wire Line
	7450 4400 7450 4600
Wire Wire Line
	3150 2000 3350 2000
Wire Wire Line
	8000 4000 7800 4000
Wire Wire Line
	8000 4600 6850 4600
Wire Wire Line
	6850 3700 7450 3700
Wire Wire Line
	8000 3650 8000 4100
Connection ~ 8000 4000
Wire Wire Line
	8000 4600 8000 4500
Connection ~ 8000 3900
Wire Wire Line
	8450 4100 8450 4200
Wire Wire Line
	10250 4000 10550 4000
Wire Wire Line
	10350 4000 10350 3300
Wire Wire Line
	10350 3300 9950 3300
Connection ~ 10350 4000
Connection ~ 7450 3700
Wire Wire Line
	3350 4350 3150 4350
Wire Wire Line
	3150 6250 3350 6250
Wire Wire Line
	3450 1300 1350 1300
Wire Wire Line
	1350 3650 3450 3650
Wire Wire Line
	1350 2700 5850 2700
Wire Wire Line
	4150 2150 4150 2700
Connection ~ 4150 2700
Wire Wire Line
	4150 1750 4150 1300
Connection ~ 4150 1300
Wire Wire Line
	4150 4100 4150 3650
Connection ~ 4150 3650
Wire Wire Line
	1350 5050 5850 5050
Wire Wire Line
	4150 4500 4150 5050
Connection ~ 4150 5050
Wire Wire Line
	1350 5550 5850 5550
Wire Wire Line
	8300 5450 9350 5450
Wire Wire Line
	9350 5450 9350 5550
Wire Wire Line
	9050 5550 9050 5450
Connection ~ 9050 5450
Wire Wire Line
	8750 5550 8750 5450
Connection ~ 8750 5450
Wire Wire Line
	8450 5550 8450 5450
Connection ~ 8450 5450
Wire Wire Line
	8300 6050 9350 6050
Wire Wire Line
	9350 6050 9350 5950
Wire Wire Line
	9050 5950 9050 6050
Connection ~ 9050 6050
Wire Wire Line
	8750 5950 8750 6050
Connection ~ 8750 6050
Wire Wire Line
	8450 5950 8450 6050
Connection ~ 8450 6050
Wire Wire Line
	2050 5700 2050 5550
$Comp
L SCR_SML U?
U 1 1 5372E09E
P 5150 4250
F 0 "U?" H 5250 4450 47  0000 L CNN
F 1 "2N6507" H 5250 4350 47  0000 L CNN
F 2 "TO-220AB" H 5150 4250 60  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N6504-D.PDF" H 5150 4250 60  0001 C CNN
F 4 "2N6507GOS-ND" H 5150 4250 60  0001 C CNN "DigiKey"
	1    5150 4250
	1    0    0    -1  
$EndComp
$Comp
L SCR_SML U?
U 1 1 5372E0AB
P 5150 6300
F 0 "U?" H 5250 6500 47  0000 L CNN
F 1 "2N6507" H 5250 6400 47  0000 L CNN
F 2 "TO-220AB" H 5150 6300 60  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N6504-D.PDF" H 5150 6300 60  0001 C CNN
F 4 "2N6507GOS-ND" H 5150 6300 60  0001 C CNN "DigiKey"
	1    5150 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 1300 3250 1100
Wire Wire Line
	3250 1100 5150 1100
Connection ~ 3250 1300
Wire Wire Line
	3250 3450 3250 3650
Connection ~ 3250 3650
Connection ~ 4600 5550
Connection ~ 4600 3650
Wire Wire Line
	4600 1300 4600 1500
Wire Wire Line
	4600 3650 4600 3850
Wire Wire Line
	5150 3450 5150 4050
Wire Wire Line
	3250 3450 5150 3450
Wire Wire Line
	5150 6500 5150 7150
Wire Wire Line
	5150 7150 3250 7150
Wire Wire Line
	3250 7150 3250 6950
Connection ~ 3250 6950
$Comp
L R R?
U 1 1 537324DC
P 8650 2050
F 0 "R?" V 8730 2050 40  0000 C CNN
F 1 "1k" V 8657 2051 40  0000 C CNN
F 2 "" V 8580 2050 30  0000 C CNN
F 3 "" H 8650 2050 30  0000 C CNN
	1    8650 2050
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 537324E2
P 8900 2050
F 0 "C?" H 8900 2150 40  0000 L CNN
F 1 "47n" H 8906 1965 40  0000 L CNN
F 2 "" H 8938 1900 30  0000 C CNN
F 3 "" H 8900 2050 60  0000 C CNN
	1    8900 2050
	1    0    0    -1  
$EndComp
$Comp
L ZENER D?
U 1 1 537324E8
P 8650 1500
F 0 "D?" H 8650 1600 50  0000 C CNN
F 1 "1N4734" H 8650 1400 40  0000 C CNN
F 2 "" H 8650 1500 60  0000 C CNN
F 3 "" H 8650 1500 60  0000 C CNN
	1    8650 1500
	0    -1   -1   0   
$EndComp
$Comp
L SCR_SML U?
U 1 1 537324EF
P 9200 1650
F 0 "U?" H 9300 1850 47  0000 L CNN
F 1 "2N6507" H 9300 1750 47  0000 L CNN
F 2 "TO-220AB" H 9200 1650 60  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N6504-D.PDF" H 9200 1650 60  0001 C CNN
F 4 "2N6507GOS-ND" H 9200 1650 60  0001 C CNN "DigiKey"
	1    9200 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 1850 8900 1800
Connection ~ 8900 1800
Wire Wire Line
	8650 1800 9050 1800
Connection ~ 8650 1800
Wire Wire Line
	9750 1300 7300 1300
Wire Wire Line
	7300 2300 9750 2300
Wire Wire Line
	8900 2250 8900 2300
Connection ~ 8900 2300
Wire Wire Line
	9200 1850 9200 2300
Connection ~ 9200 2300
Wire Wire Line
	9200 1450 9200 1300
Connection ~ 9200 1300
Wire Wire Line
	8650 1700 8650 1800
$Comp
L C C?
U 1 1 537C45A5
P 8750 5750
F 0 "C?" H 8750 5850 40  0000 L CNN
F 1 "470n" H 8756 5665 40  0000 L CNN
F 2 "" H 8788 5600 30  0000 C CNN
F 3 "" H 8750 5750 60  0000 C CNN
F 4 "Bypass cap for OpAmp" H 8750 5750 60  0001 C CNN "Note"
	1    8750 5750
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 537C45AC
P 9050 5750
F 0 "C?" H 9050 5850 40  0000 L CNN
F 1 "470n" H 9056 5665 40  0000 L CNN
F 2 "" H 9088 5600 30  0000 C CNN
F 3 "" H 9050 5750 60  0000 C CNN
F 4 "Bypass cap for OpAmp" H 9050 5750 60  0001 C CNN "Note"
	1    9050 5750
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 537C45B3
P 9350 5750
F 0 "C?" H 9350 5850 40  0000 L CNN
F 1 "470n" H 9356 5665 40  0000 L CNN
F 2 "" H 9388 5600 30  0000 C CNN
F 3 "" H 9350 5750 60  0000 C CNN
F 4 "Bypass cap for OpAmp" H 9350 5750 60  0001 C CNN "Note"
	1    9350 5750
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 537C4758
P 4150 1950
F 0 "C?" H 4200 2050 50  0000 L CNN
F 1 "470u" H 4200 1850 50  0000 L CNN
F 2 "" H 4150 1950 60  0000 C CNN
F 3 "" H 4150 1950 60  0000 C CNN
	1    4150 1950
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 537C475E
P 4150 4300
F 0 "C?" H 4200 4400 50  0000 L CNN
F 1 "470u" H 4200 4200 50  0000 L CNN
F 2 "" H 4150 4300 60  0000 C CNN
F 3 "" H 4150 4300 60  0000 C CNN
	1    4150 4300
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 537C4764
P 4150 6300
F 0 "C?" H 4200 6400 50  0000 L CNN
F 1 "470u" H 4200 6200 50  0000 L CNN
F 2 "" H 4150 6300 60  0000 C CNN
F 3 "" H 4150 6300 60  0000 C CNN
	1    4150 6300
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 537C48FE
P 8000 4300
F 0 "C?" H 8000 4400 40  0000 L CNN
F 1 "470n" H 8006 4215 40  0000 L CNN
F 2 "" H 8038 4150 30  0000 C CNN
F 3 "" H 8000 4300 60  0000 C CNN
F 4 "Bypass cap for OpAmp" H 8000 4300 60  0001 C CNN "Note"
	1    8000 4300
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 537C4905
P 6850 4100
F 0 "C?" H 6850 4200 40  0000 L CNN
F 1 "470n" H 6856 4015 40  0000 L CNN
F 2 "" H 6888 3950 30  0000 C CNN
F 3 "" H 6850 4100 60  0000 C CNN
F 4 "Bypass cap for OpAmp" H 6850 4100 60  0001 C CNN "Note"
	1    6850 4100
	1    0    0    -1  
$EndComp
$EndSCHEMATC
