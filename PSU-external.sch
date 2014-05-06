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
LIBS:ADC-cache
EELAYER 24 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
Title ""
Date "1 may 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L AMGIS_L01 T?
U 1 1 53688F7F
P 4700 4400
F 0 "T?" H 4700 4900 70  0000 C CNN
F 1 "AMGIS_L01" H 4700 3900 70  0000 C CNN
F 2 "" H 4700 4400 60  0000 C CNN
F 3 "http://www.amgistoroids.com/assets/files/L01%20Series%2050%2060%20Hz%20PC%20Mount%20Toroidal%20Transformers.pdf" H 4700 4400 60  0001 C CNN
F 4 "TE2260-ND" H 4700 4400 60  0001 C CNN "DigiKey"
	1    4700 4400
	1    0    0    -1  
$EndComp
$Comp
L BRIDGE_SML D?
U 1 1 53688F80
P 5650 3750
F 0 "D?" H 5450 4300 70  0000 C CNN
F 1 "BRIDGE_SML" H 5700 4200 70  0000 C CNN
F 2 "" H 5950 3750 60  0000 C CNN
F 3 "" H 5950 3750 60  0000 C CNN
	1    5650 3750
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 53688F81
P 6300 3700
F 0 "C?" H 6350 3800 50  0000 L CNN
F 1 "5600u" H 6350 3600 50  0000 L CNN
F 2 "" H 6300 3700 60  0000 C CNN
F 3 "" H 6300 3700 60  0000 C CNN
	1    6300 3700
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 53688F82
P 7900 3400
F 0 "R?" V 7980 3400 40  0000 C CNN
F 1 "560" V 7907 3401 40  0000 C CNN
F 2 "" V 7830 3400 30  0000 C CNN
F 3 "" H 7900 3400 30  0000 C CNN
	1    7900 3400
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 53688F83
P 7100 4050
F 0 "R?" V 7180 4050 40  0000 C CNN
F 1 "7.5k" V 7107 4051 40  0000 C CNN
F 2 "" V 7030 4050 30  0000 C CNN
F 3 "" H 7100 4050 30  0000 C CNN
	1    7100 4050
	-1   0    0    1   
$EndComp
$Comp
L CP1 C?
U 1 1 53688F84
P 7400 4050
F 0 "C?" H 7450 4150 50  0000 L CNN
F 1 "10u" H 7450 3950 50  0000 L CNN
F 2 "" H 7400 4050 60  0000 C CNN
F 3 "" H 7400 4050 60  0000 C CNN
	1    7400 4050
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 53688F85
P 6650 3700
F 0 "C?" H 6650 3800 40  0000 L CNN
F 1 "100n" H 6656 3615 40  0000 L CNN
F 2 "~" H 6688 3550 30  0000 C CNN
F 3 "~" H 6650 3700 60  0000 C CNN
	1    6650 3700
	1    0    0    -1  
$EndComp
$Comp
L LM317T U?
U 1 1 53688F86
P 7100 3200
F 0 "U?" H 6900 3400 40  0000 C CNN
F 1 "LM317T" H 7100 3400 40  0000 L CNN
F 2 "TO-220" H 7100 3300 30  0000 C CIN
F 3 "~" H 7100 3200 60  0000 C CNN
	1    7100 3200
	1    0    0    -1  
$EndComp
$Comp
L DIODE D?
U 1 1 53688F87
P 7600 3400
F 0 "D?" H 7600 3500 40  0000 C CNN
F 1 "DIODE" H 7600 3300 40  0000 C CNN
F 2 "~" H 7600 3400 60  0000 C CNN
F 3 "~" H 7600 3400 60  0000 C CNN
	1    7600 3400
	0    -1   -1   0   
$EndComp
Text HLabel 9450 1150 2    60   Output ~ 0
+5V_EXT
Text HLabel 9450 3150 2    60   Output ~ 0
+18V_EXT
Text HLabel 9450 4400 2    60   Output ~ 0
AGND_EXT
Text HLabel 9450 5650 2    60   Output ~ 0
-18V_EXT
$Comp
L BRIDGE_SML D?
U 1 1 53688F90
P 7050 1650
F 0 "D?" H 6750 2350 70  0000 C CNN
F 1 "BRIDGE_SML" H 7000 2200 70  0000 C CNN
F 2 "" H 7350 1650 60  0000 C CNN
F 3 "" H 7350 1650 60  0000 C CNN
	1    7050 1650
	1    0    0    -1  
$EndComp
$Comp
L MC7805C U?
U 1 1 53688F96
P 8600 1200
F 0 "U?" H 8400 1400 40  0000 C CNN
F 1 "MC7805C" H 8600 1400 40  0000 L CNN
F 2 "TO-220" H 8600 1300 30  0000 C CIN
F 3 "" H 8600 1200 60  0000 C CNN
	1    8600 1200
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 53688F97
P 7750 1650
F 0 "C?" H 7800 1750 50  0000 L CNN
F 1 "2700u" H 7800 1550 50  0000 L CNN
F 2 "" H 7750 1650 60  0000 C CNN
F 3 "" H 7750 1650 60  0000 C CNN
	1    7750 1650
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 53688F98
P 8150 1650
F 0 "C?" H 8150 1750 40  0000 L CNN
F 1 "100n" H 8156 1565 40  0000 L CNN
F 2 "~" H 8188 1500 30  0000 C CNN
F 3 "~" H 8150 1650 60  0000 C CNN
	1    8150 1650
	1    0    0    -1  
$EndComp
$Comp
L TAMURA_3FD-3XX T?
U 1 1 53688F99
P 5800 1650
F 0 "T?" H 5800 2150 70  0000 C CNN
F 1 "TAMURA_3FD-3XX" H 5800 1150 70  0000 C CNN
F 2 "" H 5800 1650 60  0000 C CNN
F 3 "http://www.tamuracorp.com/clientuploads/pdfs/engineeringdocs/3FD-3XX.pdf" H 5800 1650 60  0001 C CNN
F 4 "MT2106-ND" H 5800 1650 60  0001 C CNN "DigiKey"
	1    5800 1650
	1    0    0    -1  
$EndComp
Text HLabel 9450 2150 2    60   Output ~ 0
DGND_EXT
Text Notes -6150 1300 0    60   ~ 0
Change TF.  Need something that gives >= 7.6 VRMS out.\nTotal VA >= 3.8 W\nhttp://australia.rs-online.com/web/p/pcb-transformers/0504357/\nhttp://au.mouser.com/ProductDetail/TE-Connectivity-PB/4900-9010RC62/?qs=sGAEpiMZZMvwUzoUXIIvybxvWcHlXqMIJJMreLPLlIY%3d\nhttp://au.mouser.com/ProductDetail/Hammond-Manufacturing/160G10/?qs=sGAEpiMZZMvwUzoUXIIvyW8HfC4QLhUeoMmGdCqPnA8%3d
Text Notes -6200 4900 0    60   ~ 0
TF needs to give >= 17 VRMS out of each secondary.\nTotal VA >= 17 W\nhttp://australia.rs-online.com/web/p/pcb-transformers/1739298/\nhttp://australia.rs-online.com/web/p/pcb-transformers/1739361/\nhttp://au.mouser.com/ProductDetail/Triad-Magnetics/FS36-1000/?qs=sGAEpiMZZMvwUzoUXIIvydH8%2fj5UF54ye%252bQIrzt8fZs%3d\nhttp://au.mouser.com/ProductDetail/Triad-Magnetics/FS48-750/?qs=sGAEpiMZZMvwUzoUXIIvyROSZ2YdkHsuzDYjmE%2fv86U%3d
Text Notes 7700 3100 0    60   ~ 0
+18V
Text Notes 6050 3100 0    60   ~ 0
+20.5V min
$Comp
L R R?
U 1 1 53688F9B
P 8200 4150
F 0 "R?" V 8280 4150 40  0000 C CNN
F 1 "1k" V 8207 4151 40  0000 C CNN
F 2 "" V 8130 4150 30  0000 C CNN
F 3 "" H 8200 4150 30  0000 C CNN
	1    8200 4150
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 53688F9C
P 8450 4150
F 0 "C?" H 8450 4250 40  0000 L CNN
F 1 "47n" H 8456 4065 40  0000 L CNN
F 2 "" H 8488 4000 30  0000 C CNN
F 3 "" H 8450 4150 60  0000 C CNN
	1    8450 4150
	1    0    0    -1  
$EndComp
$Comp
L ZENER D?
U 1 1 53688F9D
P 8200 3550
F 0 "D?" H 8200 3650 50  0000 C CNN
F 1 "ZENER" H 8200 3450 40  0000 C CNN
F 2 "" H 8200 3550 60  0000 C CNN
F 3 "" H 8200 3550 60  0000 C CNN
	1    8200 3550
	0    -1   -1   0   
$EndComp
$Comp
L DIODESCH D?
U 1 1 53688F9E
P 9100 3150
F 0 "D?" H 9100 3250 40  0000 C CNN
F 1 "DIODESCH" H 9100 3050 40  0000 C CNN
F 2 "" H 9100 3150 60  0000 C CNN
F 3 "" H 9100 3150 60  0000 C CNN
	1    9100 3150
	1    0    0    -1  
$EndComp
$Comp
L SCR_SML U?
U 1 1 53688F9F
P 8750 3750
F 0 "U?" H 8850 3950 47  0000 L CNN
F 1 "SCR_SML" H 8850 3850 47  0000 L CNN
F 2 "" H 8750 3750 60  0000 C CNN
F 3 "" H 8750 3750 60  0000 C CNN
	1    8750 3750
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 53688FA0
P 6300 5050
F 0 "C?" H 6350 5150 50  0000 L CNN
F 1 "5600u" H 6350 4950 50  0000 L CNN
F 2 "" H 6300 5050 60  0000 C CNN
F 3 "" H 6300 5050 60  0000 C CNN
	1    6300 5050
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 53688FA1
P 7900 5400
F 0 "R?" V 7980 5400 40  0000 C CNN
F 1 "560" V 7907 5401 40  0000 C CNN
F 2 "" V 7830 5400 30  0000 C CNN
F 3 "" H 7900 5400 30  0000 C CNN
	1    7900 5400
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 53688FA2
P 7100 4750
F 0 "R?" V 7180 4750 40  0000 C CNN
F 1 "7.5k" V 7107 4751 40  0000 C CNN
F 2 "" V 7030 4750 30  0000 C CNN
F 3 "" H 7100 4750 30  0000 C CNN
	1    7100 4750
	-1   0    0    1   
$EndComp
$Comp
L CP1 C?
U 1 1 53688FA3
P 7400 4750
F 0 "C?" H 7450 4850 50  0000 L CNN
F 1 "10u" H 7450 4650 50  0000 L CNN
F 2 "" H 7400 4750 60  0000 C CNN
F 3 "" H 7400 4750 60  0000 C CNN
	1    7400 4750
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 53688FA4
P 6650 5050
F 0 "C?" H 6650 5150 40  0000 L CNN
F 1 "100n" H 6656 4965 40  0000 L CNN
F 2 "~" H 6688 4900 30  0000 C CNN
F 3 "~" H 6650 5050 60  0000 C CNN
	1    6650 5050
	1    0    0    -1  
$EndComp
$Comp
L DIODE D?
U 1 1 53688FA5
P 7600 5400
F 0 "D?" H 7600 5500 40  0000 C CNN
F 1 "DIODE" H 7600 5300 40  0000 C CNN
F 2 "~" H 7600 5400 60  0000 C CNN
F 3 "~" H 7600 5400 60  0000 C CNN
	1    7600 5400
	0    -1   -1   0   
$EndComp
$Comp
L LM337T U?
U 1 1 53688FA8
P 7100 5600
F 0 "U?" H 6900 5400 40  0000 C CNN
F 1 "LM337T" H 7100 5400 40  0000 L CNN
F 2 "TO-220" H 7100 5500 30  0000 C CIN
F 3 "" H 7100 5600 60  0000 C CNN
	1    7100 5600
	1    0    0    -1  
$EndComp
Connection ~ 6300 4400
Wire Wire Line
	6300 3900 6300 4850
Connection ~ 6300 3150
Wire Wire Line
	6300 3500 6300 3150
Connection ~ 7400 4400
Connection ~ 7900 3150
Connection ~ 7100 4400
Wire Wire Line
	7400 4250 7400 4550
Wire Wire Line
	7400 3650 7400 3850
Wire Wire Line
	7100 3800 7100 3450
Wire Wire Line
	7100 4300 7100 4500
Wire Wire Line
	6050 3150 6050 3750
Wire Wire Line
	6650 3500 6650 3150
Connection ~ 6650 3150
Wire Wire Line
	6650 3900 6650 4850
Connection ~ 6650 4400
Wire Wire Line
	7100 3650 7900 3650
Connection ~ 7100 3650
Connection ~ 7400 3650
Wire Wire Line
	7600 3200 7600 3150
Connection ~ 7600 3150
Wire Wire Line
	7600 3600 7600 3650
Connection ~ 7600 3650
Connection ~ 8600 2150
Wire Wire Line
	7050 2050 6200 2050
Wire Wire Line
	6200 1550 6350 1550
Wire Wire Line
	6200 1250 7050 1250
Wire Wire Line
	6200 1750 6450 1750
Wire Wire Line
	6450 1750 6450 1250
Connection ~ 6450 1250
Wire Wire Line
	6350 1550 6350 2050
Connection ~ 6350 2050
Connection ~ 7750 1150
Connection ~ 7750 2150
Connection ~ 8150 1150
Connection ~ 8150 2150
Wire Wire Line
	7450 1150 8200 1150
Wire Wire Line
	9000 1150 9450 1150
Wire Wire Line
	6650 2150 9450 2150
Wire Wire Line
	6700 3150 6050 3150
Wire Wire Line
	8450 4350 8450 4400
Connection ~ 8450 4400
Wire Wire Line
	8450 3950 8450 3900
Connection ~ 8450 3900
Connection ~ 8200 4400
Wire Wire Line
	8200 3900 8600 3900
Wire Wire Line
	8750 3950 8750 4800
Connection ~ 8750 4400
Wire Wire Line
	8750 3550 8750 3150
Connection ~ 8750 3150
Wire Wire Line
	8200 3750 8200 3900
Wire Wire Line
	8200 3350 8200 3150
Connection ~ 8200 3150
Connection ~ 8200 3900
Wire Wire Line
	9450 3150 9300 3150
Connection ~ 6300 5650
Connection ~ 6650 5650
Wire Wire Line
	8150 1850 8150 2150
Wire Wire Line
	7750 1850 7750 2150
Wire Wire Line
	6650 1650 6650 2150
Wire Wire Line
	8600 1450 8600 2150
Wire Wire Line
	8150 1450 8150 1150
Wire Wire Line
	7750 1150 7750 1450
Wire Wire Line
	7450 1150 7450 1650
Wire Wire Line
	5250 5650 6700 5650
Wire Wire Line
	5100 4300 5100 4500
Wire Wire Line
	5650 3350 5100 3350
Wire Wire Line
	5100 3350 5100 4000
Wire Wire Line
	5650 4150 5650 4800
Wire Wire Line
	5650 4800 5100 4800
Connection ~ 5100 4400
Wire Wire Line
	5250 3750 5250 5650
Wire Wire Line
	7100 5000 7100 5350
Wire Wire Line
	7400 4950 7400 5150
Wire Wire Line
	7100 5150 7900 5150
Connection ~ 7100 5150
Connection ~ 7400 5150
Wire Wire Line
	7600 5200 7600 5150
Connection ~ 7600 5150
Wire Wire Line
	7600 5600 7600 5650
Connection ~ 7600 5650
Connection ~ 7900 5650
Wire Wire Line
	6650 5250 6650 5650
Wire Wire Line
	6300 5250 6300 5650
$Comp
L R R?
U 1 1 53688FB3
P 8200 5400
F 0 "R?" V 8280 5400 40  0000 C CNN
F 1 "1k" V 8207 5401 40  0000 C CNN
F 2 "" V 8130 5400 30  0000 C CNN
F 3 "" H 8200 5400 30  0000 C CNN
	1    8200 5400
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 53688FB4
P 8450 5400
F 0 "C?" H 8450 5500 40  0000 L CNN
F 1 "47n" H 8456 5315 40  0000 L CNN
F 2 "" H 8488 5250 30  0000 C CNN
F 3 "" H 8450 5400 60  0000 C CNN
	1    8450 5400
	1    0    0    -1  
$EndComp
$Comp
L ZENER D?
U 1 1 53688FB5
P 8200 4800
F 0 "D?" H 8200 4900 50  0000 C CNN
F 1 "ZENER" H 8200 4700 40  0000 C CNN
F 2 "" H 8200 4800 60  0000 C CNN
F 3 "" H 8200 4800 60  0000 C CNN
	1    8200 4800
	0    -1   -1   0   
$EndComp
$Comp
L DIODESCH D?
U 1 1 53688FB6
P 9100 5650
F 0 "D?" H 9100 5750 40  0000 C CNN
F 1 "DIODESCH" H 9100 5550 40  0000 C CNN
F 2 "" H 9100 5650 60  0000 C CNN
F 3 "" H 9100 5650 60  0000 C CNN
	1    9100 5650
	-1   0    0    -1  
$EndComp
$Comp
L SCR_SML U?
U 1 1 53688FB7
P 8750 5000
F 0 "U?" H 8850 5200 47  0000 L CNN
F 1 "SCR_SML" H 8850 5100 47  0000 L CNN
F 2 "" H 8750 5000 60  0000 C CNN
F 3 "" H 8750 5000 60  0000 C CNN
	1    8750 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 5600 8450 5650
Connection ~ 8450 5650
Wire Wire Line
	8450 5200 8450 5150
Connection ~ 8450 5150
Connection ~ 8200 5650
Wire Wire Line
	8200 5150 8600 5150
Wire Wire Line
	8750 5650 8750 5200
Connection ~ 8750 5650
Wire Wire Line
	8200 5000 8200 5150
Wire Wire Line
	8200 4600 8200 4400
Connection ~ 8200 5150
Wire Wire Line
	9450 5650 9300 5650
Wire Wire Line
	8900 3150 7500 3150
Wire Wire Line
	8900 5650 7500 5650
Wire Wire Line
	9450 4400 5100 4400
Text HLabel 9450 2650 2    60   Output ~ 0
SAF_GND
Text Notes 2450 1100 0    60   ~ 0
BR diodes -- caps?  Do I need fast diodes then?\nLT4635 instead of crowbar?\nWhat to do about Pri -> Sec shorts?\nChange reg setting to account for loss across Schottkys
$EndSCHEMATC
