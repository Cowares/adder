----------------------------------------------------------------------------------
-- Company: HTWK-Leipzig
-- Engineer: Roy Meissner
-- 
-- Create Date:    16:00:44 06/22/2011 
-- Design Name: 	 CarrySaveAdder
-- Module Name:    CSA - Behavioral 
-- Project Name:   HTWK-Leipzig CarrySaveAdder
-- Tool versions:  ISE 13.1
-- Description:    Architecture is a CarrySaveAdder for n Bit
-- Revision: 0.1.0
-- Revision 0.01 - File Created
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CSA is	
	Port ( 
		a : in  STD_LOGIC_VECTOR;					-- Input Vector 1
      b : in  STD_LOGIC_VECTOR;					-- Input Vector 2
      sum : out  STD_LOGIC_VECTOR;				-- Output Vector Sum
      cout : out  STD_LOGIC						-- Output Vector Carry
	);
end CSA;

architecture Behavioral of CSA is
	type matrix_Provisional_Result is array(0 to (a'HIGH-a'LOW)) of std_logic_vector((a'HIGH-a'LOW) downto 0);		-- Matrix(a'length-1,a'length-1)
	type array_carryChain is array(0 to (a'HIGH-a'LOW)) of std_logic;
	signal subTotal : matrix_Provisional_Result;																							-- Zwischensumme der Addition
	signal carry : matrix_Provisional_Result;																								-- Carry's der Matrix
	signal carryChain : array_carryChain;
	component GPU
		port (
			a : in std_logic;					-- Input bit 1
			b : in std_logic;					-- Input bit 2
			P : out std_logic;				-- Output Sum(a,b) 
			G : out std_logic					-- Output Carry (a,b)
		);
	end component;

begin
	-- stage 0
	S0gen:	for i in 0 to (a'HIGH-a'LOW)generate																-- Generate GPU for 0 to n bit
	GPU0inst:	GPU port map(a(i+a'LOW),b(i+b'LOW),subTotal(0)(i),carry(0)(i));						-- Instanziate GPU 
			--SubTotal(0)(x) filled with subtotals of GPU
			--Carry(0)(x) filled with Carrys of GPU
	end generate;
	carryChain(0) <= carry(0)(a'HIGH-a'LOW);																		-- Copy last Carry on CarryChain 0
	--Generate rest of Logic
	CSAGen:	for i in 1 to (a'HIGH-a'LOW) generate																-- Generate Rest of Logic
		--stage n
		SnGen:	for j in i to (a'HIGH-a'LOW) generate															-- Generate GPU for i to n bit
			GPUnInst:	GPU port map(subTotal(i-1)(j),carry(i-1)(j-1),subTotal(i)(j),carry(i)(j));	-- Instanziate GPU
		end generate;
		Prop:	for j in 0 to i-1 generate																				-- Generate Propagate Unit for 0 to i-1
			subTotal(i)(j) <= subTotal(i-1)(j);																		-- Copy subtotal last line to this line
		end generate;
		carryChain(i) <= carry(i)(a'HIGH-a'LOW) or carryChain(i-1);											-- Copy carry n || carrychain last to carrychain this
	end generate;
	sum <= subTotal(a'HIGH-a'LOW);																					-- copy subtotals to output sum
	cout <= carryChain(a'HIGH-a'LOW);																				-- copy carrychain last to carryout
end Behavioral;