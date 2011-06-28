library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use common.all;

entity KoggeStoneAdder is
	port (	
		P: in std_logic_vector;
		G: in std_logic_vector;
		cin: in std_logic;
		cout: out std_logic
	);
end KoggeStoneAdder;

architecture Behavioral of KoggeStoneAdder is

begin



stageGen:	for i in 1 to log2(P'length) generate
prfxInst:		Prefix port map("1");					
				end generate;
	


end Behavioral;
