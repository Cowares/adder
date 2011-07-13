library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BetterPrefix is
	Port (
		Gi: in STD_LOGIC;
		Pi: in STD_LOGIC;
		Gp: in STD_LOGIC;
		Pp: in STD_LOGIC;
		G: out STD_LOGIC;
      P: out STD_LOGIC);
end BetterPrefix;

architecture Behavioral of BetterPrefix is
begin
	G <= (Pi and Gp) or Gi;
	P <= Pi and Pp;
end Behavioral;
