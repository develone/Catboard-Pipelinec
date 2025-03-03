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
-- Submodules: 16
entity axis8_max_len_limiter_0CLK_4c1c43f4 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 max_byte_len : in unsigned(15 downto 0);
 in_stream : in axis8_t_stream_t;
 ready_for_out_stream : in unsigned(0 downto 0);
 return_output : out axis8_max_len_limiter_t);
end axis8_max_len_limiter_0CLK_4c1c43f4;
architecture arch of axis8_max_len_limiter_0CLK_4c1c43f4 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal counter : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_counter : unsigned(15 downto 0);

-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Each function instance gets signals
-- BIN_OP_MINUS[axis_h_l282_c336_48ec]
signal BIN_OP_MINUS_axis_h_l282_c336_48ec_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_axis_h_l282_c336_48ec_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_axis_h_l282_c336_48ec_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[axis_h_l282_c372_948c]
signal BIN_OP_EQ_axis_h_l282_c372_948c_left : unsigned(15 downto 0);
signal BIN_OP_EQ_axis_h_l282_c372_948c_right : unsigned(15 downto 0);
signal BIN_OP_EQ_axis_h_l282_c372_948c_return_output : unsigned(0 downto 0);

-- BIN_OP_LTE[axis_h_l282_c416_f620]
signal BIN_OP_LTE_axis_h_l282_c416_f620_left : unsigned(15 downto 0);
signal BIN_OP_LTE_axis_h_l282_c416_f620_right : unsigned(15 downto 0);
signal BIN_OP_LTE_axis_h_l282_c416_f620_return_output : unsigned(0 downto 0);

-- o_MUX[axis_h_l282_c444_0fda]
signal o_MUX_axis_h_l282_c444_0fda_cond : unsigned(0 downto 0);
signal o_MUX_axis_h_l282_c444_0fda_iftrue : axis8_max_len_limiter_t;
signal o_MUX_axis_h_l282_c444_0fda_iffalse : axis8_max_len_limiter_t;
signal o_MUX_axis_h_l282_c444_0fda_return_output : axis8_max_len_limiter_t;

-- o_out_stream_data_tlast_MUX[axis_h_l282_c587_2162]
signal o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_cond : unsigned(0 downto 0);
signal o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_iftrue : unsigned(0 downto 0);
signal o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_iffalse : unsigned(0 downto 0);
signal o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[axis_h_l282_c631_ef36]
signal BIN_OP_AND_axis_h_l282_c631_ef36_left : unsigned(0 downto 0);
signal BIN_OP_AND_axis_h_l282_c631_ef36_right : unsigned(0 downto 0);
signal BIN_OP_AND_axis_h_l282_c631_ef36_return_output : unsigned(0 downto 0);

-- counter_MUX[axis_h_l282_c628_819c]
signal counter_MUX_axis_h_l282_c628_819c_cond : unsigned(0 downto 0);
signal counter_MUX_axis_h_l282_c628_819c_iftrue : unsigned(15 downto 0);
signal counter_MUX_axis_h_l282_c628_819c_iffalse : unsigned(15 downto 0);
signal counter_MUX_axis_h_l282_c628_819c_return_output : unsigned(15 downto 0);

-- counter_MUX[axis_h_l282_c675_cf87]
signal counter_MUX_axis_h_l282_c675_cf87_cond : unsigned(0 downto 0);
signal counter_MUX_axis_h_l282_c675_cf87_iftrue : unsigned(15 downto 0);
signal counter_MUX_axis_h_l282_c675_cf87_iffalse : unsigned(15 downto 0);
signal counter_MUX_axis_h_l282_c675_cf87_return_output : unsigned(15 downto 0);

-- axis8_keep_count[axis_h_l282_c697_e658]
signal axis8_keep_count_axis_h_l282_c697_e658_s : axis8_t_stream_t;
signal axis8_keep_count_axis_h_l282_c697_e658_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[axis_h_l282_c686_1973]
signal BIN_OP_PLUS_axis_h_l282_c686_1973_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_axis_h_l282_c686_1973_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_axis_h_l282_c686_1973_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[axis_h_l282_c733_52f8]
signal BIN_OP_AND_axis_h_l282_c733_52f8_left : unsigned(0 downto 0);
signal BIN_OP_AND_axis_h_l282_c733_52f8_right : unsigned(0 downto 0);
signal BIN_OP_AND_axis_h_l282_c733_52f8_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[axis_h_l282_c733_9b6d]
signal BIN_OP_AND_axis_h_l282_c733_9b6d_left : unsigned(0 downto 0);
signal BIN_OP_AND_axis_h_l282_c733_9b6d_right : unsigned(0 downto 0);
signal BIN_OP_AND_axis_h_l282_c733_9b6d_return_output : unsigned(0 downto 0);

-- counter_MUX[axis_h_l282_c730_ebf0]
signal counter_MUX_axis_h_l282_c730_ebf0_cond : unsigned(0 downto 0);
signal counter_MUX_axis_h_l282_c730_ebf0_iftrue : unsigned(15 downto 0);
signal counter_MUX_axis_h_l282_c730_ebf0_iffalse : unsigned(15 downto 0);
signal counter_MUX_axis_h_l282_c730_ebf0_return_output : unsigned(15 downto 0);

function CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_8353( ref_toks_0 : axis8_t_stream_t;
 ref_toks_1 : unsigned) return axis8_max_len_limiter_t is
 
  variable base : axis8_max_len_limiter_t; 
  variable return_output : axis8_max_len_limiter_t;
begin
      base.out_stream := ref_toks_0;
      base.ready_for_in_stream := ref_toks_1;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_fbb8( ref_toks_0 : axis8_max_len_limiter_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return axis8_max_len_limiter_t is
 
  variable base : axis8_max_len_limiter_t; 
  variable return_output : axis8_max_len_limiter_t;
begin
      base := ref_toks_0;
      base.out_stream.valid := ref_toks_1;
      base.ready_for_in_stream := ref_toks_2;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_f6db( ref_toks_0 : axis8_max_len_limiter_t;
 ref_toks_1 : unsigned) return axis8_max_len_limiter_t is
 
  variable base : axis8_max_len_limiter_t; 
  variable return_output : axis8_max_len_limiter_t;
begin
      base := ref_toks_0;
      base.out_stream.data.tlast := ref_toks_1;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_MINUS_axis_h_l282_c336_48ec : 0 clocks latency
BIN_OP_MINUS_axis_h_l282_c336_48ec : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_axis_h_l282_c336_48ec_left,
BIN_OP_MINUS_axis_h_l282_c336_48ec_right,
BIN_OP_MINUS_axis_h_l282_c336_48ec_return_output);

-- BIN_OP_EQ_axis_h_l282_c372_948c : 0 clocks latency
BIN_OP_EQ_axis_h_l282_c372_948c : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_axis_h_l282_c372_948c_left,
BIN_OP_EQ_axis_h_l282_c372_948c_right,
BIN_OP_EQ_axis_h_l282_c372_948c_return_output);

-- BIN_OP_LTE_axis_h_l282_c416_f620 : 0 clocks latency
BIN_OP_LTE_axis_h_l282_c416_f620 : entity work.BIN_OP_LTE_uint16_t_uint16_t_0CLK_6f2c5aad port map (
BIN_OP_LTE_axis_h_l282_c416_f620_left,
BIN_OP_LTE_axis_h_l282_c416_f620_right,
BIN_OP_LTE_axis_h_l282_c416_f620_return_output);

-- o_MUX_axis_h_l282_c444_0fda : 0 clocks latency
o_MUX_axis_h_l282_c444_0fda : entity work.MUX_uint1_t_axis8_max_len_limiter_t_axis8_max_len_limiter_t_0CLK_de264c78 port map (
o_MUX_axis_h_l282_c444_0fda_cond,
o_MUX_axis_h_l282_c444_0fda_iftrue,
o_MUX_axis_h_l282_c444_0fda_iffalse,
o_MUX_axis_h_l282_c444_0fda_return_output);

-- o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162 : 0 clocks latency
o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_cond,
o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_iftrue,
o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_iffalse,
o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_return_output);

-- BIN_OP_AND_axis_h_l282_c631_ef36 : 0 clocks latency
BIN_OP_AND_axis_h_l282_c631_ef36 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_axis_h_l282_c631_ef36_left,
BIN_OP_AND_axis_h_l282_c631_ef36_right,
BIN_OP_AND_axis_h_l282_c631_ef36_return_output);

-- counter_MUX_axis_h_l282_c628_819c : 0 clocks latency
counter_MUX_axis_h_l282_c628_819c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
counter_MUX_axis_h_l282_c628_819c_cond,
counter_MUX_axis_h_l282_c628_819c_iftrue,
counter_MUX_axis_h_l282_c628_819c_iffalse,
counter_MUX_axis_h_l282_c628_819c_return_output);

-- counter_MUX_axis_h_l282_c675_cf87 : 0 clocks latency
counter_MUX_axis_h_l282_c675_cf87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
counter_MUX_axis_h_l282_c675_cf87_cond,
counter_MUX_axis_h_l282_c675_cf87_iftrue,
counter_MUX_axis_h_l282_c675_cf87_iffalse,
counter_MUX_axis_h_l282_c675_cf87_return_output);

-- axis8_keep_count_axis_h_l282_c697_e658 : 0 clocks latency
axis8_keep_count_axis_h_l282_c697_e658 : entity work.axis8_keep_count_0CLK_b45f1687 port map (
axis8_keep_count_axis_h_l282_c697_e658_s,
axis8_keep_count_axis_h_l282_c697_e658_return_output);

-- BIN_OP_PLUS_axis_h_l282_c686_1973 : 0 clocks latency
BIN_OP_PLUS_axis_h_l282_c686_1973 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_axis_h_l282_c686_1973_left,
BIN_OP_PLUS_axis_h_l282_c686_1973_right,
BIN_OP_PLUS_axis_h_l282_c686_1973_return_output);

-- BIN_OP_AND_axis_h_l282_c733_52f8 : 0 clocks latency
BIN_OP_AND_axis_h_l282_c733_52f8 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_axis_h_l282_c733_52f8_left,
BIN_OP_AND_axis_h_l282_c733_52f8_right,
BIN_OP_AND_axis_h_l282_c733_52f8_return_output);

-- BIN_OP_AND_axis_h_l282_c733_9b6d : 0 clocks latency
BIN_OP_AND_axis_h_l282_c733_9b6d : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_axis_h_l282_c733_9b6d_left,
BIN_OP_AND_axis_h_l282_c733_9b6d_right,
BIN_OP_AND_axis_h_l282_c733_9b6d_return_output);

-- counter_MUX_axis_h_l282_c730_ebf0 : 0 clocks latency
counter_MUX_axis_h_l282_c730_ebf0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
counter_MUX_axis_h_l282_c730_ebf0_cond,
counter_MUX_axis_h_l282_c730_ebf0_iftrue,
counter_MUX_axis_h_l282_c730_ebf0_iffalse,
counter_MUX_axis_h_l282_c730_ebf0_return_output);



-- Resolve what clock enable to use for user logic
clk_en_internal <= CLOCK_ENABLE(0);
-- Combinatorial process for pipeline stages
process (
CLOCK_ENABLE,
clk_en_internal,
 -- Inputs
 max_byte_len,
 in_stream,
 ready_for_out_stream,
 -- Registers
 counter,
 -- All submodule outputs
 BIN_OP_MINUS_axis_h_l282_c336_48ec_return_output,
 BIN_OP_EQ_axis_h_l282_c372_948c_return_output,
 BIN_OP_LTE_axis_h_l282_c416_f620_return_output,
 o_MUX_axis_h_l282_c444_0fda_return_output,
 o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_return_output,
 BIN_OP_AND_axis_h_l282_c631_ef36_return_output,
 counter_MUX_axis_h_l282_c628_819c_return_output,
 counter_MUX_axis_h_l282_c675_cf87_return_output,
 axis8_keep_count_axis_h_l282_c697_e658_return_output,
 BIN_OP_PLUS_axis_h_l282_c686_1973_return_output,
 BIN_OP_AND_axis_h_l282_c733_52f8_return_output,
 BIN_OP_AND_axis_h_l282_c733_9b6d_return_output,
 counter_MUX_axis_h_l282_c730_ebf0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : axis8_max_len_limiter_t;
 variable VAR_max_byte_len : unsigned(15 downto 0);
 variable VAR_in_stream : axis8_t_stream_t;
 variable VAR_ready_for_out_stream : unsigned(0 downto 0);
 variable VAR_o : axis8_max_len_limiter_t;
 variable VAR_last_word_limit : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_axis_h_l282_c336_48ec_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_axis_h_l282_c336_48ec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_axis_h_l282_c336_48ec_return_output : unsigned(15 downto 0);
 variable VAR_last : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_axis_h_l282_c372_948c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_axis_h_l282_c372_948c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_axis_h_l282_c372_948c_return_output : unsigned(0 downto 0);
 variable VAR_below : unsigned(0 downto 0);
 variable VAR_BIN_OP_LTE_axis_h_l282_c416_f620_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LTE_axis_h_l282_c416_f620_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LTE_axis_h_l282_c416_f620_return_output : unsigned(0 downto 0);
 variable VAR_o_MUX_axis_h_l282_c444_0fda_iftrue : axis8_max_len_limiter_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_8353_axis_h_l282_c444_0fda_return_output : axis8_max_len_limiter_t;
 variable VAR_o_MUX_axis_h_l282_c444_0fda_iffalse : axis8_max_len_limiter_t;
 variable VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_fbb8_axis_h_l282_c444_0fda_return_output : axis8_max_len_limiter_t;
 variable VAR_o_MUX_axis_h_l282_c444_0fda_return_output : axis8_max_len_limiter_t;
 variable VAR_o_MUX_axis_h_l282_c444_0fda_cond : unsigned(0 downto 0);
 variable VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_iftrue : unsigned(0 downto 0);
 variable VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_iffalse : unsigned(0 downto 0);
 variable VAR_o_out_stream_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_out_stream_data_tlast_d41d_axis_h_l282_c587_2162_return_output : unsigned(0 downto 0);
 variable VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_return_output : unsigned(0 downto 0);
 variable VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_out_stream_valid_d41d_axis_h_l282_c631_ef56_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_axis_h_l282_c631_ef36_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_axis_h_l282_c631_ef36_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_axis_h_l282_c631_ef36_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c628_819c_iftrue : unsigned(15 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c675_cf87_return_output : unsigned(15 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c628_819c_iffalse : unsigned(15 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c628_819c_return_output : unsigned(15 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c628_819c_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c675_cf87_iftrue : unsigned(15 downto 0);
 variable VAR_counter_axis_h_l282_c686_453c : unsigned(15 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c675_cf87_iffalse : unsigned(15 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c675_cf87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_axis_h_l282_c686_1973_left : unsigned(15 downto 0);
 variable VAR_axis8_keep_count_axis_h_l282_c697_e658_s : axis8_t_stream_t;
 variable VAR_BIN_OP_PLUS_axis_h_l282_c686_1973_right : unsigned(0 downto 0);
 variable VAR_axis8_keep_count_axis_h_l282_c697_e658_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_axis_h_l282_c686_1973_return_output : unsigned(16 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_axis_h_l282_c733_18cd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_axis_h_l282_c733_52f8_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_axis_h_l282_c756_3cd4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_axis_h_l282_c733_52f8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_axis_h_l282_c733_52f8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_axis_h_l282_c733_9b6d_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_ready_for_in_stream_d41d_axis_h_l282_c774_867b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_axis_h_l282_c733_9b6d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_axis_h_l282_c733_9b6d_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c730_ebf0_iftrue : unsigned(15 downto 0);
 variable VAR_counter_axis_h_l282_c798_de8a : unsigned(15 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c730_ebf0_iffalse : unsigned(15 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c730_ebf0_return_output : unsigned(15 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c730_ebf0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_f6db_axis_h_l282_c820_ff13_return_output : axis8_max_len_limiter_t;
 -- State registers comb logic variables
variable REG_VAR_counter : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_counter := counter;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_counter_axis_h_l282_c798_de8a := resize(to_unsigned(0, 1), 16);
     VAR_counter_MUX_axis_h_l282_c730_ebf0_iftrue := VAR_counter_axis_h_l282_c798_de8a;
     VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_axis_h_l282_c336_48ec_right := to_unsigned(1, 1);
     -- o_FALSE_INPUT_MUX_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_fbb8[axis_h_l282_c444_0fda] LATENCY=0
     VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_fbb8_axis_h_l282_c444_0fda_return_output := CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_fbb8(
     axis8_max_len_limiter_t_NULL,
     to_unsigned(0, 1),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_o_MUX_axis_h_l282_c444_0fda_iffalse := VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_fbb8_axis_h_l282_c444_0fda_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;
     -- Mux in inputs
     VAR_max_byte_len := max_byte_len;
     VAR_in_stream := in_stream;
     VAR_ready_for_out_stream := ready_for_out_stream;

     -- Submodule level 0
     VAR_BIN_OP_EQ_axis_h_l282_c372_948c_left := counter;
     VAR_BIN_OP_LTE_axis_h_l282_c416_f620_left := counter;
     VAR_BIN_OP_PLUS_axis_h_l282_c686_1973_left := counter;
     VAR_counter_MUX_axis_h_l282_c628_819c_iffalse := counter;
     VAR_counter_MUX_axis_h_l282_c675_cf87_iffalse := counter;
     VAR_axis8_keep_count_axis_h_l282_c697_e658_s := VAR_in_stream;
     VAR_BIN_OP_MINUS_axis_h_l282_c336_48ec_left := VAR_max_byte_len;
     VAR_BIN_OP_AND_axis_h_l282_c631_ef36_right := VAR_ready_for_out_stream;
     -- axis8_keep_count[axis_h_l282_c697_e658] LATENCY=0
     -- Inputs
     axis8_keep_count_axis_h_l282_c697_e658_s <= VAR_axis8_keep_count_axis_h_l282_c697_e658_s;
     -- Outputs
     VAR_axis8_keep_count_axis_h_l282_c697_e658_return_output := axis8_keep_count_axis_h_l282_c697_e658_return_output;

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d[axis_h_l282_c756_3cd4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_axis_h_l282_c756_3cd4_return_output := VAR_in_stream.valid;

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_8353[axis_h_l282_c444_0fda] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_8353_axis_h_l282_c444_0fda_return_output := CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_8353(
     VAR_in_stream,
     VAR_ready_for_out_stream);

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d[axis_h_l282_c733_18cd] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_axis_h_l282_c733_18cd_return_output := VAR_in_stream.data.tlast;

     -- BIN_OP_MINUS[axis_h_l282_c336_48ec] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_axis_h_l282_c336_48ec_left <= VAR_BIN_OP_MINUS_axis_h_l282_c336_48ec_left;
     BIN_OP_MINUS_axis_h_l282_c336_48ec_right <= VAR_BIN_OP_MINUS_axis_h_l282_c336_48ec_right;
     -- Outputs
     VAR_BIN_OP_MINUS_axis_h_l282_c336_48ec_return_output := BIN_OP_MINUS_axis_h_l282_c336_48ec_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_axis_h_l282_c372_948c_right := VAR_BIN_OP_MINUS_axis_h_l282_c336_48ec_return_output;
     VAR_BIN_OP_LTE_axis_h_l282_c416_f620_right := VAR_BIN_OP_MINUS_axis_h_l282_c336_48ec_return_output;
     VAR_BIN_OP_AND_axis_h_l282_c733_52f8_left := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_axis_h_l282_c733_18cd_return_output;
     VAR_BIN_OP_AND_axis_h_l282_c733_52f8_right := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_axis_h_l282_c756_3cd4_return_output;
     VAR_BIN_OP_PLUS_axis_h_l282_c686_1973_right := VAR_axis8_keep_count_axis_h_l282_c697_e658_return_output;
     VAR_o_MUX_axis_h_l282_c444_0fda_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_8353_axis_h_l282_c444_0fda_return_output;
     -- BIN_OP_PLUS[axis_h_l282_c686_1973] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_axis_h_l282_c686_1973_left <= VAR_BIN_OP_PLUS_axis_h_l282_c686_1973_left;
     BIN_OP_PLUS_axis_h_l282_c686_1973_right <= VAR_BIN_OP_PLUS_axis_h_l282_c686_1973_right;
     -- Outputs
     VAR_BIN_OP_PLUS_axis_h_l282_c686_1973_return_output := BIN_OP_PLUS_axis_h_l282_c686_1973_return_output;

     -- BIN_OP_AND[axis_h_l282_c733_52f8] LATENCY=0
     -- Inputs
     BIN_OP_AND_axis_h_l282_c733_52f8_left <= VAR_BIN_OP_AND_axis_h_l282_c733_52f8_left;
     BIN_OP_AND_axis_h_l282_c733_52f8_right <= VAR_BIN_OP_AND_axis_h_l282_c733_52f8_right;
     -- Outputs
     VAR_BIN_OP_AND_axis_h_l282_c733_52f8_return_output := BIN_OP_AND_axis_h_l282_c733_52f8_return_output;

     -- BIN_OP_EQ[axis_h_l282_c372_948c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_axis_h_l282_c372_948c_left <= VAR_BIN_OP_EQ_axis_h_l282_c372_948c_left;
     BIN_OP_EQ_axis_h_l282_c372_948c_right <= VAR_BIN_OP_EQ_axis_h_l282_c372_948c_right;
     -- Outputs
     VAR_BIN_OP_EQ_axis_h_l282_c372_948c_return_output := BIN_OP_EQ_axis_h_l282_c372_948c_return_output;

     -- BIN_OP_LTE[axis_h_l282_c416_f620] LATENCY=0
     -- Inputs
     BIN_OP_LTE_axis_h_l282_c416_f620_left <= VAR_BIN_OP_LTE_axis_h_l282_c416_f620_left;
     BIN_OP_LTE_axis_h_l282_c416_f620_right <= VAR_BIN_OP_LTE_axis_h_l282_c416_f620_right;
     -- Outputs
     VAR_BIN_OP_LTE_axis_h_l282_c416_f620_return_output := BIN_OP_LTE_axis_h_l282_c416_f620_return_output;

     -- Submodule level 2
     VAR_BIN_OP_AND_axis_h_l282_c733_9b6d_left := VAR_BIN_OP_AND_axis_h_l282_c733_52f8_return_output;
     VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_cond := VAR_BIN_OP_EQ_axis_h_l282_c372_948c_return_output;
     VAR_counter_MUX_axis_h_l282_c675_cf87_cond := VAR_BIN_OP_LTE_axis_h_l282_c416_f620_return_output;
     VAR_o_MUX_axis_h_l282_c444_0fda_cond := VAR_BIN_OP_LTE_axis_h_l282_c416_f620_return_output;
     VAR_counter_axis_h_l282_c686_453c := resize(VAR_BIN_OP_PLUS_axis_h_l282_c686_1973_return_output, 16);
     VAR_counter_MUX_axis_h_l282_c675_cf87_iftrue := VAR_counter_axis_h_l282_c686_453c;
     -- counter_MUX[axis_h_l282_c675_cf87] LATENCY=0
     -- Inputs
     counter_MUX_axis_h_l282_c675_cf87_cond <= VAR_counter_MUX_axis_h_l282_c675_cf87_cond;
     counter_MUX_axis_h_l282_c675_cf87_iftrue <= VAR_counter_MUX_axis_h_l282_c675_cf87_iftrue;
     counter_MUX_axis_h_l282_c675_cf87_iffalse <= VAR_counter_MUX_axis_h_l282_c675_cf87_iffalse;
     -- Outputs
     VAR_counter_MUX_axis_h_l282_c675_cf87_return_output := counter_MUX_axis_h_l282_c675_cf87_return_output;

     -- o_MUX[axis_h_l282_c444_0fda] LATENCY=0
     -- Inputs
     o_MUX_axis_h_l282_c444_0fda_cond <= VAR_o_MUX_axis_h_l282_c444_0fda_cond;
     o_MUX_axis_h_l282_c444_0fda_iftrue <= VAR_o_MUX_axis_h_l282_c444_0fda_iftrue;
     o_MUX_axis_h_l282_c444_0fda_iffalse <= VAR_o_MUX_axis_h_l282_c444_0fda_iffalse;
     -- Outputs
     VAR_o_MUX_axis_h_l282_c444_0fda_return_output := o_MUX_axis_h_l282_c444_0fda_return_output;

     -- Submodule level 3
     VAR_counter_MUX_axis_h_l282_c628_819c_iftrue := VAR_counter_MUX_axis_h_l282_c675_cf87_return_output;
     -- o_out_stream_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_out_stream_data_tlast_d41d[axis_h_l282_c587_2162] LATENCY=0
     VAR_o_out_stream_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_out_stream_data_tlast_d41d_axis_h_l282_c587_2162_return_output := VAR_o_MUX_axis_h_l282_c444_0fda_return_output.out_stream.data.tlast;

     -- CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_out_stream_valid_d41d[axis_h_l282_c631_ef56] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_out_stream_valid_d41d_axis_h_l282_c631_ef56_return_output := VAR_o_MUX_axis_h_l282_c444_0fda_return_output.out_stream.valid;

     -- CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_ready_for_in_stream_d41d[axis_h_l282_c774_867b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_ready_for_in_stream_d41d_axis_h_l282_c774_867b_return_output := VAR_o_MUX_axis_h_l282_c444_0fda_return_output.ready_for_in_stream;

     -- Submodule level 4
     VAR_BIN_OP_AND_axis_h_l282_c631_ef36_left := VAR_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_out_stream_valid_d41d_axis_h_l282_c631_ef56_return_output;
     VAR_BIN_OP_AND_axis_h_l282_c733_9b6d_right := VAR_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_ready_for_in_stream_d41d_axis_h_l282_c774_867b_return_output;
     VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_iffalse := VAR_o_out_stream_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_out_stream_data_tlast_d41d_axis_h_l282_c587_2162_return_output;
     -- o_out_stream_data_tlast_MUX[axis_h_l282_c587_2162] LATENCY=0
     -- Inputs
     o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_cond <= VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_cond;
     o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_iftrue <= VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_iftrue;
     o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_iffalse <= VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_iffalse;
     -- Outputs
     VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_return_output := o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_return_output;

     -- BIN_OP_AND[axis_h_l282_c631_ef36] LATENCY=0
     -- Inputs
     BIN_OP_AND_axis_h_l282_c631_ef36_left <= VAR_BIN_OP_AND_axis_h_l282_c631_ef36_left;
     BIN_OP_AND_axis_h_l282_c631_ef36_right <= VAR_BIN_OP_AND_axis_h_l282_c631_ef36_right;
     -- Outputs
     VAR_BIN_OP_AND_axis_h_l282_c631_ef36_return_output := BIN_OP_AND_axis_h_l282_c631_ef36_return_output;

     -- BIN_OP_AND[axis_h_l282_c733_9b6d] LATENCY=0
     -- Inputs
     BIN_OP_AND_axis_h_l282_c733_9b6d_left <= VAR_BIN_OP_AND_axis_h_l282_c733_9b6d_left;
     BIN_OP_AND_axis_h_l282_c733_9b6d_right <= VAR_BIN_OP_AND_axis_h_l282_c733_9b6d_right;
     -- Outputs
     VAR_BIN_OP_AND_axis_h_l282_c733_9b6d_return_output := BIN_OP_AND_axis_h_l282_c733_9b6d_return_output;

     -- Submodule level 5
     VAR_counter_MUX_axis_h_l282_c628_819c_cond := VAR_BIN_OP_AND_axis_h_l282_c631_ef36_return_output;
     VAR_counter_MUX_axis_h_l282_c730_ebf0_cond := VAR_BIN_OP_AND_axis_h_l282_c733_9b6d_return_output;
     -- counter_MUX[axis_h_l282_c628_819c] LATENCY=0
     -- Inputs
     counter_MUX_axis_h_l282_c628_819c_cond <= VAR_counter_MUX_axis_h_l282_c628_819c_cond;
     counter_MUX_axis_h_l282_c628_819c_iftrue <= VAR_counter_MUX_axis_h_l282_c628_819c_iftrue;
     counter_MUX_axis_h_l282_c628_819c_iffalse <= VAR_counter_MUX_axis_h_l282_c628_819c_iffalse;
     -- Outputs
     VAR_counter_MUX_axis_h_l282_c628_819c_return_output := counter_MUX_axis_h_l282_c628_819c_return_output;

     -- CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_f6db[axis_h_l282_c820_ff13] LATENCY=0
     VAR_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_f6db_axis_h_l282_c820_ff13_return_output := CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_f6db(
     VAR_o_MUX_axis_h_l282_c444_0fda_return_output,
     VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2162_return_output);

     -- Submodule level 6
     VAR_return_output := VAR_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_f6db_axis_h_l282_c820_ff13_return_output;
     VAR_counter_MUX_axis_h_l282_c730_ebf0_iffalse := VAR_counter_MUX_axis_h_l282_c628_819c_return_output;
     -- counter_MUX[axis_h_l282_c730_ebf0] LATENCY=0
     -- Inputs
     counter_MUX_axis_h_l282_c730_ebf0_cond <= VAR_counter_MUX_axis_h_l282_c730_ebf0_cond;
     counter_MUX_axis_h_l282_c730_ebf0_iftrue <= VAR_counter_MUX_axis_h_l282_c730_ebf0_iftrue;
     counter_MUX_axis_h_l282_c730_ebf0_iffalse <= VAR_counter_MUX_axis_h_l282_c730_ebf0_iffalse;
     -- Outputs
     VAR_counter_MUX_axis_h_l282_c730_ebf0_return_output := counter_MUX_axis_h_l282_c730_ebf0_return_output;

     -- Submodule level 7
     REG_VAR_counter := VAR_counter_MUX_axis_h_l282_c730_ebf0_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_counter <= REG_VAR_counter;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if clk_en_internal='1' then
     counter <= REG_COMB_counter;
 end if;
 end if;
end process;

end arch;
