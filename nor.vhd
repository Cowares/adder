library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity norGate is
	port(
		A : in std_logic_vector;
		Y : out std_logic
	);
end entity;

architecture behavioural of norGate is
	signal internal : std_logic;
begin
calc: 
	process(A)
		variable internal : std_logic;
	begin
		internal := A(A'LOW);
		for i in A'LOW +1 to A'HIGH loop
			internal := A(i) or internal;
		end loop;
		Y <= not internal;
	end process;
end architecture; 	



