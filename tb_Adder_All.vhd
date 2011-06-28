--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:38:29 06/28/2011
-- Design Name:   
-- Module Name:   C:/Documents and Settings/meissnerh/Desktop/Studium/HWET/git/adder/tb_adder_all.vhd
-- Project Name:  HWET
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: AdderTop
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_adder_all IS
END tb_adder_all;
 
ARCHITECTURE behavior OF tb_adder_all IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
	CONSTANT n : integer := 19;
	
   --Inputs
   signal A : std_logic_vector(n downto 0) := (others => '0');
   signal B : std_logic_vector(n downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal F : std_logic_vector(n downto 0);
   signal Cout : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AdderTop PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          F => F,
          Cout => Cout
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
	for k in 0 to 1 loop
		for i in 0 to 2**n loop
			A <= conv_std_logic_vector(i,n+1);
			for j in 0 to 1 loop
				B <= conv_std_logic_vector(j,n+1);
				wait for 10 ns;
				assert (F = A + B) report "Fehler bei der Berrechnung";
			end loop;
		end loop;
		Cin <= Not Cin;
	end loop;

      wait;
   end process;

END;