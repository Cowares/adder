--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 


library IEEE;
use IEEE.STD_LOGIC_1164.all;

package sequential is
	component T1 
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           B1 : in  STD_LOGIC;
           B0 : in  STD_LOGIC;
           D : out  STD_LOGIC);
	end component;

	component T2 
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           B1 : in  STD_LOGIC;
           B0 : in  STD_LOGIC;
           D : out  STD_LOGIC);
	end component;

  

end sequential;


package body sequential is
 
end sequential;
