library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_GPU is
end tb_GPU;

architecture TESTBENCH of tb_GPU is
	component GPU is
		port ( 	a : in std_logic;
			b : in std_logic;
			P : out std_logic;
			G : out std_logic
		);
	end component GPU;
	signal a, b, P, G : std_logic := '0';
begin
p_stimuli: process
begin
	for i in 0 to 1 loop
		for j in 0 to 1 loop
			wait for 10 ns;
			a <= not a;
		end loop;
		b <= not b;
	end loop;
end process;
UUT: GPU port map(a, b, P, G);
end architecture TESTBENCH;
