library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           s : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end FA;

architecture Behavioral of FA is
	signal P, G : STD_LOGIC;
begin
	P <= a xor b;
	G <= a and b;
	cout <= (P and cin) or G;
	s <= P xor cin;
end Behavioral;
