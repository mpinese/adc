-- Serial audio generator from LFSR PRNG
-- Currently emits left-justified 24 bit output only.
library IEEE;
use IEEE.std_logic_1164.all;

entity gen_audio is
	port (
		iClk : in std_logic;								-- Input clock at 12.288 MHz. This is divided by 2 to form the 6.144 MHz BCK.
		inReset : in std_logic;							-- Active low async reset
		oBCK : out std_logic;							-- Output serial audio BCK
		oLRCK : out std_logic;							-- Output serial audio LRCK
		oData : out std_logic);							-- Output serial audio Data
end gen_audio;

architecture RTL of gen_audio is
	signal prng_out: std_ulogic;						-- Output from the LFSR PRNG, transitions on the rising edges of prng_clk.
	signal clk_divider: std_ulogic;					-- Counter to divide iClk by 2 to yield the 6.144 MHz BCK.
	signal frame_idx: natural range 0 to 63;		-- Index of the next bit to emit in the sample frame.
	signal sLRCK: std_ulogic;							-- Internal signal holding LRCK. Gated to oLRCK by inReset.
	signal sData: std_ulogic;							-- Internal signal holding sData. Gated to oData by inReset.
	
begin
	PRNG : entity work.prng_lfsr5_9_11 port map (iClk => iClk, inReset => inReset, iEnable => '1', oRandBit => prng_out);

	process (iClk, inReset)
	begin
		if inReset = '0' then
			frame_idx <= 0;
			clk_divider <= '0';
		elsif rising_edge(iClk) then
			if clk_divider = '1' then
				case frame_idx is
					when 0 to 23 =>			-- Left channel, emit data
						sLRCK <= '1';
						sData <= prng_out;
					when 24 to 31 =>			-- Left channel, 8 bits of spacer to fit 24 bits into 32 bit subframe
						sLRCK <= '1';
						sData <= '0';
					when 32 to 55 =>			-- Right channel, emit data
						sLRCK <= '0';
						sData <= prng_out;
					when 56 to 63 =>			-- Right channel, 8 bits of spacer to fit 24 bits into 32 bit subframe
						sLRCK <= '0';
						sData <= '0';
				end case;

				frame_idx <= (frame_idx + 1) mod 64;
			end if;

			clk_divider <= not clk_divider;
		end if;
	end process;
	
	-- Async gating of output signals by inReset
	oBCK <= clk_divider when inReset = '1' else 'X';
	oLRCK <= sLRCK when inReset = '1' else 'X';
	oData <= sData when inReset = '1' else 'X';
end RTL;
