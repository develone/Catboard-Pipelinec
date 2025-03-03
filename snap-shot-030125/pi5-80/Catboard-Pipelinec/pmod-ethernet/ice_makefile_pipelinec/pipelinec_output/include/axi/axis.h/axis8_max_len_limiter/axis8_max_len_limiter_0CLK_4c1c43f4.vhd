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
-- BIN_OP_MINUS[axis_h_l282_c336_b789]
signal BIN_OP_MINUS_axis_h_l282_c336_b789_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_axis_h_l282_c336_b789_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_axis_h_l282_c336_b789_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[axis_h_l282_c372_d052]
signal BIN_OP_EQ_axis_h_l282_c372_d052_left : unsigned(15 downto 0);
signal BIN_OP_EQ_axis_h_l282_c372_d052_right : unsigned(15 downto 0);
signal BIN_OP_EQ_axis_h_l282_c372_d052_return_output : unsigned(0 downto 0);

-- BIN_OP_LTE[axis_h_l282_c416_34fa]
signal BIN_OP_LTE_axis_h_l282_c416_34fa_left : unsigned(15 downto 0);
signal BIN_OP_LTE_axis_h_l282_c416_34fa_right : unsigned(15 downto 0);
signal BIN_OP_LTE_axis_h_l282_c416_34fa_return_output : unsigned(0 downto 0);

-- o_MUX[axis_h_l282_c444_898d]
signal o_MUX_axis_h_l282_c444_898d_cond : unsigned(0 downto 0);
signal o_MUX_axis_h_l282_c444_898d_iftrue : axis8_max_len_limiter_t;
signal o_MUX_axis_h_l282_c444_898d_iffalse : axis8_max_len_limiter_t;
signal o_MUX_axis_h_l282_c444_898d_return_output : axis8_max_len_limiter_t;

-- o_out_stream_data_tlast_MUX[axis_h_l282_c587_2bd0]
signal o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_cond : unsigned(0 downto 0);
signal o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_iftrue : unsigned(0 downto 0);
signal o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_iffalse : unsigned(0 downto 0);
signal o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[axis_h_l282_c631_efee]
signal BIN_OP_AND_axis_h_l282_c631_efee_left : unsigned(0 downto 0);
signal BIN_OP_AND_axis_h_l282_c631_efee_right : unsigned(0 downto 0);
signal BIN_OP_AND_axis_h_l282_c631_efee_return_output : unsigned(0 downto 0);

-- counter_MUX[axis_h_l282_c628_4736]
signal counter_MUX_axis_h_l282_c628_4736_cond : unsigned(0 downto 0);
signal counter_MUX_axis_h_l282_c628_4736_iftrue : unsigned(15 downto 0);
signal counter_MUX_axis_h_l282_c628_4736_iffalse : unsigned(15 downto 0);
signal counter_MUX_axis_h_l282_c628_4736_return_output : unsigned(15 downto 0);

-- counter_MUX[axis_h_l282_c675_1e52]
signal counter_MUX_axis_h_l282_c675_1e52_cond : unsigned(0 downto 0);
signal counter_MUX_axis_h_l282_c675_1e52_iftrue : unsigned(15 downto 0);
signal counter_MUX_axis_h_l282_c675_1e52_iffalse : unsigned(15 downto 0);
signal counter_MUX_axis_h_l282_c675_1e52_return_output : unsigned(15 downto 0);

-- axis8_keep_count[axis_h_l282_c697_0601]
signal axis8_keep_count_axis_h_l282_c697_0601_s : axis8_t_stream_t;
signal axis8_keep_count_axis_h_l282_c697_0601_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[axis_h_l282_c686_623e]
signal BIN_OP_PLUS_axis_h_l282_c686_623e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_axis_h_l282_c686_623e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_axis_h_l282_c686_623e_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[axis_h_l282_c733_6c56]
signal BIN_OP_AND_axis_h_l282_c733_6c56_left : unsigned(0 downto 0);
signal BIN_OP_AND_axis_h_l282_c733_6c56_right : unsigned(0 downto 0);
signal BIN_OP_AND_axis_h_l282_c733_6c56_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[axis_h_l282_c733_4ce5]
signal BIN_OP_AND_axis_h_l282_c733_4ce5_left : unsigned(0 downto 0);
signal BIN_OP_AND_axis_h_l282_c733_4ce5_right : unsigned(0 downto 0);
signal BIN_OP_AND_axis_h_l282_c733_4ce5_return_output : unsigned(0 downto 0);

-- counter_MUX[axis_h_l282_c730_abea]
signal counter_MUX_axis_h_l282_c730_abea_cond : unsigned(0 downto 0);
signal counter_MUX_axis_h_l282_c730_abea_iftrue : unsigned(15 downto 0);
signal counter_MUX_axis_h_l282_c730_abea_iffalse : unsigned(15 downto 0);
signal counter_MUX_axis_h_l282_c730_abea_return_output : unsigned(15 downto 0);

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
-- BIN_OP_MINUS_axis_h_l282_c336_b789 : 0 clocks latency
BIN_OP_MINUS_axis_h_l282_c336_b789 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_axis_h_l282_c336_b789_left,
BIN_OP_MINUS_axis_h_l282_c336_b789_right,
BIN_OP_MINUS_axis_h_l282_c336_b789_return_output);

-- BIN_OP_EQ_axis_h_l282_c372_d052 : 0 clocks latency
BIN_OP_EQ_axis_h_l282_c372_d052 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_axis_h_l282_c372_d052_left,
BIN_OP_EQ_axis_h_l282_c372_d052_right,
BIN_OP_EQ_axis_h_l282_c372_d052_return_output);

-- BIN_OP_LTE_axis_h_l282_c416_34fa : 0 clocks latency
BIN_OP_LTE_axis_h_l282_c416_34fa : entity work.BIN_OP_LTE_uint16_t_uint16_t_0CLK_6f2c5aad port map (
BIN_OP_LTE_axis_h_l282_c416_34fa_left,
BIN_OP_LTE_axis_h_l282_c416_34fa_right,
BIN_OP_LTE_axis_h_l282_c416_34fa_return_output);

-- o_MUX_axis_h_l282_c444_898d : 0 clocks latency
o_MUX_axis_h_l282_c444_898d : entity work.MUX_uint1_t_axis8_max_len_limiter_t_axis8_max_len_limiter_t_0CLK_de264c78 port map (
o_MUX_axis_h_l282_c444_898d_cond,
o_MUX_axis_h_l282_c444_898d_iftrue,
o_MUX_axis_h_l282_c444_898d_iffalse,
o_MUX_axis_h_l282_c444_898d_return_output);

-- o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0 : 0 clocks latency
o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_cond,
o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_iftrue,
o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_iffalse,
o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_return_output);

-- BIN_OP_AND_axis_h_l282_c631_efee : 0 clocks latency
BIN_OP_AND_axis_h_l282_c631_efee : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_axis_h_l282_c631_efee_left,
BIN_OP_AND_axis_h_l282_c631_efee_right,
BIN_OP_AND_axis_h_l282_c631_efee_return_output);

-- counter_MUX_axis_h_l282_c628_4736 : 0 clocks latency
counter_MUX_axis_h_l282_c628_4736 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
counter_MUX_axis_h_l282_c628_4736_cond,
counter_MUX_axis_h_l282_c628_4736_iftrue,
counter_MUX_axis_h_l282_c628_4736_iffalse,
counter_MUX_axis_h_l282_c628_4736_return_output);

-- counter_MUX_axis_h_l282_c675_1e52 : 0 clocks latency
counter_MUX_axis_h_l282_c675_1e52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
counter_MUX_axis_h_l282_c675_1e52_cond,
counter_MUX_axis_h_l282_c675_1e52_iftrue,
counter_MUX_axis_h_l282_c675_1e52_iffalse,
counter_MUX_axis_h_l282_c675_1e52_return_output);

-- axis8_keep_count_axis_h_l282_c697_0601 : 0 clocks latency
axis8_keep_count_axis_h_l282_c697_0601 : entity work.axis8_keep_count_0CLK_b45f1687 port map (
axis8_keep_count_axis_h_l282_c697_0601_s,
axis8_keep_count_axis_h_l282_c697_0601_return_output);

-- BIN_OP_PLUS_axis_h_l282_c686_623e : 0 clocks latency
BIN_OP_PLUS_axis_h_l282_c686_623e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_axis_h_l282_c686_623e_left,
BIN_OP_PLUS_axis_h_l282_c686_623e_right,
BIN_OP_PLUS_axis_h_l282_c686_623e_return_output);

-- BIN_OP_AND_axis_h_l282_c733_6c56 : 0 clocks latency
BIN_OP_AND_axis_h_l282_c733_6c56 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_axis_h_l282_c733_6c56_left,
BIN_OP_AND_axis_h_l282_c733_6c56_right,
BIN_OP_AND_axis_h_l282_c733_6c56_return_output);

-- BIN_OP_AND_axis_h_l282_c733_4ce5 : 0 clocks latency
BIN_OP_AND_axis_h_l282_c733_4ce5 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_axis_h_l282_c733_4ce5_left,
BIN_OP_AND_axis_h_l282_c733_4ce5_right,
BIN_OP_AND_axis_h_l282_c733_4ce5_return_output);

-- counter_MUX_axis_h_l282_c730_abea : 0 clocks latency
counter_MUX_axis_h_l282_c730_abea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
counter_MUX_axis_h_l282_c730_abea_cond,
counter_MUX_axis_h_l282_c730_abea_iftrue,
counter_MUX_axis_h_l282_c730_abea_iffalse,
counter_MUX_axis_h_l282_c730_abea_return_output);



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
 BIN_OP_MINUS_axis_h_l282_c336_b789_return_output,
 BIN_OP_EQ_axis_h_l282_c372_d052_return_output,
 BIN_OP_LTE_axis_h_l282_c416_34fa_return_output,
 o_MUX_axis_h_l282_c444_898d_return_output,
 o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_return_output,
 BIN_OP_AND_axis_h_l282_c631_efee_return_output,
 counter_MUX_axis_h_l282_c628_4736_return_output,
 counter_MUX_axis_h_l282_c675_1e52_return_output,
 axis8_keep_count_axis_h_l282_c697_0601_return_output,
 BIN_OP_PLUS_axis_h_l282_c686_623e_return_output,
 BIN_OP_AND_axis_h_l282_c733_6c56_return_output,
 BIN_OP_AND_axis_h_l282_c733_4ce5_return_output,
 counter_MUX_axis_h_l282_c730_abea_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : axis8_max_len_limiter_t;
 variable VAR_max_byte_len : unsigned(15 downto 0);
 variable VAR_in_stream : axis8_t_stream_t;
 variable VAR_ready_for_out_stream : unsigned(0 downto 0);
 variable VAR_o : axis8_max_len_limiter_t;
 variable VAR_last_word_limit : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_axis_h_l282_c336_b789_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_axis_h_l282_c336_b789_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_axis_h_l282_c336_b789_return_output : unsigned(15 downto 0);
 variable VAR_last : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_axis_h_l282_c372_d052_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_axis_h_l282_c372_d052_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_axis_h_l282_c372_d052_return_output : unsigned(0 downto 0);
 variable VAR_below : unsigned(0 downto 0);
 variable VAR_BIN_OP_LTE_axis_h_l282_c416_34fa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LTE_axis_h_l282_c416_34fa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LTE_axis_h_l282_c416_34fa_return_output : unsigned(0 downto 0);
 variable VAR_o_MUX_axis_h_l282_c444_898d_iftrue : axis8_max_len_limiter_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_8353_axis_h_l282_c444_898d_return_output : axis8_max_len_limiter_t;
 variable VAR_o_MUX_axis_h_l282_c444_898d_iffalse : axis8_max_len_limiter_t;
 variable VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_fbb8_axis_h_l282_c444_898d_return_output : axis8_max_len_limiter_t;
 variable VAR_o_MUX_axis_h_l282_c444_898d_return_output : axis8_max_len_limiter_t;
 variable VAR_o_MUX_axis_h_l282_c444_898d_cond : unsigned(0 downto 0);
 variable VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_iftrue : unsigned(0 downto 0);
 variable VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_iffalse : unsigned(0 downto 0);
 variable VAR_o_out_stream_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_out_stream_data_tlast_d41d_axis_h_l282_c587_2bd0_return_output : unsigned(0 downto 0);
 variable VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_return_output : unsigned(0 downto 0);
 variable VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_out_stream_valid_d41d_axis_h_l282_c631_0347_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_axis_h_l282_c631_efee_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_axis_h_l282_c631_efee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_axis_h_l282_c631_efee_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c628_4736_iftrue : unsigned(15 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c675_1e52_return_output : unsigned(15 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c628_4736_iffalse : unsigned(15 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c628_4736_return_output : unsigned(15 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c628_4736_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c675_1e52_iftrue : unsigned(15 downto 0);
 variable VAR_counter_axis_h_l282_c686_acff : unsigned(15 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c675_1e52_iffalse : unsigned(15 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c675_1e52_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_axis_h_l282_c686_623e_left : unsigned(15 downto 0);
 variable VAR_axis8_keep_count_axis_h_l282_c697_0601_s : axis8_t_stream_t;
 variable VAR_BIN_OP_PLUS_axis_h_l282_c686_623e_right : unsigned(0 downto 0);
 variable VAR_axis8_keep_count_axis_h_l282_c697_0601_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_axis_h_l282_c686_623e_return_output : unsigned(16 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_axis_h_l282_c733_8068_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_axis_h_l282_c733_6c56_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_axis_h_l282_c756_fecd_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_axis_h_l282_c733_6c56_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_axis_h_l282_c733_6c56_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_axis_h_l282_c733_4ce5_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_ready_for_in_stream_d41d_axis_h_l282_c774_91b2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_axis_h_l282_c733_4ce5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_axis_h_l282_c733_4ce5_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c730_abea_iftrue : unsigned(15 downto 0);
 variable VAR_counter_axis_h_l282_c798_9990 : unsigned(15 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c730_abea_iffalse : unsigned(15 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c730_abea_return_output : unsigned(15 downto 0);
 variable VAR_counter_MUX_axis_h_l282_c730_abea_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_f6db_axis_h_l282_c820_7626_return_output : axis8_max_len_limiter_t;
 -- State registers comb logic variables
variable REG_VAR_counter : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_counter := counter;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_MINUS_axis_h_l282_c336_b789_right := to_unsigned(1, 1);
     VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_iftrue := to_unsigned(1, 1);
     VAR_counter_axis_h_l282_c798_9990 := resize(to_unsigned(0, 1), 16);
     VAR_counter_MUX_axis_h_l282_c730_abea_iftrue := VAR_counter_axis_h_l282_c798_9990;
     -- o_FALSE_INPUT_MUX_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_fbb8[axis_h_l282_c444_898d] LATENCY=0
     VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_fbb8_axis_h_l282_c444_898d_return_output := CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_fbb8(
     axis8_max_len_limiter_t_NULL,
     to_unsigned(0, 1),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_o_MUX_axis_h_l282_c444_898d_iffalse := VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_fbb8_axis_h_l282_c444_898d_return_output;

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
     VAR_BIN_OP_EQ_axis_h_l282_c372_d052_left := counter;
     VAR_BIN_OP_LTE_axis_h_l282_c416_34fa_left := counter;
     VAR_BIN_OP_PLUS_axis_h_l282_c686_623e_left := counter;
     VAR_counter_MUX_axis_h_l282_c628_4736_iffalse := counter;
     VAR_counter_MUX_axis_h_l282_c675_1e52_iffalse := counter;
     VAR_axis8_keep_count_axis_h_l282_c697_0601_s := VAR_in_stream;
     VAR_BIN_OP_MINUS_axis_h_l282_c336_b789_left := VAR_max_byte_len;
     VAR_BIN_OP_AND_axis_h_l282_c631_efee_right := VAR_ready_for_out_stream;
     -- o_TRUE_INPUT_MUX_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_8353[axis_h_l282_c444_898d] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_8353_axis_h_l282_c444_898d_return_output := CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_8353(
     VAR_in_stream,
     VAR_ready_for_out_stream);

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d[axis_h_l282_c733_8068] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_axis_h_l282_c733_8068_return_output := VAR_in_stream.data.tlast;

     -- axis8_keep_count[axis_h_l282_c697_0601] LATENCY=0
     -- Inputs
     axis8_keep_count_axis_h_l282_c697_0601_s <= VAR_axis8_keep_count_axis_h_l282_c697_0601_s;
     -- Outputs
     VAR_axis8_keep_count_axis_h_l282_c697_0601_return_output := axis8_keep_count_axis_h_l282_c697_0601_return_output;

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d[axis_h_l282_c756_fecd] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_axis_h_l282_c756_fecd_return_output := VAR_in_stream.valid;

     -- BIN_OP_MINUS[axis_h_l282_c336_b789] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_axis_h_l282_c336_b789_left <= VAR_BIN_OP_MINUS_axis_h_l282_c336_b789_left;
     BIN_OP_MINUS_axis_h_l282_c336_b789_right <= VAR_BIN_OP_MINUS_axis_h_l282_c336_b789_right;
     -- Outputs
     VAR_BIN_OP_MINUS_axis_h_l282_c336_b789_return_output := BIN_OP_MINUS_axis_h_l282_c336_b789_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_axis_h_l282_c372_d052_right := VAR_BIN_OP_MINUS_axis_h_l282_c336_b789_return_output;
     VAR_BIN_OP_LTE_axis_h_l282_c416_34fa_right := VAR_BIN_OP_MINUS_axis_h_l282_c336_b789_return_output;
     VAR_BIN_OP_AND_axis_h_l282_c733_6c56_left := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_axis_h_l282_c733_8068_return_output;
     VAR_BIN_OP_AND_axis_h_l282_c733_6c56_right := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_axis_h_l282_c756_fecd_return_output;
     VAR_BIN_OP_PLUS_axis_h_l282_c686_623e_right := VAR_axis8_keep_count_axis_h_l282_c697_0601_return_output;
     VAR_o_MUX_axis_h_l282_c444_898d_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_8353_axis_h_l282_c444_898d_return_output;
     -- BIN_OP_PLUS[axis_h_l282_c686_623e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_axis_h_l282_c686_623e_left <= VAR_BIN_OP_PLUS_axis_h_l282_c686_623e_left;
     BIN_OP_PLUS_axis_h_l282_c686_623e_right <= VAR_BIN_OP_PLUS_axis_h_l282_c686_623e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_axis_h_l282_c686_623e_return_output := BIN_OP_PLUS_axis_h_l282_c686_623e_return_output;

     -- BIN_OP_LTE[axis_h_l282_c416_34fa] LATENCY=0
     -- Inputs
     BIN_OP_LTE_axis_h_l282_c416_34fa_left <= VAR_BIN_OP_LTE_axis_h_l282_c416_34fa_left;
     BIN_OP_LTE_axis_h_l282_c416_34fa_right <= VAR_BIN_OP_LTE_axis_h_l282_c416_34fa_right;
     -- Outputs
     VAR_BIN_OP_LTE_axis_h_l282_c416_34fa_return_output := BIN_OP_LTE_axis_h_l282_c416_34fa_return_output;

     -- BIN_OP_EQ[axis_h_l282_c372_d052] LATENCY=0
     -- Inputs
     BIN_OP_EQ_axis_h_l282_c372_d052_left <= VAR_BIN_OP_EQ_axis_h_l282_c372_d052_left;
     BIN_OP_EQ_axis_h_l282_c372_d052_right <= VAR_BIN_OP_EQ_axis_h_l282_c372_d052_right;
     -- Outputs
     VAR_BIN_OP_EQ_axis_h_l282_c372_d052_return_output := BIN_OP_EQ_axis_h_l282_c372_d052_return_output;

     -- BIN_OP_AND[axis_h_l282_c733_6c56] LATENCY=0
     -- Inputs
     BIN_OP_AND_axis_h_l282_c733_6c56_left <= VAR_BIN_OP_AND_axis_h_l282_c733_6c56_left;
     BIN_OP_AND_axis_h_l282_c733_6c56_right <= VAR_BIN_OP_AND_axis_h_l282_c733_6c56_right;
     -- Outputs
     VAR_BIN_OP_AND_axis_h_l282_c733_6c56_return_output := BIN_OP_AND_axis_h_l282_c733_6c56_return_output;

     -- Submodule level 2
     VAR_BIN_OP_AND_axis_h_l282_c733_4ce5_left := VAR_BIN_OP_AND_axis_h_l282_c733_6c56_return_output;
     VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_cond := VAR_BIN_OP_EQ_axis_h_l282_c372_d052_return_output;
     VAR_counter_MUX_axis_h_l282_c675_1e52_cond := VAR_BIN_OP_LTE_axis_h_l282_c416_34fa_return_output;
     VAR_o_MUX_axis_h_l282_c444_898d_cond := VAR_BIN_OP_LTE_axis_h_l282_c416_34fa_return_output;
     VAR_counter_axis_h_l282_c686_acff := resize(VAR_BIN_OP_PLUS_axis_h_l282_c686_623e_return_output, 16);
     VAR_counter_MUX_axis_h_l282_c675_1e52_iftrue := VAR_counter_axis_h_l282_c686_acff;
     -- o_MUX[axis_h_l282_c444_898d] LATENCY=0
     -- Inputs
     o_MUX_axis_h_l282_c444_898d_cond <= VAR_o_MUX_axis_h_l282_c444_898d_cond;
     o_MUX_axis_h_l282_c444_898d_iftrue <= VAR_o_MUX_axis_h_l282_c444_898d_iftrue;
     o_MUX_axis_h_l282_c444_898d_iffalse <= VAR_o_MUX_axis_h_l282_c444_898d_iffalse;
     -- Outputs
     VAR_o_MUX_axis_h_l282_c444_898d_return_output := o_MUX_axis_h_l282_c444_898d_return_output;

     -- counter_MUX[axis_h_l282_c675_1e52] LATENCY=0
     -- Inputs
     counter_MUX_axis_h_l282_c675_1e52_cond <= VAR_counter_MUX_axis_h_l282_c675_1e52_cond;
     counter_MUX_axis_h_l282_c675_1e52_iftrue <= VAR_counter_MUX_axis_h_l282_c675_1e52_iftrue;
     counter_MUX_axis_h_l282_c675_1e52_iffalse <= VAR_counter_MUX_axis_h_l282_c675_1e52_iffalse;
     -- Outputs
     VAR_counter_MUX_axis_h_l282_c675_1e52_return_output := counter_MUX_axis_h_l282_c675_1e52_return_output;

     -- Submodule level 3
     VAR_counter_MUX_axis_h_l282_c628_4736_iftrue := VAR_counter_MUX_axis_h_l282_c675_1e52_return_output;
     -- CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_ready_for_in_stream_d41d[axis_h_l282_c774_91b2] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_ready_for_in_stream_d41d_axis_h_l282_c774_91b2_return_output := VAR_o_MUX_axis_h_l282_c444_898d_return_output.ready_for_in_stream;

     -- o_out_stream_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_out_stream_data_tlast_d41d[axis_h_l282_c587_2bd0] LATENCY=0
     VAR_o_out_stream_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_out_stream_data_tlast_d41d_axis_h_l282_c587_2bd0_return_output := VAR_o_MUX_axis_h_l282_c444_898d_return_output.out_stream.data.tlast;

     -- CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_out_stream_valid_d41d[axis_h_l282_c631_0347] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_out_stream_valid_d41d_axis_h_l282_c631_0347_return_output := VAR_o_MUX_axis_h_l282_c444_898d_return_output.out_stream.valid;

     -- Submodule level 4
     VAR_BIN_OP_AND_axis_h_l282_c631_efee_left := VAR_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_out_stream_valid_d41d_axis_h_l282_c631_0347_return_output;
     VAR_BIN_OP_AND_axis_h_l282_c733_4ce5_right := VAR_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_ready_for_in_stream_d41d_axis_h_l282_c774_91b2_return_output;
     VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_iffalse := VAR_o_out_stream_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_out_stream_data_tlast_d41d_axis_h_l282_c587_2bd0_return_output;
     -- BIN_OP_AND[axis_h_l282_c631_efee] LATENCY=0
     -- Inputs
     BIN_OP_AND_axis_h_l282_c631_efee_left <= VAR_BIN_OP_AND_axis_h_l282_c631_efee_left;
     BIN_OP_AND_axis_h_l282_c631_efee_right <= VAR_BIN_OP_AND_axis_h_l282_c631_efee_right;
     -- Outputs
     VAR_BIN_OP_AND_axis_h_l282_c631_efee_return_output := BIN_OP_AND_axis_h_l282_c631_efee_return_output;

     -- o_out_stream_data_tlast_MUX[axis_h_l282_c587_2bd0] LATENCY=0
     -- Inputs
     o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_cond <= VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_cond;
     o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_iftrue <= VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_iftrue;
     o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_iffalse <= VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_iffalse;
     -- Outputs
     VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_return_output := o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_return_output;

     -- BIN_OP_AND[axis_h_l282_c733_4ce5] LATENCY=0
     -- Inputs
     BIN_OP_AND_axis_h_l282_c733_4ce5_left <= VAR_BIN_OP_AND_axis_h_l282_c733_4ce5_left;
     BIN_OP_AND_axis_h_l282_c733_4ce5_right <= VAR_BIN_OP_AND_axis_h_l282_c733_4ce5_right;
     -- Outputs
     VAR_BIN_OP_AND_axis_h_l282_c733_4ce5_return_output := BIN_OP_AND_axis_h_l282_c733_4ce5_return_output;

     -- Submodule level 5
     VAR_counter_MUX_axis_h_l282_c628_4736_cond := VAR_BIN_OP_AND_axis_h_l282_c631_efee_return_output;
     VAR_counter_MUX_axis_h_l282_c730_abea_cond := VAR_BIN_OP_AND_axis_h_l282_c733_4ce5_return_output;
     -- counter_MUX[axis_h_l282_c628_4736] LATENCY=0
     -- Inputs
     counter_MUX_axis_h_l282_c628_4736_cond <= VAR_counter_MUX_axis_h_l282_c628_4736_cond;
     counter_MUX_axis_h_l282_c628_4736_iftrue <= VAR_counter_MUX_axis_h_l282_c628_4736_iftrue;
     counter_MUX_axis_h_l282_c628_4736_iffalse <= VAR_counter_MUX_axis_h_l282_c628_4736_iffalse;
     -- Outputs
     VAR_counter_MUX_axis_h_l282_c628_4736_return_output := counter_MUX_axis_h_l282_c628_4736_return_output;

     -- CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_f6db[axis_h_l282_c820_7626] LATENCY=0
     VAR_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_f6db_axis_h_l282_c820_7626_return_output := CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_f6db(
     VAR_o_MUX_axis_h_l282_c444_898d_return_output,
     VAR_o_out_stream_data_tlast_MUX_axis_h_l282_c587_2bd0_return_output);

     -- Submodule level 6
     VAR_return_output := VAR_CONST_REF_RD_axis8_max_len_limiter_t_axis8_max_len_limiter_t_f6db_axis_h_l282_c820_7626_return_output;
     VAR_counter_MUX_axis_h_l282_c730_abea_iffalse := VAR_counter_MUX_axis_h_l282_c628_4736_return_output;
     -- counter_MUX[axis_h_l282_c730_abea] LATENCY=0
     -- Inputs
     counter_MUX_axis_h_l282_c730_abea_cond <= VAR_counter_MUX_axis_h_l282_c730_abea_cond;
     counter_MUX_axis_h_l282_c730_abea_iftrue <= VAR_counter_MUX_axis_h_l282_c730_abea_iftrue;
     counter_MUX_axis_h_l282_c730_abea_iffalse <= VAR_counter_MUX_axis_h_l282_c730_abea_iffalse;
     -- Outputs
     VAR_counter_MUX_axis_h_l282_c730_abea_return_output := counter_MUX_axis_h_l282_c730_abea_return_output;

     -- Submodule level 7
     REG_VAR_counter := VAR_counter_MUX_axis_h_l282_c730_abea_return_output;
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
