----------------------------------------------------------------------------------
-- Company: HTWK-Leipzig
-- Engineer: Roy Meissner
-- 
-- Create Date:    15:14:44 06/22/2011 
-- Design Name: 	 Generate-Propagate-Unit
-- Module Name:    GPU - Behavioral 
-- Project Name:   HTWK-Leipzig Generate-Propagate-Unit
-- Tool versions:  ISE 13.1
-- Description:    Architecture is a Generate-Propagate-Unit for 1 Bit
-- Revision: 0.1.0
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity GPU is
	port ( 	
		a : in std_logic;					-- Input bit 1
		b : in std_logic;					-- Input bit 2
		P : out std_logic;				-- Output Sum(a,b) 
		G : out std_logic					-- Output Carry (a,b)
	);
end GPU;

architecture Behavioural of GPU is 
begin
	P <= a xor b;							-- Calculate Output Propagate
	G <= a and b;							-- Calculate Output Generate
end Behavioural;
