library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity i2s_counter_24 is
	port (
		iCLK : in std_logic;
		inReset : in std_logic;
		oWS : out std_logic;
		oSCK : out std_logic;
		oSD : out std_logic
	);
end entity;


architecture RTL of i2s_counter_24 is
	constant cResetDelay : natural := 2;

	signal sCounter : natural range 0 to 16777215;
	signal sSreg : std_ulogic_vector(31 downto 0);
	signal sBitCounter : natural range 0 to 31;
	signal sResetDelay : natural range 0 to cResetDelay-1;
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
				sResetDelay <= 0;
				sClockDiv <= '0';
			else
				sClockDiv <= not sClockDiv;
				if sClockDiv = '1' then
					if sResetDelay = cResetDelay-1 then
						if sBitCounter = 31 then
							sSreg <= "00000000" & std_ulogic_vector(to_unsigned(sCounter, 24));
							sBitCounter <= 0;
							sWS <= not sWS;
						else
							if sBitCounter = 30 then
								sCounter <= sCounter + 1;
							end if;
							sBitCounter <= sBitCounter + 1;
							sSreg <= sSreg(sSreg'high - 1 downto sSreg'low) & '0';
						end if;
						sSD <= sSreg(sSreg'high);
					else
						sResetDelay <= sResetDelay + 1;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	oWS <= sWS when inReset = '1' else '0';
	oSCK <= sClockDiv when sResetDelay = cResetDelay-1 else '0';
	oSD <= sSD when sResetDelay = cResetDelay-1 else '0';
end RTL;
