library IEEE;
use IEEE.MATH_REAL.ALL;
use IEEE.STD_LOGIC_1164.all;

package common is

	type carry_unit_t is (BRENT_KUNG, HAN_CARLSON, KOGGE_STONE, CARRY_LOOK_AHEAD, CARRY_SAVE_ADDER, CARRY_LOOK_AHEAD_whatever);
	
	--function log2 (x: integer) return integer;
	function log2(m: positive) return natural;
	
Component Adder
	Generic (
		carry_unit: carry_unit_t
	);
	Port (
		a: in  STD_LOGIC_VECTOR;
		b: in  STD_LOGIC_VECTOR;
		cin: in  STD_LOGIC;
		sum: out  STD_LOGIC_VECTOR;
		cout: out  STD_LOGIC
	);
end component;

component CLAU
	port (
		Cin : in std_logic;
		P : in std_logic_vector;
		G : in std_logic_vector;
		C : out std_logic_vector;
		PG : out std_logic;
		GG : out std_logic
	);
end component;


Component AdderTop 
	port (
		A: in std_logic_vector;
		B: in std_logic_vector;
		Cin: in std_logic;
		F: out std_logic_vector;
		Cout: out std_logic
	);
end Component;

Component CLAURec
	port ( 	Cin : in std_logic;
		P : in std_logic_vector;
		G : in std_logic_vector;
		C : out std_logic_vector;
		PG : out std_logic;
		GG : out std_logic
	);
end Component;

Component CLA_Add
	port (
		A : in std_logic_vector;
		B : in std_logic_vector;
		Cin : in std_logic;
		S : out std_logic_vector;
		Cout : out std_logic
	);
end Component;

Component CSA	
	Port ( 
		a : in  STD_LOGIC_VECTOR;					-- Input Vector 1
      b : in  STD_LOGIC_VECTOR;					-- Input Vector 2
      sum : out  STD_LOGIC_VECTOR;				-- Output Vector Sum
      cout : out  STD_LOGIC						-- Output Vector Carry
	);
end Component;

Component FA
   Port ( 
			A : in  STD_LOGIC;					-- First input bit
         B : in  STD_LOGIC;					-- Second input bit
         Cin : in  STD_LOGIC;					-- Carry input bit
         S : out  STD_LOGIC;					-- Sum output bit
         Cout : out  STD_LOGIC				-- Carry output bit
	);
end Component;

Component GPU
	port ( 	
		a: in std_logic;					-- Input bit 1
		b: in std_logic;					-- Input bit 2
		P: out std_logic;					-- Output Sum(a,b) 
		G: out std_logic					-- Output Carry (a,b)
	);
end Component;

Component Prefix
	port (
		a: in std_logic;
		b: in std_logic;
		c: in std_logic;
		d: in std_logic;
		e: out std_logic;
		f: out std_logic
	);
end Component;

Component KoggeStoneAdder
	port (	
		P: in std_logic_vector;
		G: in std_logic_vector;
		cin: in std_logic;
		sum: out std_logic_vector;
		cout: out std_logic
	);
end Component;

Component HanCarlson
    port(
    A : in std_logic_vector;
    B : in std_logic_vector;
    Cin : in std_logic;
    Cout : out std_logic_vector
    );
end Component;

end common;

package body common is

	function log2(m: positive) return natural is
	begin
		for n in 0 to integer'high loop
			if (2**n >= m) then
				return n;
			end if;
		end loop;
	end function log2;
	
--function log2 (x: integer) return integer is
--	begin
--		return ceil(LOG(x) / LOG(2));
--	end log2;

end common;
