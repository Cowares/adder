library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CLA_Add is
	port (
		A : in std_logic_vector;
		B : in std_logic_vector;
		Cin : in std_logic;
		S : out std_logic_vector;
		Cout : out std_logic
	);
--begin
--	assert((A'LENGTH = B'LENGTH) and (A'LENGTH = S'LENGTH));
--	assert((A'RIGHT = B'RIGHT) and (A'RIGHT = S'RIGHT));
--	assert(not A'ASCENDING);
end entity CLA_Add;

architecture Behavioural of CLA_Add is
	component GPU is
		port (
			a : in std_logic;
			b : in std_logic;
			P : out std_logic;
			G : out std_logic
		);
	end component GPU;
	component CLAURec is
		port (
			Cin : in std_logic;
			P : in std_logic_vector;
			G : in std_logic_vector;
			C : out std_logic_vector;
			PG: out std_logic;
			GG: out std_logic
		);
	end component CLAURec;
	signal P, G, C : std_logic_vector(A'LEFT downto A'RIGHT);
	signal PG, GG : std_logic;
begin
GPUgen:		for i in A'RIGHT to A'LEFT generate
GPUunit: 		GPU port map (A(i),B(i),P(i),G(i));
				end generate;
CLAunit:		CLAURec port map(Cin,P,G,C,PG,GG);
				Cout <= (PG and Cin) or GG;
SUMgen: 		for i in A'RIGHT to A'LEFT generate
					S(i) <= P(i) xor C(i);
				end generate;
end architecture;
