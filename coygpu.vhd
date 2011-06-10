library ieee;
use ieee.std_logic_1164.all;

entity COYGPU is
	port (
		a : in std_logic;
		b : in std_logic;
		cmd : in std_logic_vector(2 downto 0);
		P : out std_logic;
		G : out std_logic
	);
end entity;

architecture logic of COYGPU is
	signal Aint, Bint, notB : std_logic;
begin
	notB <= not b;
	Aint <= (cmd(1) and notB) or (cmd(2) and B);
	Bint <= (notB and not cmd(0) and cmd(1)and not cmd(2)) or A or (B and not cmd(2) and not cmd(1) and not cmd(0));
	P <= Aint xor Bint;
	G <= Aint and Bint and cmd(0);
end architecture;
