library ieee;
use ieee.std_logic_1164.all;

entity AdderTop is
	port(
		A : in std_logic_vector(19 downto 0);
		B : in std_logic_vector(19 downto 0);
		Cin : in std_logic;
		F : out std_logic_vector(19 downto 0);
		Cout : out std_logic
	);
end entity;

architecture Instance of AdderTop is
	component Adder is
	 Generic (
		  carry_gen : carry_unit_type
	 );
	port (	
		A : in std_logic_vector;
		B : in std_logic_vector;
		Cin : in std_logic;
		sum : out std_logic_vector;
		Cout : out std_logic
	);
	end component;
begin
TheAdder: 
	Adder 
		generic map(bcla)
		port map(A, B, Cin, F, Cout);
end architecture;
