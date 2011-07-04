library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.common.all;

entity BrentKung is
    generic(
    max : integer
    );

    port(
    A : in std_logic_vector (max downto 1);
    B : in std_logic_vector (max downto 1);
    Cin : in std_logic;
    Cout : out std_logic_vector (max/2 downto 0)
    );
    
end BrentKung;

architecture Behavioral of BrentKung is
type zwerg is array(max downto 0,1 downto 0) of std_logic;
signal zwe : zwerg; 
signal aus : zwerg;

begin
zwe(0,0) <= '1';
zwe(0,1) <= Cin;
zwe(max downto 1, 0) <= A(max downto 1);
zwe(max downto 1, 1) <= B(max downto 1);
l1: for i in 1 to max generate
    zwe(i,0) <= A(i);
    zwe(i,1) <= B(i);
end generate;

--oberen baum bauen 

l2: for j in 1 to log2(max) generate
l3:    for i in 1 to max generate
l4:        if((i mod 2**j) = 1) generate
                PreINST: prefix port map (zwe(i)(0),zwe(i)(1),zwe(i-(2**(j-1)))(0),zwe(i-(2**(j-1)))(1),aus(i-1)(0),aus(i-1)(1));
           end generate;
l5:        if((i mod 2**j) /= 1) generate
                aus(i-1)(0) <= zwe(i)(0);
                aus(i-1)(1) <= zwe(i)(1);
            end generate;
        end generate;
        zwe <= aus;
    end generate;
	 
--oberen baum gebaut 
--unteren baum bauen    
    
l6: for j in log2(max)-1 downto 1 generate
l7:    for i in max downto 1 generate
			if ((i mod ((2**j)+j)) = 0) generate
                PreINST: prefix port map (zwe(i)(0),zwe(i)(1),zwe(i-(j+1))(0),zwe(i-(j+1))(1),aus(i-1)(0),aus(i-1)(1));
           end generate;
l8:        if((i mod 2**j) /= 1) generate
                aus(i-1)(0) <= zwe(i)(0);
                aus(i-1)(1) <= zwe(i)(1);
            end generate;
        end generate;
        zwe <= aus;
    end generate;	 
	 
--unteren baum gebaut
	 	 
l9:for i in 3 to max generate
l10:     if ((i mod 2) = 1) generate
            Cout(i) <= aus(i)(0);
         end generate;
l11:   if ((i mod 2) /= 1) generate
            Cout(i) <= aus(i)(0);
         end generate;
    end generate;
Cout <= aus(0);
end Behavioral;
