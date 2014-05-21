<Qucs Schematic 0.0.17>
<Properties>
  <View=0,-100,2001,805,1,0,0>
  <Grid=10,10,1>
  <DataSet=Noise_analysis.dat>
  <DataDisplay=Noise_analysis.dpl>
  <OpenDisplay=1>
  <Script=Noise_analysis.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <R R3 1 560 350 15 -26 0 1 "22k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <R R2 1 380 350 15 -26 0 1 "22k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <C C1 1 280 350 17 -26 0 1 "6.3n" 1 "" 0 "neutral" 0>
  <R R1 1 190 260 -26 15 0 0 "47" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <Vac V1 1 60 410 18 -26 0 1 "1 V" 1 "1 GHz" 0 "0" 0 "0" 0>
  <R R4 1 60 310 15 -26 0 1 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND * 1 60 440 0 0 0 0>
  <GND * 1 280 380 0 0 0 0>
  <GND * 1 380 380 0 0 0 0>
  <GND * 1 560 380 0 0 0 0>
  <C C2 1 470 260 -26 17 0 0 "22u" 1 "" 0 "neutral" 0>
  <OpAmp OP1 1 770 280 -26 42 0 0 "1e6" 1 "15 V" 0>
  <C C3 1 910 280 -26 17 0 0 "47u" 1 "" 0 "neutral" 0>
  <R R5 1 980 350 15 -26 0 1 "22k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND * 1 980 380 0 0 0 0>
  <GND * 1 740 140 0 0 0 0>
  <GND * 1 680 520 0 0 0 0>
  <Inoise I2 1 680 170 19 -26 0 1 "2.56e-24" 1 "0" 0 "1" 0 "0" 0>
  <Vnoise V2 1 780 420 -26 -51 0 2 "7.3e-18" 1 "0" 0 "1" 0 "0" 0>
  <Inoise I1 1 680 490 19 -26 0 1 "2.56e-24" 1 "0" 0 "1" 0 "0" 0>
  <OpAmp OP2 1 1330 240 -26 42 0 0 "1e6" 1 "15 V" 0>
  <GND * 1 1300 220 0 0 0 0>
  <Vnoise V3 1 1210 260 -26 -51 0 2 "7.3e-18" 1 "0" 0 "1" 0 "0" 0>
  <Inoise I3 1 1280 370 19 -26 0 1 "2.56e-24" 1 "0" 0 "1" 0 "0" 0>
  <GND * 1 1280 400 0 0 0 0>
  <VProbe Pr1 1 1450 190 28 -31 0 0>
  <GND * 1 1460 210 0 0 0 0>
  <OpAmp OP3 1 970 0 -26 42 0 0 "1e6" 1 "15 V" 0>
  <R R10 1 970 140 -26 -47 0 2 "10k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <Vnoise V4 1 830 -20 -26 -51 0 2 "7.3e-18" 1 "0" 0 "1" 0 "0" 0>
  <Inoise I4 1 900 170 19 -26 0 1 "2.56e-24" 1 "0" 0 "1" 0 "0" 0>
  <Inoise I5 1 900 -50 19 -26 0 1 "2.56e-24" 1 "0" 0 "1" 0 "0" 0>
  <GND * 1 900 200 0 0 0 0>
  <GND * 1 800 -20 0 0 0 0>
  <GND * 1 960 -80 0 0 0 0>
  <OpAmp OP4 1 1000 560 -26 42 0 0 "1e6" 1 "15 V" 0>
  <R R12 1 1000 700 -26 -47 0 2 "10k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <Vnoise V5 1 860 540 -26 -51 0 2 "7.3e-18" 1 "0" 0 "1" 0 "0" 0>
  <Inoise I6 1 930 730 19 -26 0 1 "2.56e-24" 1 "0" 0 "1" 0 "0" 0>
  <Inoise I7 1 930 510 19 -26 0 1 "2.56e-24" 1 "0" 0 "1" 0 "0" 0>
  <GND * 1 830 540 0 0 0 0>
  <GND * 1 990 480 0 0 0 0>
  <GND * 1 930 760 0 0 0 0>
  <.AC AC1 1 90 520 0 39 0 0 "log" 1 "1 Hz" 1 "5 MHz" 1 "670" 1 "yes" 0>
  <.DC DC1 1 290 520 0 39 0 0 "26.85" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "no" 0 "150" 0 "no" 0 "none" 0 "CroutLU" 0>
  <R R7 1 1090 120 -26 -47 0 2 "RS" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <R R6 1 1090 260 -26 -47 0 2 "RS" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <R R8 1 1090 400 -26 -47 0 2 "RS" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <R R9 1 1330 160 -26 -47 0 2 "RS" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <.SW SW1 1 490 520 0 63 0 0 "AC1" 1 "list" 1 "RS" 1 "5 Ohm" 0 "50 Ohm" 0 "[1k; 2.2k; 4.7k]" 1>
  <R R11 1 830 80 -26 -47 0 2 "12k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <R R13 1 860 640 -26 -47 0 2 "12k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <R R14 1 730 80 -26 -47 0 2 "30k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <R R15 1 730 640 -26 -47 0 2 "30k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND * 1 580 80 0 0 0 0>
  <Vdc V6 1 640 80 -26 18 0 0 "15 V" 1>
  <GND * 1 700 760 0 0 0 0>
  <Vdc V7 1 700 690 -62 -26 0 3 "15 V" 1>
  <R R16 1 1440 310 15 -26 0 1 "1.12k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND * 1 1440 340 0 0 0 0>
</Components>
<Wires>
  <60 260 60 280 "" 0 0 0 "">
  <60 260 160 260 "" 0 0 0 "">
  <60 340 60 380 "" 0 0 0 "">
  <220 260 280 260 "" 0 0 0 "">
  <280 260 380 260 "" 0 0 0 "">
  <280 260 280 320 "" 0 0 0 "">
  <380 260 440 260 "" 0 0 0 "">
  <380 260 380 320 "" 0 0 0 "">
  <500 260 560 260 "" 0 0 0 "">
  <560 260 560 320 "" 0 0 0 "">
  <560 260 680 260 "" 0 0 0 "">
  <680 300 740 300 "" 0 0 0 "">
  <810 280 880 280 "" 0 0 0 "">
  <940 280 960 280 "" 0 0 0 "">
  <980 280 980 320 "" 0 0 0 "">
  <880 280 880 420 "" 0 0 0 "">
  <810 420 880 420 "" 0 0 0 "">
  <680 300 680 420 "" 0 0 0 "">
  <680 420 750 420 "" 0 0 0 "">
  <680 260 740 260 "" 0 0 0 "">
  <680 200 680 260 "" 0 0 0 "">
  <680 140 740 140 "" 0 0 0 "">
  <680 420 680 460 "" 0 0 0 "">
  <1240 260 1260 260 "" 0 0 0 "">
  <1280 260 1300 260 "" 0 0 0 "">
  <1280 260 1280 340 "" 0 0 0 "">
  <1120 260 1140 260 "" 0 0 0 "">
  <980 260 980 280 "" 0 0 0 "">
  <980 260 1060 260 "" 0 0 0 "">
  <1120 120 1140 120 "" 0 0 0 "">
  <1140 260 1160 260 "" 0 0 0 "">
  <1140 120 1140 260 "" 0 0 0 "">
  <1160 260 1180 260 "" 0 0 0 "">
  <1160 260 1160 400 "" 0 0 0 "">
  <1120 400 1160 400 "" 0 0 0 "">
  <1370 240 1400 240 "" 0 0 0 "">
  <1440 210 1440 240 "" 0 0 0 "">
  <1260 260 1280 260 "" 0 0 0 "">
  <1260 160 1260 260 "" 0 0 0 "">
  <1260 160 1300 160 "" 0 0 0 "">
  <1360 160 1400 160 "" 0 0 0 "">
  <1400 240 1440 240 "" 0 0 0 "">
  <1400 160 1400 240 "" 0 0 0 "">
  <1010 0 1030 0 "" 0 0 0 "">
  <1000 140 1030 140 "" 0 0 0 "">
  <1030 0 1030 120 "" 0 0 0 "">
  <1030 120 1030 140 "" 0 0 0 "">
  <1030 120 1060 120 "" 0 0 0 "">
  <900 140 940 140 "" 0 0 0 "">
  <900 20 900 80 "" 0 0 0 "">
  <900 20 940 20 "" 0 0 0 "">
  <900 -80 960 -80 "" 0 0 0 "">
  <860 -20 900 -20 "" 0 0 0 "">
  <900 -20 940 -20 "" 0 0 0 "">
  <900 80 900 140 "" 0 0 0 "">
  <860 80 900 80 "" 0 0 0 "">
  <1040 560 1060 560 "" 0 0 0 "">
  <1030 700 1060 700 "" 0 0 0 "">
  <1060 560 1060 700 "" 0 0 0 "">
  <930 700 970 700 "" 0 0 0 "">
  <930 580 970 580 "" 0 0 0 "">
  <930 480 990 480 "" 0 0 0 "">
  <890 540 930 540 "" 0 0 0 "">
  <930 540 970 540 "" 0 0 0 "">
  <930 580 930 640 "" 0 0 0 "">
  <930 640 930 700 "" 0 0 0 "">
  <890 640 930 640 "" 0 0 0 "">
  <790 640 830 640 "" 0 0 0 "">
  <1060 400 1060 560 "" 0 0 0 "">
  <800 80 800 230 "" 0 0 0 "">
  <800 230 980 230 "" 0 0 0 "">
  <980 230 980 260 "" 0 0 0 "">
  <790 450 790 640 "" 0 0 0 "">
  <790 450 960 450 "" 0 0 0 "">
  <960 280 980 280 "" 0 0 0 "">
  <960 280 960 450 "" 0 0 0 "">
  <760 80 800 80 "" 0 0 0 "">
  <760 640 790 640 "" 0 0 0 "">
  <580 80 610 80 "" 0 0 0 "">
  <670 80 700 80 "" 0 0 0 "">
  <700 640 700 660 "" 0 0 0 "">
  <700 720 700 760 "" 0 0 0 "">
  <1440 240 1440 280 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
