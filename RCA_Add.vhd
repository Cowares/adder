library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RCA_Add is
	port (	A : in std_logic_vector;
		B : in std_logic_vector;
		Cin : in std_logic;
		S : out std_logic_vector;
		Cout : out std_logic
	);
--begin
--	assert((A'RIGHT = 0) and (B'RIGHT = 0) and (S'RIGHT = 0));
--	assert((A'LEFT = B'LEFT) and (A'LEFT = S'LEFT));
--	assert(not A'ASCENDING);
end entity RCA_Add;

architecture Behavioural of RCA_Add is
	component GPU is
		port ( 	a : in std_logic;
			b : in std_logic;
			P : out std_logic;
			G : out std_logic
		);
	end component GPU;
	component rcu is
		port ( 	Cin : in std_logic;
			P : in std_logic_vector;
			G : in std_logic_vector;
			C : out std_logic_vector;
			Cout : out std_logic
		);
	end component rcu;
	signal P, G, C : std_logic_vector(A'LEFT downto A'RIGHT);
begin
GPUgen: for i in A'RIGHT to A'LEFT generate
GPUunit: 	GPU port map (A(i),B(i),P(i),G(i));
	end generate;
RCunit: rcu port map(Cin,P,G,C,Cout);
SUMgen: for i in A'RIGHT to A'LEFT generate
		S(i) <= P(i) xor C(i);
	end generate;
end architecture;



