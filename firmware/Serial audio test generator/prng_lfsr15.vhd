-- LFSR PRNG, 15 bits, XNOR taps at bits 15, 14.
-- Transitions output on rising edges of iClk; sample data on the falling edge of iClk.
library IEEE;
use IEEE.std_logic_1164.all;

entity prng_lfsr15 is
   generic (
		gInit : std_ulogic_vector := "000000000000000"
	);
	port (
		iClk : in std_logic;			-- Input: clock. A new bit is generated on rising edges.
		inReset : in std_logic;		-- Input: Not reset. Asynchronous.
											-- '0' => reset the shift register state; '1' => do not reset.
		iEnable : in std_logic;		-- Input: Enable output. Asynchronous.
											-- '0' => oRandBit 'X'; '1' => oRandBit '0' or '1'.
		oRandBit : out std_logic	-- Output: Random bit. 'X' if iEnable = '0' or inReset = '0'.
	);
end prng_lfsr15;

architecture RTL of prng_lfsr15 is
	signal state: std_ulogic_vector (14 downto 0);	-- shift register state. Left shifting, output is sampled from the highest bit
	
begin
	process (iClk, inReset, iEnable)
	begin
		if inReset = '0' then
			state <= gInit;
		elsif rising_edge(iClk) and iEnable = '1' then
			state <= state(state'high - 1 downto state'low) &	-- Shift
					(state(14) xnor state(13));						-- Append feedback bit
		end if;
	end process;
	
	oRandBit <= state(state'high) when iEnable = '1' and inReset = '1' else 'X';
	
end RTL;
