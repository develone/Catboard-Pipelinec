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
-- Submodules: 87
entity eth_8_tx_0CLK_418a2715 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 frame : in eth8_frame_t_stream_t;
 mac_axis_ready : in unsigned(0 downto 0);
 return_output : out eth_8_tx_t);
end eth_8_tx_0CLK_418a2715;
architecture arch of eth_8_tx_0CLK_418a2715 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal state : unsigned(2 downto 0) := unsigned(eth8_state_t_to_slv(eth8_state_t'left));
signal header : eth_header_t := eth_header_t_NULL;
signal counter : unsigned(5 downto 0) := to_unsigned(0, 6);
signal REG_COMB_state : unsigned(2 downto 0);
signal REG_COMB_header : eth_header_t;
signal REG_COMB_counter : unsigned(5 downto 0);

-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Each function instance gets signals
-- BIN_OP_LT[eth_8_h_l124_c32_05a2]
signal BIN_OP_LT_eth_8_h_l124_c32_05a2_left : unsigned(5 downto 0);
signal BIN_OP_LT_eth_8_h_l124_c32_05a2_right : unsigned(5 downto 0);
signal BIN_OP_LT_eth_8_h_l124_c32_05a2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[eth_8_h_l128_c6_e94c]
signal BIN_OP_EQ_eth_8_h_l128_c6_e94c_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l128_c6_e94c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l128_c6_e94c_return_output : unsigned(0 downto 0);

-- header_MUX[eth_8_h_l128_c3_78c9]
signal header_MUX_eth_8_h_l128_c3_78c9_cond : unsigned(0 downto 0);
signal header_MUX_eth_8_h_l128_c3_78c9_iftrue : eth_header_t;
signal header_MUX_eth_8_h_l128_c3_78c9_iffalse : eth_header_t;
signal header_MUX_eth_8_h_l128_c3_78c9_return_output : eth_header_t;

-- counter_MUX[eth_8_h_l128_c3_78c9]
signal counter_MUX_eth_8_h_l128_c3_78c9_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l128_c3_78c9_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l128_c3_78c9_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l128_c3_78c9_return_output : unsigned(5 downto 0);

-- o_MUX[eth_8_h_l128_c3_78c9]
signal o_MUX_eth_8_h_l128_c3_78c9_cond : unsigned(0 downto 0);
signal o_MUX_eth_8_h_l128_c3_78c9_iftrue : eth_8_tx_t;
signal o_MUX_eth_8_h_l128_c3_78c9_iffalse : eth_8_tx_t;
signal o_MUX_eth_8_h_l128_c3_78c9_return_output : eth_8_tx_t;

-- state_MUX[eth_8_h_l128_c3_78c9]
signal state_MUX_eth_8_h_l128_c3_78c9_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l128_c3_78c9_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l128_c3_78c9_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l128_c3_78c9_return_output : unsigned(2 downto 0);

-- header_MUX[eth_8_h_l130_c5_56e3]
signal header_MUX_eth_8_h_l130_c5_56e3_cond : unsigned(0 downto 0);
signal header_MUX_eth_8_h_l130_c5_56e3_iftrue : eth_header_t;
signal header_MUX_eth_8_h_l130_c5_56e3_iffalse : eth_header_t;
signal header_MUX_eth_8_h_l130_c5_56e3_return_output : eth_header_t;

-- counter_MUX[eth_8_h_l130_c5_56e3]
signal counter_MUX_eth_8_h_l130_c5_56e3_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l130_c5_56e3_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l130_c5_56e3_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l130_c5_56e3_return_output : unsigned(5 downto 0);

-- o_mac_axis_valid_MUX[eth_8_h_l130_c5_56e3]
signal o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_cond : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_iftrue : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_iffalse : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_return_output : unsigned(0 downto 0);

-- o_mac_axis_data_tdata_MUX[eth_8_h_l130_c5_56e3]
signal o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_cond : unsigned(0 downto 0);
signal o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_iftrue : uint8_t_1;
signal o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_iffalse : uint8_t_1;
signal o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_return_output : uint8_t_1;

-- state_MUX[eth_8_h_l130_c5_56e3]
signal state_MUX_eth_8_h_l130_c5_56e3_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l130_c5_56e3_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l130_c5_56e3_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l130_c5_56e3_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[eth_8_h_l131_c10_188b]
signal BIN_OP_EQ_eth_8_h_l131_c10_188b_left : unsigned(5 downto 0);
signal BIN_OP_EQ_eth_8_h_l131_c10_188b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_eth_8_h_l131_c10_188b_return_output : unsigned(0 downto 0);

-- header_MUX[eth_8_h_l131_c7_8004]
signal header_MUX_eth_8_h_l131_c7_8004_cond : unsigned(0 downto 0);
signal header_MUX_eth_8_h_l131_c7_8004_iftrue : eth_header_t;
signal header_MUX_eth_8_h_l131_c7_8004_iffalse : eth_header_t;
signal header_MUX_eth_8_h_l131_c7_8004_return_output : eth_header_t;

-- header_dst_mac_MUX[eth_8_h_l136_c7_da1f]
signal header_dst_mac_MUX_eth_8_h_l136_c7_da1f_cond : unsigned(0 downto 0);
signal header_dst_mac_MUX_eth_8_h_l136_c7_da1f_iftrue : unsigned(47 downto 0);
signal header_dst_mac_MUX_eth_8_h_l136_c7_da1f_iffalse : unsigned(47 downto 0);
signal header_dst_mac_MUX_eth_8_h_l136_c7_da1f_return_output : unsigned(47 downto 0);

-- counter_MUX[eth_8_h_l136_c7_da1f]
signal counter_MUX_eth_8_h_l136_c7_da1f_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l136_c7_da1f_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l136_c7_da1f_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l136_c7_da1f_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l136_c7_da1f]
signal state_MUX_eth_8_h_l136_c7_da1f_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l136_c7_da1f_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l136_c7_da1f_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l136_c7_da1f_return_output : unsigned(2 downto 0);

-- CONST_SL_8[eth_8_h_l137_c26_f515]
signal CONST_SL_8_eth_8_h_l137_c26_f515_x : unsigned(47 downto 0);
signal CONST_SL_8_eth_8_h_l137_c26_f515_return_output : unsigned(47 downto 0);

-- BIN_OP_EQ[eth_8_h_l138_c12_aad1]
signal BIN_OP_EQ_eth_8_h_l138_c12_aad1_left : unsigned(5 downto 0);
signal BIN_OP_EQ_eth_8_h_l138_c12_aad1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l138_c12_aad1_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l138_c9_eed8]
signal counter_MUX_eth_8_h_l138_c9_eed8_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l138_c9_eed8_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l138_c9_eed8_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l138_c9_eed8_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l138_c9_eed8]
signal state_MUX_eth_8_h_l138_c9_eed8_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l138_c9_eed8_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l138_c9_eed8_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l138_c9_eed8_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l142_c11_859a]
signal BIN_OP_PLUS_eth_8_h_l142_c11_859a_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_eth_8_h_l142_c11_859a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l142_c11_859a_return_output : unsigned(6 downto 0);

-- BIN_OP_EQ[eth_8_h_l146_c12_e78f]
signal BIN_OP_EQ_eth_8_h_l146_c12_e78f_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l146_c12_e78f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l146_c12_e78f_return_output : unsigned(0 downto 0);

-- header_ethertype_MUX[eth_8_h_l146_c9_c265]
signal header_ethertype_MUX_eth_8_h_l146_c9_c265_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l146_c9_c265_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l146_c9_c265_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l146_c9_c265_return_output : unsigned(15 downto 0);

-- header_src_mac_MUX[eth_8_h_l146_c9_c265]
signal header_src_mac_MUX_eth_8_h_l146_c9_c265_cond : unsigned(0 downto 0);
signal header_src_mac_MUX_eth_8_h_l146_c9_c265_iftrue : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l146_c9_c265_iffalse : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l146_c9_c265_return_output : unsigned(47 downto 0);

-- counter_MUX[eth_8_h_l146_c9_c265]
signal counter_MUX_eth_8_h_l146_c9_c265_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l146_c9_c265_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l146_c9_c265_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l146_c9_c265_return_output : unsigned(5 downto 0);

-- o_MUX[eth_8_h_l146_c9_c265]
signal o_MUX_eth_8_h_l146_c9_c265_cond : unsigned(0 downto 0);
signal o_MUX_eth_8_h_l146_c9_c265_iftrue : eth_8_tx_t;
signal o_MUX_eth_8_h_l146_c9_c265_iffalse : eth_8_tx_t;
signal o_MUX_eth_8_h_l146_c9_c265_return_output : eth_8_tx_t;

-- state_MUX[eth_8_h_l146_c9_c265]
signal state_MUX_eth_8_h_l146_c9_c265_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l146_c9_c265_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l146_c9_c265_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l146_c9_c265_return_output : unsigned(2 downto 0);

-- header_src_mac_MUX[eth_8_h_l149_c5_00b7]
signal header_src_mac_MUX_eth_8_h_l149_c5_00b7_cond : unsigned(0 downto 0);
signal header_src_mac_MUX_eth_8_h_l149_c5_00b7_iftrue : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l149_c5_00b7_iffalse : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l149_c5_00b7_return_output : unsigned(47 downto 0);

-- counter_MUX[eth_8_h_l149_c5_00b7]
signal counter_MUX_eth_8_h_l149_c5_00b7_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l149_c5_00b7_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l149_c5_00b7_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l149_c5_00b7_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l149_c5_00b7]
signal state_MUX_eth_8_h_l149_c5_00b7_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l149_c5_00b7_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l149_c5_00b7_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l149_c5_00b7_return_output : unsigned(2 downto 0);

-- CONST_SL_8[eth_8_h_l150_c24_439a]
signal CONST_SL_8_eth_8_h_l150_c24_439a_x : unsigned(47 downto 0);
signal CONST_SL_8_eth_8_h_l150_c24_439a_return_output : unsigned(47 downto 0);

-- BIN_OP_EQ[eth_8_h_l151_c10_5ef8]
signal BIN_OP_EQ_eth_8_h_l151_c10_5ef8_left : unsigned(5 downto 0);
signal BIN_OP_EQ_eth_8_h_l151_c10_5ef8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l151_c10_5ef8_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l151_c7_1168]
signal counter_MUX_eth_8_h_l151_c7_1168_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l151_c7_1168_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l151_c7_1168_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l151_c7_1168_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l151_c7_1168]
signal state_MUX_eth_8_h_l151_c7_1168_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l151_c7_1168_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l151_c7_1168_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l151_c7_1168_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l155_c9_6a55]
signal BIN_OP_PLUS_eth_8_h_l155_c9_6a55_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_eth_8_h_l155_c9_6a55_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l155_c9_6a55_return_output : unsigned(6 downto 0);

-- BIN_OP_EQ[eth_8_h_l158_c12_005d]
signal BIN_OP_EQ_eth_8_h_l158_c12_005d_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l158_c12_005d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l158_c12_005d_return_output : unsigned(0 downto 0);

-- header_ethertype_MUX[eth_8_h_l158_c9_8d77]
signal header_ethertype_MUX_eth_8_h_l158_c9_8d77_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l158_c9_8d77_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l158_c9_8d77_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l158_c9_8d77_return_output : unsigned(15 downto 0);

-- counter_MUX[eth_8_h_l158_c9_8d77]
signal counter_MUX_eth_8_h_l158_c9_8d77_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l158_c9_8d77_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l158_c9_8d77_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l158_c9_8d77_return_output : unsigned(5 downto 0);

-- o_MUX[eth_8_h_l158_c9_8d77]
signal o_MUX_eth_8_h_l158_c9_8d77_cond : unsigned(0 downto 0);
signal o_MUX_eth_8_h_l158_c9_8d77_iftrue : eth_8_tx_t;
signal o_MUX_eth_8_h_l158_c9_8d77_iffalse : eth_8_tx_t;
signal o_MUX_eth_8_h_l158_c9_8d77_return_output : eth_8_tx_t;

-- state_MUX[eth_8_h_l158_c9_8d77]
signal state_MUX_eth_8_h_l158_c9_8d77_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l158_c9_8d77_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l158_c9_8d77_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l158_c9_8d77_return_output : unsigned(2 downto 0);

-- header_ethertype_MUX[eth_8_h_l161_c5_9bfb]
signal header_ethertype_MUX_eth_8_h_l161_c5_9bfb_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l161_c5_9bfb_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l161_c5_9bfb_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l161_c5_9bfb_return_output : unsigned(15 downto 0);

-- counter_MUX[eth_8_h_l161_c5_9bfb]
signal counter_MUX_eth_8_h_l161_c5_9bfb_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l161_c5_9bfb_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l161_c5_9bfb_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l161_c5_9bfb_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l161_c5_9bfb]
signal state_MUX_eth_8_h_l161_c5_9bfb_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l161_c5_9bfb_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l161_c5_9bfb_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l161_c5_9bfb_return_output : unsigned(2 downto 0);

-- CONST_SL_8[eth_8_h_l162_c26_f948]
signal CONST_SL_8_eth_8_h_l162_c26_f948_x : unsigned(15 downto 0);
signal CONST_SL_8_eth_8_h_l162_c26_f948_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[eth_8_h_l163_c10_c49b]
signal BIN_OP_EQ_eth_8_h_l163_c10_c49b_left : unsigned(5 downto 0);
signal BIN_OP_EQ_eth_8_h_l163_c10_c49b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_eth_8_h_l163_c10_c49b_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l163_c7_5370]
signal counter_MUX_eth_8_h_l163_c7_5370_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l163_c7_5370_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l163_c7_5370_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l163_c7_5370_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l163_c7_5370]
signal state_MUX_eth_8_h_l163_c7_5370_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l163_c7_5370_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l163_c7_5370_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l163_c7_5370_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l167_c9_3866]
signal BIN_OP_PLUS_eth_8_h_l167_c9_3866_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_eth_8_h_l167_c9_3866_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l167_c9_3866_return_output : unsigned(6 downto 0);

-- BIN_OP_EQ[eth_8_h_l172_c11_e9d0]
signal BIN_OP_EQ_eth_8_h_l172_c11_e9d0_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l172_c11_e9d0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l172_c11_e9d0_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l172_c8_a00c]
signal counter_MUX_eth_8_h_l172_c8_a00c_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l172_c8_a00c_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l172_c8_a00c_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l172_c8_a00c_return_output : unsigned(5 downto 0);

-- o_MUX[eth_8_h_l172_c8_a00c]
signal o_MUX_eth_8_h_l172_c8_a00c_cond : unsigned(0 downto 0);
signal o_MUX_eth_8_h_l172_c8_a00c_iftrue : eth_8_tx_t;
signal o_MUX_eth_8_h_l172_c8_a00c_iffalse : eth_8_tx_t;
signal o_MUX_eth_8_h_l172_c8_a00c_return_output : eth_8_tx_t;

-- state_MUX[eth_8_h_l172_c8_a00c]
signal state_MUX_eth_8_h_l172_c8_a00c_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l172_c8_a00c_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l172_c8_a00c_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l172_c8_a00c_return_output : unsigned(2 downto 0);

-- MUX[eth_8_h_l176_c29_102c]
signal MUX_eth_8_h_l176_c29_102c_cond : unsigned(0 downto 0);
signal MUX_eth_8_h_l176_c29_102c_iftrue : unsigned(0 downto 0);
signal MUX_eth_8_h_l176_c29_102c_iffalse : unsigned(0 downto 0);
signal MUX_eth_8_h_l176_c29_102c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[eth_8_h_l179_c8_12dd]
signal BIN_OP_AND_eth_8_h_l179_c8_12dd_left : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l179_c8_12dd_right : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l179_c8_12dd_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l179_c5_63d0]
signal counter_MUX_eth_8_h_l179_c5_63d0_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l179_c5_63d0_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l179_c5_63d0_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l179_c5_63d0_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l179_c5_63d0]
signal state_MUX_eth_8_h_l179_c5_63d0_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l179_c5_63d0_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l179_c5_63d0_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l179_c5_63d0_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l180_c7_b711]
signal counter_MUX_eth_8_h_l180_c7_b711_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l180_c7_b711_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l180_c7_b711_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l180_c7_b711_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l180_c7_b711]
signal state_MUX_eth_8_h_l180_c7_b711_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l180_c7_b711_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l180_c7_b711_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l180_c7_b711_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l182_c9_082a]
signal counter_MUX_eth_8_h_l182_c9_082a_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l182_c9_082a_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l182_c9_082a_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l182_c9_082a_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l182_c9_082a]
signal state_MUX_eth_8_h_l182_c9_082a_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l182_c9_082a_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l182_c9_082a_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l182_c9_082a_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l189_c7_0326]
signal counter_MUX_eth_8_h_l189_c7_0326_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l189_c7_0326_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l189_c7_0326_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l189_c7_0326_return_output : unsigned(5 downto 0);

-- BIN_OP_PLUS[eth_8_h_l190_c9_3121]
signal BIN_OP_PLUS_eth_8_h_l190_c9_3121_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_eth_8_h_l190_c9_3121_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l190_c9_3121_return_output : unsigned(6 downto 0);

-- BIN_OP_EQ[eth_8_h_l195_c11_5875]
signal BIN_OP_EQ_eth_8_h_l195_c11_5875_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l195_c11_5875_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l195_c11_5875_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l195_c8_0893]
signal counter_MUX_eth_8_h_l195_c8_0893_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l195_c8_0893_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l195_c8_0893_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l195_c8_0893_return_output : unsigned(5 downto 0);

-- o_mac_axis_valid_MUX[eth_8_h_l195_c8_0893]
signal o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_cond : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_iftrue : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_iffalse : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_return_output : unsigned(0 downto 0);

-- o_mac_axis_data_tlast_MUX[eth_8_h_l195_c8_0893]
signal o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_cond : unsigned(0 downto 0);
signal o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_iftrue : unsigned(0 downto 0);
signal o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_iffalse : unsigned(0 downto 0);
signal o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_return_output : unsigned(0 downto 0);

-- o_mac_axis_data_tdata_MUX[eth_8_h_l195_c8_0893]
signal o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_cond : unsigned(0 downto 0);
signal o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_iftrue : uint8_t_1;
signal o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_iffalse : uint8_t_1;
signal o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_return_output : uint8_t_1;

-- state_MUX[eth_8_h_l195_c8_0893]
signal state_MUX_eth_8_h_l195_c8_0893_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l195_c8_0893_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l195_c8_0893_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l195_c8_0893_return_output : unsigned(2 downto 0);

-- UNARY_OP_NOT[eth_8_h_l197_c30_5a56]
signal UNARY_OP_NOT_eth_8_h_l197_c30_5a56_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_eth_8_h_l197_c30_5a56_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[eth_8_h_l199_c8_5593]
signal BIN_OP_AND_eth_8_h_l199_c8_5593_left : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l199_c8_5593_right : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l199_c8_5593_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l199_c5_3505]
signal counter_MUX_eth_8_h_l199_c5_3505_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l199_c5_3505_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l199_c5_3505_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l199_c5_3505_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l199_c5_3505]
signal state_MUX_eth_8_h_l199_c5_3505_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l199_c5_3505_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l199_c5_3505_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l199_c5_3505_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l200_c7_5fae]
signal BIN_OP_PLUS_eth_8_h_l200_c7_5fae_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_eth_8_h_l200_c7_5fae_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l200_c7_5fae_return_output : unsigned(6 downto 0);

-- counter_MUX[eth_8_h_l201_c7_3527]
signal counter_MUX_eth_8_h_l201_c7_3527_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l201_c7_3527_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l201_c7_3527_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l201_c7_3527_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l201_c7_3527]
signal state_MUX_eth_8_h_l201_c7_3527_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l201_c7_3527_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l201_c7_3527_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l201_c7_3527_return_output : unsigned(2 downto 0);

function uint48_47_40( x : unsigned) return unsigned is
--variable x : unsigned(47 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(47 downto 40)));
return return_output;
end function;

function CONST_REF_RD_eth_header_t_eth_header_t_e484( ref_toks_0 : eth_header_t;
 ref_toks_1 : unsigned) return eth_header_t is
 
  variable base : eth_header_t; 
  variable return_output : eth_header_t;
begin
      base := ref_toks_0;
      base.dst_mac := ref_toks_1;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3( ref_toks_0 : unsigned) return uint8_t_1 is
 
  variable base : eth_8_tx_t; 
  variable return_output : uint8_t_1;
begin
      base.mac_axis.data.tdata(0) := ref_toks_0;

      return_output := base.mac_axis.data.tdata;
      return return_output; 
end function;

function CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856( ref_toks_0 : eth_8_tx_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : uint8_t_1) return eth_8_tx_t is
 
  variable base : eth_8_tx_t; 
  variable return_output : eth_8_tx_t;
begin
      base := ref_toks_0;
      base.mac_axis.data.tkeep(0) := ref_toks_1;
      base.frame_ready := ref_toks_2;
      base.mac_axis.valid := ref_toks_3;
      base.mac_axis.data.tdata := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb( ref_toks_0 : eth_8_tx_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return eth_8_tx_t is
 
  variable base : eth_8_tx_t; 
  variable return_output : eth_8_tx_t;
begin
      base := ref_toks_0;
      base.mac_axis.data.tkeep(0) := ref_toks_1;
      base.frame_ready := ref_toks_2;
      base.mac_axis.valid := ref_toks_3;
      base.mac_axis.data.tdata(0) := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function uint16_15_8( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(15 downto 8)));
return return_output;
end function;

function CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524( ref_toks_0 : axis8_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return eth_8_tx_t is
 
  variable base : eth_8_tx_t; 
  variable return_output : eth_8_tx_t;
begin
      base.mac_axis.data := ref_toks_0;
      base.mac_axis.data.tlast := ref_toks_1;
      base.mac_axis.valid := ref_toks_2;
      base.frame_ready := ref_toks_3;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_19fe( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : uint8_t_1) return eth_8_tx_t is
 
  variable base : eth_8_tx_t; 
  variable return_output : eth_8_tx_t;
begin
      base.mac_axis.data.tkeep(0) := ref_toks_0;
      base.frame_ready := ref_toks_1;
      base.mac_axis.valid := ref_toks_2;
      base.mac_axis.data.tlast := ref_toks_3;
      base.mac_axis.data.tdata := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_eth_header_t_eth_header_t_325a( ref_toks_0 : eth_header_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return eth_header_t is
 
  variable base : eth_header_t; 
  variable return_output : eth_header_t;
begin
      base := ref_toks_0;
      base.ethertype := ref_toks_1;
      base.src_mac := ref_toks_2;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_LT_eth_8_h_l124_c32_05a2 : 0 clocks latency
BIN_OP_LT_eth_8_h_l124_c32_05a2 : entity work.BIN_OP_LT_uint6_t_uint6_t_0CLK_380ecc95 port map (
BIN_OP_LT_eth_8_h_l124_c32_05a2_left,
BIN_OP_LT_eth_8_h_l124_c32_05a2_right,
BIN_OP_LT_eth_8_h_l124_c32_05a2_return_output);

-- BIN_OP_EQ_eth_8_h_l128_c6_e94c : 0 clocks latency
BIN_OP_EQ_eth_8_h_l128_c6_e94c : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l128_c6_e94c_left,
BIN_OP_EQ_eth_8_h_l128_c6_e94c_right,
BIN_OP_EQ_eth_8_h_l128_c6_e94c_return_output);

-- header_MUX_eth_8_h_l128_c3_78c9 : 0 clocks latency
header_MUX_eth_8_h_l128_c3_78c9 : entity work.MUX_uint1_t_eth_header_t_eth_header_t_0CLK_de264c78 port map (
header_MUX_eth_8_h_l128_c3_78c9_cond,
header_MUX_eth_8_h_l128_c3_78c9_iftrue,
header_MUX_eth_8_h_l128_c3_78c9_iffalse,
header_MUX_eth_8_h_l128_c3_78c9_return_output);

-- counter_MUX_eth_8_h_l128_c3_78c9 : 0 clocks latency
counter_MUX_eth_8_h_l128_c3_78c9 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l128_c3_78c9_cond,
counter_MUX_eth_8_h_l128_c3_78c9_iftrue,
counter_MUX_eth_8_h_l128_c3_78c9_iffalse,
counter_MUX_eth_8_h_l128_c3_78c9_return_output);

-- o_MUX_eth_8_h_l128_c3_78c9 : 0 clocks latency
o_MUX_eth_8_h_l128_c3_78c9 : entity work.MUX_uint1_t_eth_8_tx_t_eth_8_tx_t_0CLK_de264c78 port map (
o_MUX_eth_8_h_l128_c3_78c9_cond,
o_MUX_eth_8_h_l128_c3_78c9_iftrue,
o_MUX_eth_8_h_l128_c3_78c9_iffalse,
o_MUX_eth_8_h_l128_c3_78c9_return_output);

-- state_MUX_eth_8_h_l128_c3_78c9 : 0 clocks latency
state_MUX_eth_8_h_l128_c3_78c9 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l128_c3_78c9_cond,
state_MUX_eth_8_h_l128_c3_78c9_iftrue,
state_MUX_eth_8_h_l128_c3_78c9_iffalse,
state_MUX_eth_8_h_l128_c3_78c9_return_output);

-- header_MUX_eth_8_h_l130_c5_56e3 : 0 clocks latency
header_MUX_eth_8_h_l130_c5_56e3 : entity work.MUX_uint1_t_eth_header_t_eth_header_t_0CLK_de264c78 port map (
header_MUX_eth_8_h_l130_c5_56e3_cond,
header_MUX_eth_8_h_l130_c5_56e3_iftrue,
header_MUX_eth_8_h_l130_c5_56e3_iffalse,
header_MUX_eth_8_h_l130_c5_56e3_return_output);

-- counter_MUX_eth_8_h_l130_c5_56e3 : 0 clocks latency
counter_MUX_eth_8_h_l130_c5_56e3 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l130_c5_56e3_cond,
counter_MUX_eth_8_h_l130_c5_56e3_iftrue,
counter_MUX_eth_8_h_l130_c5_56e3_iffalse,
counter_MUX_eth_8_h_l130_c5_56e3_return_output);

-- o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3 : 0 clocks latency
o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_cond,
o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_iftrue,
o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_iffalse,
o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_return_output);

-- o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3 : 0 clocks latency
o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3 : entity work.MUX_uint1_t_uint8_t_1_uint8_t_1_0CLK_de264c78 port map (
o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_cond,
o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_iftrue,
o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_iffalse,
o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_return_output);

-- state_MUX_eth_8_h_l130_c5_56e3 : 0 clocks latency
state_MUX_eth_8_h_l130_c5_56e3 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l130_c5_56e3_cond,
state_MUX_eth_8_h_l130_c5_56e3_iftrue,
state_MUX_eth_8_h_l130_c5_56e3_iffalse,
state_MUX_eth_8_h_l130_c5_56e3_return_output);

-- BIN_OP_EQ_eth_8_h_l131_c10_188b : 0 clocks latency
BIN_OP_EQ_eth_8_h_l131_c10_188b : entity work.BIN_OP_EQ_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l131_c10_188b_left,
BIN_OP_EQ_eth_8_h_l131_c10_188b_right,
BIN_OP_EQ_eth_8_h_l131_c10_188b_return_output);

-- header_MUX_eth_8_h_l131_c7_8004 : 0 clocks latency
header_MUX_eth_8_h_l131_c7_8004 : entity work.MUX_uint1_t_eth_header_t_eth_header_t_0CLK_de264c78 port map (
header_MUX_eth_8_h_l131_c7_8004_cond,
header_MUX_eth_8_h_l131_c7_8004_iftrue,
header_MUX_eth_8_h_l131_c7_8004_iffalse,
header_MUX_eth_8_h_l131_c7_8004_return_output);

-- header_dst_mac_MUX_eth_8_h_l136_c7_da1f : 0 clocks latency
header_dst_mac_MUX_eth_8_h_l136_c7_da1f : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_dst_mac_MUX_eth_8_h_l136_c7_da1f_cond,
header_dst_mac_MUX_eth_8_h_l136_c7_da1f_iftrue,
header_dst_mac_MUX_eth_8_h_l136_c7_da1f_iffalse,
header_dst_mac_MUX_eth_8_h_l136_c7_da1f_return_output);

-- counter_MUX_eth_8_h_l136_c7_da1f : 0 clocks latency
counter_MUX_eth_8_h_l136_c7_da1f : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l136_c7_da1f_cond,
counter_MUX_eth_8_h_l136_c7_da1f_iftrue,
counter_MUX_eth_8_h_l136_c7_da1f_iffalse,
counter_MUX_eth_8_h_l136_c7_da1f_return_output);

-- state_MUX_eth_8_h_l136_c7_da1f : 0 clocks latency
state_MUX_eth_8_h_l136_c7_da1f : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l136_c7_da1f_cond,
state_MUX_eth_8_h_l136_c7_da1f_iftrue,
state_MUX_eth_8_h_l136_c7_da1f_iffalse,
state_MUX_eth_8_h_l136_c7_da1f_return_output);

-- CONST_SL_8_eth_8_h_l137_c26_f515 : 0 clocks latency
CONST_SL_8_eth_8_h_l137_c26_f515 : entity work.CONST_SL_8_uint48_t_0CLK_de264c78 port map (
CONST_SL_8_eth_8_h_l137_c26_f515_x,
CONST_SL_8_eth_8_h_l137_c26_f515_return_output);

-- BIN_OP_EQ_eth_8_h_l138_c12_aad1 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l138_c12_aad1 : entity work.BIN_OP_EQ_uint6_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l138_c12_aad1_left,
BIN_OP_EQ_eth_8_h_l138_c12_aad1_right,
BIN_OP_EQ_eth_8_h_l138_c12_aad1_return_output);

-- counter_MUX_eth_8_h_l138_c9_eed8 : 0 clocks latency
counter_MUX_eth_8_h_l138_c9_eed8 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l138_c9_eed8_cond,
counter_MUX_eth_8_h_l138_c9_eed8_iftrue,
counter_MUX_eth_8_h_l138_c9_eed8_iffalse,
counter_MUX_eth_8_h_l138_c9_eed8_return_output);

-- state_MUX_eth_8_h_l138_c9_eed8 : 0 clocks latency
state_MUX_eth_8_h_l138_c9_eed8 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l138_c9_eed8_cond,
state_MUX_eth_8_h_l138_c9_eed8_iftrue,
state_MUX_eth_8_h_l138_c9_eed8_iffalse,
state_MUX_eth_8_h_l138_c9_eed8_return_output);

-- BIN_OP_PLUS_eth_8_h_l142_c11_859a : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l142_c11_859a : entity work.BIN_OP_PLUS_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l142_c11_859a_left,
BIN_OP_PLUS_eth_8_h_l142_c11_859a_right,
BIN_OP_PLUS_eth_8_h_l142_c11_859a_return_output);

-- BIN_OP_EQ_eth_8_h_l146_c12_e78f : 0 clocks latency
BIN_OP_EQ_eth_8_h_l146_c12_e78f : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l146_c12_e78f_left,
BIN_OP_EQ_eth_8_h_l146_c12_e78f_right,
BIN_OP_EQ_eth_8_h_l146_c12_e78f_return_output);

-- header_ethertype_MUX_eth_8_h_l146_c9_c265 : 0 clocks latency
header_ethertype_MUX_eth_8_h_l146_c9_c265 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l146_c9_c265_cond,
header_ethertype_MUX_eth_8_h_l146_c9_c265_iftrue,
header_ethertype_MUX_eth_8_h_l146_c9_c265_iffalse,
header_ethertype_MUX_eth_8_h_l146_c9_c265_return_output);

-- header_src_mac_MUX_eth_8_h_l146_c9_c265 : 0 clocks latency
header_src_mac_MUX_eth_8_h_l146_c9_c265 : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_src_mac_MUX_eth_8_h_l146_c9_c265_cond,
header_src_mac_MUX_eth_8_h_l146_c9_c265_iftrue,
header_src_mac_MUX_eth_8_h_l146_c9_c265_iffalse,
header_src_mac_MUX_eth_8_h_l146_c9_c265_return_output);

-- counter_MUX_eth_8_h_l146_c9_c265 : 0 clocks latency
counter_MUX_eth_8_h_l146_c9_c265 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l146_c9_c265_cond,
counter_MUX_eth_8_h_l146_c9_c265_iftrue,
counter_MUX_eth_8_h_l146_c9_c265_iffalse,
counter_MUX_eth_8_h_l146_c9_c265_return_output);

-- o_MUX_eth_8_h_l146_c9_c265 : 0 clocks latency
o_MUX_eth_8_h_l146_c9_c265 : entity work.MUX_uint1_t_eth_8_tx_t_eth_8_tx_t_0CLK_de264c78 port map (
o_MUX_eth_8_h_l146_c9_c265_cond,
o_MUX_eth_8_h_l146_c9_c265_iftrue,
o_MUX_eth_8_h_l146_c9_c265_iffalse,
o_MUX_eth_8_h_l146_c9_c265_return_output);

-- state_MUX_eth_8_h_l146_c9_c265 : 0 clocks latency
state_MUX_eth_8_h_l146_c9_c265 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l146_c9_c265_cond,
state_MUX_eth_8_h_l146_c9_c265_iftrue,
state_MUX_eth_8_h_l146_c9_c265_iffalse,
state_MUX_eth_8_h_l146_c9_c265_return_output);

-- header_src_mac_MUX_eth_8_h_l149_c5_00b7 : 0 clocks latency
header_src_mac_MUX_eth_8_h_l149_c5_00b7 : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_src_mac_MUX_eth_8_h_l149_c5_00b7_cond,
header_src_mac_MUX_eth_8_h_l149_c5_00b7_iftrue,
header_src_mac_MUX_eth_8_h_l149_c5_00b7_iffalse,
header_src_mac_MUX_eth_8_h_l149_c5_00b7_return_output);

-- counter_MUX_eth_8_h_l149_c5_00b7 : 0 clocks latency
counter_MUX_eth_8_h_l149_c5_00b7 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l149_c5_00b7_cond,
counter_MUX_eth_8_h_l149_c5_00b7_iftrue,
counter_MUX_eth_8_h_l149_c5_00b7_iffalse,
counter_MUX_eth_8_h_l149_c5_00b7_return_output);

-- state_MUX_eth_8_h_l149_c5_00b7 : 0 clocks latency
state_MUX_eth_8_h_l149_c5_00b7 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l149_c5_00b7_cond,
state_MUX_eth_8_h_l149_c5_00b7_iftrue,
state_MUX_eth_8_h_l149_c5_00b7_iffalse,
state_MUX_eth_8_h_l149_c5_00b7_return_output);

-- CONST_SL_8_eth_8_h_l150_c24_439a : 0 clocks latency
CONST_SL_8_eth_8_h_l150_c24_439a : entity work.CONST_SL_8_uint48_t_0CLK_de264c78 port map (
CONST_SL_8_eth_8_h_l150_c24_439a_x,
CONST_SL_8_eth_8_h_l150_c24_439a_return_output);

-- BIN_OP_EQ_eth_8_h_l151_c10_5ef8 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l151_c10_5ef8 : entity work.BIN_OP_EQ_uint6_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l151_c10_5ef8_left,
BIN_OP_EQ_eth_8_h_l151_c10_5ef8_right,
BIN_OP_EQ_eth_8_h_l151_c10_5ef8_return_output);

-- counter_MUX_eth_8_h_l151_c7_1168 : 0 clocks latency
counter_MUX_eth_8_h_l151_c7_1168 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l151_c7_1168_cond,
counter_MUX_eth_8_h_l151_c7_1168_iftrue,
counter_MUX_eth_8_h_l151_c7_1168_iffalse,
counter_MUX_eth_8_h_l151_c7_1168_return_output);

-- state_MUX_eth_8_h_l151_c7_1168 : 0 clocks latency
state_MUX_eth_8_h_l151_c7_1168 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l151_c7_1168_cond,
state_MUX_eth_8_h_l151_c7_1168_iftrue,
state_MUX_eth_8_h_l151_c7_1168_iffalse,
state_MUX_eth_8_h_l151_c7_1168_return_output);

-- BIN_OP_PLUS_eth_8_h_l155_c9_6a55 : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l155_c9_6a55 : entity work.BIN_OP_PLUS_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l155_c9_6a55_left,
BIN_OP_PLUS_eth_8_h_l155_c9_6a55_right,
BIN_OP_PLUS_eth_8_h_l155_c9_6a55_return_output);

-- BIN_OP_EQ_eth_8_h_l158_c12_005d : 0 clocks latency
BIN_OP_EQ_eth_8_h_l158_c12_005d : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l158_c12_005d_left,
BIN_OP_EQ_eth_8_h_l158_c12_005d_right,
BIN_OP_EQ_eth_8_h_l158_c12_005d_return_output);

-- header_ethertype_MUX_eth_8_h_l158_c9_8d77 : 0 clocks latency
header_ethertype_MUX_eth_8_h_l158_c9_8d77 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l158_c9_8d77_cond,
header_ethertype_MUX_eth_8_h_l158_c9_8d77_iftrue,
header_ethertype_MUX_eth_8_h_l158_c9_8d77_iffalse,
header_ethertype_MUX_eth_8_h_l158_c9_8d77_return_output);

-- counter_MUX_eth_8_h_l158_c9_8d77 : 0 clocks latency
counter_MUX_eth_8_h_l158_c9_8d77 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l158_c9_8d77_cond,
counter_MUX_eth_8_h_l158_c9_8d77_iftrue,
counter_MUX_eth_8_h_l158_c9_8d77_iffalse,
counter_MUX_eth_8_h_l158_c9_8d77_return_output);

-- o_MUX_eth_8_h_l158_c9_8d77 : 0 clocks latency
o_MUX_eth_8_h_l158_c9_8d77 : entity work.MUX_uint1_t_eth_8_tx_t_eth_8_tx_t_0CLK_de264c78 port map (
o_MUX_eth_8_h_l158_c9_8d77_cond,
o_MUX_eth_8_h_l158_c9_8d77_iftrue,
o_MUX_eth_8_h_l158_c9_8d77_iffalse,
o_MUX_eth_8_h_l158_c9_8d77_return_output);

-- state_MUX_eth_8_h_l158_c9_8d77 : 0 clocks latency
state_MUX_eth_8_h_l158_c9_8d77 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l158_c9_8d77_cond,
state_MUX_eth_8_h_l158_c9_8d77_iftrue,
state_MUX_eth_8_h_l158_c9_8d77_iffalse,
state_MUX_eth_8_h_l158_c9_8d77_return_output);

-- header_ethertype_MUX_eth_8_h_l161_c5_9bfb : 0 clocks latency
header_ethertype_MUX_eth_8_h_l161_c5_9bfb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l161_c5_9bfb_cond,
header_ethertype_MUX_eth_8_h_l161_c5_9bfb_iftrue,
header_ethertype_MUX_eth_8_h_l161_c5_9bfb_iffalse,
header_ethertype_MUX_eth_8_h_l161_c5_9bfb_return_output);

-- counter_MUX_eth_8_h_l161_c5_9bfb : 0 clocks latency
counter_MUX_eth_8_h_l161_c5_9bfb : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l161_c5_9bfb_cond,
counter_MUX_eth_8_h_l161_c5_9bfb_iftrue,
counter_MUX_eth_8_h_l161_c5_9bfb_iffalse,
counter_MUX_eth_8_h_l161_c5_9bfb_return_output);

-- state_MUX_eth_8_h_l161_c5_9bfb : 0 clocks latency
state_MUX_eth_8_h_l161_c5_9bfb : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l161_c5_9bfb_cond,
state_MUX_eth_8_h_l161_c5_9bfb_iftrue,
state_MUX_eth_8_h_l161_c5_9bfb_iffalse,
state_MUX_eth_8_h_l161_c5_9bfb_return_output);

-- CONST_SL_8_eth_8_h_l162_c26_f948 : 0 clocks latency
CONST_SL_8_eth_8_h_l162_c26_f948 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_eth_8_h_l162_c26_f948_x,
CONST_SL_8_eth_8_h_l162_c26_f948_return_output);

-- BIN_OP_EQ_eth_8_h_l163_c10_c49b : 0 clocks latency
BIN_OP_EQ_eth_8_h_l163_c10_c49b : entity work.BIN_OP_EQ_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l163_c10_c49b_left,
BIN_OP_EQ_eth_8_h_l163_c10_c49b_right,
BIN_OP_EQ_eth_8_h_l163_c10_c49b_return_output);

-- counter_MUX_eth_8_h_l163_c7_5370 : 0 clocks latency
counter_MUX_eth_8_h_l163_c7_5370 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l163_c7_5370_cond,
counter_MUX_eth_8_h_l163_c7_5370_iftrue,
counter_MUX_eth_8_h_l163_c7_5370_iffalse,
counter_MUX_eth_8_h_l163_c7_5370_return_output);

-- state_MUX_eth_8_h_l163_c7_5370 : 0 clocks latency
state_MUX_eth_8_h_l163_c7_5370 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l163_c7_5370_cond,
state_MUX_eth_8_h_l163_c7_5370_iftrue,
state_MUX_eth_8_h_l163_c7_5370_iffalse,
state_MUX_eth_8_h_l163_c7_5370_return_output);

-- BIN_OP_PLUS_eth_8_h_l167_c9_3866 : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l167_c9_3866 : entity work.BIN_OP_PLUS_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l167_c9_3866_left,
BIN_OP_PLUS_eth_8_h_l167_c9_3866_right,
BIN_OP_PLUS_eth_8_h_l167_c9_3866_return_output);

-- BIN_OP_EQ_eth_8_h_l172_c11_e9d0 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l172_c11_e9d0 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l172_c11_e9d0_left,
BIN_OP_EQ_eth_8_h_l172_c11_e9d0_right,
BIN_OP_EQ_eth_8_h_l172_c11_e9d0_return_output);

-- counter_MUX_eth_8_h_l172_c8_a00c : 0 clocks latency
counter_MUX_eth_8_h_l172_c8_a00c : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l172_c8_a00c_cond,
counter_MUX_eth_8_h_l172_c8_a00c_iftrue,
counter_MUX_eth_8_h_l172_c8_a00c_iffalse,
counter_MUX_eth_8_h_l172_c8_a00c_return_output);

-- o_MUX_eth_8_h_l172_c8_a00c : 0 clocks latency
o_MUX_eth_8_h_l172_c8_a00c : entity work.MUX_uint1_t_eth_8_tx_t_eth_8_tx_t_0CLK_de264c78 port map (
o_MUX_eth_8_h_l172_c8_a00c_cond,
o_MUX_eth_8_h_l172_c8_a00c_iftrue,
o_MUX_eth_8_h_l172_c8_a00c_iffalse,
o_MUX_eth_8_h_l172_c8_a00c_return_output);

-- state_MUX_eth_8_h_l172_c8_a00c : 0 clocks latency
state_MUX_eth_8_h_l172_c8_a00c : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l172_c8_a00c_cond,
state_MUX_eth_8_h_l172_c8_a00c_iftrue,
state_MUX_eth_8_h_l172_c8_a00c_iffalse,
state_MUX_eth_8_h_l172_c8_a00c_return_output);

-- MUX_eth_8_h_l176_c29_102c : 0 clocks latency
MUX_eth_8_h_l176_c29_102c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_eth_8_h_l176_c29_102c_cond,
MUX_eth_8_h_l176_c29_102c_iftrue,
MUX_eth_8_h_l176_c29_102c_iffalse,
MUX_eth_8_h_l176_c29_102c_return_output);

-- BIN_OP_AND_eth_8_h_l179_c8_12dd : 0 clocks latency
BIN_OP_AND_eth_8_h_l179_c8_12dd : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_eth_8_h_l179_c8_12dd_left,
BIN_OP_AND_eth_8_h_l179_c8_12dd_right,
BIN_OP_AND_eth_8_h_l179_c8_12dd_return_output);

-- counter_MUX_eth_8_h_l179_c5_63d0 : 0 clocks latency
counter_MUX_eth_8_h_l179_c5_63d0 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l179_c5_63d0_cond,
counter_MUX_eth_8_h_l179_c5_63d0_iftrue,
counter_MUX_eth_8_h_l179_c5_63d0_iffalse,
counter_MUX_eth_8_h_l179_c5_63d0_return_output);

-- state_MUX_eth_8_h_l179_c5_63d0 : 0 clocks latency
state_MUX_eth_8_h_l179_c5_63d0 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l179_c5_63d0_cond,
state_MUX_eth_8_h_l179_c5_63d0_iftrue,
state_MUX_eth_8_h_l179_c5_63d0_iffalse,
state_MUX_eth_8_h_l179_c5_63d0_return_output);

-- counter_MUX_eth_8_h_l180_c7_b711 : 0 clocks latency
counter_MUX_eth_8_h_l180_c7_b711 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l180_c7_b711_cond,
counter_MUX_eth_8_h_l180_c7_b711_iftrue,
counter_MUX_eth_8_h_l180_c7_b711_iffalse,
counter_MUX_eth_8_h_l180_c7_b711_return_output);

-- state_MUX_eth_8_h_l180_c7_b711 : 0 clocks latency
state_MUX_eth_8_h_l180_c7_b711 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l180_c7_b711_cond,
state_MUX_eth_8_h_l180_c7_b711_iftrue,
state_MUX_eth_8_h_l180_c7_b711_iffalse,
state_MUX_eth_8_h_l180_c7_b711_return_output);

-- counter_MUX_eth_8_h_l182_c9_082a : 0 clocks latency
counter_MUX_eth_8_h_l182_c9_082a : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l182_c9_082a_cond,
counter_MUX_eth_8_h_l182_c9_082a_iftrue,
counter_MUX_eth_8_h_l182_c9_082a_iffalse,
counter_MUX_eth_8_h_l182_c9_082a_return_output);

-- state_MUX_eth_8_h_l182_c9_082a : 0 clocks latency
state_MUX_eth_8_h_l182_c9_082a : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l182_c9_082a_cond,
state_MUX_eth_8_h_l182_c9_082a_iftrue,
state_MUX_eth_8_h_l182_c9_082a_iffalse,
state_MUX_eth_8_h_l182_c9_082a_return_output);

-- counter_MUX_eth_8_h_l189_c7_0326 : 0 clocks latency
counter_MUX_eth_8_h_l189_c7_0326 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l189_c7_0326_cond,
counter_MUX_eth_8_h_l189_c7_0326_iftrue,
counter_MUX_eth_8_h_l189_c7_0326_iffalse,
counter_MUX_eth_8_h_l189_c7_0326_return_output);

-- BIN_OP_PLUS_eth_8_h_l190_c9_3121 : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l190_c9_3121 : entity work.BIN_OP_PLUS_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l190_c9_3121_left,
BIN_OP_PLUS_eth_8_h_l190_c9_3121_right,
BIN_OP_PLUS_eth_8_h_l190_c9_3121_return_output);

-- BIN_OP_EQ_eth_8_h_l195_c11_5875 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l195_c11_5875 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l195_c11_5875_left,
BIN_OP_EQ_eth_8_h_l195_c11_5875_right,
BIN_OP_EQ_eth_8_h_l195_c11_5875_return_output);

-- counter_MUX_eth_8_h_l195_c8_0893 : 0 clocks latency
counter_MUX_eth_8_h_l195_c8_0893 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l195_c8_0893_cond,
counter_MUX_eth_8_h_l195_c8_0893_iftrue,
counter_MUX_eth_8_h_l195_c8_0893_iffalse,
counter_MUX_eth_8_h_l195_c8_0893_return_output);

-- o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893 : 0 clocks latency
o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_cond,
o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_iftrue,
o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_iffalse,
o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_return_output);

-- o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893 : 0 clocks latency
o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_cond,
o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_iftrue,
o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_iffalse,
o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_return_output);

-- o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893 : 0 clocks latency
o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893 : entity work.MUX_uint1_t_uint8_t_1_uint8_t_1_0CLK_de264c78 port map (
o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_cond,
o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_iftrue,
o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_iffalse,
o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_return_output);

-- state_MUX_eth_8_h_l195_c8_0893 : 0 clocks latency
state_MUX_eth_8_h_l195_c8_0893 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l195_c8_0893_cond,
state_MUX_eth_8_h_l195_c8_0893_iftrue,
state_MUX_eth_8_h_l195_c8_0893_iffalse,
state_MUX_eth_8_h_l195_c8_0893_return_output);

-- UNARY_OP_NOT_eth_8_h_l197_c30_5a56 : 0 clocks latency
UNARY_OP_NOT_eth_8_h_l197_c30_5a56 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_eth_8_h_l197_c30_5a56_expr,
UNARY_OP_NOT_eth_8_h_l197_c30_5a56_return_output);

-- BIN_OP_AND_eth_8_h_l199_c8_5593 : 0 clocks latency
BIN_OP_AND_eth_8_h_l199_c8_5593 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_eth_8_h_l199_c8_5593_left,
BIN_OP_AND_eth_8_h_l199_c8_5593_right,
BIN_OP_AND_eth_8_h_l199_c8_5593_return_output);

-- counter_MUX_eth_8_h_l199_c5_3505 : 0 clocks latency
counter_MUX_eth_8_h_l199_c5_3505 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l199_c5_3505_cond,
counter_MUX_eth_8_h_l199_c5_3505_iftrue,
counter_MUX_eth_8_h_l199_c5_3505_iffalse,
counter_MUX_eth_8_h_l199_c5_3505_return_output);

-- state_MUX_eth_8_h_l199_c5_3505 : 0 clocks latency
state_MUX_eth_8_h_l199_c5_3505 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l199_c5_3505_cond,
state_MUX_eth_8_h_l199_c5_3505_iftrue,
state_MUX_eth_8_h_l199_c5_3505_iffalse,
state_MUX_eth_8_h_l199_c5_3505_return_output);

-- BIN_OP_PLUS_eth_8_h_l200_c7_5fae : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l200_c7_5fae : entity work.BIN_OP_PLUS_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l200_c7_5fae_left,
BIN_OP_PLUS_eth_8_h_l200_c7_5fae_right,
BIN_OP_PLUS_eth_8_h_l200_c7_5fae_return_output);

-- counter_MUX_eth_8_h_l201_c7_3527 : 0 clocks latency
counter_MUX_eth_8_h_l201_c7_3527 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l201_c7_3527_cond,
counter_MUX_eth_8_h_l201_c7_3527_iftrue,
counter_MUX_eth_8_h_l201_c7_3527_iffalse,
counter_MUX_eth_8_h_l201_c7_3527_return_output);

-- state_MUX_eth_8_h_l201_c7_3527 : 0 clocks latency
state_MUX_eth_8_h_l201_c7_3527 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l201_c7_3527_cond,
state_MUX_eth_8_h_l201_c7_3527_iftrue,
state_MUX_eth_8_h_l201_c7_3527_iffalse,
state_MUX_eth_8_h_l201_c7_3527_return_output);



-- Resolve what clock enable to use for user logic
clk_en_internal <= CLOCK_ENABLE(0);
-- Combinatorial process for pipeline stages
process (
CLOCK_ENABLE,
clk_en_internal,
 -- Inputs
 frame,
 mac_axis_ready,
 -- Registers
 state,
 header,
 counter,
 -- All submodule outputs
 BIN_OP_LT_eth_8_h_l124_c32_05a2_return_output,
 BIN_OP_EQ_eth_8_h_l128_c6_e94c_return_output,
 header_MUX_eth_8_h_l128_c3_78c9_return_output,
 counter_MUX_eth_8_h_l128_c3_78c9_return_output,
 o_MUX_eth_8_h_l128_c3_78c9_return_output,
 state_MUX_eth_8_h_l128_c3_78c9_return_output,
 header_MUX_eth_8_h_l130_c5_56e3_return_output,
 counter_MUX_eth_8_h_l130_c5_56e3_return_output,
 o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_return_output,
 o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_return_output,
 state_MUX_eth_8_h_l130_c5_56e3_return_output,
 BIN_OP_EQ_eth_8_h_l131_c10_188b_return_output,
 header_MUX_eth_8_h_l131_c7_8004_return_output,
 header_dst_mac_MUX_eth_8_h_l136_c7_da1f_return_output,
 counter_MUX_eth_8_h_l136_c7_da1f_return_output,
 state_MUX_eth_8_h_l136_c7_da1f_return_output,
 CONST_SL_8_eth_8_h_l137_c26_f515_return_output,
 BIN_OP_EQ_eth_8_h_l138_c12_aad1_return_output,
 counter_MUX_eth_8_h_l138_c9_eed8_return_output,
 state_MUX_eth_8_h_l138_c9_eed8_return_output,
 BIN_OP_PLUS_eth_8_h_l142_c11_859a_return_output,
 BIN_OP_EQ_eth_8_h_l146_c12_e78f_return_output,
 header_ethertype_MUX_eth_8_h_l146_c9_c265_return_output,
 header_src_mac_MUX_eth_8_h_l146_c9_c265_return_output,
 counter_MUX_eth_8_h_l146_c9_c265_return_output,
 o_MUX_eth_8_h_l146_c9_c265_return_output,
 state_MUX_eth_8_h_l146_c9_c265_return_output,
 header_src_mac_MUX_eth_8_h_l149_c5_00b7_return_output,
 counter_MUX_eth_8_h_l149_c5_00b7_return_output,
 state_MUX_eth_8_h_l149_c5_00b7_return_output,
 CONST_SL_8_eth_8_h_l150_c24_439a_return_output,
 BIN_OP_EQ_eth_8_h_l151_c10_5ef8_return_output,
 counter_MUX_eth_8_h_l151_c7_1168_return_output,
 state_MUX_eth_8_h_l151_c7_1168_return_output,
 BIN_OP_PLUS_eth_8_h_l155_c9_6a55_return_output,
 BIN_OP_EQ_eth_8_h_l158_c12_005d_return_output,
 header_ethertype_MUX_eth_8_h_l158_c9_8d77_return_output,
 counter_MUX_eth_8_h_l158_c9_8d77_return_output,
 o_MUX_eth_8_h_l158_c9_8d77_return_output,
 state_MUX_eth_8_h_l158_c9_8d77_return_output,
 header_ethertype_MUX_eth_8_h_l161_c5_9bfb_return_output,
 counter_MUX_eth_8_h_l161_c5_9bfb_return_output,
 state_MUX_eth_8_h_l161_c5_9bfb_return_output,
 CONST_SL_8_eth_8_h_l162_c26_f948_return_output,
 BIN_OP_EQ_eth_8_h_l163_c10_c49b_return_output,
 counter_MUX_eth_8_h_l163_c7_5370_return_output,
 state_MUX_eth_8_h_l163_c7_5370_return_output,
 BIN_OP_PLUS_eth_8_h_l167_c9_3866_return_output,
 BIN_OP_EQ_eth_8_h_l172_c11_e9d0_return_output,
 counter_MUX_eth_8_h_l172_c8_a00c_return_output,
 o_MUX_eth_8_h_l172_c8_a00c_return_output,
 state_MUX_eth_8_h_l172_c8_a00c_return_output,
 MUX_eth_8_h_l176_c29_102c_return_output,
 BIN_OP_AND_eth_8_h_l179_c8_12dd_return_output,
 counter_MUX_eth_8_h_l179_c5_63d0_return_output,
 state_MUX_eth_8_h_l179_c5_63d0_return_output,
 counter_MUX_eth_8_h_l180_c7_b711_return_output,
 state_MUX_eth_8_h_l180_c7_b711_return_output,
 counter_MUX_eth_8_h_l182_c9_082a_return_output,
 state_MUX_eth_8_h_l182_c9_082a_return_output,
 counter_MUX_eth_8_h_l189_c7_0326_return_output,
 BIN_OP_PLUS_eth_8_h_l190_c9_3121_return_output,
 BIN_OP_EQ_eth_8_h_l195_c11_5875_return_output,
 counter_MUX_eth_8_h_l195_c8_0893_return_output,
 o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_return_output,
 o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_return_output,
 o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_return_output,
 state_MUX_eth_8_h_l195_c8_0893_return_output,
 UNARY_OP_NOT_eth_8_h_l197_c30_5a56_return_output,
 BIN_OP_AND_eth_8_h_l199_c8_5593_return_output,
 counter_MUX_eth_8_h_l199_c5_3505_return_output,
 state_MUX_eth_8_h_l199_c5_3505_return_output,
 BIN_OP_PLUS_eth_8_h_l200_c7_5fae_return_output,
 counter_MUX_eth_8_h_l201_c7_3527_return_output,
 state_MUX_eth_8_h_l201_c7_3527_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eth_8_tx_t;
 variable VAR_frame : eth8_frame_t_stream_t;
 variable VAR_mac_axis_ready : unsigned(0 downto 0);
 variable VAR_o : eth_8_tx_t;
 variable VAR_undersized_payload : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_eth_8_h_l124_c32_05a2_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_LT_eth_8_h_l124_c32_05a2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_LT_eth_8_h_l124_c32_05a2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l128_c6_e94c_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l128_c6_e94c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l128_c6_e94c_return_output : unsigned(0 downto 0);
 variable VAR_header_MUX_eth_8_h_l128_c3_78c9_iftrue : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l130_c5_56e3_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l128_c3_78c9_iffalse : eth_header_t;
 variable VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a_eth_8_h_l128_c3_78c9_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l128_c3_78c9_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l128_c3_78c9_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l128_c3_78c9_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l130_c5_56e3_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l128_c3_78c9_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l146_c9_c265_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l128_c3_78c9_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l128_c3_78c9_cond : unsigned(0 downto 0);
 variable VAR_o_MUX_eth_8_h_l128_c3_78c9_iftrue : eth_8_tx_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856_eth_8_h_l128_c3_78c9_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l128_c3_78c9_iffalse : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l146_c9_c265_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l128_c3_78c9_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l128_c3_78c9_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l128_c3_78c9_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l130_c5_56e3_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l128_c3_78c9_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l146_c9_c265_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l128_c3_78c9_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l128_c3_78c9_cond : unsigned(0 downto 0);
 variable VAR_header_MUX_eth_8_h_l130_c5_56e3_iftrue : eth_header_t;
 variable VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l130_c5_56e3_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l130_c5_56e3_iffalse : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l130_c5_56e3_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l130_c5_56e3_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l136_c7_da1f_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l130_c5_56e3_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l130_c5_56e3_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_iftrue : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_iffalse : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_return_output : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_iftrue : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l130_c5_56e3_return_output : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_iffalse : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_return_output : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l130_c5_56e3_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l136_c7_da1f_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l130_c5_56e3_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l130_c5_56e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l131_c10_188b_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l131_c10_188b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l131_c10_188b_return_output : unsigned(0 downto 0);
 variable VAR_header_MUX_eth_8_h_l131_c7_8004_iftrue : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l131_c7_8004_iffalse : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l131_c7_8004_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l131_c7_8004_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d_eth_8_h_l132_c18_7a56_return_output : eth_header_t;
 variable VAR_uint48_47_40_eth_8_h_l135_c34_dcbc_return_output : unsigned(7 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l136_c7_da1f_iftrue : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l136_c7_da1f_iffalse : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l136_c7_da1f_return_output : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l136_c7_da1f_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l136_c7_da1f_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l138_c9_eed8_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l136_c7_da1f_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l136_c7_da1f_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l136_c7_da1f_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l138_c9_eed8_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l136_c7_da1f_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l136_c7_da1f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l137_c26_f515_return_output : unsigned(47 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l137_c26_f515_x : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l138_c12_aad1_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l138_c12_aad1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l138_c12_aad1_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l138_c9_eed8_iftrue : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l140_c11_d5e9 : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l138_c9_eed8_iffalse : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l142_c11_bf2c : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l138_c9_eed8_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l138_c9_eed8_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l138_c9_eed8_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l138_c9_eed8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l142_c11_859a_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l142_c11_859a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l142_c11_859a_return_output : unsigned(6 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l146_c12_e78f_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l146_c12_e78f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l146_c12_e78f_return_output : unsigned(0 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l146_c9_c265_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l146_c9_c265_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l158_c9_8d77_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l146_c9_c265_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l146_c9_c265_cond : unsigned(0 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l146_c9_c265_iftrue : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l149_c5_00b7_return_output : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l146_c9_c265_iffalse : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l146_c9_c265_return_output : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l146_c9_c265_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l146_c9_c265_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l149_c5_00b7_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l146_c9_c265_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l158_c9_8d77_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l146_c9_c265_cond : unsigned(0 downto 0);
 variable VAR_o_MUX_eth_8_h_l146_c9_c265_iftrue : eth_8_tx_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l146_c9_c265_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l146_c9_c265_iffalse : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l158_c9_8d77_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l146_c9_c265_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l146_c9_c265_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l149_c5_00b7_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l146_c9_c265_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l158_c9_8d77_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l146_c9_c265_cond : unsigned(0 downto 0);
 variable VAR_uint48_47_40_eth_8_h_l148_c32_a710_return_output : unsigned(7 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l149_c5_00b7_iftrue : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l149_c5_00b7_iffalse : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l149_c5_00b7_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l149_c5_00b7_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l151_c7_1168_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l149_c5_00b7_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l149_c5_00b7_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l149_c5_00b7_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l151_c7_1168_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l149_c5_00b7_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l149_c5_00b7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l150_c24_439a_return_output : unsigned(47 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l150_c24_439a_x : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l151_c10_5ef8_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l151_c10_5ef8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l151_c10_5ef8_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l151_c7_1168_iftrue : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l153_c9_4dce : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l151_c7_1168_iffalse : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l155_c9_ebeb : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l151_c7_1168_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l151_c7_1168_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l151_c7_1168_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l151_c7_1168_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l155_c9_6a55_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l155_c9_6a55_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l155_c9_6a55_return_output : unsigned(6 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l158_c12_005d_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l158_c12_005d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l158_c12_005d_return_output : unsigned(0 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l158_c9_8d77_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l161_c5_9bfb_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l158_c9_8d77_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l158_c9_8d77_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l158_c9_8d77_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l161_c5_9bfb_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l158_c9_8d77_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l172_c8_a00c_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l158_c9_8d77_cond : unsigned(0 downto 0);
 variable VAR_o_MUX_eth_8_h_l158_c9_8d77_iftrue : eth_8_tx_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l158_c9_8d77_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l158_c9_8d77_iffalse : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l172_c8_a00c_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l158_c9_8d77_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l158_c9_8d77_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l161_c5_9bfb_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l158_c9_8d77_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l172_c8_a00c_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l158_c9_8d77_cond : unsigned(0 downto 0);
 variable VAR_uint16_15_8_eth_8_h_l160_c32_58fc_return_output : unsigned(7 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l161_c5_9bfb_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l161_c5_9bfb_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l161_c5_9bfb_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l161_c5_9bfb_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l163_c7_5370_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l161_c5_9bfb_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l161_c5_9bfb_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l161_c5_9bfb_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l163_c7_5370_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l161_c5_9bfb_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l161_c5_9bfb_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l162_c26_f948_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l162_c26_f948_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l163_c10_c49b_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l163_c10_c49b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l163_c10_c49b_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l163_c7_5370_iftrue : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l165_c9_e1fb : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l163_c7_5370_iffalse : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l167_c9_16fb : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l163_c7_5370_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l163_c7_5370_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l163_c7_5370_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l163_c7_5370_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l167_c9_3866_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l167_c9_3866_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l167_c9_3866_return_output : unsigned(6 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l172_c11_e9d0_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l172_c11_e9d0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l172_c11_e9d0_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l172_c8_a00c_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l179_c5_63d0_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l172_c8_a00c_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l195_c8_0893_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l172_c8_a00c_cond : unsigned(0 downto 0);
 variable VAR_o_MUX_eth_8_h_l172_c8_a00c_iftrue : eth_8_tx_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524_eth_8_h_l172_c8_a00c_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l172_c8_a00c_iffalse : eth_8_tx_t;
 variable VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_19fe_eth_8_h_l172_c8_a00c_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l172_c8_a00c_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l172_c8_a00c_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l179_c5_63d0_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l172_c8_a00c_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l195_c8_0893_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l172_c8_a00c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d_eth_8_h_l174_c23_64a3_return_output : axis8_t;
 variable VAR_MUX_eth_8_h_l176_c29_102c_cond : unsigned(0 downto 0);
 variable VAR_MUX_eth_8_h_l176_c29_102c_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_eth_8_h_l176_c29_102c_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_eth_8_h_l176_c29_102c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l179_c8_12dd_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l179_c8_12dd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l179_c8_12dd_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l179_c5_63d0_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l189_c7_0326_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l179_c5_63d0_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l179_c5_63d0_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l179_c5_63d0_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l180_c7_b711_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l179_c5_63d0_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l179_c5_63d0_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l180_c7_b711_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l182_c9_082a_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l180_c7_b711_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l180_c7_b711_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l180_c7_b711_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l180_c7_b711_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l182_c9_082a_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l180_c7_b711_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l180_c7_b711_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l182_c9_082a_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l182_c9_082a_iffalse : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l186_c11_09f1 : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l182_c9_082a_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l182_c9_082a_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l182_c9_082a_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l182_c9_082a_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l189_c7_0326_iftrue : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l190_c9_7e00 : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l189_c7_0326_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l189_c7_0326_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l190_c9_3121_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l190_c9_3121_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l190_c9_3121_return_output : unsigned(6 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l195_c11_5875_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l195_c11_5875_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l195_c11_5875_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l195_c8_0893_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l199_c5_3505_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l195_c8_0893_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l195_c8_0893_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_iftrue : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_iffalse : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_return_output : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_iftrue : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_iffalse : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_eth_8_tx_t_mac_axis_data_tlast_d41d_eth_8_h_l195_c8_0893_return_output : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_return_output : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_iftrue : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l195_c8_0893_return_output : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_iffalse : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_return_output : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l195_c8_0893_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l199_c5_3505_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l195_c8_0893_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l195_c8_0893_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tdata_0_eth_8_h_l196_c5_de5a : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_eth_8_h_l197_c30_5a56_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_eth_8_h_l197_c30_5a56_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l199_c8_5593_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l199_c8_5593_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l199_c8_5593_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l199_c5_3505_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l201_c7_3527_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l199_c5_3505_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l199_c5_3505_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l199_c5_3505_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l201_c7_3527_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l199_c5_3505_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l199_c5_3505_cond : unsigned(0 downto 0);
 variable VAR_counter_eth_8_h_l200_c7_5e13 : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l200_c7_5fae_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l200_c7_5fae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l200_c7_5fae_return_output : unsigned(6 downto 0);
 variable VAR_counter_MUX_eth_8_h_l201_c7_3527_iftrue : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l203_c9_8eee : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l201_c7_3527_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l201_c7_3527_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l201_c7_3527_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l201_c7_3527_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l201_c7_3527_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_d80c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l135_l136_l137_DUPLICATE_4065_return_output : unsigned(47 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_d41d_eth_8_h_l130_l195_DUPLICATE_6ecc_return_output : uint8_t_1;
 variable VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l146_l150_l148_l149_DUPLICATE_38ca_return_output : unsigned(47 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l146_l160_l161_l162_l158_DUPLICATE_4f7d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l180_l176_DUPLICATE_6c0a_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_state : unsigned(2 downto 0);
variable REG_VAR_header : eth_header_t;
variable REG_VAR_counter : unsigned(5 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_state := state;
  REG_VAR_header := header;
  REG_VAR_counter := counter;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_counter_eth_8_h_l186_c11_09f1 := resize(to_unsigned(0, 1), 6);
     VAR_counter_MUX_eth_8_h_l182_c9_082a_iffalse := VAR_counter_eth_8_h_l186_c11_09f1;
     VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_eth_8_h_l151_c10_5ef8_right := to_unsigned(5, 3);
     VAR_state_MUX_eth_8_h_l138_c9_eed8_iftrue := unsigned(eth8_state_t_to_slv(SRC_MAC));
     VAR_BIN_OP_EQ_eth_8_h_l158_c12_005d_right := unsigned(eth8_state_t_to_slv(LEN_TYPE));
     VAR_BIN_OP_AND_eth_8_h_l199_c8_5593_left := to_unsigned(1, 1);
     VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_iftrue := to_unsigned(1, 1);
     VAR_counter_eth_8_h_l203_c9_8eee := resize(to_unsigned(0, 1), 6);
     VAR_counter_MUX_eth_8_h_l201_c7_3527_iftrue := VAR_counter_eth_8_h_l203_c9_8eee;
     VAR_BIN_OP_EQ_eth_8_h_l195_c11_5875_right := unsigned(eth8_state_t_to_slv(PADDING));
     VAR_state_MUX_eth_8_h_l163_c7_5370_iftrue := unsigned(eth8_state_t_to_slv(PAYLOAD));
     VAR_state_MUX_eth_8_h_l201_c7_3527_iftrue := unsigned(eth8_state_t_to_slv(IDLE_DST_MAC));
     VAR_state_MUX_eth_8_h_l151_c7_1168_iftrue := unsigned(eth8_state_t_to_slv(LEN_TYPE));
     VAR_BIN_OP_PLUS_eth_8_h_l142_c11_859a_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_eth_8_h_l167_c9_3866_right := to_unsigned(1, 1);
     VAR_state_MUX_eth_8_h_l182_c9_082a_iffalse := unsigned(eth8_state_t_to_slv(IDLE_DST_MAC));
     VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_iffalse := to_unsigned(0, 1);
     VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_LT_eth_8_h_l124_c32_05a2_right := to_unsigned(45, 6);
     VAR_BIN_OP_EQ_eth_8_h_l172_c11_e9d0_right := unsigned(eth8_state_t_to_slv(PAYLOAD));
     VAR_o_mac_axis_data_tdata_0_eth_8_h_l196_c5_de5a := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_eth_8_h_l128_c6_e94c_right := unsigned(eth8_state_t_to_slv(IDLE_DST_MAC));
     VAR_BIN_OP_EQ_eth_8_h_l163_c10_c49b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_eth_8_h_l138_c12_aad1_right := to_unsigned(5, 3);
     VAR_MUX_eth_8_h_l176_c29_102c_iftrue := to_unsigned(0, 1);
     VAR_counter_eth_8_h_l165_c9_e1fb := resize(to_unsigned(0, 1), 6);
     VAR_counter_MUX_eth_8_h_l163_c7_5370_iftrue := VAR_counter_eth_8_h_l165_c9_e1fb;
     VAR_BIN_OP_PLUS_eth_8_h_l155_c9_6a55_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_eth_8_h_l131_c10_188b_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_eth_8_h_l200_c7_5fae_right := to_unsigned(1, 1);
     VAR_counter_eth_8_h_l140_c11_d5e9 := resize(to_unsigned(0, 1), 6);
     VAR_counter_MUX_eth_8_h_l138_c9_eed8_iftrue := VAR_counter_eth_8_h_l140_c11_d5e9;
     VAR_counter_eth_8_h_l153_c9_4dce := resize(to_unsigned(0, 1), 6);
     VAR_counter_MUX_eth_8_h_l151_c7_1168_iftrue := VAR_counter_eth_8_h_l153_c9_4dce;
     VAR_BIN_OP_PLUS_eth_8_h_l190_c9_3121_right := to_unsigned(1, 1);
     VAR_state_MUX_eth_8_h_l182_c9_082a_iftrue := unsigned(eth8_state_t_to_slv(PADDING));
     VAR_BIN_OP_EQ_eth_8_h_l146_c12_e78f_right := unsigned(eth8_state_t_to_slv(SRC_MAC));
     -- CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_d41d_eth_8_h_l130_l195_DUPLICATE_6ecc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_d41d_eth_8_h_l130_l195_DUPLICATE_6ecc_return_output := eth_8_tx_t_NULL.mac_axis.data.tdata;

     -- o_mac_axis_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_eth_8_tx_t_mac_axis_data_tlast_d41d[eth_8_h_l195_c8_0893] LATENCY=0
     VAR_o_mac_axis_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_eth_8_tx_t_mac_axis_data_tlast_d41d_eth_8_h_l195_c8_0893_return_output := eth_8_tx_t_NULL.mac_axis.data.tlast;

     -- o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3[eth_8_h_l195_c8_0893] LATENCY=0
     VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l195_c8_0893_return_output := CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3(
     VAR_o_mac_axis_data_tdata_0_eth_8_h_l196_c5_de5a);

     -- Submodule level 1
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_iftrue := VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l195_c8_0893_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_iffalse := VAR_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_d41d_eth_8_h_l130_l195_DUPLICATE_6ecc_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_iffalse := VAR_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_d41d_eth_8_h_l130_l195_DUPLICATE_6ecc_return_output;
     VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_iffalse := VAR_o_mac_axis_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_eth_8_tx_t_mac_axis_data_tlast_d41d_eth_8_h_l195_c8_0893_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;
     -- Mux in inputs
     VAR_frame := frame;
     VAR_mac_axis_ready := mac_axis_ready;

     -- Submodule level 0
     VAR_BIN_OP_EQ_eth_8_h_l131_c10_188b_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l138_c12_aad1_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l151_c10_5ef8_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l163_c10_c49b_left := counter;
     VAR_BIN_OP_LT_eth_8_h_l124_c32_05a2_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l142_c11_859a_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l155_c9_6a55_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l167_c9_3866_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l200_c7_5fae_left := counter;
     VAR_counter_MUX_eth_8_h_l130_c5_56e3_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l136_c7_da1f_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l149_c5_00b7_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l161_c5_9bfb_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l179_c5_63d0_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l180_c7_b711_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l182_c9_082a_iftrue := counter;
     VAR_counter_MUX_eth_8_h_l195_c8_0893_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l199_c5_3505_iffalse := counter;
     VAR_header_MUX_eth_8_h_l130_c5_56e3_iffalse := header;
     VAR_header_MUX_eth_8_h_l131_c7_8004_iffalse := header;
     VAR_BIN_OP_AND_eth_8_h_l179_c8_12dd_right := VAR_mac_axis_ready;
     VAR_BIN_OP_AND_eth_8_h_l199_c8_5593_right := VAR_mac_axis_ready;
     VAR_counter_MUX_eth_8_h_l136_c7_da1f_cond := VAR_mac_axis_ready;
     VAR_counter_MUX_eth_8_h_l149_c5_00b7_cond := VAR_mac_axis_ready;
     VAR_counter_MUX_eth_8_h_l161_c5_9bfb_cond := VAR_mac_axis_ready;
     VAR_header_dst_mac_MUX_eth_8_h_l136_c7_da1f_cond := VAR_mac_axis_ready;
     VAR_header_ethertype_MUX_eth_8_h_l161_c5_9bfb_cond := VAR_mac_axis_ready;
     VAR_header_src_mac_MUX_eth_8_h_l149_c5_00b7_cond := VAR_mac_axis_ready;
     VAR_state_MUX_eth_8_h_l136_c7_da1f_cond := VAR_mac_axis_ready;
     VAR_state_MUX_eth_8_h_l149_c5_00b7_cond := VAR_mac_axis_ready;
     VAR_state_MUX_eth_8_h_l161_c5_9bfb_cond := VAR_mac_axis_ready;
     VAR_BIN_OP_EQ_eth_8_h_l128_c6_e94c_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l146_c12_e78f_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l158_c12_005d_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l172_c11_e9d0_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l195_c11_5875_left := state;
     VAR_state_MUX_eth_8_h_l130_c5_56e3_iffalse := state;
     VAR_state_MUX_eth_8_h_l136_c7_da1f_iffalse := state;
     VAR_state_MUX_eth_8_h_l138_c9_eed8_iffalse := state;
     VAR_state_MUX_eth_8_h_l149_c5_00b7_iffalse := state;
     VAR_state_MUX_eth_8_h_l151_c7_1168_iffalse := state;
     VAR_state_MUX_eth_8_h_l161_c5_9bfb_iffalse := state;
     VAR_state_MUX_eth_8_h_l163_c7_5370_iffalse := state;
     VAR_state_MUX_eth_8_h_l179_c5_63d0_iffalse := state;
     VAR_state_MUX_eth_8_h_l180_c7_b711_iffalse := state;
     VAR_state_MUX_eth_8_h_l195_c8_0893_iffalse := state;
     VAR_state_MUX_eth_8_h_l199_c5_3505_iffalse := state;
     VAR_state_MUX_eth_8_h_l201_c7_3527_iffalse := state;
     -- BIN_OP_EQ[eth_8_h_l128_c6_e94c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l128_c6_e94c_left <= VAR_BIN_OP_EQ_eth_8_h_l128_c6_e94c_left;
     BIN_OP_EQ_eth_8_h_l128_c6_e94c_right <= VAR_BIN_OP_EQ_eth_8_h_l128_c6_e94c_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l128_c6_e94c_return_output := BIN_OP_EQ_eth_8_h_l128_c6_e94c_return_output;

     -- BIN_OP_EQ[eth_8_h_l195_c11_5875] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l195_c11_5875_left <= VAR_BIN_OP_EQ_eth_8_h_l195_c11_5875_left;
     BIN_OP_EQ_eth_8_h_l195_c11_5875_right <= VAR_BIN_OP_EQ_eth_8_h_l195_c11_5875_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l195_c11_5875_return_output := BIN_OP_EQ_eth_8_h_l195_c11_5875_return_output;

     -- CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l146_l160_l161_l162_l158_DUPLICATE_4f7d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l146_l160_l161_l162_l158_DUPLICATE_4f7d_return_output := header.ethertype;

     -- CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d[eth_8_h_l132_c18_7a56] LATENCY=0
     VAR_CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d_eth_8_h_l132_c18_7a56_return_output := VAR_frame.data.header;

     -- CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l180_l176_DUPLICATE_6c0a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l180_l176_DUPLICATE_6c0a_return_output := VAR_frame.data.payload.tlast;

     -- BIN_OP_PLUS[eth_8_h_l167_c9_3866] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l167_c9_3866_left <= VAR_BIN_OP_PLUS_eth_8_h_l167_c9_3866_left;
     BIN_OP_PLUS_eth_8_h_l167_c9_3866_right <= VAR_BIN_OP_PLUS_eth_8_h_l167_c9_3866_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l167_c9_3866_return_output := BIN_OP_PLUS_eth_8_h_l167_c9_3866_return_output;

     -- BIN_OP_EQ[eth_8_h_l146_c12_e78f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l146_c12_e78f_left <= VAR_BIN_OP_EQ_eth_8_h_l146_c12_e78f_left;
     BIN_OP_EQ_eth_8_h_l146_c12_e78f_right <= VAR_BIN_OP_EQ_eth_8_h_l146_c12_e78f_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l146_c12_e78f_return_output := BIN_OP_EQ_eth_8_h_l146_c12_e78f_return_output;

     -- CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_d80c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_d80c_return_output := VAR_frame.valid;

     -- CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l146_l150_l148_l149_DUPLICATE_38ca LATENCY=0
     VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l146_l150_l148_l149_DUPLICATE_38ca_return_output := header.src_mac;

     -- BIN_OP_EQ[eth_8_h_l131_c10_188b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l131_c10_188b_left <= VAR_BIN_OP_EQ_eth_8_h_l131_c10_188b_left;
     BIN_OP_EQ_eth_8_h_l131_c10_188b_right <= VAR_BIN_OP_EQ_eth_8_h_l131_c10_188b_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l131_c10_188b_return_output := BIN_OP_EQ_eth_8_h_l131_c10_188b_return_output;

     -- BIN_OP_PLUS[eth_8_h_l200_c7_5fae] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l200_c7_5fae_left <= VAR_BIN_OP_PLUS_eth_8_h_l200_c7_5fae_left;
     BIN_OP_PLUS_eth_8_h_l200_c7_5fae_right <= VAR_BIN_OP_PLUS_eth_8_h_l200_c7_5fae_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l200_c7_5fae_return_output := BIN_OP_PLUS_eth_8_h_l200_c7_5fae_return_output;

     -- BIN_OP_EQ[eth_8_h_l158_c12_005d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l158_c12_005d_left <= VAR_BIN_OP_EQ_eth_8_h_l158_c12_005d_left;
     BIN_OP_EQ_eth_8_h_l158_c12_005d_right <= VAR_BIN_OP_EQ_eth_8_h_l158_c12_005d_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l158_c12_005d_return_output := BIN_OP_EQ_eth_8_h_l158_c12_005d_return_output;

     -- BIN_OP_AND[eth_8_h_l199_c8_5593] LATENCY=0
     -- Inputs
     BIN_OP_AND_eth_8_h_l199_c8_5593_left <= VAR_BIN_OP_AND_eth_8_h_l199_c8_5593_left;
     BIN_OP_AND_eth_8_h_l199_c8_5593_right <= VAR_BIN_OP_AND_eth_8_h_l199_c8_5593_right;
     -- Outputs
     VAR_BIN_OP_AND_eth_8_h_l199_c8_5593_return_output := BIN_OP_AND_eth_8_h_l199_c8_5593_return_output;

     -- BIN_OP_LT[eth_8_h_l124_c32_05a2] LATENCY=0
     -- Inputs
     BIN_OP_LT_eth_8_h_l124_c32_05a2_left <= VAR_BIN_OP_LT_eth_8_h_l124_c32_05a2_left;
     BIN_OP_LT_eth_8_h_l124_c32_05a2_right <= VAR_BIN_OP_LT_eth_8_h_l124_c32_05a2_right;
     -- Outputs
     VAR_BIN_OP_LT_eth_8_h_l124_c32_05a2_return_output := BIN_OP_LT_eth_8_h_l124_c32_05a2_return_output;

     -- BIN_OP_EQ[eth_8_h_l138_c12_aad1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l138_c12_aad1_left <= VAR_BIN_OP_EQ_eth_8_h_l138_c12_aad1_left;
     BIN_OP_EQ_eth_8_h_l138_c12_aad1_right <= VAR_BIN_OP_EQ_eth_8_h_l138_c12_aad1_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l138_c12_aad1_return_output := BIN_OP_EQ_eth_8_h_l138_c12_aad1_return_output;

     -- BIN_OP_EQ[eth_8_h_l151_c10_5ef8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l151_c10_5ef8_left <= VAR_BIN_OP_EQ_eth_8_h_l151_c10_5ef8_left;
     BIN_OP_EQ_eth_8_h_l151_c10_5ef8_right <= VAR_BIN_OP_EQ_eth_8_h_l151_c10_5ef8_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l151_c10_5ef8_return_output := BIN_OP_EQ_eth_8_h_l151_c10_5ef8_return_output;

     -- BIN_OP_EQ[eth_8_h_l163_c10_c49b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l163_c10_c49b_left <= VAR_BIN_OP_EQ_eth_8_h_l163_c10_c49b_left;
     BIN_OP_EQ_eth_8_h_l163_c10_c49b_right <= VAR_BIN_OP_EQ_eth_8_h_l163_c10_c49b_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l163_c10_c49b_return_output := BIN_OP_EQ_eth_8_h_l163_c10_c49b_return_output;

     -- CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d[eth_8_h_l174_c23_64a3] LATENCY=0
     VAR_CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d_eth_8_h_l174_c23_64a3_return_output := VAR_frame.data.payload;

     -- BIN_OP_PLUS[eth_8_h_l155_c9_6a55] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l155_c9_6a55_left <= VAR_BIN_OP_PLUS_eth_8_h_l155_c9_6a55_left;
     BIN_OP_PLUS_eth_8_h_l155_c9_6a55_right <= VAR_BIN_OP_PLUS_eth_8_h_l155_c9_6a55_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l155_c9_6a55_return_output := BIN_OP_PLUS_eth_8_h_l155_c9_6a55_return_output;

     -- BIN_OP_EQ[eth_8_h_l172_c11_e9d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l172_c11_e9d0_left <= VAR_BIN_OP_EQ_eth_8_h_l172_c11_e9d0_left;
     BIN_OP_EQ_eth_8_h_l172_c11_e9d0_right <= VAR_BIN_OP_EQ_eth_8_h_l172_c11_e9d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l172_c11_e9d0_return_output := BIN_OP_EQ_eth_8_h_l172_c11_e9d0_return_output;

     -- BIN_OP_PLUS[eth_8_h_l142_c11_859a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l142_c11_859a_left <= VAR_BIN_OP_PLUS_eth_8_h_l142_c11_859a_left;
     BIN_OP_PLUS_eth_8_h_l142_c11_859a_right <= VAR_BIN_OP_PLUS_eth_8_h_l142_c11_859a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l142_c11_859a_return_output := BIN_OP_PLUS_eth_8_h_l142_c11_859a_return_output;

     -- Submodule level 1
     VAR_counter_MUX_eth_8_h_l199_c5_3505_cond := VAR_BIN_OP_AND_eth_8_h_l199_c8_5593_return_output;
     VAR_state_MUX_eth_8_h_l199_c5_3505_cond := VAR_BIN_OP_AND_eth_8_h_l199_c8_5593_return_output;
     VAR_counter_MUX_eth_8_h_l128_c3_78c9_cond := VAR_BIN_OP_EQ_eth_8_h_l128_c6_e94c_return_output;
     VAR_header_MUX_eth_8_h_l128_c3_78c9_cond := VAR_BIN_OP_EQ_eth_8_h_l128_c6_e94c_return_output;
     VAR_o_MUX_eth_8_h_l128_c3_78c9_cond := VAR_BIN_OP_EQ_eth_8_h_l128_c6_e94c_return_output;
     VAR_state_MUX_eth_8_h_l128_c3_78c9_cond := VAR_BIN_OP_EQ_eth_8_h_l128_c6_e94c_return_output;
     VAR_header_MUX_eth_8_h_l131_c7_8004_cond := VAR_BIN_OP_EQ_eth_8_h_l131_c10_188b_return_output;
     VAR_counter_MUX_eth_8_h_l138_c9_eed8_cond := VAR_BIN_OP_EQ_eth_8_h_l138_c12_aad1_return_output;
     VAR_state_MUX_eth_8_h_l138_c9_eed8_cond := VAR_BIN_OP_EQ_eth_8_h_l138_c12_aad1_return_output;
     VAR_counter_MUX_eth_8_h_l146_c9_c265_cond := VAR_BIN_OP_EQ_eth_8_h_l146_c12_e78f_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l146_c9_c265_cond := VAR_BIN_OP_EQ_eth_8_h_l146_c12_e78f_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l146_c9_c265_cond := VAR_BIN_OP_EQ_eth_8_h_l146_c12_e78f_return_output;
     VAR_o_MUX_eth_8_h_l146_c9_c265_cond := VAR_BIN_OP_EQ_eth_8_h_l146_c12_e78f_return_output;
     VAR_state_MUX_eth_8_h_l146_c9_c265_cond := VAR_BIN_OP_EQ_eth_8_h_l146_c12_e78f_return_output;
     VAR_counter_MUX_eth_8_h_l151_c7_1168_cond := VAR_BIN_OP_EQ_eth_8_h_l151_c10_5ef8_return_output;
     VAR_state_MUX_eth_8_h_l151_c7_1168_cond := VAR_BIN_OP_EQ_eth_8_h_l151_c10_5ef8_return_output;
     VAR_counter_MUX_eth_8_h_l158_c9_8d77_cond := VAR_BIN_OP_EQ_eth_8_h_l158_c12_005d_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l158_c9_8d77_cond := VAR_BIN_OP_EQ_eth_8_h_l158_c12_005d_return_output;
     VAR_o_MUX_eth_8_h_l158_c9_8d77_cond := VAR_BIN_OP_EQ_eth_8_h_l158_c12_005d_return_output;
     VAR_state_MUX_eth_8_h_l158_c9_8d77_cond := VAR_BIN_OP_EQ_eth_8_h_l158_c12_005d_return_output;
     VAR_counter_MUX_eth_8_h_l163_c7_5370_cond := VAR_BIN_OP_EQ_eth_8_h_l163_c10_c49b_return_output;
     VAR_state_MUX_eth_8_h_l163_c7_5370_cond := VAR_BIN_OP_EQ_eth_8_h_l163_c10_c49b_return_output;
     VAR_counter_MUX_eth_8_h_l172_c8_a00c_cond := VAR_BIN_OP_EQ_eth_8_h_l172_c11_e9d0_return_output;
     VAR_o_MUX_eth_8_h_l172_c8_a00c_cond := VAR_BIN_OP_EQ_eth_8_h_l172_c11_e9d0_return_output;
     VAR_state_MUX_eth_8_h_l172_c8_a00c_cond := VAR_BIN_OP_EQ_eth_8_h_l172_c11_e9d0_return_output;
     VAR_counter_MUX_eth_8_h_l195_c8_0893_cond := VAR_BIN_OP_EQ_eth_8_h_l195_c11_5875_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_cond := VAR_BIN_OP_EQ_eth_8_h_l195_c11_5875_return_output;
     VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_cond := VAR_BIN_OP_EQ_eth_8_h_l195_c11_5875_return_output;
     VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_cond := VAR_BIN_OP_EQ_eth_8_h_l195_c11_5875_return_output;
     VAR_state_MUX_eth_8_h_l195_c8_0893_cond := VAR_BIN_OP_EQ_eth_8_h_l195_c11_5875_return_output;
     VAR_MUX_eth_8_h_l176_c29_102c_cond := VAR_BIN_OP_LT_eth_8_h_l124_c32_05a2_return_output;
     VAR_UNARY_OP_NOT_eth_8_h_l197_c30_5a56_expr := VAR_BIN_OP_LT_eth_8_h_l124_c32_05a2_return_output;
     VAR_counter_MUX_eth_8_h_l182_c9_082a_cond := VAR_BIN_OP_LT_eth_8_h_l124_c32_05a2_return_output;
     VAR_counter_MUX_eth_8_h_l189_c7_0326_cond := VAR_BIN_OP_LT_eth_8_h_l124_c32_05a2_return_output;
     VAR_state_MUX_eth_8_h_l182_c9_082a_cond := VAR_BIN_OP_LT_eth_8_h_l124_c32_05a2_return_output;
     VAR_counter_eth_8_h_l142_c11_bf2c := resize(VAR_BIN_OP_PLUS_eth_8_h_l142_c11_859a_return_output, 6);
     VAR_counter_eth_8_h_l155_c9_ebeb := resize(VAR_BIN_OP_PLUS_eth_8_h_l155_c9_6a55_return_output, 6);
     VAR_counter_eth_8_h_l167_c9_16fb := resize(VAR_BIN_OP_PLUS_eth_8_h_l167_c9_3866_return_output, 6);
     VAR_counter_eth_8_h_l200_c7_5e13 := resize(VAR_BIN_OP_PLUS_eth_8_h_l200_c7_5fae_return_output, 6);
     VAR_header_MUX_eth_8_h_l131_c7_8004_iftrue := VAR_CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d_eth_8_h_l132_c18_7a56_return_output;
     VAR_CONST_SL_8_eth_8_h_l162_c26_f948_x := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l146_l160_l161_l162_l158_DUPLICATE_4f7d_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l146_c9_c265_iftrue := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l146_l160_l161_l162_l158_DUPLICATE_4f7d_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l158_c9_8d77_iffalse := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l146_l160_l161_l162_l158_DUPLICATE_4f7d_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l161_c5_9bfb_iffalse := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l146_l160_l161_l162_l158_DUPLICATE_4f7d_return_output;
     VAR_MUX_eth_8_h_l176_c29_102c_iffalse := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l180_l176_DUPLICATE_6c0a_return_output;
     VAR_counter_MUX_eth_8_h_l180_c7_b711_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l180_l176_DUPLICATE_6c0a_return_output;
     VAR_state_MUX_eth_8_h_l180_c7_b711_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l180_l176_DUPLICATE_6c0a_return_output;
     VAR_BIN_OP_AND_eth_8_h_l179_c8_12dd_left := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_d80c_return_output;
     VAR_counter_MUX_eth_8_h_l130_c5_56e3_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_d80c_return_output;
     VAR_header_MUX_eth_8_h_l130_c5_56e3_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_d80c_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_d80c_return_output;
     VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_d80c_return_output;
     VAR_state_MUX_eth_8_h_l130_c5_56e3_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_d80c_return_output;
     VAR_CONST_SL_8_eth_8_h_l150_c24_439a_x := VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l146_l150_l148_l149_DUPLICATE_38ca_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l146_c9_c265_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l146_l150_l148_l149_DUPLICATE_38ca_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l149_c5_00b7_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l146_l150_l148_l149_DUPLICATE_38ca_return_output;
     VAR_counter_MUX_eth_8_h_l138_c9_eed8_iffalse := VAR_counter_eth_8_h_l142_c11_bf2c;
     VAR_counter_MUX_eth_8_h_l151_c7_1168_iffalse := VAR_counter_eth_8_h_l155_c9_ebeb;
     VAR_counter_MUX_eth_8_h_l163_c7_5370_iffalse := VAR_counter_eth_8_h_l167_c9_16fb;
     VAR_counter_MUX_eth_8_h_l201_c7_3527_iffalse := VAR_counter_eth_8_h_l200_c7_5e13;
     -- counter_MUX[eth_8_h_l151_c7_1168] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l151_c7_1168_cond <= VAR_counter_MUX_eth_8_h_l151_c7_1168_cond;
     counter_MUX_eth_8_h_l151_c7_1168_iftrue <= VAR_counter_MUX_eth_8_h_l151_c7_1168_iftrue;
     counter_MUX_eth_8_h_l151_c7_1168_iffalse <= VAR_counter_MUX_eth_8_h_l151_c7_1168_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l151_c7_1168_return_output := counter_MUX_eth_8_h_l151_c7_1168_return_output;

     -- o_mac_axis_valid_MUX[eth_8_h_l130_c5_56e3] LATENCY=0
     -- Inputs
     o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_cond <= VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_cond;
     o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_iftrue <= VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_iftrue;
     o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_iffalse <= VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_iffalse;
     -- Outputs
     VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_return_output := o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_return_output;

     -- state_MUX[eth_8_h_l138_c9_eed8] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l138_c9_eed8_cond <= VAR_state_MUX_eth_8_h_l138_c9_eed8_cond;
     state_MUX_eth_8_h_l138_c9_eed8_iftrue <= VAR_state_MUX_eth_8_h_l138_c9_eed8_iftrue;
     state_MUX_eth_8_h_l138_c9_eed8_iffalse <= VAR_state_MUX_eth_8_h_l138_c9_eed8_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l138_c9_eed8_return_output := state_MUX_eth_8_h_l138_c9_eed8_return_output;

     -- counter_MUX[eth_8_h_l182_c9_082a] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l182_c9_082a_cond <= VAR_counter_MUX_eth_8_h_l182_c9_082a_cond;
     counter_MUX_eth_8_h_l182_c9_082a_iftrue <= VAR_counter_MUX_eth_8_h_l182_c9_082a_iftrue;
     counter_MUX_eth_8_h_l182_c9_082a_iffalse <= VAR_counter_MUX_eth_8_h_l182_c9_082a_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l182_c9_082a_return_output := counter_MUX_eth_8_h_l182_c9_082a_return_output;

     -- uint16_15_8[eth_8_h_l160_c32_58fc] LATENCY=0
     VAR_uint16_15_8_eth_8_h_l160_c32_58fc_return_output := uint16_15_8(
     VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l146_l160_l161_l162_l158_DUPLICATE_4f7d_return_output);

     -- MUX[eth_8_h_l176_c29_102c] LATENCY=0
     -- Inputs
     MUX_eth_8_h_l176_c29_102c_cond <= VAR_MUX_eth_8_h_l176_c29_102c_cond;
     MUX_eth_8_h_l176_c29_102c_iftrue <= VAR_MUX_eth_8_h_l176_c29_102c_iftrue;
     MUX_eth_8_h_l176_c29_102c_iffalse <= VAR_MUX_eth_8_h_l176_c29_102c_iffalse;
     -- Outputs
     VAR_MUX_eth_8_h_l176_c29_102c_return_output := MUX_eth_8_h_l176_c29_102c_return_output;

     -- counter_MUX[eth_8_h_l163_c7_5370] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l163_c7_5370_cond <= VAR_counter_MUX_eth_8_h_l163_c7_5370_cond;
     counter_MUX_eth_8_h_l163_c7_5370_iftrue <= VAR_counter_MUX_eth_8_h_l163_c7_5370_iftrue;
     counter_MUX_eth_8_h_l163_c7_5370_iffalse <= VAR_counter_MUX_eth_8_h_l163_c7_5370_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l163_c7_5370_return_output := counter_MUX_eth_8_h_l163_c7_5370_return_output;

     -- header_MUX[eth_8_h_l131_c7_8004] LATENCY=0
     -- Inputs
     header_MUX_eth_8_h_l131_c7_8004_cond <= VAR_header_MUX_eth_8_h_l131_c7_8004_cond;
     header_MUX_eth_8_h_l131_c7_8004_iftrue <= VAR_header_MUX_eth_8_h_l131_c7_8004_iftrue;
     header_MUX_eth_8_h_l131_c7_8004_iffalse <= VAR_header_MUX_eth_8_h_l131_c7_8004_iffalse;
     -- Outputs
     VAR_header_MUX_eth_8_h_l131_c7_8004_return_output := header_MUX_eth_8_h_l131_c7_8004_return_output;

     -- counter_MUX[eth_8_h_l138_c9_eed8] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l138_c9_eed8_cond <= VAR_counter_MUX_eth_8_h_l138_c9_eed8_cond;
     counter_MUX_eth_8_h_l138_c9_eed8_iftrue <= VAR_counter_MUX_eth_8_h_l138_c9_eed8_iftrue;
     counter_MUX_eth_8_h_l138_c9_eed8_iffalse <= VAR_counter_MUX_eth_8_h_l138_c9_eed8_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l138_c9_eed8_return_output := counter_MUX_eth_8_h_l138_c9_eed8_return_output;

     -- CONST_SL_8[eth_8_h_l162_c26_f948] LATENCY=0
     -- Inputs
     CONST_SL_8_eth_8_h_l162_c26_f948_x <= VAR_CONST_SL_8_eth_8_h_l162_c26_f948_x;
     -- Outputs
     VAR_CONST_SL_8_eth_8_h_l162_c26_f948_return_output := CONST_SL_8_eth_8_h_l162_c26_f948_return_output;

     -- CONST_SL_8[eth_8_h_l150_c24_439a] LATENCY=0
     -- Inputs
     CONST_SL_8_eth_8_h_l150_c24_439a_x <= VAR_CONST_SL_8_eth_8_h_l150_c24_439a_x;
     -- Outputs
     VAR_CONST_SL_8_eth_8_h_l150_c24_439a_return_output := CONST_SL_8_eth_8_h_l150_c24_439a_return_output;

     -- state_MUX[eth_8_h_l163_c7_5370] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l163_c7_5370_cond <= VAR_state_MUX_eth_8_h_l163_c7_5370_cond;
     state_MUX_eth_8_h_l163_c7_5370_iftrue <= VAR_state_MUX_eth_8_h_l163_c7_5370_iftrue;
     state_MUX_eth_8_h_l163_c7_5370_iffalse <= VAR_state_MUX_eth_8_h_l163_c7_5370_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l163_c7_5370_return_output := state_MUX_eth_8_h_l163_c7_5370_return_output;

     -- uint48_47_40[eth_8_h_l148_c32_a710] LATENCY=0
     VAR_uint48_47_40_eth_8_h_l148_c32_a710_return_output := uint48_47_40(
     VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l146_l150_l148_l149_DUPLICATE_38ca_return_output);

     -- o_mac_axis_valid_MUX[eth_8_h_l195_c8_0893] LATENCY=0
     -- Inputs
     o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_cond <= VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_cond;
     o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_iftrue <= VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_iftrue;
     o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_iffalse <= VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_iffalse;
     -- Outputs
     VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_return_output := o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_return_output;

     -- UNARY_OP_NOT[eth_8_h_l197_c30_5a56] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_eth_8_h_l197_c30_5a56_expr <= VAR_UNARY_OP_NOT_eth_8_h_l197_c30_5a56_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_eth_8_h_l197_c30_5a56_return_output := UNARY_OP_NOT_eth_8_h_l197_c30_5a56_return_output;

     -- state_MUX[eth_8_h_l151_c7_1168] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l151_c7_1168_cond <= VAR_state_MUX_eth_8_h_l151_c7_1168_cond;
     state_MUX_eth_8_h_l151_c7_1168_iftrue <= VAR_state_MUX_eth_8_h_l151_c7_1168_iftrue;
     state_MUX_eth_8_h_l151_c7_1168_iffalse <= VAR_state_MUX_eth_8_h_l151_c7_1168_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l151_c7_1168_return_output := state_MUX_eth_8_h_l151_c7_1168_return_output;

     -- o_mac_axis_data_tdata_MUX[eth_8_h_l195_c8_0893] LATENCY=0
     -- Inputs
     o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_cond <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_cond;
     o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_iftrue <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_iftrue;
     o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_iffalse <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_iffalse;
     -- Outputs
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_return_output := o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_return_output;

     -- state_MUX[eth_8_h_l182_c9_082a] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l182_c9_082a_cond <= VAR_state_MUX_eth_8_h_l182_c9_082a_cond;
     state_MUX_eth_8_h_l182_c9_082a_iftrue <= VAR_state_MUX_eth_8_h_l182_c9_082a_iftrue;
     state_MUX_eth_8_h_l182_c9_082a_iffalse <= VAR_state_MUX_eth_8_h_l182_c9_082a_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l182_c9_082a_return_output := state_MUX_eth_8_h_l182_c9_082a_return_output;

     -- BIN_OP_AND[eth_8_h_l179_c8_12dd] LATENCY=0
     -- Inputs
     BIN_OP_AND_eth_8_h_l179_c8_12dd_left <= VAR_BIN_OP_AND_eth_8_h_l179_c8_12dd_left;
     BIN_OP_AND_eth_8_h_l179_c8_12dd_right <= VAR_BIN_OP_AND_eth_8_h_l179_c8_12dd_right;
     -- Outputs
     VAR_BIN_OP_AND_eth_8_h_l179_c8_12dd_return_output := BIN_OP_AND_eth_8_h_l179_c8_12dd_return_output;

     -- Submodule level 2
     VAR_counter_MUX_eth_8_h_l179_c5_63d0_cond := VAR_BIN_OP_AND_eth_8_h_l179_c8_12dd_return_output;
     VAR_state_MUX_eth_8_h_l179_c5_63d0_cond := VAR_BIN_OP_AND_eth_8_h_l179_c8_12dd_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l149_c5_00b7_iftrue := VAR_CONST_SL_8_eth_8_h_l150_c24_439a_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l161_c5_9bfb_iftrue := VAR_CONST_SL_8_eth_8_h_l162_c26_f948_return_output;
     VAR_counter_MUX_eth_8_h_l201_c7_3527_cond := VAR_UNARY_OP_NOT_eth_8_h_l197_c30_5a56_return_output;
     VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_iftrue := VAR_UNARY_OP_NOT_eth_8_h_l197_c30_5a56_return_output;
     VAR_state_MUX_eth_8_h_l201_c7_3527_cond := VAR_UNARY_OP_NOT_eth_8_h_l197_c30_5a56_return_output;
     VAR_counter_MUX_eth_8_h_l136_c7_da1f_iftrue := VAR_counter_MUX_eth_8_h_l138_c9_eed8_return_output;
     VAR_counter_MUX_eth_8_h_l149_c5_00b7_iftrue := VAR_counter_MUX_eth_8_h_l151_c7_1168_return_output;
     VAR_counter_MUX_eth_8_h_l161_c5_9bfb_iftrue := VAR_counter_MUX_eth_8_h_l163_c7_5370_return_output;
     VAR_counter_MUX_eth_8_h_l180_c7_b711_iftrue := VAR_counter_MUX_eth_8_h_l182_c9_082a_return_output;
     VAR_state_MUX_eth_8_h_l136_c7_da1f_iftrue := VAR_state_MUX_eth_8_h_l138_c9_eed8_return_output;
     VAR_state_MUX_eth_8_h_l149_c5_00b7_iftrue := VAR_state_MUX_eth_8_h_l151_c7_1168_return_output;
     VAR_state_MUX_eth_8_h_l161_c5_9bfb_iftrue := VAR_state_MUX_eth_8_h_l163_c7_5370_return_output;
     VAR_state_MUX_eth_8_h_l180_c7_b711_iftrue := VAR_state_MUX_eth_8_h_l182_c9_082a_return_output;
     -- o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb[eth_8_h_l158_c9_8d77] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l158_c9_8d77_return_output := CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb(
     eth_8_tx_t_NULL,
     to_unsigned(1, 1),
     to_unsigned(0, 1),
     to_unsigned(1, 1),
     VAR_uint16_15_8_eth_8_h_l160_c32_58fc_return_output);

     -- CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l135_l136_l137_DUPLICATE_4065 LATENCY=0
     VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l135_l136_l137_DUPLICATE_4065_return_output := VAR_header_MUX_eth_8_h_l131_c7_8004_return_output.dst_mac;

     -- state_MUX[eth_8_h_l201_c7_3527] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l201_c7_3527_cond <= VAR_state_MUX_eth_8_h_l201_c7_3527_cond;
     state_MUX_eth_8_h_l201_c7_3527_iftrue <= VAR_state_MUX_eth_8_h_l201_c7_3527_iftrue;
     state_MUX_eth_8_h_l201_c7_3527_iffalse <= VAR_state_MUX_eth_8_h_l201_c7_3527_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l201_c7_3527_return_output := state_MUX_eth_8_h_l201_c7_3527_return_output;

     -- state_MUX[eth_8_h_l180_c7_b711] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l180_c7_b711_cond <= VAR_state_MUX_eth_8_h_l180_c7_b711_cond;
     state_MUX_eth_8_h_l180_c7_b711_iftrue <= VAR_state_MUX_eth_8_h_l180_c7_b711_iftrue;
     state_MUX_eth_8_h_l180_c7_b711_iffalse <= VAR_state_MUX_eth_8_h_l180_c7_b711_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l180_c7_b711_return_output := state_MUX_eth_8_h_l180_c7_b711_return_output;

     -- state_MUX[eth_8_h_l136_c7_da1f] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l136_c7_da1f_cond <= VAR_state_MUX_eth_8_h_l136_c7_da1f_cond;
     state_MUX_eth_8_h_l136_c7_da1f_iftrue <= VAR_state_MUX_eth_8_h_l136_c7_da1f_iftrue;
     state_MUX_eth_8_h_l136_c7_da1f_iffalse <= VAR_state_MUX_eth_8_h_l136_c7_da1f_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l136_c7_da1f_return_output := state_MUX_eth_8_h_l136_c7_da1f_return_output;

     -- state_MUX[eth_8_h_l149_c5_00b7] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l149_c5_00b7_cond <= VAR_state_MUX_eth_8_h_l149_c5_00b7_cond;
     state_MUX_eth_8_h_l149_c5_00b7_iftrue <= VAR_state_MUX_eth_8_h_l149_c5_00b7_iftrue;
     state_MUX_eth_8_h_l149_c5_00b7_iffalse <= VAR_state_MUX_eth_8_h_l149_c5_00b7_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l149_c5_00b7_return_output := state_MUX_eth_8_h_l149_c5_00b7_return_output;

     -- header_ethertype_MUX[eth_8_h_l161_c5_9bfb] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l161_c5_9bfb_cond <= VAR_header_ethertype_MUX_eth_8_h_l161_c5_9bfb_cond;
     header_ethertype_MUX_eth_8_h_l161_c5_9bfb_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l161_c5_9bfb_iftrue;
     header_ethertype_MUX_eth_8_h_l161_c5_9bfb_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l161_c5_9bfb_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l161_c5_9bfb_return_output := header_ethertype_MUX_eth_8_h_l161_c5_9bfb_return_output;

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524[eth_8_h_l172_c8_a00c] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524_eth_8_h_l172_c8_a00c_return_output := CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524(
     VAR_CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d_eth_8_h_l174_c23_64a3_return_output,
     VAR_MUX_eth_8_h_l176_c29_102c_return_output,
     VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_d80c_return_output,
     VAR_mac_axis_ready);

     -- counter_MUX[eth_8_h_l161_c5_9bfb] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l161_c5_9bfb_cond <= VAR_counter_MUX_eth_8_h_l161_c5_9bfb_cond;
     counter_MUX_eth_8_h_l161_c5_9bfb_iftrue <= VAR_counter_MUX_eth_8_h_l161_c5_9bfb_iftrue;
     counter_MUX_eth_8_h_l161_c5_9bfb_iffalse <= VAR_counter_MUX_eth_8_h_l161_c5_9bfb_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l161_c5_9bfb_return_output := counter_MUX_eth_8_h_l161_c5_9bfb_return_output;

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb[eth_8_h_l146_c9_c265] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l146_c9_c265_return_output := CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb(
     eth_8_tx_t_NULL,
     to_unsigned(1, 1),
     to_unsigned(0, 1),
     to_unsigned(1, 1),
     VAR_uint48_47_40_eth_8_h_l148_c32_a710_return_output);

     -- header_src_mac_MUX[eth_8_h_l149_c5_00b7] LATENCY=0
     -- Inputs
     header_src_mac_MUX_eth_8_h_l149_c5_00b7_cond <= VAR_header_src_mac_MUX_eth_8_h_l149_c5_00b7_cond;
     header_src_mac_MUX_eth_8_h_l149_c5_00b7_iftrue <= VAR_header_src_mac_MUX_eth_8_h_l149_c5_00b7_iftrue;
     header_src_mac_MUX_eth_8_h_l149_c5_00b7_iffalse <= VAR_header_src_mac_MUX_eth_8_h_l149_c5_00b7_iffalse;
     -- Outputs
     VAR_header_src_mac_MUX_eth_8_h_l149_c5_00b7_return_output := header_src_mac_MUX_eth_8_h_l149_c5_00b7_return_output;

     -- counter_MUX[eth_8_h_l180_c7_b711] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l180_c7_b711_cond <= VAR_counter_MUX_eth_8_h_l180_c7_b711_cond;
     counter_MUX_eth_8_h_l180_c7_b711_iftrue <= VAR_counter_MUX_eth_8_h_l180_c7_b711_iftrue;
     counter_MUX_eth_8_h_l180_c7_b711_iffalse <= VAR_counter_MUX_eth_8_h_l180_c7_b711_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l180_c7_b711_return_output := counter_MUX_eth_8_h_l180_c7_b711_return_output;

     -- counter_MUX[eth_8_h_l136_c7_da1f] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l136_c7_da1f_cond <= VAR_counter_MUX_eth_8_h_l136_c7_da1f_cond;
     counter_MUX_eth_8_h_l136_c7_da1f_iftrue <= VAR_counter_MUX_eth_8_h_l136_c7_da1f_iftrue;
     counter_MUX_eth_8_h_l136_c7_da1f_iffalse <= VAR_counter_MUX_eth_8_h_l136_c7_da1f_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l136_c7_da1f_return_output := counter_MUX_eth_8_h_l136_c7_da1f_return_output;

     -- counter_MUX[eth_8_h_l149_c5_00b7] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l149_c5_00b7_cond <= VAR_counter_MUX_eth_8_h_l149_c5_00b7_cond;
     counter_MUX_eth_8_h_l149_c5_00b7_iftrue <= VAR_counter_MUX_eth_8_h_l149_c5_00b7_iftrue;
     counter_MUX_eth_8_h_l149_c5_00b7_iffalse <= VAR_counter_MUX_eth_8_h_l149_c5_00b7_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l149_c5_00b7_return_output := counter_MUX_eth_8_h_l149_c5_00b7_return_output;

     -- counter_MUX[eth_8_h_l201_c7_3527] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l201_c7_3527_cond <= VAR_counter_MUX_eth_8_h_l201_c7_3527_cond;
     counter_MUX_eth_8_h_l201_c7_3527_iftrue <= VAR_counter_MUX_eth_8_h_l201_c7_3527_iftrue;
     counter_MUX_eth_8_h_l201_c7_3527_iffalse <= VAR_counter_MUX_eth_8_h_l201_c7_3527_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l201_c7_3527_return_output := counter_MUX_eth_8_h_l201_c7_3527_return_output;

     -- o_mac_axis_data_tlast_MUX[eth_8_h_l195_c8_0893] LATENCY=0
     -- Inputs
     o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_cond <= VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_cond;
     o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_iftrue <= VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_iftrue;
     o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_iffalse <= VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_iffalse;
     -- Outputs
     VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_return_output := o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_return_output;

     -- state_MUX[eth_8_h_l161_c5_9bfb] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l161_c5_9bfb_cond <= VAR_state_MUX_eth_8_h_l161_c5_9bfb_cond;
     state_MUX_eth_8_h_l161_c5_9bfb_iftrue <= VAR_state_MUX_eth_8_h_l161_c5_9bfb_iftrue;
     state_MUX_eth_8_h_l161_c5_9bfb_iffalse <= VAR_state_MUX_eth_8_h_l161_c5_9bfb_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l161_c5_9bfb_return_output := state_MUX_eth_8_h_l161_c5_9bfb_return_output;

     -- Submodule level 3
     VAR_CONST_SL_8_eth_8_h_l137_c26_f515_x := VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l135_l136_l137_DUPLICATE_4065_return_output;
     VAR_header_dst_mac_MUX_eth_8_h_l136_c7_da1f_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l135_l136_l137_DUPLICATE_4065_return_output;
     VAR_counter_MUX_eth_8_h_l130_c5_56e3_iftrue := VAR_counter_MUX_eth_8_h_l136_c7_da1f_return_output;
     VAR_counter_MUX_eth_8_h_l146_c9_c265_iftrue := VAR_counter_MUX_eth_8_h_l149_c5_00b7_return_output;
     VAR_counter_MUX_eth_8_h_l158_c9_8d77_iftrue := VAR_counter_MUX_eth_8_h_l161_c5_9bfb_return_output;
     VAR_BIN_OP_PLUS_eth_8_h_l190_c9_3121_left := VAR_counter_MUX_eth_8_h_l180_c7_b711_return_output;
     VAR_counter_MUX_eth_8_h_l189_c7_0326_iffalse := VAR_counter_MUX_eth_8_h_l180_c7_b711_return_output;
     VAR_counter_MUX_eth_8_h_l199_c5_3505_iftrue := VAR_counter_MUX_eth_8_h_l201_c7_3527_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l158_c9_8d77_iftrue := VAR_header_ethertype_MUX_eth_8_h_l161_c5_9bfb_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l146_c9_c265_iftrue := VAR_header_src_mac_MUX_eth_8_h_l149_c5_00b7_return_output;
     VAR_o_MUX_eth_8_h_l146_c9_c265_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l146_c9_c265_return_output;
     VAR_o_MUX_eth_8_h_l158_c9_8d77_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l158_c9_8d77_return_output;
     VAR_o_MUX_eth_8_h_l172_c8_a00c_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524_eth_8_h_l172_c8_a00c_return_output;
     VAR_state_MUX_eth_8_h_l130_c5_56e3_iftrue := VAR_state_MUX_eth_8_h_l136_c7_da1f_return_output;
     VAR_state_MUX_eth_8_h_l146_c9_c265_iftrue := VAR_state_MUX_eth_8_h_l149_c5_00b7_return_output;
     VAR_state_MUX_eth_8_h_l158_c9_8d77_iftrue := VAR_state_MUX_eth_8_h_l161_c5_9bfb_return_output;
     VAR_state_MUX_eth_8_h_l179_c5_63d0_iftrue := VAR_state_MUX_eth_8_h_l180_c7_b711_return_output;
     VAR_state_MUX_eth_8_h_l199_c5_3505_iftrue := VAR_state_MUX_eth_8_h_l201_c7_3527_return_output;
     -- state_MUX[eth_8_h_l130_c5_56e3] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l130_c5_56e3_cond <= VAR_state_MUX_eth_8_h_l130_c5_56e3_cond;
     state_MUX_eth_8_h_l130_c5_56e3_iftrue <= VAR_state_MUX_eth_8_h_l130_c5_56e3_iftrue;
     state_MUX_eth_8_h_l130_c5_56e3_iffalse <= VAR_state_MUX_eth_8_h_l130_c5_56e3_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l130_c5_56e3_return_output := state_MUX_eth_8_h_l130_c5_56e3_return_output;

     -- BIN_OP_PLUS[eth_8_h_l190_c9_3121] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l190_c9_3121_left <= VAR_BIN_OP_PLUS_eth_8_h_l190_c9_3121_left;
     BIN_OP_PLUS_eth_8_h_l190_c9_3121_right <= VAR_BIN_OP_PLUS_eth_8_h_l190_c9_3121_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l190_c9_3121_return_output := BIN_OP_PLUS_eth_8_h_l190_c9_3121_return_output;

     -- state_MUX[eth_8_h_l179_c5_63d0] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l179_c5_63d0_cond <= VAR_state_MUX_eth_8_h_l179_c5_63d0_cond;
     state_MUX_eth_8_h_l179_c5_63d0_iftrue <= VAR_state_MUX_eth_8_h_l179_c5_63d0_iftrue;
     state_MUX_eth_8_h_l179_c5_63d0_iffalse <= VAR_state_MUX_eth_8_h_l179_c5_63d0_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l179_c5_63d0_return_output := state_MUX_eth_8_h_l179_c5_63d0_return_output;

     -- uint48_47_40[eth_8_h_l135_c34_dcbc] LATENCY=0
     VAR_uint48_47_40_eth_8_h_l135_c34_dcbc_return_output := uint48_47_40(
     VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l135_l136_l137_DUPLICATE_4065_return_output);

     -- CONST_SL_8[eth_8_h_l137_c26_f515] LATENCY=0
     -- Inputs
     CONST_SL_8_eth_8_h_l137_c26_f515_x <= VAR_CONST_SL_8_eth_8_h_l137_c26_f515_x;
     -- Outputs
     VAR_CONST_SL_8_eth_8_h_l137_c26_f515_return_output := CONST_SL_8_eth_8_h_l137_c26_f515_return_output;

     -- counter_MUX[eth_8_h_l199_c5_3505] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l199_c5_3505_cond <= VAR_counter_MUX_eth_8_h_l199_c5_3505_cond;
     counter_MUX_eth_8_h_l199_c5_3505_iftrue <= VAR_counter_MUX_eth_8_h_l199_c5_3505_iftrue;
     counter_MUX_eth_8_h_l199_c5_3505_iffalse <= VAR_counter_MUX_eth_8_h_l199_c5_3505_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l199_c5_3505_return_output := counter_MUX_eth_8_h_l199_c5_3505_return_output;

     -- header_ethertype_MUX[eth_8_h_l158_c9_8d77] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l158_c9_8d77_cond <= VAR_header_ethertype_MUX_eth_8_h_l158_c9_8d77_cond;
     header_ethertype_MUX_eth_8_h_l158_c9_8d77_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l158_c9_8d77_iftrue;
     header_ethertype_MUX_eth_8_h_l158_c9_8d77_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l158_c9_8d77_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l158_c9_8d77_return_output := header_ethertype_MUX_eth_8_h_l158_c9_8d77_return_output;

     -- counter_MUX[eth_8_h_l130_c5_56e3] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l130_c5_56e3_cond <= VAR_counter_MUX_eth_8_h_l130_c5_56e3_cond;
     counter_MUX_eth_8_h_l130_c5_56e3_iftrue <= VAR_counter_MUX_eth_8_h_l130_c5_56e3_iftrue;
     counter_MUX_eth_8_h_l130_c5_56e3_iffalse <= VAR_counter_MUX_eth_8_h_l130_c5_56e3_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l130_c5_56e3_return_output := counter_MUX_eth_8_h_l130_c5_56e3_return_output;

     -- header_src_mac_MUX[eth_8_h_l146_c9_c265] LATENCY=0
     -- Inputs
     header_src_mac_MUX_eth_8_h_l146_c9_c265_cond <= VAR_header_src_mac_MUX_eth_8_h_l146_c9_c265_cond;
     header_src_mac_MUX_eth_8_h_l146_c9_c265_iftrue <= VAR_header_src_mac_MUX_eth_8_h_l146_c9_c265_iftrue;
     header_src_mac_MUX_eth_8_h_l146_c9_c265_iffalse <= VAR_header_src_mac_MUX_eth_8_h_l146_c9_c265_iffalse;
     -- Outputs
     VAR_header_src_mac_MUX_eth_8_h_l146_c9_c265_return_output := header_src_mac_MUX_eth_8_h_l146_c9_c265_return_output;

     -- o_FALSE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_19fe[eth_8_h_l172_c8_a00c] LATENCY=0
     VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_19fe_eth_8_h_l172_c8_a00c_return_output := CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_19fe(
     to_unsigned(1, 1),
     to_unsigned(0, 1),
     VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_0893_return_output,
     VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_0893_return_output,
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_0893_return_output);

     -- state_MUX[eth_8_h_l199_c5_3505] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l199_c5_3505_cond <= VAR_state_MUX_eth_8_h_l199_c5_3505_cond;
     state_MUX_eth_8_h_l199_c5_3505_iftrue <= VAR_state_MUX_eth_8_h_l199_c5_3505_iftrue;
     state_MUX_eth_8_h_l199_c5_3505_iffalse <= VAR_state_MUX_eth_8_h_l199_c5_3505_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l199_c5_3505_return_output := state_MUX_eth_8_h_l199_c5_3505_return_output;

     -- Submodule level 4
     VAR_counter_eth_8_h_l190_c9_7e00 := resize(VAR_BIN_OP_PLUS_eth_8_h_l190_c9_3121_return_output, 6);
     VAR_header_dst_mac_MUX_eth_8_h_l136_c7_da1f_iftrue := VAR_CONST_SL_8_eth_8_h_l137_c26_f515_return_output;
     VAR_counter_MUX_eth_8_h_l128_c3_78c9_iftrue := VAR_counter_MUX_eth_8_h_l130_c5_56e3_return_output;
     VAR_counter_MUX_eth_8_h_l195_c8_0893_iftrue := VAR_counter_MUX_eth_8_h_l199_c5_3505_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l146_c9_c265_iffalse := VAR_header_ethertype_MUX_eth_8_h_l158_c9_8d77_return_output;
     VAR_o_MUX_eth_8_h_l172_c8_a00c_iffalse := VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_19fe_eth_8_h_l172_c8_a00c_return_output;
     VAR_state_MUX_eth_8_h_l128_c3_78c9_iftrue := VAR_state_MUX_eth_8_h_l130_c5_56e3_return_output;
     VAR_state_MUX_eth_8_h_l172_c8_a00c_iftrue := VAR_state_MUX_eth_8_h_l179_c5_63d0_return_output;
     VAR_state_MUX_eth_8_h_l195_c8_0893_iftrue := VAR_state_MUX_eth_8_h_l199_c5_3505_return_output;
     VAR_counter_MUX_eth_8_h_l189_c7_0326_iftrue := VAR_counter_eth_8_h_l190_c9_7e00;
     -- o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3[eth_8_h_l130_c5_56e3] LATENCY=0
     VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l130_c5_56e3_return_output := CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3(
     VAR_uint48_47_40_eth_8_h_l135_c34_dcbc_return_output);

     -- o_MUX[eth_8_h_l172_c8_a00c] LATENCY=0
     -- Inputs
     o_MUX_eth_8_h_l172_c8_a00c_cond <= VAR_o_MUX_eth_8_h_l172_c8_a00c_cond;
     o_MUX_eth_8_h_l172_c8_a00c_iftrue <= VAR_o_MUX_eth_8_h_l172_c8_a00c_iftrue;
     o_MUX_eth_8_h_l172_c8_a00c_iffalse <= VAR_o_MUX_eth_8_h_l172_c8_a00c_iffalse;
     -- Outputs
     VAR_o_MUX_eth_8_h_l172_c8_a00c_return_output := o_MUX_eth_8_h_l172_c8_a00c_return_output;

     -- state_MUX[eth_8_h_l195_c8_0893] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l195_c8_0893_cond <= VAR_state_MUX_eth_8_h_l195_c8_0893_cond;
     state_MUX_eth_8_h_l195_c8_0893_iftrue <= VAR_state_MUX_eth_8_h_l195_c8_0893_iftrue;
     state_MUX_eth_8_h_l195_c8_0893_iffalse <= VAR_state_MUX_eth_8_h_l195_c8_0893_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l195_c8_0893_return_output := state_MUX_eth_8_h_l195_c8_0893_return_output;

     -- header_dst_mac_MUX[eth_8_h_l136_c7_da1f] LATENCY=0
     -- Inputs
     header_dst_mac_MUX_eth_8_h_l136_c7_da1f_cond <= VAR_header_dst_mac_MUX_eth_8_h_l136_c7_da1f_cond;
     header_dst_mac_MUX_eth_8_h_l136_c7_da1f_iftrue <= VAR_header_dst_mac_MUX_eth_8_h_l136_c7_da1f_iftrue;
     header_dst_mac_MUX_eth_8_h_l136_c7_da1f_iffalse <= VAR_header_dst_mac_MUX_eth_8_h_l136_c7_da1f_iffalse;
     -- Outputs
     VAR_header_dst_mac_MUX_eth_8_h_l136_c7_da1f_return_output := header_dst_mac_MUX_eth_8_h_l136_c7_da1f_return_output;

     -- counter_MUX[eth_8_h_l189_c7_0326] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l189_c7_0326_cond <= VAR_counter_MUX_eth_8_h_l189_c7_0326_cond;
     counter_MUX_eth_8_h_l189_c7_0326_iftrue <= VAR_counter_MUX_eth_8_h_l189_c7_0326_iftrue;
     counter_MUX_eth_8_h_l189_c7_0326_iffalse <= VAR_counter_MUX_eth_8_h_l189_c7_0326_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l189_c7_0326_return_output := counter_MUX_eth_8_h_l189_c7_0326_return_output;

     -- header_ethertype_MUX[eth_8_h_l146_c9_c265] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l146_c9_c265_cond <= VAR_header_ethertype_MUX_eth_8_h_l146_c9_c265_cond;
     header_ethertype_MUX_eth_8_h_l146_c9_c265_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l146_c9_c265_iftrue;
     header_ethertype_MUX_eth_8_h_l146_c9_c265_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l146_c9_c265_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l146_c9_c265_return_output := header_ethertype_MUX_eth_8_h_l146_c9_c265_return_output;

     -- counter_MUX[eth_8_h_l195_c8_0893] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l195_c8_0893_cond <= VAR_counter_MUX_eth_8_h_l195_c8_0893_cond;
     counter_MUX_eth_8_h_l195_c8_0893_iftrue <= VAR_counter_MUX_eth_8_h_l195_c8_0893_iftrue;
     counter_MUX_eth_8_h_l195_c8_0893_iffalse <= VAR_counter_MUX_eth_8_h_l195_c8_0893_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l195_c8_0893_return_output := counter_MUX_eth_8_h_l195_c8_0893_return_output;

     -- Submodule level 5
     VAR_counter_MUX_eth_8_h_l179_c5_63d0_iftrue := VAR_counter_MUX_eth_8_h_l189_c7_0326_return_output;
     VAR_counter_MUX_eth_8_h_l172_c8_a00c_iffalse := VAR_counter_MUX_eth_8_h_l195_c8_0893_return_output;
     VAR_o_MUX_eth_8_h_l158_c9_8d77_iffalse := VAR_o_MUX_eth_8_h_l172_c8_a00c_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_iftrue := VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l130_c5_56e3_return_output;
     VAR_state_MUX_eth_8_h_l172_c8_a00c_iffalse := VAR_state_MUX_eth_8_h_l195_c8_0893_return_output;
     -- header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484[eth_8_h_l130_c5_56e3] LATENCY=0
     VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l130_c5_56e3_return_output := CONST_REF_RD_eth_header_t_eth_header_t_e484(
     VAR_header_MUX_eth_8_h_l131_c7_8004_return_output,
     VAR_header_dst_mac_MUX_eth_8_h_l136_c7_da1f_return_output);

     -- header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a[eth_8_h_l128_c3_78c9] LATENCY=0
     VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a_eth_8_h_l128_c3_78c9_return_output := CONST_REF_RD_eth_header_t_eth_header_t_325a(
     header,
     VAR_header_ethertype_MUX_eth_8_h_l146_c9_c265_return_output,
     VAR_header_src_mac_MUX_eth_8_h_l146_c9_c265_return_output);

     -- o_mac_axis_data_tdata_MUX[eth_8_h_l130_c5_56e3] LATENCY=0
     -- Inputs
     o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_cond <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_cond;
     o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_iftrue <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_iftrue;
     o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_iffalse <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_iffalse;
     -- Outputs
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_return_output := o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_return_output;

     -- state_MUX[eth_8_h_l172_c8_a00c] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l172_c8_a00c_cond <= VAR_state_MUX_eth_8_h_l172_c8_a00c_cond;
     state_MUX_eth_8_h_l172_c8_a00c_iftrue <= VAR_state_MUX_eth_8_h_l172_c8_a00c_iftrue;
     state_MUX_eth_8_h_l172_c8_a00c_iffalse <= VAR_state_MUX_eth_8_h_l172_c8_a00c_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l172_c8_a00c_return_output := state_MUX_eth_8_h_l172_c8_a00c_return_output;

     -- counter_MUX[eth_8_h_l179_c5_63d0] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l179_c5_63d0_cond <= VAR_counter_MUX_eth_8_h_l179_c5_63d0_cond;
     counter_MUX_eth_8_h_l179_c5_63d0_iftrue <= VAR_counter_MUX_eth_8_h_l179_c5_63d0_iftrue;
     counter_MUX_eth_8_h_l179_c5_63d0_iffalse <= VAR_counter_MUX_eth_8_h_l179_c5_63d0_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l179_c5_63d0_return_output := counter_MUX_eth_8_h_l179_c5_63d0_return_output;

     -- o_MUX[eth_8_h_l158_c9_8d77] LATENCY=0
     -- Inputs
     o_MUX_eth_8_h_l158_c9_8d77_cond <= VAR_o_MUX_eth_8_h_l158_c9_8d77_cond;
     o_MUX_eth_8_h_l158_c9_8d77_iftrue <= VAR_o_MUX_eth_8_h_l158_c9_8d77_iftrue;
     o_MUX_eth_8_h_l158_c9_8d77_iffalse <= VAR_o_MUX_eth_8_h_l158_c9_8d77_iffalse;
     -- Outputs
     VAR_o_MUX_eth_8_h_l158_c9_8d77_return_output := o_MUX_eth_8_h_l158_c9_8d77_return_output;

     -- Submodule level 6
     VAR_counter_MUX_eth_8_h_l172_c8_a00c_iftrue := VAR_counter_MUX_eth_8_h_l179_c5_63d0_return_output;
     VAR_header_MUX_eth_8_h_l128_c3_78c9_iffalse := VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a_eth_8_h_l128_c3_78c9_return_output;
     VAR_header_MUX_eth_8_h_l130_c5_56e3_iftrue := VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l130_c5_56e3_return_output;
     VAR_o_MUX_eth_8_h_l146_c9_c265_iffalse := VAR_o_MUX_eth_8_h_l158_c9_8d77_return_output;
     VAR_state_MUX_eth_8_h_l158_c9_8d77_iffalse := VAR_state_MUX_eth_8_h_l172_c8_a00c_return_output;
     -- o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856[eth_8_h_l128_c3_78c9] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856_eth_8_h_l128_c3_78c9_return_output := CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856(
     eth_8_tx_t_NULL,
     to_unsigned(1, 1),
     to_unsigned(0, 1),
     VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_56e3_return_output,
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_56e3_return_output);

     -- o_MUX[eth_8_h_l146_c9_c265] LATENCY=0
     -- Inputs
     o_MUX_eth_8_h_l146_c9_c265_cond <= VAR_o_MUX_eth_8_h_l146_c9_c265_cond;
     o_MUX_eth_8_h_l146_c9_c265_iftrue <= VAR_o_MUX_eth_8_h_l146_c9_c265_iftrue;
     o_MUX_eth_8_h_l146_c9_c265_iffalse <= VAR_o_MUX_eth_8_h_l146_c9_c265_iffalse;
     -- Outputs
     VAR_o_MUX_eth_8_h_l146_c9_c265_return_output := o_MUX_eth_8_h_l146_c9_c265_return_output;

     -- state_MUX[eth_8_h_l158_c9_8d77] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l158_c9_8d77_cond <= VAR_state_MUX_eth_8_h_l158_c9_8d77_cond;
     state_MUX_eth_8_h_l158_c9_8d77_iftrue <= VAR_state_MUX_eth_8_h_l158_c9_8d77_iftrue;
     state_MUX_eth_8_h_l158_c9_8d77_iffalse <= VAR_state_MUX_eth_8_h_l158_c9_8d77_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l158_c9_8d77_return_output := state_MUX_eth_8_h_l158_c9_8d77_return_output;

     -- counter_MUX[eth_8_h_l172_c8_a00c] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l172_c8_a00c_cond <= VAR_counter_MUX_eth_8_h_l172_c8_a00c_cond;
     counter_MUX_eth_8_h_l172_c8_a00c_iftrue <= VAR_counter_MUX_eth_8_h_l172_c8_a00c_iftrue;
     counter_MUX_eth_8_h_l172_c8_a00c_iffalse <= VAR_counter_MUX_eth_8_h_l172_c8_a00c_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l172_c8_a00c_return_output := counter_MUX_eth_8_h_l172_c8_a00c_return_output;

     -- header_MUX[eth_8_h_l130_c5_56e3] LATENCY=0
     -- Inputs
     header_MUX_eth_8_h_l130_c5_56e3_cond <= VAR_header_MUX_eth_8_h_l130_c5_56e3_cond;
     header_MUX_eth_8_h_l130_c5_56e3_iftrue <= VAR_header_MUX_eth_8_h_l130_c5_56e3_iftrue;
     header_MUX_eth_8_h_l130_c5_56e3_iffalse <= VAR_header_MUX_eth_8_h_l130_c5_56e3_iffalse;
     -- Outputs
     VAR_header_MUX_eth_8_h_l130_c5_56e3_return_output := header_MUX_eth_8_h_l130_c5_56e3_return_output;

     -- Submodule level 7
     VAR_counter_MUX_eth_8_h_l158_c9_8d77_iffalse := VAR_counter_MUX_eth_8_h_l172_c8_a00c_return_output;
     VAR_header_MUX_eth_8_h_l128_c3_78c9_iftrue := VAR_header_MUX_eth_8_h_l130_c5_56e3_return_output;
     VAR_o_MUX_eth_8_h_l128_c3_78c9_iffalse := VAR_o_MUX_eth_8_h_l146_c9_c265_return_output;
     VAR_o_MUX_eth_8_h_l128_c3_78c9_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856_eth_8_h_l128_c3_78c9_return_output;
     VAR_state_MUX_eth_8_h_l146_c9_c265_iffalse := VAR_state_MUX_eth_8_h_l158_c9_8d77_return_output;
     -- header_MUX[eth_8_h_l128_c3_78c9] LATENCY=0
     -- Inputs
     header_MUX_eth_8_h_l128_c3_78c9_cond <= VAR_header_MUX_eth_8_h_l128_c3_78c9_cond;
     header_MUX_eth_8_h_l128_c3_78c9_iftrue <= VAR_header_MUX_eth_8_h_l128_c3_78c9_iftrue;
     header_MUX_eth_8_h_l128_c3_78c9_iffalse <= VAR_header_MUX_eth_8_h_l128_c3_78c9_iffalse;
     -- Outputs
     VAR_header_MUX_eth_8_h_l128_c3_78c9_return_output := header_MUX_eth_8_h_l128_c3_78c9_return_output;

     -- o_MUX[eth_8_h_l128_c3_78c9] LATENCY=0
     -- Inputs
     o_MUX_eth_8_h_l128_c3_78c9_cond <= VAR_o_MUX_eth_8_h_l128_c3_78c9_cond;
     o_MUX_eth_8_h_l128_c3_78c9_iftrue <= VAR_o_MUX_eth_8_h_l128_c3_78c9_iftrue;
     o_MUX_eth_8_h_l128_c3_78c9_iffalse <= VAR_o_MUX_eth_8_h_l128_c3_78c9_iffalse;
     -- Outputs
     VAR_o_MUX_eth_8_h_l128_c3_78c9_return_output := o_MUX_eth_8_h_l128_c3_78c9_return_output;

     -- state_MUX[eth_8_h_l146_c9_c265] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l146_c9_c265_cond <= VAR_state_MUX_eth_8_h_l146_c9_c265_cond;
     state_MUX_eth_8_h_l146_c9_c265_iftrue <= VAR_state_MUX_eth_8_h_l146_c9_c265_iftrue;
     state_MUX_eth_8_h_l146_c9_c265_iffalse <= VAR_state_MUX_eth_8_h_l146_c9_c265_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l146_c9_c265_return_output := state_MUX_eth_8_h_l146_c9_c265_return_output;

     -- counter_MUX[eth_8_h_l158_c9_8d77] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l158_c9_8d77_cond <= VAR_counter_MUX_eth_8_h_l158_c9_8d77_cond;
     counter_MUX_eth_8_h_l158_c9_8d77_iftrue <= VAR_counter_MUX_eth_8_h_l158_c9_8d77_iftrue;
     counter_MUX_eth_8_h_l158_c9_8d77_iffalse <= VAR_counter_MUX_eth_8_h_l158_c9_8d77_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l158_c9_8d77_return_output := counter_MUX_eth_8_h_l158_c9_8d77_return_output;

     -- Submodule level 8
     VAR_counter_MUX_eth_8_h_l146_c9_c265_iffalse := VAR_counter_MUX_eth_8_h_l158_c9_8d77_return_output;
     REG_VAR_header := VAR_header_MUX_eth_8_h_l128_c3_78c9_return_output;
     VAR_return_output := VAR_o_MUX_eth_8_h_l128_c3_78c9_return_output;
     VAR_state_MUX_eth_8_h_l128_c3_78c9_iffalse := VAR_state_MUX_eth_8_h_l146_c9_c265_return_output;
     -- counter_MUX[eth_8_h_l146_c9_c265] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l146_c9_c265_cond <= VAR_counter_MUX_eth_8_h_l146_c9_c265_cond;
     counter_MUX_eth_8_h_l146_c9_c265_iftrue <= VAR_counter_MUX_eth_8_h_l146_c9_c265_iftrue;
     counter_MUX_eth_8_h_l146_c9_c265_iffalse <= VAR_counter_MUX_eth_8_h_l146_c9_c265_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l146_c9_c265_return_output := counter_MUX_eth_8_h_l146_c9_c265_return_output;

     -- state_MUX[eth_8_h_l128_c3_78c9] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l128_c3_78c9_cond <= VAR_state_MUX_eth_8_h_l128_c3_78c9_cond;
     state_MUX_eth_8_h_l128_c3_78c9_iftrue <= VAR_state_MUX_eth_8_h_l128_c3_78c9_iftrue;
     state_MUX_eth_8_h_l128_c3_78c9_iffalse <= VAR_state_MUX_eth_8_h_l128_c3_78c9_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l128_c3_78c9_return_output := state_MUX_eth_8_h_l128_c3_78c9_return_output;

     -- Submodule level 9
     VAR_counter_MUX_eth_8_h_l128_c3_78c9_iffalse := VAR_counter_MUX_eth_8_h_l146_c9_c265_return_output;
     REG_VAR_state := VAR_state_MUX_eth_8_h_l128_c3_78c9_return_output;
     -- counter_MUX[eth_8_h_l128_c3_78c9] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l128_c3_78c9_cond <= VAR_counter_MUX_eth_8_h_l128_c3_78c9_cond;
     counter_MUX_eth_8_h_l128_c3_78c9_iftrue <= VAR_counter_MUX_eth_8_h_l128_c3_78c9_iftrue;
     counter_MUX_eth_8_h_l128_c3_78c9_iffalse <= VAR_counter_MUX_eth_8_h_l128_c3_78c9_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l128_c3_78c9_return_output := counter_MUX_eth_8_h_l128_c3_78c9_return_output;

     -- Submodule level 10
     REG_VAR_counter := VAR_counter_MUX_eth_8_h_l128_c3_78c9_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_state <= REG_VAR_state;
REG_COMB_header <= REG_VAR_header;
REG_COMB_counter <= REG_VAR_counter;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if clk_en_internal='1' then
     state <= REG_COMB_state;
     header <= REG_COMB_header;
     counter <= REG_COMB_counter;
 end if;
 end if;
end process;

end arch;
