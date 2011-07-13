library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.common.all;

entity HanCarlson is

	port(
	P : in std_logic_vector(7 downto 0);
	G : in std_logic_vector(7 downto 0);
	C : out std_logic_vector(7 downto 0)
	);
	
end HanCarlson;

architecture Behavioral of HanCarlson is

constant max : integer := P'length;
type matrix is array(1 downto 0) of std_logic_vector(P'length-1 downto 0);
signal zweP : matrix;
signal zweG : matrix;

begin

zweP(0)(P'length-1 downto 0) <= P;
zweG(0)(P'length-1 downto 0) <= G;
zweP(1)(0)<=zweP(0)(0);
zweG(1)(0)<=zweG(0)(0);
l2:for i in 1 to max-1 generate
	l3:if((i mod 2) = 1) generate
		PreINST: Prefix port map (zweP(0)(i),
										  zweG(0)(i),
										  zweP(0)(i-1),
										  zweG(0)(i-1),
										  zweP(1)(i),
										  zweG(1)(i));
		end generate;
		l4:if((i mod 2) /= 1) generate
			zweP(1)(i) <= zweP(0)(i);
			zweG(1)(i) <= zweG(0)(i);
		end generate;
end generate;
	



end Behavioral;
