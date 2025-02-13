Library IEEE;
use ieee.std_logic_1164.all;

entity SOMA4BITs_VHDL is
	port(
		A3, A2, A1, A0: in std_logic;
		B3, B2, B1, B0: in std_logic;
		C_in: in std_logic;
		S3, S2, S1, S0: out std_logic;
		C_out: out std_logic
		);
end SOMA4BITs_VHDL;

architecture struct of SOMA4BITs_VHDL is 

--signal 
signal Cout0Cin1, Cout1Cin2, Cout2Cin3: std_logic;
--component
COMPONENT SOMA1BIT_VHDL
port(
		A, B, Ci: in std_logic;
		Cout, S: out std_logic
		);
end COMPONENT;

begin
--label: component_name PORT MAP (port_list)
somador0: SOMA1BIT_VHDL port map(A => A0, B => B0, Ci => C_in, 	  Cout => Cout0Cin1, S => S0);
somador1: SOMA1BIT_VHDL port map(A => A1, B => B1, Ci => Cout0Cin1, Cout => Cout1Cin2, S => S1);
somador2: SOMA1BIT_VHDL port map(A => A2, B => B2, Ci => Cout1Cin2, Cout => Cout2Cin3, S => S2);
somador3: SOMA1BIT_VHDL port map(A => A3, B => B3, Ci => Cout2Cin3, Cout => C_out, 		S => S3);
end struct;
