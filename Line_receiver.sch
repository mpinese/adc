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
EELAYER 24 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 6
Title ""
Date "25 may 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L R R23
U 1 1 536E032D
P 3400 2700
F 0 "R23" V 3480 2700 40  0000 C CNN
F 1 "56" V 3407 2701 40  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 3330 2700 30  0001 C CNN
F 3 "~" H 3400 2700 30  0000 C CNN
F 4 "56ADCT-ND" V 3400 2700 60  0001 C CNN "DigiKey"
	1    3400 2700
	0    -1   -1   0   
$EndComp
$Comp
L C C34
U 1 1 536E032E
P 3850 3050
F 0 "C34" H 3850 3150 40  0000 L CNN
F 1 "6.2n" H 3856 2965 40  0000 L CNN
F 2 "Capacitors_ThroughHole:Capacitor18x7RM15" H 3888 2900 30  0001 C CNN
F 3 "~" H 3850 3050 60  0000 C CNN
F 4 "P15430-ND" H 3850 3050 60  0001 C CNN "DigiKey"
	1    3850 3050
	1    0    0    -1  
$EndComp
$Comp
L C C36
U 1 1 536E032F
P 4500 2700
F 0 "C36" H 4500 2800 40  0000 L CNN
F 1 "22u" H 4506 2615 40  0000 L CNN
F 2 "Capacitors_ThroughHole:Capacitor5x11RM2.5" H 4538 2550 30  0001 C CNN
F 3 "~" H 4500 2700 60  0000 C CNN
F 4 "P1188-ND" H 4500 2700 60  0001 C CNN "DigiKey"
	1    4500 2700
	0    -1   -1   0   
$EndComp
$Comp
L R R25
U 1 1 536E0330
P 4100 3050
F 0 "R25" V 4180 3050 40  0000 C CNN
F 1 "22k" V 4107 3051 40  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 4030 3050 30  0001 C CNN
F 3 "~" H 4100 3050 30  0000 C CNN
F 4 "S22CACT-ND" V 4100 3050 60  0001 C CNN "DigiKey"
	1    4100 3050
	1    0    0    -1  
$EndComp
Text HLabel 5500 2200 0    60   Input ~ 0
+15V
Text HLabel 3850 3550 3    60   Input ~ 0
AGND
Text HLabel 4900 3550 3    60   Input ~ 0
AGND
Text HLabel 5500 3000 0    60   Input ~ 0
-15V
$Comp
L CP1 C38
U 1 1 536E0333
P 6500 2600
F 0 "C38" H 6550 2700 50  0000 L CNN
F 1 "47u" H 6550 2500 50  0000 L CNN
F 2 "Capacitors_Elko_ThroughHole:Elko_vert_DM5_RM2" H 6500 2600 60  0001 C CNN
F 3 "~" H 6500 2600 60  0000 C CNN
F 4 "P12923-ND" H 6500 2600 60  0001 C CNN "DigiKey"
	1    6500 2600
	0    1    1    0   
$EndComp
Text HLabel 3000 2700 0    60   Input ~ 0
LIN
Wire Wire Line
	3650 2700 4300 2700
Wire Wire Line
	3850 2850 3850 2700
Connection ~ 3850 2700
Wire Wire Line
	4100 2800 4100 2700
Connection ~ 4100 2700
Wire Wire Line
	3850 3550 3850 3250
Wire Wire Line
	4100 3300 4100 3400
Wire Wire Line
	4100 3400 3850 3400
Connection ~ 3850 3400
Wire Wire Line
	4900 2700 4900 2800
Wire Wire Line
	4900 3300 4900 3550
Connection ~ 4900 2700
Wire Wire Line
	3150 2700 3000 2700
Wire Wire Line
	6100 2600 6300 2600
Wire Wire Line
	6200 2600 6200 2050
Connection ~ 6200 2600
Wire Wire Line
	5000 2500 5000 2050
Wire Wire Line
	5000 2500 5100 2500
Wire Wire Line
	5000 2050 6200 2050
Wire Wire Line
	5100 2700 4700 2700
Text HLabel 7300 2600 2    60   Output ~ 0
LOUT
Wire Wire Line
	7300 2600 6700 2600
$Comp
L C C35
U 1 1 536E0ADA
P 3850 5200
F 0 "C35" H 3850 5300 40  0000 L CNN
F 1 "6.2n" H 3856 5115 40  0000 L CNN
F 2 "Capacitors_ThroughHole:Capacitor18x7RM15" H 3888 5050 30  0001 C CNN
F 3 "~" H 3850 5200 60  0000 C CNN
F 4 "P15430-ND" H 3850 5200 60  0001 C CNN "DigiKey"
	1    3850 5200
	1    0    0    -1  
$EndComp
$Comp
L C C37
U 1 1 536E0AE0
P 4500 4850
F 0 "C37" H 4500 4950 40  0000 L CNN
F 1 "22u" H 4506 4765 40  0000 L CNN
F 2 "Capacitors_ThroughHole:Capacitor5x11RM2.5" H 4538 4700 30  0001 C CNN
F 3 "~" H 4500 4850 60  0000 C CNN
F 4 "P1188-ND" H 4500 4850 60  0001 C CNN "DigiKey"
	1    4500 4850
	0    -1   -1   0   
$EndComp
Text HLabel 5500 4350 0    60   Input ~ 0
+15V
Text HLabel 3850 5700 3    60   Input ~ 0
AGND
Text HLabel 4900 5700 3    60   Input ~ 0
AGND
Text HLabel 5500 5150 0    60   Input ~ 0
-15V
$Comp
L CP1 C39
U 1 1 536E0AFC
P 6500 4750
F 0 "C39" H 6550 4850 50  0000 L CNN
F 1 "47u" H 6550 4650 50  0000 L CNN
F 2 "Capacitors_Elko_ThroughHole:Elko_vert_DM5_RM2" H 6500 4750 60  0001 C CNN
F 3 "~" H 6500 4750 60  0000 C CNN
F 4 "P12923-ND" H 6500 4750 60  0001 C CNN "DigiKey"
	1    6500 4750
	0    1    1    0   
$EndComp
Text HLabel 3000 4850 0    60   Input ~ 0
RIN
Wire Wire Line
	3650 4850 4300 4850
Wire Wire Line
	3850 5000 3850 4850
Connection ~ 3850 4850
Wire Wire Line
	4100 4950 4100 4850
Connection ~ 4100 4850
Wire Wire Line
	3850 5700 3850 5400
Wire Wire Line
	4100 5450 4100 5550
Wire Wire Line
	4100 5550 3850 5550
Connection ~ 3850 5550
Wire Wire Line
	4900 4850 4900 4950
Wire Wire Line
	4900 5450 4900 5700
Connection ~ 4900 4850
Wire Wire Line
	3150 4850 3000 4850
Wire Wire Line
	6100 4750 6300 4750
Wire Wire Line
	6200 4750 6200 4200
Connection ~ 6200 4750
Wire Wire Line
	5000 4650 5000 4200
Wire Wire Line
	5000 4650 5100 4650
Wire Wire Line
	5000 4200 6200 4200
Wire Wire Line
	5100 4850 4700 4850
Text HLabel 7300 4750 2    60   Output ~ 0
ROUT
Wire Wire Line
	7300 4750 6700 4750
Text HLabel 7000 5700 3    60   Input ~ 0
AGND
Wire Wire Line
	7000 5450 7000 5700
Connection ~ 7000 4750
Wire Wire Line
	7000 4950 7000 4750
Text HLabel 7000 3550 3    60   Input ~ 0
AGND
Wire Wire Line
	7000 3300 7000 3550
Connection ~ 7000 2600
Wire Wire Line
	7000 2800 7000 2600
$Comp
L R R27
U 1 1 537F34AE
P 4900 3050
F 0 "R27" V 4980 3050 40  0000 C CNN
F 1 "22k" V 4907 3051 40  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 4830 3050 30  0001 C CNN
F 3 "~" H 4900 3050 30  0000 C CNN
F 4 "S22CACT-ND" V 4900 3050 60  0001 C CNN "DigiKey"
	1    4900 3050
	1    0    0    -1  
$EndComp
$Comp
L R R29
U 1 1 537F34B5
P 7000 3050
F 0 "R29" V 7080 3050 40  0000 C CNN
F 1 "22k" V 7007 3051 40  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 6930 3050 30  0001 C CNN
F 3 "~" H 7000 3050 30  0000 C CNN
F 4 "S22CACT-ND" V 7000 3050 60  0001 C CNN "DigiKey"
	1    7000 3050
	1    0    0    -1  
$EndComp
$Comp
L R R26
U 1 1 537F34BC
P 4100 5200
F 0 "R26" V 4180 5200 40  0000 C CNN
F 1 "22k" V 4107 5201 40  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 4030 5200 30  0001 C CNN
F 3 "~" H 4100 5200 30  0000 C CNN
F 4 "S22CACT-ND" V 4100 5200 60  0001 C CNN "DigiKey"
	1    4100 5200
	1    0    0    -1  
$EndComp
$Comp
L R R28
U 1 1 537F34C3
P 4900 5200
F 0 "R28" V 4980 5200 40  0000 C CNN
F 1 "22k" V 4907 5201 40  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 4830 5200 30  0001 C CNN
F 3 "~" H 4900 5200 30  0000 C CNN
F 4 "S22CACT-ND" V 4900 5200 60  0001 C CNN "DigiKey"
	1    4900 5200
	1    0    0    -1  
$EndComp
$Comp
L R R30
U 1 1 537F34CA
P 7000 5200
F 0 "R30" V 7080 5200 40  0000 C CNN
F 1 "22k" V 7007 5201 40  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 6930 5200 30  0001 C CNN
F 3 "~" H 7000 5200 30  0000 C CNN
F 4 "S22CACT-ND" V 7000 5200 60  0001 C CNN "DigiKey"
	1    7000 5200
	1    0    0    -1  
$EndComp
$Comp
L R R24
U 1 1 53802423
P 3400 4850
F 0 "R24" V 3480 4850 40  0000 C CNN
F 1 "56" V 3407 4851 40  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 3330 4850 30  0001 C CNN
F 3 "~" H 3400 4850 30  0000 C CNN
F 4 "56ADCT-ND" V 3400 4850 60  0001 C CNN "DigiKey"
	1    3400 4850
	0    -1   -1   0   
$EndComp
$Comp
L LME49740 U15
U 1 1 53803254
P 5500 2600
F 0 "U15" H 5750 2450 60  0000 L CNN
F 1 "LME49740" H 5750 2350 60  0000 L CNN
F 2 "Sockets_DIP:DIP-14__300_ELL" H 5600 2600 60  0001 C CNN
F 3 "~" H 5600 2600 60  0000 C CNN
F 4 "LME49740NA/NOPB-ND" H 5500 2600 60  0001 C CNN "DigiKey"
	1    5500 2600
	1    0    0    -1  
$EndComp
$Comp
L LME49740 U16
U 1 1 53803263
P 5500 4750
F 0 "U16" H 5750 4600 60  0000 L CNN
F 1 "LME49740" H 5750 4500 60  0000 L CNN
F 2 "Sockets_DIP:DIP-14__300_ELL" H 5600 4750 60  0001 C CNN
F 3 "~" H 5600 4750 60  0000 C CNN
F 4 "LME49740NA/NOPB-ND" H 5500 4750 60  0001 C CNN "DigiKey"
	1    5500 4750
	1    0    0    -1  
$EndComp
$EndSCHEMATC
