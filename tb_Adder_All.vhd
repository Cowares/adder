-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY tb_ADDER_ALL IS
  END tb_ADDER_ALL;

  ARCHITECTURE behavior OF tb_ADDER_ALL IS 

  -- Component Declaration
	constant n : natural := 15;
COMPONENT AdderTop
	port (
		A: in std_logic_vector(n downto 0);
		B: in std_logic_vector(n downto 0);
		Cin: in std_logic;
		F: out std_logic_vector(n downto 0);
		Cout: out std_logic
	);
end COMPONENT;

  -- input
  signal A,B : std_logic_Vector(n downto 0);
  signal Cin : std_logic := '0';
 
  -- output
  signal F : std_logic_vector(n downto 0);
  signal Cout : std_logic;

  BEGIN

  -- Component Instantiation
  
  AdderInst:	AdderTop port map(A, B, Cin, F, Cout);
   
  --  Test Bench Statements
tb : PROCESS 
BEGIN
wait for 100 ns; -- wait until global set/reset completes
	for k in 0 to 1 loop
	for i in 0 to n loop
		A <= CONV_STD_LOGIC_VECTOR(i,ld(n));
		for j in 0 to n loop
			B <= CONV_STD_LOGIC_VECTOR(j,ld(n));
			wait for 10 ns;
			assert (integer(to_unsigned(F)) = integer(to_unsigned(A)) + integer(to_unsigned(B)) ) report "Ergebnis ist Falsch" severity note;
		end loop;
	end loop;
	Cin <= NOT Cin;
	end loop;
        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
