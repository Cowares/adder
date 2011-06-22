library IEEE;
use ieee.std_logic_1164.all;

library hwet_adder;
use hwet_adder.all;

package hwet_adder is
	constant ripple_carry = 0;
	constant bcla = 1;
	constant bclar = 2;  
end hwet_adder;
 


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
		  carry_gen : integer
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
