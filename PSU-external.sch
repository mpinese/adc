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
Sheet 5 5
Title ""
Date "7 may 2014"
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
P 6500 4300
F 0 "C?" H 6550 4400 50  0000 L CNN
F 1 "5600u" H 6550 4200 50  0000 L CNN
F 2 "" H 6500 4300 60  0000 C CNN
F 3 "" H 6500 4300 60  0000 C CNN
	1    6500 4300
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 53688F85
P 6850 4300
F 0 "C?" H 6850 4400 40  0000 L CNN
F 1 "100n" H 6856 4215 40  0000 L CNN
F 2 "~" H 6888 4150 30  0000 C CNN
F 3 "~" H 6850 4300 60  0000 C CNN
	1    6850 4300
	1    0    0    -1  
$EndComp
Text HLabel 8850 1550 2    60   Output ~ 0
+5V_EXT
Text HLabel 8850 3750 2    60   Output ~ 0
+18V_EXT
Text HLabel 8850 4800 2    60   Output ~ 0
AGND_EXT
Text HLabel 8850 5850 2    60   Output ~ 0
-18V_EXT
$Comp
L MC7805C U?
U 1 1 53688F96
P 8000 1600
F 0 "U?" H 7800 1800 40  0000 C CNN
F 1 "MC7805C" H 8000 1800 40  0000 L CNN
F 2 "TO-220" H 8000 1700 30  0000 C CIN
F 3 "" H 8000 1600 60  0000 C CNN
	1    8000 1600
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 53688F97
P 7150 2050
F 0 "C?" H 7200 2150 50  0000 L CNN
F 1 "2700u" H 7200 1950 50  0000 L CNN
F 2 "" H 7150 2050 60  0000 C CNN
F 3 "" H 7150 2050 60  0000 C CNN
	1    7150 2050
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 53688F98
P 7550 2050
F 0 "C?" H 7550 2150 40  0000 L CNN
F 1 "100n" H 7556 1965 40  0000 L CNN
F 2 "~" H 7588 1900 30  0000 C CNN
F 3 "~" H 7550 2050 60  0000 C CNN
	1    7550 2050
	1    0    0    -1  
$EndComp
Text HLabel 8850 2550 2    60   Output ~ 0
DGND_EXT
Text Notes 7900 3700 0    60   ~ 0
+18V
Text Notes 6250 3700 0    60   ~ 0
+20.5V min
$Comp
L CP1 C?
U 1 1 53688FA0
P 6500 5250
F 0 "C?" H 6550 5350 50  0000 L CNN
F 1 "5600u" H 6550 5150 50  0000 L CNN
F 2 "" H 6500 5250 60  0000 C CNN
F 3 "" H 6500 5250 60  0000 C CNN
	1    6500 5250
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 53688FA4
P 6850 5250
F 0 "C?" H 6850 5350 40  0000 L CNN
F 1 "100n" H 6856 5165 40  0000 L CNN
F 2 "~" H 6888 5100 30  0000 C CNN
F 3 "~" H 6850 5250 60  0000 C CNN
	1    6850 5250
	1    0    0    -1  
$EndComp
Text HLabel 8850 3050 2    60   Output ~ 0
SAF_GND
$Comp
L DIODE D?
U 1 1 5368E09A
P 6750 1750
F 0 "D?" H 6750 1850 40  0000 C CNN
F 1 "1N4001" H 6750 1650 40  0000 C CNN
F 2 "~" H 6750 1750 60  0000 C CNN
F 3 "~" H 6750 1750 60  0000 C CNN
	1    6750 1750
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D?
U 1 1 5368E121
P 6400 1750
F 0 "D?" H 6400 1850 40  0000 C CNN
F 1 "1N4001" H 6400 1650 40  0000 C CNN
F 2 "~" H 6400 1750 60  0000 C CNN
F 3 "~" H 6400 1750 60  0000 C CNN
	1    6400 1750
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D?
U 1 1 5368E163
P 6400 2350
F 0 "D?" H 6400 2450 40  0000 C CNN
F 1 "1N4001" H 6400 2250 40  0000 C CNN
F 2 "~" H 6400 2350 60  0000 C CNN
F 3 "~" H 6400 2350 60  0000 C CNN
	1    6400 2350
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D?
U 1 1 5368E169
P 6750 2350
F 0 "D?" H 6750 2450 40  0000 C CNN
F 1 "1N4001" H 6750 2250 40  0000 C CNN
F 2 "~" H 6750 2350 60  0000 C CNN
F 3 "~" H 6750 2350 60  0000 C CNN
	1    6750 2350
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D?
U 1 1 5368E721
P 5750 3950
F 0 "D?" H 5750 4050 40  0000 C CNN
F 1 "RL205" H 5750 3850 40  0000 C CNN
F 2 "~" H 5750 3950 60  0000 C CNN
F 3 "~" H 5750 3950 60  0000 C CNN
	1    5750 3950
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D?
U 1 1 5368E7AB
P 6100 3950
F 0 "D?" H 6100 4050 40  0000 C CNN
F 1 "RL205" H 6100 3850 40  0000 C CNN
F 2 "~" H 6100 3950 60  0000 C CNN
F 3 "~" H 6100 3950 60  0000 C CNN
	1    6100 3950
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D?
U 1 1 5368E7B1
P 5750 5650
F 0 "D?" H 5750 5750 40  0000 C CNN
F 1 "RL205" H 5750 5550 40  0000 C CNN
F 2 "~" H 5750 5650 60  0000 C CNN
F 3 "~" H 5750 5650 60  0000 C CNN
	1    5750 5650
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D?
U 1 1 5368E7B7
P 6100 5650
F 0 "D?" H 6100 5750 40  0000 C CNN
F 1 "RL205" H 6100 5550 40  0000 C CNN
F 2 "~" H 6100 5650 60  0000 C CNN
F 3 "~" H 6100 5650 60  0000 C CNN
	1    6100 5650
	0    -1   -1   0   
$EndComp
$Comp
L C C?
U 1 1 536984D3
P 5400 4500
F 0 "C?" H 5400 4600 40  0000 L CNN
F 1 "C" H 5406 4415 40  0000 L CNN
F 2 "~" H 5438 4350 30  0000 C CNN
F 3 "~" H 5400 4500 60  0000 C CNN
	1    5400 4500
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 536984E2
P 5400 5100
F 0 "R?" V 5480 5100 40  0000 C CNN
F 1 "R" V 5407 5101 40  0000 C CNN
F 2 "~" V 5330 5100 30  0000 C CNN
F 3 "~" H 5400 5100 30  0000 C CNN
	1    5400 5100
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5369950E
P 5800 1750
F 0 "C?" H 5800 1850 40  0000 L CNN
F 1 "C" H 5806 1665 40  0000 L CNN
F 2 "~" H 5838 1600 30  0000 C CNN
F 3 "~" H 5800 1750 60  0000 C CNN
	1    5800 1750
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 53699514
P 5800 2300
F 0 "R?" V 5880 2300 40  0000 C CNN
F 1 "R" V 5807 2301 40  0000 C CNN
F 2 "~" V 5730 2300 30  0000 C CNN
F 3 "~" H 5800 2300 30  0000 C CNN
	1    5800 2300
	1    0    0    -1  
$EndComp
$Comp
L SMP50 U?
U 1 1 53699DB9
P 5200 3600
F 0 "U?" H 5350 3500 60  0000 L CNN
F 1 "SMP50" H 5350 3400 60  0000 L CNN
F 2 "" H 5200 3650 60  0000 C CNN
F 3 "" H 5200 3650 60  0000 C CNN
F 4 "497-6526-1-ND" H 5200 3600 60  0001 C CNN "DigiKey"
	1    5200 3600
	1    0    0    -1  
$EndComp
Connection ~ 6500 4800
Connection ~ 6500 3750
Wire Wire Line
	6500 4100 6500 3750
Connection ~ 7300 4800
Wire Wire Line
	6850 4100 6850 3750
Connection ~ 6850 3750
Connection ~ 6850 4800
Connection ~ 8000 2550
Connection ~ 7150 1550
Connection ~ 7150 2550
Connection ~ 7550 1550
Connection ~ 7550 2550
Wire Wire Line
	8400 1550 8850 1550
Wire Wire Line
	7700 3750 8850 3750
Connection ~ 6500 5850
Connection ~ 6850 5850
Wire Wire Line
	7550 2250 7550 2550
Wire Wire Line
	7150 2250 7150 2550
Wire Wire Line
	8000 1850 8000 2550
Wire Wire Line
	7550 1850 7550 1550
Wire Wire Line
	7150 1550 7150 1850
Connection ~ 5000 4800
Wire Wire Line
	6850 5450 6850 5850
Wire Wire Line
	6500 5450 6500 5850
Wire Wire Line
	7700 5850 8850 5850
Connection ~ 6750 1550
Connection ~ 6750 2550
Wire Wire Line
	6400 1950 6400 2150
Wire Wire Line
	6750 1950 6750 2150
Connection ~ 6400 2000
Connection ~ 6750 2100
Wire Wire Line
	5000 4700 5000 4900
Connection ~ 6100 3750
Connection ~ 6100 5850
Wire Wire Line
	5750 3750 6900 3750
Wire Wire Line
	5750 5850 6900 5850
Connection ~ 6100 4300
Wire Wire Line
	5800 1950 5800 2050
Wire Wire Line
	5000 1550 6150 1550
Wire Wire Line
	5000 2550 6150 2550
Wire Wire Line
	6150 1550 6150 2000
Wire Wire Line
	6150 2000 6400 2000
Connection ~ 5800 1550
Wire Wire Line
	6150 2550 6150 2100
Wire Wire Line
	6150 2100 6750 2100
Connection ~ 5800 2550
Wire Wire Line
	7600 1550 6400 1550
Wire Wire Line
	6400 2550 8850 2550
Wire Wire Line
	5200 3800 5200 4800
Connection ~ 5200 4800
Wire Wire Line
	5000 4800 8850 4800
$Comp
L TRIAD-FS48-750-C2 T?
U 1 1 5369B344
P 4600 4800
F 0 "T?" H 4600 5300 70  0000 C CNN
F 1 "TRIAD-FS48-750-C2" H 4600 4300 70  0000 C CNN
F 2 "" H 4600 4800 60  0000 C CNN
F 3 "" H 4600 4800 60  0000 C CNN
F 4 "237-1485-ND" H 4600 4800 60  0001 C CNN "DigiKey"
	1    4600 4800
	1    0    0    -1  
$EndComp
$Comp
L TRIAD-FS16-400-C2 T?
U 1 1 5369B6AF
P 4600 2050
F 0 "T?" H 4600 2550 70  0000 C CNN
F 1 "TRIAD-FS16-400-C2" H 4600 1550 70  0000 C CNN
F 2 "" H 4600 2050 60  0000 C CNN
F 3 "" H 4600 2050 60  0000 C CNN
	1    4600 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2450 5000 2550
Wire Wire Line
	5000 1650 5000 1550
Wire Wire Line
	5000 1950 5000 2150
$Comp
L SMP50 U?
U 1 1 5369B910
P 5200 2800
F 0 "U?" H 5350 2700 60  0000 L CNN
F 1 "SMP50" H 5350 2600 60  0000 L CNN
F 2 "" H 5200 2850 60  0000 C CNN
F 3 "" H 5200 2850 60  0000 C CNN
F 4 "497-6526-1-ND" H 5200 2800 60  0001 C CNN "DigiKey"
	1    5200 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2050 5200 2050
Wire Wire Line
	5200 2050 5200 2600
Connection ~ 5000 2050
$Comp
L IEC-C13-SOCKET J?
U 1 1 5369A60D
P 2600 3700
F 0 "J?" H 2350 3000 60  0000 L CNN
F 1 "IEC-C13-SOCKET" H 2350 2900 60  0000 L CNN
F 2 "~" H 2550 4100 60  0000 C CNN
F 3 "~" H 2550 4100 60  0000 C CNN
	1    2600 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 1650 3100 1650
Wire Wire Line
	3100 1650 3100 4400
Wire Wire Line
	3300 1950 3300 4700
Wire Wire Line
	3300 1950 4200 1950
Wire Wire Line
	3500 2150 3500 4900
Wire Wire Line
	3500 2150 4200 2150
Wire Wire Line
	3700 2450 3700 5200
Wire Wire Line
	3700 2450 4200 2450
Connection ~ 5200 3100
Connection ~ 5200 3050
Wire Wire Line
	5200 3000 5200 3400
Wire Wire Line
	2150 3100 5200 3100
Wire Wire Line
	5200 3050 8850 3050
Wire Wire Line
	3100 4400 4200 4400
Wire Wire Line
	3300 4700 4200 4700
Wire Wire Line
	3500 4900 4200 4900
Wire Wire Line
	3700 5200 4200 5200
Wire Wire Line
	2150 3100 2150 4100
Wire Wire Line
	3000 3950 3100 3950
Connection ~ 3100 3950
Wire Wire Line
	3000 4050 3300 4050
Connection ~ 3300 4050
Wire Wire Line
	3000 4150 3500 4150
Connection ~ 3500 4150
Wire Wire Line
	3000 4250 3700 4250
Connection ~ 3700 4250
Text Notes 1450 6500 0    60   ~ 0
* 100 nF needed?
$Comp
L LM7918CT U?
U 1 1 5369BF38
P 7300 5800
F 0 "U?" H 7100 5600 40  0000 C CNN
F 1 "LM7918CT" H 7300 5600 40  0000 L CNN
F 2 "TO-220" H 7300 5700 30  0000 C CIN
F 3 "~" H 7300 5800 60  0000 C CNN
	1    7300 5800
	1    0    0    -1  
$EndComp
$Comp
L LM7818CT U?
U 1 1 5369BF47
P 7300 3800
F 0 "U?" H 7100 4000 40  0000 C CNN
F 1 "LM7818CT" H 7300 4000 40  0000 L CNN
F 2 "TO-220" H 7300 3900 30  0000 C CIN
F 3 "~" H 7300 3800 60  0000 C CNN
	1    7300 3800
	1    0    0    -1  
$EndComp
$Comp
L DIODE D?
U 1 1 5369C01A
P 8000 1200
F 0 "D?" H 8000 1300 40  0000 C CNN
F 1 "1N4001" H 8000 1100 40  0000 C CNN
F 2 "~" H 8000 1200 60  0000 C CNN
F 3 "~" H 8000 1200 60  0000 C CNN
	1    8000 1200
	-1   0    0    1   
$EndComp
Wire Wire Line
	8200 1200 8500 1200
Wire Wire Line
	8500 1200 8500 1550
Connection ~ 8500 1550
Wire Wire Line
	7800 1200 7450 1200
Wire Wire Line
	7450 1200 7450 1550
Connection ~ 7450 1550
$Comp
L DIODE D?
U 1 1 5369C0E9
P 7300 3400
F 0 "D?" H 7300 3500 40  0000 C CNN
F 1 "1N4001" H 7300 3300 40  0000 C CNN
F 2 "~" H 7300 3400 60  0000 C CNN
F 3 "~" H 7300 3400 60  0000 C CNN
	1    7300 3400
	-1   0    0    1   
$EndComp
Wire Wire Line
	7100 3400 6750 3400
Wire Wire Line
	6750 3400 6750 3750
Connection ~ 6750 3750
Wire Wire Line
	7500 3400 7800 3400
Wire Wire Line
	7800 3400 7800 3750
Connection ~ 7800 3750
$Comp
L DIODE D?
U 1 1 5369C1C4
P 7300 6200
F 0 "D?" H 7300 6300 40  0000 C CNN
F 1 "1N4001" H 7300 6100 40  0000 C CNN
F 2 "~" H 7300 6200 60  0000 C CNN
F 3 "~" H 7300 6200 60  0000 C CNN
	1    7300 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 5850 6750 6200
Wire Wire Line
	6750 6200 7100 6200
Connection ~ 6750 5850
Wire Wire Line
	7800 5850 7800 6200
Wire Wire Line
	7800 6200 7500 6200
Connection ~ 7800 5850
$Comp
L CP1 C?
U 1 1 5369C418
P 7750 4300
F 0 "C?" H 7800 4400 50  0000 L CNN
F 1 "1u" H 7800 4200 50  0000 L CNN
F 2 "" H 7750 4300 60  0000 C CNN
F 3 "" H 7750 4300 60  0000 C CNN
	1    7750 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 3750 7750 4100
Connection ~ 7750 3750
Connection ~ 7750 4800
$Comp
L CP1 C?
U 1 1 5369C517
P 7750 5250
F 0 "C?" H 7800 5350 50  0000 L CNN
F 1 "1u" H 7800 5150 50  0000 L CNN
F 2 "" H 7750 5250 60  0000 C CNN
F 3 "" H 7750 5250 60  0000 C CNN
	1    7750 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 5450 7750 5850
Connection ~ 7750 5850
$Comp
L CP1 C?
U 1 1 5369C772
P 8450 2050
F 0 "C?" H 8500 2150 50  0000 L CNN
F 1 "1u" H 8500 1950 50  0000 L CNN
F 2 "" H 8450 2050 60  0000 C CNN
F 3 "" H 8450 2050 60  0000 C CNN
	1    8450 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 1850 8450 1550
Connection ~ 8450 1550
Wire Wire Line
	8450 2250 8450 2550
Connection ~ 8450 2550
Wire Wire Line
	6500 4500 6500 5050
Wire Wire Line
	6850 5050 6850 4500
Wire Wire Line
	7750 4500 7750 5050
Wire Wire Line
	7300 5550 7300 4050
Wire Wire Line
	6100 4150 6100 5450
Wire Wire Line
	5750 4150 5750 5450
Wire Wire Line
	5000 4400 5000 4300
Wire Wire Line
	5000 4300 6100 4300
Connection ~ 5400 4300
Wire Wire Line
	5400 4700 5400 4850
Wire Wire Line
	5000 5200 5000 5350
Wire Wire Line
	5000 5350 5750 5350
Connection ~ 5400 5350
Connection ~ 5750 5350
$EndSCHEMATC
