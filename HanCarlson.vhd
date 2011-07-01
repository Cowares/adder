library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.common.all;

entity HanCarlson is
	generic(
	max : integer := 15
	);

	port(
	A : in std_logic_vector (max downto 0);
	B : in std_logic_vector (max downto 0);
	Cin : in std_logic;
	Cout : out std_logic_vector (max downto 0)
	);
end HanCarlson;

architecture Behavioral of HanCarlson is
type zwerg is array(max downto 0) of std_logic_vector(1 downto 0);
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

component PostPrefix is
	port (
		a: in std_logic;
		b: in std_logic;
		c: in std_logic;
		e: out std_logic
	);
end component;



begin
zwe(0)(0) <= '1';
zwe(0)(1) <= Cin;
l1: for i in 1 to max-1 generate
	zwe(i)(0) <= A(0);
	zwe(i)(1) <= B(0);
end generate;
l2: for j in 1 to log2(max) generate
l3:	for i in 1 to max generate
l7:		if((i mod 2**j) = 1) generate
				PreINST: prefix port map (zwe(i)(0),zwe(i)(1),zwe(i-1)(0),zwe(i-1)(1),aus(i)(0),aus(i)(1));
			end generate;
l8:		if((i mod 2**j) /= 1) generate
				aus(i)(0) <= zwe(i)(0);
				aus(i)(1) <= zwe(i)(1);
			end generate;
		end generate;
		zwe <= aus;
	end generate;

l4: for i in 1 to max generate
l5:	if((i mod 2) = 1) generate
			PostINST: prefix port map (zwe(i)(0),zwe(i)(1),zwe(i-1)(0),zwe(i-1)(1),aus(i)(0),aus(i)(1));
		end generate;
l6:	if((i mod 2) < 1) generate
			aus(i)(0) <= zwe(i)(0);
			aus(i)(1) <= zwe(i)(1);
		end generate;
	end generate;
	
	
zwe <= aus;

--Cout <=

end Behavioral;
