library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SRLreg is
	port ( 	D : in std_logic_vector;
		SDIN : in std_logic;
		LD : in std_logic;
		SHIFT : in std_logic;
		CLK : in swtd_logic; -- clock
		Q : out std_logic_vector;
		SDOUT : out std_logic
	);
begin
	assert((D'LEFT = 0) and (Q'LEFT = 0) );
	assert(D'RANGE = Q'RANGE);
	assert(D'ASCENDING);
end SRLreg;

architecture Behavioural of SRLreg is
begin
store:	process(CLK)
		variable Qint : std_logic_vector;
	begin	
		if (RISING_EDGE(CLK)) then 
			if (LD = '1') then 
				Qint := D;
			elsif (SHIFT = '1') then
				for i in D'RIGHT downto D'LEFT+1 loop
					Qint(i) := Qint(i-1);
				end loop;
				Qint(0) := SDIN;
			end if;
		end if;
		Q <= Qint;
		SDOUT <= Qint(D'LEFT);
	end process;
end architecture; 
