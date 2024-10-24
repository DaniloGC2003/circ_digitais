Library IEEE;
use ieee.std_logic_1164.all;

--A3 is the most significant bit. A0 is the least significant bit
entity bits_to_display is
	port (
			A3, A2, A1, A0: in std_logic;
			a, b, c, d, e, f, g: out std_logic
			);
end bits_to_display;

architecture value_assignment of bits_to_display is
	begin
		a <= (NOT A3 AND A2 AND NOT A1 AND NOT A0) OR (NOT A3 AND NOT A2 AND NOT A1 AND A0) OR
			  (A3 AND A2 AND NOT A1 AND A0) OR (A3 AND NOT A2 AND A1 AND A0);
		b <= (NOT A3 AND A2 AND NOT A1 AND A0) OR (A3 AND A2 AND NOT A0) OR (A3 AND A1 AND A0) OR (A2 AND A1 
		AND NOT A0);
		c <= (NOT A3 AND NOT A2 AND A1 AND NOT A0) OR (A3 AND A2 AND A1) OR (A3 AND A2 AND NOT A0);
		d <= (NOT A3 AND NOT A2 AND NOT A1 AND A0) OR (NOT A3 AND A2 AND NOT A1 AND NOT A0) OR (A2 AND A1 AND A0)
				OR (A3 AND NOT A2 AND A1 AND NOT A0);
		e <= (NOT A2 AND NOT A1 AND A0) OR (NOT A3 AND A2 AND NOT A1) OR (NOT A3 AND A1 AND A0);
		f <= (A3 AND A2 AND NOT A1 AND A0) OR (NOT A3 AND NOT A2 AND A0) OR (NOT A3 AND NOT A2 AND A1) OR 
				(NOT A3 AND A1 AND A0);
		g <= (NOT A3 AND A2 AND A1 AND A0) OR (A3 AND A2 AND NOT A1 AND NOT A0) OR (NOT A3 AND NOT A2 AND NOT A1);
	end value_assignment;
		