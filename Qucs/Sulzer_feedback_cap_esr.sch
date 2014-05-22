<Qucs Schematic 0.0.18>
<Properties>
  <View=0,0,1017,800,1,0,0>
  <Grid=10,10,1>
  <DataSet=Sulzer_feedback_cap_esr.dat>
  <DataDisplay=Sulzer_feedback_cap_esr.dpl>
  <OpenDisplay=1>
  <Script=Sulzer_feedback_cap_esr.m>
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
  <GND * 1 860 380 0 0 0 0>
  <VProbe Pr1 1 930 200 28 -31 0 0>
  <GND * 1 940 220 0 0 0 0>
  <Vac V1 1 500 350 18 -26 0 1 "1 V" 1 "1 GHz" 0 "0" 0 "0" 0>
  <GND * 1 500 380 0 0 0 0>
  <R R3 1 610 160 -26 15 0 0 "ESR" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <C C1 1 710 160 -26 17 0 0 "10u" 1 "" 0 "neutral" 0>
  <.DC DC1 1 70 80 0 46 0 0 "26.85" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "no" 0 "150" 0 "no" 0 "none" 0 "CroutLU" 0>
  <.AC AC1 1 70 190 0 46 0 0 "log" 1 "1 Hz" 1 "10 MHz" 1 "211" 1 "no" 0>
  <R R2 1 860 350 15 -26 0 1 "5k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <.SW SW1 1 70 410 0 77 0 0 "AC1" 1 "list" 1 "ESR" 1 "5 Ohm" 0 "50 Ohm" 0 "[10; 100]" 1>
  <R R1 1 710 260 -26 15 0 0 "5k" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
</Components>
<Wires>
  <740 160 740 220 "" 0 0 0 "">
  <860 220 860 320 "" 0 0 0 "">
  <740 220 740 260 "" 0 0 0 "">
  <740 220 860 220 "" 0 0 0 "">
  <860 220 920 220 "" 0 0 0 "">
  <640 160 680 160 "" 0 0 0 "">
  <540 160 580 160 "" 0 0 0 "">
  <540 160 540 220 "" 0 0 0 "">
  <540 260 680 260 "" 0 0 0 "">
  <500 220 500 320 "" 0 0 0 "">
  <540 220 540 260 "" 0 0 0 "">
  <500 220 540 220 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
  <Text 350 580 12 #000000 0 "Conclusion: Cap ESR unimportant; Al will be OK">
</Paintings>
