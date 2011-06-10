library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_Add is
end entity tb_Add;

architecture testbench of tb_Add is
	component RCA_Add is
		port (	A : in std_logic_vector;
			B : in std_logic_vector;
			Cin : in std_logic;
			S : out std_logic_vector;
			Cout : out std_logic
		);
	end component RCA_Add;
	signal A, B, S : std_logic_vector(3 downto 0);
	signal Cin, Cout : std_logic;
begin
p_stimuli : process
begin
	Cin <= '0';
	for i in 0 to 15 loop
		A <= CONV_STD_LOGIC_VECTOR(i,4);
		for j in 0 to 15 loop
			B <= CONV_STD_LOGIC_VECTOR(j,4);
			wait for 10 ns;
		end loop;
	end loop;
	Cin <= '0';
	for i in 0 to 15 loop
		A <= CONV_STD_LOGIC_VECTOR(i,4);
		for j in 0 to 15 loop
			B <= CONV_STD_LOGIC_VECTOR(j,4);
			wait for 10 ns;
		end loop;
	end loop;
end process;
UUT: RCA_Add port map (A, B, Cin, S, Cout);
end architecture;

