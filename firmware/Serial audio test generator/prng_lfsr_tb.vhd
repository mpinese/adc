-- Testbench for LFSR PRNG
library IEEE;
use IEEE.std_logic_1164.all;

entity prng_lfsr_tb is
end prng_lfsr_tb;

architecture behav of prng_lfsr_tb is
	constant ncycles : integer := 1000;
	constant period : time := 162.7 ns;

	signal clock : std_ulogic;		-- clock to DUTs
	signal nReset : std_ulogic;	-- reset to DUTs
	signal enable : std_ulogic;   -- enable to DUTs
	signal output15 : std_ulogic;	-- output from DUT_15
	signal output5_9_11 : std_ulogic;	-- output from DUT_5_9_11
	signal output5_7_9_11 : std_ulogic;	-- output from DUT_5_7_9_11

	signal cycle : integer := 0;	-- clock counter
begin
	DUT_15 : entity work.prng_lfsr15 port map (iClk => clock, inReset => nReset, iEnable => enable, oRandBit => output15);
	DUT_5_9_11 : entity work.prng_lfsr5_9_11 port map (iClk => clock, inReset => nReset, iEnable => enable, oRandBit => output5_9_11);
	DUT_5_7_9_11 : entity work.prng_lfsr5_7_9_11 port map (iClk => clock, inReset => nReset, iEnable => enable, oRandBit => output5_7_9_11);

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

	nReset <= '0', '1' after period * 2, '0' after period * 20, '1' after period * 25, '0' after period * 60, '1' after period * 65;
	enable <= '1', '0' after period * 40, '1' after period * 50;
end behav;
