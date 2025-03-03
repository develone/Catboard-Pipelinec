-- Timing params:
--   Fixed?: False
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 3
entity BIN_OP_LT_uint6_t_uint6_t_0CLK_380ecc95 is
port(
 left : in unsigned(5 downto 0);
 right : in unsigned(5 downto 0);
 return_output : out unsigned(0 downto 0));
end BIN_OP_LT_uint6_t_uint6_t_0CLK_380ecc95;
architecture arch of BIN_OP_LT_uint6_t_uint6_t_0CLK_380ecc95 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- BIN_OP_MINUS[BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122]
signal BIN_OP_MINUS_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122_left : signed(6 downto 0);
signal BIN_OP_MINUS_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122_right : signed(6 downto 0);
signal BIN_OP_MINUS_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122_return_output : signed(7 downto 0);

function CAST_TO_int7_t_uint6_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(5 downto 0);
  variable return_output : signed(6 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,7)));
    return return_output;
end function;

function int7_6_6( x : signed) return unsigned is
--variable x : signed(6 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(6- i);
      end loop;
return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_MINUS_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122 : 0 clocks latency
BIN_OP_MINUS_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122 : entity work.BIN_OP_MINUS_int7_t_int7_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122_left,
BIN_OP_MINUS_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122_right,
BIN_OP_MINUS_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 BIN_OP_MINUS_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(5 downto 0);
 variable VAR_right : unsigned(5 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_left_bot : unsigned(5 downto 0);
 variable VAR_right_bot : unsigned(5 downto 0);
 variable VAR_right_bot_BIN_OP_LT_uint6_t_uint6_t_c_l10_c13_64d7_0 : unsigned(5 downto 0);
 variable VAR_rv : unsigned(0 downto 0);
 variable VAR_sub : signed(6 downto 0);
 variable VAR_sub_BIN_OP_LT_uint6_t_uint6_t_c_l14_c12_00be_0 : signed(6 downto 0);
 variable VAR_CAST_TO_int7_t_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_2d48_return_output : signed(6 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122_left : signed(6 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122_right : signed(6 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122_return_output : signed(7 downto 0);
 variable VAR_lt_zero : unsigned(0 downto 0);
 variable VAR_int7_6_6_BIN_OP_LT_uint6_t_uint6_t_c_l15_c23_0f2d_return_output : unsigned(0 downto 0);
begin

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_right_bot_BIN_OP_LT_uint6_t_uint6_t_c_l10_c13_64d7_0 := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122_right := signed(std_logic_vector(resize(VAR_right_bot_BIN_OP_LT_uint6_t_uint6_t_c_l10_c13_64d7_0, 7)));
     -- CAST_TO_int7_t[BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_2d48] LATENCY=0
     VAR_CAST_TO_int7_t_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_2d48_return_output := CAST_TO_int7_t_uint6_t(
     VAR_left);

     -- Submodule level 1
     VAR_BIN_OP_MINUS_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122_left := VAR_CAST_TO_int7_t_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_2d48_return_output;
     -- BIN_OP_MINUS[BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122_left <= VAR_BIN_OP_MINUS_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122_left;
     BIN_OP_MINUS_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122_right <= VAR_BIN_OP_MINUS_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122_return_output := BIN_OP_MINUS_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122_return_output;

     -- Submodule level 2
     VAR_sub_BIN_OP_LT_uint6_t_uint6_t_c_l14_c12_00be_0 := resize(VAR_BIN_OP_MINUS_BIN_OP_LT_uint6_t_uint6_t_c_l14_c18_4122_return_output, 7);
     -- int7_6_6[BIN_OP_LT_uint6_t_uint6_t_c_l15_c23_0f2d] LATENCY=0
     VAR_int7_6_6_BIN_OP_LT_uint6_t_uint6_t_c_l15_c23_0f2d_return_output := int7_6_6(
     VAR_sub_BIN_OP_LT_uint6_t_uint6_t_c_l14_c12_00be_0);

     -- Submodule level 3
     VAR_return_output := VAR_int7_6_6_BIN_OP_LT_uint6_t_uint6_t_c_l15_c23_0f2d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
