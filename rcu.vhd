library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RCU is
	port ( 	Cin : in std_logic;
		P : in std_logic_vector;
		G : in std_logic_vector;
		C : out std_logic_vector;
		Cout : out std_logic
	);
end RCU;

architecture Behavioural of RCU is 
	signal Cint : std_logic_vector(C'LEFT downto C'RIGHT);
begin
	Cint(C'RIGHT) <= Cin ;
	C(C'RIGHT) <= Cin;
CGen:	for i in C'RIGHT+1 to C'LEFT generate
		Cint(i) <= (P(i-1) and Cint(i-1)) or G(i-1);
		C(i) <= Cint(i);
	end generate;
	Cout <= (P(P'LEFT) and Cint(P'LEFT)) or G(P'LEFT);
end Behavioural;

