----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:47:54 05/26/2011 
-- Design Name: 
-- Module Name:    T1 - Behavioral 
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

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity T1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           B1 : in  STD_LOGIC;
           B0 : in  STD_LOGIC;
           D : out  STD_LOGIC);
end T1;

architecture Behavioral of T1 is

begin
	 D <= (B and (not B1 and not B0)) or 	 	--('0','0'), 
			((B xor C)and (not B1 and B0)) or 	--('0','1'), 
		   ( A and (B1 and not B0)) or	    	--('1','0'),
			((A xor (B xor C))and (B1 and B0));	--('1','1');
end Behavioral;

