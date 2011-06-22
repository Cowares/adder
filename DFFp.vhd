----------------------------------------------------------------------------------
-- Company: HTWK-Leipzig
-- Engineer: Roy Meissner
-- 
-- Create Date:    13:50:44 06/22/2011 
-- Design Name: 	 D-FlipFlop-FallingEdge
-- Module Name:    CSA - Behavioral 
-- Project Name:   HTWK-Leipzig Adder
-- Tool versions:  ISE 13.1
-- Description:    Architecture is a D-FlipFlop which is switching on Rising Edge
-- Revision: 0.1.0
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DFFp is
	port( 	
		D : in std_logic_vector;			-- D-Input
		CLK : in std_logic;					-- Clock-input
		Q : buffer std_logic_vector		-- Q-output
	);
end entity DFFp;

architecture Behavioural of DFFp is
begin
	store: process(CLK)																-- Works only, when clock changes
	begin
		if RISING_EDGE(CLK)  then													-- Works on clock 0-->1
			Q <= D;																		-- If working: save D
		end if;
	end process;
end architecture;
