--------------------------------------------------------------------------------
-- Company: HTWK-Leipzig
-- Engineer: Roy Meissner
-- Create Date:   14:38:29 06/28/2011
-- Design Name:   TestBench Adder
-- Module Name:   C:/Documents and Settings/meissnerh/Desktop/Studium/HWET/git/adder/tb_adder_all.vhd
-- Project Name:  HTWK-Leipzig Adder
-- Tool versions:  ISE 13.1
-- Description:   Tests a instance of Adder for n bits
-- VHDL Test Bench Created by ISE for module: AdderTop
-- Revision: 0.1.0
-- Revision 0.01 - File Created
-- Additional Comments:
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.common.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY tb_adder_all IS
END tb_adder_all;
 
ARCHITECTURE behavior OF tb_adder_all IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
	CONSTANT n : integer := 16;
	
   --Inputs
   signal A : std_logic_vector((n-1) downto 0) := (others => '0');
   signal B : std_logic_vector((n-1) downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal Sum : std_logic_vector((n-1) downto 0);
   signal Cout : std_logic;
	signal bigsum : std_logic_vector(n downto 0) := (others=>'0');
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AdderTop PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Sum => Sum,
          Cout => Cout
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
   wait for 100 ns;	
	for k in 0 to 1 loop
		for i in 0 to 2**n-1 loop
			A <= conv_std_logic_vector(i,n);
			for j in 0 to 2**n-1 loop
				B <= conv_std_logic_vector(j,n);
				bigsum(n)<=cout;
				bigsum(n-1 downto 0) <= Sum+1;
				wait for 1 ns;
				assert (conv_integer(cout)*2**n+conv_integer(sum) = i+j+conv_integer(cin)) report "Fehler bei der Berrechnung A:"
				& integer'image(conv_integer(A)) & " B: "
				& integer'image(conv_integer(B)) & " Cin: "
				& integer'image(conv_integer(Cin)) & " Cout: "
				& integer'image(conv_integer(Cout)) & " Sum "
				& integer'image(conv_integer(Sum)) & " "
				;
			end loop;
		end loop;
		Cin <= Not Cin;
	end loop;

      wait;
   end process;

END;