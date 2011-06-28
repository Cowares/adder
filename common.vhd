library IEEE;
use IEEE.MATH_REAL.ALL;
use IEEE.STD_LOGIC_1164.all;

package common is

	type carry_unit_t is (BRENT_KUNG, HAN_CARLSON, KOGGE_STONE);
	
	--function log2 (x: integer) return integer;
	function log2(m: positive) return natural;
	
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
