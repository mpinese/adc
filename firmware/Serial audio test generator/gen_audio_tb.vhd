-- Testbench for serial audio generator
library IEEE;
use IEEE.std_logic_1164.all;

entity gen_audio_tb is
end gen_audio_tb;

architecture behav of gen_audio_tb is
	constant ncycles : integer := 1000;
	constant period : time := 81.38 ns;		-- 12.288 MHz external oscillator

	signal clock : std_ulogic;		-- clock to DUT
	signal nReset : std_ulogic;	-- reset to DUT

	signal bck : std_ulogic;		-- output from DUT
	signal lrck : std_ulogic;		-- output from DUT
	signal data : std_ulogic;		-- output from DUT

	signal cycle : integer := 0;	-- clock counter
begin
	DUT : entity work.gen_audio port map (iClk => clock, inReset => nReset, oBCK => bck, oLRCK => lrck, oData => data);

	process
	begin
		clock <= '0';
		wait for period / 2;
		clock <= '1';
		wait for period / 2;

		if cycle = ncycles then
			wait;
		else
			cycle <= cycle + 1;
		end if;
	end process;

	nReset <= '0', '1' after period * 2.25;
end behav;
