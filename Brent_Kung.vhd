library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.common.all;

entity BrentKung is
    port(
    P : in std_logic_vector;
    G : in std_logic_vector;
    Cin : in std_logic;
    Cout : out std_logic;
	 C : out std_logic_vector
    );
    
end BrentKung;

architecture Behavioral of BrentKung is
--type zwerg is array(max downto 0,1 downto 0) of std_logic;
--signal zwe : zwerg; 
--signal aus : zwerg;
constant len: natural := log2(P'length) + 1;
type tmpArr is array(len - 1 downto 0) of std_logic_vector(P'LENGTH downto 0);
	signal tP: tmpArr;
	signal tG: tmpArr;

begin
tP(0)(0) <= '1';
tG(0)(1) <= Cin;
--zwe(max downto 1, 0) <= A(max downto 1);
--zwe(max downto 1, 1) <= B(max downto 1);
    tP(0)(P'Length downto 1) <= P;
    tG(0)(G'Length downto 1) <= G;

--oberen baum bauen 

l2: for j in 0 to log2(P'Length)-1 generate
l3:    for i in 0 to P'LENGTH generate
l4:        if ((i>1) and ((i mod 2**(j+1)) = 1)) generate
                PreINST: prefix port map (tG(j)(i),
					 tP(j)(i),
					 tG(j)(i-2**j),
					 tP(j)(i-2**j),
					 tG(j+1)(i),
					 tP(j+1)(i));
           end generate;
l5:        if((i mod 2**j) /= 1) generate
                tG(j+1)(i) <= tG(j)(i);
					 tP(j+1)(i) <= tP(j)(i);
            end generate;
        end generate;
    end generate;
	 
----oberen baum gebaut 
----unteren baum bauen    
    
l6: for j in log2(P'Length) to len generate
l61:	for l in 0 to (2**(len-j)-1) generate
			tG(j+1)(l) <= tG(j)(l);
			tP(j+1)(l) <= tP(j)(l);
		end generate;
l7:    for i in P'LENGTH downto 0 generate
l71:			if(i / (2**(len-j)-1) > 0 and i mod (2**(len-j)-1) = 0) generate
--l71:		if ((i mod 2**(len-j)) = 1) generate
				PreINST: prefix port map (
					tG(j)(i + 2**(len-j - 1)),
					tP(j)(i + 2**(len-j - 1)),
					tG(j)(i),
					tP(j)(i),
					tG(j+1)(i + 2**(len-j - 1)),
					tP(j+1)(i + 2**(len-j - 1)));
					--weiterleitung
l72:				for k in i to ((i + 2**(len-j - 1)-1) ) generate
						tG(j+1)(i) <= tG(j)(i);
						tP(j+1)(i) <= tP(j)(i);				
					end generate; 
					
           end generate;
----l8:        if ((i mod 2**(len-j)) /= 1) generate
--				if(i mod (2**(len-j)-1) /= 0 and i-(i + 2**(len-j - 1)) / (2**(len-j)-1) /= 0) generate
--					if((i-2**(len-j - 1)) mod 2**(len-j) /= 1) generate
--						tG(j+1)(i) <= tG(j)(i);
--						tP(j+1)(i) <= tP(j)(i);
--					end generate;
        end generate;
--            tG(j+1)(0) <= tG(j)(0);
--				tP(j+1)(0) <= tP(j)(0);			
--            tG(j+1)(P'LENGTH) <= tG(j)(P'LENGTH);
--				tP(j+1)(P'LENGTH) <= tP(j)(P'LENGTH);		
				
    end generate;
	 
	 
--unteren baum gebaut
	 	 
cout <= tG(len-1)(P'LENGTH);
c <= tG(len-1)(G'Length - 1 downto 0);
end Behavioral;
