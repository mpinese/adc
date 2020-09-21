-- LFSR PRNG, 16 bits, XNOR taps at bits 3, 12, 14, 15.
library IEEE;
use IEEE.std_logic_1164.all;

entity prng_lfsr is
	port (
		iClk : in std_logic;			-- Input: clock. A new bit is generated on rising edges.
		inReset : in std_logic;		-- Input: Not reset. Asynchronous.
											-- '0' => reset the shift register state; '1' => do not reset.
		iEnable: in std_logic;		-- Input: Enable output. Asynchronous.
											-- '0' => oRandBit 'X'; '1' => oRandBit '0' or '1'.
		oRandBit : out std_logic	-- Output: Random bit. 'X' if iEnable = '0'
	);
end prng_lfsr;

architecture RTL of prng_lfsr is
	signal state: std_ulogic_vector (15 downto 0);	-- shift register state. Left shifting, output is sampled from bit 15
	
begin
	process (iClk, inReset)
	begin
		if inReset = '0' then
			state <= (others => '0');
		elsif rising_edge(iClk) then
			state <= state(state'high - 1 downto state'low) &							-- Shift
					(((state(15) xnor state(14)) xnor state(12)) xnor state(3));	-- Append feedback bit
		end if;
	end process;
	
	oRandBit <= state(15) when iEnable = '1' and inReset = '0' else 'X';
	
end RTL;
