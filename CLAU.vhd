library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CLAU is
	port (
		Cin : in std_logic;
		P : in std_logic_vector;
		G : in std_logic_vector;
		C : out std_logic_vector;
		PG : out std_logic;
		GG : out std_logic
	);
begin
--	assert((0 < P'LENGTH) and (P'LENGTH <= 4));
--	assert((P'LENGTH = G'LENGTH) and (P'LENGTH = C'LENGTH));
--	assert((P'LEFT = G'LEFT) and (P'LEFT = C'LEFT));
--	assert(not P'ASCENDING);
end CLAU;

architecture Behavioural of CLAU is 
	signal Cint : std_logic_vector(C'LEFT downto C'RIGHT);
begin
				C(C'RIGHT) <= Cin;
PGT0: 		if P'LENGTH > 1 generate
					C(C'RIGHT+1) <= (P(P'RIGHT) and Cin) or G(G'RIGHT);
				end generate;
PGT1:			if P'LENGTH > 2 generate
					C(C'RIGHT+2) <= (P(P'RIGHT+1) and P(P'RIGHT) and Cin) or (P(P'RIGHT+1) and G(G'RIGHT)) or G(G'RIGHT+1);
				end generate;
PGT2:			if P'LENGTH > 3 generate
					C(C'RIGHT+3) <= (P(P'RIGHT+2) and P(P'RIGHT+1) and P(P'RIGHT) and Cin) or (P(P'RIGHT+2) and P(P'RIGHT+1) and G(G'RIGHT)) or (P(P'RIGHT+2) and G(G'RIGHT+1)) or G(G'RIGHT+2);
				end generate;
PR1:			if (P'LENGTH = 1) generate
					GG <= G(G'RIGHT);
					PG <= P(P'RIGHT);
				end generate;
PR2:			if (P'LENGTH = 2) generate
					GG <= (P(P'RIGHT+1) and G(G'RIGHT)) or G(G'RIGHT+1);
					PG <= P(P'RIGHT+1) and P(P'RIGHT);
				end generate;
PR3:			if (P'LENGTH = 3) generate
					GG <= (P(P'RIGHT+2) and P(P'RIGHT+1) and G(G'RIGHT)) or (P(P'RIGHT+2) and G(G'RIGHT+1)) or G(G'RIGHT+2);
					PG <= P(P'RIGHT+2) and P(P'RIGHT+1) and P(P'RIGHT);
				end generate;
PR4:			if (P'LENGTH = 4) generate
					GG <= (P(P'RIGHT+3) and P(P'RIGHT+2) and P(P'RIGHT+1) and G(G'RIGHT)) or (P(P'RIGHT+3) and P(P'RIGHT+2) and G(G'RIGHT+1)) or (P(P'RIGHT+3) and G(G'RIGHT+2)) or G(G'RIGHT+3);
					PG <= P(P'RIGHT+3) and P(P'RIGHT+2) and P(P'RIGHT+1) and P(P'RIGHT);
				end generate;
end Behavioural;
