-- Testbench for LFSR PRNG
library IEEE;
use IEEE.std_logic_1164.all;

entity prng_lfsr_tb is
end prng_lfsr_tb;

architecture behav of prng_lfsr_tb is
	constant ncycles : integer := 1000;
	constant period : time := 162.7 ns;

	signal clock : std_ulogic;		-- clock to DUT
	signal nReset : std_ulogic;	-- reset to DUT
	signal output : std_ulogic;	-- output from DUT

	signal cycle : integer := 0;	-- clock counter
begin
	DUT : entity work.prng_lfsr port map (iClk => clock, inReset => nReset, oRandBit => output);

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

	nReset <= '0', '1' after period * 2;
end behav;
