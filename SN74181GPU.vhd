library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity SN74181GPU is
	port (
		S : in std_logic_vector(3 downto 0);
		M	 : in std_logic;
		A	 : in std_logic;
		B	 : in std_logic;
		P	 : out std_logic;
		G	 : out std_logic;
		R	 : out std_logic
	);
end entity SN74181GPU;

architecture logic of SN74181GPU is
	signal Gint, Pint, notB : std_logic;
begin
	notB <= not B;
	Pint <= ((B and S(3) and A) or (A and S(2)and notB));
	Gint <= ((notB and S(1)) or (S(0) and B) or A);
	R <= Pint xnor Gint;
	P <= Pint nor M;
	G <= Gint nor M;
end architecture; 
	


