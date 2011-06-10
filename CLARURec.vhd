----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:30:11 05/20/2011 
-- Design Name: 
-- Module Name:    CLARURec - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.modules.all;

entity CLARURec is
	port ( 	Cin : in std_logic;
		P : in std_logic_vector;
		G : in std_logic_vector;
		C : out std_logic_vector;
		PG : out std_logic;
		GG : out std_logic
	);
--begin
--	assert((P'LENGTH = G'LENGTH) and (P'LENGTH = C'LENGTH));
--	assert((P'LEFT = G'LEFT) and (P'LEFT = C'LEFT));
--	assert(not P'ASCENDING);
end CLARURec;

architecture Behavioural of CLARURec is

	signal PGint, GGint, Cint : std_logic_vector(3 downto 0);
	
begin
rec_base: if P'LENGTH <= 4 generate
CLAUgen:	CLARU port map (Cin, P, G, C, PG, GG);
	end generate;
CLAU5to8: if (4 < P'LENGTH) and (P'LENGTH <= 8) generate
inst1	: 	CLARU port map (Cin,PGint(1 downto 0), GGint(1 downto 0), Cint(1 downto 0), PG, GG);
inst2   :	CLARU port map (Cint(1),
					 P(P'LEFT downto (P'LENGTH / 2)+P'RIGHT), 
			       G(P'LEFT downto (P'LENGTH / 2)+P'RIGHT), 
			       C(P'LEFT downto (P'LENGTH / 2)+P'RIGHT),
			       PGint(1),GGint(1));
inst3   :	CLARU port map (Cint(0),
			       P((P'LENGTH / 2 - 1) + P'RIGHT downto P'RIGHT), 
			       G((P'LENGTH / 2 - 1) + P'RIGHT downto P'RIGHT), 
			       C((P'LENGTH / 2 - 1) + P'RIGHT downto P'RIGHT), 			       
			       PGint(0),GGint(0));
 	end generate;
CLAU9to12 : if (8 < P'LENGTH) and (P'LENGTH <= 12) generate
inst4	: 	CLARU port map (Cin,PGint(2 downto 0), GGint(2 downto 0), Cint(2 downto 0), PG, GG);
inst5   :	CLARU port map (Cint(2),
			       P(P'LEFT downto 2*(P'LENGTH / 3)+P'RIGHT), 
			       G(P'LEFT downto 2*(P'LENGTH / 3)+P'RIGHT), 
			       C(P'LEFT downto 2*(P'LENGTH / 3)+P'RIGHT),
			       PGint(2),GGint(2));
inst6   :	CLARU port map (Cint(1),
			       P((2 * (P'LENGTH / 3) - 1)+P'RIGHT downto (P'LENGTH / 3)+P'RIGHT), 
			       G((2 * (P'LENGTH / 3) - 1)+P'RIGHT downto (P'LENGTH / 3)+P'RIGHT), 
			       C((2 * (P'LENGTH / 3) - 1)+P'RIGHT downto (P'LENGTH / 3)+P'RIGHT),
			       PGint(1),GGint(1));
inst7   :	CLARU port map (Cint(0),
			       P((P'LENGTH / 3 - 1)+P'RIGHT downto P'RIGHT), 
			       G((P'LENGTH / 3 - 1)+P'RIGHT downto P'RIGHT), 
			       C((P'LENGTH / 3 - 1)+P'RIGHT downto P'RIGHT),
			       PGint(0),GGint(0));
	end generate;
CLAUab13 : if (12 < P'LENGTH) generate
inst8	: 	CLARU port map (Cin,PGint, GGint, Cint, PG, GG);
inst9   :	CLARURec port map (Cint(3),
			       P(P'LEFT downto 3*(P'LENGTH / 4)+P'RIGHT), 
			       G(P'LEFT downto 3*(P'LENGTH / 4)+P'RIGHT), 
			       C(P'LEFT downto 3*(P'LENGTH / 4)+P'RIGHT),
			       PGint(3),GGint(3));
inst10   :	CLARURec port map (Cint(2),
			       P((3 * (P'LENGTH / 4) - 1)+P'RIGHT downto 2*(P'LENGTH / 4)+P'RIGHT), 
			       G((3 * (P'LENGTH / 4) - 1)+P'RIGHT downto 2*(P'LENGTH / 4)+P'RIGHT), 
			       C((3 * (P'LENGTH / 4) - 1)+P'RIGHT downto 2*(P'LENGTH / 4)+P'RIGHT),
			       PGint(2),GGint(2));
inst11   :	CLARURec port map (Cint(1),
			       P((2 * (P'LENGTH / 4) - 1)+P'RIGHT downto (P'LENGTH / 4)+P'RIGHT), 
			       G((2 * (P'LENGTH / 4) - 1)+P'RIGHT downto (P'LENGTH / 4)+P'RIGHT), 
			       C((2 * (P'LENGTH / 4) - 1)+P'RIGHT downto (P'LENGTH / 4)+P'RIGHT),
			       PGint(1),GGint(1));
inst12   :	CLARURec port map (Cint(0),
			       P((P'LENGTH / 4 - 1)+P'RIGHT downto P'RIGHT), 
			       G((P'LENGTH / 4 - 1)+P'RIGHT downto P'RIGHT), 
			       C((P'LENGTH / 4 - 1)+P'RIGHT downto P'RIGHT),
			       PGint(0),GGint(0));
	end generate;
end architecture;

