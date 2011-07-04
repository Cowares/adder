library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.common.all;

entity HanCarlson is
    port(
    A : in std_logic_vector;
    B : in std_logic_vector;
    Cin : in std_logic;
    Cout : out std_logic_vector
    );
    
end HanCarlson;

architecture Behavioral of HanCarlson is
signal max : integer := A'LENGTH-1;
type zwerg is array(max downto 0,1 downto 0) of std_logic;
signal zwe : zwerg; 
signal aus : zwerg;

component prefix is
    port (
        a: in std_logic;
        b: in std_logic;
        c: in std_logic;
        d: in std_logic;
        e: out std_logic;
        f: out std_logic
    );
end component;


begin
zwe(0,0) <= '1';
zwe(0,1) <= Cin;
l1: for i in 1 to max generate
    zwe(i,0) <= A(i);
    zwe(i,1) <= B(i);
	 assert false report "hier";
end generate;

l2:for j in 1 to log2(max) generate
    l3:for i in 2**j to max generate
        l7:if((i mod 2) = 0) generate
            PreINST: prefix port map (zwe(i,0),zwe(i,1),zwe(i-(2**(j-1)),0),zwe(i-(2**(j-1)),1),zwe(i-1,0),zwe(i-1,1));
        end generate;
--        l8:if((i mod 2) /= 0) generate
--            aus(i-1,0) <= zwe(i,0);
--            aus(i-1,1) <= zwe(i,1);
--        end generate;
--        l7: case (i mod 2) = 0 is
--                when 1 => prefix port map (zwe(i,0),zwe(i,1),zwe(i-(2**(j-1)),0),zwe(i-(2**(j-1)),1),aus(i-1,0),aus(i-1,1));
--                when others => aus(i-1,0) <= zwe(i,0);    aus(i-1,1) <= zwe(i,1);
--             end case;
    end generate;
end generate;

l4:for i in 1 to max generate
    l5:if((i mod 2) = 0) generate
            PostINST: prefix port map (zwe(i,0),zwe(i,1),zwe(i-1,0),zwe(i-1,1),zwe(i-1,0),zwe(i-1,1));
    end generate;
--l6:if((i mod 2) /= 0) generate
--            aus(i-1)(0) <= zwe(i)(0);
--            aus(i-1)(1) <= zwe(i)(1);
--        end generate;
end generate;

l6:for i in 1 to max generate
    l7:if ((i mod 2)=0) generate
        Cout(i) <= zwe(i,0);
    end generate;
end generate;    

end Behavioral;
