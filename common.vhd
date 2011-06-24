library IEEE;
use IEEE.STD_LOGIC_1164.all;

package common is

	type carry_unit_t is (BRENT_KUNG, HAN_CARLSON, KOGGE_STONE);
	
	function log2 (x: integer) return integer;
	
end common;

package body common is
	
	function log2 (x: integer) return integer is
	begin
		return ln (x) / ln (2);
	end log2;

end common;
