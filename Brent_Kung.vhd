library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.common.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BrentKung is
    port(
    P : in std_logic_vector;
    G : in std_logic_vector;
	 cin : in std_logic;
	 C : out std_logic_vector
    );
    
end BrentKung;

architecture Behavioral of BrentKung is
constant len: natural := 2*(log2(P'LENGTH)-1)+1;
constant bau:natural := 0;
type tmpArr is array(len downto 0) of std_logic_vector(P'LENGTH downto 0);
	signal tP: tmpArr;
	signal tG: tmpArr;

begin
--cin auf G0
--P0=1
tP(0)(0) <= '1';
tG(0)(0) <= cin;
	tP(0)(P'Length downto 1) <= P;
   tG(0)(G'Length downto 1) <= G;

--oberen baum bauen 

l2: for j in 0 to log2(P'Length)-1 generate
l3:    for i in 0 to P'LENGTH-1 generate
l4:        if (i>=1 and mymod(i, 2**(j+1)) = 1) generate
                PreINST: BetterPrefix port map (
					 tG(j)(i),
					 tP(j)(i),
					 tG(j)(i-2**j),
					 tP(j)(i-2**j),
					 tG(j+1)(i),
					 tP(j+1)(i));
           end generate;
l5:        if((mymod(i, 2**(j+1))) /= 1) generate
                tG(j+1)(i) <= tG(j)(i);
					 tP(j+1)(i) <= tP(j)(i);
            end generate;
        end generate;
		   --tG(j+1)(G'Length) <= tG(j)(G'Length);
			--tP(j+1)(P'Length) <= tP(j)(P'Length);
    end generate;
	 
----oberen baum gebaut 
----unteren baum bauen    


    
l6: for j in log2(P'Length) to len-1 generate
l61:	for l in 0 to (2**(len-j)-1) generate
			tG(j+1)(l) <= tG(j)(l);
			tP(j+1)(l) <= tP(j)(l);
		end generate;
l7:	for i in (2**(len-j)-1) to P'LENGTH-1 generate
l71:		if((mymod((i-(2**(len-j)-1)) , (2**(len-j)))  = 0) and (i + 2**(len-j - 1) <= P'LENGTH -1)) generate
				--Platzierung der Prefixes
				PreINST: BetterPrefix port map (
					tG(j)(i + 2**(len-j - 1)),
					tP(j)(i + 2**(len-j - 1)),
					tG(j)(i),
					tP(j)(i),
					tG(j+1)(i + 2**(len-j - 1)),
					tP(j+1)(i + 2**(len-j - 1)));
					--weiterleitung vom aktuellen i zur gebauten prefixeinheit
l73:				for k in i to ((i + 2**(len-j - 1)-1) ) generate
						tG(j+1)(k) <= tG(j)(k);
						tP(j+1)(k) <= tP(j)(k);				
						end generate;
l74:				for k in ((i + 2**(len-j - 1)+1) ) to i+2**(len-j) generate
						tG(j+1)(k) <= tG(j)(k);
						tP(j+1)(k) <= tP(j)(k);				
						end generate;	
					end generate; 
l75:			if((i + 2**(len-j-1)) > (P'LENGTH - 1)) generate
l76:				for k in i to P'LENGTH-1 generate
					tG(j+1)(k) <= tG(j)(k);
					tP(j+1)(k) <= tP(j)(k);
					end generate;
			  end generate;
        end generate;
		   --tG(j+1)(G'Length) <= tG(j)(G'Length);
			--tP(j+1)(P'Length) <= tP(j)(P'Length);
		  end generate;
	 
--unteren baum gebaut

--Nachverarbeitung des höchsten bits
		PreINST: BetterPrefix port map (
					tG(0)(G'LENGTH),
					tP(0)(P'LENGTH),
					tG(len)(G'LENGTH-1),
					tP(len)(P'LENGTH-1),
					tG(len)(G'LENGTH),
					tP(len)(P'LENGTH));
	 	 
c <= tG(len)(G'Length downto 1);
end Behavioral;
