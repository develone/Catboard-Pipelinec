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
-- Submodules: 13
entity work_deserialize_type_byte_deserializer_deserializer_in_to_out_0CLK_d2b41046 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 in_data : in uint8_t_1;
 in_data_valid : in unsigned(0 downto 0);
 out_data_ready : in unsigned(0 downto 0);
 return_output : out work_deserialize_type_byte_deserializer_deserializer_in_to_out_t);
end work_deserialize_type_byte_deserializer_deserializer_in_to_out_0CLK_d2b41046;
architecture arch of work_deserialize_type_byte_deserializer_deserializer_in_to_out_0CLK_d2b41046 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal out_buffer : uint8_t_8 := (others => to_unsigned(0, 8));
signal out_buffer_valid : unsigned(0 downto 0) := to_unsigned(0, 1);
signal out_counter : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_out_buffer : uint8_t_8;
signal REG_COMB_out_buffer_valid : unsigned(0 downto 0);
signal REG_COMB_out_counter : unsigned(15 downto 0);

-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Each function instance gets signals
-- UNARY_OP_NOT[ethernet_top_c_l77_c640_f7fa]
signal UNARY_OP_NOT_ethernet_top_c_l77_c640_f7fa_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_ethernet_top_c_l77_c640_f7fa_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[ethernet_top_c_l77_c725_c3f6]
signal BIN_OP_AND_ethernet_top_c_l77_c725_c3f6_left : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l77_c725_c3f6_right : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l77_c725_c3f6_return_output : unsigned(0 downto 0);

-- out_buffer_valid_MUX[ethernet_top_c_l77_c722_2858]
signal out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_cond : unsigned(0 downto 0);
signal out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_iftrue : unsigned(0 downto 0);
signal out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_iffalse : unsigned(0 downto 0);
signal out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_return_output : unsigned(0 downto 0);

-- out_counter_MUX[ethernet_top_c_l77_c722_2858]
signal out_counter_MUX_ethernet_top_c_l77_c722_2858_cond : unsigned(0 downto 0);
signal out_counter_MUX_ethernet_top_c_l77_c722_2858_iftrue : unsigned(15 downto 0);
signal out_counter_MUX_ethernet_top_c_l77_c722_2858_iffalse : unsigned(15 downto 0);
signal out_counter_MUX_ethernet_top_c_l77_c722_2858_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[ethernet_top_c_l77_c806_4e52]
signal BIN_OP_AND_ethernet_top_c_l77_c806_4e52_left : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l77_c806_4e52_right : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l77_c806_4e52_return_output : unsigned(0 downto 0);

-- out_buffer_valid_MUX[ethernet_top_c_l77_c803_3cb2]
signal out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_cond : unsigned(0 downto 0);
signal out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_iftrue : unsigned(0 downto 0);
signal out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_iffalse : unsigned(0 downto 0);
signal out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_return_output : unsigned(0 downto 0);

-- out_buffer_MUX[ethernet_top_c_l77_c803_3cb2]
signal out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_cond : unsigned(0 downto 0);
signal out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_iftrue : uint8_t_8;
signal out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_iffalse : uint8_t_8;
signal out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_return_output : uint8_t_8;

-- out_counter_MUX[ethernet_top_c_l77_c803_3cb2]
signal out_counter_MUX_ethernet_top_c_l77_c803_3cb2_cond : unsigned(0 downto 0);
signal out_counter_MUX_ethernet_top_c_l77_c803_3cb2_iftrue : unsigned(15 downto 0);
signal out_counter_MUX_ethernet_top_c_l77_c803_3cb2_iffalse : unsigned(15 downto 0);
signal out_counter_MUX_ethernet_top_c_l77_c803_3cb2_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[ethernet_top_c_l77_c1258_0771]
signal BIN_OP_PLUS_ethernet_top_c_l77_c1258_0771_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_ethernet_top_c_l77_c1258_0771_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_ethernet_top_c_l77_c1258_0771_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[ethernet_top_c_l77_c1283_1cdc]
signal BIN_OP_EQ_ethernet_top_c_l77_c1283_1cdc_left : unsigned(15 downto 0);
signal BIN_OP_EQ_ethernet_top_c_l77_c1283_1cdc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_ethernet_top_c_l77_c1283_1cdc_return_output : unsigned(0 downto 0);

-- out_buffer_valid_MUX[ethernet_top_c_l77_c1280_77ba]
signal out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_cond : unsigned(0 downto 0);
signal out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_iftrue : unsigned(0 downto 0);
signal out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_iffalse : unsigned(0 downto 0);
signal out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_return_output : unsigned(0 downto 0);

function CONST_REF_RD_uint8_t_8_uint8_t_8_52b8( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return uint8_t_8 is
 
  variable base : uint8_t_8; 
  variable return_output : uint8_t_8;
begin
      base(0) := ref_toks_0;
      base(1) := ref_toks_1;
      base(2) := ref_toks_2;
      base(3) := ref_toks_3;
      base(4) := ref_toks_4;
      base(5) := ref_toks_5;
      base(6) := ref_toks_6;
      base(7) := ref_toks_7;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_5e5b( ref_toks_0 : unsigned;
 ref_toks_1 : uint8_t_8;
 ref_toks_2 : unsigned) return work_deserialize_type_byte_deserializer_deserializer_in_to_out_t is
 
  variable base : work_deserialize_type_byte_deserializer_deserializer_in_to_out_t; 
  variable return_output : work_deserialize_type_byte_deserializer_deserializer_in_to_out_t;
begin
      base.in_data_ready := ref_toks_0;
      base.out_data := ref_toks_1;
      base.out_data_valid := ref_toks_2;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- UNARY_OP_NOT_ethernet_top_c_l77_c640_f7fa : 0 clocks latency
UNARY_OP_NOT_ethernet_top_c_l77_c640_f7fa : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_ethernet_top_c_l77_c640_f7fa_expr,
UNARY_OP_NOT_ethernet_top_c_l77_c640_f7fa_return_output);

-- BIN_OP_AND_ethernet_top_c_l77_c725_c3f6 : 0 clocks latency
BIN_OP_AND_ethernet_top_c_l77_c725_c3f6 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_ethernet_top_c_l77_c725_c3f6_left,
BIN_OP_AND_ethernet_top_c_l77_c725_c3f6_right,
BIN_OP_AND_ethernet_top_c_l77_c725_c3f6_return_output);

-- out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858 : 0 clocks latency
out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_cond,
out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_iftrue,
out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_iffalse,
out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_return_output);

-- out_counter_MUX_ethernet_top_c_l77_c722_2858 : 0 clocks latency
out_counter_MUX_ethernet_top_c_l77_c722_2858 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
out_counter_MUX_ethernet_top_c_l77_c722_2858_cond,
out_counter_MUX_ethernet_top_c_l77_c722_2858_iftrue,
out_counter_MUX_ethernet_top_c_l77_c722_2858_iffalse,
out_counter_MUX_ethernet_top_c_l77_c722_2858_return_output);

-- BIN_OP_AND_ethernet_top_c_l77_c806_4e52 : 0 clocks latency
BIN_OP_AND_ethernet_top_c_l77_c806_4e52 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_ethernet_top_c_l77_c806_4e52_left,
BIN_OP_AND_ethernet_top_c_l77_c806_4e52_right,
BIN_OP_AND_ethernet_top_c_l77_c806_4e52_return_output);

-- out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2 : 0 clocks latency
out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_cond,
out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_iftrue,
out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_iffalse,
out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_return_output);

-- out_buffer_MUX_ethernet_top_c_l77_c803_3cb2 : 0 clocks latency
out_buffer_MUX_ethernet_top_c_l77_c803_3cb2 : entity work.MUX_uint1_t_uint8_t_8_uint8_t_8_0CLK_de264c78 port map (
out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_cond,
out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_iftrue,
out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_iffalse,
out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_return_output);

-- out_counter_MUX_ethernet_top_c_l77_c803_3cb2 : 0 clocks latency
out_counter_MUX_ethernet_top_c_l77_c803_3cb2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
out_counter_MUX_ethernet_top_c_l77_c803_3cb2_cond,
out_counter_MUX_ethernet_top_c_l77_c803_3cb2_iftrue,
out_counter_MUX_ethernet_top_c_l77_c803_3cb2_iffalse,
out_counter_MUX_ethernet_top_c_l77_c803_3cb2_return_output);

-- BIN_OP_PLUS_ethernet_top_c_l77_c1258_0771 : 0 clocks latency
BIN_OP_PLUS_ethernet_top_c_l77_c1258_0771 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_ethernet_top_c_l77_c1258_0771_left,
BIN_OP_PLUS_ethernet_top_c_l77_c1258_0771_right,
BIN_OP_PLUS_ethernet_top_c_l77_c1258_0771_return_output);

-- BIN_OP_EQ_ethernet_top_c_l77_c1283_1cdc : 0 clocks latency
BIN_OP_EQ_ethernet_top_c_l77_c1283_1cdc : entity work.BIN_OP_EQ_uint16_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_ethernet_top_c_l77_c1283_1cdc_left,
BIN_OP_EQ_ethernet_top_c_l77_c1283_1cdc_right,
BIN_OP_EQ_ethernet_top_c_l77_c1283_1cdc_return_output);

-- out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba : 0 clocks latency
out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_cond,
out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_iftrue,
out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_iffalse,
out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_return_output);



-- Resolve what clock enable to use for user logic
clk_en_internal <= CLOCK_ENABLE(0);
-- Combinatorial process for pipeline stages
process (
CLOCK_ENABLE,
clk_en_internal,
 -- Inputs
 in_data,
 in_data_valid,
 out_data_ready,
 -- Registers
 out_buffer,
 out_buffer_valid,
 out_counter,
 -- All submodule outputs
 UNARY_OP_NOT_ethernet_top_c_l77_c640_f7fa_return_output,
 BIN_OP_AND_ethernet_top_c_l77_c725_c3f6_return_output,
 out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_return_output,
 out_counter_MUX_ethernet_top_c_l77_c722_2858_return_output,
 BIN_OP_AND_ethernet_top_c_l77_c806_4e52_return_output,
 out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_return_output,
 out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_return_output,
 out_counter_MUX_ethernet_top_c_l77_c803_3cb2_return_output,
 BIN_OP_PLUS_ethernet_top_c_l77_c1258_0771_return_output,
 BIN_OP_EQ_ethernet_top_c_l77_c1283_1cdc_return_output,
 out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : work_deserialize_type_byte_deserializer_deserializer_in_to_out_t;
 variable VAR_in_data : uint8_t_1;
 variable VAR_in_data_valid : unsigned(0 downto 0);
 variable VAR_out_data_ready : unsigned(0 downto 0);
 variable VAR_rv : work_deserialize_type_byte_deserializer_deserializer_in_to_out_t;
 variable VAR_UNARY_OP_NOT_ethernet_top_c_l77_c640_f7fa_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_ethernet_top_c_l77_c640_f7fa_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l77_c725_c3f6_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l77_c725_c3f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l77_c725_c3f6_return_output : unsigned(0 downto 0);
 variable VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_iftrue : unsigned(0 downto 0);
 variable VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_iffalse : unsigned(0 downto 0);
 variable VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_return_output : unsigned(0 downto 0);
 variable VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_cond : unsigned(0 downto 0);
 variable VAR_out_counter_MUX_ethernet_top_c_l77_c722_2858_iftrue : unsigned(15 downto 0);
 variable VAR_out_counter_ethernet_top_c_l77_c784_408f : unsigned(15 downto 0);
 variable VAR_out_counter_MUX_ethernet_top_c_l77_c722_2858_iffalse : unsigned(15 downto 0);
 variable VAR_out_counter_MUX_ethernet_top_c_l77_c722_2858_return_output : unsigned(15 downto 0);
 variable VAR_out_counter_MUX_ethernet_top_c_l77_c722_2858_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l77_c806_4e52_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l77_c806_4e52_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l77_c806_4e52_return_output : unsigned(0 downto 0);
 variable VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_iftrue : unsigned(0 downto 0);
 variable VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_return_output : unsigned(0 downto 0);
 variable VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_iffalse : unsigned(0 downto 0);
 variable VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_return_output : unsigned(0 downto 0);
 variable VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_cond : unsigned(0 downto 0);
 variable VAR_out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_iftrue : uint8_t_8;
 variable VAR_out_buffer_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_52b8_ethernet_top_c_l77_c803_3cb2_return_output : uint8_t_8;
 variable VAR_out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_iffalse : uint8_t_8;
 variable VAR_out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_return_output : uint8_t_8;
 variable VAR_out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_cond : unsigned(0 downto 0);
 variable VAR_out_counter_MUX_ethernet_top_c_l77_c803_3cb2_iftrue : unsigned(15 downto 0);
 variable VAR_out_counter_ethernet_top_c_l77_c1258_855f : unsigned(15 downto 0);
 variable VAR_out_counter_MUX_ethernet_top_c_l77_c803_3cb2_iffalse : unsigned(15 downto 0);
 variable VAR_out_counter_MUX_ethernet_top_c_l77_c803_3cb2_return_output : unsigned(15 downto 0);
 variable VAR_out_counter_MUX_ethernet_top_c_l77_c803_3cb2_cond : unsigned(0 downto 0);
 variable VAR_ARRAY_SHIFT_DOWN_i : unsigned(31 downto 0);
 variable VAR_FOR_ethernet_top_c_l77_c871_fc9a_ITER_0_CONST_REF_RD_uint8_t_uint8_t_8_1_d41d_ethernet_top_c_l77_c1005_e714_return_output : unsigned(7 downto 0);
 variable VAR_FOR_ethernet_top_c_l77_c871_fc9a_ITER_1_CONST_REF_RD_uint8_t_uint8_t_8_2_d41d_ethernet_top_c_l77_c1005_e714_return_output : unsigned(7 downto 0);
 variable VAR_FOR_ethernet_top_c_l77_c871_fc9a_ITER_2_CONST_REF_RD_uint8_t_uint8_t_8_3_d41d_ethernet_top_c_l77_c1005_e714_return_output : unsigned(7 downto 0);
 variable VAR_FOR_ethernet_top_c_l77_c871_fc9a_ITER_3_CONST_REF_RD_uint8_t_uint8_t_8_4_d41d_ethernet_top_c_l77_c1005_e714_return_output : unsigned(7 downto 0);
 variable VAR_FOR_ethernet_top_c_l77_c871_fc9a_ITER_4_CONST_REF_RD_uint8_t_uint8_t_8_5_d41d_ethernet_top_c_l77_c1005_e714_return_output : unsigned(7 downto 0);
 variable VAR_FOR_ethernet_top_c_l77_c871_fc9a_ITER_5_CONST_REF_RD_uint8_t_uint8_t_8_6_d41d_ethernet_top_c_l77_c1005_e714_return_output : unsigned(7 downto 0);
 variable VAR_FOR_ethernet_top_c_l77_c871_fc9a_ITER_6_CONST_REF_RD_uint8_t_uint8_t_8_7_d41d_ethernet_top_c_l77_c1005_e714_return_output : unsigned(7 downto 0);
 variable VAR_ARRAY_SHIFT_INTO_TOP_i : unsigned(31 downto 0);
 variable VAR_FOR_ethernet_top_c_l77_c1071_bf34_ITER_0_CONST_REF_RD_uint8_t_uint8_t_1_0_d41d_ethernet_top_c_l77_c1223_8e57_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_ethernet_top_c_l77_c1258_0771_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_ethernet_top_c_l77_c1258_0771_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_ethernet_top_c_l77_c1258_0771_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_ethernet_top_c_l77_c1283_1cdc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_ethernet_top_c_l77_c1283_1cdc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_ethernet_top_c_l77_c1283_1cdc_return_output : unsigned(0 downto 0);
 variable VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_iftrue : unsigned(0 downto 0);
 variable VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_iffalse : unsigned(0 downto 0);
 variable VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_5e5b_ethernet_top_c_l77_c1354_ae42_return_output : work_deserialize_type_byte_deserializer_deserializer_in_to_out_t;
 -- State registers comb logic variables
variable REG_VAR_out_buffer : uint8_t_8;
variable REG_VAR_out_buffer_valid : unsigned(0 downto 0);
variable REG_VAR_out_counter : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_out_buffer := out_buffer;
  REG_VAR_out_buffer_valid := out_buffer_valid;
  REG_VAR_out_counter := out_counter;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_ethernet_top_c_l77_c1283_1cdc_right := to_unsigned(8, 4);
     VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_iftrue := to_unsigned(1, 1);
     VAR_out_counter_ethernet_top_c_l77_c784_408f := resize(to_unsigned(0, 1), 16);
     VAR_out_counter_MUX_ethernet_top_c_l77_c722_2858_iftrue := VAR_out_counter_ethernet_top_c_l77_c784_408f;
     VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_ethernet_top_c_l77_c1258_0771_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;
     -- Mux in inputs
     VAR_in_data := in_data;
     VAR_in_data_valid := in_data_valid;
     VAR_out_data_ready := out_data_ready;

     -- Submodule level 0
     VAR_BIN_OP_AND_ethernet_top_c_l77_c806_4e52_right := VAR_in_data_valid;
     VAR_out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_iffalse := out_buffer;
     VAR_BIN_OP_AND_ethernet_top_c_l77_c725_c3f6_right := out_buffer_valid;
     VAR_UNARY_OP_NOT_ethernet_top_c_l77_c640_f7fa_expr := out_buffer_valid;
     VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_iffalse := out_buffer_valid;
     VAR_out_counter_MUX_ethernet_top_c_l77_c722_2858_iffalse := out_counter;
     VAR_BIN_OP_AND_ethernet_top_c_l77_c725_c3f6_left := VAR_out_data_ready;
     -- FOR_ethernet_top_c_l77_c871_fc9a_ITER_0_CONST_REF_RD_uint8_t_uint8_t_8_1_d41d[ethernet_top_c_l77_c1005_e714] LATENCY=0
     VAR_FOR_ethernet_top_c_l77_c871_fc9a_ITER_0_CONST_REF_RD_uint8_t_uint8_t_8_1_d41d_ethernet_top_c_l77_c1005_e714_return_output := out_buffer(1);

     -- FOR_ethernet_top_c_l77_c871_fc9a_ITER_2_CONST_REF_RD_uint8_t_uint8_t_8_3_d41d[ethernet_top_c_l77_c1005_e714] LATENCY=0
     VAR_FOR_ethernet_top_c_l77_c871_fc9a_ITER_2_CONST_REF_RD_uint8_t_uint8_t_8_3_d41d_ethernet_top_c_l77_c1005_e714_return_output := out_buffer(3);

     -- FOR_ethernet_top_c_l77_c871_fc9a_ITER_5_CONST_REF_RD_uint8_t_uint8_t_8_6_d41d[ethernet_top_c_l77_c1005_e714] LATENCY=0
     VAR_FOR_ethernet_top_c_l77_c871_fc9a_ITER_5_CONST_REF_RD_uint8_t_uint8_t_8_6_d41d_ethernet_top_c_l77_c1005_e714_return_output := out_buffer(6);

     -- FOR_ethernet_top_c_l77_c871_fc9a_ITER_6_CONST_REF_RD_uint8_t_uint8_t_8_7_d41d[ethernet_top_c_l77_c1005_e714] LATENCY=0
     VAR_FOR_ethernet_top_c_l77_c871_fc9a_ITER_6_CONST_REF_RD_uint8_t_uint8_t_8_7_d41d_ethernet_top_c_l77_c1005_e714_return_output := out_buffer(7);

     -- BIN_OP_AND[ethernet_top_c_l77_c725_c3f6] LATENCY=0
     -- Inputs
     BIN_OP_AND_ethernet_top_c_l77_c725_c3f6_left <= VAR_BIN_OP_AND_ethernet_top_c_l77_c725_c3f6_left;
     BIN_OP_AND_ethernet_top_c_l77_c725_c3f6_right <= VAR_BIN_OP_AND_ethernet_top_c_l77_c725_c3f6_right;
     -- Outputs
     VAR_BIN_OP_AND_ethernet_top_c_l77_c725_c3f6_return_output := BIN_OP_AND_ethernet_top_c_l77_c725_c3f6_return_output;

     -- FOR_ethernet_top_c_l77_c871_fc9a_ITER_4_CONST_REF_RD_uint8_t_uint8_t_8_5_d41d[ethernet_top_c_l77_c1005_e714] LATENCY=0
     VAR_FOR_ethernet_top_c_l77_c871_fc9a_ITER_4_CONST_REF_RD_uint8_t_uint8_t_8_5_d41d_ethernet_top_c_l77_c1005_e714_return_output := out_buffer(5);

     -- UNARY_OP_NOT[ethernet_top_c_l77_c640_f7fa] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_ethernet_top_c_l77_c640_f7fa_expr <= VAR_UNARY_OP_NOT_ethernet_top_c_l77_c640_f7fa_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_ethernet_top_c_l77_c640_f7fa_return_output := UNARY_OP_NOT_ethernet_top_c_l77_c640_f7fa_return_output;

     -- FOR_ethernet_top_c_l77_c871_fc9a_ITER_3_CONST_REF_RD_uint8_t_uint8_t_8_4_d41d[ethernet_top_c_l77_c1005_e714] LATENCY=0
     VAR_FOR_ethernet_top_c_l77_c871_fc9a_ITER_3_CONST_REF_RD_uint8_t_uint8_t_8_4_d41d_ethernet_top_c_l77_c1005_e714_return_output := out_buffer(4);

     -- FOR_ethernet_top_c_l77_c871_fc9a_ITER_1_CONST_REF_RD_uint8_t_uint8_t_8_2_d41d[ethernet_top_c_l77_c1005_e714] LATENCY=0
     VAR_FOR_ethernet_top_c_l77_c871_fc9a_ITER_1_CONST_REF_RD_uint8_t_uint8_t_8_2_d41d_ethernet_top_c_l77_c1005_e714_return_output := out_buffer(2);

     -- FOR_ethernet_top_c_l77_c1071_bf34_ITER_0_CONST_REF_RD_uint8_t_uint8_t_1_0_d41d[ethernet_top_c_l77_c1223_8e57] LATENCY=0
     VAR_FOR_ethernet_top_c_l77_c1071_bf34_ITER_0_CONST_REF_RD_uint8_t_uint8_t_1_0_d41d_ethernet_top_c_l77_c1223_8e57_return_output := VAR_in_data(0);

     -- Submodule level 1
     VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_cond := VAR_BIN_OP_AND_ethernet_top_c_l77_c725_c3f6_return_output;
     VAR_out_counter_MUX_ethernet_top_c_l77_c722_2858_cond := VAR_BIN_OP_AND_ethernet_top_c_l77_c725_c3f6_return_output;
     VAR_BIN_OP_AND_ethernet_top_c_l77_c806_4e52_left := VAR_UNARY_OP_NOT_ethernet_top_c_l77_c640_f7fa_return_output;
     -- CONST_REF_RD_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_5e5b[ethernet_top_c_l77_c1354_ae42] LATENCY=0
     VAR_CONST_REF_RD_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_5e5b_ethernet_top_c_l77_c1354_ae42_return_output := CONST_REF_RD_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_5e5b(
     VAR_UNARY_OP_NOT_ethernet_top_c_l77_c640_f7fa_return_output,
     out_buffer,
     out_buffer_valid);

     -- out_buffer_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_52b8[ethernet_top_c_l77_c803_3cb2] LATENCY=0
     VAR_out_buffer_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_52b8_ethernet_top_c_l77_c803_3cb2_return_output := CONST_REF_RD_uint8_t_8_uint8_t_8_52b8(
     VAR_FOR_ethernet_top_c_l77_c871_fc9a_ITER_0_CONST_REF_RD_uint8_t_uint8_t_8_1_d41d_ethernet_top_c_l77_c1005_e714_return_output,
     VAR_FOR_ethernet_top_c_l77_c871_fc9a_ITER_1_CONST_REF_RD_uint8_t_uint8_t_8_2_d41d_ethernet_top_c_l77_c1005_e714_return_output,
     VAR_FOR_ethernet_top_c_l77_c871_fc9a_ITER_2_CONST_REF_RD_uint8_t_uint8_t_8_3_d41d_ethernet_top_c_l77_c1005_e714_return_output,
     VAR_FOR_ethernet_top_c_l77_c871_fc9a_ITER_3_CONST_REF_RD_uint8_t_uint8_t_8_4_d41d_ethernet_top_c_l77_c1005_e714_return_output,
     VAR_FOR_ethernet_top_c_l77_c871_fc9a_ITER_4_CONST_REF_RD_uint8_t_uint8_t_8_5_d41d_ethernet_top_c_l77_c1005_e714_return_output,
     VAR_FOR_ethernet_top_c_l77_c871_fc9a_ITER_5_CONST_REF_RD_uint8_t_uint8_t_8_6_d41d_ethernet_top_c_l77_c1005_e714_return_output,
     VAR_FOR_ethernet_top_c_l77_c871_fc9a_ITER_6_CONST_REF_RD_uint8_t_uint8_t_8_7_d41d_ethernet_top_c_l77_c1005_e714_return_output,
     VAR_FOR_ethernet_top_c_l77_c1071_bf34_ITER_0_CONST_REF_RD_uint8_t_uint8_t_1_0_d41d_ethernet_top_c_l77_c1223_8e57_return_output);

     -- out_buffer_valid_MUX[ethernet_top_c_l77_c722_2858] LATENCY=0
     -- Inputs
     out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_cond <= VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_cond;
     out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_iftrue <= VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_iftrue;
     out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_iffalse <= VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_iffalse;
     -- Outputs
     VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_return_output := out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_return_output;

     -- out_counter_MUX[ethernet_top_c_l77_c722_2858] LATENCY=0
     -- Inputs
     out_counter_MUX_ethernet_top_c_l77_c722_2858_cond <= VAR_out_counter_MUX_ethernet_top_c_l77_c722_2858_cond;
     out_counter_MUX_ethernet_top_c_l77_c722_2858_iftrue <= VAR_out_counter_MUX_ethernet_top_c_l77_c722_2858_iftrue;
     out_counter_MUX_ethernet_top_c_l77_c722_2858_iffalse <= VAR_out_counter_MUX_ethernet_top_c_l77_c722_2858_iffalse;
     -- Outputs
     VAR_out_counter_MUX_ethernet_top_c_l77_c722_2858_return_output := out_counter_MUX_ethernet_top_c_l77_c722_2858_return_output;

     -- BIN_OP_AND[ethernet_top_c_l77_c806_4e52] LATENCY=0
     -- Inputs
     BIN_OP_AND_ethernet_top_c_l77_c806_4e52_left <= VAR_BIN_OP_AND_ethernet_top_c_l77_c806_4e52_left;
     BIN_OP_AND_ethernet_top_c_l77_c806_4e52_right <= VAR_BIN_OP_AND_ethernet_top_c_l77_c806_4e52_right;
     -- Outputs
     VAR_BIN_OP_AND_ethernet_top_c_l77_c806_4e52_return_output := BIN_OP_AND_ethernet_top_c_l77_c806_4e52_return_output;

     -- Submodule level 2
     VAR_out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_cond := VAR_BIN_OP_AND_ethernet_top_c_l77_c806_4e52_return_output;
     VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_cond := VAR_BIN_OP_AND_ethernet_top_c_l77_c806_4e52_return_output;
     VAR_out_counter_MUX_ethernet_top_c_l77_c803_3cb2_cond := VAR_BIN_OP_AND_ethernet_top_c_l77_c806_4e52_return_output;
     VAR_return_output := VAR_CONST_REF_RD_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_5e5b_ethernet_top_c_l77_c1354_ae42_return_output;
     VAR_out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_iftrue := VAR_out_buffer_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_8_uint8_t_8_52b8_ethernet_top_c_l77_c803_3cb2_return_output;
     VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_iffalse := VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_return_output;
     VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_iffalse := VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c722_2858_return_output;
     VAR_BIN_OP_PLUS_ethernet_top_c_l77_c1258_0771_left := VAR_out_counter_MUX_ethernet_top_c_l77_c722_2858_return_output;
     VAR_out_counter_MUX_ethernet_top_c_l77_c803_3cb2_iffalse := VAR_out_counter_MUX_ethernet_top_c_l77_c722_2858_return_output;
     -- out_buffer_MUX[ethernet_top_c_l77_c803_3cb2] LATENCY=0
     -- Inputs
     out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_cond <= VAR_out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_cond;
     out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_iftrue <= VAR_out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_iftrue;
     out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_iffalse <= VAR_out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_iffalse;
     -- Outputs
     VAR_out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_return_output := out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_return_output;

     -- BIN_OP_PLUS[ethernet_top_c_l77_c1258_0771] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_ethernet_top_c_l77_c1258_0771_left <= VAR_BIN_OP_PLUS_ethernet_top_c_l77_c1258_0771_left;
     BIN_OP_PLUS_ethernet_top_c_l77_c1258_0771_right <= VAR_BIN_OP_PLUS_ethernet_top_c_l77_c1258_0771_right;
     -- Outputs
     VAR_BIN_OP_PLUS_ethernet_top_c_l77_c1258_0771_return_output := BIN_OP_PLUS_ethernet_top_c_l77_c1258_0771_return_output;

     -- Submodule level 3
     VAR_out_counter_ethernet_top_c_l77_c1258_855f := resize(VAR_BIN_OP_PLUS_ethernet_top_c_l77_c1258_0771_return_output, 16);
     REG_VAR_out_buffer := VAR_out_buffer_MUX_ethernet_top_c_l77_c803_3cb2_return_output;
     VAR_BIN_OP_EQ_ethernet_top_c_l77_c1283_1cdc_left := VAR_out_counter_ethernet_top_c_l77_c1258_855f;
     VAR_out_counter_MUX_ethernet_top_c_l77_c803_3cb2_iftrue := VAR_out_counter_ethernet_top_c_l77_c1258_855f;
     -- BIN_OP_EQ[ethernet_top_c_l77_c1283_1cdc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_ethernet_top_c_l77_c1283_1cdc_left <= VAR_BIN_OP_EQ_ethernet_top_c_l77_c1283_1cdc_left;
     BIN_OP_EQ_ethernet_top_c_l77_c1283_1cdc_right <= VAR_BIN_OP_EQ_ethernet_top_c_l77_c1283_1cdc_right;
     -- Outputs
     VAR_BIN_OP_EQ_ethernet_top_c_l77_c1283_1cdc_return_output := BIN_OP_EQ_ethernet_top_c_l77_c1283_1cdc_return_output;

     -- out_counter_MUX[ethernet_top_c_l77_c803_3cb2] LATENCY=0
     -- Inputs
     out_counter_MUX_ethernet_top_c_l77_c803_3cb2_cond <= VAR_out_counter_MUX_ethernet_top_c_l77_c803_3cb2_cond;
     out_counter_MUX_ethernet_top_c_l77_c803_3cb2_iftrue <= VAR_out_counter_MUX_ethernet_top_c_l77_c803_3cb2_iftrue;
     out_counter_MUX_ethernet_top_c_l77_c803_3cb2_iffalse <= VAR_out_counter_MUX_ethernet_top_c_l77_c803_3cb2_iffalse;
     -- Outputs
     VAR_out_counter_MUX_ethernet_top_c_l77_c803_3cb2_return_output := out_counter_MUX_ethernet_top_c_l77_c803_3cb2_return_output;

     -- Submodule level 4
     VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_cond := VAR_BIN_OP_EQ_ethernet_top_c_l77_c1283_1cdc_return_output;
     REG_VAR_out_counter := VAR_out_counter_MUX_ethernet_top_c_l77_c803_3cb2_return_output;
     -- out_buffer_valid_MUX[ethernet_top_c_l77_c1280_77ba] LATENCY=0
     -- Inputs
     out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_cond <= VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_cond;
     out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_iftrue <= VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_iftrue;
     out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_iffalse <= VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_iffalse;
     -- Outputs
     VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_return_output := out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_return_output;

     -- Submodule level 5
     VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_iftrue := VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c1280_77ba_return_output;
     -- out_buffer_valid_MUX[ethernet_top_c_l77_c803_3cb2] LATENCY=0
     -- Inputs
     out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_cond <= VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_cond;
     out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_iftrue <= VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_iftrue;
     out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_iffalse <= VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_iffalse;
     -- Outputs
     VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_return_output := out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_return_output;

     -- Submodule level 6
     REG_VAR_out_buffer_valid := VAR_out_buffer_valid_MUX_ethernet_top_c_l77_c803_3cb2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_out_buffer <= REG_VAR_out_buffer;
REG_COMB_out_buffer_valid <= REG_VAR_out_buffer_valid;
REG_COMB_out_counter <= REG_VAR_out_counter;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if clk_en_internal='1' then
     out_buffer <= REG_COMB_out_buffer;
     out_buffer_valid <= REG_COMB_out_buffer_valid;
     out_counter <= REG_COMB_out_counter;
 end if;
 end if;
end process;

end arch;
