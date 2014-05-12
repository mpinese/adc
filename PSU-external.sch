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
Sheet 3 6
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
L CP1 C?
U 1 1 53688F81
P 7200 5100
F 0 "C?" H 7250 5200 50  0000 L CNN
F 1 "5600u" H 7250 5000 50  0000 L CNN
F 2 "" H 7200 5100 60  0000 C CNN
F 3 "" H 7200 5100 60  0000 C CNN
	1    7200 5100
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 53688F85
P 7550 5100
F 0 "C?" H 7550 5200 40  0000 L CNN
F 1 "100n" H 7556 5015 40  0000 L CNN
F 2 "~" H 7588 4950 30  0000 C CNN
F 3 "~" H 7550 5100 60  0000 C CNN
	1    7550 5100
	1    0    0    -1  
$EndComp
Text HLabel 8850 1050 2    60   Output ~ 0
+5V_EXT
Text HLabel 8850 4550 2    60   Output ~ 0
+18V_EXT
Text HLabel 8850 5600 2    60   Output ~ 0
AGND_EXT
Text HLabel 8850 6650 2    60   Output ~ 0
-18V_EXT
$Comp
L MC7805C U?
U 1 1 53688F96
P 8000 1100
F 0 "U?" H 7800 1300 40  0000 C CNN
F 1 "MC7805C" H 8000 1300 40  0000 L CNN
F 2 "TO-220" H 8000 1200 30  0000 C CIN
F 3 "" H 8000 1100 60  0000 C CNN
	1    8000 1100
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 53688F97
P 7150 1550
F 0 "C?" H 7200 1650 50  0000 L CNN
F 1 "2700u" H 7200 1450 50  0000 L CNN
F 2 "" H 7150 1550 60  0000 C CNN
F 3 "" H 7150 1550 60  0000 C CNN
	1    7150 1550
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 53688F98
P 7550 1550
F 0 "C?" H 7550 1650 40  0000 L CNN
F 1 "100n" H 7556 1465 40  0000 L CNN
F 2 "~" H 7588 1400 30  0000 C CNN
F 3 "~" H 7550 1550 60  0000 C CNN
	1    7550 1550
	1    0    0    -1  
$EndComp
Text HLabel 8850 2050 2    60   Output ~ 0
DGND_EXT
Text Notes 8600 4500 0    60   ~ 0
+18V
Text Notes 6950 4500 0    60   ~ 0
+20.5V min
$Comp
L CP1 C?
U 1 1 53688FA0
P 7200 6050
F 0 "C?" H 7250 6150 50  0000 L CNN
F 1 "5600u" H 7250 5950 50  0000 L CNN
F 2 "" H 7200 6050 60  0000 C CNN
F 3 "" H 7200 6050 60  0000 C CNN
	1    7200 6050
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 53688FA4
P 7550 6050
F 0 "C?" H 7550 6150 40  0000 L CNN
F 1 "100n" H 7556 5965 40  0000 L CNN
F 2 "~" H 7588 5900 30  0000 C CNN
F 3 "~" H 7550 6050 60  0000 C CNN
	1    7550 6050
	1    0    0    -1  
$EndComp
Text HLabel 8850 3400 2    60   Output ~ 0
SAF_GND
$Comp
L DIODE D?
U 1 1 5368E09A
P 6750 1250
F 0 "D?" H 6750 1350 40  0000 C CNN
F 1 "1N4001" H 6750 1150 40  0000 C CNN
F 2 "~" H 6750 1250 60  0000 C CNN
F 3 "~" H 6750 1250 60  0000 C CNN
	1    6750 1250
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D?
U 1 1 5368E121
P 6400 1250
F 0 "D?" H 6400 1350 40  0000 C CNN
F 1 "1N4001" H 6400 1150 40  0000 C CNN
F 2 "~" H 6400 1250 60  0000 C CNN
F 3 "~" H 6400 1250 60  0000 C CNN
	1    6400 1250
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D?
U 1 1 5368E163
P 6400 1850
F 0 "D?" H 6400 1950 40  0000 C CNN
F 1 "1N4001" H 6400 1750 40  0000 C CNN
F 2 "~" H 6400 1850 60  0000 C CNN
F 3 "~" H 6400 1850 60  0000 C CNN
	1    6400 1850
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D?
U 1 1 5368E169
P 6750 1850
F 0 "D?" H 6750 1950 40  0000 C CNN
F 1 "1N4001" H 6750 1750 40  0000 C CNN
F 2 "~" H 6750 1850 60  0000 C CNN
F 3 "~" H 6750 1850 60  0000 C CNN
	1    6750 1850
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D?
U 1 1 5368E721
P 6450 4750
F 0 "D?" H 6450 4850 40  0000 C CNN
F 1 "RL205" H 6450 4650 40  0000 C CNN
F 2 "~" H 6450 4750 60  0000 C CNN
F 3 "~" H 6450 4750 60  0000 C CNN
	1    6450 4750
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D?
U 1 1 5368E7AB
P 6800 4750
F 0 "D?" H 6800 4850 40  0000 C CNN
F 1 "RL205" H 6800 4650 40  0000 C CNN
F 2 "~" H 6800 4750 60  0000 C CNN
F 3 "~" H 6800 4750 60  0000 C CNN
	1    6800 4750
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D?
U 1 1 5368E7B1
P 6450 6450
F 0 "D?" H 6450 6550 40  0000 C CNN
F 1 "RL205" H 6450 6350 40  0000 C CNN
F 2 "~" H 6450 6450 60  0000 C CNN
F 3 "~" H 6450 6450 60  0000 C CNN
	1    6450 6450
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D?
U 1 1 5368E7B7
P 6800 6450
F 0 "D?" H 6800 6550 40  0000 C CNN
F 1 "RL205" H 6800 6350 40  0000 C CNN
F 2 "~" H 6800 6450 60  0000 C CNN
F 3 "~" H 6800 6450 60  0000 C CNN
	1    6800 6450
	0    -1   -1   0   
$EndComp
$Comp
L C C?
U 1 1 536984D3
P 6200 5300
F 0 "C?" H 6200 5400 40  0000 L CNN
F 1 "C" H 6206 5215 40  0000 L CNN
F 2 "~" H 6238 5150 30  0000 C CNN
F 3 "~" H 6200 5300 60  0000 C CNN
	1    6200 5300
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 536984E2
P 6200 5900
F 0 "R?" V 6280 5900 40  0000 C CNN
F 1 "R" V 6207 5901 40  0000 C CNN
F 2 "~" V 6130 5900 30  0000 C CNN
F 3 "~" H 6200 5900 30  0000 C CNN
	1    6200 5900
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5369950E
P 5800 1250
F 0 "C?" H 5800 1350 40  0000 L CNN
F 1 "C" H 5806 1165 40  0000 L CNN
F 2 "~" H 5838 1100 30  0000 C CNN
F 3 "~" H 5800 1250 60  0000 C CNN
	1    5800 1250
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 53699514
P 5800 1800
F 0 "R?" V 5880 1800 40  0000 C CNN
F 1 "R" V 5807 1801 40  0000 C CNN
F 2 "~" V 5730 1800 30  0000 C CNN
F 3 "~" H 5800 1800 30  0000 C CNN
	1    5800 1800
	1    0    0    -1  
$EndComp
Connection ~ 7200 5600
Connection ~ 7200 4550
Wire Wire Line
	7200 4900 7200 4550
Connection ~ 8000 5600
Wire Wire Line
	7550 4900 7550 4550
Connection ~ 7550 4550
Connection ~ 7550 5600
Connection ~ 8000 2050
Connection ~ 7150 1050
Connection ~ 7150 2050
Connection ~ 7550 1050
Connection ~ 7550 2050
Wire Wire Line
	8400 1050 8850 1050
Connection ~ 7200 6650
Connection ~ 7550 6650
Wire Wire Line
	7550 1750 7550 2050
Wire Wire Line
	7150 1750 7150 2050
Wire Wire Line
	8000 1350 8000 2050
Wire Wire Line
	7550 1350 7550 1050
Wire Wire Line
	7150 1050 7150 1350
Connection ~ 5000 5600
Wire Wire Line
	7550 6250 7550 6650
Wire Wire Line
	7200 6250 7200 6650
Connection ~ 6750 1050
Connection ~ 6750 2050
Wire Wire Line
	6400 1450 6400 1650
Wire Wire Line
	6750 1450 6750 1650
Connection ~ 6400 1500
Connection ~ 6750 1600
Wire Wire Line
	5000 5500 5000 5700
Connection ~ 6800 4550
Connection ~ 6800 6650
Wire Wire Line
	6450 4550 7600 4550
Wire Wire Line
	6450 6650 7600 6650
Connection ~ 6800 5100
Wire Wire Line
	5800 1450 5800 1550
Wire Wire Line
	5000 1050 6150 1050
Wire Wire Line
	5000 2050 6150 2050
Wire Wire Line
	6150 1050 6150 1500
Wire Wire Line
	6150 1500 6400 1500
Connection ~ 5800 1050
Wire Wire Line
	6150 2050 6150 1600
Wire Wire Line
	6150 1600 6750 1600
Connection ~ 5800 2050
Wire Wire Line
	7600 1050 6400 1050
Wire Wire Line
	6400 2050 8850 2050
$Comp
L TRIAD-FS48-750-C2 T?
U 1 1 5369B344
P 4600 5600
F 0 "T?" H 4600 6100 70  0000 C CNN
F 1 "TRIAD-FS48-750-C2" H 4600 5100 70  0000 C CNN
F 2 "" H 4600 5600 60  0000 C CNN
F 3 "" H 4600 5600 60  0000 C CNN
F 4 "237-1485-ND" H 4600 5600 60  0001 C CNN "DigiKey"
	1    4600 5600
	1    0    0    -1  
$EndComp
$Comp
L TRIAD-FS16-400-C2 T?
U 1 1 5369B6AF
P 4600 1550
F 0 "T?" H 4600 2050 70  0000 C CNN
F 1 "TRIAD-FS16-400-C2" H 4600 1050 70  0000 C CNN
F 2 "" H 4600 1550 60  0000 C CNN
F 3 "" H 4600 1550 60  0000 C CNN
	1    4600 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 1950 5000 2050
Wire Wire Line
	5000 1150 5000 1050
Wire Wire Line
	5000 1450 5000 1650
$Comp
L SMP50 U?
U 1 1 5369B910
P 5100 3000
F 0 "U?" H 5250 2900 60  0000 L CNN
F 1 "SMP50" H 5250 2800 60  0000 L CNN
F 2 "" H 5100 3050 60  0000 C CNN
F 3 "" H 5100 3050 60  0000 C CNN
F 4 "497-6526-1-ND" H 5100 3000 60  0001 C CNN "DigiKey"
	1    5100 3000
	1    0    0    -1  
$EndComp
$Comp
L IEC-C13-SOCKET J?
U 1 1 5369A60D
P 2600 4500
F 0 "J?" H 2350 3800 60  0000 L CNN
F 1 "IEC-C13-SOCKET" H 2350 3700 60  0000 L CNN
F 2 "~" H 2550 4900 60  0000 C CNN
F 3 "~" H 2550 4900 60  0000 C CNN
	1    2600 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 1150 3100 1150
Wire Wire Line
	3100 1150 3100 5200
Wire Wire Line
	3300 1450 3300 5500
Wire Wire Line
	3300 1450 4200 1450
Wire Wire Line
	3500 1650 3500 5700
Wire Wire Line
	3500 1650 4200 1650
Wire Wire Line
	3700 1950 3700 6000
Wire Wire Line
	3700 1950 4200 1950
Wire Wire Line
	3100 5200 4200 5200
Wire Wire Line
	3300 5500 4200 5500
Wire Wire Line
	3500 5700 4200 5700
Wire Wire Line
	3700 6000 4200 6000
Wire Wire Line
	2150 3400 2150 4900
Wire Wire Line
	3000 4750 3100 4750
Connection ~ 3100 4750
Wire Wire Line
	3000 4850 3300 4850
Connection ~ 3300 4850
Wire Wire Line
	3000 4950 3500 4950
Connection ~ 3500 4950
Wire Wire Line
	3000 5050 3700 5050
Connection ~ 3700 5050
Text Notes 850  7500 0    60   ~ 0
* 100 nF needed?
$Comp
L LM7918CT U?
U 1 1 5369BF38
P 8000 6600
F 0 "U?" H 7800 6400 40  0000 C CNN
F 1 "LM7918CT" H 8000 6400 40  0000 L CNN
F 2 "TO-220" H 8000 6500 30  0000 C CIN
F 3 "~" H 8000 6600 60  0000 C CNN
	1    8000 6600
	1    0    0    -1  
$EndComp
$Comp
L LM7818CT U?
U 1 1 5369BF47
P 8000 4600
F 0 "U?" H 7800 4800 40  0000 C CNN
F 1 "LM7818CT" H 8000 4800 40  0000 L CNN
F 2 "TO-220" H 8000 4700 30  0000 C CIN
F 3 "~" H 8000 4600 60  0000 C CNN
	1    8000 4600
	1    0    0    -1  
$EndComp
$Comp
L DIODE D?
U 1 1 5369C01A
P 8000 700
F 0 "D?" H 8000 800 40  0000 C CNN
F 1 "1N4001" H 8000 600 40  0000 C CNN
F 2 "~" H 8000 700 60  0000 C CNN
F 3 "~" H 8000 700 60  0000 C CNN
	1    8000 700 
	-1   0    0    1   
$EndComp
Wire Wire Line
	8200 700  8500 700 
Wire Wire Line
	8500 700  8500 1050
Connection ~ 8500 1050
Wire Wire Line
	7800 700  7450 700 
Wire Wire Line
	7450 700  7450 1050
Connection ~ 7450 1050
$Comp
L DIODE D?
U 1 1 5369C0E9
P 8000 4200
F 0 "D?" H 8000 4300 40  0000 C CNN
F 1 "1N4001" H 8000 4100 40  0000 C CNN
F 2 "~" H 8000 4200 60  0000 C CNN
F 3 "~" H 8000 4200 60  0000 C CNN
	1    8000 4200
	-1   0    0    1   
$EndComp
Wire Wire Line
	7800 4200 7450 4200
Wire Wire Line
	7450 4200 7450 4550
Connection ~ 7450 4550
Wire Wire Line
	8200 4200 8500 4200
Wire Wire Line
	8500 4200 8500 4550
Connection ~ 8500 4550
$Comp
L DIODE D?
U 1 1 5369C1C4
P 8000 7000
F 0 "D?" H 8000 7100 40  0000 C CNN
F 1 "1N4001" H 8000 6900 40  0000 C CNN
F 2 "~" H 8000 7000 60  0000 C CNN
F 3 "~" H 8000 7000 60  0000 C CNN
	1    8000 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 6650 7450 7000
Wire Wire Line
	7450 7000 7800 7000
Connection ~ 7450 6650
Wire Wire Line
	8500 6650 8500 7000
Wire Wire Line
	8500 7000 8200 7000
Connection ~ 8500 6650
$Comp
L CP1 C?
U 1 1 5369C418
P 8450 5100
F 0 "C?" H 8500 5200 50  0000 L CNN
F 1 "1u" H 8500 5000 50  0000 L CNN
F 2 "" H 8450 5100 60  0000 C CNN
F 3 "" H 8450 5100 60  0000 C CNN
	1    8450 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 4550 8450 4900
Connection ~ 8450 4550
Connection ~ 8450 5600
$Comp
L CP1 C?
U 1 1 5369C517
P 8450 6050
F 0 "C?" H 8500 6150 50  0000 L CNN
F 1 "1u" H 8500 5950 50  0000 L CNN
F 2 "" H 8450 6050 60  0000 C CNN
F 3 "" H 8450 6050 60  0000 C CNN
	1    8450 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 6250 8450 6650
Connection ~ 8450 6650
$Comp
L CP1 C?
U 1 1 5369C772
P 8450 1550
F 0 "C?" H 8500 1650 50  0000 L CNN
F 1 "1u" H 8500 1450 50  0000 L CNN
F 2 "" H 8450 1550 60  0000 C CNN
F 3 "" H 8450 1550 60  0000 C CNN
	1    8450 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 1350 8450 1050
Connection ~ 8450 1050
Wire Wire Line
	8450 1750 8450 2050
Connection ~ 8450 2050
Wire Wire Line
	7200 5300 7200 5850
Wire Wire Line
	7550 5850 7550 5300
Wire Wire Line
	8450 5300 8450 5850
Wire Wire Line
	8000 6350 8000 4850
Wire Wire Line
	6800 4950 6800 6250
Wire Wire Line
	5000 5200 5000 5100
Wire Wire Line
	5000 5100 6800 5100
Wire Wire Line
	5000 6000 5000 6150
$Comp
L SMP50 U?
U 1 1 536F40A7
P 5350 2700
F 0 "U?" H 5500 2600 60  0000 L CNN
F 1 "SMP50" H 5500 2500 60  0000 L CNN
F 2 "" H 5350 2750 60  0000 C CNN
F 3 "" H 5350 2750 60  0000 C CNN
F 4 "497-6526-1-ND" H 5350 2700 60  0001 C CNN "DigiKey"
	1    5350 2700
	1    0    0    -1  
$EndComp
$Comp
L SMP50 U?
U 1 1 536F40C6
P 5600 2400
F 0 "U?" H 5750 2300 60  0000 L CNN
F 1 "SMP50" H 5750 2200 60  0000 L CNN
F 2 "" H 5600 2450 60  0000 C CNN
F 3 "" H 5600 2450 60  0000 C CNN
F 4 "497-6526-1-ND" H 5600 2400 60  0001 C CNN "DigiKey"
	1    5600 2400
	1    0    0    -1  
$EndComp
$Comp
L SMP50 U?
U 1 1 536F40F1
P 5150 4450
F 0 "U?" H 5300 4350 60  0000 L CNN
F 1 "SMP50" H 5300 4250 60  0000 L CNN
F 2 "" H 5150 4500 60  0000 C CNN
F 3 "" H 5150 4500 60  0000 C CNN
F 4 "497-6526-1-ND" H 5150 4450 60  0001 C CNN "DigiKey"
	1    5150 4450
	1    0    0    -1  
$EndComp
$Comp
L SMP50 U?
U 1 1 536F40F8
P 5400 4150
F 0 "U?" H 5550 4050 60  0000 L CNN
F 1 "SMP50" H 5550 3950 60  0000 L CNN
F 2 "" H 5400 4200 60  0000 C CNN
F 3 "" H 5400 4200 60  0000 C CNN
F 4 "497-6526-1-ND" H 5400 4150 60  0001 C CNN "DigiKey"
	1    5400 4150
	1    0    0    -1  
$EndComp
$Comp
L SMP50 U?
U 1 1 536F40FF
P 5650 3850
F 0 "U?" H 5800 3750 60  0000 L CNN
F 1 "SMP50" H 5800 3650 60  0000 L CNN
F 2 "" H 5650 3900 60  0000 C CNN
F 3 "" H 5650 3900 60  0000 C CNN
F 4 "497-6526-1-ND" H 5650 3850 60  0001 C CNN "DigiKey"
	1    5650 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 3400 8850 3400
Wire Wire Line
	5100 2800 5100 2050
Connection ~ 5100 2050
Wire Wire Line
	5350 2500 5350 1550
Wire Wire Line
	5350 1550 5000 1550
Connection ~ 5000 1550
Wire Wire Line
	5600 2200 5600 1050
Connection ~ 5600 1050
Wire Wire Line
	5100 3200 5100 3400
Connection ~ 5100 3400
Wire Wire Line
	5350 2900 5350 3400
Connection ~ 5350 3400
Wire Wire Line
	5600 2600 5600 3400
Connection ~ 5600 3400
Wire Wire Line
	6450 4950 6450 6250
Wire Wire Line
	5000 6150 6450 6150
Connection ~ 6450 6150
Wire Wire Line
	5000 5600 8850 5600
Wire Wire Line
	6200 5500 6200 5650
Connection ~ 6200 6150
Connection ~ 6200 5100
Connection ~ 5150 3400
Connection ~ 5400 3400
Wire Wire Line
	5650 3650 5650 3400
Connection ~ 5650 3400
Wire Wire Line
	5650 4050 5650 5100
Connection ~ 5650 5100
Wire Wire Line
	5400 3950 5400 3400
Wire Wire Line
	5400 4350 5400 5600
Connection ~ 5400 5600
Wire Wire Line
	5150 4250 5150 3400
Wire Wire Line
	5150 4650 5150 6150
Connection ~ 5150 6150
Wire Wire Line
	8400 6650 8850 6650
Wire Wire Line
	8400 4550 8850 4550
$EndSCHEMATC
