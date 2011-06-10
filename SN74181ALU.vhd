library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SN74181ALU is
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
begin
	assert((A'LENGTH = B'LENGTH) and (A'LENGTH = F'LENGTH));
	assert(not A'ASCENDING);
	assert((A'RIGHT = B'RIGHT) and (A'RIGHT = F'RIGHT));
end entity SN74181ALU;

architecture structural of SN74181ALU is
	component SN74181GPU
		port (
			S : in std_logic_vector(3 downto 0);
			M : in std_logic;
			A : in std_logic;
			B : in std_logic;
			P : out std_logic;
			G : out std_logic;
			R : out std_logic
		);
	end component;
	component RCU is
		port ( 	Cin : in std_logic;
			P : in std_logic_vector;
			G : in std_logic_vector;
			C : out std_logic_vector;
			Cout : out std_logic
		);
	end component;
	component norGate is
		port(
			A : in std_logic_vector;
			Y : out std_logic
		);
	end component;
	signal P, G, C, R, Rint : std_logic_vector(A'LEFT downto A'RIGHT);
	signal Cint, Cout : std_logic;
begin
			Cint <= Cin nor M;
GPUgen : for i in A'RIGHT to A'LEFT generate
GPUinst :  SN74181GPU port map (S, M, A(i), B(i), P(i), G(i), R(i));
			end generate;
CUgen:	RCU port map (Cint, P, G, C, Cout);
SUMgen : for i in A'RIGHT to A'LEFT generate
	    Rint(i) <= R(i) xor C(i);
	 end generate;
			F <= Rint;
			CF <= not Cout;
Zinst:	norGate port map(Rint,ZF);
			SF <= Rint(A'LEFT);
			OV <= C(A'LEFT) xor Cout;
end architecture;
 



