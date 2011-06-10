----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:40:12 05/27/2011 
-- Design Name: 
-- Module Name:    MISR_TOP - Behavioral 
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

entity MISR_TOP is
    Port ( Z : in  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           B1 : in  STD_LOGIC;
           B0 : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0);
           SDin : in  STD_LOGIC;
           SDout : out  STD_LOGIC);
end MISR_TOP;

architecture Behavioral of MISR_TOP is
component MISR 
-- leftmost bit in g is the highest coeficient and
-- must be set to '1'
	 generic(
		g : string
	 );
    Port ( Z : in  STD_LOGIC_VECTOR;
           clk : in  STD_LOGIC;
			  B1 : in std_logic;
			  B0 : in std_logic;
           Q : out  STD_LOGIC_VECTOR;
           SDin : in  STD_LOGIC;
           SDout : out  STD_LOGIC
	 );
end component;

begin
MISRInst:
	MISR generic map("11001") port map (Z,clk,B1,B0,Q,SDin,SDout);

end Behavioral;

