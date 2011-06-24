library IEEE;
use ieee.std_logic_1164.all;

entity AdderTop is
	port (
		A: in std_logic_vector(19 downto 0);
		B: in std_logic_vector(19 downto 0);
		Cin: in std_logic;
		F: out std_logic_vector(19 downto 0);
		Cout: out std_logic
	);
end entity;

architecture Behavioral of AdderTop is
begin
AdderInst:	Adder generic map(RIPPLE_CARRY) port map(A, B, Cin, F, Cout);
end architecture;
