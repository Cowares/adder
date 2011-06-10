----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:32:28 05/26/2011 
-- Design Name: 
-- Module Name:    MISR - Behavioral 
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
--	Modular MISR according to 
-- H.J. Wunderlich Hochintegrierte Schaltungen: Prüfgerechter Entwurf und Test, Springer, 1991
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

use work.sequential.all;

entity MISR is
-- leftmost bit in g is the highest coefficient and
-- must be set to '1'
-- Control B1,B0
--		0,0 shift
--    0,1 pattern generation
--		1,0 system 
--		1,1 signature analysis
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
end MISR;

architecture Behavioral of MISR is
	signal D : std_logic_vector(g'LENGTH-2 downto 0);
	signal Qint : std_logic_vector(g'LENGTH-2 downto 0);
begin
T1gen0:
		if g(g'LENGTH) = '1' generate
T1inst0:
			T1 port map (Z(Z'LOW),SDin,Qint(g'LENGTH-2),B1,B0,D(0));
		end generate;
T2gen0:
		if g(g'LENGTH) = '0' generate
T2inst0:
			T2 port map (Z(Z'LOW),SDin,B1,B0,D(0));
		end generate;
shift_reg0:
	for i in 1 to g'LENGTH-2 generate
--$pragma synthesis off
		assert ((g(g'LENGTH-i) = '1') or (g(g'LENGTH-i) = '0'))
		report "Illegal primitive polynom"
		severity FAILURE;
--$pragma synthesis on
T1gen:
		if g(g'LENGTH-i) = '1' generate
T1inst:
			T1 port map (Z(Z'LOW+i),Qint(i-1),Qint(g'LENGTH-2),B1,B0,D(i));
		end generate;
T2gen:
		if g(g'LENGTH-i) = '0' generate
T2inst:
			T2 port map (Z(Z'LOW+i),Qint(i-1),B1,B0,D(i));
		end generate;

	end generate;
DFFgen:
	process (clk) is
		variable store : std_logic_vector(g'LENGTH-2 downto 0);
	begin
		if (rising_edge(clk)) then
			store := D;
		end if;
		Qint <= store;
	end process;
	SDout <= Qint(g'LENGTH-2);
	Q <= Qint;
end Behavioral;

