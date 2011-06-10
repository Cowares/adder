library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DFFpen is
	port( 	D : in std_logic_vector;
		EN : in std_logic;
		CLK : in std_logic;
		Q : out std_logic_vector
	);
end entity DFFpen;

architecture Behavioural of DFFpen is
begin
store: process(CLK)
		variable Qint : std_logic_vector(D'LEFT downto D'RIGHT);
	begin
		if RISING_EDGE(CLK) and (EN = '1') then
			Qint := D;
		end if;
		Q <= Qint;
	end process;
end architecture;
