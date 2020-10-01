-- LFSR PRNG, consisting of the following xored generators:
--   5 bits, XNOR taps at bits 5, 3.
--   9 bits, XNOR taps at bits 9, 5.
--  11 bits, XNOR taps at bits 11, 9.
-- Transitions output on rising edges of iClk; sample data on the falling edge of iClk.
library IEEE;
use IEEE.std_logic_1164.all;

entity prng_lfsr5_9_11 is
	port (
		iClk : in std_logic;			-- Input: clock. A new bit is generated on rising edges.
		inReset : in std_logic;		-- Input: Not reset. Asynchronous.
											-- '0' => reset the shift register state; '1' => do not reset.
		iEnable : in std_logic;		-- Input: Enable output. Asynchronous.
											-- '0' => oRandBit 'X'; '1' => oRandBit '0' or '1'.
		oRandBit : out std_logic	-- Output: Random bit. 'X' if iEnable = '0' or inReset = '0'.
	);
end prng_lfsr5_9_11;

architecture RTL of prng_lfsr5_9_11 is
	signal state5: std_ulogic_vector (4 downto 0);
	signal state9: std_ulogic_vector (8 downto 0);
	signal state11: std_ulogic_vector (10 downto 0);
	
begin
	process (iClk, inReset, iEnable)
	begin
		if inReset = '0' then
			state5 <= (others => '0');
			state9 <= (others => '0');
			state11 <= (others => '0');
		elsif rising_edge(iClk) and iEnable = '1' then
			state5 <= state5(state5'high - 1 downto state5'low) &	-- Shift
						(state5(4) xnor state5(2));						-- Append feedback bit
			state9 <= state9(state9'high - 1 downto state9'low) &	-- Shift
						(state9(8) xnor state9(4));						-- Append feedback bit
			state11 <= state11(state11'high - 1 downto state11'low) &	-- Shift
						(state11(10) xnor state11(8));							-- Append feedback bit
		end if;
	end process;
	
	oRandBit <= state5(state5'high) xor
					state9(state9'high) xor
					state11(state11'high) when iEnable = '1' and inReset = '1' else 'X';
	
end RTL;
