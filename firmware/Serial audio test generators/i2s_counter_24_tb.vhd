library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity i2s_counter_24_tb is
end entity;

architecture behav of i2s_counter_24_tb is
	constant ncycles : integer := 1000;
	constant period : time := 81.38 ns;		-- 12.288 MHz external oscillator

	signal iCLK : std_logic;
	signal inReset : std_logic;
	signal oWS : std_logic;
	signal oSCK : std_logic;
	signal oSD : std_logic;
	
	signal cycle : integer := 0;
begin
	DUT : entity work.i2s_counter_24 port map (iCLK => iCLK, inReset => inReset, oWS => oWS, oSCK => oSCK, oSD => oSD);
	
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
