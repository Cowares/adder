library ieee;
use ieee.std_logic_1164.all;

entity COYALU is
	port(
		A : in std_logic_vector;
		B : in std_logic_vector;
		cmd : std_logic_vector(2 downto 0);
		Cin : in std_logic;
		F : out std_logic_vector;
		CF : out std_logic;
		ZF : out std_logic;
		SF : out std_logic;
		OV : out std_logic
	);
--begin
--	assert((A'LENGTH = B'LENGTH) and (A'LENGTH = F'LENGTH));
--	assert((A'LEFT = B'LEFT) and (A'LEFT = F'LEFT));
--	assert(not A'ASCENDING);
end entity COYALU;

architecture structural of COYALU is 
	component COYGPU is
		port (
			a : in std_logic;
			b : in std_logic;
			cmd : in std_logic_vector(2 downto 0);
			P : out std_logic;
			G : out std_logic
		);
	end component;
	component RCU is
		port ( 	Cin : in std_logic;
			P : in std_logic_vector;
			G : in std_logic_vector;
			C : out std_logic_vector;
			Cout : out std_logic
		);
	end component RCU;
	component norGate is
		port(
			A : in std_logic_vector;
			Y : out std_logic
		);
	end component;

	signal P, G, C, Fint : std_logic_vector(A'RANGE);
	signal CFint : std_logic;
begin
GPUgen:
	for i in A'LOW to A'HIGH generate
GPUinst:	COYGPU port map(A(i), B(i), cmd, P(i), G(i));
	end generate;
CGen: RCU port map(Cin, P, G, C, CFint);
sumgen: 
	for i in A'LOW to A'HIGH generate
		Fint(i) <= P(i) xor C(i);
	end generate;
	F <= Fint;
	CF <= CFint;
ZFinst: norGate port map(Fint,ZF);
	SF <= Fint(A'HIGH);
	OV <= CFint xor C(A'HIGH);

end architecture;
	
	

