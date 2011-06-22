----------------------------------------------------------------------------------
-- Company: HTWK-Leipzig
-- Engineer: Roy Meissner
-- 
-- Create Date:    14:58:44 06/22/2011 
-- Design Name: 	 FullAdder 1 Bit
-- Module Name:    FA - Behavioral 
-- Project Name:   HTWK-Leipzig Adder
-- Tool versions:  ISE 13.1
-- Description:    Architecture is a FullAdder for 1 Bit
-- Revision: 0.1.0
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA is
   Port ( 
			A : in  STD_LOGIC;					-- First input bit
         B : in  STD_LOGIC;					-- Second input bit
         Cin : in  STD_LOGIC;					-- Carry input bit
         S : out  STD_LOGIC;					-- Sum output bit
         Cout : out  STD_LOGIC				-- Carry output bit
	);
end FA;

architecture Behavioral of FA is
	signal P, G : STD_LOGIC;					-- Propagate- SUM from A,B  , Generate- Carry from A,B  
begin
	--Half Adder Construction
	P <= A xor B;									-- calculate Propagate 
	G <= A and B;									-- calculate Generate
	--Summery to FullAdder Construction
	Cout <= (P and Cin) or G;					-- calculate Carry-out from P,Cin,G
	S <= P xor Cin;								-- calculate Sum-out from P,Cin
end Behavioral;
