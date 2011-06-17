library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CLARU is
	port (
		Cin : in std_logic;
		P : in std_logic_vector;
		G : in std_logic_vector;
		C : out std_logic_vector;
		PG : out std_logic;
		GG : out std_logic
	);
end CLARU;

architecture Behavioral of CLARU is
	signal PGchain : std_logic_vector(P'HIGH downto P'LOW);
	signal GGchain : std_logic_vector(G'HIGH downto G'LOW);
	signal Cchain : std_logic_vector(C'HIGH downto C'LOW);
begin
				Cchain(0) <= Cin;
				C(0) <= Cin;
				PGchain(0) <= P(0);
				GGchain(0) <= G(0);
seqgen:		for i in P'LOW to (P'HIGH-1) generate
					Cchain(i+1) <= (P(i) and Cchain(i)) or G(i);
					C(i+1) <= Cchain(i+1);
					PGchain(i+1) <= P(i+1) and PGchain(i);
					GGchain(i+1) <= (P(i+1) and GGchain(i)) or G(i+1);
				end generate;
				PG <= PGchain(P'HIGH);
				GG <= GGchain(G'HIGH);
end Behavioral;
