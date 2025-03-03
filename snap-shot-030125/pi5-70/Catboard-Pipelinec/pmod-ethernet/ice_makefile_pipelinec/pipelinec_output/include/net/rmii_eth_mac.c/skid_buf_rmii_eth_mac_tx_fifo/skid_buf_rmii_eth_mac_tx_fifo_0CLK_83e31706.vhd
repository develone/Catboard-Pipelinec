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
entity skid_buf_rmii_eth_mac_tx_fifo_0CLK_83e31706 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stream_in : in axis8_t_stream_t;
 ready_for_stream_out : in unsigned(0 downto 0);
 return_output : out skid_buf_rmii_eth_mac_tx_fifo_t);
end skid_buf_rmii_eth_mac_tx_fifo_0CLK_83e31706;
architecture arch of skid_buf_rmii_eth_mac_tx_fifo_0CLK_83e31706 is
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
-- o_MUX[rmii_eth_mac_c_l14_c681_4540]
signal o_MUX_rmii_eth_mac_c_l14_c681_4540_cond : unsigned(0 downto 0);
signal o_MUX_rmii_eth_mac_c_l14_c681_4540_iftrue : skid_buf_rmii_eth_mac_tx_fifo_t;
signal o_MUX_rmii_eth_mac_c_l14_c681_4540_iffalse : skid_buf_rmii_eth_mac_tx_fifo_t;
signal o_MUX_rmii_eth_mac_c_l14_c681_4540_return_output : skid_buf_rmii_eth_mac_tx_fifo_t;

-- UNARY_OP_NOT[rmii_eth_mac_c_l14_c757_2583]
signal UNARY_OP_NOT_rmii_eth_mac_c_l14_c757_2583_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_rmii_eth_mac_c_l14_c757_2583_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[rmii_eth_mac_c_l14_c822_4833]
signal UNARY_OP_NOT_rmii_eth_mac_c_l14_c822_4833_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_rmii_eth_mac_c_l14_c822_4833_return_output : unsigned(0 downto 0);

-- skid_buff_MUX[rmii_eth_mac_c_l14_c841_49c8]
signal skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_cond : unsigned(0 downto 0);
signal skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iftrue : axis8_t_stream_t;
signal skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iffalse : axis8_t_stream_t;
signal skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_return_output : axis8_t_stream_t;

-- buff_MUX[rmii_eth_mac_c_l14_c841_49c8]
signal buff_MUX_rmii_eth_mac_c_l14_c841_49c8_cond : unsigned(0 downto 0);
signal buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iftrue : axis8_t_stream_t;
signal buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iffalse : axis8_t_stream_t;
signal buff_MUX_rmii_eth_mac_c_l14_c841_49c8_return_output : axis8_t_stream_t;

-- skid_buff_MUX[rmii_eth_mac_c_l14_c868_7fdc]
signal skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_cond : unsigned(0 downto 0);
signal skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iftrue : axis8_t_stream_t;
signal skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iffalse : axis8_t_stream_t;
signal skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_return_output : axis8_t_stream_t;

-- buff_MUX[rmii_eth_mac_c_l14_c868_7fdc]
signal buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_cond : unsigned(0 downto 0);
signal buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iftrue : axis8_t_stream_t;
signal buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iffalse : axis8_t_stream_t;
signal buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_return_output : axis8_t_stream_t;

-- UNARY_OP_NOT[rmii_eth_mac_c_l14_c949_21e0]
signal UNARY_OP_NOT_rmii_eth_mac_c_l14_c949_21e0_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_rmii_eth_mac_c_l14_c949_21e0_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[rmii_eth_mac_c_l14_c949_f83f]
signal BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f_left : unsigned(0 downto 0);
signal BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f_right : unsigned(0 downto 0);
signal BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f_return_output : unsigned(0 downto 0);

-- output_is_skid_buff_MUX[rmii_eth_mac_c_l14_c945_481b]
signal output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_cond : unsigned(0 downto 0);
signal output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_iftrue : unsigned(0 downto 0);
signal output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_iffalse : unsigned(0 downto 0);
signal output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_return_output : unsigned(0 downto 0);

-- skid_buff_valid_MUX[rmii_eth_mac_c_l14_c945_481b]
signal skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_cond : unsigned(0 downto 0);
signal skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iftrue : unsigned(0 downto 0);
signal skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iffalse : unsigned(0 downto 0);
signal skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_return_output : unsigned(0 downto 0);

-- buff_valid_MUX[rmii_eth_mac_c_l14_c945_481b]
signal buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_cond : unsigned(0 downto 0);
signal buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iftrue : unsigned(0 downto 0);
signal buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iffalse : unsigned(0 downto 0);
signal buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_return_output : unsigned(0 downto 0);

-- skid_buff_valid_MUX[rmii_eth_mac_c_l14_c993_3169]
signal skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_cond : unsigned(0 downto 0);
signal skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iftrue : unsigned(0 downto 0);
signal skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iffalse : unsigned(0 downto 0);
signal skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_return_output : unsigned(0 downto 0);

-- buff_valid_MUX[rmii_eth_mac_c_l14_c993_3169]
signal buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_cond : unsigned(0 downto 0);
signal buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iftrue : unsigned(0 downto 0);
signal buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iffalse : unsigned(0 downto 0);
signal buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[rmii_eth_mac_c_l14_c1087_d401]
signal UNARY_OP_NOT_rmii_eth_mac_c_l14_c1087_d401_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_rmii_eth_mac_c_l14_c1087_d401_return_output : unsigned(0 downto 0);

function CONST_REF_RD_skid_buf_rmii_eth_mac_tx_fifo_t_skid_buf_rmii_eth_mac_tx_fifo_t_69f3( ref_toks_0 : axis8_t_stream_t;
 ref_toks_1 : unsigned) return skid_buf_rmii_eth_mac_tx_fifo_t is
 
  variable base : skid_buf_rmii_eth_mac_tx_fifo_t; 
  variable return_output : skid_buf_rmii_eth_mac_tx_fifo_t;
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
-- o_MUX_rmii_eth_mac_c_l14_c681_4540 : 0 clocks latency
o_MUX_rmii_eth_mac_c_l14_c681_4540 : entity work.MUX_uint1_t_skid_buf_rmii_eth_mac_tx_fifo_t_skid_buf_rmii_eth_mac_tx_fifo_t_0CLK_de264c78 port map (
o_MUX_rmii_eth_mac_c_l14_c681_4540_cond,
o_MUX_rmii_eth_mac_c_l14_c681_4540_iftrue,
o_MUX_rmii_eth_mac_c_l14_c681_4540_iffalse,
o_MUX_rmii_eth_mac_c_l14_c681_4540_return_output);

-- UNARY_OP_NOT_rmii_eth_mac_c_l14_c757_2583 : 0 clocks latency
UNARY_OP_NOT_rmii_eth_mac_c_l14_c757_2583 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_rmii_eth_mac_c_l14_c757_2583_expr,
UNARY_OP_NOT_rmii_eth_mac_c_l14_c757_2583_return_output);

-- UNARY_OP_NOT_rmii_eth_mac_c_l14_c822_4833 : 0 clocks latency
UNARY_OP_NOT_rmii_eth_mac_c_l14_c822_4833 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_rmii_eth_mac_c_l14_c822_4833_expr,
UNARY_OP_NOT_rmii_eth_mac_c_l14_c822_4833_return_output);

-- skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8 : 0 clocks latency
skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8 : entity work.MUX_uint1_t_axis8_t_stream_t_axis8_t_stream_t_0CLK_de264c78 port map (
skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_cond,
skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iftrue,
skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iffalse,
skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_return_output);

-- buff_MUX_rmii_eth_mac_c_l14_c841_49c8 : 0 clocks latency
buff_MUX_rmii_eth_mac_c_l14_c841_49c8 : entity work.MUX_uint1_t_axis8_t_stream_t_axis8_t_stream_t_0CLK_de264c78 port map (
buff_MUX_rmii_eth_mac_c_l14_c841_49c8_cond,
buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iftrue,
buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iffalse,
buff_MUX_rmii_eth_mac_c_l14_c841_49c8_return_output);

-- skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc : 0 clocks latency
skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc : entity work.MUX_uint1_t_axis8_t_stream_t_axis8_t_stream_t_0CLK_de264c78 port map (
skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_cond,
skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iftrue,
skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iffalse,
skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_return_output);

-- buff_MUX_rmii_eth_mac_c_l14_c868_7fdc : 0 clocks latency
buff_MUX_rmii_eth_mac_c_l14_c868_7fdc : entity work.MUX_uint1_t_axis8_t_stream_t_axis8_t_stream_t_0CLK_de264c78 port map (
buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_cond,
buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iftrue,
buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iffalse,
buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_return_output);

-- UNARY_OP_NOT_rmii_eth_mac_c_l14_c949_21e0 : 0 clocks latency
UNARY_OP_NOT_rmii_eth_mac_c_l14_c949_21e0 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_rmii_eth_mac_c_l14_c949_21e0_expr,
UNARY_OP_NOT_rmii_eth_mac_c_l14_c949_21e0_return_output);

-- BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f : 0 clocks latency
BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f_left,
BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f_right,
BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f_return_output);

-- output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b : 0 clocks latency
output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_cond,
output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_iftrue,
output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_iffalse,
output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_return_output);

-- skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b : 0 clocks latency
skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_cond,
skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iftrue,
skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iffalse,
skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_return_output);

-- buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b : 0 clocks latency
buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_cond,
buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iftrue,
buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iffalse,
buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_return_output);

-- skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169 : 0 clocks latency
skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_cond,
skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iftrue,
skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iffalse,
skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_return_output);

-- buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169 : 0 clocks latency
buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_cond,
buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iftrue,
buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iffalse,
buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_return_output);

-- UNARY_OP_NOT_rmii_eth_mac_c_l14_c1087_d401 : 0 clocks latency
UNARY_OP_NOT_rmii_eth_mac_c_l14_c1087_d401 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_rmii_eth_mac_c_l14_c1087_d401_expr,
UNARY_OP_NOT_rmii_eth_mac_c_l14_c1087_d401_return_output);



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
 o_MUX_rmii_eth_mac_c_l14_c681_4540_return_output,
 UNARY_OP_NOT_rmii_eth_mac_c_l14_c757_2583_return_output,
 UNARY_OP_NOT_rmii_eth_mac_c_l14_c822_4833_return_output,
 skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_return_output,
 buff_MUX_rmii_eth_mac_c_l14_c841_49c8_return_output,
 skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_return_output,
 buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_return_output,
 UNARY_OP_NOT_rmii_eth_mac_c_l14_c949_21e0_return_output,
 BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f_return_output,
 output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_return_output,
 skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_return_output,
 buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_return_output,
 skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_return_output,
 buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_return_output,
 UNARY_OP_NOT_rmii_eth_mac_c_l14_c1087_d401_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : skid_buf_rmii_eth_mac_tx_fifo_t;
 variable VAR_stream_in : axis8_t_stream_t;
 variable VAR_ready_for_stream_out : unsigned(0 downto 0);
 variable VAR_o : skid_buf_rmii_eth_mac_tx_fifo_t;
 variable VAR_o_MUX_rmii_eth_mac_c_l14_c681_4540_iftrue : skid_buf_rmii_eth_mac_tx_fifo_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_skid_buf_rmii_eth_mac_tx_fifo_t_skid_buf_rmii_eth_mac_tx_fifo_t_69f3_rmii_eth_mac_c_l14_c681_4540_return_output : skid_buf_rmii_eth_mac_tx_fifo_t;
 variable VAR_o_MUX_rmii_eth_mac_c_l14_c681_4540_iffalse : skid_buf_rmii_eth_mac_tx_fifo_t;
 variable VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_skid_buf_rmii_eth_mac_tx_fifo_t_skid_buf_rmii_eth_mac_tx_fifo_t_69f3_rmii_eth_mac_c_l14_c681_4540_return_output : skid_buf_rmii_eth_mac_tx_fifo_t;
 variable VAR_o_MUX_rmii_eth_mac_c_l14_c681_4540_return_output : skid_buf_rmii_eth_mac_tx_fifo_t;
 variable VAR_o_MUX_rmii_eth_mac_c_l14_c681_4540_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l14_c757_2436_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c757_2583_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c757_2583_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l14_c822_3a8d_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c822_4833_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c822_4833_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_skid_buf_rmii_eth_mac_tx_fifo_t_ready_for_stream_in_d41d_rmii_eth_mac_c_l14_c844_fe30_return_output : unsigned(0 downto 0);
 variable VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iftrue : axis8_t_stream_t;
 variable VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_return_output : axis8_t_stream_t;
 variable VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iffalse : axis8_t_stream_t;
 variable VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_return_output : axis8_t_stream_t;
 variable VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_cond : unsigned(0 downto 0);
 variable VAR_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iftrue : axis8_t_stream_t;
 variable VAR_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_return_output : axis8_t_stream_t;
 variable VAR_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iffalse : axis8_t_stream_t;
 variable VAR_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_return_output : axis8_t_stream_t;
 variable VAR_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_cond : unsigned(0 downto 0);
 variable VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iftrue : axis8_t_stream_t;
 variable VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iffalse : axis8_t_stream_t;
 variable VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_cond : unsigned(0 downto 0);
 variable VAR_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iftrue : axis8_t_stream_t;
 variable VAR_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iffalse : axis8_t_stream_t;
 variable VAR_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_skid_buf_rmii_eth_mac_tx_fifo_t_stream_out_valid_d41d_rmii_eth_mac_c_l14_c949_01fa_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c949_21e0_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c949_21e0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f_return_output : unsigned(0 downto 0);
 variable VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_iftrue : unsigned(0 downto 0);
 variable VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_iffalse : unsigned(0 downto 0);
 variable VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_return_output : unsigned(0 downto 0);
 variable VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_cond : unsigned(0 downto 0);
 variable VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iftrue : unsigned(0 downto 0);
 variable VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_return_output : unsigned(0 downto 0);
 variable VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iffalse : unsigned(0 downto 0);
 variable VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_return_output : unsigned(0 downto 0);
 variable VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_cond : unsigned(0 downto 0);
 variable VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iftrue : unsigned(0 downto 0);
 variable VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_return_output : unsigned(0 downto 0);
 variable VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iffalse : unsigned(0 downto 0);
 variable VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_return_output : unsigned(0 downto 0);
 variable VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_cond : unsigned(0 downto 0);
 variable VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iftrue : unsigned(0 downto 0);
 variable VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iffalse : unsigned(0 downto 0);
 variable VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_cond : unsigned(0 downto 0);
 variable VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iftrue : unsigned(0 downto 0);
 variable VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iffalse : unsigned(0 downto 0);
 variable VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c1087_d401_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c1087_d401_return_output : unsigned(0 downto 0);
 variable VAR_buff_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_2dee_rmii_eth_mac_c_l14_c455_dd38_return_output : axis8_t_stream_t;
 variable VAR_skid_buff_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_2dee_rmii_eth_mac_c_l14_c455_dd38_return_output : axis8_t_stream_t;
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l14_DUPLICATE_f7ce_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l14_DUPLICATE_3130_return_output : unsigned(0 downto 0);
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
     VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iffalse := to_unsigned(0, 1);
     VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iftrue := to_unsigned(0, 1);

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
     VAR_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iffalse := buff;
     VAR_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iffalse := buff;
     VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c1087_d401_expr := output_is_skid_buff;
     VAR_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_cond := output_is_skid_buff;
     VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_cond := output_is_skid_buff;
     VAR_o_MUX_rmii_eth_mac_c_l14_c681_4540_cond := output_is_skid_buff;
     VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_iffalse := output_is_skid_buff;
     VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_cond := output_is_skid_buff;
     VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_cond := output_is_skid_buff;
     VAR_BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f_right := VAR_ready_for_stream_out;
     VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iffalse := skid_buff;
     VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iftrue := skid_buff;
     VAR_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iftrue := VAR_stream_in;
     VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iffalse := VAR_stream_in;
     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d[rmii_eth_mac_c_l14_c822_3a8d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l14_c822_3a8d_return_output := skid_buff.valid;

     -- skid_buff_MUX[rmii_eth_mac_c_l14_c868_7fdc] LATENCY=0
     -- Inputs
     skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_cond <= VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_cond;
     skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iftrue <= VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iftrue;
     skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iffalse <= VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iffalse;
     -- Outputs
     VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_return_output := skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_return_output;

     -- UNARY_OP_NOT[rmii_eth_mac_c_l14_c1087_d401] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_rmii_eth_mac_c_l14_c1087_d401_expr <= VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c1087_d401_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c1087_d401_return_output := UNARY_OP_NOT_rmii_eth_mac_c_l14_c1087_d401_return_output;

     -- buff_MUX[rmii_eth_mac_c_l14_c868_7fdc] LATENCY=0
     -- Inputs
     buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_cond <= VAR_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_cond;
     buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iftrue <= VAR_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iftrue;
     buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iffalse <= VAR_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_iffalse;
     -- Outputs
     VAR_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_return_output := buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_return_output;

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d[rmii_eth_mac_c_l14_c757_2436] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l14_c757_2436_return_output := buff.valid;

     -- Submodule level 1
     VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c757_2583_expr := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l14_c757_2436_return_output;
     VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c822_4833_expr := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l14_c822_3a8d_return_output;
     VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_iftrue := VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c1087_d401_return_output;
     VAR_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iftrue := VAR_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_return_output;
     VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iftrue := VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c868_7fdc_return_output;
     -- UNARY_OP_NOT[rmii_eth_mac_c_l14_c822_4833] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_rmii_eth_mac_c_l14_c822_4833_expr <= VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c822_4833_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c822_4833_return_output := UNARY_OP_NOT_rmii_eth_mac_c_l14_c822_4833_return_output;

     -- UNARY_OP_NOT[rmii_eth_mac_c_l14_c757_2583] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_rmii_eth_mac_c_l14_c757_2583_expr <= VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c757_2583_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c757_2583_return_output := UNARY_OP_NOT_rmii_eth_mac_c_l14_c757_2583_return_output;

     -- Submodule level 2
     -- o_TRUE_INPUT_MUX_CONST_REF_RD_skid_buf_rmii_eth_mac_tx_fifo_t_skid_buf_rmii_eth_mac_tx_fifo_t_69f3[rmii_eth_mac_c_l14_c681_4540] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_skid_buf_rmii_eth_mac_tx_fifo_t_skid_buf_rmii_eth_mac_tx_fifo_t_69f3_rmii_eth_mac_c_l14_c681_4540_return_output := CONST_REF_RD_skid_buf_rmii_eth_mac_tx_fifo_t_skid_buf_rmii_eth_mac_tx_fifo_t_69f3(
     skid_buff,
     VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c757_2583_return_output);

     -- o_FALSE_INPUT_MUX_CONST_REF_RD_skid_buf_rmii_eth_mac_tx_fifo_t_skid_buf_rmii_eth_mac_tx_fifo_t_69f3[rmii_eth_mac_c_l14_c681_4540] LATENCY=0
     VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_skid_buf_rmii_eth_mac_tx_fifo_t_skid_buf_rmii_eth_mac_tx_fifo_t_69f3_rmii_eth_mac_c_l14_c681_4540_return_output := CONST_REF_RD_skid_buf_rmii_eth_mac_tx_fifo_t_skid_buf_rmii_eth_mac_tx_fifo_t_69f3(
     buff,
     VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c822_4833_return_output);

     -- Submodule level 3
     VAR_o_MUX_rmii_eth_mac_c_l14_c681_4540_iffalse := VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_skid_buf_rmii_eth_mac_tx_fifo_t_skid_buf_rmii_eth_mac_tx_fifo_t_69f3_rmii_eth_mac_c_l14_c681_4540_return_output;
     VAR_o_MUX_rmii_eth_mac_c_l14_c681_4540_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_skid_buf_rmii_eth_mac_tx_fifo_t_skid_buf_rmii_eth_mac_tx_fifo_t_69f3_rmii_eth_mac_c_l14_c681_4540_return_output;
     -- o_MUX[rmii_eth_mac_c_l14_c681_4540] LATENCY=0
     -- Inputs
     o_MUX_rmii_eth_mac_c_l14_c681_4540_cond <= VAR_o_MUX_rmii_eth_mac_c_l14_c681_4540_cond;
     o_MUX_rmii_eth_mac_c_l14_c681_4540_iftrue <= VAR_o_MUX_rmii_eth_mac_c_l14_c681_4540_iftrue;
     o_MUX_rmii_eth_mac_c_l14_c681_4540_iffalse <= VAR_o_MUX_rmii_eth_mac_c_l14_c681_4540_iffalse;
     -- Outputs
     VAR_o_MUX_rmii_eth_mac_c_l14_c681_4540_return_output := o_MUX_rmii_eth_mac_c_l14_c681_4540_return_output;

     -- Submodule level 4
     VAR_return_output := VAR_o_MUX_rmii_eth_mac_c_l14_c681_4540_return_output;
     -- CONST_REF_RD_uint1_t_skid_buf_rmii_eth_mac_tx_fifo_t_ready_for_stream_in_d41d[rmii_eth_mac_c_l14_c844_fe30] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_skid_buf_rmii_eth_mac_tx_fifo_t_ready_for_stream_in_d41d_rmii_eth_mac_c_l14_c844_fe30_return_output := VAR_o_MUX_rmii_eth_mac_c_l14_c681_4540_return_output.ready_for_stream_in;

     -- CONST_REF_RD_uint1_t_skid_buf_rmii_eth_mac_tx_fifo_t_stream_out_valid_d41d[rmii_eth_mac_c_l14_c949_01fa] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_skid_buf_rmii_eth_mac_tx_fifo_t_stream_out_valid_d41d_rmii_eth_mac_c_l14_c949_01fa_return_output := VAR_o_MUX_rmii_eth_mac_c_l14_c681_4540_return_output.stream_out.valid;

     -- Submodule level 5
     VAR_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_cond := VAR_CONST_REF_RD_uint1_t_skid_buf_rmii_eth_mac_tx_fifo_t_ready_for_stream_in_d41d_rmii_eth_mac_c_l14_c844_fe30_return_output;
     VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_cond := VAR_CONST_REF_RD_uint1_t_skid_buf_rmii_eth_mac_tx_fifo_t_ready_for_stream_in_d41d_rmii_eth_mac_c_l14_c844_fe30_return_output;
     VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c949_21e0_expr := VAR_CONST_REF_RD_uint1_t_skid_buf_rmii_eth_mac_tx_fifo_t_stream_out_valid_d41d_rmii_eth_mac_c_l14_c949_01fa_return_output;
     -- skid_buff_MUX[rmii_eth_mac_c_l14_c841_49c8] LATENCY=0
     -- Inputs
     skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_cond <= VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_cond;
     skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iftrue <= VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iftrue;
     skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iffalse <= VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iffalse;
     -- Outputs
     VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_return_output := skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_return_output;

     -- buff_MUX[rmii_eth_mac_c_l14_c841_49c8] LATENCY=0
     -- Inputs
     buff_MUX_rmii_eth_mac_c_l14_c841_49c8_cond <= VAR_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_cond;
     buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iftrue <= VAR_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iftrue;
     buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iffalse <= VAR_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_iffalse;
     -- Outputs
     VAR_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_return_output := buff_MUX_rmii_eth_mac_c_l14_c841_49c8_return_output;

     -- UNARY_OP_NOT[rmii_eth_mac_c_l14_c949_21e0] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_rmii_eth_mac_c_l14_c949_21e0_expr <= VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c949_21e0_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c949_21e0_return_output := UNARY_OP_NOT_rmii_eth_mac_c_l14_c949_21e0_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f_left := VAR_UNARY_OP_NOT_rmii_eth_mac_c_l14_c949_21e0_return_output;
     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l14_DUPLICATE_f7ce LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l14_DUPLICATE_f7ce_return_output := VAR_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_return_output.valid;

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l14_DUPLICATE_3130 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l14_DUPLICATE_3130_return_output := VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_return_output.valid;

     -- BIN_OP_OR[rmii_eth_mac_c_l14_c949_f83f] LATENCY=0
     -- Inputs
     BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f_left <= VAR_BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f_left;
     BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f_right <= VAR_BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f_right;
     -- Outputs
     VAR_BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f_return_output := BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f_return_output;

     -- Submodule level 7
     VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_cond := VAR_BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f_return_output;
     VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_cond := VAR_BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f_return_output;
     VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_cond := VAR_BIN_OP_OR_rmii_eth_mac_c_l14_c949_f83f_return_output;
     VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iffalse := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l14_DUPLICATE_3130_return_output;
     VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iffalse := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l14_DUPLICATE_3130_return_output;
     VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iffalse := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l14_DUPLICATE_f7ce_return_output;
     VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iftrue := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_c_l14_DUPLICATE_f7ce_return_output;
     -- output_is_skid_buff_MUX[rmii_eth_mac_c_l14_c945_481b] LATENCY=0
     -- Inputs
     output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_cond <= VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_cond;
     output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_iftrue <= VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_iftrue;
     output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_iffalse <= VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_iffalse;
     -- Outputs
     VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_return_output := output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_return_output;

     -- buff_valid_MUX[rmii_eth_mac_c_l14_c993_3169] LATENCY=0
     -- Inputs
     buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_cond <= VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_cond;
     buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iftrue <= VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iftrue;
     buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iffalse <= VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iffalse;
     -- Outputs
     VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_return_output := buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_return_output;

     -- skid_buff_valid_MUX[rmii_eth_mac_c_l14_c993_3169] LATENCY=0
     -- Inputs
     skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_cond <= VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_cond;
     skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iftrue <= VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iftrue;
     skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iffalse <= VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_iffalse;
     -- Outputs
     VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_return_output := skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_return_output;

     -- Submodule level 8
     VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iftrue := VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_return_output;
     REG_VAR_output_is_skid_buff := VAR_output_is_skid_buff_MUX_rmii_eth_mac_c_l14_c945_481b_return_output;
     VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iftrue := VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c993_3169_return_output;
     -- skid_buff_valid_MUX[rmii_eth_mac_c_l14_c945_481b] LATENCY=0
     -- Inputs
     skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_cond <= VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_cond;
     skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iftrue <= VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iftrue;
     skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iffalse <= VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iffalse;
     -- Outputs
     VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_return_output := skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_return_output;

     -- buff_valid_MUX[rmii_eth_mac_c_l14_c945_481b] LATENCY=0
     -- Inputs
     buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_cond <= VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_cond;
     buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iftrue <= VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iftrue;
     buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iffalse <= VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_iffalse;
     -- Outputs
     VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_return_output := buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_return_output;

     -- Submodule level 9
     -- skid_buff_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_2dee[rmii_eth_mac_c_l14_c455_dd38] LATENCY=0
     VAR_skid_buff_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_2dee_rmii_eth_mac_c_l14_c455_dd38_return_output := CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_2dee(
     VAR_skid_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_return_output,
     VAR_skid_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_return_output);

     -- buff_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_2dee[rmii_eth_mac_c_l14_c455_dd38] LATENCY=0
     VAR_buff_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_2dee_rmii_eth_mac_c_l14_c455_dd38_return_output := CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_2dee(
     VAR_buff_MUX_rmii_eth_mac_c_l14_c841_49c8_return_output,
     VAR_buff_valid_MUX_rmii_eth_mac_c_l14_c945_481b_return_output);

     -- Submodule level 10
     REG_VAR_buff := VAR_buff_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_2dee_rmii_eth_mac_c_l14_c455_dd38_return_output;
     REG_VAR_skid_buff := VAR_skid_buff_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_2dee_rmii_eth_mac_c_l14_c455_dd38_return_output;
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
