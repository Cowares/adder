library IEEE;
use ieee.std_logic_1164.all;
use work.common.all;

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

COMPONENT Adder
	Generic (
		carry_unit: carry_unit_t
	);
	Port (
		a: in  STD_LOGIC_VECTOR;
		b: in  STD_LOGIC_VECTOR;
		cin: in  STD_LOGIC;
		sum: out  STD_LOGIC_VECTOR;
		cout: out  STD_LOGIC
	);
end COMPONENT;

begin
AdderInst:	Adder generic map(HAN_CARLSON) port map(A, B, Cin, F, Cout);
end architecture;
