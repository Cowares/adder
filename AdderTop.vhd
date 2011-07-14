library IEEE;
use ieee.std_logic_1164.all;
use work.common.all;

entity AdderTop is
	port (
		A: in std_logic_vector;
		B: in std_logic_vector;
		Cin: in std_logic;
		Sum: out std_logic_vector;
		Cout: out std_logic
	);
end entity;

architecture Behavioral of AdderTop is

begin
AdderInst:	Adder generic map(HAN_CARLSON) port map(A, B, Cin, Sum, Cout);
end architecture;
