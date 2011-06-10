library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity GPU is
	port ( 	a : in std_logic;
		b : in std_logic;
		P : out std_logic;
		G : out std_logic
	);
end GPU;

architecture Behavioural of gpu is 
begin
	P <= a xor b;
	G <= a and b;
end Behavioural;


