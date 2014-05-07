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
Sheet 3 5
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
L CP1 C8
U 1 1 535FAE07
P 7300 1250
F 0 "C8" H 7350 1350 50  0000 L CNN
F 1 "100u" H 7350 1150 50  0000 L CNN
F 2 "" H 7300 1250 60  0000 C CNN
F 3 "" H 7300 1250 60  0000 C CNN
	1    7300 1250
	1    0    0    -1  
$EndComp
$Comp
L BD241A Q3
U 1 1 535FB7FB
P 5300 3350
F 0 "Q3" H 5250 3200 40  0000 R CNN
F 1 "BD241A" H 5285 3500 40  0000 R CNN
F 2 "TO-220" H 5180 3455 29  0001 C CNN
F 3 "~" H 5300 3350 60  0000 C CNN
	1    5300 3350
	0    -1   -1   0   
$EndComp
$Comp
L R R11
U 1 1 535FB82B
P 5050 3650
F 0 "R11" V 5130 3650 40  0000 C CNN
F 1 "47" V 5057 3651 40  0000 C CNN
F 2 "" V 4980 3650 30  0000 C CNN
F 3 "" H 5050 3650 30  0000 C CNN
	1    5050 3650
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 535FBC8B
P 3450 3950
F 0 "R9" V 3530 3950 40  0000 C CNN
F 1 "4.99k" V 3457 3951 40  0000 C CNN
F 2 "~" V 3380 3950 30  0000 C CNN
F 3 "~" H 3450 3950 30  0000 C CNN
	1    3450 3950
	-1   0    0    1   
$EndComp
$Comp
L R R15
U 1 1 535FBC98
P 4650 2950
F 0 "R15" V 4730 2950 40  0000 C CNN
F 1 "10k" V 4657 2951 40  0000 C CNN
F 2 "~" V 4580 2950 30  0000 C CNN
F 3 "~" H 4650 2950 30  0000 C CNN
	1    4650 2950
	0    -1   -1   0   
$EndComp
$Comp
L CP1 C14
U 1 1 535FBC9E
P 4650 2650
F 0 "C14" H 4700 2750 50  0000 L CNN
F 1 "47u" H 4700 2550 50  0000 L CNN
F 2 "" H 4650 2650 60  0000 C CNN
F 3 "" H 4650 2650 60  0000 C CNN
	1    4650 2650
	0    1    1    0   
$EndComp
$Comp
L R R12
U 1 1 535FC2AB
P 4550 3950
F 0 "R12" V 4630 3950 40  0000 C CNN
F 1 "3.32k" V 4557 3951 40  0000 C CNN
F 2 "~" V 4480 3950 30  0000 C CNN
F 3 "~" H 4550 3950 30  0000 C CNN
	1    4550 3950
	0    1    1    0   
$EndComp
$Comp
L CP1 C12
U 1 1 535FC430
P 3700 4300
F 0 "C12" H 3750 4400 50  0000 L CNN
F 1 "10u" H 3750 4200 50  0000 L CNN
F 2 "" H 3700 4300 60  0000 C CNN
F 3 "" H 3700 4300 60  0000 C CNN
	1    3700 4300
	1    0    0    -1  
$EndComp
Text HLabel 7000 750  0    60   Input ~ 0
+5V_EXT
Text HLabel 8000 3250 2    60   Output ~ 0
+15V
Text HLabel 8000 4500 2    60   Output ~ 0
AGND
Text HLabel 8000 5750 2    60   Output ~ 0
-15V
$Comp
L OPA209-SOT23 U?
U 1 1 53644510
P 4200 3650
F 0 "U?" H 4300 3900 60  0000 L CNN
F 1 "OPA209-SOT23" H 4300 3800 60  0000 L CNN
F 2 "" H 4300 3650 60  0000 C CNN
F 3 "" H 4300 3650 60  0000 C CNN
	1    4200 3650
	1    0    0    -1  
$EndComp
$Comp
L REF02 U?
U 1 1 53644B79
P 5550 4050
F 0 "U?" H 5650 3800 60  0000 L CNN
F 1 "REF02" H 5650 3700 60  0000 L CNN
F 2 "" H 5550 4100 60  0000 C CNN
F 3 "" H 5550 4100 60  0000 C CNN
	1    5550 4050
	-1   0    0    -1  
$EndComp
NoConn ~ 5900 4150
NoConn ~ 5200 4150
$Comp
L C C?
U 1 1 536453AA
P 6000 4050
F 0 "C?" H 6000 4150 40  0000 L CNN
F 1 "100n" H 6006 3965 40  0000 L CNN
F 2 "" H 6038 3900 30  0000 C CNN
F 3 "" H 6000 4050 60  0000 C CNN
	1    6000 4050
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 536453B5
P 4900 4150
F 0 "C?" H 4900 4250 40  0000 L CNN
F 1 "100n" H 4906 4065 40  0000 L CNN
F 2 "" H 4938 4000 30  0000 C CNN
F 3 "" H 4900 4150 60  0000 C CNN
	1    4900 4150
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 53645A52
P 6300 3900
F 0 "C?" H 6350 4000 50  0000 L CNN
F 1 "100u" H 6350 3800 50  0000 L CNN
F 2 "" H 6300 3900 60  0000 C CNN
F 3 "" H 6300 3900 60  0000 C CNN
	1    6300 3900
	1    0    0    -1  
$EndComp
Text HLabel 7000 1750 0    60   Input ~ 0
DGND_EXT
Text Notes 9350 -900 0    60   ~ 0
TODO:\n* Determine feedback cap value\n* Confirm selection of pass transistors\n* Investigate mirrored supply with LM337 and Sulzer postreg\n* Join AGND and DGND at star point?  Much easier if mirror -15 V\n* Fuse\n* Power filter\n* Heatsinking of regs and trans?
$Comp
L C C?
U 1 1 53649175
P 3200 3950
F 0 "C?" H 3200 4050 40  0000 L CNN
F 1 "100n" H 3206 3865 40  0000 L CNN
F 2 "" H 3238 3800 30  0000 C CNN
F 3 "" H 3200 3950 60  0000 C CNN
F 4 "Bypass cap for OpAmp" H 3200 3950 60  0001 C CNN "Note"
	1    3200 3950
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5365AD18
P 6750 4250
F 0 "R?" V 6830 4250 40  0000 C CNN
F 1 "1k" V 6757 4251 40  0000 C CNN
F 2 "" V 6680 4250 30  0000 C CNN
F 3 "" H 6750 4250 30  0000 C CNN
	1    6750 4250
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5365AD2E
P 7000 4250
F 0 "C?" H 7000 4350 40  0000 L CNN
F 1 "47n" H 7006 4165 40  0000 L CNN
F 2 "" H 7038 4100 30  0000 C CNN
F 3 "" H 7000 4250 60  0000 C CNN
	1    7000 4250
	1    0    0    -1  
$EndComp
$Comp
L ZENER D?
U 1 1 5365B333
P 6750 3650
F 0 "D?" H 6750 3750 50  0000 C CNN
F 1 "ZENER" H 6750 3550 40  0000 C CNN
F 2 "" H 6750 3650 60  0000 C CNN
F 3 "" H 6750 3650 60  0000 C CNN
	1    6750 3650
	0    -1   -1   0   
$EndComp
$Comp
L DIODESCH D?
U 1 1 5365B634
P 7650 3250
F 0 "D?" H 7650 3350 40  0000 C CNN
F 1 "DIODESCH" H 7650 3150 40  0000 C CNN
F 2 "" H 7650 3250 60  0000 C CNN
F 3 "" H 7650 3250 60  0000 C CNN
	1    7650 3250
	1    0    0    -1  
$EndComp
$Comp
L SCR_SML U?
U 1 1 53659485
P 7300 3850
F 0 "U?" H 7400 4050 47  0000 L CNN
F 1 "SCR_SML" H 7400 3950 47  0000 L CNN
F 2 "" H 7300 3850 60  0000 C CNN
F 3 "" H 7300 3850 60  0000 C CNN
	1    7300 3850
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5368975C
P 3200 5050
F 0 "C?" H 3200 5150 40  0000 L CNN
F 1 "100n" H 3206 4965 40  0000 L CNN
F 2 "" H 3238 4900 30  0000 C CNN
F 3 "" H 3200 5050 60  0000 C CNN
F 4 "Bypass cap for OpAmp" H 3200 5050 60  0001 C CNN "Note"
	1    3200 5050
	1    0    0    -1  
$EndComp
$Comp
L OPA209-SOT23 U?
U 1 1 536899C8
P 4200 5350
F 0 "U?" H 4300 5600 60  0000 L CNN
F 1 "OPA209-SOT23" H 4300 5500 60  0000 L CNN
F 2 "" H 4300 5350 60  0000 C CNN
F 3 "" H 4300 5350 60  0000 C CNN
	1    4200 5350
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 53689A9F
P 3700 4700
F 0 "C?" H 3750 4800 50  0000 L CNN
F 1 "10u" H 3750 4600 50  0000 L CNN
F 2 "" H 3700 4700 60  0000 C CNN
F 3 "" H 3700 4700 60  0000 C CNN
	1    3700 4700
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 53689AAA
P 3450 5050
F 0 "R?" V 3530 5050 40  0000 C CNN
F 1 "4.99k" V 3457 5051 40  0000 C CNN
F 2 "~" V 3380 5050 30  0000 C CNN
F 3 "~" H 3450 5050 30  0000 C CNN
	1    3450 5050
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 53689F91
P 4550 5050
F 0 "R?" V 4630 5050 40  0000 C CNN
F 1 "3.32k" V 4557 5051 40  0000 C CNN
F 2 "~" V 4480 5050 30  0000 C CNN
F 3 "~" H 4550 5050 30  0000 C CNN
	1    4550 5050
	0    1    1    0   
$EndComp
$Comp
L C C?
U 1 1 53689F9C
P 4900 4850
F 0 "C?" H 4900 4950 40  0000 L CNN
F 1 "100n" H 4906 4765 40  0000 L CNN
F 2 "" H 4938 4700 30  0000 C CNN
F 3 "" H 4900 4850 60  0000 C CNN
	1    4900 4850
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 53689FA7
P 5050 5350
F 0 "R?" V 5130 5350 40  0000 C CNN
F 1 "47" V 5057 5351 40  0000 C CNN
F 2 "" V 4980 5350 30  0000 C CNN
F 3 "" H 5050 5350 30  0000 C CNN
	1    5050 5350
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5368A217
P 4650 6050
F 0 "R?" V 4730 6050 40  0000 C CNN
F 1 "10k" V 4657 6051 40  0000 C CNN
F 2 "~" V 4580 6050 30  0000 C CNN
F 3 "~" H 4650 6050 30  0000 C CNN
	1    4650 6050
	0    -1   -1   0   
$EndComp
$Comp
L CP1 C?
U 1 1 5368A222
P 4650 6350
F 0 "C?" H 4700 6450 50  0000 L CNN
F 1 "47u" H 4700 6250 50  0000 L CNN
F 2 "" H 4650 6350 60  0000 C CNN
F 3 "" H 4650 6350 60  0000 C CNN
	1    4650 6350
	0    1    1    0   
$EndComp
$Comp
L CP1 C?
U 1 1 5368A6C9
P 6300 5100
F 0 "C?" H 6350 5200 50  0000 L CNN
F 1 "100u" H 6350 5000 50  0000 L CNN
F 2 "" H 6300 5100 60  0000 C CNN
F 3 "" H 6300 5100 60  0000 C CNN
	1    6300 5100
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5368A964
P 6750 5500
F 0 "R?" V 6830 5500 40  0000 C CNN
F 1 "1k" V 6757 5501 40  0000 C CNN
F 2 "" V 6680 5500 30  0000 C CNN
F 3 "" H 6750 5500 30  0000 C CNN
	1    6750 5500
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5368A96A
P 7000 5500
F 0 "C?" H 7000 5600 40  0000 L CNN
F 1 "47n" H 7006 5415 40  0000 L CNN
F 2 "" H 7038 5350 30  0000 C CNN
F 3 "" H 7000 5500 60  0000 C CNN
	1    7000 5500
	1    0    0    -1  
$EndComp
$Comp
L ZENER D?
U 1 1 5368A970
P 6750 4900
F 0 "D?" H 6750 5000 50  0000 C CNN
F 1 "ZENER" H 6750 4800 40  0000 C CNN
F 2 "" H 6750 4900 60  0000 C CNN
F 3 "" H 6750 4900 60  0000 C CNN
	1    6750 4900
	0    -1   -1   0   
$EndComp
$Comp
L DIODESCH D?
U 1 1 5368A976
P 7650 5750
F 0 "D?" H 7650 5850 40  0000 C CNN
F 1 "DIODESCH" H 7650 5650 40  0000 C CNN
F 2 "" H 7650 5750 60  0000 C CNN
F 3 "" H 7650 5750 60  0000 C CNN
	1    7650 5750
	-1   0    0    -1  
$EndComp
$Comp
L SCR_SML U?
U 1 1 5368A97C
P 7300 5100
F 0 "U?" H 7400 5300 47  0000 L CNN
F 1 "SCR_SML" H 7400 5200 47  0000 L CNN
F 2 "" H 7300 5100 60  0000 C CNN
F 3 "" H 7300 5100 60  0000 C CNN
	1    7300 5100
	1    0    0    -1  
$EndComp
Text HLabel 8000 750  2    60   Output ~ 0
+5V
Text HLabel 8000 1750 2    60   Output ~ 0
DGND
$Comp
L C C?
U 1 1 53689541
P 7700 1250
F 0 "C?" H 7700 1350 40  0000 L CNN
F 1 "1u" H 7706 1165 40  0000 L CNN
F 2 "" H 7738 1100 30  0000 C CNN
F 3 "" H 7700 1250 60  0000 C CNN
	1    7700 1250
	1    0    0    -1  
$EndComp
Connection ~ 7300 750 
Connection ~ 4200 3250
Wire Wire Line
	4200 4050 4200 4950
Connection ~ 3700 3550
Connection ~ 3700 4500
Wire Wire Line
	3800 3750 3700 3750
Wire Wire Line
	3700 3750 3700 4100
Connection ~ 3700 3950
Connection ~ 4200 4500
Wire Wire Line
	3800 3550 3450 3550
Wire Wire Line
	3450 3550 3450 3700
Wire Wire Line
	3450 4200 3450 4800
Connection ~ 3450 4500
Wire Wire Line
	3200 4150 3200 4850
Connection ~ 3200 4500
Wire Wire Line
	5550 4500 5550 4350
Connection ~ 5550 4500
Wire Wire Line
	6000 4500 6000 4250
Connection ~ 6000 4500
Wire Wire Line
	4800 3950 5200 3950
Connection ~ 4900 3950
Wire Wire Line
	4900 4350 4900 4650
Connection ~ 4900 4500
Wire Wire Line
	6300 4100 6300 4900
Wire Wire Line
	6300 3700 6300 3250
Connection ~ 6300 3250
Connection ~ 6300 4500
Connection ~ 7300 1750
Wire Wire Line
	3200 3750 3200 3250
Connection ~ 3200 3250
Wire Wire Line
	5300 3650 5300 3550
Wire Wire Line
	4300 3950 3700 3950
Wire Wire Line
	5550 3750 5550 3250
Wire Wire Line
	5600 3250 5600 2950
Wire Wire Line
	5600 2950 4900 2950
Wire Wire Line
	5000 2950 5000 2650
Connection ~ 5000 2950
Wire Wire Line
	4300 2650 4300 2950
Wire Wire Line
	3700 2950 4400 2950
Connection ~ 4300 2950
Wire Wire Line
	3700 3550 3700 2950
Connection ~ 5600 3250
Connection ~ 5550 3250
Wire Wire Line
	6000 3850 6000 3650
Wire Wire Line
	6000 3650 5550 3650
Connection ~ 5550 3650
Wire Wire Line
	7000 4450 7000 4500
Connection ~ 7000 4500
Wire Wire Line
	7000 4050 7000 4000
Connection ~ 7000 4000
Connection ~ 6750 4500
Wire Wire Line
	6750 4000 7150 4000
Wire Wire Line
	7300 4050 7300 4900
Connection ~ 7300 4500
Wire Wire Line
	7300 3650 7300 3250
Connection ~ 7300 3250
Wire Wire Line
	6750 3850 6750 4000
Wire Wire Line
	6750 3450 6750 3250
Connection ~ 6750 3250
Connection ~ 6750 4000
Wire Wire Line
	8000 3250 7850 3250
Wire Wire Line
	7300 1450 7300 1750
Wire Wire Line
	7300 750  7300 1050
Wire Wire Line
	5500 3250 7450 3250
Wire Wire Line
	4300 2650 4450 2650
Wire Wire Line
	5000 2650 4850 2650
Wire Wire Line
	3200 5250 3200 5750
Connection ~ 3200 5750
Wire Wire Line
	4900 5050 4800 5050
Wire Wire Line
	4300 5050 3700 5050
Wire Wire Line
	3700 5050 3700 4900
Wire Wire Line
	4900 6050 5600 6050
Wire Wire Line
	5600 6050 5600 5750
Connection ~ 5600 5750
Wire Wire Line
	4400 6050 3700 6050
Wire Wire Line
	3700 6050 3700 5850
Wire Wire Line
	4450 6350 4300 6350
Wire Wire Line
	4300 6350 4300 6050
Connection ~ 4300 6050
Wire Wire Line
	4850 6350 5000 6350
Wire Wire Line
	5000 6350 5000 6050
Connection ~ 5000 6050
Wire Wire Line
	6300 5300 6300 5750
Connection ~ 6300 5750
Wire Wire Line
	7000 5700 7000 5750
Connection ~ 7000 5750
Wire Wire Line
	7000 5300 7000 5250
Connection ~ 7000 5250
Connection ~ 6750 5750
Wire Wire Line
	6750 5250 7150 5250
Wire Wire Line
	7300 5750 7300 5300
Connection ~ 7300 5750
Wire Wire Line
	6750 5100 6750 5250
Wire Wire Line
	6750 4700 6750 4500
Connection ~ 6750 5250
Wire Wire Line
	8000 5750 7850 5750
Wire Wire Line
	7700 1050 7700 750 
Connection ~ 7700 750 
Wire Wire Line
	7700 1450 7700 1750
Connection ~ 7700 1750
Wire Wire Line
	7000 750  8000 750 
Wire Wire Line
	7000 1750 8000 1750
Wire Wire Line
	2750 4500 8000 4500
Wire Wire Line
	2750 3250 5100 3250
Wire Wire Line
	2750 5750 7450 5750
Text HLabel 2750 3250 0    60   Input ~ 0
+18V_EXT
Text HLabel 2750 4500 0    60   Input ~ 0
AGND_EXT
Text HLabel 2750 5750 0    60   Input ~ 0
-18V_EXT
$EndSCHEMATC
