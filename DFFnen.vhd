----------------------------------------------------------------------------------
-- Company: HTWK-Leipzig
-- Engineer: Roy Meissner
-- 
-- Create Date:    13:37:44 06/22/2011 
-- Design Name: 	 D-FlipFlop-FallingEdge with Enable
-- Module Name:    CSA - Behavioral 
-- Project Name:   HTWK-Leipzig Adder
-- Tool versions:  ISE 13.1
-- Description:    Architecture is a D-FlipFlop with Enable and Falling Edge switching
-- Revision: 0.1.0
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DFFnen is
	port( 	
		D : in std_logic_vector; 		-- D-Input
		EN : in std_logic;				-- Enable-input
		CLK : in std_logic;				-- Clock-input
		Q : buffer std_logic_vector	-- Q-output
	);
end entity DFFnen;

architecture Behavioural of DFFnen is
begin
	store: process(CLK)																	-- Works only, when clock changes
	begin
		if (FALLING_EDGE(CLK) and (EN = '1')) then								-- Works on clock 1-->0 and enable == 1
			Q <= D;																			-- If working: save D
		end if;
	end process;
end architecture