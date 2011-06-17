library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity tb_Add is
end entity tb_Add;

architecture CLA_testbench of tb_Add is
	constant n : natural := 9;
	component CLA_Add is
		port (	A : in std_logic_vector;
			B : in std_logic_vector;
			Cin : in std_logic;
			S : out std_logic_vector;
			Cout : out std_logic
		);
	end component CLA_Add;
	signal A, B, S : std_logic_vector(n downto 0);
	signal Cin : std_logic;
	signal Cout : std_logic_vector(0 downto 0);
begin
p_stimuli : process
	variable summe : std_logic_vector(n+1 downto 0);
begin
	Cin <= '0';
	for i in 0 to 2**(n+1)-1 loop
		A <= CONV_STD_LOGIC_VECTOR(i,n+1);
		for j in 0 to 2**(n+1)-1 loop
			B <= CONV_STD_LOGIC_VECTOR(j,n+1);
			wait for 10 ns;
			summe := Cout & S;
			assert(summe = CONV_STD_LOGIC_VECTOR(i + j,n+2))
			report "Fehler"; 
		end loop;
	end loop;
	Cin <= '1';
	for i in 0 to 2**(n+1)-1 loop
		A <= CONV_STD_LOGIC_VECTOR(i,n+1);
		for j in 0 to 2**(n+1)-1 loop
			B <= CONV_STD_LOGIC_VECTOR(j,n+1);
			wait for 10 ns;
			summe := Cout & S;
			assert(summe = CONV_STD_LOGIC_VECTOR(i + j + 1,n+2))
			report "Fehler" ;
		end loop;
	end loop;
	wait;
end process;
UUT: CLA_Add port map (A, B, Cin, S, Cout(0));
end architecture;


