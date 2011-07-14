library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.common.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity KoggeStoneAdder is
	port (	
		P: in std_logic_vector;
		G: in std_logic_vector;
		CIn: in std_logic;
		C: out std_logic_vector
	);
end KoggeStoneAdder;

architecture Behavioral of KoggeStoneAdder is
	constant len: natural := log2(P'length);
	
	type tmpArr is array(len downto 0) of std_logic_vector(P'High downto P'Low);
	signal tP: tmpArr;
	signal tG: tmpArr;
	signal dummy: std_logic;
	
	
begin			
				tG(0)(0) <= CIn;
				tP(0)(0) <= '1';
				tG(0)(P'High - 1 downto P'Low) <= G(G'High - 1 downto G'Low);
				tP(0)(P'High - 1 downto P'Low) <= P(P'High - 1 downto P'Low);		

stGen0:		for i in 1 to len generate
stGen1:			for j in 0 to P'High generate
					
g1:					if (j < 2 ** (i-1)) generate
							tG(i)(j) <= tG(i - 1)(j);
							tP(i)(j) <= tP(i - 1)(j);
						end generate;			
						
						
ifGen:				if (j >= 2 ** (i-1)) generate
prfxInst:				BetterPrefix port map(tG(i - 1)(j), tP(i - 1)(j),  
														  tG(i - 1)(j - 2 ** (i-1)), tP(i - 1)(j - 2 ** (i-1)),
													     tG(i)(j), tP(i)(j));	
						end generate;
										  
					end generate;
				end generate;
				
				C(C'High - 1 downto C'Low) <= tG(len)(P'High - 1 downto P'Low);
msb:			BetterPrefix port map (G(G'High), P(P'High),
												tG(len)(P'High - 1), tP(len)(P'High - 1),
												C(C'High), dummy);				
				
end Behavioral;
