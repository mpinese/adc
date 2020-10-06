library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity i2s_counter is
	generic (
		gBits : natural := 24
	);

	port (
		iCLK : in std_logic;
		inReset : in std_logic;
		oWS : out std_logic;
		oSCK : out std_logic;
		oSD : out std_logic
	);
end entity;


architecture RTL of i2s_counter is
	signal sCounter : natural range 0 to (2**gBits)-1;
	signal sSreg : std_ulogic_vector(gBits-1 downto 0);
	signal sBitCounter : natural range 0 to 31;
	signal sResetDelayDone : std_ulogic;
	signal sWS : std_ulogic;
	signal sSD : std_ulogic;
	signal sClockDiv : std_ulogic;
	
begin
	process (iCLK, inReset)
	begin
		if falling_edge(iCLK) then
			if inReset = '0' then
				sCounter <= 0;
				sBitCounter <= 0;
				sSreg <= (others => '0');
				sWS <= '0';
				sSD <= '0';
				sResetDelayDone <= '0';
				sClockDiv <= '0';
			else
				sClockDiv <= not sClockDiv;
				if sClockDiv = '1' then
					if sResetDelayDone = '1' then
						if sBitCounter < 32 - gBits then
							sSD <= '0';
							if sBitCounter = 0 then
								sCounter <= (sCounter + 1) mod (2**gBits);
							end if;
						else
							sSD <= sSreg(sSreg'high);
							sSreg <= sSreg(sSreg'high - 1 downto sSreg'low) & '0';
							if sBitCounter = 31 then
								sSreg <= std_ulogic_vector(to_unsigned(sCounter, gBits));
								sWS <= not sWS;
							end if;
						end if;
					end if;
				sBitCounter <= (sBitCounter + 1) mod 32;
				sResetDelayDone <= '1';
				end if;
			end if;
		end if;
	end process;
	
	oWS <= sWS when inReset = '1' else '0';
	oSCK <= sClockDiv when sResetDelayDone = '1' else '0';
	oSD <= sSD when sResetDelayDone = '1' else '0';
end RTL;
