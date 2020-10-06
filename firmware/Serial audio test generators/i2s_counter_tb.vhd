library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity i2s_counter_tb is
end entity;

architecture behav of i2s_counter_tb is
	constant ncycles : integer := 100000;
	constant period : time := 81.38 ns;		-- 12.288 MHz external oscillator

	signal iCLK : std_logic;
	signal inReset : std_logic;
	
	signal oWS24 : std_logic;
	signal oSCK24 : std_logic;
	signal oSD24 : std_logic;
	
	signal oWS16 : std_logic;
	signal oSCK16 : std_logic;
	signal oSD16 : std_logic;

	signal oWS10 : std_logic;
	signal oSCK10 : std_logic;
	signal oSD10 : std_logic;
	
	signal cycle : integer := 0;
begin
	DUT_24 : entity work.i2s_counter generic map (gBits => 24) port map (iCLK => iCLK, inReset => inReset, oWS => oWS24, oSCK => oSCK24, oSD => oSD24);
	DUT_16 : entity work.i2s_counter generic map (gBits => 16) port map (iCLK => iCLK, inReset => inReset, oWS => oWS16, oSCK => oSCK16, oSD => oSD16);
	DUT_10 : entity work.i2s_counter generic map (gBits => 10) port map (iCLK => iCLK, inReset => inReset, oWS => oWS10, oSCK => oSCK10, oSD => oSD10);
	
	process
	begin
		iCLK <= '0';
		wait for period / 2;
		iCLK <= '1';
		wait for period / 2;
		
		if cycle = ncycles then
			wait;
		else
			cycle <= cycle + 1;
		end if;
	end process;
	
	inReset <= '1', '0' after period*90, '1' after period*100;
end behav;
