library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.common.all;

entity HanCarlson is

    port(
    P : in std_logic_vector;
    G : in std_logic_vector;
    Cin : in std_logic;
    Cout : out std_logic_vector
    );
    
end HanCarlson;

architecture Behavioral of HanCarlson is

constant max : integer := P'length;
type matrix is array(log2(max)+1 downto 0) of std_logic_vector(max downto 0);
signal zweP : matrix;
signal zweG : matrix;

begin

zweP(0)(max downto 1) <= G;
zweG(0)(max downto 1) <= P;
zweP(0)(0) <= Cin;
zweG(0)(0) <= '0';
l1:for i in 1 to log2(max)+1 generate
    zweP(i)(0)<=zweP(i-1)(0);
    zweG(i)(0)<=zweG(i-1)(0);
end generate;
l2:for i in 1 to max-1 generate
    l3:if((i mod 2) = 1) generate
        PreINST: BetterPrefix port map (zweP(0)(i),
                                          zweG(0)(i),
                                          zweP(0)(i-1),
                                          zweG(0)(i-1),
                                          zweP(1)(i),
                                          zweG(1)(i));
        end generate;
        l4:if((i mod 2) /= 1) generate
            zweP(1)(i) <= zweP(0)(i);
            zweG(1)(i) <= zweG(0)(i);
        end generate;
end generate;
l4: for j in 1 to log2(max)-1 generate
    l5: for i in 1 to max-1 generate
        l6:if((i mod 2) = 1 and i > (2**j)) generate
            INST: BetterPrefix port map (
                                      zweP(j)(i),
                                      zweG(j)(i),
                                      zweP(j)(i-(2**(j))),
                                      zweG(j)(i-(2**(j))),
                                      zweP(j+1)(i),
                                      zweG(j+1)(i));
        end generate;
        l7:if((i mod 2) /= 1 or i <= (2**j)) generate
            zweP(j+1)(i) <= zweP(j)(i);
            zweG(j+1)(i) <= zweG(j)(i);
        end generate;
    end generate;
end generate;
l8: for i in 1 to max-1 generate
    l9:if((i mod 2) = 0) generate
        PostINST: BetterPrefix port map (
                                  zweP(log2(max))(i),
                                  zweG(log2(max))(i),
                                  zweP(log2(max))(i-1),
                                  zweG(log2(max))(i-1),
                                  zweP(log2(max)+1)(i),
                                  zweG(log2(max)+1)(i));
    end generate;
    l10:if((i mod 2) /= 0) generate
            zweP(log2(max)+1)(i) <= zweP(log2(max))(i);
            zweG(log2(max)+1)(i) <= zweG(log2(max))(i);
    end generate;
end generate;

PostINST: BetterPrefix port map (
                                  zweP(0)(max),
                                  zweG(0)(max),
                                  zweP(log2(max)+1)(max-1),
                                  zweG(log2(max)+1)(max-1),
                                  zweP(log2(max)+1)(max),
                                  zweG(log2(max)+1)(max));

Cout <= zweP(log2(max)+1)(max downto 1);    

end Behavioral;