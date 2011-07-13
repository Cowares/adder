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
		C: out std_logic_vector
	);
end KoggeStoneAdder;

architecture Behavioral of KoggeStoneAdder is
	constant len: natural := log2(P'length);
	
	type tmpArr is array(len - 1 downto 0) of std_logic_vector(P'High downto P'Low);
	signal tP: tmpArr;
	signal tG: tmpArr;
	
begin			
				tG(0)(P'High downto P'Low) <= G;
				tP(0)(P'High downto P'Low) <= P;		

stGen0:		for i in 1 to (len - 1) generate
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
				
				C <= tG(len-1)(P'High downto P'Low);
end Behavioral;
