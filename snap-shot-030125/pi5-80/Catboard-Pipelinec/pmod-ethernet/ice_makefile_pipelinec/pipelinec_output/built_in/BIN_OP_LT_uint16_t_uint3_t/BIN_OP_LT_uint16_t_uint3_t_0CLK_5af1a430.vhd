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
-- Submodules: 6
entity BIN_OP_LT_uint16_t_uint3_t_0CLK_5af1a430 is
port(
 left : in unsigned(15 downto 0);
 right : in unsigned(2 downto 0);
 return_output : out unsigned(0 downto 0));
end BIN_OP_LT_uint16_t_uint3_t_0CLK_5af1a430;
architecture arch of BIN_OP_LT_uint16_t_uint3_t_0CLK_5af1a430 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- CONST_SR_3[BIN_OP_LT_uint16_t_uint3_t_c_l13_c9_1923]
signal CONST_SR_3_BIN_OP_LT_uint16_t_uint3_t_c_l13_c9_1923_x : unsigned(15 downto 0);
signal CONST_SR_3_BIN_OP_LT_uint16_t_uint3_t_c_l13_c9_1923_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a]
signal BIN_OP_EQ_BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a_left : unsigned(12 downto 0);
signal BIN_OP_EQ_BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a_return_output : unsigned(0 downto 0);

-- rv_MUX[BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352]
signal rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_cond : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_iftrue : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_iffalse : unsigned(0 downto 0);
signal rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a]
signal BIN_OP_MINUS_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a_left : signed(3 downto 0);
signal BIN_OP_MINUS_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a_right : signed(3 downto 0);
signal BIN_OP_MINUS_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a_return_output : signed(4 downto 0);

function CAST_TO_int4_t_uint3_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(2 downto 0);
  variable return_output : signed(3 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function int4_3_3( x : signed) return unsigned is
--variable x : signed(3 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(3- i);
      end loop;
return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- CONST_SR_3_BIN_OP_LT_uint16_t_uint3_t_c_l13_c9_1923 : 0 clocks latency
CONST_SR_3_BIN_OP_LT_uint16_t_uint3_t_c_l13_c9_1923 : entity work.CONST_SR_3_uint16_t_0CLK_de264c78 port map (
CONST_SR_3_BIN_OP_LT_uint16_t_uint3_t_c_l13_c9_1923_x,
CONST_SR_3_BIN_OP_LT_uint16_t_uint3_t_c_l13_c9_1923_return_output);

-- BIN_OP_EQ_BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a : 0 clocks latency
BIN_OP_EQ_BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a : entity work.BIN_OP_EQ_uint13_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a_left,
BIN_OP_EQ_BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a_right,
BIN_OP_EQ_BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a_return_output);

-- rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352 : 0 clocks latency
rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_cond,
rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_iftrue,
rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_iffalse,
rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_return_output);

-- BIN_OP_MINUS_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a : 0 clocks latency
BIN_OP_MINUS_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a : entity work.BIN_OP_MINUS_int4_t_int4_t_0CLK_de264c78 port map (
BIN_OP_MINUS_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a_left,
BIN_OP_MINUS_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a_right,
BIN_OP_MINUS_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 left,
 right,
 -- All submodule outputs
 CONST_SR_3_BIN_OP_LT_uint16_t_uint3_t_c_l13_c9_1923_return_output,
 BIN_OP_EQ_BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a_return_output,
 rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_return_output,
 BIN_OP_MINUS_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_left : unsigned(15 downto 0);
 variable VAR_right : unsigned(2 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_left_bot : unsigned(2 downto 0);
 variable VAR_left_bot_BIN_OP_LT_uint16_t_uint3_t_c_l9_c13_a532_0 : unsigned(2 downto 0);
 variable VAR_right_bot : unsigned(2 downto 0);
 variable VAR_right_bot_BIN_OP_LT_uint16_t_uint3_t_c_l10_c13_efba_0 : unsigned(2 downto 0);
 variable VAR_top : unsigned(12 downto 0);
 variable VAR_top_BIN_OP_LT_uint16_t_uint3_t_c_l13_c3_0f55 : unsigned(12 downto 0);
 variable VAR_CONST_SR_3_BIN_OP_LT_uint16_t_uint3_t_c_l13_c9_1923_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_3_BIN_OP_LT_uint16_t_uint3_t_c_l13_c9_1923_x : unsigned(15 downto 0);
 variable VAR_rv : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a_left : unsigned(12 downto 0);
 variable VAR_BIN_OP_EQ_BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a_return_output : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_iftrue : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_iffalse : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_return_output : unsigned(0 downto 0);
 variable VAR_rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_cond : unsigned(0 downto 0);
 variable VAR_sub : signed(3 downto 0);
 variable VAR_sub_BIN_OP_LT_uint16_t_uint3_t_c_l17_c12_83ec_0 : signed(3 downto 0);
 variable VAR_CAST_TO_int4_t_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_6825_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a_left : signed(3 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a_right : signed(3 downto 0);
 variable VAR_BIN_OP_MINUS_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a_return_output : signed(4 downto 0);
 variable VAR_lt_zero : unsigned(0 downto 0);
 variable VAR_int4_3_3_BIN_OP_LT_uint16_t_uint3_t_c_l18_c23_bcd5_return_output : unsigned(0 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a_right := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_left := left;
     VAR_right := right;

     -- Submodule level 0
     VAR_CONST_SR_3_BIN_OP_LT_uint16_t_uint3_t_c_l13_c9_1923_x := VAR_left;
     VAR_left_bot_BIN_OP_LT_uint16_t_uint3_t_c_l9_c13_a532_0 := resize(VAR_left, 3);
     VAR_right_bot_BIN_OP_LT_uint16_t_uint3_t_c_l10_c13_efba_0 := VAR_right;
     VAR_BIN_OP_MINUS_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a_right := signed(std_logic_vector(resize(VAR_right_bot_BIN_OP_LT_uint16_t_uint3_t_c_l10_c13_efba_0, 4)));
     -- CONST_SR_3[BIN_OP_LT_uint16_t_uint3_t_c_l13_c9_1923] LATENCY=0
     -- Inputs
     CONST_SR_3_BIN_OP_LT_uint16_t_uint3_t_c_l13_c9_1923_x <= VAR_CONST_SR_3_BIN_OP_LT_uint16_t_uint3_t_c_l13_c9_1923_x;
     -- Outputs
     VAR_CONST_SR_3_BIN_OP_LT_uint16_t_uint3_t_c_l13_c9_1923_return_output := CONST_SR_3_BIN_OP_LT_uint16_t_uint3_t_c_l13_c9_1923_return_output;

     -- CAST_TO_int4_t[BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_6825] LATENCY=0
     VAR_CAST_TO_int4_t_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_6825_return_output := CAST_TO_int4_t_uint3_t(
     VAR_left_bot_BIN_OP_LT_uint16_t_uint3_t_c_l9_c13_a532_0);

     -- Submodule level 1
     VAR_BIN_OP_MINUS_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a_left := VAR_CAST_TO_int4_t_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_6825_return_output;
     VAR_top_BIN_OP_LT_uint16_t_uint3_t_c_l13_c3_0f55 := resize(VAR_CONST_SR_3_BIN_OP_LT_uint16_t_uint3_t_c_l13_c9_1923_return_output, 13);
     VAR_BIN_OP_EQ_BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a_left := VAR_top_BIN_OP_LT_uint16_t_uint3_t_c_l13_c3_0f55;
     -- BIN_OP_EQ[BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a_left <= VAR_BIN_OP_EQ_BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a_left;
     BIN_OP_EQ_BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a_right <= VAR_BIN_OP_EQ_BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a_right;
     -- Outputs
     VAR_BIN_OP_EQ_BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a_return_output := BIN_OP_EQ_BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a_return_output;

     -- BIN_OP_MINUS[BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a_left <= VAR_BIN_OP_MINUS_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a_left;
     BIN_OP_MINUS_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a_right <= VAR_BIN_OP_MINUS_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a_right;
     -- Outputs
     VAR_BIN_OP_MINUS_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a_return_output := BIN_OP_MINUS_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a_return_output;

     -- Submodule level 2
     VAR_rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_cond := VAR_BIN_OP_EQ_BIN_OP_LT_uint16_t_uint3_t_c_l15_c6_a86a_return_output;
     VAR_sub_BIN_OP_LT_uint16_t_uint3_t_c_l17_c12_83ec_0 := resize(VAR_BIN_OP_MINUS_BIN_OP_LT_uint16_t_uint3_t_c_l17_c18_191a_return_output, 4);
     -- int4_3_3[BIN_OP_LT_uint16_t_uint3_t_c_l18_c23_bcd5] LATENCY=0
     VAR_int4_3_3_BIN_OP_LT_uint16_t_uint3_t_c_l18_c23_bcd5_return_output := int4_3_3(
     VAR_sub_BIN_OP_LT_uint16_t_uint3_t_c_l17_c12_83ec_0);

     -- Submodule level 3
     VAR_rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_iftrue := VAR_int4_3_3_BIN_OP_LT_uint16_t_uint3_t_c_l18_c23_bcd5_return_output;
     -- rv_MUX[BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352] LATENCY=0
     -- Inputs
     rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_cond <= VAR_rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_cond;
     rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_iftrue <= VAR_rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_iftrue;
     rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_iffalse <= VAR_rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_iffalse;
     -- Outputs
     VAR_rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_return_output := rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_return_output;

     -- Submodule level 4
     VAR_return_output := VAR_rv_MUX_BIN_OP_LT_uint16_t_uint3_t_c_l15_c3_8352_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
