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
Sheet 5 6
Title ""
Date "21 may 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 850  3700 0    60   Input ~ 0
LIN
Text HLabel 10850 3800 2    60   Output ~ 0
ROUT
Text HLabel 6250 3700 0    60   Input ~ 0
RIN
Text HLabel 5450 3800 2    60   Output ~ 0
LOUT
$Comp
L R R?
U 1 1 536E7249
P 1450 3050
F 0 "R?" V 1530 3050 40  0000 C CNN
F 1 "12k" V 1450 3050 40  0000 C CNN
F 2 "~" V 1380 3050 30  0000 C CNN
F 3 "~" H 1450 3050 30  0000 C CNN
	1    1450 3050
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 536E7262
P 1850 2600
F 0 "R?" V 1930 2600 40  0000 C CNN
F 1 "30k" V 1857 2601 40  0000 C CNN
F 2 "~" V 1780 2600 30  0000 C CNN
F 3 "~" H 1850 2600 30  0000 C CNN
	1    1850 2600
	-1   0    0    1   
$EndComp
$Comp
L LM4562 U?
U 1 1 536E7276
P 2500 3150
F 0 "U?" H 2750 3000 60  0000 L CNN
F 1 "LM4562" H 2750 2900 60  0000 L CNN
F 2 "~" H 2600 3150 60  0000 C CNN
F 3 "~" H 2600 3150 60  0000 C CNN
	1    2500 3150
	1    0    0    -1  
$EndComp
Text HLabel 2000 3350 3    60   Input ~ 0
AGND
Text HLabel 2500 2750 0    60   Input ~ 0
+15V
Text HLabel 2500 3550 0    60   Input ~ 0
-15V
$Comp
L DIODE D?
U 1 1 536E72A5
P 2600 2550
F 0 "D?" H 2600 2650 40  0000 C CNN
F 1 "1N4148" H 2600 2450 40  0000 C CNN
F 2 "~" H 2600 2550 60  0000 C CNN
F 3 "~" H 2600 2550 60  0000 C CNN
	1    2600 2550
	1    0    0    -1  
$EndComp
$Comp
L DIODE D?
U 1 1 536E72BC
P 2900 2250
F 0 "D?" H 2900 2350 40  0000 C CNN
F 1 "1N4148" H 2900 2150 40  0000 C CNN
F 2 "~" H 2900 2250 60  0000 C CNN
F 3 "~" H 2900 2250 60  0000 C CNN
	1    2900 2250
	-1   0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 536E72D9
P 2350 2250
F 0 "R?" V 2430 2250 40  0000 C CNN
F 1 "12k" V 2357 2251 40  0000 C CNN
F 2 "~" V 2280 2250 30  0000 C CNN
F 3 "~" H 2350 2250 30  0000 C CNN
	1    2350 2250
	0    1    1    0   
$EndComp
Text HLabel 1850 2350 0    60   Input ~ 0
+15V
$Comp
L R R?
U 1 1 536E799F
P 1450 4950
F 0 "R?" V 1530 4950 40  0000 C CNN
F 1 "12k" V 1450 4950 40  0000 C CNN
F 2 "~" V 1380 4950 30  0000 C CNN
F 3 "~" H 1450 4950 30  0000 C CNN
	1    1450 4950
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 536E79A5
P 1850 5400
F 0 "R?" V 1930 5400 40  0000 C CNN
F 1 "30k" V 1857 5401 40  0000 C CNN
F 2 "~" V 1780 5400 30  0000 C CNN
F 3 "~" H 1850 5400 30  0000 C CNN
	1    1850 5400
	-1   0    0    1   
$EndComp
$Comp
L LM4562 U?
U 2 1 536E79AB
P 2500 5050
F 0 "U?" H 2750 4900 60  0000 L CNN
F 1 "LM4562" H 2750 4800 60  0000 L CNN
F 2 "~" H 2600 5050 60  0000 C CNN
F 3 "~" H 2600 5050 60  0000 C CNN
	2    2500 5050
	1    0    0    -1  
$EndComp
Text HLabel 2000 5250 3    60   Input ~ 0
AGND
Text HLabel 2500 4650 0    60   Input ~ 0
+15V
Text HLabel 2500 5450 0    60   Input ~ 0
-15V
$Comp
L DIODE D?
U 1 1 536E79B4
P 2600 4450
F 0 "D?" H 2600 4550 40  0000 C CNN
F 1 "1N4148" H 2600 4350 40  0000 C CNN
F 2 "~" H 2600 4450 60  0000 C CNN
F 3 "~" H 2600 4450 60  0000 C CNN
	1    2600 4450
	1    0    0    -1  
$EndComp
$Comp
L DIODE D?
U 1 1 536E79BA
P 2900 4150
F 0 "D?" H 2900 4250 40  0000 C CNN
F 1 "1N4148" H 2900 4050 40  0000 C CNN
F 2 "~" H 2900 4150 60  0000 C CNN
F 3 "~" H 2900 4150 60  0000 C CNN
	1    2900 4150
	-1   0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 536E79C0
P 2350 4150
F 0 "R?" V 2430 4150 40  0000 C CNN
F 1 "12k" V 2357 4151 40  0000 C CNN
F 2 "~" V 2280 4150 30  0000 C CNN
F 3 "~" H 2350 4150 30  0000 C CNN
	1    2350 4150
	0    1    1    0   
$EndComp
Text HLabel 1850 5650 0    60   Input ~ 0
-15V
$Comp
L LM4562 U?
U 2 1 536E7B83
P 4650 3800
F 0 "U?" H 4900 3650 60  0000 L CNN
F 1 "LM4562" H 4900 3550 60  0000 L CNN
F 2 "~" H 4750 3800 60  0000 C CNN
F 3 "~" H 4750 3800 60  0000 C CNN
	2    4650 3800
	1    0    0    -1  
$EndComp
Text HLabel 4150 4000 3    60   Input ~ 0
AGND
$Comp
L R R?
U 1 1 536E7BF7
P 4750 3200
F 0 "R?" V 4830 3200 40  0000 C CNN
F 1 "1k" V 4757 3201 40  0000 C CNN
F 2 "~" V 4680 3200 30  0000 C CNN
F 3 "~" H 4750 3200 30  0000 C CNN
	1    4750 3200
	0    -1   -1   0   
$EndComp
Text HLabel 4650 3400 0    60   Input ~ 0
+15V
Text HLabel 4650 4200 0    60   Input ~ 0
-15V
$Comp
L R R?
U 1 1 536E8357
P 6850 3050
F 0 "R?" V 6930 3050 40  0000 C CNN
F 1 "12k" V 6850 3050 40  0000 C CNN
F 2 "~" V 6780 3050 30  0000 C CNN
F 3 "~" H 6850 3050 30  0000 C CNN
	1    6850 3050
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 536E835D
P 7250 2600
F 0 "R?" V 7330 2600 40  0000 C CNN
F 1 "30k" V 7257 2601 40  0000 C CNN
F 2 "~" V 7180 2600 30  0000 C CNN
F 3 "~" H 7250 2600 30  0000 C CNN
	1    7250 2600
	-1   0    0    1   
$EndComp
$Comp
L LM4562 U?
U 1 1 536E8363
P 7900 3150
F 0 "U?" H 8150 3000 60  0000 L CNN
F 1 "LM4562" H 8150 2900 60  0000 L CNN
F 2 "~" H 8000 3150 60  0000 C CNN
F 3 "~" H 8000 3150 60  0000 C CNN
	1    7900 3150
	1    0    0    -1  
$EndComp
Text HLabel 7400 3350 3    60   Input ~ 0
AGND
Text HLabel 7900 2750 0    60   Input ~ 0
+15V
Text HLabel 7900 3550 0    60   Input ~ 0
-15V
$Comp
L DIODE D?
U 1 1 536E836C
P 8000 2550
F 0 "D?" H 8000 2650 40  0000 C CNN
F 1 "1N4148" H 8000 2450 40  0000 C CNN
F 2 "~" H 8000 2550 60  0000 C CNN
F 3 "~" H 8000 2550 60  0000 C CNN
	1    8000 2550
	1    0    0    -1  
$EndComp
$Comp
L DIODE D?
U 1 1 536E8372
P 8300 2250
F 0 "D?" H 8300 2350 40  0000 C CNN
F 1 "1N4148" H 8300 2150 40  0000 C CNN
F 2 "~" H 8300 2250 60  0000 C CNN
F 3 "~" H 8300 2250 60  0000 C CNN
	1    8300 2250
	-1   0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 536E8378
P 7750 2250
F 0 "R?" V 7830 2250 40  0000 C CNN
F 1 "12k" V 7757 2251 40  0000 C CNN
F 2 "~" V 7680 2250 30  0000 C CNN
F 3 "~" H 7750 2250 30  0000 C CNN
	1    7750 2250
	0    1    1    0   
$EndComp
Text HLabel 7250 2350 0    60   Input ~ 0
+15V
$Comp
L R R?
U 1 1 536E8391
P 6850 4950
F 0 "R?" V 6930 4950 40  0000 C CNN
F 1 "12k" V 6850 4950 40  0000 C CNN
F 2 "~" V 6780 4950 30  0000 C CNN
F 3 "~" H 6850 4950 30  0000 C CNN
	1    6850 4950
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 536E8397
P 7250 5400
F 0 "R?" V 7330 5400 40  0000 C CNN
F 1 "30k" V 7257 5401 40  0000 C CNN
F 2 "~" V 7180 5400 30  0000 C CNN
F 3 "~" H 7250 5400 30  0000 C CNN
	1    7250 5400
	-1   0    0    1   
$EndComp
$Comp
L LM4562 U?
U 2 1 536E839D
P 7900 5050
F 0 "U?" H 8150 4900 60  0000 L CNN
F 1 "LM4562" H 8150 4800 60  0000 L CNN
F 2 "~" H 8000 5050 60  0000 C CNN
F 3 "~" H 8000 5050 60  0000 C CNN
	2    7900 5050
	1    0    0    -1  
$EndComp
Text HLabel 7400 5250 3    60   Input ~ 0
AGND
Text HLabel 7900 4650 0    60   Input ~ 0
+15V
Text HLabel 7900 5450 0    60   Input ~ 0
-15V
$Comp
L DIODE D?
U 1 1 536E83A6
P 8000 4450
F 0 "D?" H 8000 4550 40  0000 C CNN
F 1 "1N4148" H 8000 4350 40  0000 C CNN
F 2 "~" H 8000 4450 60  0000 C CNN
F 3 "~" H 8000 4450 60  0000 C CNN
	1    8000 4450
	1    0    0    -1  
$EndComp
$Comp
L DIODE D?
U 1 1 536E83AC
P 8300 4150
F 0 "D?" H 8300 4250 40  0000 C CNN
F 1 "1N4148" H 8300 4050 40  0000 C CNN
F 2 "~" H 8300 4150 60  0000 C CNN
F 3 "~" H 8300 4150 60  0000 C CNN
	1    8300 4150
	-1   0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 536E83B2
P 7750 4150
F 0 "R?" V 7830 4150 40  0000 C CNN
F 1 "12k" V 7757 4151 40  0000 C CNN
F 2 "~" V 7680 4150 30  0000 C CNN
F 3 "~" H 7750 4150 30  0000 C CNN
	1    7750 4150
	0    1    1    0   
$EndComp
Text HLabel 7250 5650 0    60   Input ~ 0
-15V
$Comp
L LM4562 U?
U 2 1 536E83E9
P 10050 3800
F 0 "U?" H 10300 3650 60  0000 L CNN
F 1 "LM4562" H 10300 3550 60  0000 L CNN
F 2 "~" H 10150 3800 60  0000 C CNN
F 3 "~" H 10150 3800 60  0000 C CNN
	2    10050 3800
	1    0    0    -1  
$EndComp
Text HLabel 9550 4000 3    60   Input ~ 0
AGND
Text HLabel 10050 3400 0    60   Input ~ 0
+15V
Text HLabel 10050 4200 0    60   Input ~ 0
-15V
Text Notes 4950 1100 0    60   ~ 0
Set to clip at +/- 6 V
$Comp
L C C?
U 1 1 536EC1E0
P 5450 1700
F 0 "C?" H 5450 1800 40  0000 L CNN
F 1 "470n" H 5456 1615 40  0000 L CNN
F 2 "~" H 5488 1550 30  0000 C CNN
F 3 "~" H 5450 1700 60  0000 C CNN
F 4 "Ceramic" H 5450 1700 60  0001 C CNN "Type"
	1    5450 1700
	1    0    0    -1  
$EndComp
Text HLabel 5250 1500 0    60   Input ~ 0
+15V
Text HLabel 5250 2300 0    60   Input ~ 0
-15V
Text HLabel 5250 1900 0    60   Input ~ 0
AGND
Wire Wire Line
	1850 2850 1850 3050
Connection ~ 1850 3050
Wire Wire Line
	2100 2250 2000 2250
Wire Wire Line
	2000 2250 2000 3050
Connection ~ 2000 3050
Connection ~ 2000 2550
Wire Wire Line
	2100 3050 1700 3050
Wire Wire Line
	1200 3050 1100 3050
Wire Wire Line
	2700 2250 2600 2250
Connection ~ 2650 2250
Wire Wire Line
	2650 2100 2650 2250
Wire Wire Line
	3100 2250 3200 2250
Wire Wire Line
	3200 2250 3200 3150
Wire Wire Line
	3200 3150 3100 3150
Wire Wire Line
	2400 2550 2000 2550
Wire Wire Line
	2800 2550 3200 2550
Connection ~ 3200 2550
Wire Wire Line
	3350 3400 3350 2100
Wire Wire Line
	3350 2100 2650 2100
Wire Wire Line
	3850 3400 3950 3400
Wire Wire Line
	3950 3400 3950 4000
Connection ~ 1100 3700
Wire Wire Line
	1100 3050 1100 3700
Connection ~ 3950 3700
Wire Wire Line
	2100 4150 2000 4150
Wire Wire Line
	2000 4150 2000 4950
Connection ~ 2000 4950
Connection ~ 2000 4450
Wire Wire Line
	2100 4950 1700 4950
Wire Wire Line
	1050 4950 1200 4950
Wire Wire Line
	2700 4150 2600 4150
Connection ~ 2650 4150
Wire Wire Line
	2650 4000 2650 4150
Wire Wire Line
	3100 4150 3200 4150
Wire Wire Line
	3200 4150 3200 5050
Wire Wire Line
	3200 5050 3100 5050
Wire Wire Line
	2400 4450 2000 4450
Wire Wire Line
	2800 4450 3200 4450
Connection ~ 3200 4450
Wire Wire Line
	3350 4000 2650 4000
Wire Wire Line
	1050 3700 1050 4950
Connection ~ 1050 3700
Connection ~ 1850 4950
Wire Wire Line
	2000 5150 2100 5150
Wire Wire Line
	1850 5150 1850 4950
Wire Wire Line
	2100 3250 2000 3250
Wire Wire Line
	2000 3250 2000 3350
Wire Wire Line
	2000 5150 2000 5250
Wire Wire Line
	4250 3900 4150 3900
Wire Wire Line
	4150 3900 4150 4000
Wire Wire Line
	4150 3700 4150 3200
Connection ~ 4150 3700
Wire Wire Line
	4150 3200 4500 3200
Connection ~ 5250 3800
Wire Wire Line
	3950 4000 3850 4000
Wire Wire Line
	5250 3800 5250 3200
Wire Wire Line
	5250 3200 5000 3200
Wire Wire Line
	5450 3800 5250 3800
Wire Wire Line
	3850 3700 4250 3700
Wire Wire Line
	7250 2850 7250 3050
Connection ~ 7250 3050
Wire Wire Line
	7500 2250 7400 2250
Wire Wire Line
	7400 2250 7400 3050
Connection ~ 7400 3050
Connection ~ 7400 2550
Wire Wire Line
	7500 3050 7100 3050
Wire Wire Line
	6600 3050 6500 3050
Wire Wire Line
	8100 2250 8000 2250
Connection ~ 8050 2250
Wire Wire Line
	8050 2100 8050 2250
Wire Wire Line
	8500 2250 8600 2250
Wire Wire Line
	8600 2250 8600 3150
Wire Wire Line
	8600 3150 8500 3150
Wire Wire Line
	7800 2550 7400 2550
Wire Wire Line
	8200 2550 8600 2550
Connection ~ 8600 2550
Wire Wire Line
	8750 3400 8750 2100
Wire Wire Line
	8750 2100 8050 2100
Wire Wire Line
	9250 3400 9350 3400
Wire Wire Line
	9350 3400 9350 4000
Connection ~ 6500 3700
Wire Wire Line
	6500 3050 6500 3700
Connection ~ 9350 3700
Wire Wire Line
	7500 4150 7400 4150
Wire Wire Line
	7400 4150 7400 4950
Connection ~ 7400 4950
Connection ~ 7400 4450
Wire Wire Line
	7500 4950 7100 4950
Wire Wire Line
	6450 4950 6600 4950
Wire Wire Line
	8100 4150 8000 4150
Connection ~ 8050 4150
Wire Wire Line
	8050 4000 8050 4150
Wire Wire Line
	8500 4150 8600 4150
Wire Wire Line
	8600 4150 8600 5050
Wire Wire Line
	8600 5050 8500 5050
Wire Wire Line
	7800 4450 7400 4450
Wire Wire Line
	8200 4450 8600 4450
Connection ~ 8600 4450
Wire Wire Line
	8750 4000 8050 4000
Wire Wire Line
	6450 3700 6450 4950
Connection ~ 6450 3700
Connection ~ 7250 4950
Wire Wire Line
	7400 5150 7500 5150
Wire Wire Line
	7250 5150 7250 4950
Wire Wire Line
	7500 3250 7400 3250
Wire Wire Line
	7400 3250 7400 3350
Wire Wire Line
	7400 5150 7400 5250
Wire Wire Line
	9650 3900 9550 3900
Wire Wire Line
	9550 3900 9550 4000
Wire Wire Line
	9550 3700 9550 3200
Connection ~ 9550 3700
Wire Wire Line
	9550 3200 9900 3200
Connection ~ 10650 3800
Wire Wire Line
	9350 4000 9250 4000
Wire Wire Line
	10650 3800 10650 3200
Wire Wire Line
	10650 3200 10400 3200
Wire Wire Line
	10850 3800 10650 3800
Wire Wire Line
	9250 3700 9650 3700
Wire Wire Line
	850  3700 3350 3700
Wire Wire Line
	8750 3700 6250 3700
Connection ~ 5450 1900
Connection ~ 5800 1900
Wire Wire Line
	5250 1500 5800 1500
Connection ~ 5450 1500
Wire Wire Line
	5250 2300 5800 2300
Connection ~ 5450 2300
Wire Wire Line
	5250 1900 5800 1900
$Comp
L C C?
U 1 1 537C3D88
P 5800 1700
F 0 "C?" H 5800 1800 40  0000 L CNN
F 1 "470n" H 5806 1615 40  0000 L CNN
F 2 "~" H 5838 1550 30  0000 C CNN
F 3 "~" H 5800 1700 60  0000 C CNN
F 4 "Ceramic" H 5800 1700 60  0001 C CNN "Type"
	1    5800 1700
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 537C3D8F
P 5450 2100
F 0 "C?" H 5450 2200 40  0000 L CNN
F 1 "470n" H 5456 2015 40  0000 L CNN
F 2 "~" H 5488 1950 30  0000 C CNN
F 3 "~" H 5450 2100 60  0000 C CNN
F 4 "Ceramic" H 5450 2100 60  0001 C CNN "Type"
	1    5450 2100
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 537C3D96
P 5800 2100
F 0 "C?" H 5800 2200 40  0000 L CNN
F 1 "470n" H 5806 2015 40  0000 L CNN
F 2 "~" H 5838 1950 30  0000 C CNN
F 3 "~" H 5800 2100 60  0000 C CNN
F 4 "Ceramic" H 5800 2100 60  0001 C CNN "Type"
	1    5800 2100
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 537C500E
P 3600 3400
F 0 "R?" V 3680 3400 40  0000 C CNN
F 1 "1k" V 3607 3401 40  0000 C CNN
F 2 "~" V 3530 3400 30  0000 C CNN
F 3 "~" H 3600 3400 30  0000 C CNN
	1    3600 3400
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 537C5014
P 3600 3700
F 0 "R?" V 3680 3700 40  0000 C CNN
F 1 "1k" V 3607 3701 40  0000 C CNN
F 2 "~" V 3530 3700 30  0000 C CNN
F 3 "~" H 3600 3700 30  0000 C CNN
	1    3600 3700
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 537C501A
P 3600 4000
F 0 "R?" V 3680 4000 40  0000 C CNN
F 1 "1k" V 3607 4001 40  0000 C CNN
F 2 "~" V 3530 4000 30  0000 C CNN
F 3 "~" H 3600 4000 30  0000 C CNN
	1    3600 4000
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 537C5020
P 9000 3400
F 0 "R?" V 9080 3400 40  0000 C CNN
F 1 "1k" V 9007 3401 40  0000 C CNN
F 2 "~" V 8930 3400 30  0000 C CNN
F 3 "~" H 9000 3400 30  0000 C CNN
	1    9000 3400
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 537C5026
P 9000 3700
F 0 "R?" V 9080 3700 40  0000 C CNN
F 1 "1k" V 9007 3701 40  0000 C CNN
F 2 "~" V 8930 3700 30  0000 C CNN
F 3 "~" H 9000 3700 30  0000 C CNN
	1    9000 3700
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 537C502C
P 9000 4000
F 0 "R?" V 9080 4000 40  0000 C CNN
F 1 "1k" V 9007 4001 40  0000 C CNN
F 2 "~" V 8930 4000 30  0000 C CNN
F 3 "~" H 9000 4000 30  0000 C CNN
	1    9000 4000
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 537C5032
P 10150 3200
F 0 "R?" V 10230 3200 40  0000 C CNN
F 1 "1k" V 10157 3201 40  0000 C CNN
F 2 "~" V 10080 3200 30  0000 C CNN
F 3 "~" H 10150 3200 30  0000 C CNN
	1    10150 3200
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
