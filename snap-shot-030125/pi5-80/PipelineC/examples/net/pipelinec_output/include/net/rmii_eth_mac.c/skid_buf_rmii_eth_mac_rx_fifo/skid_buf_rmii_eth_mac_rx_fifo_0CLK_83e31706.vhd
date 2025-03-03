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
-- Submodules: 19
entity skid_buf_rmii_eth_mac_rx_fifo_0CLK_83e31706 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stream_in : in axis8_t_stream_t;
 ready_for_stream_out : in unsigned(0 downto 0);
 return_output : out skid_buf_rmii_eth_mac_rx_fifo_t);
end skid_buf_rmii_eth_mac_rx_fifo_0CLK_83e31706;
architecture arch of skid_buf_rmii_eth_mac_rx_fifo_0CLK_83e31706 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal buff : axis8_t_stream_t := axis8_t_stream_t_NULL;
signal skid_buff : axis8_t_stream_t := axis8_t_stream_t_NULL;
signal output_is_skid_buff : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_buff : axis8_t_stream_t;
signal REG_COMB_skid_buff : axis8_t_stream_t;
signal REG_COMB_output_is_skid_buff : unsigned(0 downto 0);

-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Each function instance gets signals
-- o_MUX[rmii_eth_mac_c_l9_c681_8d17]
signal o_MUX_rmii_eth_mac_c_l9_c681_8d17_cond : unsigned(0 downto 0);
signal o_MUX_rmii_eth_mac_c_l9_c681_8d17_iftrue : skid_buf_rmii_eth_mac_rx_fifo_t;
signal o_MUX_rmii_eth_mac_c_l9_c681_8d17_iffalse : skid_buf_rmii_eth_mac_rx_fifo_t;
signal o_MUX_rmii_eth_mac_c_l9_c681_8d17_return_output : skid_buf_rmii_eth_mac_rx_fifo_t;

-- UNARY_OP_NOT[rmii_eth_mac_c_l9_c757_9418]
signal UNARY_OP_NOT_rmii_eth_mac_c_l9_c757_9418_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_rmii_eth_mac_c_l9_c757_9418_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[rmii_eth_mac_c_l9_c822_dad5]
signal UNARY_OP_NOT_rmii_eth_mac_c_l9_c822_dad5_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_rmii_eth_mac_c_l9_c822_dad5_return_output : unsigned(0 downto 0);

-- buff_MUX[rmii_eth_mac_c_l9_c841_22eb]
signal buff_MUX_rmii_eth_mac_c_l9_c841_22eb_cond : unsigned(0 downto 0);
signal buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iftrue : axis8_t_stream_t;
signal buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iffalse : axis8_t_stream_t;
signal buff_MUX_rmii_eth_mac_c_l9_c841_22eb_return_output : axis8_t_stream_t;

-- skid_buff_MUX[rmii_eth_mac_c_l9_c841_22eb]
signal skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_cond : unsigned(0 downto 0);
signal skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iftrue : axis8_t_stream_t;
signal skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iffalse : axis8_t_stream_t;
signal skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_return_output : axis8_t_stream_t;

-- buff_MUX[rmii_eth_mac_c_l9_c868_2768]
signal buff_MUX_rmii_eth_mac_c_l9_c868_2768_cond : unsigned(0 downto 0);
signal buff_MUX_rmii_eth_mac_c_l9_c868_2768_iftrue : axis8_t_stream_t;
signal buff_MUX_rmii_eth_mac_c_l9_c868_2768_iffalse : axis8_t_stream_t;
signal buff_MUX_rmii_eth_mac_c_l9_c868_2768_return_output : axis8_t_stream_t;

-- skid_buff_MUX[rmii_eth_mac_c_l9_c868_2768]
signal skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_cond : unsigned(0 downto 0);
signal skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_iftrue : axis8_t_stream_t;
signal skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_iffalse : axis8_t_stream_t;
signal skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_return_output : axis8_t_stream_t;

-- UNARY_OP_NOT[rmii_eth_mac_c_l9_c949_2309]
signal UNARY_OP_NOT_rmii_eth_mac_c_l9_c949_2309_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_rmii_eth_mac_c_l9_c949_2309_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[rmii_eth_mac_c_l9_c949_f243]
signal BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243_left : unsigned(0 downto 0);
signal BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243_right : unsigned(0 downto 0);
signal BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243_return_output : unsigned(0 downto 0);

-- output_is_skid_buff_MUX[rmii_eth_mac_c_l9_c945_9ea8]
signal output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_cond : unsigned(0 downto 0);
signal output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_iftrue : unsigned(0 downto 0);
signal output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_iffalse : unsigned(0 downto 0);
signal output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_return_output : unsigned(0 downto 0);

-- buff_valid_MUX[rmii_eth_mac_c_l9_c945_9ea8]
signal buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_cond : unsigned(0 downto 0);
signal buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iftrue : unsigned(0 downto 0);
signal buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iffalse : unsigned(0 downto 0);
signal buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_return_output : unsigned(0 downto 0);

-- skid_buff_valid_MUX[rmii_eth_mac_c_l9_c945_9ea8]
signal skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_cond : unsigned(0 downto 0);
signal skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iftrue : unsigned(0 downto 0);
signal skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iffalse : unsigned(0 downto 0);
signal skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_return_output : unsigned(0 downto 0);

-- buff_valid_MUX[rmii_eth_mac_c_l9_c993_5c14]
signal buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_cond : unsigned(0 downto 0);
signal buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iftrue : unsigned(0 downto 0);
signal buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iffalse : unsigned(0 downto 0);
signal buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_return_output : unsigned(0 downto 0);

-- skid_buff_valid_MUX[rmii_eth_mac_c_l9_c993_5c14]
signal skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_cond : unsigned(0 downto 0);
signal skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iftrue : unsigned(0 downto 0);
signal skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iffalse : unsigned(0 downto 0);
signal skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[rmii_eth_mac_c_l9_c1087_9bb1]
signal UNARY_OP_NOT_rmii_eth_mac_c_l9_c1087_9bb1_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_rmii_eth_mac_c_l9_c1087_9bb1_return_output : unsigned(0 downto 0);

function CONST_REF_RD_skid_buf_rmii_eth_mac_rx_fifo_t_skid_buf_rmii_eth_mac_rx_fifo_t_69f3( ref_toks_0 : axis8_t_stream_t;
 ref_toks_1 : unsigned) return skid_buf_rmii_eth_mac_rx_fifo_t is
 
  variable base : skid_buf_rmii_eth_mac_rx_fifo_t; 
  variable return_output : skid_buf_rmii_eth_mac_rx_fifo_t;
begin
      base.stream_out := ref_toks_0;
      base.ready_for_stream_in := ref_toks_1;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_2dee( ref_toks_0 : axis8_t_stream_t;
 ref_toks_1 : unsigned) return axis8_t_stream_t is
 
  variable base : axis8_t_stream_t; 
  variable return_output : axis8_t_stream_t;
begin
      base := ref_toks_0;
      base.valid := ref_toks_1;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- o_MUX_rmii_eth_mac_c_l9_c681_8d17 : 0 clocks latency
o_MUX_rmii_eth_mac_c_l9_c681_8d17 : entity work.MUX_uint1_t_skid_buf_rmii_eth_mac_rx_fifo_t_skid_buf_rmii_eth_mac_rx_fifo_t_0CLK_de264c78 port map (
o_MUX_rmii_eth_mac_c_l9_c681_8d17_cond,
o_MUX_rmii_eth_mac_c_l9_c681_8d17_iftrue,
o_MUX_rmii_eth_mac_c_l9_c681_8d17_iffalse,
o_MUX_rmii_eth_mac_c_l9_c681_8d17_return_output);

-- UNARY_OP_NOT_rmii_eth_mac_c_l9_c757_9418 : 0 clocks latency
UNARY_OP_NOT_rmii_eth_mac_c_l9_c757_9418 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_rmii_eth_mac_c_l9_c757_9418_expr,
UNARY_OP_NOT_rmii_eth_mac_c_l9_c757_9418_return_output);

-- UNARY_OP_NOT_rmii_eth_mac_c_l9_c822_dad5 : 0 clocks latency
UNARY_OP_NOT_rmii_eth_mac_c_l9_c822_dad5 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_rmii_eth_mac_c_l9_c822_dad5_expr,
UNARY_OP_NOT_rmii_eth_mac_c_l9_c822_dad5_return_output);

-- buff_MUX_rmii_eth_mac_c_l9_c841_22eb : 0 clocks latency
buff_MUX_rmii_eth_mac_c_l9_c841_22eb : entity work.MUX_uint1_t_axis8_t_stream_t_axis8_t_stream_t_0CLK_de264c78 port map (
buff_MUX_rmii_eth_mac_c_l9_c841_22eb_cond,
buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iftrue,
buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iffalse,
buff_MUX_rmii_eth_mac_c_l9_c841_22eb_return_output);

-- skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb : 0 clocks latency
skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb : entity work.MUX_uint1_t_axis8_t_stream_t_axis8_t_stream_t_0CLK_de264c78 port map (
skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_cond,
skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iftrue,
skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iffalse,
skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_return_output);

-- buff_MUX_rmii_eth_mac_c_l9_c868_2768 : 0 clocks latency
buff_MUX_rmii_eth_mac_c_l9_c868_2768 : entity work.MUX_uint1_t_axis8_t_stream_t_axis8_t_stream_t_0CLK_de264c78 port map (
buff_MUX_rmii_eth_mac_c_l9_c868_2768_cond,
buff_MUX_rmii_eth_mac_c_l9_c868_2768_iftrue,
buff_MUX_rmii_eth_mac_c_l9_c868_2768_iffalse,
buff_MUX_rmii_eth_mac_c_l9_c868_2768_return_output);

-- skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768 : 0 clocks latency
skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768 : entity work.MUX_uint1_t_axis8_t_stream_t_axis8_t_stream_t_0CLK_de264c78 port map (
skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_cond,
skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_iftrue,
skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_iffalse,
skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_return_output);

-- UNARY_OP_NOT_rmii_eth_mac_c_l9_c949_2309 : 0 clocks latency
UNARY_OP_NOT_rmii_eth_mac_c_l9_c949_2309 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_rmii_eth_mac_c_l9_c949_2309_expr,
UNARY_OP_NOT_rmii_eth_mac_c_l9_c949_2309_return_output);

-- BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243 : 0 clocks latency
BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243_left,
BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243_right,
BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243_return_output);

-- output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8 : 0 clocks latency
output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_cond,
output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_iftrue,
output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_iffalse,
output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_return_output);

-- buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8 : 0 clocks latency
buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_cond,
buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iftrue,
buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iffalse,
buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_return_output);

-- skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8 : 0 clocks latency
skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_cond,
skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iftrue,
skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iffalse,
skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_return_output);

-- buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14 : 0 clocks latency
buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_cond,
buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iftrue,
buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iffalse,
buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_return_output);

-- skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14 : 0 clocks latency
skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_cond,
skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iftrue,
skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iffalse,
skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_return_output);

-- UNARY_OP_NOT_rmii_eth_mac_c_l9_c1087_9bb1 : 0 clocks latency
UNARY_OP_NOT_rmii_eth_mac_c_l9_c1087_9bb1 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_rmii_eth_mac_c_l9_c1087_9bb1_expr,
UNARY_OP_NOT_rmii_eth_mac_c_l9_c1087_9bb1_return_output);



-- Resolve what clock enable to use for user logic
clk_en_internal <= CLOCK_ENABLE(0);
-- Combinatorial process for pipeline stages
process (
CLOCK_ENABLE,
clk_en_internal,
 -- Inputs
 stream_in,
 ready_for_stream_out,
 -- Registers
 buff,
 skid_buff,
 output_is_skid_buff,
 -- All submodule outputs
 o_MUX_rmii_eth_mac_c_l9_c681_8d17_return_output,
 UNARY_OP_NOT_rmii_eth_mac_c_l9_c757_9418_return_output,
 UNARY_OP_NOT_rmii_eth_mac_c_l9_c822_dad5_return_output,
 buff_MUX_rmii_eth_mac_c_l9_c841_22eb_return_output,
 skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_return_output,
 buff_MUX_rmii_eth_mac_c_l9_c868_2768_return_output,
 skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_return_output,
 UNARY_OP_NOT_rmii_eth_mac_c_l9_c949_2309_return_output,
 BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243_return_output,
 output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_return_output,
 buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_return_output,
 skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_return_output,
 buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_return_output,
 skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_return_output,
 UNARY_OP_NOT_rmii_eth_mac_c_l9_c1087_9bb1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : skid_buf_rmii_eth_mac_rx_fifo_t;
 variable VAR_stream_in : axis8_t_stream_t;
 variable VAR_ready_for_stream_out : unsigned(0 downto 0);
 variable VAR_o : skid_buf_rmii_eth_mac_rx_fifo_t;
 variable VAR_o_MUX_rmii_eth_mac_c_l9_c681_8d17_iftrue : skid_buf_rmii_eth_mac_rx_fifo_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_skid_buf_rmii_eth_mac_rx_fifo_t_skid_buf_rmii_eth_mac_rx_fifo_t_69f3_rmii_eth_mac_c_l9_c681_8d17_return_output : skid_buf_rmii_eth_mac_rx_fifo_t;
 variable VAR_o_MUX_rmii_eth_mac_c_l9_c681_8d17_iffalse : skid_buf_rmii_eth_mac_rx_fifo_t;
 variable VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_skid_buf_rmii_eth_mac_rx_fifo_t_skid_buf_rmii_eth_mac_rx_fifo_t_69f3_rmii_eth_mac_c_l9_c681_8d17_return_output : skid_buf_rmii_eth_mac_rx_fifo_t;
 variable VAR_o_MUX_rmii_eth_mac_c_l9_c681_8d17_return_output : skid_buf_rmii_eth_mac_rx_fifo_t;
 variable VAR_o_MUX_rmii_eth_mac_c_l9_c681_8d17_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l9_c757_ce38_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c757_9418_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c757_9418_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l9_c822_3ba5_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c822_dad5_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c822_dad5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_skid_buf_rmii_eth_mac_rx_fifo_t_ready_for_stream_in_d41d_rmii_eth_mac_c_l9_c844_3460_return_output : unsigned(0 downto 0);
 variable VAR_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iftrue : axis8_t_stream_t;
 variable VAR_buff_MUX_rmii_eth_mac_c_l9_c868_2768_return_output : axis8_t_stream_t;
 variable VAR_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iffalse : axis8_t_stream_t;
 variable VAR_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_return_output : axis8_t_stream_t;
 variable VAR_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_cond : unsigned(0 downto 0);
 variable VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iftrue : axis8_t_stream_t;
 variable VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_return_output : axis8_t_stream_t;
 variable VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iffalse : axis8_t_stream_t;
 variable VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_return_output : axis8_t_stream_t;
 variable VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_cond : unsigned(0 downto 0);
 variable VAR_buff_MUX_rmii_eth_mac_c_l9_c868_2768_iftrue : axis8_t_stream_t;
 variable VAR_buff_MUX_rmii_eth_mac_c_l9_c868_2768_iffalse : axis8_t_stream_t;
 variable VAR_buff_MUX_rmii_eth_mac_c_l9_c868_2768_cond : unsigned(0 downto 0);
 variable VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_iftrue : axis8_t_stream_t;
 variable VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_iffalse : axis8_t_stream_t;
 variable VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_skid_buf_rmii_eth_mac_rx_fifo_t_stream_out_valid_d41d_rmii_eth_mac_c_l9_c949_b7a3_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c949_2309_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c949_2309_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243_return_output : unsigned(0 downto 0);
 variable VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_iftrue : unsigned(0 downto 0);
 variable VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_iffalse : unsigned(0 downto 0);
 variable VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_return_output : unsigned(0 downto 0);
 variable VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_cond : unsigned(0 downto 0);
 variable VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iftrue : unsigned(0 downto 0);
 variable VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_return_output : unsigned(0 downto 0);
 variable VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iffalse : unsigned(0 downto 0);
 variable VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_return_output : unsigned(0 downto 0);
 variable VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_cond : unsigned(0 downto 0);
 variable VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iftrue : unsigned(0 downto 0);
 variable VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_return_output : unsigned(0 downto 0);
 variable VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iffalse : unsigned(0 downto 0);
 variable VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_return_output : unsigned(0 downto 0);
 variable VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_cond : unsigned(0 downto 0);
 variable VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iftrue : unsigned(0 downto 0);
 variable VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iffalse : unsigned(0 downto 0);
 variable VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_cond : unsigned(0 downto 0);
 variable VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iftrue : unsigned(0 downto 0);
 variable VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iffalse : unsigned(0 downto 0);
 variable VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c1087_9bb1_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c1087_9bb1_return_output : unsigned(0 downto 0);
 variable VAR_buff_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_2dee_rmii_eth_mac_c_l9_c455_a625_return_output : axis8_t_stream_t;
 variable VAR_skid_buff_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_2dee_rmii_eth_mac_c_l9_c455_a625_return_output : axis8_t_stream_t;
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l9_DUPLICATE_9970_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l9_DUPLICATE_cbf8_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_buff : axis8_t_stream_t;
variable REG_VAR_skid_buff : axis8_t_stream_t;
variable REG_VAR_output_is_skid_buff : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_buff := buff;
  REG_VAR_skid_buff := skid_buff;
  REG_VAR_output_is_skid_buff := output_is_skid_buff;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iftrue := to_unsigned(0, 1);
     VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;
     -- Mux in inputs
     VAR_stream_in := stream_in;
     VAR_ready_for_stream_out := ready_for_stream_out;

     -- Submodule level 0
     VAR_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iffalse := buff;
     VAR_buff_MUX_rmii_eth_mac_c_l9_c868_2768_iffalse := buff;
     VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c1087_9bb1_expr := output_is_skid_buff;
     VAR_buff_MUX_rmii_eth_mac_c_l9_c868_2768_cond := output_is_skid_buff;
     VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_cond := output_is_skid_buff;
     VAR_o_MUX_rmii_eth_mac_c_l9_c681_8d17_cond := output_is_skid_buff;
     VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_iffalse := output_is_skid_buff;
     VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_cond := output_is_skid_buff;
     VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_cond := output_is_skid_buff;
     VAR_BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243_right := VAR_ready_for_stream_out;
     VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iffalse := skid_buff;
     VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_iftrue := skid_buff;
     VAR_buff_MUX_rmii_eth_mac_c_l9_c868_2768_iftrue := VAR_stream_in;
     VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_iffalse := VAR_stream_in;
     -- buff_MUX[rmii_eth_mac_c_l9_c868_2768] LATENCY=0
     -- Inputs
     buff_MUX_rmii_eth_mac_c_l9_c868_2768_cond <= VAR_buff_MUX_rmii_eth_mac_c_l9_c868_2768_cond;
     buff_MUX_rmii_eth_mac_c_l9_c868_2768_iftrue <= VAR_buff_MUX_rmii_eth_mac_c_l9_c868_2768_iftrue;
     buff_MUX_rmii_eth_mac_c_l9_c868_2768_iffalse <= VAR_buff_MUX_rmii_eth_mac_c_l9_c868_2768_iffalse;
     -- Outputs
     VAR_buff_MUX_rmii_eth_mac_c_l9_c868_2768_return_output := buff_MUX_rmii_eth_mac_c_l9_c868_2768_return_output;

     -- UNARY_OP_NOT[rmii_eth_mac_c_l9_c1087_9bb1] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_rmii_eth_mac_c_l9_c1087_9bb1_expr <= VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c1087_9bb1_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c1087_9bb1_return_output := UNARY_OP_NOT_rmii_eth_mac_c_l9_c1087_9bb1_return_output;

     -- skid_buff_MUX[rmii_eth_mac_c_l9_c868_2768] LATENCY=0
     -- Inputs
     skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_cond <= VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_cond;
     skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_iftrue <= VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_iftrue;
     skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_iffalse <= VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_iffalse;
     -- Outputs
     VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_return_output := skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_return_output;

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d[rmii_eth_mac_c_l9_c822_3ba5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l9_c822_3ba5_return_output := skid_buff.valid;

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d[rmii_eth_mac_c_l9_c757_ce38] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l9_c757_ce38_return_output := buff.valid;

     -- Submodule level 1
     VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c757_9418_expr := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l9_c757_ce38_return_output;
     VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c822_dad5_expr := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l9_c822_3ba5_return_output;
     VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_iftrue := VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c1087_9bb1_return_output;
     VAR_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iftrue := VAR_buff_MUX_rmii_eth_mac_c_l9_c868_2768_return_output;
     VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iftrue := VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c868_2768_return_output;
     -- UNARY_OP_NOT[rmii_eth_mac_c_l9_c822_dad5] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_rmii_eth_mac_c_l9_c822_dad5_expr <= VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c822_dad5_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c822_dad5_return_output := UNARY_OP_NOT_rmii_eth_mac_c_l9_c822_dad5_return_output;

     -- UNARY_OP_NOT[rmii_eth_mac_c_l9_c757_9418] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_rmii_eth_mac_c_l9_c757_9418_expr <= VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c757_9418_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c757_9418_return_output := UNARY_OP_NOT_rmii_eth_mac_c_l9_c757_9418_return_output;

     -- Submodule level 2
     -- o_FALSE_INPUT_MUX_CONST_REF_RD_skid_buf_rmii_eth_mac_rx_fifo_t_skid_buf_rmii_eth_mac_rx_fifo_t_69f3[rmii_eth_mac_c_l9_c681_8d17] LATENCY=0
     VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_skid_buf_rmii_eth_mac_rx_fifo_t_skid_buf_rmii_eth_mac_rx_fifo_t_69f3_rmii_eth_mac_c_l9_c681_8d17_return_output := CONST_REF_RD_skid_buf_rmii_eth_mac_rx_fifo_t_skid_buf_rmii_eth_mac_rx_fifo_t_69f3(
     buff,
     VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c822_dad5_return_output);

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_skid_buf_rmii_eth_mac_rx_fifo_t_skid_buf_rmii_eth_mac_rx_fifo_t_69f3[rmii_eth_mac_c_l9_c681_8d17] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_skid_buf_rmii_eth_mac_rx_fifo_t_skid_buf_rmii_eth_mac_rx_fifo_t_69f3_rmii_eth_mac_c_l9_c681_8d17_return_output := CONST_REF_RD_skid_buf_rmii_eth_mac_rx_fifo_t_skid_buf_rmii_eth_mac_rx_fifo_t_69f3(
     skid_buff,
     VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c757_9418_return_output);

     -- Submodule level 3
     VAR_o_MUX_rmii_eth_mac_c_l9_c681_8d17_iffalse := VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_skid_buf_rmii_eth_mac_rx_fifo_t_skid_buf_rmii_eth_mac_rx_fifo_t_69f3_rmii_eth_mac_c_l9_c681_8d17_return_output;
     VAR_o_MUX_rmii_eth_mac_c_l9_c681_8d17_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_skid_buf_rmii_eth_mac_rx_fifo_t_skid_buf_rmii_eth_mac_rx_fifo_t_69f3_rmii_eth_mac_c_l9_c681_8d17_return_output;
     -- o_MUX[rmii_eth_mac_c_l9_c681_8d17] LATENCY=0
     -- Inputs
     o_MUX_rmii_eth_mac_c_l9_c681_8d17_cond <= VAR_o_MUX_rmii_eth_mac_c_l9_c681_8d17_cond;
     o_MUX_rmii_eth_mac_c_l9_c681_8d17_iftrue <= VAR_o_MUX_rmii_eth_mac_c_l9_c681_8d17_iftrue;
     o_MUX_rmii_eth_mac_c_l9_c681_8d17_iffalse <= VAR_o_MUX_rmii_eth_mac_c_l9_c681_8d17_iffalse;
     -- Outputs
     VAR_o_MUX_rmii_eth_mac_c_l9_c681_8d17_return_output := o_MUX_rmii_eth_mac_c_l9_c681_8d17_return_output;

     -- Submodule level 4
     VAR_return_output := VAR_o_MUX_rmii_eth_mac_c_l9_c681_8d17_return_output;
     -- CONST_REF_RD_uint1_t_skid_buf_rmii_eth_mac_rx_fifo_t_stream_out_valid_d41d[rmii_eth_mac_c_l9_c949_b7a3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_skid_buf_rmii_eth_mac_rx_fifo_t_stream_out_valid_d41d_rmii_eth_mac_c_l9_c949_b7a3_return_output := VAR_o_MUX_rmii_eth_mac_c_l9_c681_8d17_return_output.stream_out.valid;

     -- CONST_REF_RD_uint1_t_skid_buf_rmii_eth_mac_rx_fifo_t_ready_for_stream_in_d41d[rmii_eth_mac_c_l9_c844_3460] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_skid_buf_rmii_eth_mac_rx_fifo_t_ready_for_stream_in_d41d_rmii_eth_mac_c_l9_c844_3460_return_output := VAR_o_MUX_rmii_eth_mac_c_l9_c681_8d17_return_output.ready_for_stream_in;

     -- Submodule level 5
     VAR_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_cond := VAR_CONST_REF_RD_uint1_t_skid_buf_rmii_eth_mac_rx_fifo_t_ready_for_stream_in_d41d_rmii_eth_mac_c_l9_c844_3460_return_output;
     VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_cond := VAR_CONST_REF_RD_uint1_t_skid_buf_rmii_eth_mac_rx_fifo_t_ready_for_stream_in_d41d_rmii_eth_mac_c_l9_c844_3460_return_output;
     VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c949_2309_expr := VAR_CONST_REF_RD_uint1_t_skid_buf_rmii_eth_mac_rx_fifo_t_stream_out_valid_d41d_rmii_eth_mac_c_l9_c949_b7a3_return_output;
     -- buff_MUX[rmii_eth_mac_c_l9_c841_22eb] LATENCY=0
     -- Inputs
     buff_MUX_rmii_eth_mac_c_l9_c841_22eb_cond <= VAR_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_cond;
     buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iftrue <= VAR_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iftrue;
     buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iffalse <= VAR_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iffalse;
     -- Outputs
     VAR_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_return_output := buff_MUX_rmii_eth_mac_c_l9_c841_22eb_return_output;

     -- skid_buff_MUX[rmii_eth_mac_c_l9_c841_22eb] LATENCY=0
     -- Inputs
     skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_cond <= VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_cond;
     skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iftrue <= VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iftrue;
     skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iffalse <= VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_iffalse;
     -- Outputs
     VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_return_output := skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_return_output;

     -- UNARY_OP_NOT[rmii_eth_mac_c_l9_c949_2309] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_rmii_eth_mac_c_l9_c949_2309_expr <= VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c949_2309_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c949_2309_return_output := UNARY_OP_NOT_rmii_eth_mac_c_l9_c949_2309_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243_left := VAR_UNARY_OP_NOT_rmii_eth_mac_c_l9_c949_2309_return_output;
     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l9_DUPLICATE_cbf8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l9_DUPLICATE_cbf8_return_output := VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_return_output.valid;

     -- BIN_OP_OR[rmii_eth_mac_c_l9_c949_f243] LATENCY=0
     -- Inputs
     BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243_left <= VAR_BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243_left;
     BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243_right <= VAR_BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243_right;
     -- Outputs
     VAR_BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243_return_output := BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243_return_output;

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l9_DUPLICATE_9970 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l9_DUPLICATE_9970_return_output := VAR_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_return_output.valid;

     -- Submodule level 7
     VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_cond := VAR_BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243_return_output;
     VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_cond := VAR_BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243_return_output;
     VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_cond := VAR_BIN_OP_OR_rmii_eth_mac_c_l9_c949_f243_return_output;
     VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iffalse := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l9_DUPLICATE_9970_return_output;
     VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iftrue := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l9_DUPLICATE_9970_return_output;
     VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iffalse := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l9_DUPLICATE_cbf8_return_output;
     VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iffalse := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l9_DUPLICATE_cbf8_return_output;
     -- skid_buff_valid_MUX[rmii_eth_mac_c_l9_c993_5c14] LATENCY=0
     -- Inputs
     skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_cond <= VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_cond;
     skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iftrue <= VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iftrue;
     skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iffalse <= VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iffalse;
     -- Outputs
     VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_return_output := skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_return_output;

     -- output_is_skid_buff_MUX[rmii_eth_mac_c_l9_c945_9ea8] LATENCY=0
     -- Inputs
     output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_cond <= VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_cond;
     output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_iftrue <= VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_iftrue;
     output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_iffalse <= VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_iffalse;
     -- Outputs
     VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_return_output := output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_return_output;

     -- buff_valid_MUX[rmii_eth_mac_c_l9_c993_5c14] LATENCY=0
     -- Inputs
     buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_cond <= VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_cond;
     buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iftrue <= VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iftrue;
     buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iffalse <= VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_iffalse;
     -- Outputs
     VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_return_output := buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_return_output;

     -- Submodule level 8
     VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iftrue := VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_return_output;
     REG_VAR_output_is_skid_buff := VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l9_c945_9ea8_return_output;
     VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iftrue := VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c993_5c14_return_output;
     -- buff_valid_MUX[rmii_eth_mac_c_l9_c945_9ea8] LATENCY=0
     -- Inputs
     buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_cond <= VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_cond;
     buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iftrue <= VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iftrue;
     buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iffalse <= VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iffalse;
     -- Outputs
     VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_return_output := buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_return_output;

     -- skid_buff_valid_MUX[rmii_eth_mac_c_l9_c945_9ea8] LATENCY=0
     -- Inputs
     skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_cond <= VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_cond;
     skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iftrue <= VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iftrue;
     skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iffalse <= VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_iffalse;
     -- Outputs
     VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_return_output := skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_return_output;

     -- Submodule level 9
     -- skid_buff_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_2dee[rmii_eth_mac_c_l9_c455_a625] LATENCY=0
     VAR_skid_buff_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_2dee_rmii_eth_mac_c_l9_c455_a625_return_output := CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_2dee(
     VAR_skid_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_return_output,
     VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_return_output);

     -- buff_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_2dee[rmii_eth_mac_c_l9_c455_a625] LATENCY=0
     VAR_buff_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_2dee_rmii_eth_mac_c_l9_c455_a625_return_output := CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_2dee(
     VAR_buff_MUX_rmii_eth_mac_c_l9_c841_22eb_return_output,
     VAR_buff_valid_MUX_rmii_eth_mac_c_l9_c945_9ea8_return_output);

     -- Submodule level 10
     REG_VAR_buff := VAR_buff_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_2dee_rmii_eth_mac_c_l9_c455_a625_return_output;
     REG_VAR_skid_buff := VAR_skid_buff_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_2dee_rmii_eth_mac_c_l9_c455_a625_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_buff <= REG_VAR_buff;
REG_COMB_skid_buff <= REG_VAR_skid_buff;
REG_COMB_output_is_skid_buff <= REG_VAR_output_is_skid_buff;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if clk_en_internal='1' then
     buff <= REG_COMB_buff;
     skid_buff <= REG_COMB_skid_buff;
     output_is_skid_buff <= REG_COMB_output_is_skid_buff;
 end if;
 end if;
end process;

end arch;
