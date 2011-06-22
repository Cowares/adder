library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_SN74181ALU is
end entity;

architecture test of tb_SN74181ALU is
	constant n : natural := 4;
	component SN74181ALU 
		port(
			A : in std_logic_vector;
			B : in std_logic_vector;
			S : in std_logic_vector(3 downto 0);
			Cin : in std_logic;
			M : in std_logic;
			F : out std_logic_vector;
			CF : out std_logic;
			ZF : out std_logic;
			SF : out std_logic;
			OV : out std_logic
		);
	end component;
	signal A, B, R : std_logic_vector(n-1 downto 0);
	signal S : std_logic_vector(3 downto 0);
	signal M, Cin : std_logic;
	signal CF, ZF, SF, OV : std_logic;
begin
UUT: SN74181ALU port map(A, B, S, Cin, M, R, CF, ZF, SF, OV);
stimuli:
	process 
	begin
		Cin <= '0'; M <= '1';
		for cmd in 0 to 15 loop
			S <= CONV_STD_LOGIC_VECTOR(cmd,4);
			for j in 0 to 15 loop
				A <= CONV_STD_LOGIC_VECTOR(j,4);
				for k in 0 to 15 loop
					B <= CONV_STD_LOGIC_VECTOR(k,4);
					wait for 10 ns;
				end loop;
			end loop;
		end loop;
		Cin <= '0'; M <= '0';
		for cmd in 0 to 15 loop
			S <= CONV_STD_LOGIC_VECTOR(cmd,4);
			for j in 0 to 15 loop
				A <= CONV_STD_LOGIC_VECTOR(j,4);
				for k in 0 to 15 loop
					B <= CONV_STD_LOGIC_VECTOR(k,4);
					wait for 10 ns;
				end loop;
			end loop;
		end loop;
		Cin <= '1'; M <= '0';
		for cmd in 0 to 15 loop
			S <= CONV_STD_LOGIC_VECTOR(cmd,4);
			for j in 0 to 15 loop
				A <= CONV_STD_LOGIC_VECTOR(j,4);
				for k in 0 to 15 loop
					B <= CONV_STD_LOGIC_VECTOR(k,4);
					wait for 10 ns;
				end loop;
			end loop;
		end loop;
		wait;
	end process;
end architecture;
