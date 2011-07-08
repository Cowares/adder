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
--type zwerg is array(max downto 0,1 downto 0) of std_logic;
--signal zwe : zwerg; 
--signal aus : zwerg;

constant max : integer := A'length-1;
type matrix is array(max downto 0,1 downto 0) of std_logic_vector(log2(max)+2 downto 0);
signal zwe : matrix;

begin

zwe(0,0)(0) <= '1';
zwe(0,1)(0) <= Cin;
l1: for i in 1 to max generate
    zwe(i,0)(0) <= A(i);
    zwe(i,1)(0) <= B(i);
end generate;

l2:for j in 1 to log2(max)+1 generate
    l3:for i in 2**j to max generate
        l7:if((i mod 2) = 0) generate
            PreINST: prefix port map (zwe(i,0)(j-1),zwe(i,1)(j-1),zwe(i-(2**(j-1)),0)(j-1),zwe(i-(2**(j-1)),1)(j-1),zwe(i-1,0)(j),zwe(i-1,1)(j));
        end generate;
        l9:if((i mod 2) /= 0) generate
            zwe(i,0)(j) <= zwe(i,0)(j-1);
            zwe(i,1)(j) <= zwe(i,1)(j-1);
        end generate;
    end generate;
end generate;

l4:for i in 1 to max generate
    l5:if((i mod 2) = 0) generate
            PostINST: prefix port map (zwe(i,0)(log2(max)+1),zwe(i,1)(log2(max)+1),zwe(i-1,0)(log2(max)+1),zwe(i-1,1)(log2(max)+1),zwe(i-1,0)(log2(max)+2),zwe(i-1,1)(log2(max)+2));
    end generate;
    l10:if((i mod 2) /= 0) generate
            zwe(i,0)(log2(max)+2) <= zwe(i,0)(log2(max)+1);
            zwe(i,1)(log2(max)+2) <= zwe(i,1)(log2(max)+1);
    end generate;
end generate;

l6:for i in 1 to max generate
    l7:if ((i mod 2)=0) generate
        Cout(i) <= zwe(i,0)(log2(max)+2);
    end generate;
end generate;





--zwe(0,0) <= '1';
--zwe(0,1) <= Cin;
--l1: for i in 1 to max generate
--    zwe(i,0) <= A(i);
--    zwe(i,1) <= B(i);
--end generate;
--
--aus <= zwe;
--
--l2:for j in 1 to log2(max) generate
--    l3:for i in 2**j to max generate
--        l7:if((i mod 2) = 0) generate
--            PreINST: prefix port map (zwe(i,0),zwe(i,1),zwe(i-(2**(j-1)),0),zwe(i-(2**(j-1)),1),aus(i-1,0),aus(i-1,1));
--        end generate;
--    end generate;
--    zwe <= aus;
--end generate;
--
--l4:for i in 1 to max generate
--    l5:if((i mod 2) = 0) generate
--            PostINST: prefix port map (zwe(i,0),zwe(i,1),zwe(i-1,0),zwe(i-1,1),aus(i-1,0),aus(i-1,1));
--    end generate;
--end generate;
--
--l6:for i in 1 to max generate
--    l7:if ((i mod 2)=0) generate
--        Cout(i) <= aus(i,0);
--    end generate;
--end generate;    

end Behavioral;