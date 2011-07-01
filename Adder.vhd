library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.common.all;
	
entity Adder is
	Generic (
		carry_unit: carry_unit_t
	);
	Port (
		a: in  STD_LOGIC_VECTOR;
		b: in  STD_LOGIC_VECTOR;
		cin: in  STD_LOGIC;
		sum: out  STD_LOGIC_VECTOR;
		cout: out  STD_LOGIC
	);
end Adder;

architecture Behavioral of Adder is
	signal P, G, C : std_logic_vector(a'HIGH downto a'LOW);
	signal PG, GG : std_logic;
	
	COMPONENT GPU 
	port ( 	
		a: in std_logic;					-- Input bit 1
		b: in std_logic;					-- Input bit 2
		P: out std_logic;					-- Output Sum(a,b) 
		G: out std_logic					-- Output Carry (a,b)
	);
	end COMPONENT;
begin

GPUgen:  	for i in a'LOW to a'HIGH generate
GPUInst: 		entity GPU port map(a(i), b(i), P(i), G(i));
				end generate;
				
BrnKunGen:	if (carry_unit = BRENT_KUNG) generate
--BrnKunInt:				
				end generate;
				
HnCrlsGen:	if (carry_unit = HAN_CARLSON) generate
HnCrlsInst:	HanCarlson generic map (a'LENGTH-1) port map(P,G,cin,C);			
				end generate;
				
KoStnGen:	if (carry_unit = KOGGE_STONE) generate
--KoStnInst:		KoggeStoneAdder port map(P, G, cin);
				end generate;			
				
CLAGen:		if (carry_unit = CARRY_LOOK_AHEAD) generate
CLAInst:		CLAURec port map(Cin,P,G,C,PG,GG);
				cout <= (PG and Cin) or GG;
				end generate;
				
CSAGen:		if (carry_unit = CARRY_SAVE_ADDER) generate
--CSAInst:		;
				end generate;
				
CLARecGen:		if (carry_unit = CARRY_LOOK_AHEAD_whatever) generate
--CLARecInst:		;
				end generate;				
				
SUMgen: 		for i in a'RIGHT to a'LEFT generate
					sum(i) <= P(i) xor C(i);
				end generate;
end Behavioral;
