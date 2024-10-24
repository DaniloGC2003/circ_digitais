Library IEEE;
use ieee.std_logic_1164.all;
entity add_sub_4bits is
	port(
		in_A3, in_A2, in_A1, in_A0: in std_logic;
		in_B3, in_B2, in_B1, in_B0: in std_logic;
		add_sub: in std_logic; -- flag to select circuit's behavior
		out_S3, out_S2, out_S1, out_S0: out std_logic;
		carry_out: out std_logic
		);
end add_sub_4bits;

architecture struct of add_sub_4bits is

component SOMA4BITS_VHDL
port(
		A0, A1, A2, A3: in std_logic;
		B0, B1, B2, B3: in std_logic;
		C_in: in std_logic;
		S0, S1, S2, S3: out std_logic;
		C_out: out std_logic
		);
end component;
begin
--label: component_name PORT MAP (port_list)
somador: SOMA4BITS_VHDL port map(A0 => in_A0, A1 => in_A1, A2 => in_A2, A3 => in_A3,
											B0 => in_B0 xor add_sub, B1 => in_B1 xor add_sub, B2 => in_B2 xor add_sub,
											B3 => in_B3 xor add_sub,
											S0 => out_S0, S1 => out_S1, S2 => out_S2, S3 => out_S3,
											C_in => add_sub,
											C_out => carry_out
											);
end struct;