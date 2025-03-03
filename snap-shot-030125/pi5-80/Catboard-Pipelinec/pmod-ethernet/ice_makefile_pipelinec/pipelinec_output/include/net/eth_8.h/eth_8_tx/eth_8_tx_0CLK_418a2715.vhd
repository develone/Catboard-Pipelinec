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
-- BIN_OP_LT[eth_8_h_l124_c32_f543]
signal BIN_OP_LT_eth_8_h_l124_c32_f543_left : unsigned(5 downto 0);
signal BIN_OP_LT_eth_8_h_l124_c32_f543_right : unsigned(5 downto 0);
signal BIN_OP_LT_eth_8_h_l124_c32_f543_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[eth_8_h_l128_c6_4813]
signal BIN_OP_EQ_eth_8_h_l128_c6_4813_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l128_c6_4813_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l128_c6_4813_return_output : unsigned(0 downto 0);

-- o_MUX[eth_8_h_l128_c3_146b]
signal o_MUX_eth_8_h_l128_c3_146b_cond : unsigned(0 downto 0);
signal o_MUX_eth_8_h_l128_c3_146b_iftrue : eth_8_tx_t;
signal o_MUX_eth_8_h_l128_c3_146b_iffalse : eth_8_tx_t;
signal o_MUX_eth_8_h_l128_c3_146b_return_output : eth_8_tx_t;

-- header_MUX[eth_8_h_l128_c3_146b]
signal header_MUX_eth_8_h_l128_c3_146b_cond : unsigned(0 downto 0);
signal header_MUX_eth_8_h_l128_c3_146b_iftrue : eth_header_t;
signal header_MUX_eth_8_h_l128_c3_146b_iffalse : eth_header_t;
signal header_MUX_eth_8_h_l128_c3_146b_return_output : eth_header_t;

-- state_MUX[eth_8_h_l128_c3_146b]
signal state_MUX_eth_8_h_l128_c3_146b_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l128_c3_146b_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l128_c3_146b_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l128_c3_146b_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l128_c3_146b]
signal counter_MUX_eth_8_h_l128_c3_146b_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l128_c3_146b_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l128_c3_146b_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l128_c3_146b_return_output : unsigned(5 downto 0);

-- o_mac_axis_valid_MUX[eth_8_h_l130_c5_8429]
signal o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_cond : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_iftrue : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_iffalse : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_return_output : unsigned(0 downto 0);

-- o_mac_axis_data_tdata_MUX[eth_8_h_l130_c5_8429]
signal o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_cond : unsigned(0 downto 0);
signal o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_iftrue : uint8_t_1;
signal o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_iffalse : uint8_t_1;
signal o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_return_output : uint8_t_1;

-- header_MUX[eth_8_h_l130_c5_8429]
signal header_MUX_eth_8_h_l130_c5_8429_cond : unsigned(0 downto 0);
signal header_MUX_eth_8_h_l130_c5_8429_iftrue : eth_header_t;
signal header_MUX_eth_8_h_l130_c5_8429_iffalse : eth_header_t;
signal header_MUX_eth_8_h_l130_c5_8429_return_output : eth_header_t;

-- state_MUX[eth_8_h_l130_c5_8429]
signal state_MUX_eth_8_h_l130_c5_8429_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l130_c5_8429_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l130_c5_8429_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l130_c5_8429_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l130_c5_8429]
signal counter_MUX_eth_8_h_l130_c5_8429_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l130_c5_8429_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l130_c5_8429_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l130_c5_8429_return_output : unsigned(5 downto 0);

-- BIN_OP_EQ[eth_8_h_l131_c10_ecbd]
signal BIN_OP_EQ_eth_8_h_l131_c10_ecbd_left : unsigned(5 downto 0);
signal BIN_OP_EQ_eth_8_h_l131_c10_ecbd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_eth_8_h_l131_c10_ecbd_return_output : unsigned(0 downto 0);

-- header_MUX[eth_8_h_l131_c7_b93c]
signal header_MUX_eth_8_h_l131_c7_b93c_cond : unsigned(0 downto 0);
signal header_MUX_eth_8_h_l131_c7_b93c_iftrue : eth_header_t;
signal header_MUX_eth_8_h_l131_c7_b93c_iffalse : eth_header_t;
signal header_MUX_eth_8_h_l131_c7_b93c_return_output : eth_header_t;

-- header_dst_mac_MUX[eth_8_h_l136_c7_7178]
signal header_dst_mac_MUX_eth_8_h_l136_c7_7178_cond : unsigned(0 downto 0);
signal header_dst_mac_MUX_eth_8_h_l136_c7_7178_iftrue : unsigned(47 downto 0);
signal header_dst_mac_MUX_eth_8_h_l136_c7_7178_iffalse : unsigned(47 downto 0);
signal header_dst_mac_MUX_eth_8_h_l136_c7_7178_return_output : unsigned(47 downto 0);

-- state_MUX[eth_8_h_l136_c7_7178]
signal state_MUX_eth_8_h_l136_c7_7178_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l136_c7_7178_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l136_c7_7178_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l136_c7_7178_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l136_c7_7178]
signal counter_MUX_eth_8_h_l136_c7_7178_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l136_c7_7178_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l136_c7_7178_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l136_c7_7178_return_output : unsigned(5 downto 0);

-- CONST_SL_8[eth_8_h_l137_c26_8f68]
signal CONST_SL_8_eth_8_h_l137_c26_8f68_x : unsigned(47 downto 0);
signal CONST_SL_8_eth_8_h_l137_c26_8f68_return_output : unsigned(47 downto 0);

-- BIN_OP_EQ[eth_8_h_l138_c12_3add]
signal BIN_OP_EQ_eth_8_h_l138_c12_3add_left : unsigned(5 downto 0);
signal BIN_OP_EQ_eth_8_h_l138_c12_3add_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l138_c12_3add_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l138_c9_14af]
signal state_MUX_eth_8_h_l138_c9_14af_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l138_c9_14af_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l138_c9_14af_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l138_c9_14af_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l138_c9_14af]
signal counter_MUX_eth_8_h_l138_c9_14af_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l138_c9_14af_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l138_c9_14af_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l138_c9_14af_return_output : unsigned(5 downto 0);

-- BIN_OP_PLUS[eth_8_h_l142_c11_38fa]
signal BIN_OP_PLUS_eth_8_h_l142_c11_38fa_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_eth_8_h_l142_c11_38fa_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l142_c11_38fa_return_output : unsigned(6 downto 0);

-- BIN_OP_EQ[eth_8_h_l146_c12_03f3]
signal BIN_OP_EQ_eth_8_h_l146_c12_03f3_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l146_c12_03f3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l146_c12_03f3_return_output : unsigned(0 downto 0);

-- o_MUX[eth_8_h_l146_c9_831f]
signal o_MUX_eth_8_h_l146_c9_831f_cond : unsigned(0 downto 0);
signal o_MUX_eth_8_h_l146_c9_831f_iftrue : eth_8_tx_t;
signal o_MUX_eth_8_h_l146_c9_831f_iffalse : eth_8_tx_t;
signal o_MUX_eth_8_h_l146_c9_831f_return_output : eth_8_tx_t;

-- header_ethertype_MUX[eth_8_h_l146_c9_831f]
signal header_ethertype_MUX_eth_8_h_l146_c9_831f_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l146_c9_831f_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l146_c9_831f_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l146_c9_831f_return_output : unsigned(15 downto 0);

-- header_src_mac_MUX[eth_8_h_l146_c9_831f]
signal header_src_mac_MUX_eth_8_h_l146_c9_831f_cond : unsigned(0 downto 0);
signal header_src_mac_MUX_eth_8_h_l146_c9_831f_iftrue : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l146_c9_831f_iffalse : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l146_c9_831f_return_output : unsigned(47 downto 0);

-- state_MUX[eth_8_h_l146_c9_831f]
signal state_MUX_eth_8_h_l146_c9_831f_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l146_c9_831f_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l146_c9_831f_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l146_c9_831f_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l146_c9_831f]
signal counter_MUX_eth_8_h_l146_c9_831f_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l146_c9_831f_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l146_c9_831f_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l146_c9_831f_return_output : unsigned(5 downto 0);

-- header_src_mac_MUX[eth_8_h_l149_c5_0fbd]
signal header_src_mac_MUX_eth_8_h_l149_c5_0fbd_cond : unsigned(0 downto 0);
signal header_src_mac_MUX_eth_8_h_l149_c5_0fbd_iftrue : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l149_c5_0fbd_iffalse : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l149_c5_0fbd_return_output : unsigned(47 downto 0);

-- state_MUX[eth_8_h_l149_c5_0fbd]
signal state_MUX_eth_8_h_l149_c5_0fbd_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l149_c5_0fbd_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l149_c5_0fbd_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l149_c5_0fbd_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l149_c5_0fbd]
signal counter_MUX_eth_8_h_l149_c5_0fbd_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l149_c5_0fbd_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l149_c5_0fbd_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l149_c5_0fbd_return_output : unsigned(5 downto 0);

-- CONST_SL_8[eth_8_h_l150_c24_6569]
signal CONST_SL_8_eth_8_h_l150_c24_6569_x : unsigned(47 downto 0);
signal CONST_SL_8_eth_8_h_l150_c24_6569_return_output : unsigned(47 downto 0);

-- BIN_OP_EQ[eth_8_h_l151_c10_0ebc]
signal BIN_OP_EQ_eth_8_h_l151_c10_0ebc_left : unsigned(5 downto 0);
signal BIN_OP_EQ_eth_8_h_l151_c10_0ebc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l151_c10_0ebc_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l151_c7_feb9]
signal state_MUX_eth_8_h_l151_c7_feb9_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l151_c7_feb9_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l151_c7_feb9_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l151_c7_feb9_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l151_c7_feb9]
signal counter_MUX_eth_8_h_l151_c7_feb9_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l151_c7_feb9_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l151_c7_feb9_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l151_c7_feb9_return_output : unsigned(5 downto 0);

-- BIN_OP_PLUS[eth_8_h_l155_c9_5f93]
signal BIN_OP_PLUS_eth_8_h_l155_c9_5f93_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_eth_8_h_l155_c9_5f93_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l155_c9_5f93_return_output : unsigned(6 downto 0);

-- BIN_OP_EQ[eth_8_h_l158_c12_df9b]
signal BIN_OP_EQ_eth_8_h_l158_c12_df9b_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l158_c12_df9b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l158_c12_df9b_return_output : unsigned(0 downto 0);

-- o_MUX[eth_8_h_l158_c9_38ee]
signal o_MUX_eth_8_h_l158_c9_38ee_cond : unsigned(0 downto 0);
signal o_MUX_eth_8_h_l158_c9_38ee_iftrue : eth_8_tx_t;
signal o_MUX_eth_8_h_l158_c9_38ee_iffalse : eth_8_tx_t;
signal o_MUX_eth_8_h_l158_c9_38ee_return_output : eth_8_tx_t;

-- header_ethertype_MUX[eth_8_h_l158_c9_38ee]
signal header_ethertype_MUX_eth_8_h_l158_c9_38ee_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l158_c9_38ee_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l158_c9_38ee_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l158_c9_38ee_return_output : unsigned(15 downto 0);

-- state_MUX[eth_8_h_l158_c9_38ee]
signal state_MUX_eth_8_h_l158_c9_38ee_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l158_c9_38ee_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l158_c9_38ee_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l158_c9_38ee_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l158_c9_38ee]
signal counter_MUX_eth_8_h_l158_c9_38ee_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l158_c9_38ee_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l158_c9_38ee_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l158_c9_38ee_return_output : unsigned(5 downto 0);

-- header_ethertype_MUX[eth_8_h_l161_c5_eef5]
signal header_ethertype_MUX_eth_8_h_l161_c5_eef5_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l161_c5_eef5_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l161_c5_eef5_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l161_c5_eef5_return_output : unsigned(15 downto 0);

-- state_MUX[eth_8_h_l161_c5_eef5]
signal state_MUX_eth_8_h_l161_c5_eef5_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l161_c5_eef5_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l161_c5_eef5_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l161_c5_eef5_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l161_c5_eef5]
signal counter_MUX_eth_8_h_l161_c5_eef5_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l161_c5_eef5_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l161_c5_eef5_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l161_c5_eef5_return_output : unsigned(5 downto 0);

-- CONST_SL_8[eth_8_h_l162_c26_10fa]
signal CONST_SL_8_eth_8_h_l162_c26_10fa_x : unsigned(15 downto 0);
signal CONST_SL_8_eth_8_h_l162_c26_10fa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[eth_8_h_l163_c10_0d58]
signal BIN_OP_EQ_eth_8_h_l163_c10_0d58_left : unsigned(5 downto 0);
signal BIN_OP_EQ_eth_8_h_l163_c10_0d58_right : unsigned(0 downto 0);
signal BIN_OP_EQ_eth_8_h_l163_c10_0d58_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l163_c7_0f40]
signal state_MUX_eth_8_h_l163_c7_0f40_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l163_c7_0f40_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l163_c7_0f40_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l163_c7_0f40_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l163_c7_0f40]
signal counter_MUX_eth_8_h_l163_c7_0f40_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l163_c7_0f40_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l163_c7_0f40_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l163_c7_0f40_return_output : unsigned(5 downto 0);

-- BIN_OP_PLUS[eth_8_h_l167_c9_c21b]
signal BIN_OP_PLUS_eth_8_h_l167_c9_c21b_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_eth_8_h_l167_c9_c21b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l167_c9_c21b_return_output : unsigned(6 downto 0);

-- BIN_OP_EQ[eth_8_h_l172_c11_eb5e]
signal BIN_OP_EQ_eth_8_h_l172_c11_eb5e_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l172_c11_eb5e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l172_c11_eb5e_return_output : unsigned(0 downto 0);

-- o_MUX[eth_8_h_l172_c8_9f43]
signal o_MUX_eth_8_h_l172_c8_9f43_cond : unsigned(0 downto 0);
signal o_MUX_eth_8_h_l172_c8_9f43_iftrue : eth_8_tx_t;
signal o_MUX_eth_8_h_l172_c8_9f43_iffalse : eth_8_tx_t;
signal o_MUX_eth_8_h_l172_c8_9f43_return_output : eth_8_tx_t;

-- state_MUX[eth_8_h_l172_c8_9f43]
signal state_MUX_eth_8_h_l172_c8_9f43_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l172_c8_9f43_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l172_c8_9f43_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l172_c8_9f43_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l172_c8_9f43]
signal counter_MUX_eth_8_h_l172_c8_9f43_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l172_c8_9f43_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l172_c8_9f43_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l172_c8_9f43_return_output : unsigned(5 downto 0);

-- MUX[eth_8_h_l176_c29_d1bb]
signal MUX_eth_8_h_l176_c29_d1bb_cond : unsigned(0 downto 0);
signal MUX_eth_8_h_l176_c29_d1bb_iftrue : unsigned(0 downto 0);
signal MUX_eth_8_h_l176_c29_d1bb_iffalse : unsigned(0 downto 0);
signal MUX_eth_8_h_l176_c29_d1bb_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[eth_8_h_l179_c8_57d6]
signal BIN_OP_AND_eth_8_h_l179_c8_57d6_left : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l179_c8_57d6_right : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l179_c8_57d6_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l179_c5_c04e]
signal state_MUX_eth_8_h_l179_c5_c04e_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l179_c5_c04e_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l179_c5_c04e_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l179_c5_c04e_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l179_c5_c04e]
signal counter_MUX_eth_8_h_l179_c5_c04e_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l179_c5_c04e_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l179_c5_c04e_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l179_c5_c04e_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l180_c7_8da5]
signal state_MUX_eth_8_h_l180_c7_8da5_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l180_c7_8da5_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l180_c7_8da5_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l180_c7_8da5_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l180_c7_8da5]
signal counter_MUX_eth_8_h_l180_c7_8da5_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l180_c7_8da5_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l180_c7_8da5_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l180_c7_8da5_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l182_c9_3c37]
signal state_MUX_eth_8_h_l182_c9_3c37_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l182_c9_3c37_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l182_c9_3c37_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l182_c9_3c37_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l182_c9_3c37]
signal counter_MUX_eth_8_h_l182_c9_3c37_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l182_c9_3c37_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l182_c9_3c37_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l182_c9_3c37_return_output : unsigned(5 downto 0);

-- counter_MUX[eth_8_h_l189_c7_71a6]
signal counter_MUX_eth_8_h_l189_c7_71a6_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l189_c7_71a6_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l189_c7_71a6_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l189_c7_71a6_return_output : unsigned(5 downto 0);

-- BIN_OP_PLUS[eth_8_h_l190_c9_20ee]
signal BIN_OP_PLUS_eth_8_h_l190_c9_20ee_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_eth_8_h_l190_c9_20ee_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l190_c9_20ee_return_output : unsigned(6 downto 0);

-- BIN_OP_EQ[eth_8_h_l195_c11_191d]
signal BIN_OP_EQ_eth_8_h_l195_c11_191d_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l195_c11_191d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l195_c11_191d_return_output : unsigned(0 downto 0);

-- o_mac_axis_valid_MUX[eth_8_h_l195_c8_66e2]
signal o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_cond : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_iftrue : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_iffalse : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_return_output : unsigned(0 downto 0);

-- o_mac_axis_data_tdata_MUX[eth_8_h_l195_c8_66e2]
signal o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_cond : unsigned(0 downto 0);
signal o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_iftrue : uint8_t_1;
signal o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_iffalse : uint8_t_1;
signal o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_return_output : uint8_t_1;

-- o_mac_axis_data_tlast_MUX[eth_8_h_l195_c8_66e2]
signal o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_cond : unsigned(0 downto 0);
signal o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_iftrue : unsigned(0 downto 0);
signal o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_iffalse : unsigned(0 downto 0);
signal o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l195_c8_66e2]
signal state_MUX_eth_8_h_l195_c8_66e2_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l195_c8_66e2_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l195_c8_66e2_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l195_c8_66e2_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l195_c8_66e2]
signal counter_MUX_eth_8_h_l195_c8_66e2_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l195_c8_66e2_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l195_c8_66e2_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l195_c8_66e2_return_output : unsigned(5 downto 0);

-- UNARY_OP_NOT[eth_8_h_l197_c30_706a]
signal UNARY_OP_NOT_eth_8_h_l197_c30_706a_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_eth_8_h_l197_c30_706a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[eth_8_h_l199_c8_abe9]
signal BIN_OP_AND_eth_8_h_l199_c8_abe9_left : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l199_c8_abe9_right : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l199_c8_abe9_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l199_c5_a6f0]
signal state_MUX_eth_8_h_l199_c5_a6f0_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l199_c5_a6f0_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l199_c5_a6f0_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l199_c5_a6f0_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l199_c5_a6f0]
signal counter_MUX_eth_8_h_l199_c5_a6f0_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l199_c5_a6f0_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l199_c5_a6f0_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l199_c5_a6f0_return_output : unsigned(5 downto 0);

-- BIN_OP_PLUS[eth_8_h_l200_c7_0997]
signal BIN_OP_PLUS_eth_8_h_l200_c7_0997_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_eth_8_h_l200_c7_0997_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l200_c7_0997_return_output : unsigned(6 downto 0);

-- state_MUX[eth_8_h_l201_c7_e8c9]
signal state_MUX_eth_8_h_l201_c7_e8c9_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l201_c7_e8c9_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l201_c7_e8c9_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l201_c7_e8c9_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l201_c7_e8c9]
signal counter_MUX_eth_8_h_l201_c7_e8c9_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l201_c7_e8c9_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l201_c7_e8c9_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l201_c7_e8c9_return_output : unsigned(5 downto 0);

function uint48_47_40( x : unsigned) return unsigned is
--variable x : unsigned(47 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(47 downto 40)));
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
-- BIN_OP_LT_eth_8_h_l124_c32_f543 : 0 clocks latency
BIN_OP_LT_eth_8_h_l124_c32_f543 : entity work.BIN_OP_LT_uint6_t_uint6_t_0CLK_380ecc95 port map (
BIN_OP_LT_eth_8_h_l124_c32_f543_left,
BIN_OP_LT_eth_8_h_l124_c32_f543_right,
BIN_OP_LT_eth_8_h_l124_c32_f543_return_output);

-- BIN_OP_EQ_eth_8_h_l128_c6_4813 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l128_c6_4813 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l128_c6_4813_left,
BIN_OP_EQ_eth_8_h_l128_c6_4813_right,
BIN_OP_EQ_eth_8_h_l128_c6_4813_return_output);

-- o_MUX_eth_8_h_l128_c3_146b : 0 clocks latency
o_MUX_eth_8_h_l128_c3_146b : entity work.MUX_uint1_t_eth_8_tx_t_eth_8_tx_t_0CLK_de264c78 port map (
o_MUX_eth_8_h_l128_c3_146b_cond,
o_MUX_eth_8_h_l128_c3_146b_iftrue,
o_MUX_eth_8_h_l128_c3_146b_iffalse,
o_MUX_eth_8_h_l128_c3_146b_return_output);

-- header_MUX_eth_8_h_l128_c3_146b : 0 clocks latency
header_MUX_eth_8_h_l128_c3_146b : entity work.MUX_uint1_t_eth_header_t_eth_header_t_0CLK_de264c78 port map (
header_MUX_eth_8_h_l128_c3_146b_cond,
header_MUX_eth_8_h_l128_c3_146b_iftrue,
header_MUX_eth_8_h_l128_c3_146b_iffalse,
header_MUX_eth_8_h_l128_c3_146b_return_output);

-- state_MUX_eth_8_h_l128_c3_146b : 0 clocks latency
state_MUX_eth_8_h_l128_c3_146b : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l128_c3_146b_cond,
state_MUX_eth_8_h_l128_c3_146b_iftrue,
state_MUX_eth_8_h_l128_c3_146b_iffalse,
state_MUX_eth_8_h_l128_c3_146b_return_output);

-- counter_MUX_eth_8_h_l128_c3_146b : 0 clocks latency
counter_MUX_eth_8_h_l128_c3_146b : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l128_c3_146b_cond,
counter_MUX_eth_8_h_l128_c3_146b_iftrue,
counter_MUX_eth_8_h_l128_c3_146b_iffalse,
counter_MUX_eth_8_h_l128_c3_146b_return_output);

-- o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429 : 0 clocks latency
o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_cond,
o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_iftrue,
o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_iffalse,
o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_return_output);

-- o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429 : 0 clocks latency
o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429 : entity work.MUX_uint1_t_uint8_t_1_uint8_t_1_0CLK_de264c78 port map (
o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_cond,
o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_iftrue,
o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_iffalse,
o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_return_output);

-- header_MUX_eth_8_h_l130_c5_8429 : 0 clocks latency
header_MUX_eth_8_h_l130_c5_8429 : entity work.MUX_uint1_t_eth_header_t_eth_header_t_0CLK_de264c78 port map (
header_MUX_eth_8_h_l130_c5_8429_cond,
header_MUX_eth_8_h_l130_c5_8429_iftrue,
header_MUX_eth_8_h_l130_c5_8429_iffalse,
header_MUX_eth_8_h_l130_c5_8429_return_output);

-- state_MUX_eth_8_h_l130_c5_8429 : 0 clocks latency
state_MUX_eth_8_h_l130_c5_8429 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l130_c5_8429_cond,
state_MUX_eth_8_h_l130_c5_8429_iftrue,
state_MUX_eth_8_h_l130_c5_8429_iffalse,
state_MUX_eth_8_h_l130_c5_8429_return_output);

-- counter_MUX_eth_8_h_l130_c5_8429 : 0 clocks latency
counter_MUX_eth_8_h_l130_c5_8429 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l130_c5_8429_cond,
counter_MUX_eth_8_h_l130_c5_8429_iftrue,
counter_MUX_eth_8_h_l130_c5_8429_iffalse,
counter_MUX_eth_8_h_l130_c5_8429_return_output);

-- BIN_OP_EQ_eth_8_h_l131_c10_ecbd : 0 clocks latency
BIN_OP_EQ_eth_8_h_l131_c10_ecbd : entity work.BIN_OP_EQ_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l131_c10_ecbd_left,
BIN_OP_EQ_eth_8_h_l131_c10_ecbd_right,
BIN_OP_EQ_eth_8_h_l131_c10_ecbd_return_output);

-- header_MUX_eth_8_h_l131_c7_b93c : 0 clocks latency
header_MUX_eth_8_h_l131_c7_b93c : entity work.MUX_uint1_t_eth_header_t_eth_header_t_0CLK_de264c78 port map (
header_MUX_eth_8_h_l131_c7_b93c_cond,
header_MUX_eth_8_h_l131_c7_b93c_iftrue,
header_MUX_eth_8_h_l131_c7_b93c_iffalse,
header_MUX_eth_8_h_l131_c7_b93c_return_output);

-- header_dst_mac_MUX_eth_8_h_l136_c7_7178 : 0 clocks latency
header_dst_mac_MUX_eth_8_h_l136_c7_7178 : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_dst_mac_MUX_eth_8_h_l136_c7_7178_cond,
header_dst_mac_MUX_eth_8_h_l136_c7_7178_iftrue,
header_dst_mac_MUX_eth_8_h_l136_c7_7178_iffalse,
header_dst_mac_MUX_eth_8_h_l136_c7_7178_return_output);

-- state_MUX_eth_8_h_l136_c7_7178 : 0 clocks latency
state_MUX_eth_8_h_l136_c7_7178 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l136_c7_7178_cond,
state_MUX_eth_8_h_l136_c7_7178_iftrue,
state_MUX_eth_8_h_l136_c7_7178_iffalse,
state_MUX_eth_8_h_l136_c7_7178_return_output);

-- counter_MUX_eth_8_h_l136_c7_7178 : 0 clocks latency
counter_MUX_eth_8_h_l136_c7_7178 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l136_c7_7178_cond,
counter_MUX_eth_8_h_l136_c7_7178_iftrue,
counter_MUX_eth_8_h_l136_c7_7178_iffalse,
counter_MUX_eth_8_h_l136_c7_7178_return_output);

-- CONST_SL_8_eth_8_h_l137_c26_8f68 : 0 clocks latency
CONST_SL_8_eth_8_h_l137_c26_8f68 : entity work.CONST_SL_8_uint48_t_0CLK_de264c78 port map (
CONST_SL_8_eth_8_h_l137_c26_8f68_x,
CONST_SL_8_eth_8_h_l137_c26_8f68_return_output);

-- BIN_OP_EQ_eth_8_h_l138_c12_3add : 0 clocks latency
BIN_OP_EQ_eth_8_h_l138_c12_3add : entity work.BIN_OP_EQ_uint6_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l138_c12_3add_left,
BIN_OP_EQ_eth_8_h_l138_c12_3add_right,
BIN_OP_EQ_eth_8_h_l138_c12_3add_return_output);

-- state_MUX_eth_8_h_l138_c9_14af : 0 clocks latency
state_MUX_eth_8_h_l138_c9_14af : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l138_c9_14af_cond,
state_MUX_eth_8_h_l138_c9_14af_iftrue,
state_MUX_eth_8_h_l138_c9_14af_iffalse,
state_MUX_eth_8_h_l138_c9_14af_return_output);

-- counter_MUX_eth_8_h_l138_c9_14af : 0 clocks latency
counter_MUX_eth_8_h_l138_c9_14af : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l138_c9_14af_cond,
counter_MUX_eth_8_h_l138_c9_14af_iftrue,
counter_MUX_eth_8_h_l138_c9_14af_iffalse,
counter_MUX_eth_8_h_l138_c9_14af_return_output);

-- BIN_OP_PLUS_eth_8_h_l142_c11_38fa : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l142_c11_38fa : entity work.BIN_OP_PLUS_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l142_c11_38fa_left,
BIN_OP_PLUS_eth_8_h_l142_c11_38fa_right,
BIN_OP_PLUS_eth_8_h_l142_c11_38fa_return_output);

-- BIN_OP_EQ_eth_8_h_l146_c12_03f3 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l146_c12_03f3 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l146_c12_03f3_left,
BIN_OP_EQ_eth_8_h_l146_c12_03f3_right,
BIN_OP_EQ_eth_8_h_l146_c12_03f3_return_output);

-- o_MUX_eth_8_h_l146_c9_831f : 0 clocks latency
o_MUX_eth_8_h_l146_c9_831f : entity work.MUX_uint1_t_eth_8_tx_t_eth_8_tx_t_0CLK_de264c78 port map (
o_MUX_eth_8_h_l146_c9_831f_cond,
o_MUX_eth_8_h_l146_c9_831f_iftrue,
o_MUX_eth_8_h_l146_c9_831f_iffalse,
o_MUX_eth_8_h_l146_c9_831f_return_output);

-- header_ethertype_MUX_eth_8_h_l146_c9_831f : 0 clocks latency
header_ethertype_MUX_eth_8_h_l146_c9_831f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l146_c9_831f_cond,
header_ethertype_MUX_eth_8_h_l146_c9_831f_iftrue,
header_ethertype_MUX_eth_8_h_l146_c9_831f_iffalse,
header_ethertype_MUX_eth_8_h_l146_c9_831f_return_output);

-- header_src_mac_MUX_eth_8_h_l146_c9_831f : 0 clocks latency
header_src_mac_MUX_eth_8_h_l146_c9_831f : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_src_mac_MUX_eth_8_h_l146_c9_831f_cond,
header_src_mac_MUX_eth_8_h_l146_c9_831f_iftrue,
header_src_mac_MUX_eth_8_h_l146_c9_831f_iffalse,
header_src_mac_MUX_eth_8_h_l146_c9_831f_return_output);

-- state_MUX_eth_8_h_l146_c9_831f : 0 clocks latency
state_MUX_eth_8_h_l146_c9_831f : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l146_c9_831f_cond,
state_MUX_eth_8_h_l146_c9_831f_iftrue,
state_MUX_eth_8_h_l146_c9_831f_iffalse,
state_MUX_eth_8_h_l146_c9_831f_return_output);

-- counter_MUX_eth_8_h_l146_c9_831f : 0 clocks latency
counter_MUX_eth_8_h_l146_c9_831f : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l146_c9_831f_cond,
counter_MUX_eth_8_h_l146_c9_831f_iftrue,
counter_MUX_eth_8_h_l146_c9_831f_iffalse,
counter_MUX_eth_8_h_l146_c9_831f_return_output);

-- header_src_mac_MUX_eth_8_h_l149_c5_0fbd : 0 clocks latency
header_src_mac_MUX_eth_8_h_l149_c5_0fbd : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_src_mac_MUX_eth_8_h_l149_c5_0fbd_cond,
header_src_mac_MUX_eth_8_h_l149_c5_0fbd_iftrue,
header_src_mac_MUX_eth_8_h_l149_c5_0fbd_iffalse,
header_src_mac_MUX_eth_8_h_l149_c5_0fbd_return_output);

-- state_MUX_eth_8_h_l149_c5_0fbd : 0 clocks latency
state_MUX_eth_8_h_l149_c5_0fbd : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l149_c5_0fbd_cond,
state_MUX_eth_8_h_l149_c5_0fbd_iftrue,
state_MUX_eth_8_h_l149_c5_0fbd_iffalse,
state_MUX_eth_8_h_l149_c5_0fbd_return_output);

-- counter_MUX_eth_8_h_l149_c5_0fbd : 0 clocks latency
counter_MUX_eth_8_h_l149_c5_0fbd : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l149_c5_0fbd_cond,
counter_MUX_eth_8_h_l149_c5_0fbd_iftrue,
counter_MUX_eth_8_h_l149_c5_0fbd_iffalse,
counter_MUX_eth_8_h_l149_c5_0fbd_return_output);

-- CONST_SL_8_eth_8_h_l150_c24_6569 : 0 clocks latency
CONST_SL_8_eth_8_h_l150_c24_6569 : entity work.CONST_SL_8_uint48_t_0CLK_de264c78 port map (
CONST_SL_8_eth_8_h_l150_c24_6569_x,
CONST_SL_8_eth_8_h_l150_c24_6569_return_output);

-- BIN_OP_EQ_eth_8_h_l151_c10_0ebc : 0 clocks latency
BIN_OP_EQ_eth_8_h_l151_c10_0ebc : entity work.BIN_OP_EQ_uint6_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l151_c10_0ebc_left,
BIN_OP_EQ_eth_8_h_l151_c10_0ebc_right,
BIN_OP_EQ_eth_8_h_l151_c10_0ebc_return_output);

-- state_MUX_eth_8_h_l151_c7_feb9 : 0 clocks latency
state_MUX_eth_8_h_l151_c7_feb9 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l151_c7_feb9_cond,
state_MUX_eth_8_h_l151_c7_feb9_iftrue,
state_MUX_eth_8_h_l151_c7_feb9_iffalse,
state_MUX_eth_8_h_l151_c7_feb9_return_output);

-- counter_MUX_eth_8_h_l151_c7_feb9 : 0 clocks latency
counter_MUX_eth_8_h_l151_c7_feb9 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l151_c7_feb9_cond,
counter_MUX_eth_8_h_l151_c7_feb9_iftrue,
counter_MUX_eth_8_h_l151_c7_feb9_iffalse,
counter_MUX_eth_8_h_l151_c7_feb9_return_output);

-- BIN_OP_PLUS_eth_8_h_l155_c9_5f93 : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l155_c9_5f93 : entity work.BIN_OP_PLUS_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l155_c9_5f93_left,
BIN_OP_PLUS_eth_8_h_l155_c9_5f93_right,
BIN_OP_PLUS_eth_8_h_l155_c9_5f93_return_output);

-- BIN_OP_EQ_eth_8_h_l158_c12_df9b : 0 clocks latency
BIN_OP_EQ_eth_8_h_l158_c12_df9b : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l158_c12_df9b_left,
BIN_OP_EQ_eth_8_h_l158_c12_df9b_right,
BIN_OP_EQ_eth_8_h_l158_c12_df9b_return_output);

-- o_MUX_eth_8_h_l158_c9_38ee : 0 clocks latency
o_MUX_eth_8_h_l158_c9_38ee : entity work.MUX_uint1_t_eth_8_tx_t_eth_8_tx_t_0CLK_de264c78 port map (
o_MUX_eth_8_h_l158_c9_38ee_cond,
o_MUX_eth_8_h_l158_c9_38ee_iftrue,
o_MUX_eth_8_h_l158_c9_38ee_iffalse,
o_MUX_eth_8_h_l158_c9_38ee_return_output);

-- header_ethertype_MUX_eth_8_h_l158_c9_38ee : 0 clocks latency
header_ethertype_MUX_eth_8_h_l158_c9_38ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l158_c9_38ee_cond,
header_ethertype_MUX_eth_8_h_l158_c9_38ee_iftrue,
header_ethertype_MUX_eth_8_h_l158_c9_38ee_iffalse,
header_ethertype_MUX_eth_8_h_l158_c9_38ee_return_output);

-- state_MUX_eth_8_h_l158_c9_38ee : 0 clocks latency
state_MUX_eth_8_h_l158_c9_38ee : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l158_c9_38ee_cond,
state_MUX_eth_8_h_l158_c9_38ee_iftrue,
state_MUX_eth_8_h_l158_c9_38ee_iffalse,
state_MUX_eth_8_h_l158_c9_38ee_return_output);

-- counter_MUX_eth_8_h_l158_c9_38ee : 0 clocks latency
counter_MUX_eth_8_h_l158_c9_38ee : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l158_c9_38ee_cond,
counter_MUX_eth_8_h_l158_c9_38ee_iftrue,
counter_MUX_eth_8_h_l158_c9_38ee_iffalse,
counter_MUX_eth_8_h_l158_c9_38ee_return_output);

-- header_ethertype_MUX_eth_8_h_l161_c5_eef5 : 0 clocks latency
header_ethertype_MUX_eth_8_h_l161_c5_eef5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l161_c5_eef5_cond,
header_ethertype_MUX_eth_8_h_l161_c5_eef5_iftrue,
header_ethertype_MUX_eth_8_h_l161_c5_eef5_iffalse,
header_ethertype_MUX_eth_8_h_l161_c5_eef5_return_output);

-- state_MUX_eth_8_h_l161_c5_eef5 : 0 clocks latency
state_MUX_eth_8_h_l161_c5_eef5 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l161_c5_eef5_cond,
state_MUX_eth_8_h_l161_c5_eef5_iftrue,
state_MUX_eth_8_h_l161_c5_eef5_iffalse,
state_MUX_eth_8_h_l161_c5_eef5_return_output);

-- counter_MUX_eth_8_h_l161_c5_eef5 : 0 clocks latency
counter_MUX_eth_8_h_l161_c5_eef5 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l161_c5_eef5_cond,
counter_MUX_eth_8_h_l161_c5_eef5_iftrue,
counter_MUX_eth_8_h_l161_c5_eef5_iffalse,
counter_MUX_eth_8_h_l161_c5_eef5_return_output);

-- CONST_SL_8_eth_8_h_l162_c26_10fa : 0 clocks latency
CONST_SL_8_eth_8_h_l162_c26_10fa : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_eth_8_h_l162_c26_10fa_x,
CONST_SL_8_eth_8_h_l162_c26_10fa_return_output);

-- BIN_OP_EQ_eth_8_h_l163_c10_0d58 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l163_c10_0d58 : entity work.BIN_OP_EQ_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l163_c10_0d58_left,
BIN_OP_EQ_eth_8_h_l163_c10_0d58_right,
BIN_OP_EQ_eth_8_h_l163_c10_0d58_return_output);

-- state_MUX_eth_8_h_l163_c7_0f40 : 0 clocks latency
state_MUX_eth_8_h_l163_c7_0f40 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l163_c7_0f40_cond,
state_MUX_eth_8_h_l163_c7_0f40_iftrue,
state_MUX_eth_8_h_l163_c7_0f40_iffalse,
state_MUX_eth_8_h_l163_c7_0f40_return_output);

-- counter_MUX_eth_8_h_l163_c7_0f40 : 0 clocks latency
counter_MUX_eth_8_h_l163_c7_0f40 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l163_c7_0f40_cond,
counter_MUX_eth_8_h_l163_c7_0f40_iftrue,
counter_MUX_eth_8_h_l163_c7_0f40_iffalse,
counter_MUX_eth_8_h_l163_c7_0f40_return_output);

-- BIN_OP_PLUS_eth_8_h_l167_c9_c21b : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l167_c9_c21b : entity work.BIN_OP_PLUS_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l167_c9_c21b_left,
BIN_OP_PLUS_eth_8_h_l167_c9_c21b_right,
BIN_OP_PLUS_eth_8_h_l167_c9_c21b_return_output);

-- BIN_OP_EQ_eth_8_h_l172_c11_eb5e : 0 clocks latency
BIN_OP_EQ_eth_8_h_l172_c11_eb5e : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l172_c11_eb5e_left,
BIN_OP_EQ_eth_8_h_l172_c11_eb5e_right,
BIN_OP_EQ_eth_8_h_l172_c11_eb5e_return_output);

-- o_MUX_eth_8_h_l172_c8_9f43 : 0 clocks latency
o_MUX_eth_8_h_l172_c8_9f43 : entity work.MUX_uint1_t_eth_8_tx_t_eth_8_tx_t_0CLK_de264c78 port map (
o_MUX_eth_8_h_l172_c8_9f43_cond,
o_MUX_eth_8_h_l172_c8_9f43_iftrue,
o_MUX_eth_8_h_l172_c8_9f43_iffalse,
o_MUX_eth_8_h_l172_c8_9f43_return_output);

-- state_MUX_eth_8_h_l172_c8_9f43 : 0 clocks latency
state_MUX_eth_8_h_l172_c8_9f43 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l172_c8_9f43_cond,
state_MUX_eth_8_h_l172_c8_9f43_iftrue,
state_MUX_eth_8_h_l172_c8_9f43_iffalse,
state_MUX_eth_8_h_l172_c8_9f43_return_output);

-- counter_MUX_eth_8_h_l172_c8_9f43 : 0 clocks latency
counter_MUX_eth_8_h_l172_c8_9f43 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l172_c8_9f43_cond,
counter_MUX_eth_8_h_l172_c8_9f43_iftrue,
counter_MUX_eth_8_h_l172_c8_9f43_iffalse,
counter_MUX_eth_8_h_l172_c8_9f43_return_output);

-- MUX_eth_8_h_l176_c29_d1bb : 0 clocks latency
MUX_eth_8_h_l176_c29_d1bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_eth_8_h_l176_c29_d1bb_cond,
MUX_eth_8_h_l176_c29_d1bb_iftrue,
MUX_eth_8_h_l176_c29_d1bb_iffalse,
MUX_eth_8_h_l176_c29_d1bb_return_output);

-- BIN_OP_AND_eth_8_h_l179_c8_57d6 : 0 clocks latency
BIN_OP_AND_eth_8_h_l179_c8_57d6 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_eth_8_h_l179_c8_57d6_left,
BIN_OP_AND_eth_8_h_l179_c8_57d6_right,
BIN_OP_AND_eth_8_h_l179_c8_57d6_return_output);

-- state_MUX_eth_8_h_l179_c5_c04e : 0 clocks latency
state_MUX_eth_8_h_l179_c5_c04e : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l179_c5_c04e_cond,
state_MUX_eth_8_h_l179_c5_c04e_iftrue,
state_MUX_eth_8_h_l179_c5_c04e_iffalse,
state_MUX_eth_8_h_l179_c5_c04e_return_output);

-- counter_MUX_eth_8_h_l179_c5_c04e : 0 clocks latency
counter_MUX_eth_8_h_l179_c5_c04e : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l179_c5_c04e_cond,
counter_MUX_eth_8_h_l179_c5_c04e_iftrue,
counter_MUX_eth_8_h_l179_c5_c04e_iffalse,
counter_MUX_eth_8_h_l179_c5_c04e_return_output);

-- state_MUX_eth_8_h_l180_c7_8da5 : 0 clocks latency
state_MUX_eth_8_h_l180_c7_8da5 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l180_c7_8da5_cond,
state_MUX_eth_8_h_l180_c7_8da5_iftrue,
state_MUX_eth_8_h_l180_c7_8da5_iffalse,
state_MUX_eth_8_h_l180_c7_8da5_return_output);

-- counter_MUX_eth_8_h_l180_c7_8da5 : 0 clocks latency
counter_MUX_eth_8_h_l180_c7_8da5 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l180_c7_8da5_cond,
counter_MUX_eth_8_h_l180_c7_8da5_iftrue,
counter_MUX_eth_8_h_l180_c7_8da5_iffalse,
counter_MUX_eth_8_h_l180_c7_8da5_return_output);

-- state_MUX_eth_8_h_l182_c9_3c37 : 0 clocks latency
state_MUX_eth_8_h_l182_c9_3c37 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l182_c9_3c37_cond,
state_MUX_eth_8_h_l182_c9_3c37_iftrue,
state_MUX_eth_8_h_l182_c9_3c37_iffalse,
state_MUX_eth_8_h_l182_c9_3c37_return_output);

-- counter_MUX_eth_8_h_l182_c9_3c37 : 0 clocks latency
counter_MUX_eth_8_h_l182_c9_3c37 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l182_c9_3c37_cond,
counter_MUX_eth_8_h_l182_c9_3c37_iftrue,
counter_MUX_eth_8_h_l182_c9_3c37_iffalse,
counter_MUX_eth_8_h_l182_c9_3c37_return_output);

-- counter_MUX_eth_8_h_l189_c7_71a6 : 0 clocks latency
counter_MUX_eth_8_h_l189_c7_71a6 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l189_c7_71a6_cond,
counter_MUX_eth_8_h_l189_c7_71a6_iftrue,
counter_MUX_eth_8_h_l189_c7_71a6_iffalse,
counter_MUX_eth_8_h_l189_c7_71a6_return_output);

-- BIN_OP_PLUS_eth_8_h_l190_c9_20ee : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l190_c9_20ee : entity work.BIN_OP_PLUS_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l190_c9_20ee_left,
BIN_OP_PLUS_eth_8_h_l190_c9_20ee_right,
BIN_OP_PLUS_eth_8_h_l190_c9_20ee_return_output);

-- BIN_OP_EQ_eth_8_h_l195_c11_191d : 0 clocks latency
BIN_OP_EQ_eth_8_h_l195_c11_191d : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l195_c11_191d_left,
BIN_OP_EQ_eth_8_h_l195_c11_191d_right,
BIN_OP_EQ_eth_8_h_l195_c11_191d_return_output);

-- o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2 : 0 clocks latency
o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_cond,
o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_iftrue,
o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_iffalse,
o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_return_output);

-- o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2 : 0 clocks latency
o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2 : entity work.MUX_uint1_t_uint8_t_1_uint8_t_1_0CLK_de264c78 port map (
o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_cond,
o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_iftrue,
o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_iffalse,
o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_return_output);

-- o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2 : 0 clocks latency
o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_cond,
o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_iftrue,
o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_iffalse,
o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_return_output);

-- state_MUX_eth_8_h_l195_c8_66e2 : 0 clocks latency
state_MUX_eth_8_h_l195_c8_66e2 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l195_c8_66e2_cond,
state_MUX_eth_8_h_l195_c8_66e2_iftrue,
state_MUX_eth_8_h_l195_c8_66e2_iffalse,
state_MUX_eth_8_h_l195_c8_66e2_return_output);

-- counter_MUX_eth_8_h_l195_c8_66e2 : 0 clocks latency
counter_MUX_eth_8_h_l195_c8_66e2 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l195_c8_66e2_cond,
counter_MUX_eth_8_h_l195_c8_66e2_iftrue,
counter_MUX_eth_8_h_l195_c8_66e2_iffalse,
counter_MUX_eth_8_h_l195_c8_66e2_return_output);

-- UNARY_OP_NOT_eth_8_h_l197_c30_706a : 0 clocks latency
UNARY_OP_NOT_eth_8_h_l197_c30_706a : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_eth_8_h_l197_c30_706a_expr,
UNARY_OP_NOT_eth_8_h_l197_c30_706a_return_output);

-- BIN_OP_AND_eth_8_h_l199_c8_abe9 : 0 clocks latency
BIN_OP_AND_eth_8_h_l199_c8_abe9 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_eth_8_h_l199_c8_abe9_left,
BIN_OP_AND_eth_8_h_l199_c8_abe9_right,
BIN_OP_AND_eth_8_h_l199_c8_abe9_return_output);

-- state_MUX_eth_8_h_l199_c5_a6f0 : 0 clocks latency
state_MUX_eth_8_h_l199_c5_a6f0 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l199_c5_a6f0_cond,
state_MUX_eth_8_h_l199_c5_a6f0_iftrue,
state_MUX_eth_8_h_l199_c5_a6f0_iffalse,
state_MUX_eth_8_h_l199_c5_a6f0_return_output);

-- counter_MUX_eth_8_h_l199_c5_a6f0 : 0 clocks latency
counter_MUX_eth_8_h_l199_c5_a6f0 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l199_c5_a6f0_cond,
counter_MUX_eth_8_h_l199_c5_a6f0_iftrue,
counter_MUX_eth_8_h_l199_c5_a6f0_iffalse,
counter_MUX_eth_8_h_l199_c5_a6f0_return_output);

-- BIN_OP_PLUS_eth_8_h_l200_c7_0997 : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l200_c7_0997 : entity work.BIN_OP_PLUS_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l200_c7_0997_left,
BIN_OP_PLUS_eth_8_h_l200_c7_0997_right,
BIN_OP_PLUS_eth_8_h_l200_c7_0997_return_output);

-- state_MUX_eth_8_h_l201_c7_e8c9 : 0 clocks latency
state_MUX_eth_8_h_l201_c7_e8c9 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l201_c7_e8c9_cond,
state_MUX_eth_8_h_l201_c7_e8c9_iftrue,
state_MUX_eth_8_h_l201_c7_e8c9_iffalse,
state_MUX_eth_8_h_l201_c7_e8c9_return_output);

-- counter_MUX_eth_8_h_l201_c7_e8c9 : 0 clocks latency
counter_MUX_eth_8_h_l201_c7_e8c9 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l201_c7_e8c9_cond,
counter_MUX_eth_8_h_l201_c7_e8c9_iftrue,
counter_MUX_eth_8_h_l201_c7_e8c9_iffalse,
counter_MUX_eth_8_h_l201_c7_e8c9_return_output);



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
 BIN_OP_LT_eth_8_h_l124_c32_f543_return_output,
 BIN_OP_EQ_eth_8_h_l128_c6_4813_return_output,
 o_MUX_eth_8_h_l128_c3_146b_return_output,
 header_MUX_eth_8_h_l128_c3_146b_return_output,
 state_MUX_eth_8_h_l128_c3_146b_return_output,
 counter_MUX_eth_8_h_l128_c3_146b_return_output,
 o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_return_output,
 o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_return_output,
 header_MUX_eth_8_h_l130_c5_8429_return_output,
 state_MUX_eth_8_h_l130_c5_8429_return_output,
 counter_MUX_eth_8_h_l130_c5_8429_return_output,
 BIN_OP_EQ_eth_8_h_l131_c10_ecbd_return_output,
 header_MUX_eth_8_h_l131_c7_b93c_return_output,
 header_dst_mac_MUX_eth_8_h_l136_c7_7178_return_output,
 state_MUX_eth_8_h_l136_c7_7178_return_output,
 counter_MUX_eth_8_h_l136_c7_7178_return_output,
 CONST_SL_8_eth_8_h_l137_c26_8f68_return_output,
 BIN_OP_EQ_eth_8_h_l138_c12_3add_return_output,
 state_MUX_eth_8_h_l138_c9_14af_return_output,
 counter_MUX_eth_8_h_l138_c9_14af_return_output,
 BIN_OP_PLUS_eth_8_h_l142_c11_38fa_return_output,
 BIN_OP_EQ_eth_8_h_l146_c12_03f3_return_output,
 o_MUX_eth_8_h_l146_c9_831f_return_output,
 header_ethertype_MUX_eth_8_h_l146_c9_831f_return_output,
 header_src_mac_MUX_eth_8_h_l146_c9_831f_return_output,
 state_MUX_eth_8_h_l146_c9_831f_return_output,
 counter_MUX_eth_8_h_l146_c9_831f_return_output,
 header_src_mac_MUX_eth_8_h_l149_c5_0fbd_return_output,
 state_MUX_eth_8_h_l149_c5_0fbd_return_output,
 counter_MUX_eth_8_h_l149_c5_0fbd_return_output,
 CONST_SL_8_eth_8_h_l150_c24_6569_return_output,
 BIN_OP_EQ_eth_8_h_l151_c10_0ebc_return_output,
 state_MUX_eth_8_h_l151_c7_feb9_return_output,
 counter_MUX_eth_8_h_l151_c7_feb9_return_output,
 BIN_OP_PLUS_eth_8_h_l155_c9_5f93_return_output,
 BIN_OP_EQ_eth_8_h_l158_c12_df9b_return_output,
 o_MUX_eth_8_h_l158_c9_38ee_return_output,
 header_ethertype_MUX_eth_8_h_l158_c9_38ee_return_output,
 state_MUX_eth_8_h_l158_c9_38ee_return_output,
 counter_MUX_eth_8_h_l158_c9_38ee_return_output,
 header_ethertype_MUX_eth_8_h_l161_c5_eef5_return_output,
 state_MUX_eth_8_h_l161_c5_eef5_return_output,
 counter_MUX_eth_8_h_l161_c5_eef5_return_output,
 CONST_SL_8_eth_8_h_l162_c26_10fa_return_output,
 BIN_OP_EQ_eth_8_h_l163_c10_0d58_return_output,
 state_MUX_eth_8_h_l163_c7_0f40_return_output,
 counter_MUX_eth_8_h_l163_c7_0f40_return_output,
 BIN_OP_PLUS_eth_8_h_l167_c9_c21b_return_output,
 BIN_OP_EQ_eth_8_h_l172_c11_eb5e_return_output,
 o_MUX_eth_8_h_l172_c8_9f43_return_output,
 state_MUX_eth_8_h_l172_c8_9f43_return_output,
 counter_MUX_eth_8_h_l172_c8_9f43_return_output,
 MUX_eth_8_h_l176_c29_d1bb_return_output,
 BIN_OP_AND_eth_8_h_l179_c8_57d6_return_output,
 state_MUX_eth_8_h_l179_c5_c04e_return_output,
 counter_MUX_eth_8_h_l179_c5_c04e_return_output,
 state_MUX_eth_8_h_l180_c7_8da5_return_output,
 counter_MUX_eth_8_h_l180_c7_8da5_return_output,
 state_MUX_eth_8_h_l182_c9_3c37_return_output,
 counter_MUX_eth_8_h_l182_c9_3c37_return_output,
 counter_MUX_eth_8_h_l189_c7_71a6_return_output,
 BIN_OP_PLUS_eth_8_h_l190_c9_20ee_return_output,
 BIN_OP_EQ_eth_8_h_l195_c11_191d_return_output,
 o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_return_output,
 o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_return_output,
 o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_return_output,
 state_MUX_eth_8_h_l195_c8_66e2_return_output,
 counter_MUX_eth_8_h_l195_c8_66e2_return_output,
 UNARY_OP_NOT_eth_8_h_l197_c30_706a_return_output,
 BIN_OP_AND_eth_8_h_l199_c8_abe9_return_output,
 state_MUX_eth_8_h_l199_c5_a6f0_return_output,
 counter_MUX_eth_8_h_l199_c5_a6f0_return_output,
 BIN_OP_PLUS_eth_8_h_l200_c7_0997_return_output,
 state_MUX_eth_8_h_l201_c7_e8c9_return_output,
 counter_MUX_eth_8_h_l201_c7_e8c9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eth_8_tx_t;
 variable VAR_frame : eth8_frame_t_stream_t;
 variable VAR_mac_axis_ready : unsigned(0 downto 0);
 variable VAR_o : eth_8_tx_t;
 variable VAR_undersized_payload : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_eth_8_h_l124_c32_f543_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_LT_eth_8_h_l124_c32_f543_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_LT_eth_8_h_l124_c32_f543_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l128_c6_4813_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l128_c6_4813_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l128_c6_4813_return_output : unsigned(0 downto 0);
 variable VAR_o_MUX_eth_8_h_l128_c3_146b_iftrue : eth_8_tx_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856_eth_8_h_l128_c3_146b_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l128_c3_146b_iffalse : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l146_c9_831f_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l128_c3_146b_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l128_c3_146b_cond : unsigned(0 downto 0);
 variable VAR_header_MUX_eth_8_h_l128_c3_146b_iftrue : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l130_c5_8429_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l128_c3_146b_iffalse : eth_header_t;
 variable VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a_eth_8_h_l128_c3_146b_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l128_c3_146b_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l128_c3_146b_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l128_c3_146b_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l130_c5_8429_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l128_c3_146b_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l146_c9_831f_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l128_c3_146b_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l128_c3_146b_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l128_c3_146b_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l130_c5_8429_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l128_c3_146b_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l146_c9_831f_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l128_c3_146b_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l128_c3_146b_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_iftrue : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_iffalse : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_return_output : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_iftrue : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l130_c5_8429_return_output : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_iffalse : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_return_output : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_cond : unsigned(0 downto 0);
 variable VAR_header_MUX_eth_8_h_l130_c5_8429_iftrue : eth_header_t;
 variable VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l130_c5_8429_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l130_c5_8429_iffalse : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l130_c5_8429_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l130_c5_8429_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l136_c7_7178_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l130_c5_8429_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l130_c5_8429_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l130_c5_8429_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l136_c7_7178_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l130_c5_8429_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l130_c5_8429_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l131_c10_ecbd_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l131_c10_ecbd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l131_c10_ecbd_return_output : unsigned(0 downto 0);
 variable VAR_header_MUX_eth_8_h_l131_c7_b93c_iftrue : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l131_c7_b93c_iffalse : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l131_c7_b93c_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l131_c7_b93c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d_eth_8_h_l132_c18_7cba_return_output : eth_header_t;
 variable VAR_uint48_47_40_eth_8_h_l135_c34_883a_return_output : unsigned(7 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l136_c7_7178_iftrue : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l136_c7_7178_iffalse : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l136_c7_7178_return_output : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l136_c7_7178_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l136_c7_7178_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l138_c9_14af_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l136_c7_7178_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l136_c7_7178_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l136_c7_7178_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l138_c9_14af_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l136_c7_7178_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l136_c7_7178_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l137_c26_8f68_return_output : unsigned(47 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l137_c26_8f68_x : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l138_c12_3add_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l138_c12_3add_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l138_c12_3add_return_output : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l138_c9_14af_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l138_c9_14af_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l138_c9_14af_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l138_c9_14af_iftrue : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l140_c11_d369 : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l138_c9_14af_iffalse : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l142_c11_4f01 : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l138_c9_14af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l142_c11_38fa_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l142_c11_38fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l142_c11_38fa_return_output : unsigned(6 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l146_c12_03f3_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l146_c12_03f3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l146_c12_03f3_return_output : unsigned(0 downto 0);
 variable VAR_o_MUX_eth_8_h_l146_c9_831f_iftrue : eth_8_tx_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l146_c9_831f_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l146_c9_831f_iffalse : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l158_c9_38ee_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l146_c9_831f_cond : unsigned(0 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l146_c9_831f_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l146_c9_831f_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l158_c9_38ee_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l146_c9_831f_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l146_c9_831f_cond : unsigned(0 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l146_c9_831f_iftrue : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l149_c5_0fbd_return_output : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l146_c9_831f_iffalse : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l146_c9_831f_return_output : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l146_c9_831f_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l146_c9_831f_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l149_c5_0fbd_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l146_c9_831f_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l158_c9_38ee_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l146_c9_831f_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l146_c9_831f_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l149_c5_0fbd_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l146_c9_831f_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l158_c9_38ee_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l146_c9_831f_cond : unsigned(0 downto 0);
 variable VAR_uint48_47_40_eth_8_h_l148_c32_60da_return_output : unsigned(7 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l149_c5_0fbd_iftrue : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l149_c5_0fbd_iffalse : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l149_c5_0fbd_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l149_c5_0fbd_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l151_c7_feb9_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l149_c5_0fbd_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l149_c5_0fbd_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l149_c5_0fbd_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l151_c7_feb9_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l149_c5_0fbd_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l149_c5_0fbd_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l150_c24_6569_return_output : unsigned(47 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l150_c24_6569_x : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l151_c10_0ebc_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l151_c10_0ebc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l151_c10_0ebc_return_output : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l151_c7_feb9_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l151_c7_feb9_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l151_c7_feb9_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l151_c7_feb9_iftrue : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l153_c9_5de2 : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l151_c7_feb9_iffalse : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l155_c9_f369 : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l151_c7_feb9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l155_c9_5f93_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l155_c9_5f93_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l155_c9_5f93_return_output : unsigned(6 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l158_c12_df9b_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l158_c12_df9b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l158_c12_df9b_return_output : unsigned(0 downto 0);
 variable VAR_o_MUX_eth_8_h_l158_c9_38ee_iftrue : eth_8_tx_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l158_c9_38ee_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l158_c9_38ee_iffalse : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l172_c8_9f43_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l158_c9_38ee_cond : unsigned(0 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l158_c9_38ee_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l161_c5_eef5_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l158_c9_38ee_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l158_c9_38ee_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l158_c9_38ee_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l161_c5_eef5_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l158_c9_38ee_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l172_c8_9f43_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l158_c9_38ee_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l158_c9_38ee_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l161_c5_eef5_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l158_c9_38ee_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l172_c8_9f43_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l158_c9_38ee_cond : unsigned(0 downto 0);
 variable VAR_uint16_15_8_eth_8_h_l160_c32_e762_return_output : unsigned(7 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l161_c5_eef5_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l161_c5_eef5_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l161_c5_eef5_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l161_c5_eef5_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l163_c7_0f40_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l161_c5_eef5_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l161_c5_eef5_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l161_c5_eef5_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l163_c7_0f40_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l161_c5_eef5_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l161_c5_eef5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l162_c26_10fa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l162_c26_10fa_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l163_c10_0d58_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l163_c10_0d58_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l163_c10_0d58_return_output : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l163_c7_0f40_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l163_c7_0f40_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l163_c7_0f40_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l163_c7_0f40_iftrue : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l165_c9_d2c5 : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l163_c7_0f40_iffalse : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l167_c9_c539 : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l163_c7_0f40_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l167_c9_c21b_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l167_c9_c21b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l167_c9_c21b_return_output : unsigned(6 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l172_c11_eb5e_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l172_c11_eb5e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l172_c11_eb5e_return_output : unsigned(0 downto 0);
 variable VAR_o_MUX_eth_8_h_l172_c8_9f43_iftrue : eth_8_tx_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524_eth_8_h_l172_c8_9f43_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l172_c8_9f43_iffalse : eth_8_tx_t;
 variable VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_19fe_eth_8_h_l172_c8_9f43_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l172_c8_9f43_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l172_c8_9f43_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l179_c5_c04e_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l172_c8_9f43_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l195_c8_66e2_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l172_c8_9f43_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l172_c8_9f43_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l179_c5_c04e_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l172_c8_9f43_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l195_c8_66e2_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l172_c8_9f43_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d_eth_8_h_l174_c23_d1d8_return_output : axis8_t;
 variable VAR_MUX_eth_8_h_l176_c29_d1bb_cond : unsigned(0 downto 0);
 variable VAR_MUX_eth_8_h_l176_c29_d1bb_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_eth_8_h_l176_c29_d1bb_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_eth_8_h_l176_c29_d1bb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l179_c8_57d6_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l179_c8_57d6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l179_c8_57d6_return_output : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l179_c5_c04e_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l180_c7_8da5_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l179_c5_c04e_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l179_c5_c04e_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l179_c5_c04e_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l189_c7_71a6_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l179_c5_c04e_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l179_c5_c04e_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l180_c7_8da5_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l182_c9_3c37_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l180_c7_8da5_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l180_c7_8da5_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l180_c7_8da5_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l182_c9_3c37_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l180_c7_8da5_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l180_c7_8da5_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l180_c7_8da5_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l182_c9_3c37_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l182_c9_3c37_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l182_c9_3c37_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l182_c9_3c37_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l182_c9_3c37_iffalse : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l186_c11_9434 : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l182_c9_3c37_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l189_c7_71a6_iftrue : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l190_c9_95b7 : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l189_c7_71a6_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l189_c7_71a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l190_c9_20ee_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l190_c9_20ee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l190_c9_20ee_return_output : unsigned(6 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l195_c11_191d_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l195_c11_191d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l195_c11_191d_return_output : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_iftrue : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_iffalse : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_return_output : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_iftrue : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l195_c8_66e2_return_output : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_iffalse : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_return_output : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_iftrue : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_iffalse : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_eth_8_tx_t_mac_axis_data_tlast_d41d_eth_8_h_l195_c8_66e2_return_output : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_return_output : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l195_c8_66e2_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l199_c5_a6f0_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l195_c8_66e2_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l195_c8_66e2_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l195_c8_66e2_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l199_c5_a6f0_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l195_c8_66e2_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l195_c8_66e2_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tdata_0_eth_8_h_l196_c5_22db : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_eth_8_h_l197_c30_706a_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_eth_8_h_l197_c30_706a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l199_c8_abe9_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l199_c8_abe9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l199_c8_abe9_return_output : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l199_c5_a6f0_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l201_c7_e8c9_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l199_c5_a6f0_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l199_c5_a6f0_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l199_c5_a6f0_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l201_c7_e8c9_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l199_c5_a6f0_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l199_c5_a6f0_cond : unsigned(0 downto 0);
 variable VAR_counter_eth_8_h_l200_c7_0ac4 : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l200_c7_0997_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l200_c7_0997_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l200_c7_0997_return_output : unsigned(6 downto 0);
 variable VAR_state_MUX_eth_8_h_l201_c7_e8c9_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l201_c7_e8c9_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l201_c7_e8c9_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l201_c7_e8c9_iftrue : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l203_c9_1efe : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l201_c7_e8c9_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l201_c7_e8c9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_01f4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l136_l135_l137_DUPLICATE_9dee_return_output : unsigned(47 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_d41d_eth_8_h_l130_l195_DUPLICATE_65c6_return_output : uint8_t_1;
 variable VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l146_l150_l149_l148_DUPLICATE_f5a9_return_output : unsigned(47 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l161_l158_l162_l146_l160_DUPLICATE_d38d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l176_l180_DUPLICATE_70d3_return_output : unsigned(0 downto 0);
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
     VAR_BIN_OP_PLUS_eth_8_h_l190_c9_20ee_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_eth_8_h_l138_c12_3add_right := to_unsigned(5, 3);
     VAR_o_mac_axis_data_tdata_0_eth_8_h_l196_c5_22db := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_LT_eth_8_h_l124_c32_f543_right := to_unsigned(45, 6);
     VAR_BIN_OP_PLUS_eth_8_h_l142_c11_38fa_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_eth_8_h_l195_c11_191d_right := unsigned(eth8_state_t_to_slv(PADDING));
     VAR_counter_eth_8_h_l140_c11_d369 := resize(to_unsigned(0, 1), 6);
     VAR_counter_MUX_eth_8_h_l138_c9_14af_iftrue := VAR_counter_eth_8_h_l140_c11_d369;
     VAR_counter_eth_8_h_l153_c9_5de2 := resize(to_unsigned(0, 1), 6);
     VAR_counter_MUX_eth_8_h_l151_c7_feb9_iftrue := VAR_counter_eth_8_h_l153_c9_5de2;
     VAR_BIN_OP_EQ_eth_8_h_l163_c10_0d58_right := to_unsigned(1, 1);
     VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_eth_8_h_l128_c6_4813_right := unsigned(eth8_state_t_to_slv(IDLE_DST_MAC));
     VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_iffalse := to_unsigned(0, 1);
     VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_iffalse := to_unsigned(0, 1);
     VAR_state_MUX_eth_8_h_l201_c7_e8c9_iftrue := unsigned(eth8_state_t_to_slv(IDLE_DST_MAC));
     VAR_BIN_OP_AND_eth_8_h_l199_c8_abe9_left := to_unsigned(1, 1);
     VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_eth_8_h_l167_c9_c21b_right := to_unsigned(1, 1);
     VAR_counter_eth_8_h_l186_c11_9434 := resize(to_unsigned(0, 1), 6);
     VAR_counter_MUX_eth_8_h_l182_c9_3c37_iffalse := VAR_counter_eth_8_h_l186_c11_9434;
     VAR_state_MUX_eth_8_h_l138_c9_14af_iftrue := unsigned(eth8_state_t_to_slv(SRC_MAC));
     VAR_BIN_OP_EQ_eth_8_h_l131_c10_ecbd_right := to_unsigned(0, 1);
     VAR_state_MUX_eth_8_h_l182_c9_3c37_iftrue := unsigned(eth8_state_t_to_slv(PADDING));
     VAR_state_MUX_eth_8_h_l163_c7_0f40_iftrue := unsigned(eth8_state_t_to_slv(PAYLOAD));
     VAR_state_MUX_eth_8_h_l151_c7_feb9_iftrue := unsigned(eth8_state_t_to_slv(LEN_TYPE));
     VAR_BIN_OP_EQ_eth_8_h_l146_c12_03f3_right := unsigned(eth8_state_t_to_slv(SRC_MAC));
     VAR_counter_eth_8_h_l203_c9_1efe := resize(to_unsigned(0, 1), 6);
     VAR_counter_MUX_eth_8_h_l201_c7_e8c9_iftrue := VAR_counter_eth_8_h_l203_c9_1efe;
     VAR_BIN_OP_PLUS_eth_8_h_l155_c9_5f93_right := to_unsigned(1, 1);
     VAR_counter_eth_8_h_l165_c9_d2c5 := resize(to_unsigned(0, 1), 6);
     VAR_counter_MUX_eth_8_h_l163_c7_0f40_iftrue := VAR_counter_eth_8_h_l165_c9_d2c5;
     VAR_MUX_eth_8_h_l176_c29_d1bb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_eth_8_h_l200_c7_0997_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_eth_8_h_l172_c11_eb5e_right := unsigned(eth8_state_t_to_slv(PAYLOAD));
     VAR_state_MUX_eth_8_h_l182_c9_3c37_iffalse := unsigned(eth8_state_t_to_slv(IDLE_DST_MAC));
     VAR_BIN_OP_EQ_eth_8_h_l158_c12_df9b_right := unsigned(eth8_state_t_to_slv(LEN_TYPE));
     VAR_BIN_OP_EQ_eth_8_h_l151_c10_0ebc_right := to_unsigned(5, 3);
     -- o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3[eth_8_h_l195_c8_66e2] LATENCY=0
     VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l195_c8_66e2_return_output := CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3(
     VAR_o_mac_axis_data_tdata_0_eth_8_h_l196_c5_22db);

     -- CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_d41d_eth_8_h_l130_l195_DUPLICATE_65c6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_d41d_eth_8_h_l130_l195_DUPLICATE_65c6_return_output := eth_8_tx_t_NULL.mac_axis.data.tdata;

     -- o_mac_axis_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_eth_8_tx_t_mac_axis_data_tlast_d41d[eth_8_h_l195_c8_66e2] LATENCY=0
     VAR_o_mac_axis_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_eth_8_tx_t_mac_axis_data_tlast_d41d_eth_8_h_l195_c8_66e2_return_output := eth_8_tx_t_NULL.mac_axis.data.tlast;

     -- Submodule level 1
     VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_iffalse := VAR_o_mac_axis_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_eth_8_tx_t_mac_axis_data_tlast_d41d_eth_8_h_l195_c8_66e2_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_iftrue := VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l195_c8_66e2_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_iffalse := VAR_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_d41d_eth_8_h_l130_l195_DUPLICATE_65c6_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_iffalse := VAR_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_d41d_eth_8_h_l130_l195_DUPLICATE_65c6_return_output;

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
     VAR_BIN_OP_EQ_eth_8_h_l131_c10_ecbd_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l138_c12_3add_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l151_c10_0ebc_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l163_c10_0d58_left := counter;
     VAR_BIN_OP_LT_eth_8_h_l124_c32_f543_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l142_c11_38fa_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l155_c9_5f93_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l167_c9_c21b_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l200_c7_0997_left := counter;
     VAR_counter_MUX_eth_8_h_l130_c5_8429_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l136_c7_7178_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l149_c5_0fbd_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l161_c5_eef5_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l179_c5_c04e_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l180_c7_8da5_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l182_c9_3c37_iftrue := counter;
     VAR_counter_MUX_eth_8_h_l195_c8_66e2_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l199_c5_a6f0_iffalse := counter;
     VAR_header_MUX_eth_8_h_l130_c5_8429_iffalse := header;
     VAR_header_MUX_eth_8_h_l131_c7_b93c_iffalse := header;
     VAR_BIN_OP_AND_eth_8_h_l179_c8_57d6_right := VAR_mac_axis_ready;
     VAR_BIN_OP_AND_eth_8_h_l199_c8_abe9_right := VAR_mac_axis_ready;
     VAR_counter_MUX_eth_8_h_l136_c7_7178_cond := VAR_mac_axis_ready;
     VAR_counter_MUX_eth_8_h_l149_c5_0fbd_cond := VAR_mac_axis_ready;
     VAR_counter_MUX_eth_8_h_l161_c5_eef5_cond := VAR_mac_axis_ready;
     VAR_header_dst_mac_MUX_eth_8_h_l136_c7_7178_cond := VAR_mac_axis_ready;
     VAR_header_ethertype_MUX_eth_8_h_l161_c5_eef5_cond := VAR_mac_axis_ready;
     VAR_header_src_mac_MUX_eth_8_h_l149_c5_0fbd_cond := VAR_mac_axis_ready;
     VAR_state_MUX_eth_8_h_l136_c7_7178_cond := VAR_mac_axis_ready;
     VAR_state_MUX_eth_8_h_l149_c5_0fbd_cond := VAR_mac_axis_ready;
     VAR_state_MUX_eth_8_h_l161_c5_eef5_cond := VAR_mac_axis_ready;
     VAR_BIN_OP_EQ_eth_8_h_l128_c6_4813_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l146_c12_03f3_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l158_c12_df9b_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l172_c11_eb5e_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l195_c11_191d_left := state;
     VAR_state_MUX_eth_8_h_l130_c5_8429_iffalse := state;
     VAR_state_MUX_eth_8_h_l136_c7_7178_iffalse := state;
     VAR_state_MUX_eth_8_h_l138_c9_14af_iffalse := state;
     VAR_state_MUX_eth_8_h_l149_c5_0fbd_iffalse := state;
     VAR_state_MUX_eth_8_h_l151_c7_feb9_iffalse := state;
     VAR_state_MUX_eth_8_h_l161_c5_eef5_iffalse := state;
     VAR_state_MUX_eth_8_h_l163_c7_0f40_iffalse := state;
     VAR_state_MUX_eth_8_h_l179_c5_c04e_iffalse := state;
     VAR_state_MUX_eth_8_h_l180_c7_8da5_iffalse := state;
     VAR_state_MUX_eth_8_h_l195_c8_66e2_iffalse := state;
     VAR_state_MUX_eth_8_h_l199_c5_a6f0_iffalse := state;
     VAR_state_MUX_eth_8_h_l201_c7_e8c9_iffalse := state;
     -- BIN_OP_PLUS[eth_8_h_l200_c7_0997] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l200_c7_0997_left <= VAR_BIN_OP_PLUS_eth_8_h_l200_c7_0997_left;
     BIN_OP_PLUS_eth_8_h_l200_c7_0997_right <= VAR_BIN_OP_PLUS_eth_8_h_l200_c7_0997_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l200_c7_0997_return_output := BIN_OP_PLUS_eth_8_h_l200_c7_0997_return_output;

     -- BIN_OP_EQ[eth_8_h_l128_c6_4813] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l128_c6_4813_left <= VAR_BIN_OP_EQ_eth_8_h_l128_c6_4813_left;
     BIN_OP_EQ_eth_8_h_l128_c6_4813_right <= VAR_BIN_OP_EQ_eth_8_h_l128_c6_4813_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l128_c6_4813_return_output := BIN_OP_EQ_eth_8_h_l128_c6_4813_return_output;

     -- BIN_OP_EQ[eth_8_h_l131_c10_ecbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l131_c10_ecbd_left <= VAR_BIN_OP_EQ_eth_8_h_l131_c10_ecbd_left;
     BIN_OP_EQ_eth_8_h_l131_c10_ecbd_right <= VAR_BIN_OP_EQ_eth_8_h_l131_c10_ecbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l131_c10_ecbd_return_output := BIN_OP_EQ_eth_8_h_l131_c10_ecbd_return_output;

     -- BIN_OP_PLUS[eth_8_h_l155_c9_5f93] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l155_c9_5f93_left <= VAR_BIN_OP_PLUS_eth_8_h_l155_c9_5f93_left;
     BIN_OP_PLUS_eth_8_h_l155_c9_5f93_right <= VAR_BIN_OP_PLUS_eth_8_h_l155_c9_5f93_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l155_c9_5f93_return_output := BIN_OP_PLUS_eth_8_h_l155_c9_5f93_return_output;

     -- BIN_OP_AND[eth_8_h_l199_c8_abe9] LATENCY=0
     -- Inputs
     BIN_OP_AND_eth_8_h_l199_c8_abe9_left <= VAR_BIN_OP_AND_eth_8_h_l199_c8_abe9_left;
     BIN_OP_AND_eth_8_h_l199_c8_abe9_right <= VAR_BIN_OP_AND_eth_8_h_l199_c8_abe9_right;
     -- Outputs
     VAR_BIN_OP_AND_eth_8_h_l199_c8_abe9_return_output := BIN_OP_AND_eth_8_h_l199_c8_abe9_return_output;

     -- BIN_OP_EQ[eth_8_h_l195_c11_191d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l195_c11_191d_left <= VAR_BIN_OP_EQ_eth_8_h_l195_c11_191d_left;
     BIN_OP_EQ_eth_8_h_l195_c11_191d_right <= VAR_BIN_OP_EQ_eth_8_h_l195_c11_191d_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l195_c11_191d_return_output := BIN_OP_EQ_eth_8_h_l195_c11_191d_return_output;

     -- BIN_OP_LT[eth_8_h_l124_c32_f543] LATENCY=0
     -- Inputs
     BIN_OP_LT_eth_8_h_l124_c32_f543_left <= VAR_BIN_OP_LT_eth_8_h_l124_c32_f543_left;
     BIN_OP_LT_eth_8_h_l124_c32_f543_right <= VAR_BIN_OP_LT_eth_8_h_l124_c32_f543_right;
     -- Outputs
     VAR_BIN_OP_LT_eth_8_h_l124_c32_f543_return_output := BIN_OP_LT_eth_8_h_l124_c32_f543_return_output;

     -- BIN_OP_PLUS[eth_8_h_l167_c9_c21b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l167_c9_c21b_left <= VAR_BIN_OP_PLUS_eth_8_h_l167_c9_c21b_left;
     BIN_OP_PLUS_eth_8_h_l167_c9_c21b_right <= VAR_BIN_OP_PLUS_eth_8_h_l167_c9_c21b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l167_c9_c21b_return_output := BIN_OP_PLUS_eth_8_h_l167_c9_c21b_return_output;

     -- CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d[eth_8_h_l174_c23_d1d8] LATENCY=0
     VAR_CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d_eth_8_h_l174_c23_d1d8_return_output := VAR_frame.data.payload;

     -- BIN_OP_EQ[eth_8_h_l163_c10_0d58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l163_c10_0d58_left <= VAR_BIN_OP_EQ_eth_8_h_l163_c10_0d58_left;
     BIN_OP_EQ_eth_8_h_l163_c10_0d58_right <= VAR_BIN_OP_EQ_eth_8_h_l163_c10_0d58_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l163_c10_0d58_return_output := BIN_OP_EQ_eth_8_h_l163_c10_0d58_return_output;

     -- CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l146_l150_l149_l148_DUPLICATE_f5a9 LATENCY=0
     VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l146_l150_l149_l148_DUPLICATE_f5a9_return_output := header.src_mac;

     -- CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l161_l158_l162_l146_l160_DUPLICATE_d38d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l161_l158_l162_l146_l160_DUPLICATE_d38d_return_output := header.ethertype;

     -- BIN_OP_PLUS[eth_8_h_l142_c11_38fa] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l142_c11_38fa_left <= VAR_BIN_OP_PLUS_eth_8_h_l142_c11_38fa_left;
     BIN_OP_PLUS_eth_8_h_l142_c11_38fa_right <= VAR_BIN_OP_PLUS_eth_8_h_l142_c11_38fa_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l142_c11_38fa_return_output := BIN_OP_PLUS_eth_8_h_l142_c11_38fa_return_output;

     -- BIN_OP_EQ[eth_8_h_l146_c12_03f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l146_c12_03f3_left <= VAR_BIN_OP_EQ_eth_8_h_l146_c12_03f3_left;
     BIN_OP_EQ_eth_8_h_l146_c12_03f3_right <= VAR_BIN_OP_EQ_eth_8_h_l146_c12_03f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l146_c12_03f3_return_output := BIN_OP_EQ_eth_8_h_l146_c12_03f3_return_output;

     -- CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d[eth_8_h_l132_c18_7cba] LATENCY=0
     VAR_CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d_eth_8_h_l132_c18_7cba_return_output := VAR_frame.data.header;

     -- BIN_OP_EQ[eth_8_h_l172_c11_eb5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l172_c11_eb5e_left <= VAR_BIN_OP_EQ_eth_8_h_l172_c11_eb5e_left;
     BIN_OP_EQ_eth_8_h_l172_c11_eb5e_right <= VAR_BIN_OP_EQ_eth_8_h_l172_c11_eb5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l172_c11_eb5e_return_output := BIN_OP_EQ_eth_8_h_l172_c11_eb5e_return_output;

     -- BIN_OP_EQ[eth_8_h_l138_c12_3add] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l138_c12_3add_left <= VAR_BIN_OP_EQ_eth_8_h_l138_c12_3add_left;
     BIN_OP_EQ_eth_8_h_l138_c12_3add_right <= VAR_BIN_OP_EQ_eth_8_h_l138_c12_3add_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l138_c12_3add_return_output := BIN_OP_EQ_eth_8_h_l138_c12_3add_return_output;

     -- BIN_OP_EQ[eth_8_h_l158_c12_df9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l158_c12_df9b_left <= VAR_BIN_OP_EQ_eth_8_h_l158_c12_df9b_left;
     BIN_OP_EQ_eth_8_h_l158_c12_df9b_right <= VAR_BIN_OP_EQ_eth_8_h_l158_c12_df9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l158_c12_df9b_return_output := BIN_OP_EQ_eth_8_h_l158_c12_df9b_return_output;

     -- CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_01f4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_01f4_return_output := VAR_frame.valid;

     -- BIN_OP_EQ[eth_8_h_l151_c10_0ebc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l151_c10_0ebc_left <= VAR_BIN_OP_EQ_eth_8_h_l151_c10_0ebc_left;
     BIN_OP_EQ_eth_8_h_l151_c10_0ebc_right <= VAR_BIN_OP_EQ_eth_8_h_l151_c10_0ebc_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l151_c10_0ebc_return_output := BIN_OP_EQ_eth_8_h_l151_c10_0ebc_return_output;

     -- CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l176_l180_DUPLICATE_70d3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l176_l180_DUPLICATE_70d3_return_output := VAR_frame.data.payload.tlast;

     -- Submodule level 1
     VAR_counter_MUX_eth_8_h_l199_c5_a6f0_cond := VAR_BIN_OP_AND_eth_8_h_l199_c8_abe9_return_output;
     VAR_state_MUX_eth_8_h_l199_c5_a6f0_cond := VAR_BIN_OP_AND_eth_8_h_l199_c8_abe9_return_output;
     VAR_counter_MUX_eth_8_h_l128_c3_146b_cond := VAR_BIN_OP_EQ_eth_8_h_l128_c6_4813_return_output;
     VAR_header_MUX_eth_8_h_l128_c3_146b_cond := VAR_BIN_OP_EQ_eth_8_h_l128_c6_4813_return_output;
     VAR_o_MUX_eth_8_h_l128_c3_146b_cond := VAR_BIN_OP_EQ_eth_8_h_l128_c6_4813_return_output;
     VAR_state_MUX_eth_8_h_l128_c3_146b_cond := VAR_BIN_OP_EQ_eth_8_h_l128_c6_4813_return_output;
     VAR_header_MUX_eth_8_h_l131_c7_b93c_cond := VAR_BIN_OP_EQ_eth_8_h_l131_c10_ecbd_return_output;
     VAR_counter_MUX_eth_8_h_l138_c9_14af_cond := VAR_BIN_OP_EQ_eth_8_h_l138_c12_3add_return_output;
     VAR_state_MUX_eth_8_h_l138_c9_14af_cond := VAR_BIN_OP_EQ_eth_8_h_l138_c12_3add_return_output;
     VAR_counter_MUX_eth_8_h_l146_c9_831f_cond := VAR_BIN_OP_EQ_eth_8_h_l146_c12_03f3_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l146_c9_831f_cond := VAR_BIN_OP_EQ_eth_8_h_l146_c12_03f3_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l146_c9_831f_cond := VAR_BIN_OP_EQ_eth_8_h_l146_c12_03f3_return_output;
     VAR_o_MUX_eth_8_h_l146_c9_831f_cond := VAR_BIN_OP_EQ_eth_8_h_l146_c12_03f3_return_output;
     VAR_state_MUX_eth_8_h_l146_c9_831f_cond := VAR_BIN_OP_EQ_eth_8_h_l146_c12_03f3_return_output;
     VAR_counter_MUX_eth_8_h_l151_c7_feb9_cond := VAR_BIN_OP_EQ_eth_8_h_l151_c10_0ebc_return_output;
     VAR_state_MUX_eth_8_h_l151_c7_feb9_cond := VAR_BIN_OP_EQ_eth_8_h_l151_c10_0ebc_return_output;
     VAR_counter_MUX_eth_8_h_l158_c9_38ee_cond := VAR_BIN_OP_EQ_eth_8_h_l158_c12_df9b_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l158_c9_38ee_cond := VAR_BIN_OP_EQ_eth_8_h_l158_c12_df9b_return_output;
     VAR_o_MUX_eth_8_h_l158_c9_38ee_cond := VAR_BIN_OP_EQ_eth_8_h_l158_c12_df9b_return_output;
     VAR_state_MUX_eth_8_h_l158_c9_38ee_cond := VAR_BIN_OP_EQ_eth_8_h_l158_c12_df9b_return_output;
     VAR_counter_MUX_eth_8_h_l163_c7_0f40_cond := VAR_BIN_OP_EQ_eth_8_h_l163_c10_0d58_return_output;
     VAR_state_MUX_eth_8_h_l163_c7_0f40_cond := VAR_BIN_OP_EQ_eth_8_h_l163_c10_0d58_return_output;
     VAR_counter_MUX_eth_8_h_l172_c8_9f43_cond := VAR_BIN_OP_EQ_eth_8_h_l172_c11_eb5e_return_output;
     VAR_o_MUX_eth_8_h_l172_c8_9f43_cond := VAR_BIN_OP_EQ_eth_8_h_l172_c11_eb5e_return_output;
     VAR_state_MUX_eth_8_h_l172_c8_9f43_cond := VAR_BIN_OP_EQ_eth_8_h_l172_c11_eb5e_return_output;
     VAR_counter_MUX_eth_8_h_l195_c8_66e2_cond := VAR_BIN_OP_EQ_eth_8_h_l195_c11_191d_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_cond := VAR_BIN_OP_EQ_eth_8_h_l195_c11_191d_return_output;
     VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_cond := VAR_BIN_OP_EQ_eth_8_h_l195_c11_191d_return_output;
     VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_cond := VAR_BIN_OP_EQ_eth_8_h_l195_c11_191d_return_output;
     VAR_state_MUX_eth_8_h_l195_c8_66e2_cond := VAR_BIN_OP_EQ_eth_8_h_l195_c11_191d_return_output;
     VAR_MUX_eth_8_h_l176_c29_d1bb_cond := VAR_BIN_OP_LT_eth_8_h_l124_c32_f543_return_output;
     VAR_UNARY_OP_NOT_eth_8_h_l197_c30_706a_expr := VAR_BIN_OP_LT_eth_8_h_l124_c32_f543_return_output;
     VAR_counter_MUX_eth_8_h_l182_c9_3c37_cond := VAR_BIN_OP_LT_eth_8_h_l124_c32_f543_return_output;
     VAR_counter_MUX_eth_8_h_l189_c7_71a6_cond := VAR_BIN_OP_LT_eth_8_h_l124_c32_f543_return_output;
     VAR_state_MUX_eth_8_h_l182_c9_3c37_cond := VAR_BIN_OP_LT_eth_8_h_l124_c32_f543_return_output;
     VAR_counter_eth_8_h_l142_c11_4f01 := resize(VAR_BIN_OP_PLUS_eth_8_h_l142_c11_38fa_return_output, 6);
     VAR_counter_eth_8_h_l155_c9_f369 := resize(VAR_BIN_OP_PLUS_eth_8_h_l155_c9_5f93_return_output, 6);
     VAR_counter_eth_8_h_l167_c9_c539 := resize(VAR_BIN_OP_PLUS_eth_8_h_l167_c9_c21b_return_output, 6);
     VAR_counter_eth_8_h_l200_c7_0ac4 := resize(VAR_BIN_OP_PLUS_eth_8_h_l200_c7_0997_return_output, 6);
     VAR_header_MUX_eth_8_h_l131_c7_b93c_iftrue := VAR_CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d_eth_8_h_l132_c18_7cba_return_output;
     VAR_CONST_SL_8_eth_8_h_l162_c26_10fa_x := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l161_l158_l162_l146_l160_DUPLICATE_d38d_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l146_c9_831f_iftrue := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l161_l158_l162_l146_l160_DUPLICATE_d38d_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l158_c9_38ee_iffalse := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l161_l158_l162_l146_l160_DUPLICATE_d38d_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l161_c5_eef5_iffalse := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l161_l158_l162_l146_l160_DUPLICATE_d38d_return_output;
     VAR_MUX_eth_8_h_l176_c29_d1bb_iffalse := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l176_l180_DUPLICATE_70d3_return_output;
     VAR_counter_MUX_eth_8_h_l180_c7_8da5_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l176_l180_DUPLICATE_70d3_return_output;
     VAR_state_MUX_eth_8_h_l180_c7_8da5_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l176_l180_DUPLICATE_70d3_return_output;
     VAR_BIN_OP_AND_eth_8_h_l179_c8_57d6_left := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_01f4_return_output;
     VAR_counter_MUX_eth_8_h_l130_c5_8429_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_01f4_return_output;
     VAR_header_MUX_eth_8_h_l130_c5_8429_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_01f4_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_01f4_return_output;
     VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_01f4_return_output;
     VAR_state_MUX_eth_8_h_l130_c5_8429_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_01f4_return_output;
     VAR_CONST_SL_8_eth_8_h_l150_c24_6569_x := VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l146_l150_l149_l148_DUPLICATE_f5a9_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l146_c9_831f_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l146_l150_l149_l148_DUPLICATE_f5a9_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l149_c5_0fbd_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l146_l150_l149_l148_DUPLICATE_f5a9_return_output;
     VAR_counter_MUX_eth_8_h_l138_c9_14af_iffalse := VAR_counter_eth_8_h_l142_c11_4f01;
     VAR_counter_MUX_eth_8_h_l151_c7_feb9_iffalse := VAR_counter_eth_8_h_l155_c9_f369;
     VAR_counter_MUX_eth_8_h_l163_c7_0f40_iffalse := VAR_counter_eth_8_h_l167_c9_c539;
     VAR_counter_MUX_eth_8_h_l201_c7_e8c9_iffalse := VAR_counter_eth_8_h_l200_c7_0ac4;
     -- uint48_47_40[eth_8_h_l148_c32_60da] LATENCY=0
     VAR_uint48_47_40_eth_8_h_l148_c32_60da_return_output := uint48_47_40(
     VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l146_l150_l149_l148_DUPLICATE_f5a9_return_output);

     -- counter_MUX[eth_8_h_l138_c9_14af] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l138_c9_14af_cond <= VAR_counter_MUX_eth_8_h_l138_c9_14af_cond;
     counter_MUX_eth_8_h_l138_c9_14af_iftrue <= VAR_counter_MUX_eth_8_h_l138_c9_14af_iftrue;
     counter_MUX_eth_8_h_l138_c9_14af_iffalse <= VAR_counter_MUX_eth_8_h_l138_c9_14af_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l138_c9_14af_return_output := counter_MUX_eth_8_h_l138_c9_14af_return_output;

     -- BIN_OP_AND[eth_8_h_l179_c8_57d6] LATENCY=0
     -- Inputs
     BIN_OP_AND_eth_8_h_l179_c8_57d6_left <= VAR_BIN_OP_AND_eth_8_h_l179_c8_57d6_left;
     BIN_OP_AND_eth_8_h_l179_c8_57d6_right <= VAR_BIN_OP_AND_eth_8_h_l179_c8_57d6_right;
     -- Outputs
     VAR_BIN_OP_AND_eth_8_h_l179_c8_57d6_return_output := BIN_OP_AND_eth_8_h_l179_c8_57d6_return_output;

     -- CONST_SL_8[eth_8_h_l162_c26_10fa] LATENCY=0
     -- Inputs
     CONST_SL_8_eth_8_h_l162_c26_10fa_x <= VAR_CONST_SL_8_eth_8_h_l162_c26_10fa_x;
     -- Outputs
     VAR_CONST_SL_8_eth_8_h_l162_c26_10fa_return_output := CONST_SL_8_eth_8_h_l162_c26_10fa_return_output;

     -- counter_MUX[eth_8_h_l151_c7_feb9] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l151_c7_feb9_cond <= VAR_counter_MUX_eth_8_h_l151_c7_feb9_cond;
     counter_MUX_eth_8_h_l151_c7_feb9_iftrue <= VAR_counter_MUX_eth_8_h_l151_c7_feb9_iftrue;
     counter_MUX_eth_8_h_l151_c7_feb9_iffalse <= VAR_counter_MUX_eth_8_h_l151_c7_feb9_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l151_c7_feb9_return_output := counter_MUX_eth_8_h_l151_c7_feb9_return_output;

     -- state_MUX[eth_8_h_l138_c9_14af] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l138_c9_14af_cond <= VAR_state_MUX_eth_8_h_l138_c9_14af_cond;
     state_MUX_eth_8_h_l138_c9_14af_iftrue <= VAR_state_MUX_eth_8_h_l138_c9_14af_iftrue;
     state_MUX_eth_8_h_l138_c9_14af_iffalse <= VAR_state_MUX_eth_8_h_l138_c9_14af_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l138_c9_14af_return_output := state_MUX_eth_8_h_l138_c9_14af_return_output;

     -- o_mac_axis_valid_MUX[eth_8_h_l130_c5_8429] LATENCY=0
     -- Inputs
     o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_cond <= VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_cond;
     o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_iftrue <= VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_iftrue;
     o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_iffalse <= VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_iffalse;
     -- Outputs
     VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_return_output := o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_return_output;

     -- CONST_SL_8[eth_8_h_l150_c24_6569] LATENCY=0
     -- Inputs
     CONST_SL_8_eth_8_h_l150_c24_6569_x <= VAR_CONST_SL_8_eth_8_h_l150_c24_6569_x;
     -- Outputs
     VAR_CONST_SL_8_eth_8_h_l150_c24_6569_return_output := CONST_SL_8_eth_8_h_l150_c24_6569_return_output;

     -- MUX[eth_8_h_l176_c29_d1bb] LATENCY=0
     -- Inputs
     MUX_eth_8_h_l176_c29_d1bb_cond <= VAR_MUX_eth_8_h_l176_c29_d1bb_cond;
     MUX_eth_8_h_l176_c29_d1bb_iftrue <= VAR_MUX_eth_8_h_l176_c29_d1bb_iftrue;
     MUX_eth_8_h_l176_c29_d1bb_iffalse <= VAR_MUX_eth_8_h_l176_c29_d1bb_iffalse;
     -- Outputs
     VAR_MUX_eth_8_h_l176_c29_d1bb_return_output := MUX_eth_8_h_l176_c29_d1bb_return_output;

     -- UNARY_OP_NOT[eth_8_h_l197_c30_706a] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_eth_8_h_l197_c30_706a_expr <= VAR_UNARY_OP_NOT_eth_8_h_l197_c30_706a_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_eth_8_h_l197_c30_706a_return_output := UNARY_OP_NOT_eth_8_h_l197_c30_706a_return_output;

     -- state_MUX[eth_8_h_l151_c7_feb9] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l151_c7_feb9_cond <= VAR_state_MUX_eth_8_h_l151_c7_feb9_cond;
     state_MUX_eth_8_h_l151_c7_feb9_iftrue <= VAR_state_MUX_eth_8_h_l151_c7_feb9_iftrue;
     state_MUX_eth_8_h_l151_c7_feb9_iffalse <= VAR_state_MUX_eth_8_h_l151_c7_feb9_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l151_c7_feb9_return_output := state_MUX_eth_8_h_l151_c7_feb9_return_output;

     -- state_MUX[eth_8_h_l163_c7_0f40] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l163_c7_0f40_cond <= VAR_state_MUX_eth_8_h_l163_c7_0f40_cond;
     state_MUX_eth_8_h_l163_c7_0f40_iftrue <= VAR_state_MUX_eth_8_h_l163_c7_0f40_iftrue;
     state_MUX_eth_8_h_l163_c7_0f40_iffalse <= VAR_state_MUX_eth_8_h_l163_c7_0f40_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l163_c7_0f40_return_output := state_MUX_eth_8_h_l163_c7_0f40_return_output;

     -- state_MUX[eth_8_h_l182_c9_3c37] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l182_c9_3c37_cond <= VAR_state_MUX_eth_8_h_l182_c9_3c37_cond;
     state_MUX_eth_8_h_l182_c9_3c37_iftrue <= VAR_state_MUX_eth_8_h_l182_c9_3c37_iftrue;
     state_MUX_eth_8_h_l182_c9_3c37_iffalse <= VAR_state_MUX_eth_8_h_l182_c9_3c37_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l182_c9_3c37_return_output := state_MUX_eth_8_h_l182_c9_3c37_return_output;

     -- uint16_15_8[eth_8_h_l160_c32_e762] LATENCY=0
     VAR_uint16_15_8_eth_8_h_l160_c32_e762_return_output := uint16_15_8(
     VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l161_l158_l162_l146_l160_DUPLICATE_d38d_return_output);

     -- o_mac_axis_data_tdata_MUX[eth_8_h_l195_c8_66e2] LATENCY=0
     -- Inputs
     o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_cond <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_cond;
     o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_iftrue <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_iftrue;
     o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_iffalse <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_iffalse;
     -- Outputs
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_return_output := o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_return_output;

     -- o_mac_axis_valid_MUX[eth_8_h_l195_c8_66e2] LATENCY=0
     -- Inputs
     o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_cond <= VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_cond;
     o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_iftrue <= VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_iftrue;
     o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_iffalse <= VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_iffalse;
     -- Outputs
     VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_return_output := o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_return_output;

     -- counter_MUX[eth_8_h_l182_c9_3c37] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l182_c9_3c37_cond <= VAR_counter_MUX_eth_8_h_l182_c9_3c37_cond;
     counter_MUX_eth_8_h_l182_c9_3c37_iftrue <= VAR_counter_MUX_eth_8_h_l182_c9_3c37_iftrue;
     counter_MUX_eth_8_h_l182_c9_3c37_iffalse <= VAR_counter_MUX_eth_8_h_l182_c9_3c37_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l182_c9_3c37_return_output := counter_MUX_eth_8_h_l182_c9_3c37_return_output;

     -- counter_MUX[eth_8_h_l163_c7_0f40] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l163_c7_0f40_cond <= VAR_counter_MUX_eth_8_h_l163_c7_0f40_cond;
     counter_MUX_eth_8_h_l163_c7_0f40_iftrue <= VAR_counter_MUX_eth_8_h_l163_c7_0f40_iftrue;
     counter_MUX_eth_8_h_l163_c7_0f40_iffalse <= VAR_counter_MUX_eth_8_h_l163_c7_0f40_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l163_c7_0f40_return_output := counter_MUX_eth_8_h_l163_c7_0f40_return_output;

     -- header_MUX[eth_8_h_l131_c7_b93c] LATENCY=0
     -- Inputs
     header_MUX_eth_8_h_l131_c7_b93c_cond <= VAR_header_MUX_eth_8_h_l131_c7_b93c_cond;
     header_MUX_eth_8_h_l131_c7_b93c_iftrue <= VAR_header_MUX_eth_8_h_l131_c7_b93c_iftrue;
     header_MUX_eth_8_h_l131_c7_b93c_iffalse <= VAR_header_MUX_eth_8_h_l131_c7_b93c_iffalse;
     -- Outputs
     VAR_header_MUX_eth_8_h_l131_c7_b93c_return_output := header_MUX_eth_8_h_l131_c7_b93c_return_output;

     -- Submodule level 2
     VAR_counter_MUX_eth_8_h_l179_c5_c04e_cond := VAR_BIN_OP_AND_eth_8_h_l179_c8_57d6_return_output;
     VAR_state_MUX_eth_8_h_l179_c5_c04e_cond := VAR_BIN_OP_AND_eth_8_h_l179_c8_57d6_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l149_c5_0fbd_iftrue := VAR_CONST_SL_8_eth_8_h_l150_c24_6569_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l161_c5_eef5_iftrue := VAR_CONST_SL_8_eth_8_h_l162_c26_10fa_return_output;
     VAR_counter_MUX_eth_8_h_l201_c7_e8c9_cond := VAR_UNARY_OP_NOT_eth_8_h_l197_c30_706a_return_output;
     VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_iftrue := VAR_UNARY_OP_NOT_eth_8_h_l197_c30_706a_return_output;
     VAR_state_MUX_eth_8_h_l201_c7_e8c9_cond := VAR_UNARY_OP_NOT_eth_8_h_l197_c30_706a_return_output;
     VAR_counter_MUX_eth_8_h_l136_c7_7178_iftrue := VAR_counter_MUX_eth_8_h_l138_c9_14af_return_output;
     VAR_counter_MUX_eth_8_h_l149_c5_0fbd_iftrue := VAR_counter_MUX_eth_8_h_l151_c7_feb9_return_output;
     VAR_counter_MUX_eth_8_h_l161_c5_eef5_iftrue := VAR_counter_MUX_eth_8_h_l163_c7_0f40_return_output;
     VAR_counter_MUX_eth_8_h_l180_c7_8da5_iftrue := VAR_counter_MUX_eth_8_h_l182_c9_3c37_return_output;
     VAR_state_MUX_eth_8_h_l136_c7_7178_iftrue := VAR_state_MUX_eth_8_h_l138_c9_14af_return_output;
     VAR_state_MUX_eth_8_h_l149_c5_0fbd_iftrue := VAR_state_MUX_eth_8_h_l151_c7_feb9_return_output;
     VAR_state_MUX_eth_8_h_l161_c5_eef5_iftrue := VAR_state_MUX_eth_8_h_l163_c7_0f40_return_output;
     VAR_state_MUX_eth_8_h_l180_c7_8da5_iftrue := VAR_state_MUX_eth_8_h_l182_c9_3c37_return_output;
     -- CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l136_l135_l137_DUPLICATE_9dee LATENCY=0
     VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l136_l135_l137_DUPLICATE_9dee_return_output := VAR_header_MUX_eth_8_h_l131_c7_b93c_return_output.dst_mac;

     -- header_src_mac_MUX[eth_8_h_l149_c5_0fbd] LATENCY=0
     -- Inputs
     header_src_mac_MUX_eth_8_h_l149_c5_0fbd_cond <= VAR_header_src_mac_MUX_eth_8_h_l149_c5_0fbd_cond;
     header_src_mac_MUX_eth_8_h_l149_c5_0fbd_iftrue <= VAR_header_src_mac_MUX_eth_8_h_l149_c5_0fbd_iftrue;
     header_src_mac_MUX_eth_8_h_l149_c5_0fbd_iffalse <= VAR_header_src_mac_MUX_eth_8_h_l149_c5_0fbd_iffalse;
     -- Outputs
     VAR_header_src_mac_MUX_eth_8_h_l149_c5_0fbd_return_output := header_src_mac_MUX_eth_8_h_l149_c5_0fbd_return_output;

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524[eth_8_h_l172_c8_9f43] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524_eth_8_h_l172_c8_9f43_return_output := CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524(
     VAR_CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d_eth_8_h_l174_c23_d1d8_return_output,
     VAR_MUX_eth_8_h_l176_c29_d1bb_return_output,
     VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l177_l130_DUPLICATE_01f4_return_output,
     VAR_mac_axis_ready);

     -- header_ethertype_MUX[eth_8_h_l161_c5_eef5] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l161_c5_eef5_cond <= VAR_header_ethertype_MUX_eth_8_h_l161_c5_eef5_cond;
     header_ethertype_MUX_eth_8_h_l161_c5_eef5_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l161_c5_eef5_iftrue;
     header_ethertype_MUX_eth_8_h_l161_c5_eef5_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l161_c5_eef5_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l161_c5_eef5_return_output := header_ethertype_MUX_eth_8_h_l161_c5_eef5_return_output;

     -- o_mac_axis_data_tlast_MUX[eth_8_h_l195_c8_66e2] LATENCY=0
     -- Inputs
     o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_cond <= VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_cond;
     o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_iftrue <= VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_iftrue;
     o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_iffalse <= VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_iffalse;
     -- Outputs
     VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_return_output := o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_return_output;

     -- state_MUX[eth_8_h_l201_c7_e8c9] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l201_c7_e8c9_cond <= VAR_state_MUX_eth_8_h_l201_c7_e8c9_cond;
     state_MUX_eth_8_h_l201_c7_e8c9_iftrue <= VAR_state_MUX_eth_8_h_l201_c7_e8c9_iftrue;
     state_MUX_eth_8_h_l201_c7_e8c9_iffalse <= VAR_state_MUX_eth_8_h_l201_c7_e8c9_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l201_c7_e8c9_return_output := state_MUX_eth_8_h_l201_c7_e8c9_return_output;

     -- counter_MUX[eth_8_h_l136_c7_7178] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l136_c7_7178_cond <= VAR_counter_MUX_eth_8_h_l136_c7_7178_cond;
     counter_MUX_eth_8_h_l136_c7_7178_iftrue <= VAR_counter_MUX_eth_8_h_l136_c7_7178_iftrue;
     counter_MUX_eth_8_h_l136_c7_7178_iffalse <= VAR_counter_MUX_eth_8_h_l136_c7_7178_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l136_c7_7178_return_output := counter_MUX_eth_8_h_l136_c7_7178_return_output;

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb[eth_8_h_l146_c9_831f] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l146_c9_831f_return_output := CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb(
     eth_8_tx_t_NULL,
     to_unsigned(1, 1),
     to_unsigned(0, 1),
     to_unsigned(1, 1),
     VAR_uint48_47_40_eth_8_h_l148_c32_60da_return_output);

     -- counter_MUX[eth_8_h_l149_c5_0fbd] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l149_c5_0fbd_cond <= VAR_counter_MUX_eth_8_h_l149_c5_0fbd_cond;
     counter_MUX_eth_8_h_l149_c5_0fbd_iftrue <= VAR_counter_MUX_eth_8_h_l149_c5_0fbd_iftrue;
     counter_MUX_eth_8_h_l149_c5_0fbd_iffalse <= VAR_counter_MUX_eth_8_h_l149_c5_0fbd_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l149_c5_0fbd_return_output := counter_MUX_eth_8_h_l149_c5_0fbd_return_output;

     -- state_MUX[eth_8_h_l149_c5_0fbd] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l149_c5_0fbd_cond <= VAR_state_MUX_eth_8_h_l149_c5_0fbd_cond;
     state_MUX_eth_8_h_l149_c5_0fbd_iftrue <= VAR_state_MUX_eth_8_h_l149_c5_0fbd_iftrue;
     state_MUX_eth_8_h_l149_c5_0fbd_iffalse <= VAR_state_MUX_eth_8_h_l149_c5_0fbd_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l149_c5_0fbd_return_output := state_MUX_eth_8_h_l149_c5_0fbd_return_output;

     -- state_MUX[eth_8_h_l161_c5_eef5] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l161_c5_eef5_cond <= VAR_state_MUX_eth_8_h_l161_c5_eef5_cond;
     state_MUX_eth_8_h_l161_c5_eef5_iftrue <= VAR_state_MUX_eth_8_h_l161_c5_eef5_iftrue;
     state_MUX_eth_8_h_l161_c5_eef5_iffalse <= VAR_state_MUX_eth_8_h_l161_c5_eef5_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l161_c5_eef5_return_output := state_MUX_eth_8_h_l161_c5_eef5_return_output;

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb[eth_8_h_l158_c9_38ee] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l158_c9_38ee_return_output := CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb(
     eth_8_tx_t_NULL,
     to_unsigned(1, 1),
     to_unsigned(0, 1),
     to_unsigned(1, 1),
     VAR_uint16_15_8_eth_8_h_l160_c32_e762_return_output);

     -- counter_MUX[eth_8_h_l201_c7_e8c9] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l201_c7_e8c9_cond <= VAR_counter_MUX_eth_8_h_l201_c7_e8c9_cond;
     counter_MUX_eth_8_h_l201_c7_e8c9_iftrue <= VAR_counter_MUX_eth_8_h_l201_c7_e8c9_iftrue;
     counter_MUX_eth_8_h_l201_c7_e8c9_iffalse <= VAR_counter_MUX_eth_8_h_l201_c7_e8c9_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l201_c7_e8c9_return_output := counter_MUX_eth_8_h_l201_c7_e8c9_return_output;

     -- state_MUX[eth_8_h_l180_c7_8da5] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l180_c7_8da5_cond <= VAR_state_MUX_eth_8_h_l180_c7_8da5_cond;
     state_MUX_eth_8_h_l180_c7_8da5_iftrue <= VAR_state_MUX_eth_8_h_l180_c7_8da5_iftrue;
     state_MUX_eth_8_h_l180_c7_8da5_iffalse <= VAR_state_MUX_eth_8_h_l180_c7_8da5_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l180_c7_8da5_return_output := state_MUX_eth_8_h_l180_c7_8da5_return_output;

     -- counter_MUX[eth_8_h_l161_c5_eef5] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l161_c5_eef5_cond <= VAR_counter_MUX_eth_8_h_l161_c5_eef5_cond;
     counter_MUX_eth_8_h_l161_c5_eef5_iftrue <= VAR_counter_MUX_eth_8_h_l161_c5_eef5_iftrue;
     counter_MUX_eth_8_h_l161_c5_eef5_iffalse <= VAR_counter_MUX_eth_8_h_l161_c5_eef5_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l161_c5_eef5_return_output := counter_MUX_eth_8_h_l161_c5_eef5_return_output;

     -- counter_MUX[eth_8_h_l180_c7_8da5] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l180_c7_8da5_cond <= VAR_counter_MUX_eth_8_h_l180_c7_8da5_cond;
     counter_MUX_eth_8_h_l180_c7_8da5_iftrue <= VAR_counter_MUX_eth_8_h_l180_c7_8da5_iftrue;
     counter_MUX_eth_8_h_l180_c7_8da5_iffalse <= VAR_counter_MUX_eth_8_h_l180_c7_8da5_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l180_c7_8da5_return_output := counter_MUX_eth_8_h_l180_c7_8da5_return_output;

     -- state_MUX[eth_8_h_l136_c7_7178] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l136_c7_7178_cond <= VAR_state_MUX_eth_8_h_l136_c7_7178_cond;
     state_MUX_eth_8_h_l136_c7_7178_iftrue <= VAR_state_MUX_eth_8_h_l136_c7_7178_iftrue;
     state_MUX_eth_8_h_l136_c7_7178_iffalse <= VAR_state_MUX_eth_8_h_l136_c7_7178_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l136_c7_7178_return_output := state_MUX_eth_8_h_l136_c7_7178_return_output;

     -- Submodule level 3
     VAR_CONST_SL_8_eth_8_h_l137_c26_8f68_x := VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l136_l135_l137_DUPLICATE_9dee_return_output;
     VAR_header_dst_mac_MUX_eth_8_h_l136_c7_7178_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l136_l135_l137_DUPLICATE_9dee_return_output;
     VAR_counter_MUX_eth_8_h_l130_c5_8429_iftrue := VAR_counter_MUX_eth_8_h_l136_c7_7178_return_output;
     VAR_counter_MUX_eth_8_h_l146_c9_831f_iftrue := VAR_counter_MUX_eth_8_h_l149_c5_0fbd_return_output;
     VAR_counter_MUX_eth_8_h_l158_c9_38ee_iftrue := VAR_counter_MUX_eth_8_h_l161_c5_eef5_return_output;
     VAR_BIN_OP_PLUS_eth_8_h_l190_c9_20ee_left := VAR_counter_MUX_eth_8_h_l180_c7_8da5_return_output;
     VAR_counter_MUX_eth_8_h_l189_c7_71a6_iffalse := VAR_counter_MUX_eth_8_h_l180_c7_8da5_return_output;
     VAR_counter_MUX_eth_8_h_l199_c5_a6f0_iftrue := VAR_counter_MUX_eth_8_h_l201_c7_e8c9_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l158_c9_38ee_iftrue := VAR_header_ethertype_MUX_eth_8_h_l161_c5_eef5_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l146_c9_831f_iftrue := VAR_header_src_mac_MUX_eth_8_h_l149_c5_0fbd_return_output;
     VAR_o_MUX_eth_8_h_l146_c9_831f_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l146_c9_831f_return_output;
     VAR_o_MUX_eth_8_h_l158_c9_38ee_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l158_c9_38ee_return_output;
     VAR_o_MUX_eth_8_h_l172_c8_9f43_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524_eth_8_h_l172_c8_9f43_return_output;
     VAR_state_MUX_eth_8_h_l130_c5_8429_iftrue := VAR_state_MUX_eth_8_h_l136_c7_7178_return_output;
     VAR_state_MUX_eth_8_h_l146_c9_831f_iftrue := VAR_state_MUX_eth_8_h_l149_c5_0fbd_return_output;
     VAR_state_MUX_eth_8_h_l158_c9_38ee_iftrue := VAR_state_MUX_eth_8_h_l161_c5_eef5_return_output;
     VAR_state_MUX_eth_8_h_l179_c5_c04e_iftrue := VAR_state_MUX_eth_8_h_l180_c7_8da5_return_output;
     VAR_state_MUX_eth_8_h_l199_c5_a6f0_iftrue := VAR_state_MUX_eth_8_h_l201_c7_e8c9_return_output;
     -- CONST_SL_8[eth_8_h_l137_c26_8f68] LATENCY=0
     -- Inputs
     CONST_SL_8_eth_8_h_l137_c26_8f68_x <= VAR_CONST_SL_8_eth_8_h_l137_c26_8f68_x;
     -- Outputs
     VAR_CONST_SL_8_eth_8_h_l137_c26_8f68_return_output := CONST_SL_8_eth_8_h_l137_c26_8f68_return_output;

     -- counter_MUX[eth_8_h_l199_c5_a6f0] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l199_c5_a6f0_cond <= VAR_counter_MUX_eth_8_h_l199_c5_a6f0_cond;
     counter_MUX_eth_8_h_l199_c5_a6f0_iftrue <= VAR_counter_MUX_eth_8_h_l199_c5_a6f0_iftrue;
     counter_MUX_eth_8_h_l199_c5_a6f0_iffalse <= VAR_counter_MUX_eth_8_h_l199_c5_a6f0_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l199_c5_a6f0_return_output := counter_MUX_eth_8_h_l199_c5_a6f0_return_output;

     -- header_src_mac_MUX[eth_8_h_l146_c9_831f] LATENCY=0
     -- Inputs
     header_src_mac_MUX_eth_8_h_l146_c9_831f_cond <= VAR_header_src_mac_MUX_eth_8_h_l146_c9_831f_cond;
     header_src_mac_MUX_eth_8_h_l146_c9_831f_iftrue <= VAR_header_src_mac_MUX_eth_8_h_l146_c9_831f_iftrue;
     header_src_mac_MUX_eth_8_h_l146_c9_831f_iffalse <= VAR_header_src_mac_MUX_eth_8_h_l146_c9_831f_iffalse;
     -- Outputs
     VAR_header_src_mac_MUX_eth_8_h_l146_c9_831f_return_output := header_src_mac_MUX_eth_8_h_l146_c9_831f_return_output;

     -- counter_MUX[eth_8_h_l130_c5_8429] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l130_c5_8429_cond <= VAR_counter_MUX_eth_8_h_l130_c5_8429_cond;
     counter_MUX_eth_8_h_l130_c5_8429_iftrue <= VAR_counter_MUX_eth_8_h_l130_c5_8429_iftrue;
     counter_MUX_eth_8_h_l130_c5_8429_iffalse <= VAR_counter_MUX_eth_8_h_l130_c5_8429_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l130_c5_8429_return_output := counter_MUX_eth_8_h_l130_c5_8429_return_output;

     -- state_MUX[eth_8_h_l130_c5_8429] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l130_c5_8429_cond <= VAR_state_MUX_eth_8_h_l130_c5_8429_cond;
     state_MUX_eth_8_h_l130_c5_8429_iftrue <= VAR_state_MUX_eth_8_h_l130_c5_8429_iftrue;
     state_MUX_eth_8_h_l130_c5_8429_iffalse <= VAR_state_MUX_eth_8_h_l130_c5_8429_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l130_c5_8429_return_output := state_MUX_eth_8_h_l130_c5_8429_return_output;

     -- state_MUX[eth_8_h_l179_c5_c04e] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l179_c5_c04e_cond <= VAR_state_MUX_eth_8_h_l179_c5_c04e_cond;
     state_MUX_eth_8_h_l179_c5_c04e_iftrue <= VAR_state_MUX_eth_8_h_l179_c5_c04e_iftrue;
     state_MUX_eth_8_h_l179_c5_c04e_iffalse <= VAR_state_MUX_eth_8_h_l179_c5_c04e_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l179_c5_c04e_return_output := state_MUX_eth_8_h_l179_c5_c04e_return_output;

     -- uint48_47_40[eth_8_h_l135_c34_883a] LATENCY=0
     VAR_uint48_47_40_eth_8_h_l135_c34_883a_return_output := uint48_47_40(
     VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l136_l135_l137_DUPLICATE_9dee_return_output);

     -- BIN_OP_PLUS[eth_8_h_l190_c9_20ee] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l190_c9_20ee_left <= VAR_BIN_OP_PLUS_eth_8_h_l190_c9_20ee_left;
     BIN_OP_PLUS_eth_8_h_l190_c9_20ee_right <= VAR_BIN_OP_PLUS_eth_8_h_l190_c9_20ee_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l190_c9_20ee_return_output := BIN_OP_PLUS_eth_8_h_l190_c9_20ee_return_output;

     -- header_ethertype_MUX[eth_8_h_l158_c9_38ee] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l158_c9_38ee_cond <= VAR_header_ethertype_MUX_eth_8_h_l158_c9_38ee_cond;
     header_ethertype_MUX_eth_8_h_l158_c9_38ee_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l158_c9_38ee_iftrue;
     header_ethertype_MUX_eth_8_h_l158_c9_38ee_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l158_c9_38ee_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l158_c9_38ee_return_output := header_ethertype_MUX_eth_8_h_l158_c9_38ee_return_output;

     -- state_MUX[eth_8_h_l199_c5_a6f0] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l199_c5_a6f0_cond <= VAR_state_MUX_eth_8_h_l199_c5_a6f0_cond;
     state_MUX_eth_8_h_l199_c5_a6f0_iftrue <= VAR_state_MUX_eth_8_h_l199_c5_a6f0_iftrue;
     state_MUX_eth_8_h_l199_c5_a6f0_iffalse <= VAR_state_MUX_eth_8_h_l199_c5_a6f0_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l199_c5_a6f0_return_output := state_MUX_eth_8_h_l199_c5_a6f0_return_output;

     -- o_FALSE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_19fe[eth_8_h_l172_c8_9f43] LATENCY=0
     VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_19fe_eth_8_h_l172_c8_9f43_return_output := CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_19fe(
     to_unsigned(1, 1),
     to_unsigned(0, 1),
     VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_66e2_return_output,
     VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_66e2_return_output,
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_66e2_return_output);

     -- Submodule level 4
     VAR_counter_eth_8_h_l190_c9_95b7 := resize(VAR_BIN_OP_PLUS_eth_8_h_l190_c9_20ee_return_output, 6);
     VAR_header_dst_mac_MUX_eth_8_h_l136_c7_7178_iftrue := VAR_CONST_SL_8_eth_8_h_l137_c26_8f68_return_output;
     VAR_counter_MUX_eth_8_h_l128_c3_146b_iftrue := VAR_counter_MUX_eth_8_h_l130_c5_8429_return_output;
     VAR_counter_MUX_eth_8_h_l195_c8_66e2_iftrue := VAR_counter_MUX_eth_8_h_l199_c5_a6f0_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l146_c9_831f_iffalse := VAR_header_ethertype_MUX_eth_8_h_l158_c9_38ee_return_output;
     VAR_o_MUX_eth_8_h_l172_c8_9f43_iffalse := VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_19fe_eth_8_h_l172_c8_9f43_return_output;
     VAR_state_MUX_eth_8_h_l128_c3_146b_iftrue := VAR_state_MUX_eth_8_h_l130_c5_8429_return_output;
     VAR_state_MUX_eth_8_h_l172_c8_9f43_iftrue := VAR_state_MUX_eth_8_h_l179_c5_c04e_return_output;
     VAR_state_MUX_eth_8_h_l195_c8_66e2_iftrue := VAR_state_MUX_eth_8_h_l199_c5_a6f0_return_output;
     VAR_counter_MUX_eth_8_h_l189_c7_71a6_iftrue := VAR_counter_eth_8_h_l190_c9_95b7;
     -- o_MUX[eth_8_h_l172_c8_9f43] LATENCY=0
     -- Inputs
     o_MUX_eth_8_h_l172_c8_9f43_cond <= VAR_o_MUX_eth_8_h_l172_c8_9f43_cond;
     o_MUX_eth_8_h_l172_c8_9f43_iftrue <= VAR_o_MUX_eth_8_h_l172_c8_9f43_iftrue;
     o_MUX_eth_8_h_l172_c8_9f43_iffalse <= VAR_o_MUX_eth_8_h_l172_c8_9f43_iffalse;
     -- Outputs
     VAR_o_MUX_eth_8_h_l172_c8_9f43_return_output := o_MUX_eth_8_h_l172_c8_9f43_return_output;

     -- header_dst_mac_MUX[eth_8_h_l136_c7_7178] LATENCY=0
     -- Inputs
     header_dst_mac_MUX_eth_8_h_l136_c7_7178_cond <= VAR_header_dst_mac_MUX_eth_8_h_l136_c7_7178_cond;
     header_dst_mac_MUX_eth_8_h_l136_c7_7178_iftrue <= VAR_header_dst_mac_MUX_eth_8_h_l136_c7_7178_iftrue;
     header_dst_mac_MUX_eth_8_h_l136_c7_7178_iffalse <= VAR_header_dst_mac_MUX_eth_8_h_l136_c7_7178_iffalse;
     -- Outputs
     VAR_header_dst_mac_MUX_eth_8_h_l136_c7_7178_return_output := header_dst_mac_MUX_eth_8_h_l136_c7_7178_return_output;

     -- state_MUX[eth_8_h_l195_c8_66e2] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l195_c8_66e2_cond <= VAR_state_MUX_eth_8_h_l195_c8_66e2_cond;
     state_MUX_eth_8_h_l195_c8_66e2_iftrue <= VAR_state_MUX_eth_8_h_l195_c8_66e2_iftrue;
     state_MUX_eth_8_h_l195_c8_66e2_iffalse <= VAR_state_MUX_eth_8_h_l195_c8_66e2_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l195_c8_66e2_return_output := state_MUX_eth_8_h_l195_c8_66e2_return_output;

     -- o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3[eth_8_h_l130_c5_8429] LATENCY=0
     VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l130_c5_8429_return_output := CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3(
     VAR_uint48_47_40_eth_8_h_l135_c34_883a_return_output);

     -- counter_MUX[eth_8_h_l189_c7_71a6] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l189_c7_71a6_cond <= VAR_counter_MUX_eth_8_h_l189_c7_71a6_cond;
     counter_MUX_eth_8_h_l189_c7_71a6_iftrue <= VAR_counter_MUX_eth_8_h_l189_c7_71a6_iftrue;
     counter_MUX_eth_8_h_l189_c7_71a6_iffalse <= VAR_counter_MUX_eth_8_h_l189_c7_71a6_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l189_c7_71a6_return_output := counter_MUX_eth_8_h_l189_c7_71a6_return_output;

     -- header_ethertype_MUX[eth_8_h_l146_c9_831f] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l146_c9_831f_cond <= VAR_header_ethertype_MUX_eth_8_h_l146_c9_831f_cond;
     header_ethertype_MUX_eth_8_h_l146_c9_831f_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l146_c9_831f_iftrue;
     header_ethertype_MUX_eth_8_h_l146_c9_831f_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l146_c9_831f_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l146_c9_831f_return_output := header_ethertype_MUX_eth_8_h_l146_c9_831f_return_output;

     -- counter_MUX[eth_8_h_l195_c8_66e2] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l195_c8_66e2_cond <= VAR_counter_MUX_eth_8_h_l195_c8_66e2_cond;
     counter_MUX_eth_8_h_l195_c8_66e2_iftrue <= VAR_counter_MUX_eth_8_h_l195_c8_66e2_iftrue;
     counter_MUX_eth_8_h_l195_c8_66e2_iffalse <= VAR_counter_MUX_eth_8_h_l195_c8_66e2_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l195_c8_66e2_return_output := counter_MUX_eth_8_h_l195_c8_66e2_return_output;

     -- Submodule level 5
     VAR_counter_MUX_eth_8_h_l179_c5_c04e_iftrue := VAR_counter_MUX_eth_8_h_l189_c7_71a6_return_output;
     VAR_counter_MUX_eth_8_h_l172_c8_9f43_iffalse := VAR_counter_MUX_eth_8_h_l195_c8_66e2_return_output;
     VAR_o_MUX_eth_8_h_l158_c9_38ee_iffalse := VAR_o_MUX_eth_8_h_l172_c8_9f43_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_iftrue := VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l130_c5_8429_return_output;
     VAR_state_MUX_eth_8_h_l172_c8_9f43_iffalse := VAR_state_MUX_eth_8_h_l195_c8_66e2_return_output;
     -- counter_MUX[eth_8_h_l179_c5_c04e] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l179_c5_c04e_cond <= VAR_counter_MUX_eth_8_h_l179_c5_c04e_cond;
     counter_MUX_eth_8_h_l179_c5_c04e_iftrue <= VAR_counter_MUX_eth_8_h_l179_c5_c04e_iftrue;
     counter_MUX_eth_8_h_l179_c5_c04e_iffalse <= VAR_counter_MUX_eth_8_h_l179_c5_c04e_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l179_c5_c04e_return_output := counter_MUX_eth_8_h_l179_c5_c04e_return_output;

     -- header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484[eth_8_h_l130_c5_8429] LATENCY=0
     VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l130_c5_8429_return_output := CONST_REF_RD_eth_header_t_eth_header_t_e484(
     VAR_header_MUX_eth_8_h_l131_c7_b93c_return_output,
     VAR_header_dst_mac_MUX_eth_8_h_l136_c7_7178_return_output);

     -- o_MUX[eth_8_h_l158_c9_38ee] LATENCY=0
     -- Inputs
     o_MUX_eth_8_h_l158_c9_38ee_cond <= VAR_o_MUX_eth_8_h_l158_c9_38ee_cond;
     o_MUX_eth_8_h_l158_c9_38ee_iftrue <= VAR_o_MUX_eth_8_h_l158_c9_38ee_iftrue;
     o_MUX_eth_8_h_l158_c9_38ee_iffalse <= VAR_o_MUX_eth_8_h_l158_c9_38ee_iffalse;
     -- Outputs
     VAR_o_MUX_eth_8_h_l158_c9_38ee_return_output := o_MUX_eth_8_h_l158_c9_38ee_return_output;

     -- state_MUX[eth_8_h_l172_c8_9f43] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l172_c8_9f43_cond <= VAR_state_MUX_eth_8_h_l172_c8_9f43_cond;
     state_MUX_eth_8_h_l172_c8_9f43_iftrue <= VAR_state_MUX_eth_8_h_l172_c8_9f43_iftrue;
     state_MUX_eth_8_h_l172_c8_9f43_iffalse <= VAR_state_MUX_eth_8_h_l172_c8_9f43_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l172_c8_9f43_return_output := state_MUX_eth_8_h_l172_c8_9f43_return_output;

     -- o_mac_axis_data_tdata_MUX[eth_8_h_l130_c5_8429] LATENCY=0
     -- Inputs
     o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_cond <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_cond;
     o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_iftrue <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_iftrue;
     o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_iffalse <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_iffalse;
     -- Outputs
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_return_output := o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_return_output;

     -- header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a[eth_8_h_l128_c3_146b] LATENCY=0
     VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a_eth_8_h_l128_c3_146b_return_output := CONST_REF_RD_eth_header_t_eth_header_t_325a(
     header,
     VAR_header_ethertype_MUX_eth_8_h_l146_c9_831f_return_output,
     VAR_header_src_mac_MUX_eth_8_h_l146_c9_831f_return_output);

     -- Submodule level 6
     VAR_counter_MUX_eth_8_h_l172_c8_9f43_iftrue := VAR_counter_MUX_eth_8_h_l179_c5_c04e_return_output;
     VAR_header_MUX_eth_8_h_l128_c3_146b_iffalse := VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a_eth_8_h_l128_c3_146b_return_output;
     VAR_header_MUX_eth_8_h_l130_c5_8429_iftrue := VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l130_c5_8429_return_output;
     VAR_o_MUX_eth_8_h_l146_c9_831f_iffalse := VAR_o_MUX_eth_8_h_l158_c9_38ee_return_output;
     VAR_state_MUX_eth_8_h_l158_c9_38ee_iffalse := VAR_state_MUX_eth_8_h_l172_c8_9f43_return_output;
     -- counter_MUX[eth_8_h_l172_c8_9f43] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l172_c8_9f43_cond <= VAR_counter_MUX_eth_8_h_l172_c8_9f43_cond;
     counter_MUX_eth_8_h_l172_c8_9f43_iftrue <= VAR_counter_MUX_eth_8_h_l172_c8_9f43_iftrue;
     counter_MUX_eth_8_h_l172_c8_9f43_iffalse <= VAR_counter_MUX_eth_8_h_l172_c8_9f43_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l172_c8_9f43_return_output := counter_MUX_eth_8_h_l172_c8_9f43_return_output;

     -- o_MUX[eth_8_h_l146_c9_831f] LATENCY=0
     -- Inputs
     o_MUX_eth_8_h_l146_c9_831f_cond <= VAR_o_MUX_eth_8_h_l146_c9_831f_cond;
     o_MUX_eth_8_h_l146_c9_831f_iftrue <= VAR_o_MUX_eth_8_h_l146_c9_831f_iftrue;
     o_MUX_eth_8_h_l146_c9_831f_iffalse <= VAR_o_MUX_eth_8_h_l146_c9_831f_iffalse;
     -- Outputs
     VAR_o_MUX_eth_8_h_l146_c9_831f_return_output := o_MUX_eth_8_h_l146_c9_831f_return_output;

     -- header_MUX[eth_8_h_l130_c5_8429] LATENCY=0
     -- Inputs
     header_MUX_eth_8_h_l130_c5_8429_cond <= VAR_header_MUX_eth_8_h_l130_c5_8429_cond;
     header_MUX_eth_8_h_l130_c5_8429_iftrue <= VAR_header_MUX_eth_8_h_l130_c5_8429_iftrue;
     header_MUX_eth_8_h_l130_c5_8429_iffalse <= VAR_header_MUX_eth_8_h_l130_c5_8429_iffalse;
     -- Outputs
     VAR_header_MUX_eth_8_h_l130_c5_8429_return_output := header_MUX_eth_8_h_l130_c5_8429_return_output;

     -- state_MUX[eth_8_h_l158_c9_38ee] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l158_c9_38ee_cond <= VAR_state_MUX_eth_8_h_l158_c9_38ee_cond;
     state_MUX_eth_8_h_l158_c9_38ee_iftrue <= VAR_state_MUX_eth_8_h_l158_c9_38ee_iftrue;
     state_MUX_eth_8_h_l158_c9_38ee_iffalse <= VAR_state_MUX_eth_8_h_l158_c9_38ee_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l158_c9_38ee_return_output := state_MUX_eth_8_h_l158_c9_38ee_return_output;

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856[eth_8_h_l128_c3_146b] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856_eth_8_h_l128_c3_146b_return_output := CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856(
     eth_8_tx_t_NULL,
     to_unsigned(1, 1),
     to_unsigned(0, 1),
     VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_8429_return_output,
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_8429_return_output);

     -- Submodule level 7
     VAR_counter_MUX_eth_8_h_l158_c9_38ee_iffalse := VAR_counter_MUX_eth_8_h_l172_c8_9f43_return_output;
     VAR_header_MUX_eth_8_h_l128_c3_146b_iftrue := VAR_header_MUX_eth_8_h_l130_c5_8429_return_output;
     VAR_o_MUX_eth_8_h_l128_c3_146b_iffalse := VAR_o_MUX_eth_8_h_l146_c9_831f_return_output;
     VAR_o_MUX_eth_8_h_l128_c3_146b_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856_eth_8_h_l128_c3_146b_return_output;
     VAR_state_MUX_eth_8_h_l146_c9_831f_iffalse := VAR_state_MUX_eth_8_h_l158_c9_38ee_return_output;
     -- header_MUX[eth_8_h_l128_c3_146b] LATENCY=0
     -- Inputs
     header_MUX_eth_8_h_l128_c3_146b_cond <= VAR_header_MUX_eth_8_h_l128_c3_146b_cond;
     header_MUX_eth_8_h_l128_c3_146b_iftrue <= VAR_header_MUX_eth_8_h_l128_c3_146b_iftrue;
     header_MUX_eth_8_h_l128_c3_146b_iffalse <= VAR_header_MUX_eth_8_h_l128_c3_146b_iffalse;
     -- Outputs
     VAR_header_MUX_eth_8_h_l128_c3_146b_return_output := header_MUX_eth_8_h_l128_c3_146b_return_output;

     -- counter_MUX[eth_8_h_l158_c9_38ee] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l158_c9_38ee_cond <= VAR_counter_MUX_eth_8_h_l158_c9_38ee_cond;
     counter_MUX_eth_8_h_l158_c9_38ee_iftrue <= VAR_counter_MUX_eth_8_h_l158_c9_38ee_iftrue;
     counter_MUX_eth_8_h_l158_c9_38ee_iffalse <= VAR_counter_MUX_eth_8_h_l158_c9_38ee_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l158_c9_38ee_return_output := counter_MUX_eth_8_h_l158_c9_38ee_return_output;

     -- o_MUX[eth_8_h_l128_c3_146b] LATENCY=0
     -- Inputs
     o_MUX_eth_8_h_l128_c3_146b_cond <= VAR_o_MUX_eth_8_h_l128_c3_146b_cond;
     o_MUX_eth_8_h_l128_c3_146b_iftrue <= VAR_o_MUX_eth_8_h_l128_c3_146b_iftrue;
     o_MUX_eth_8_h_l128_c3_146b_iffalse <= VAR_o_MUX_eth_8_h_l128_c3_146b_iffalse;
     -- Outputs
     VAR_o_MUX_eth_8_h_l128_c3_146b_return_output := o_MUX_eth_8_h_l128_c3_146b_return_output;

     -- state_MUX[eth_8_h_l146_c9_831f] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l146_c9_831f_cond <= VAR_state_MUX_eth_8_h_l146_c9_831f_cond;
     state_MUX_eth_8_h_l146_c9_831f_iftrue <= VAR_state_MUX_eth_8_h_l146_c9_831f_iftrue;
     state_MUX_eth_8_h_l146_c9_831f_iffalse <= VAR_state_MUX_eth_8_h_l146_c9_831f_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l146_c9_831f_return_output := state_MUX_eth_8_h_l146_c9_831f_return_output;

     -- Submodule level 8
     VAR_counter_MUX_eth_8_h_l146_c9_831f_iffalse := VAR_counter_MUX_eth_8_h_l158_c9_38ee_return_output;
     REG_VAR_header := VAR_header_MUX_eth_8_h_l128_c3_146b_return_output;
     VAR_return_output := VAR_o_MUX_eth_8_h_l128_c3_146b_return_output;
     VAR_state_MUX_eth_8_h_l128_c3_146b_iffalse := VAR_state_MUX_eth_8_h_l146_c9_831f_return_output;
     -- state_MUX[eth_8_h_l128_c3_146b] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l128_c3_146b_cond <= VAR_state_MUX_eth_8_h_l128_c3_146b_cond;
     state_MUX_eth_8_h_l128_c3_146b_iftrue <= VAR_state_MUX_eth_8_h_l128_c3_146b_iftrue;
     state_MUX_eth_8_h_l128_c3_146b_iffalse <= VAR_state_MUX_eth_8_h_l128_c3_146b_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l128_c3_146b_return_output := state_MUX_eth_8_h_l128_c3_146b_return_output;

     -- counter_MUX[eth_8_h_l146_c9_831f] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l146_c9_831f_cond <= VAR_counter_MUX_eth_8_h_l146_c9_831f_cond;
     counter_MUX_eth_8_h_l146_c9_831f_iftrue <= VAR_counter_MUX_eth_8_h_l146_c9_831f_iftrue;
     counter_MUX_eth_8_h_l146_c9_831f_iffalse <= VAR_counter_MUX_eth_8_h_l146_c9_831f_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l146_c9_831f_return_output := counter_MUX_eth_8_h_l146_c9_831f_return_output;

     -- Submodule level 9
     VAR_counter_MUX_eth_8_h_l128_c3_146b_iffalse := VAR_counter_MUX_eth_8_h_l146_c9_831f_return_output;
     REG_VAR_state := VAR_state_MUX_eth_8_h_l128_c3_146b_return_output;
     -- counter_MUX[eth_8_h_l128_c3_146b] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l128_c3_146b_cond <= VAR_counter_MUX_eth_8_h_l128_c3_146b_cond;
     counter_MUX_eth_8_h_l128_c3_146b_iftrue <= VAR_counter_MUX_eth_8_h_l128_c3_146b_iftrue;
     counter_MUX_eth_8_h_l128_c3_146b_iffalse <= VAR_counter_MUX_eth_8_h_l128_c3_146b_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l128_c3_146b_return_output := counter_MUX_eth_8_h_l128_c3_146b_return_output;

     -- Submodule level 10
     REG_VAR_counter := VAR_counter_MUX_eth_8_h_l128_c3_146b_return_output;
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
