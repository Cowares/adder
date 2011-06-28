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
	
	--component Prefix
	--end component;
end KoggeStoneAdder;

architecture Behavioral of KoggeStoneAdder is
	signal tP: std_logic_vector((P'high - P'low + 1) downto 0);
	signal tG: std_logic_vector((P'high - P'low + 1) downto 0);
begin
	
forGen:		for i in tP'high to 1 generate
					tP(i) <= P(i + P'low);
					tG(i) <= G(i + G'low);
				end generate;


stageGen:	for i in 1 to log2(tP'length) generate
prfxInst:		entity Prefix port map();					
				end generate;
	


end Behavioral;
