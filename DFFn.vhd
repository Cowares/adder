library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DFFn is
	port( 	D : in std_logic_vector;
		CLK : in std_logic;
		Q : out std_logic_vector
	);
end entity DFFn;

architecture Behavioural of DFFn is
begin
store: process(CLK)
		variable Qint : std_logic_vector(D'LEFT downto D'RIGHT);
	begin
		if FALLING_EDGE(CLK)  then
			Qint := D;
		end if;
		Q <= Qint;
	end process;
end architecture;
