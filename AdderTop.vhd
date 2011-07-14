library IEEE;
use ieee.std_logic_1164.all;
use work.common.all;

entity AdderTop is
	port (
		A: in std_logic_vector(7 downto 0);
		B: in std_logic_vector(7 downto 0);
		Cin: in std_logic;
		Sum: out std_logic_vector(7 downto 0);
		Cout: out std_logic
	);
end entity;

architecture Behavioral of AdderTop is

begin
AdderInst:	Adder generic map(BRENT_KUNG) port map(A, B, Cin, Sum, Cout);
end architecture;
