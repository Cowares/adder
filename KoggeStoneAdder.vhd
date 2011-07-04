library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.common.all;

entity KoggeStoneAdder is
	port (	
		P: in std_logic_vector;
		G: in std_logic_vector;
		cin: in std_logic;
		sum: out std_logic_vector;
		cout: out std_logic
	);
end KoggeStoneAdder;

architecture Behavioral of KoggeStoneAdder is
	signal len: natural := log2(P'length + 1);
	--signal dist: integer;
	
	type tmpArr is array(len - 1 downto 0) of std_logic_vector((P'high - P'low + 1) downto 0);
	signal tP: tmpArr;
	signal tG: tmpArr;
	
begin
				--P, G, Cin in tmp Feld laden
				tG(0)(0) <= cin;
				tP(0)(0) <= '1';
forGen:		for i in G'Low to G'High generate
					tG(0)(i - P'Low + 1) <= G(i);
					tP(0)(i - P'Low + 1) <= P(i);
				end generate;



stGen0:		for i in 1 to (len - 1) generate
stGen1:			for j in 0 to G'Length generate
	
						--dist <= j - 2 ** i;
					
g1:					if (j < 2 ** i) generate
							tG(i)(j) <= tG(i - 1)(j);
							tP(i)(j) <= tP(i - 1)(j);
						end generate;			
						
						
ifGen:				if (j >= 2 ** i) generate
prfxInst:				Prefix port map(tG(i - 1)(j), tP(i - 1)(j),  
														  tG(i - 1)(j - 2 ** i), tP(i - 1)(j - 2 ** i),
													     tG(i)(j), tP(i)(j));	
						end generate;
										  
					end generate;
				end generate;
	
g2:			for i in 0 to G'Length - 1 generate
					sum(i + sum'Low) <= tG(len - 1)(i);
				end generate;
				
				cout <= tG(len - 1)(G'Length);


end Behavioral;
