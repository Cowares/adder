library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Prefix is
	port ( 	
		Pi  : in std_logic;
		Piv : in std_logic;
		Gi  : in std_logic;
		Giv : in std_logic;
		P   : out std_logic;
		G   : out std_logic
	);
end Prefix;

architecture Behavioral of Prefix is

begin
	P <= Pi and Piv;
	G <= (Pi and Giv) or Gi;
	
end Behavioral;


