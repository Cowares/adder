library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Prefix is
	port (
		a: in std_logic;
		b: in std_logic;
		c: in std_logic;
		d: in std_logic;
		e: out std_logic;
		f: out std_logic
	);
end prefix;

architecture Behavioral of prefix is
begin
	e <= a or (b and c);
	f <= b and d;
end Behavioral;
