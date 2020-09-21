-- Serial audio generator from LFSR PRNG
-- Currently supports left-justified 24 bit output only.
library IEEE;
use IEEE.std_logic_1164.all;

entity gen_audio is
	port (
		iClk : in std_logic;
		inReset : in std_logic;
		iEnable : in std_logic;
		oBCK : out std_logic;
		oLRCK : out std_logic;
		oData : out std_logic);
end gen_audio;

architecture RTL of gen_audio is
	signal prng_rand: std_ulogic;						-- Output from the LFSR PRNG
	signal frame_idx: natural range 0 to 63;		-- Index of the next bit to emit in the sample frame.
	signal sLRCK: std_ulogic;							-- Internal signal holding LRCK. Gated to oLRCK by inReset.
	signal sData: std_ulogic;							-- Internal signal holding sData. Gated to oData by inReset.
	
begin
	PRNG_1 : entity work.prng_lfsr port map (iClk => iClk, inReset => inReset, iEnable => iEnable, oRandBit => prng_rand);

	process (iClk, inReset)
	begin
		if inReset = '0' then
			frame_idx <= 0;
		elsif rising_edge(iClk) then
			case frame_idx is
				when 0 to 23 =>			-- Left channel, emit data
					sLRCK <= '1';
					sData <= prng_rand;
				when 24 to 31 =>			-- Left channel, 8 bits of spacer to fit 24 bits into 32 bit subframe
					sLRCK <= '1';
					sData <= '0';
				when 32 to 55 =>			-- Right channel, emit data
					sLRCK <= '0';
					sData <= prng_rand;
				when 56 to 63 =>			-- Right channel, 8 bits of spacer to fit 24 bits into 32 bit subframe
					sLRCK <= '0';
					sData <= '0';
			end case;
			frame_idx <= (frame_idx + 1) mod 64;
		end if;
	end process;
	
	-- Async gating of output signals by inReset:
	oBCK <= iClk when inReset = '1' else 'X';
	oLRCK <= sLRCK when inReset = '1' else 'X';
	oData <= sData when inReset = '1' else 'X';
end RTL;
