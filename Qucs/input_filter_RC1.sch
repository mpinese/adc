<Qucs Schematic 0.0.17>
<Properties>
  <View=0,0,1159,800,1,0,0>
  <Grid=10,10,1>
  <DataSet=input_filter_RC1.dat>
  <DataDisplay=input_filter_RC1.dpl>
  <OpenDisplay=1>
  <Script=input_filter_RC1.m>
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
  <Vac V1 1 260 450 18 -26 0 1 "1 V" 1 "1 GHz" 0 "0" 0 "0" 0>
  <R R2 1 410 280 -26 -47 0 2 "50 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND * 1 600 420 0 0 0 0>
  <GND * 1 500 420 0 0 0 0>
  <GND * 1 260 480 0 0 0 0>
  <VProbe Pr1 1 770 200 28 -31 0 0>
  <GND * 1 780 220 0 0 0 0>
  <GND * 1 740 420 0 0 0 0>
  <R R4 1 740 390 15 -26 0 1 "22k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <R R3 1 600 390 15 -26 0 1 "22k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <C C2 1 670 280 -26 -49 0 2 "22u" 1 "" 0 "neutral" 0>
  <.AC AC1 1 250 620 0 39 0 0 "log" 1 "1 Hz" 1 "1 MHz" 1 "301" 1 "no" 0>
  <GND * 1 840 340 0 0 0 0>
  <R R5 1 840 310 15 -26 0 1 "1 MOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <Eqn Eqn1 1 510 630 -24 15 0 0 "A=dB(Pr1.v)" 1 "Pass_Jitter=max(dB(Pr1.v),20:20000)-min(dB(Pr1.v),20:20000)" 1 "A50=dB(yvalue(Pr1.v,50000))-dB(yvalue(Pr1.v,1000))" 1 "A20=dB(yvalue(Pr1.v,20000))-dB(yvalue(Pr1.v,1000))" 1 "A200=dB(yvalue(Pr1.v,200000))-dB(yvalue(Pr1.v,1000))" 1 "yes" 0>
  <R R1 1 260 340 15 -26 0 1 "RS" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <.SW SW1 0 1000 280 0 63 0 0 "AC1" 1 "lin" 1 "RS" 1 "0 Ohm" 1 "100 Ohm" 1 "3" 1>
  <C C1 1 500 390 17 -26 0 1 "6.3 nF" 1 "" 0 "neutral" 0>
  <Eqn Eqn2 1 1030 520 -24 15 0 0 "RS=100" 1 "yes" 0>
</Components>
<Wires>
  <700 280 740 280 "" 0 0 0 "">
  <760 280 840 280 "" 0 0 0 "">
  <760 220 760 280 "" 0 0 0 "">
  <740 280 760 280 "" 0 0 0 "">
  <740 280 740 360 "" 0 0 0 "">
  <600 280 600 360 "" 0 0 0 "">
  <600 280 640 280 "" 0 0 0 "">
  <500 280 500 360 "" 0 0 0 "">
  <500 280 600 280 "" 0 0 0 "">
  <440 280 500 280 "" 0 0 0 "">
  <260 280 260 310 "" 0 0 0 "">
  <260 280 380 280 "" 0 0 0 "">
  <260 370 260 420 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
