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
	--variable dist: integer;


	signal len: natural := log2(P'length + 1);
	signal dist: integer;
	
	type tmpArr is array(len - 1 to 0) of std_logic_vector((P'high - P'low + 1) downto 0);
	signal tP: tmpArr;
	signal tG: tmpArr;
	
begin
				--P, G, Cin in tmp Feld laden
				tG(0)(0) <= cin;
				tP(0)(0) <= '1';
forGen:		for i in tG'high to 1 generate
					tG(0)(i) <= G(i + G'low);
					tP(0)(i) <= P(i + P'low);
				end generate;



stGen0:		for i in 1 to (len - 1) generate
stGen1:			for j in 0 to tG'high generate
	
						--dist <= j - i ** 2;
						
						if (j < 2 ** i) then
							tG(i)(j) <= tG(i - 1)(j);
							tP(i)(j) <= tP(i - 1)(j);
						end if;			
						
						
ifGen:				if (j >= 2 ** i) generate
prfxInst:				Prefix port map(tG(i - 1)(j), tP(i - 1)(j),  
														  tG(i - 1)(j - dist), tP(i - 1)(j - dist),
													     tG(i)(j), tP(i)(j));	
						end generate;
										  
					end generate;
				end generate;
	


end Behavioral;
