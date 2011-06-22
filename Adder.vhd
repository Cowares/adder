library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
	
entity Adder is	
	Generic (
		carry_gen : carry_unit_t
	);
	Port (
		a : in  STD_LOGIC_VECTOR;
		b : in  STD_LOGIC_VECTOR;
		cin : in  STD_LOGIC;
		sum : out  STD_LOGIC_VECTOR;
		cout : out  STD_LOGIC
	);
end Adder;

architecture Behavioral of Adder is

	type carry_unit_t is (
		ripple_carry
		, bcla
		, bclar
	);

	signal P, G, C : std_logic_vector(a'HIGH downto a'LOW);
	signal PG, GG : std_logic;
begin
GPUgen:  	for i in a'LOW to a'HIGH generate
GPUInst: 		GPU port map(a(i), b(i), P(i), G(i));
				end generate;
RCUgen: 		if (carry_gen = ripple_carry) generate
RCUInst:   		RCU port map(cin,P,G,C,Cout);
				end generate;
CLAUgen:		if (carry_gen = bcla) generate
CLAUInst:		CLAU port map(cin, P, G, C, PG, GG);
					cout <= (PG and cin) or GG;				
				end generate;
CLARUgen:	if (carry_gen = bclar) generate
CLAURInst:		CLARU port map(cin, P, G, C, PG, GG);
					cout <= (PG and cin) or GG;				
				end generate;
SUMgen: 		for i in a'RIGHT to a'LEFT generate
					sum(i) <= P(i) xor C(i);
				end generate;
end Behavioral;
