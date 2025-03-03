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
-- BIN_OP_LT[eth_8_h_l124_c32_640c]
signal BIN_OP_LT_eth_8_h_l124_c32_640c_left : unsigned(5 downto 0);
signal BIN_OP_LT_eth_8_h_l124_c32_640c_right : unsigned(5 downto 0);
signal BIN_OP_LT_eth_8_h_l124_c32_640c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[eth_8_h_l128_c6_fe00]
signal BIN_OP_EQ_eth_8_h_l128_c6_fe00_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l128_c6_fe00_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l128_c6_fe00_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l128_c3_f71d]
signal counter_MUX_eth_8_h_l128_c3_f71d_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l128_c3_f71d_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l128_c3_f71d_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l128_c3_f71d_return_output : unsigned(5 downto 0);

-- o_MUX[eth_8_h_l128_c3_f71d]
signal o_MUX_eth_8_h_l128_c3_f71d_cond : unsigned(0 downto 0);
signal o_MUX_eth_8_h_l128_c3_f71d_iftrue : eth_8_tx_t;
signal o_MUX_eth_8_h_l128_c3_f71d_iffalse : eth_8_tx_t;
signal o_MUX_eth_8_h_l128_c3_f71d_return_output : eth_8_tx_t;

-- header_MUX[eth_8_h_l128_c3_f71d]
signal header_MUX_eth_8_h_l128_c3_f71d_cond : unsigned(0 downto 0);
signal header_MUX_eth_8_h_l128_c3_f71d_iftrue : eth_header_t;
signal header_MUX_eth_8_h_l128_c3_f71d_iffalse : eth_header_t;
signal header_MUX_eth_8_h_l128_c3_f71d_return_output : eth_header_t;

-- state_MUX[eth_8_h_l128_c3_f71d]
signal state_MUX_eth_8_h_l128_c3_f71d_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l128_c3_f71d_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l128_c3_f71d_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l128_c3_f71d_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l130_c5_1846]
signal counter_MUX_eth_8_h_l130_c5_1846_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l130_c5_1846_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l130_c5_1846_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l130_c5_1846_return_output : unsigned(5 downto 0);

-- o_mac_axis_valid_MUX[eth_8_h_l130_c5_1846]
signal o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_cond : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_iftrue : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_iffalse : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_return_output : unsigned(0 downto 0);

-- o_mac_axis_data_tdata_MUX[eth_8_h_l130_c5_1846]
signal o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_cond : unsigned(0 downto 0);
signal o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_iftrue : uint8_t_1;
signal o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_iffalse : uint8_t_1;
signal o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_return_output : uint8_t_1;

-- header_MUX[eth_8_h_l130_c5_1846]
signal header_MUX_eth_8_h_l130_c5_1846_cond : unsigned(0 downto 0);
signal header_MUX_eth_8_h_l130_c5_1846_iftrue : eth_header_t;
signal header_MUX_eth_8_h_l130_c5_1846_iffalse : eth_header_t;
signal header_MUX_eth_8_h_l130_c5_1846_return_output : eth_header_t;

-- state_MUX[eth_8_h_l130_c5_1846]
signal state_MUX_eth_8_h_l130_c5_1846_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l130_c5_1846_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l130_c5_1846_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l130_c5_1846_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[eth_8_h_l131_c10_02fa]
signal BIN_OP_EQ_eth_8_h_l131_c10_02fa_left : unsigned(5 downto 0);
signal BIN_OP_EQ_eth_8_h_l131_c10_02fa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_eth_8_h_l131_c10_02fa_return_output : unsigned(0 downto 0);

-- header_MUX[eth_8_h_l131_c7_735e]
signal header_MUX_eth_8_h_l131_c7_735e_cond : unsigned(0 downto 0);
signal header_MUX_eth_8_h_l131_c7_735e_iftrue : eth_header_t;
signal header_MUX_eth_8_h_l131_c7_735e_iffalse : eth_header_t;
signal header_MUX_eth_8_h_l131_c7_735e_return_output : eth_header_t;

-- counter_MUX[eth_8_h_l136_c7_5084]
signal counter_MUX_eth_8_h_l136_c7_5084_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l136_c7_5084_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l136_c7_5084_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l136_c7_5084_return_output : unsigned(5 downto 0);

-- header_dst_mac_MUX[eth_8_h_l136_c7_5084]
signal header_dst_mac_MUX_eth_8_h_l136_c7_5084_cond : unsigned(0 downto 0);
signal header_dst_mac_MUX_eth_8_h_l136_c7_5084_iftrue : unsigned(47 downto 0);
signal header_dst_mac_MUX_eth_8_h_l136_c7_5084_iffalse : unsigned(47 downto 0);
signal header_dst_mac_MUX_eth_8_h_l136_c7_5084_return_output : unsigned(47 downto 0);

-- state_MUX[eth_8_h_l136_c7_5084]
signal state_MUX_eth_8_h_l136_c7_5084_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l136_c7_5084_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l136_c7_5084_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l136_c7_5084_return_output : unsigned(2 downto 0);

-- CONST_SL_8[eth_8_h_l137_c26_de6d]
signal CONST_SL_8_eth_8_h_l137_c26_de6d_x : unsigned(47 downto 0);
signal CONST_SL_8_eth_8_h_l137_c26_de6d_return_output : unsigned(47 downto 0);

-- BIN_OP_EQ[eth_8_h_l138_c12_d9e7]
signal BIN_OP_EQ_eth_8_h_l138_c12_d9e7_left : unsigned(5 downto 0);
signal BIN_OP_EQ_eth_8_h_l138_c12_d9e7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l138_c12_d9e7_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l138_c9_3fa7]
signal counter_MUX_eth_8_h_l138_c9_3fa7_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l138_c9_3fa7_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l138_c9_3fa7_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l138_c9_3fa7_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l138_c9_3fa7]
signal state_MUX_eth_8_h_l138_c9_3fa7_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l138_c9_3fa7_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l138_c9_3fa7_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l138_c9_3fa7_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l142_c11_aae5]
signal BIN_OP_PLUS_eth_8_h_l142_c11_aae5_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_eth_8_h_l142_c11_aae5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l142_c11_aae5_return_output : unsigned(6 downto 0);

-- BIN_OP_EQ[eth_8_h_l146_c12_e34d]
signal BIN_OP_EQ_eth_8_h_l146_c12_e34d_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l146_c12_e34d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l146_c12_e34d_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l146_c9_6103]
signal counter_MUX_eth_8_h_l146_c9_6103_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l146_c9_6103_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l146_c9_6103_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l146_c9_6103_return_output : unsigned(5 downto 0);

-- o_MUX[eth_8_h_l146_c9_6103]
signal o_MUX_eth_8_h_l146_c9_6103_cond : unsigned(0 downto 0);
signal o_MUX_eth_8_h_l146_c9_6103_iftrue : eth_8_tx_t;
signal o_MUX_eth_8_h_l146_c9_6103_iffalse : eth_8_tx_t;
signal o_MUX_eth_8_h_l146_c9_6103_return_output : eth_8_tx_t;

-- header_src_mac_MUX[eth_8_h_l146_c9_6103]
signal header_src_mac_MUX_eth_8_h_l146_c9_6103_cond : unsigned(0 downto 0);
signal header_src_mac_MUX_eth_8_h_l146_c9_6103_iftrue : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l146_c9_6103_iffalse : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l146_c9_6103_return_output : unsigned(47 downto 0);

-- header_ethertype_MUX[eth_8_h_l146_c9_6103]
signal header_ethertype_MUX_eth_8_h_l146_c9_6103_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l146_c9_6103_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l146_c9_6103_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l146_c9_6103_return_output : unsigned(15 downto 0);

-- state_MUX[eth_8_h_l146_c9_6103]
signal state_MUX_eth_8_h_l146_c9_6103_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l146_c9_6103_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l146_c9_6103_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l146_c9_6103_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l149_c5_bb32]
signal counter_MUX_eth_8_h_l149_c5_bb32_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l149_c5_bb32_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l149_c5_bb32_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l149_c5_bb32_return_output : unsigned(5 downto 0);

-- header_src_mac_MUX[eth_8_h_l149_c5_bb32]
signal header_src_mac_MUX_eth_8_h_l149_c5_bb32_cond : unsigned(0 downto 0);
signal header_src_mac_MUX_eth_8_h_l149_c5_bb32_iftrue : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l149_c5_bb32_iffalse : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l149_c5_bb32_return_output : unsigned(47 downto 0);

-- state_MUX[eth_8_h_l149_c5_bb32]
signal state_MUX_eth_8_h_l149_c5_bb32_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l149_c5_bb32_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l149_c5_bb32_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l149_c5_bb32_return_output : unsigned(2 downto 0);

-- CONST_SL_8[eth_8_h_l150_c24_73f9]
signal CONST_SL_8_eth_8_h_l150_c24_73f9_x : unsigned(47 downto 0);
signal CONST_SL_8_eth_8_h_l150_c24_73f9_return_output : unsigned(47 downto 0);

-- BIN_OP_EQ[eth_8_h_l151_c10_9b2c]
signal BIN_OP_EQ_eth_8_h_l151_c10_9b2c_left : unsigned(5 downto 0);
signal BIN_OP_EQ_eth_8_h_l151_c10_9b2c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l151_c10_9b2c_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l151_c7_ca0d]
signal counter_MUX_eth_8_h_l151_c7_ca0d_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l151_c7_ca0d_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l151_c7_ca0d_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l151_c7_ca0d_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l151_c7_ca0d]
signal state_MUX_eth_8_h_l151_c7_ca0d_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l151_c7_ca0d_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l151_c7_ca0d_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l151_c7_ca0d_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l155_c9_b025]
signal BIN_OP_PLUS_eth_8_h_l155_c9_b025_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_eth_8_h_l155_c9_b025_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l155_c9_b025_return_output : unsigned(6 downto 0);

-- BIN_OP_EQ[eth_8_h_l158_c12_f600]
signal BIN_OP_EQ_eth_8_h_l158_c12_f600_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l158_c12_f600_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l158_c12_f600_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l158_c9_d80e]
signal counter_MUX_eth_8_h_l158_c9_d80e_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l158_c9_d80e_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l158_c9_d80e_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l158_c9_d80e_return_output : unsigned(5 downto 0);

-- o_MUX[eth_8_h_l158_c9_d80e]
signal o_MUX_eth_8_h_l158_c9_d80e_cond : unsigned(0 downto 0);
signal o_MUX_eth_8_h_l158_c9_d80e_iftrue : eth_8_tx_t;
signal o_MUX_eth_8_h_l158_c9_d80e_iffalse : eth_8_tx_t;
signal o_MUX_eth_8_h_l158_c9_d80e_return_output : eth_8_tx_t;

-- header_ethertype_MUX[eth_8_h_l158_c9_d80e]
signal header_ethertype_MUX_eth_8_h_l158_c9_d80e_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l158_c9_d80e_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l158_c9_d80e_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l158_c9_d80e_return_output : unsigned(15 downto 0);

-- state_MUX[eth_8_h_l158_c9_d80e]
signal state_MUX_eth_8_h_l158_c9_d80e_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l158_c9_d80e_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l158_c9_d80e_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l158_c9_d80e_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l161_c5_c771]
signal counter_MUX_eth_8_h_l161_c5_c771_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l161_c5_c771_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l161_c5_c771_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l161_c5_c771_return_output : unsigned(5 downto 0);

-- header_ethertype_MUX[eth_8_h_l161_c5_c771]
signal header_ethertype_MUX_eth_8_h_l161_c5_c771_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l161_c5_c771_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l161_c5_c771_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l161_c5_c771_return_output : unsigned(15 downto 0);

-- state_MUX[eth_8_h_l161_c5_c771]
signal state_MUX_eth_8_h_l161_c5_c771_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l161_c5_c771_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l161_c5_c771_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l161_c5_c771_return_output : unsigned(2 downto 0);

-- CONST_SL_8[eth_8_h_l162_c26_e9e7]
signal CONST_SL_8_eth_8_h_l162_c26_e9e7_x : unsigned(15 downto 0);
signal CONST_SL_8_eth_8_h_l162_c26_e9e7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[eth_8_h_l163_c10_2f56]
signal BIN_OP_EQ_eth_8_h_l163_c10_2f56_left : unsigned(5 downto 0);
signal BIN_OP_EQ_eth_8_h_l163_c10_2f56_right : unsigned(0 downto 0);
signal BIN_OP_EQ_eth_8_h_l163_c10_2f56_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l163_c7_57d0]
signal counter_MUX_eth_8_h_l163_c7_57d0_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l163_c7_57d0_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l163_c7_57d0_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l163_c7_57d0_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l163_c7_57d0]
signal state_MUX_eth_8_h_l163_c7_57d0_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l163_c7_57d0_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l163_c7_57d0_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l163_c7_57d0_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l167_c9_e46d]
signal BIN_OP_PLUS_eth_8_h_l167_c9_e46d_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_eth_8_h_l167_c9_e46d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l167_c9_e46d_return_output : unsigned(6 downto 0);

-- BIN_OP_EQ[eth_8_h_l172_c11_607c]
signal BIN_OP_EQ_eth_8_h_l172_c11_607c_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l172_c11_607c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l172_c11_607c_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l172_c8_38d6]
signal counter_MUX_eth_8_h_l172_c8_38d6_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l172_c8_38d6_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l172_c8_38d6_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l172_c8_38d6_return_output : unsigned(5 downto 0);

-- o_MUX[eth_8_h_l172_c8_38d6]
signal o_MUX_eth_8_h_l172_c8_38d6_cond : unsigned(0 downto 0);
signal o_MUX_eth_8_h_l172_c8_38d6_iftrue : eth_8_tx_t;
signal o_MUX_eth_8_h_l172_c8_38d6_iffalse : eth_8_tx_t;
signal o_MUX_eth_8_h_l172_c8_38d6_return_output : eth_8_tx_t;

-- state_MUX[eth_8_h_l172_c8_38d6]
signal state_MUX_eth_8_h_l172_c8_38d6_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l172_c8_38d6_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l172_c8_38d6_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l172_c8_38d6_return_output : unsigned(2 downto 0);

-- MUX[eth_8_h_l176_c29_4f89]
signal MUX_eth_8_h_l176_c29_4f89_cond : unsigned(0 downto 0);
signal MUX_eth_8_h_l176_c29_4f89_iftrue : unsigned(0 downto 0);
signal MUX_eth_8_h_l176_c29_4f89_iffalse : unsigned(0 downto 0);
signal MUX_eth_8_h_l176_c29_4f89_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[eth_8_h_l179_c8_e95b]
signal BIN_OP_AND_eth_8_h_l179_c8_e95b_left : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l179_c8_e95b_right : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l179_c8_e95b_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l179_c5_a045]
signal counter_MUX_eth_8_h_l179_c5_a045_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l179_c5_a045_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l179_c5_a045_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l179_c5_a045_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l179_c5_a045]
signal state_MUX_eth_8_h_l179_c5_a045_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l179_c5_a045_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l179_c5_a045_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l179_c5_a045_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l180_c7_4857]
signal counter_MUX_eth_8_h_l180_c7_4857_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l180_c7_4857_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l180_c7_4857_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l180_c7_4857_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l180_c7_4857]
signal state_MUX_eth_8_h_l180_c7_4857_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l180_c7_4857_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l180_c7_4857_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l180_c7_4857_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l182_c9_d4cc]
signal counter_MUX_eth_8_h_l182_c9_d4cc_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l182_c9_d4cc_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l182_c9_d4cc_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l182_c9_d4cc_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l182_c9_d4cc]
signal state_MUX_eth_8_h_l182_c9_d4cc_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l182_c9_d4cc_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l182_c9_d4cc_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l182_c9_d4cc_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l189_c7_29e5]
signal counter_MUX_eth_8_h_l189_c7_29e5_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l189_c7_29e5_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l189_c7_29e5_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l189_c7_29e5_return_output : unsigned(5 downto 0);

-- BIN_OP_PLUS[eth_8_h_l190_c9_5f8a]
signal BIN_OP_PLUS_eth_8_h_l190_c9_5f8a_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_eth_8_h_l190_c9_5f8a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l190_c9_5f8a_return_output : unsigned(6 downto 0);

-- BIN_OP_EQ[eth_8_h_l195_c11_f17c]
signal BIN_OP_EQ_eth_8_h_l195_c11_f17c_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l195_c11_f17c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l195_c11_f17c_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l195_c8_3c8b]
signal counter_MUX_eth_8_h_l195_c8_3c8b_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l195_c8_3c8b_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l195_c8_3c8b_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l195_c8_3c8b_return_output : unsigned(5 downto 0);

-- o_mac_axis_data_tdata_MUX[eth_8_h_l195_c8_3c8b]
signal o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_cond : unsigned(0 downto 0);
signal o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_iftrue : uint8_t_1;
signal o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_iffalse : uint8_t_1;
signal o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_return_output : uint8_t_1;

-- o_mac_axis_valid_MUX[eth_8_h_l195_c8_3c8b]
signal o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_cond : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_iftrue : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_iffalse : unsigned(0 downto 0);
signal o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_return_output : unsigned(0 downto 0);

-- o_mac_axis_data_tlast_MUX[eth_8_h_l195_c8_3c8b]
signal o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_cond : unsigned(0 downto 0);
signal o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_iftrue : unsigned(0 downto 0);
signal o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_iffalse : unsigned(0 downto 0);
signal o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l195_c8_3c8b]
signal state_MUX_eth_8_h_l195_c8_3c8b_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l195_c8_3c8b_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l195_c8_3c8b_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l195_c8_3c8b_return_output : unsigned(2 downto 0);

-- UNARY_OP_NOT[eth_8_h_l197_c30_5894]
signal UNARY_OP_NOT_eth_8_h_l197_c30_5894_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_eth_8_h_l197_c30_5894_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[eth_8_h_l199_c8_08aa]
signal BIN_OP_AND_eth_8_h_l199_c8_08aa_left : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l199_c8_08aa_right : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l199_c8_08aa_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l199_c5_b162]
signal counter_MUX_eth_8_h_l199_c5_b162_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l199_c5_b162_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l199_c5_b162_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l199_c5_b162_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l199_c5_b162]
signal state_MUX_eth_8_h_l199_c5_b162_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l199_c5_b162_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l199_c5_b162_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l199_c5_b162_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l200_c7_5770]
signal BIN_OP_PLUS_eth_8_h_l200_c7_5770_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_eth_8_h_l200_c7_5770_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l200_c7_5770_return_output : unsigned(6 downto 0);

-- counter_MUX[eth_8_h_l201_c7_158f]
signal counter_MUX_eth_8_h_l201_c7_158f_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l201_c7_158f_iftrue : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l201_c7_158f_iffalse : unsigned(5 downto 0);
signal counter_MUX_eth_8_h_l201_c7_158f_return_output : unsigned(5 downto 0);

-- state_MUX[eth_8_h_l201_c7_158f]
signal state_MUX_eth_8_h_l201_c7_158f_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l201_c7_158f_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l201_c7_158f_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l201_c7_158f_return_output : unsigned(2 downto 0);

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

function CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_eef4( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : uint8_t_1) return eth_8_tx_t is
 
  variable base : eth_8_tx_t; 
  variable return_output : eth_8_tx_t;
begin
      base.mac_axis.data.tkeep(0) := ref_toks_0;
      base.frame_ready := ref_toks_1;
      base.mac_axis.data.tlast := ref_toks_2;
      base.mac_axis.valid := ref_toks_3;
      base.mac_axis.data.tdata := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_eth_header_t_eth_header_t_488d( ref_toks_0 : eth_header_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return eth_header_t is
 
  variable base : eth_header_t; 
  variable return_output : eth_header_t;
begin
      base := ref_toks_0;
      base.src_mac := ref_toks_1;
      base.ethertype := ref_toks_2;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_LT_eth_8_h_l124_c32_640c : 0 clocks latency
BIN_OP_LT_eth_8_h_l124_c32_640c : entity work.BIN_OP_LT_uint6_t_uint6_t_0CLK_380ecc95 port map (
BIN_OP_LT_eth_8_h_l124_c32_640c_left,
BIN_OP_LT_eth_8_h_l124_c32_640c_right,
BIN_OP_LT_eth_8_h_l124_c32_640c_return_output);

-- BIN_OP_EQ_eth_8_h_l128_c6_fe00 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l128_c6_fe00 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l128_c6_fe00_left,
BIN_OP_EQ_eth_8_h_l128_c6_fe00_right,
BIN_OP_EQ_eth_8_h_l128_c6_fe00_return_output);

-- counter_MUX_eth_8_h_l128_c3_f71d : 0 clocks latency
counter_MUX_eth_8_h_l128_c3_f71d : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l128_c3_f71d_cond,
counter_MUX_eth_8_h_l128_c3_f71d_iftrue,
counter_MUX_eth_8_h_l128_c3_f71d_iffalse,
counter_MUX_eth_8_h_l128_c3_f71d_return_output);

-- o_MUX_eth_8_h_l128_c3_f71d : 0 clocks latency
o_MUX_eth_8_h_l128_c3_f71d : entity work.MUX_uint1_t_eth_8_tx_t_eth_8_tx_t_0CLK_de264c78 port map (
o_MUX_eth_8_h_l128_c3_f71d_cond,
o_MUX_eth_8_h_l128_c3_f71d_iftrue,
o_MUX_eth_8_h_l128_c3_f71d_iffalse,
o_MUX_eth_8_h_l128_c3_f71d_return_output);

-- header_MUX_eth_8_h_l128_c3_f71d : 0 clocks latency
header_MUX_eth_8_h_l128_c3_f71d : entity work.MUX_uint1_t_eth_header_t_eth_header_t_0CLK_de264c78 port map (
header_MUX_eth_8_h_l128_c3_f71d_cond,
header_MUX_eth_8_h_l128_c3_f71d_iftrue,
header_MUX_eth_8_h_l128_c3_f71d_iffalse,
header_MUX_eth_8_h_l128_c3_f71d_return_output);

-- state_MUX_eth_8_h_l128_c3_f71d : 0 clocks latency
state_MUX_eth_8_h_l128_c3_f71d : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l128_c3_f71d_cond,
state_MUX_eth_8_h_l128_c3_f71d_iftrue,
state_MUX_eth_8_h_l128_c3_f71d_iffalse,
state_MUX_eth_8_h_l128_c3_f71d_return_output);

-- counter_MUX_eth_8_h_l130_c5_1846 : 0 clocks latency
counter_MUX_eth_8_h_l130_c5_1846 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l130_c5_1846_cond,
counter_MUX_eth_8_h_l130_c5_1846_iftrue,
counter_MUX_eth_8_h_l130_c5_1846_iffalse,
counter_MUX_eth_8_h_l130_c5_1846_return_output);

-- o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846 : 0 clocks latency
o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_cond,
o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_iftrue,
o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_iffalse,
o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_return_output);

-- o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846 : 0 clocks latency
o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846 : entity work.MUX_uint1_t_uint8_t_1_uint8_t_1_0CLK_de264c78 port map (
o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_cond,
o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_iftrue,
o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_iffalse,
o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_return_output);

-- header_MUX_eth_8_h_l130_c5_1846 : 0 clocks latency
header_MUX_eth_8_h_l130_c5_1846 : entity work.MUX_uint1_t_eth_header_t_eth_header_t_0CLK_de264c78 port map (
header_MUX_eth_8_h_l130_c5_1846_cond,
header_MUX_eth_8_h_l130_c5_1846_iftrue,
header_MUX_eth_8_h_l130_c5_1846_iffalse,
header_MUX_eth_8_h_l130_c5_1846_return_output);

-- state_MUX_eth_8_h_l130_c5_1846 : 0 clocks latency
state_MUX_eth_8_h_l130_c5_1846 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l130_c5_1846_cond,
state_MUX_eth_8_h_l130_c5_1846_iftrue,
state_MUX_eth_8_h_l130_c5_1846_iffalse,
state_MUX_eth_8_h_l130_c5_1846_return_output);

-- BIN_OP_EQ_eth_8_h_l131_c10_02fa : 0 clocks latency
BIN_OP_EQ_eth_8_h_l131_c10_02fa : entity work.BIN_OP_EQ_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l131_c10_02fa_left,
BIN_OP_EQ_eth_8_h_l131_c10_02fa_right,
BIN_OP_EQ_eth_8_h_l131_c10_02fa_return_output);

-- header_MUX_eth_8_h_l131_c7_735e : 0 clocks latency
header_MUX_eth_8_h_l131_c7_735e : entity work.MUX_uint1_t_eth_header_t_eth_header_t_0CLK_de264c78 port map (
header_MUX_eth_8_h_l131_c7_735e_cond,
header_MUX_eth_8_h_l131_c7_735e_iftrue,
header_MUX_eth_8_h_l131_c7_735e_iffalse,
header_MUX_eth_8_h_l131_c7_735e_return_output);

-- counter_MUX_eth_8_h_l136_c7_5084 : 0 clocks latency
counter_MUX_eth_8_h_l136_c7_5084 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l136_c7_5084_cond,
counter_MUX_eth_8_h_l136_c7_5084_iftrue,
counter_MUX_eth_8_h_l136_c7_5084_iffalse,
counter_MUX_eth_8_h_l136_c7_5084_return_output);

-- header_dst_mac_MUX_eth_8_h_l136_c7_5084 : 0 clocks latency
header_dst_mac_MUX_eth_8_h_l136_c7_5084 : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_dst_mac_MUX_eth_8_h_l136_c7_5084_cond,
header_dst_mac_MUX_eth_8_h_l136_c7_5084_iftrue,
header_dst_mac_MUX_eth_8_h_l136_c7_5084_iffalse,
header_dst_mac_MUX_eth_8_h_l136_c7_5084_return_output);

-- state_MUX_eth_8_h_l136_c7_5084 : 0 clocks latency
state_MUX_eth_8_h_l136_c7_5084 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l136_c7_5084_cond,
state_MUX_eth_8_h_l136_c7_5084_iftrue,
state_MUX_eth_8_h_l136_c7_5084_iffalse,
state_MUX_eth_8_h_l136_c7_5084_return_output);

-- CONST_SL_8_eth_8_h_l137_c26_de6d : 0 clocks latency
CONST_SL_8_eth_8_h_l137_c26_de6d : entity work.CONST_SL_8_uint48_t_0CLK_de264c78 port map (
CONST_SL_8_eth_8_h_l137_c26_de6d_x,
CONST_SL_8_eth_8_h_l137_c26_de6d_return_output);

-- BIN_OP_EQ_eth_8_h_l138_c12_d9e7 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l138_c12_d9e7 : entity work.BIN_OP_EQ_uint6_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l138_c12_d9e7_left,
BIN_OP_EQ_eth_8_h_l138_c12_d9e7_right,
BIN_OP_EQ_eth_8_h_l138_c12_d9e7_return_output);

-- counter_MUX_eth_8_h_l138_c9_3fa7 : 0 clocks latency
counter_MUX_eth_8_h_l138_c9_3fa7 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l138_c9_3fa7_cond,
counter_MUX_eth_8_h_l138_c9_3fa7_iftrue,
counter_MUX_eth_8_h_l138_c9_3fa7_iffalse,
counter_MUX_eth_8_h_l138_c9_3fa7_return_output);

-- state_MUX_eth_8_h_l138_c9_3fa7 : 0 clocks latency
state_MUX_eth_8_h_l138_c9_3fa7 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l138_c9_3fa7_cond,
state_MUX_eth_8_h_l138_c9_3fa7_iftrue,
state_MUX_eth_8_h_l138_c9_3fa7_iffalse,
state_MUX_eth_8_h_l138_c9_3fa7_return_output);

-- BIN_OP_PLUS_eth_8_h_l142_c11_aae5 : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l142_c11_aae5 : entity work.BIN_OP_PLUS_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l142_c11_aae5_left,
BIN_OP_PLUS_eth_8_h_l142_c11_aae5_right,
BIN_OP_PLUS_eth_8_h_l142_c11_aae5_return_output);

-- BIN_OP_EQ_eth_8_h_l146_c12_e34d : 0 clocks latency
BIN_OP_EQ_eth_8_h_l146_c12_e34d : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l146_c12_e34d_left,
BIN_OP_EQ_eth_8_h_l146_c12_e34d_right,
BIN_OP_EQ_eth_8_h_l146_c12_e34d_return_output);

-- counter_MUX_eth_8_h_l146_c9_6103 : 0 clocks latency
counter_MUX_eth_8_h_l146_c9_6103 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l146_c9_6103_cond,
counter_MUX_eth_8_h_l146_c9_6103_iftrue,
counter_MUX_eth_8_h_l146_c9_6103_iffalse,
counter_MUX_eth_8_h_l146_c9_6103_return_output);

-- o_MUX_eth_8_h_l146_c9_6103 : 0 clocks latency
o_MUX_eth_8_h_l146_c9_6103 : entity work.MUX_uint1_t_eth_8_tx_t_eth_8_tx_t_0CLK_de264c78 port map (
o_MUX_eth_8_h_l146_c9_6103_cond,
o_MUX_eth_8_h_l146_c9_6103_iftrue,
o_MUX_eth_8_h_l146_c9_6103_iffalse,
o_MUX_eth_8_h_l146_c9_6103_return_output);

-- header_src_mac_MUX_eth_8_h_l146_c9_6103 : 0 clocks latency
header_src_mac_MUX_eth_8_h_l146_c9_6103 : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_src_mac_MUX_eth_8_h_l146_c9_6103_cond,
header_src_mac_MUX_eth_8_h_l146_c9_6103_iftrue,
header_src_mac_MUX_eth_8_h_l146_c9_6103_iffalse,
header_src_mac_MUX_eth_8_h_l146_c9_6103_return_output);

-- header_ethertype_MUX_eth_8_h_l146_c9_6103 : 0 clocks latency
header_ethertype_MUX_eth_8_h_l146_c9_6103 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l146_c9_6103_cond,
header_ethertype_MUX_eth_8_h_l146_c9_6103_iftrue,
header_ethertype_MUX_eth_8_h_l146_c9_6103_iffalse,
header_ethertype_MUX_eth_8_h_l146_c9_6103_return_output);

-- state_MUX_eth_8_h_l146_c9_6103 : 0 clocks latency
state_MUX_eth_8_h_l146_c9_6103 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l146_c9_6103_cond,
state_MUX_eth_8_h_l146_c9_6103_iftrue,
state_MUX_eth_8_h_l146_c9_6103_iffalse,
state_MUX_eth_8_h_l146_c9_6103_return_output);

-- counter_MUX_eth_8_h_l149_c5_bb32 : 0 clocks latency
counter_MUX_eth_8_h_l149_c5_bb32 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l149_c5_bb32_cond,
counter_MUX_eth_8_h_l149_c5_bb32_iftrue,
counter_MUX_eth_8_h_l149_c5_bb32_iffalse,
counter_MUX_eth_8_h_l149_c5_bb32_return_output);

-- header_src_mac_MUX_eth_8_h_l149_c5_bb32 : 0 clocks latency
header_src_mac_MUX_eth_8_h_l149_c5_bb32 : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_src_mac_MUX_eth_8_h_l149_c5_bb32_cond,
header_src_mac_MUX_eth_8_h_l149_c5_bb32_iftrue,
header_src_mac_MUX_eth_8_h_l149_c5_bb32_iffalse,
header_src_mac_MUX_eth_8_h_l149_c5_bb32_return_output);

-- state_MUX_eth_8_h_l149_c5_bb32 : 0 clocks latency
state_MUX_eth_8_h_l149_c5_bb32 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l149_c5_bb32_cond,
state_MUX_eth_8_h_l149_c5_bb32_iftrue,
state_MUX_eth_8_h_l149_c5_bb32_iffalse,
state_MUX_eth_8_h_l149_c5_bb32_return_output);

-- CONST_SL_8_eth_8_h_l150_c24_73f9 : 0 clocks latency
CONST_SL_8_eth_8_h_l150_c24_73f9 : entity work.CONST_SL_8_uint48_t_0CLK_de264c78 port map (
CONST_SL_8_eth_8_h_l150_c24_73f9_x,
CONST_SL_8_eth_8_h_l150_c24_73f9_return_output);

-- BIN_OP_EQ_eth_8_h_l151_c10_9b2c : 0 clocks latency
BIN_OP_EQ_eth_8_h_l151_c10_9b2c : entity work.BIN_OP_EQ_uint6_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l151_c10_9b2c_left,
BIN_OP_EQ_eth_8_h_l151_c10_9b2c_right,
BIN_OP_EQ_eth_8_h_l151_c10_9b2c_return_output);

-- counter_MUX_eth_8_h_l151_c7_ca0d : 0 clocks latency
counter_MUX_eth_8_h_l151_c7_ca0d : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l151_c7_ca0d_cond,
counter_MUX_eth_8_h_l151_c7_ca0d_iftrue,
counter_MUX_eth_8_h_l151_c7_ca0d_iffalse,
counter_MUX_eth_8_h_l151_c7_ca0d_return_output);

-- state_MUX_eth_8_h_l151_c7_ca0d : 0 clocks latency
state_MUX_eth_8_h_l151_c7_ca0d : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l151_c7_ca0d_cond,
state_MUX_eth_8_h_l151_c7_ca0d_iftrue,
state_MUX_eth_8_h_l151_c7_ca0d_iffalse,
state_MUX_eth_8_h_l151_c7_ca0d_return_output);

-- BIN_OP_PLUS_eth_8_h_l155_c9_b025 : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l155_c9_b025 : entity work.BIN_OP_PLUS_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l155_c9_b025_left,
BIN_OP_PLUS_eth_8_h_l155_c9_b025_right,
BIN_OP_PLUS_eth_8_h_l155_c9_b025_return_output);

-- BIN_OP_EQ_eth_8_h_l158_c12_f600 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l158_c12_f600 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l158_c12_f600_left,
BIN_OP_EQ_eth_8_h_l158_c12_f600_right,
BIN_OP_EQ_eth_8_h_l158_c12_f600_return_output);

-- counter_MUX_eth_8_h_l158_c9_d80e : 0 clocks latency
counter_MUX_eth_8_h_l158_c9_d80e : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l158_c9_d80e_cond,
counter_MUX_eth_8_h_l158_c9_d80e_iftrue,
counter_MUX_eth_8_h_l158_c9_d80e_iffalse,
counter_MUX_eth_8_h_l158_c9_d80e_return_output);

-- o_MUX_eth_8_h_l158_c9_d80e : 0 clocks latency
o_MUX_eth_8_h_l158_c9_d80e : entity work.MUX_uint1_t_eth_8_tx_t_eth_8_tx_t_0CLK_de264c78 port map (
o_MUX_eth_8_h_l158_c9_d80e_cond,
o_MUX_eth_8_h_l158_c9_d80e_iftrue,
o_MUX_eth_8_h_l158_c9_d80e_iffalse,
o_MUX_eth_8_h_l158_c9_d80e_return_output);

-- header_ethertype_MUX_eth_8_h_l158_c9_d80e : 0 clocks latency
header_ethertype_MUX_eth_8_h_l158_c9_d80e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l158_c9_d80e_cond,
header_ethertype_MUX_eth_8_h_l158_c9_d80e_iftrue,
header_ethertype_MUX_eth_8_h_l158_c9_d80e_iffalse,
header_ethertype_MUX_eth_8_h_l158_c9_d80e_return_output);

-- state_MUX_eth_8_h_l158_c9_d80e : 0 clocks latency
state_MUX_eth_8_h_l158_c9_d80e : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l158_c9_d80e_cond,
state_MUX_eth_8_h_l158_c9_d80e_iftrue,
state_MUX_eth_8_h_l158_c9_d80e_iffalse,
state_MUX_eth_8_h_l158_c9_d80e_return_output);

-- counter_MUX_eth_8_h_l161_c5_c771 : 0 clocks latency
counter_MUX_eth_8_h_l161_c5_c771 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l161_c5_c771_cond,
counter_MUX_eth_8_h_l161_c5_c771_iftrue,
counter_MUX_eth_8_h_l161_c5_c771_iffalse,
counter_MUX_eth_8_h_l161_c5_c771_return_output);

-- header_ethertype_MUX_eth_8_h_l161_c5_c771 : 0 clocks latency
header_ethertype_MUX_eth_8_h_l161_c5_c771 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l161_c5_c771_cond,
header_ethertype_MUX_eth_8_h_l161_c5_c771_iftrue,
header_ethertype_MUX_eth_8_h_l161_c5_c771_iffalse,
header_ethertype_MUX_eth_8_h_l161_c5_c771_return_output);

-- state_MUX_eth_8_h_l161_c5_c771 : 0 clocks latency
state_MUX_eth_8_h_l161_c5_c771 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l161_c5_c771_cond,
state_MUX_eth_8_h_l161_c5_c771_iftrue,
state_MUX_eth_8_h_l161_c5_c771_iffalse,
state_MUX_eth_8_h_l161_c5_c771_return_output);

-- CONST_SL_8_eth_8_h_l162_c26_e9e7 : 0 clocks latency
CONST_SL_8_eth_8_h_l162_c26_e9e7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_eth_8_h_l162_c26_e9e7_x,
CONST_SL_8_eth_8_h_l162_c26_e9e7_return_output);

-- BIN_OP_EQ_eth_8_h_l163_c10_2f56 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l163_c10_2f56 : entity work.BIN_OP_EQ_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l163_c10_2f56_left,
BIN_OP_EQ_eth_8_h_l163_c10_2f56_right,
BIN_OP_EQ_eth_8_h_l163_c10_2f56_return_output);

-- counter_MUX_eth_8_h_l163_c7_57d0 : 0 clocks latency
counter_MUX_eth_8_h_l163_c7_57d0 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l163_c7_57d0_cond,
counter_MUX_eth_8_h_l163_c7_57d0_iftrue,
counter_MUX_eth_8_h_l163_c7_57d0_iffalse,
counter_MUX_eth_8_h_l163_c7_57d0_return_output);

-- state_MUX_eth_8_h_l163_c7_57d0 : 0 clocks latency
state_MUX_eth_8_h_l163_c7_57d0 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l163_c7_57d0_cond,
state_MUX_eth_8_h_l163_c7_57d0_iftrue,
state_MUX_eth_8_h_l163_c7_57d0_iffalse,
state_MUX_eth_8_h_l163_c7_57d0_return_output);

-- BIN_OP_PLUS_eth_8_h_l167_c9_e46d : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l167_c9_e46d : entity work.BIN_OP_PLUS_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l167_c9_e46d_left,
BIN_OP_PLUS_eth_8_h_l167_c9_e46d_right,
BIN_OP_PLUS_eth_8_h_l167_c9_e46d_return_output);

-- BIN_OP_EQ_eth_8_h_l172_c11_607c : 0 clocks latency
BIN_OP_EQ_eth_8_h_l172_c11_607c : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l172_c11_607c_left,
BIN_OP_EQ_eth_8_h_l172_c11_607c_right,
BIN_OP_EQ_eth_8_h_l172_c11_607c_return_output);

-- counter_MUX_eth_8_h_l172_c8_38d6 : 0 clocks latency
counter_MUX_eth_8_h_l172_c8_38d6 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l172_c8_38d6_cond,
counter_MUX_eth_8_h_l172_c8_38d6_iftrue,
counter_MUX_eth_8_h_l172_c8_38d6_iffalse,
counter_MUX_eth_8_h_l172_c8_38d6_return_output);

-- o_MUX_eth_8_h_l172_c8_38d6 : 0 clocks latency
o_MUX_eth_8_h_l172_c8_38d6 : entity work.MUX_uint1_t_eth_8_tx_t_eth_8_tx_t_0CLK_de264c78 port map (
o_MUX_eth_8_h_l172_c8_38d6_cond,
o_MUX_eth_8_h_l172_c8_38d6_iftrue,
o_MUX_eth_8_h_l172_c8_38d6_iffalse,
o_MUX_eth_8_h_l172_c8_38d6_return_output);

-- state_MUX_eth_8_h_l172_c8_38d6 : 0 clocks latency
state_MUX_eth_8_h_l172_c8_38d6 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l172_c8_38d6_cond,
state_MUX_eth_8_h_l172_c8_38d6_iftrue,
state_MUX_eth_8_h_l172_c8_38d6_iffalse,
state_MUX_eth_8_h_l172_c8_38d6_return_output);

-- MUX_eth_8_h_l176_c29_4f89 : 0 clocks latency
MUX_eth_8_h_l176_c29_4f89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_eth_8_h_l176_c29_4f89_cond,
MUX_eth_8_h_l176_c29_4f89_iftrue,
MUX_eth_8_h_l176_c29_4f89_iffalse,
MUX_eth_8_h_l176_c29_4f89_return_output);

-- BIN_OP_AND_eth_8_h_l179_c8_e95b : 0 clocks latency
BIN_OP_AND_eth_8_h_l179_c8_e95b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_eth_8_h_l179_c8_e95b_left,
BIN_OP_AND_eth_8_h_l179_c8_e95b_right,
BIN_OP_AND_eth_8_h_l179_c8_e95b_return_output);

-- counter_MUX_eth_8_h_l179_c5_a045 : 0 clocks latency
counter_MUX_eth_8_h_l179_c5_a045 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l179_c5_a045_cond,
counter_MUX_eth_8_h_l179_c5_a045_iftrue,
counter_MUX_eth_8_h_l179_c5_a045_iffalse,
counter_MUX_eth_8_h_l179_c5_a045_return_output);

-- state_MUX_eth_8_h_l179_c5_a045 : 0 clocks latency
state_MUX_eth_8_h_l179_c5_a045 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l179_c5_a045_cond,
state_MUX_eth_8_h_l179_c5_a045_iftrue,
state_MUX_eth_8_h_l179_c5_a045_iffalse,
state_MUX_eth_8_h_l179_c5_a045_return_output);

-- counter_MUX_eth_8_h_l180_c7_4857 : 0 clocks latency
counter_MUX_eth_8_h_l180_c7_4857 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l180_c7_4857_cond,
counter_MUX_eth_8_h_l180_c7_4857_iftrue,
counter_MUX_eth_8_h_l180_c7_4857_iffalse,
counter_MUX_eth_8_h_l180_c7_4857_return_output);

-- state_MUX_eth_8_h_l180_c7_4857 : 0 clocks latency
state_MUX_eth_8_h_l180_c7_4857 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l180_c7_4857_cond,
state_MUX_eth_8_h_l180_c7_4857_iftrue,
state_MUX_eth_8_h_l180_c7_4857_iffalse,
state_MUX_eth_8_h_l180_c7_4857_return_output);

-- counter_MUX_eth_8_h_l182_c9_d4cc : 0 clocks latency
counter_MUX_eth_8_h_l182_c9_d4cc : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l182_c9_d4cc_cond,
counter_MUX_eth_8_h_l182_c9_d4cc_iftrue,
counter_MUX_eth_8_h_l182_c9_d4cc_iffalse,
counter_MUX_eth_8_h_l182_c9_d4cc_return_output);

-- state_MUX_eth_8_h_l182_c9_d4cc : 0 clocks latency
state_MUX_eth_8_h_l182_c9_d4cc : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l182_c9_d4cc_cond,
state_MUX_eth_8_h_l182_c9_d4cc_iftrue,
state_MUX_eth_8_h_l182_c9_d4cc_iffalse,
state_MUX_eth_8_h_l182_c9_d4cc_return_output);

-- counter_MUX_eth_8_h_l189_c7_29e5 : 0 clocks latency
counter_MUX_eth_8_h_l189_c7_29e5 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l189_c7_29e5_cond,
counter_MUX_eth_8_h_l189_c7_29e5_iftrue,
counter_MUX_eth_8_h_l189_c7_29e5_iffalse,
counter_MUX_eth_8_h_l189_c7_29e5_return_output);

-- BIN_OP_PLUS_eth_8_h_l190_c9_5f8a : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l190_c9_5f8a : entity work.BIN_OP_PLUS_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l190_c9_5f8a_left,
BIN_OP_PLUS_eth_8_h_l190_c9_5f8a_right,
BIN_OP_PLUS_eth_8_h_l190_c9_5f8a_return_output);

-- BIN_OP_EQ_eth_8_h_l195_c11_f17c : 0 clocks latency
BIN_OP_EQ_eth_8_h_l195_c11_f17c : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l195_c11_f17c_left,
BIN_OP_EQ_eth_8_h_l195_c11_f17c_right,
BIN_OP_EQ_eth_8_h_l195_c11_f17c_return_output);

-- counter_MUX_eth_8_h_l195_c8_3c8b : 0 clocks latency
counter_MUX_eth_8_h_l195_c8_3c8b : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l195_c8_3c8b_cond,
counter_MUX_eth_8_h_l195_c8_3c8b_iftrue,
counter_MUX_eth_8_h_l195_c8_3c8b_iffalse,
counter_MUX_eth_8_h_l195_c8_3c8b_return_output);

-- o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b : 0 clocks latency
o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b : entity work.MUX_uint1_t_uint8_t_1_uint8_t_1_0CLK_de264c78 port map (
o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_cond,
o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_iftrue,
o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_iffalse,
o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_return_output);

-- o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b : 0 clocks latency
o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_cond,
o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_iftrue,
o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_iffalse,
o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_return_output);

-- o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b : 0 clocks latency
o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_cond,
o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_iftrue,
o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_iffalse,
o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_return_output);

-- state_MUX_eth_8_h_l195_c8_3c8b : 0 clocks latency
state_MUX_eth_8_h_l195_c8_3c8b : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l195_c8_3c8b_cond,
state_MUX_eth_8_h_l195_c8_3c8b_iftrue,
state_MUX_eth_8_h_l195_c8_3c8b_iffalse,
state_MUX_eth_8_h_l195_c8_3c8b_return_output);

-- UNARY_OP_NOT_eth_8_h_l197_c30_5894 : 0 clocks latency
UNARY_OP_NOT_eth_8_h_l197_c30_5894 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_eth_8_h_l197_c30_5894_expr,
UNARY_OP_NOT_eth_8_h_l197_c30_5894_return_output);

-- BIN_OP_AND_eth_8_h_l199_c8_08aa : 0 clocks latency
BIN_OP_AND_eth_8_h_l199_c8_08aa : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_eth_8_h_l199_c8_08aa_left,
BIN_OP_AND_eth_8_h_l199_c8_08aa_right,
BIN_OP_AND_eth_8_h_l199_c8_08aa_return_output);

-- counter_MUX_eth_8_h_l199_c5_b162 : 0 clocks latency
counter_MUX_eth_8_h_l199_c5_b162 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l199_c5_b162_cond,
counter_MUX_eth_8_h_l199_c5_b162_iftrue,
counter_MUX_eth_8_h_l199_c5_b162_iffalse,
counter_MUX_eth_8_h_l199_c5_b162_return_output);

-- state_MUX_eth_8_h_l199_c5_b162 : 0 clocks latency
state_MUX_eth_8_h_l199_c5_b162 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l199_c5_b162_cond,
state_MUX_eth_8_h_l199_c5_b162_iftrue,
state_MUX_eth_8_h_l199_c5_b162_iffalse,
state_MUX_eth_8_h_l199_c5_b162_return_output);

-- BIN_OP_PLUS_eth_8_h_l200_c7_5770 : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l200_c7_5770 : entity work.BIN_OP_PLUS_uint6_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l200_c7_5770_left,
BIN_OP_PLUS_eth_8_h_l200_c7_5770_right,
BIN_OP_PLUS_eth_8_h_l200_c7_5770_return_output);

-- counter_MUX_eth_8_h_l201_c7_158f : 0 clocks latency
counter_MUX_eth_8_h_l201_c7_158f : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l201_c7_158f_cond,
counter_MUX_eth_8_h_l201_c7_158f_iftrue,
counter_MUX_eth_8_h_l201_c7_158f_iffalse,
counter_MUX_eth_8_h_l201_c7_158f_return_output);

-- state_MUX_eth_8_h_l201_c7_158f : 0 clocks latency
state_MUX_eth_8_h_l201_c7_158f : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l201_c7_158f_cond,
state_MUX_eth_8_h_l201_c7_158f_iftrue,
state_MUX_eth_8_h_l201_c7_158f_iffalse,
state_MUX_eth_8_h_l201_c7_158f_return_output);



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
 BIN_OP_LT_eth_8_h_l124_c32_640c_return_output,
 BIN_OP_EQ_eth_8_h_l128_c6_fe00_return_output,
 counter_MUX_eth_8_h_l128_c3_f71d_return_output,
 o_MUX_eth_8_h_l128_c3_f71d_return_output,
 header_MUX_eth_8_h_l128_c3_f71d_return_output,
 state_MUX_eth_8_h_l128_c3_f71d_return_output,
 counter_MUX_eth_8_h_l130_c5_1846_return_output,
 o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_return_output,
 o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_return_output,
 header_MUX_eth_8_h_l130_c5_1846_return_output,
 state_MUX_eth_8_h_l130_c5_1846_return_output,
 BIN_OP_EQ_eth_8_h_l131_c10_02fa_return_output,
 header_MUX_eth_8_h_l131_c7_735e_return_output,
 counter_MUX_eth_8_h_l136_c7_5084_return_output,
 header_dst_mac_MUX_eth_8_h_l136_c7_5084_return_output,
 state_MUX_eth_8_h_l136_c7_5084_return_output,
 CONST_SL_8_eth_8_h_l137_c26_de6d_return_output,
 BIN_OP_EQ_eth_8_h_l138_c12_d9e7_return_output,
 counter_MUX_eth_8_h_l138_c9_3fa7_return_output,
 state_MUX_eth_8_h_l138_c9_3fa7_return_output,
 BIN_OP_PLUS_eth_8_h_l142_c11_aae5_return_output,
 BIN_OP_EQ_eth_8_h_l146_c12_e34d_return_output,
 counter_MUX_eth_8_h_l146_c9_6103_return_output,
 o_MUX_eth_8_h_l146_c9_6103_return_output,
 header_src_mac_MUX_eth_8_h_l146_c9_6103_return_output,
 header_ethertype_MUX_eth_8_h_l146_c9_6103_return_output,
 state_MUX_eth_8_h_l146_c9_6103_return_output,
 counter_MUX_eth_8_h_l149_c5_bb32_return_output,
 header_src_mac_MUX_eth_8_h_l149_c5_bb32_return_output,
 state_MUX_eth_8_h_l149_c5_bb32_return_output,
 CONST_SL_8_eth_8_h_l150_c24_73f9_return_output,
 BIN_OP_EQ_eth_8_h_l151_c10_9b2c_return_output,
 counter_MUX_eth_8_h_l151_c7_ca0d_return_output,
 state_MUX_eth_8_h_l151_c7_ca0d_return_output,
 BIN_OP_PLUS_eth_8_h_l155_c9_b025_return_output,
 BIN_OP_EQ_eth_8_h_l158_c12_f600_return_output,
 counter_MUX_eth_8_h_l158_c9_d80e_return_output,
 o_MUX_eth_8_h_l158_c9_d80e_return_output,
 header_ethertype_MUX_eth_8_h_l158_c9_d80e_return_output,
 state_MUX_eth_8_h_l158_c9_d80e_return_output,
 counter_MUX_eth_8_h_l161_c5_c771_return_output,
 header_ethertype_MUX_eth_8_h_l161_c5_c771_return_output,
 state_MUX_eth_8_h_l161_c5_c771_return_output,
 CONST_SL_8_eth_8_h_l162_c26_e9e7_return_output,
 BIN_OP_EQ_eth_8_h_l163_c10_2f56_return_output,
 counter_MUX_eth_8_h_l163_c7_57d0_return_output,
 state_MUX_eth_8_h_l163_c7_57d0_return_output,
 BIN_OP_PLUS_eth_8_h_l167_c9_e46d_return_output,
 BIN_OP_EQ_eth_8_h_l172_c11_607c_return_output,
 counter_MUX_eth_8_h_l172_c8_38d6_return_output,
 o_MUX_eth_8_h_l172_c8_38d6_return_output,
 state_MUX_eth_8_h_l172_c8_38d6_return_output,
 MUX_eth_8_h_l176_c29_4f89_return_output,
 BIN_OP_AND_eth_8_h_l179_c8_e95b_return_output,
 counter_MUX_eth_8_h_l179_c5_a045_return_output,
 state_MUX_eth_8_h_l179_c5_a045_return_output,
 counter_MUX_eth_8_h_l180_c7_4857_return_output,
 state_MUX_eth_8_h_l180_c7_4857_return_output,
 counter_MUX_eth_8_h_l182_c9_d4cc_return_output,
 state_MUX_eth_8_h_l182_c9_d4cc_return_output,
 counter_MUX_eth_8_h_l189_c7_29e5_return_output,
 BIN_OP_PLUS_eth_8_h_l190_c9_5f8a_return_output,
 BIN_OP_EQ_eth_8_h_l195_c11_f17c_return_output,
 counter_MUX_eth_8_h_l195_c8_3c8b_return_output,
 o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_return_output,
 o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_return_output,
 o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_return_output,
 state_MUX_eth_8_h_l195_c8_3c8b_return_output,
 UNARY_OP_NOT_eth_8_h_l197_c30_5894_return_output,
 BIN_OP_AND_eth_8_h_l199_c8_08aa_return_output,
 counter_MUX_eth_8_h_l199_c5_b162_return_output,
 state_MUX_eth_8_h_l199_c5_b162_return_output,
 BIN_OP_PLUS_eth_8_h_l200_c7_5770_return_output,
 counter_MUX_eth_8_h_l201_c7_158f_return_output,
 state_MUX_eth_8_h_l201_c7_158f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eth_8_tx_t;
 variable VAR_frame : eth8_frame_t_stream_t;
 variable VAR_mac_axis_ready : unsigned(0 downto 0);
 variable VAR_o : eth_8_tx_t;
 variable VAR_undersized_payload : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_eth_8_h_l124_c32_640c_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_LT_eth_8_h_l124_c32_640c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_LT_eth_8_h_l124_c32_640c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l128_c6_fe00_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l128_c6_fe00_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l128_c6_fe00_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l128_c3_f71d_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l130_c5_1846_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l128_c3_f71d_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l146_c9_6103_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l128_c3_f71d_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l128_c3_f71d_cond : unsigned(0 downto 0);
 variable VAR_o_MUX_eth_8_h_l128_c3_f71d_iftrue : eth_8_tx_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856_eth_8_h_l128_c3_f71d_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l128_c3_f71d_iffalse : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l146_c9_6103_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l128_c3_f71d_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l128_c3_f71d_cond : unsigned(0 downto 0);
 variable VAR_header_MUX_eth_8_h_l128_c3_f71d_iftrue : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l130_c5_1846_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l128_c3_f71d_iffalse : eth_header_t;
 variable VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_488d_eth_8_h_l128_c3_f71d_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l128_c3_f71d_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l128_c3_f71d_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l128_c3_f71d_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l130_c5_1846_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l128_c3_f71d_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l146_c9_6103_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l128_c3_f71d_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l128_c3_f71d_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l130_c5_1846_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l136_c7_5084_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l130_c5_1846_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l130_c5_1846_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_iftrue : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_iffalse : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_return_output : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_iftrue : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l130_c5_1846_return_output : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_iffalse : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_return_output : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_cond : unsigned(0 downto 0);
 variable VAR_header_MUX_eth_8_h_l130_c5_1846_iftrue : eth_header_t;
 variable VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l130_c5_1846_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l130_c5_1846_iffalse : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l130_c5_1846_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l130_c5_1846_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l136_c7_5084_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l130_c5_1846_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l130_c5_1846_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l131_c10_02fa_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l131_c10_02fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l131_c10_02fa_return_output : unsigned(0 downto 0);
 variable VAR_header_MUX_eth_8_h_l131_c7_735e_iftrue : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l131_c7_735e_iffalse : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l131_c7_735e_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l131_c7_735e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d_eth_8_h_l132_c18_6572_return_output : eth_header_t;
 variable VAR_uint48_47_40_eth_8_h_l135_c34_2236_return_output : unsigned(7 downto 0);
 variable VAR_counter_MUX_eth_8_h_l136_c7_5084_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l138_c9_3fa7_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l136_c7_5084_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l136_c7_5084_cond : unsigned(0 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l136_c7_5084_iftrue : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l136_c7_5084_iffalse : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l136_c7_5084_return_output : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l136_c7_5084_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l136_c7_5084_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l138_c9_3fa7_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l136_c7_5084_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l136_c7_5084_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l137_c26_de6d_return_output : unsigned(47 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l137_c26_de6d_x : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l138_c12_d9e7_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l138_c12_d9e7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l138_c12_d9e7_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l138_c9_3fa7_iftrue : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l140_c11_b0ad : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l138_c9_3fa7_iffalse : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l142_c11_f1bb : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l138_c9_3fa7_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l138_c9_3fa7_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l138_c9_3fa7_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l138_c9_3fa7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l142_c11_aae5_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l142_c11_aae5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l142_c11_aae5_return_output : unsigned(6 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l146_c12_e34d_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l146_c12_e34d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l146_c12_e34d_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l146_c9_6103_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l149_c5_bb32_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l146_c9_6103_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l158_c9_d80e_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l146_c9_6103_cond : unsigned(0 downto 0);
 variable VAR_o_MUX_eth_8_h_l146_c9_6103_iftrue : eth_8_tx_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l146_c9_6103_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l146_c9_6103_iffalse : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l158_c9_d80e_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l146_c9_6103_cond : unsigned(0 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l146_c9_6103_iftrue : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l149_c5_bb32_return_output : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l146_c9_6103_iffalse : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l146_c9_6103_return_output : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l146_c9_6103_cond : unsigned(0 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l146_c9_6103_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l146_c9_6103_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l158_c9_d80e_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l146_c9_6103_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l146_c9_6103_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l146_c9_6103_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l149_c5_bb32_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l146_c9_6103_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l158_c9_d80e_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l146_c9_6103_cond : unsigned(0 downto 0);
 variable VAR_uint48_47_40_eth_8_h_l148_c32_f648_return_output : unsigned(7 downto 0);
 variable VAR_counter_MUX_eth_8_h_l149_c5_bb32_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l151_c7_ca0d_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l149_c5_bb32_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l149_c5_bb32_cond : unsigned(0 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l149_c5_bb32_iftrue : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l149_c5_bb32_iffalse : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l149_c5_bb32_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l149_c5_bb32_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l151_c7_ca0d_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l149_c5_bb32_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l149_c5_bb32_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l150_c24_73f9_return_output : unsigned(47 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l150_c24_73f9_x : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l151_c10_9b2c_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l151_c10_9b2c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l151_c10_9b2c_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l151_c7_ca0d_iftrue : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l153_c9_d5cc : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l151_c7_ca0d_iffalse : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l155_c9_d734 : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l151_c7_ca0d_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l151_c7_ca0d_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l151_c7_ca0d_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l151_c7_ca0d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l155_c9_b025_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l155_c9_b025_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l155_c9_b025_return_output : unsigned(6 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l158_c12_f600_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l158_c12_f600_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l158_c12_f600_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l158_c9_d80e_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l161_c5_c771_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l158_c9_d80e_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l172_c8_38d6_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l158_c9_d80e_cond : unsigned(0 downto 0);
 variable VAR_o_MUX_eth_8_h_l158_c9_d80e_iftrue : eth_8_tx_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l158_c9_d80e_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l158_c9_d80e_iffalse : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l172_c8_38d6_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l158_c9_d80e_cond : unsigned(0 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l158_c9_d80e_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l161_c5_c771_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l158_c9_d80e_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l158_c9_d80e_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l158_c9_d80e_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l161_c5_c771_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l158_c9_d80e_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l172_c8_38d6_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l158_c9_d80e_cond : unsigned(0 downto 0);
 variable VAR_uint16_15_8_eth_8_h_l160_c32_a183_return_output : unsigned(7 downto 0);
 variable VAR_counter_MUX_eth_8_h_l161_c5_c771_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l163_c7_57d0_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l161_c5_c771_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l161_c5_c771_cond : unsigned(0 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l161_c5_c771_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l161_c5_c771_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l161_c5_c771_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l161_c5_c771_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l163_c7_57d0_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l161_c5_c771_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l161_c5_c771_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l162_c26_e9e7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_eth_8_h_l162_c26_e9e7_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l163_c10_2f56_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l163_c10_2f56_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l163_c10_2f56_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l163_c7_57d0_iftrue : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l165_c9_aee0 : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l163_c7_57d0_iffalse : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l167_c9_723c : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l163_c7_57d0_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l163_c7_57d0_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l163_c7_57d0_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l163_c7_57d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l167_c9_e46d_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l167_c9_e46d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l167_c9_e46d_return_output : unsigned(6 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l172_c11_607c_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l172_c11_607c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l172_c11_607c_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l172_c8_38d6_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l179_c5_a045_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l172_c8_38d6_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l195_c8_3c8b_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l172_c8_38d6_cond : unsigned(0 downto 0);
 variable VAR_o_MUX_eth_8_h_l172_c8_38d6_iftrue : eth_8_tx_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524_eth_8_h_l172_c8_38d6_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l172_c8_38d6_iffalse : eth_8_tx_t;
 variable VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_eef4_eth_8_h_l172_c8_38d6_return_output : eth_8_tx_t;
 variable VAR_o_MUX_eth_8_h_l172_c8_38d6_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l172_c8_38d6_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l179_c5_a045_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l172_c8_38d6_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l195_c8_3c8b_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l172_c8_38d6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d_eth_8_h_l174_c23_ce30_return_output : axis8_t;
 variable VAR_MUX_eth_8_h_l176_c29_4f89_cond : unsigned(0 downto 0);
 variable VAR_MUX_eth_8_h_l176_c29_4f89_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_eth_8_h_l176_c29_4f89_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_eth_8_h_l176_c29_4f89_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l179_c8_e95b_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l179_c8_e95b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l179_c8_e95b_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l179_c5_a045_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l189_c7_29e5_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l179_c5_a045_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l179_c5_a045_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l179_c5_a045_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l180_c7_4857_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l179_c5_a045_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l179_c5_a045_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l180_c7_4857_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l182_c9_d4cc_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l180_c7_4857_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l180_c7_4857_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l180_c7_4857_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l180_c7_4857_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l182_c9_d4cc_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l180_c7_4857_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l180_c7_4857_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l182_c9_d4cc_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l182_c9_d4cc_iffalse : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l186_c11_4101 : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l182_c9_d4cc_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l182_c9_d4cc_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l182_c9_d4cc_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l182_c9_d4cc_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l189_c7_29e5_iftrue : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l190_c9_36b7 : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l189_c7_29e5_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l189_c7_29e5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l190_c9_5f8a_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l190_c9_5f8a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l190_c9_5f8a_return_output : unsigned(6 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l195_c11_f17c_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l195_c11_f17c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l195_c11_f17c_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l195_c8_3c8b_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l199_c5_b162_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l195_c8_3c8b_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l195_c8_3c8b_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_iftrue : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l195_c8_3c8b_return_output : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_iffalse : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_return_output : uint8_t_1;
 variable VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_iftrue : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_iffalse : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_return_output : unsigned(0 downto 0);
 variable VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_iftrue : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_iffalse : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_eth_8_tx_t_mac_axis_data_tlast_d41d_eth_8_h_l195_c8_3c8b_return_output : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_return_output : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l195_c8_3c8b_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l199_c5_b162_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l195_c8_3c8b_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l195_c8_3c8b_cond : unsigned(0 downto 0);
 variable VAR_o_mac_axis_data_tdata_0_eth_8_h_l196_c5_cc5d : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_eth_8_h_l197_c30_5894_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_eth_8_h_l197_c30_5894_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l199_c8_08aa_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l199_c8_08aa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l199_c8_08aa_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l199_c5_b162_iftrue : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l201_c7_158f_return_output : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l199_c5_b162_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l199_c5_b162_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l199_c5_b162_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l201_c7_158f_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l199_c5_b162_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l199_c5_b162_cond : unsigned(0 downto 0);
 variable VAR_counter_eth_8_h_l200_c7_1857 : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l200_c7_5770_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l200_c7_5770_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l200_c7_5770_return_output : unsigned(6 downto 0);
 variable VAR_counter_MUX_eth_8_h_l201_c7_158f_iftrue : unsigned(5 downto 0);
 variable VAR_counter_eth_8_h_l203_c9_82a9 : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l201_c7_158f_iffalse : unsigned(5 downto 0);
 variable VAR_counter_MUX_eth_8_h_l201_c7_158f_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l201_c7_158f_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l201_c7_158f_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l201_c7_158f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l130_l177_DUPLICATE_84b2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l136_l135_l137_DUPLICATE_04d7_return_output : unsigned(47 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_d41d_eth_8_h_l195_l130_DUPLICATE_9ee3_return_output : uint8_t_1;
 variable VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l148_l149_l146_l150_DUPLICATE_b114_return_output : unsigned(47 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l161_l158_l162_l146_l160_DUPLICATE_bdf9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l180_l176_DUPLICATE_52fa_return_output : unsigned(0 downto 0);
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
     VAR_state_MUX_eth_8_h_l182_c9_d4cc_iftrue := unsigned(eth8_state_t_to_slv(PADDING));
     VAR_BIN_OP_EQ_eth_8_h_l172_c11_607c_right := unsigned(eth8_state_t_to_slv(PAYLOAD));
     VAR_state_MUX_eth_8_h_l151_c7_ca0d_iftrue := unsigned(eth8_state_t_to_slv(LEN_TYPE));
     VAR_BIN_OP_EQ_eth_8_h_l146_c12_e34d_right := unsigned(eth8_state_t_to_slv(SRC_MAC));
     VAR_BIN_OP_PLUS_eth_8_h_l155_c9_b025_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_eth_8_h_l200_c7_5770_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_eth_8_h_l128_c6_fe00_right := unsigned(eth8_state_t_to_slv(IDLE_DST_MAC));
     VAR_BIN_OP_PLUS_eth_8_h_l190_c9_5f8a_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_eth_8_h_l142_c11_aae5_right := to_unsigned(1, 1);
     VAR_counter_eth_8_h_l186_c11_4101 := resize(to_unsigned(0, 1), 6);
     VAR_counter_MUX_eth_8_h_l182_c9_d4cc_iffalse := VAR_counter_eth_8_h_l186_c11_4101;
     VAR_state_MUX_eth_8_h_l163_c7_57d0_iftrue := unsigned(eth8_state_t_to_slv(PAYLOAD));
     VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_eth_8_h_l131_c10_02fa_right := to_unsigned(0, 1);
     VAR_o_mac_axis_data_tdata_0_eth_8_h_l196_c5_cc5d := resize(to_unsigned(0, 1), 8);
     VAR_counter_eth_8_h_l153_c9_d5cc := resize(to_unsigned(0, 1), 6);
     VAR_counter_MUX_eth_8_h_l151_c7_ca0d_iftrue := VAR_counter_eth_8_h_l153_c9_d5cc;
     VAR_state_MUX_eth_8_h_l182_c9_d4cc_iffalse := unsigned(eth8_state_t_to_slv(IDLE_DST_MAC));
     VAR_state_MUX_eth_8_h_l138_c9_3fa7_iftrue := unsigned(eth8_state_t_to_slv(SRC_MAC));
     VAR_BIN_OP_EQ_eth_8_h_l158_c12_f600_right := unsigned(eth8_state_t_to_slv(LEN_TYPE));
     VAR_BIN_OP_EQ_eth_8_h_l138_c12_d9e7_right := to_unsigned(5, 3);
     VAR_MUX_eth_8_h_l176_c29_4f89_iftrue := to_unsigned(0, 1);
     VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_iffalse := to_unsigned(0, 1);
     VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_eth_8_h_l151_c10_9b2c_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_eth_8_h_l195_c11_f17c_right := unsigned(eth8_state_t_to_slv(PADDING));
     VAR_BIN_OP_PLUS_eth_8_h_l167_c9_e46d_right := to_unsigned(1, 1);
     VAR_counter_eth_8_h_l140_c11_b0ad := resize(to_unsigned(0, 1), 6);
     VAR_counter_MUX_eth_8_h_l138_c9_3fa7_iftrue := VAR_counter_eth_8_h_l140_c11_b0ad;
     VAR_counter_eth_8_h_l165_c9_aee0 := resize(to_unsigned(0, 1), 6);
     VAR_counter_MUX_eth_8_h_l163_c7_57d0_iftrue := VAR_counter_eth_8_h_l165_c9_aee0;
     VAR_counter_eth_8_h_l203_c9_82a9 := resize(to_unsigned(0, 1), 6);
     VAR_counter_MUX_eth_8_h_l201_c7_158f_iftrue := VAR_counter_eth_8_h_l203_c9_82a9;
     VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_eth_8_h_l199_c8_08aa_left := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_eth_8_h_l163_c10_2f56_right := to_unsigned(1, 1);
     VAR_state_MUX_eth_8_h_l201_c7_158f_iftrue := unsigned(eth8_state_t_to_slv(IDLE_DST_MAC));
     VAR_BIN_OP_LT_eth_8_h_l124_c32_640c_right := to_unsigned(45, 6);
     -- o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3[eth_8_h_l195_c8_3c8b] LATENCY=0
     VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l195_c8_3c8b_return_output := CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3(
     VAR_o_mac_axis_data_tdata_0_eth_8_h_l196_c5_cc5d);

     -- o_mac_axis_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_eth_8_tx_t_mac_axis_data_tlast_d41d[eth_8_h_l195_c8_3c8b] LATENCY=0
     VAR_o_mac_axis_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_eth_8_tx_t_mac_axis_data_tlast_d41d_eth_8_h_l195_c8_3c8b_return_output := eth_8_tx_t_NULL.mac_axis.data.tlast;

     -- CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_d41d_eth_8_h_l195_l130_DUPLICATE_9ee3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_d41d_eth_8_h_l195_l130_DUPLICATE_9ee3_return_output := eth_8_tx_t_NULL.mac_axis.data.tdata;

     -- Submodule level 1
     VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_iffalse := VAR_o_mac_axis_data_tlast_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_eth_8_tx_t_mac_axis_data_tlast_d41d_eth_8_h_l195_c8_3c8b_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_iftrue := VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l195_c8_3c8b_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_iffalse := VAR_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_d41d_eth_8_h_l195_l130_DUPLICATE_9ee3_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_iffalse := VAR_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_d41d_eth_8_h_l195_l130_DUPLICATE_9ee3_return_output;

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
     VAR_BIN_OP_EQ_eth_8_h_l131_c10_02fa_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l138_c12_d9e7_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l151_c10_9b2c_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l163_c10_2f56_left := counter;
     VAR_BIN_OP_LT_eth_8_h_l124_c32_640c_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l142_c11_aae5_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l155_c9_b025_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l167_c9_e46d_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l200_c7_5770_left := counter;
     VAR_counter_MUX_eth_8_h_l130_c5_1846_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l136_c7_5084_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l149_c5_bb32_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l161_c5_c771_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l179_c5_a045_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l180_c7_4857_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l182_c9_d4cc_iftrue := counter;
     VAR_counter_MUX_eth_8_h_l195_c8_3c8b_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l199_c5_b162_iffalse := counter;
     VAR_header_MUX_eth_8_h_l130_c5_1846_iffalse := header;
     VAR_header_MUX_eth_8_h_l131_c7_735e_iffalse := header;
     VAR_BIN_OP_AND_eth_8_h_l179_c8_e95b_right := VAR_mac_axis_ready;
     VAR_BIN_OP_AND_eth_8_h_l199_c8_08aa_right := VAR_mac_axis_ready;
     VAR_counter_MUX_eth_8_h_l136_c7_5084_cond := VAR_mac_axis_ready;
     VAR_counter_MUX_eth_8_h_l149_c5_bb32_cond := VAR_mac_axis_ready;
     VAR_counter_MUX_eth_8_h_l161_c5_c771_cond := VAR_mac_axis_ready;
     VAR_header_dst_mac_MUX_eth_8_h_l136_c7_5084_cond := VAR_mac_axis_ready;
     VAR_header_ethertype_MUX_eth_8_h_l161_c5_c771_cond := VAR_mac_axis_ready;
     VAR_header_src_mac_MUX_eth_8_h_l149_c5_bb32_cond := VAR_mac_axis_ready;
     VAR_state_MUX_eth_8_h_l136_c7_5084_cond := VAR_mac_axis_ready;
     VAR_state_MUX_eth_8_h_l149_c5_bb32_cond := VAR_mac_axis_ready;
     VAR_state_MUX_eth_8_h_l161_c5_c771_cond := VAR_mac_axis_ready;
     VAR_BIN_OP_EQ_eth_8_h_l128_c6_fe00_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l146_c12_e34d_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l158_c12_f600_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l172_c11_607c_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l195_c11_f17c_left := state;
     VAR_state_MUX_eth_8_h_l130_c5_1846_iffalse := state;
     VAR_state_MUX_eth_8_h_l136_c7_5084_iffalse := state;
     VAR_state_MUX_eth_8_h_l138_c9_3fa7_iffalse := state;
     VAR_state_MUX_eth_8_h_l149_c5_bb32_iffalse := state;
     VAR_state_MUX_eth_8_h_l151_c7_ca0d_iffalse := state;
     VAR_state_MUX_eth_8_h_l161_c5_c771_iffalse := state;
     VAR_state_MUX_eth_8_h_l163_c7_57d0_iffalse := state;
     VAR_state_MUX_eth_8_h_l179_c5_a045_iffalse := state;
     VAR_state_MUX_eth_8_h_l180_c7_4857_iffalse := state;
     VAR_state_MUX_eth_8_h_l195_c8_3c8b_iffalse := state;
     VAR_state_MUX_eth_8_h_l199_c5_b162_iffalse := state;
     VAR_state_MUX_eth_8_h_l201_c7_158f_iffalse := state;
     -- BIN_OP_PLUS[eth_8_h_l142_c11_aae5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l142_c11_aae5_left <= VAR_BIN_OP_PLUS_eth_8_h_l142_c11_aae5_left;
     BIN_OP_PLUS_eth_8_h_l142_c11_aae5_right <= VAR_BIN_OP_PLUS_eth_8_h_l142_c11_aae5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l142_c11_aae5_return_output := BIN_OP_PLUS_eth_8_h_l142_c11_aae5_return_output;

     -- BIN_OP_AND[eth_8_h_l199_c8_08aa] LATENCY=0
     -- Inputs
     BIN_OP_AND_eth_8_h_l199_c8_08aa_left <= VAR_BIN_OP_AND_eth_8_h_l199_c8_08aa_left;
     BIN_OP_AND_eth_8_h_l199_c8_08aa_right <= VAR_BIN_OP_AND_eth_8_h_l199_c8_08aa_right;
     -- Outputs
     VAR_BIN_OP_AND_eth_8_h_l199_c8_08aa_return_output := BIN_OP_AND_eth_8_h_l199_c8_08aa_return_output;

     -- CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d[eth_8_h_l132_c18_6572] LATENCY=0
     VAR_CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d_eth_8_h_l132_c18_6572_return_output := VAR_frame.data.header;

     -- BIN_OP_EQ[eth_8_h_l146_c12_e34d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l146_c12_e34d_left <= VAR_BIN_OP_EQ_eth_8_h_l146_c12_e34d_left;
     BIN_OP_EQ_eth_8_h_l146_c12_e34d_right <= VAR_BIN_OP_EQ_eth_8_h_l146_c12_e34d_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l146_c12_e34d_return_output := BIN_OP_EQ_eth_8_h_l146_c12_e34d_return_output;

     -- CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l180_l176_DUPLICATE_52fa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l180_l176_DUPLICATE_52fa_return_output := VAR_frame.data.payload.tlast;

     -- BIN_OP_EQ[eth_8_h_l158_c12_f600] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l158_c12_f600_left <= VAR_BIN_OP_EQ_eth_8_h_l158_c12_f600_left;
     BIN_OP_EQ_eth_8_h_l158_c12_f600_right <= VAR_BIN_OP_EQ_eth_8_h_l158_c12_f600_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l158_c12_f600_return_output := BIN_OP_EQ_eth_8_h_l158_c12_f600_return_output;

     -- CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l130_l177_DUPLICATE_84b2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l130_l177_DUPLICATE_84b2_return_output := VAR_frame.valid;

     -- BIN_OP_EQ[eth_8_h_l172_c11_607c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l172_c11_607c_left <= VAR_BIN_OP_EQ_eth_8_h_l172_c11_607c_left;
     BIN_OP_EQ_eth_8_h_l172_c11_607c_right <= VAR_BIN_OP_EQ_eth_8_h_l172_c11_607c_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l172_c11_607c_return_output := BIN_OP_EQ_eth_8_h_l172_c11_607c_return_output;

     -- BIN_OP_PLUS[eth_8_h_l200_c7_5770] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l200_c7_5770_left <= VAR_BIN_OP_PLUS_eth_8_h_l200_c7_5770_left;
     BIN_OP_PLUS_eth_8_h_l200_c7_5770_right <= VAR_BIN_OP_PLUS_eth_8_h_l200_c7_5770_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l200_c7_5770_return_output := BIN_OP_PLUS_eth_8_h_l200_c7_5770_return_output;

     -- BIN_OP_EQ[eth_8_h_l163_c10_2f56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l163_c10_2f56_left <= VAR_BIN_OP_EQ_eth_8_h_l163_c10_2f56_left;
     BIN_OP_EQ_eth_8_h_l163_c10_2f56_right <= VAR_BIN_OP_EQ_eth_8_h_l163_c10_2f56_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l163_c10_2f56_return_output := BIN_OP_EQ_eth_8_h_l163_c10_2f56_return_output;

     -- CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d[eth_8_h_l174_c23_ce30] LATENCY=0
     VAR_CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d_eth_8_h_l174_c23_ce30_return_output := VAR_frame.data.payload;

     -- BIN_OP_EQ[eth_8_h_l128_c6_fe00] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l128_c6_fe00_left <= VAR_BIN_OP_EQ_eth_8_h_l128_c6_fe00_left;
     BIN_OP_EQ_eth_8_h_l128_c6_fe00_right <= VAR_BIN_OP_EQ_eth_8_h_l128_c6_fe00_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l128_c6_fe00_return_output := BIN_OP_EQ_eth_8_h_l128_c6_fe00_return_output;

     -- BIN_OP_PLUS[eth_8_h_l167_c9_e46d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l167_c9_e46d_left <= VAR_BIN_OP_PLUS_eth_8_h_l167_c9_e46d_left;
     BIN_OP_PLUS_eth_8_h_l167_c9_e46d_right <= VAR_BIN_OP_PLUS_eth_8_h_l167_c9_e46d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l167_c9_e46d_return_output := BIN_OP_PLUS_eth_8_h_l167_c9_e46d_return_output;

     -- BIN_OP_EQ[eth_8_h_l138_c12_d9e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l138_c12_d9e7_left <= VAR_BIN_OP_EQ_eth_8_h_l138_c12_d9e7_left;
     BIN_OP_EQ_eth_8_h_l138_c12_d9e7_right <= VAR_BIN_OP_EQ_eth_8_h_l138_c12_d9e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l138_c12_d9e7_return_output := BIN_OP_EQ_eth_8_h_l138_c12_d9e7_return_output;

     -- BIN_OP_EQ[eth_8_h_l131_c10_02fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l131_c10_02fa_left <= VAR_BIN_OP_EQ_eth_8_h_l131_c10_02fa_left;
     BIN_OP_EQ_eth_8_h_l131_c10_02fa_right <= VAR_BIN_OP_EQ_eth_8_h_l131_c10_02fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l131_c10_02fa_return_output := BIN_OP_EQ_eth_8_h_l131_c10_02fa_return_output;

     -- CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l161_l158_l162_l146_l160_DUPLICATE_bdf9 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l161_l158_l162_l146_l160_DUPLICATE_bdf9_return_output := header.ethertype;

     -- BIN_OP_EQ[eth_8_h_l195_c11_f17c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l195_c11_f17c_left <= VAR_BIN_OP_EQ_eth_8_h_l195_c11_f17c_left;
     BIN_OP_EQ_eth_8_h_l195_c11_f17c_right <= VAR_BIN_OP_EQ_eth_8_h_l195_c11_f17c_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l195_c11_f17c_return_output := BIN_OP_EQ_eth_8_h_l195_c11_f17c_return_output;

     -- CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l148_l149_l146_l150_DUPLICATE_b114 LATENCY=0
     VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l148_l149_l146_l150_DUPLICATE_b114_return_output := header.src_mac;

     -- BIN_OP_PLUS[eth_8_h_l155_c9_b025] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l155_c9_b025_left <= VAR_BIN_OP_PLUS_eth_8_h_l155_c9_b025_left;
     BIN_OP_PLUS_eth_8_h_l155_c9_b025_right <= VAR_BIN_OP_PLUS_eth_8_h_l155_c9_b025_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l155_c9_b025_return_output := BIN_OP_PLUS_eth_8_h_l155_c9_b025_return_output;

     -- BIN_OP_EQ[eth_8_h_l151_c10_9b2c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l151_c10_9b2c_left <= VAR_BIN_OP_EQ_eth_8_h_l151_c10_9b2c_left;
     BIN_OP_EQ_eth_8_h_l151_c10_9b2c_right <= VAR_BIN_OP_EQ_eth_8_h_l151_c10_9b2c_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l151_c10_9b2c_return_output := BIN_OP_EQ_eth_8_h_l151_c10_9b2c_return_output;

     -- BIN_OP_LT[eth_8_h_l124_c32_640c] LATENCY=0
     -- Inputs
     BIN_OP_LT_eth_8_h_l124_c32_640c_left <= VAR_BIN_OP_LT_eth_8_h_l124_c32_640c_left;
     BIN_OP_LT_eth_8_h_l124_c32_640c_right <= VAR_BIN_OP_LT_eth_8_h_l124_c32_640c_right;
     -- Outputs
     VAR_BIN_OP_LT_eth_8_h_l124_c32_640c_return_output := BIN_OP_LT_eth_8_h_l124_c32_640c_return_output;

     -- Submodule level 1
     VAR_counter_MUX_eth_8_h_l199_c5_b162_cond := VAR_BIN_OP_AND_eth_8_h_l199_c8_08aa_return_output;
     VAR_state_MUX_eth_8_h_l199_c5_b162_cond := VAR_BIN_OP_AND_eth_8_h_l199_c8_08aa_return_output;
     VAR_counter_MUX_eth_8_h_l128_c3_f71d_cond := VAR_BIN_OP_EQ_eth_8_h_l128_c6_fe00_return_output;
     VAR_header_MUX_eth_8_h_l128_c3_f71d_cond := VAR_BIN_OP_EQ_eth_8_h_l128_c6_fe00_return_output;
     VAR_o_MUX_eth_8_h_l128_c3_f71d_cond := VAR_BIN_OP_EQ_eth_8_h_l128_c6_fe00_return_output;
     VAR_state_MUX_eth_8_h_l128_c3_f71d_cond := VAR_BIN_OP_EQ_eth_8_h_l128_c6_fe00_return_output;
     VAR_header_MUX_eth_8_h_l131_c7_735e_cond := VAR_BIN_OP_EQ_eth_8_h_l131_c10_02fa_return_output;
     VAR_counter_MUX_eth_8_h_l138_c9_3fa7_cond := VAR_BIN_OP_EQ_eth_8_h_l138_c12_d9e7_return_output;
     VAR_state_MUX_eth_8_h_l138_c9_3fa7_cond := VAR_BIN_OP_EQ_eth_8_h_l138_c12_d9e7_return_output;
     VAR_counter_MUX_eth_8_h_l146_c9_6103_cond := VAR_BIN_OP_EQ_eth_8_h_l146_c12_e34d_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l146_c9_6103_cond := VAR_BIN_OP_EQ_eth_8_h_l146_c12_e34d_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l146_c9_6103_cond := VAR_BIN_OP_EQ_eth_8_h_l146_c12_e34d_return_output;
     VAR_o_MUX_eth_8_h_l146_c9_6103_cond := VAR_BIN_OP_EQ_eth_8_h_l146_c12_e34d_return_output;
     VAR_state_MUX_eth_8_h_l146_c9_6103_cond := VAR_BIN_OP_EQ_eth_8_h_l146_c12_e34d_return_output;
     VAR_counter_MUX_eth_8_h_l151_c7_ca0d_cond := VAR_BIN_OP_EQ_eth_8_h_l151_c10_9b2c_return_output;
     VAR_state_MUX_eth_8_h_l151_c7_ca0d_cond := VAR_BIN_OP_EQ_eth_8_h_l151_c10_9b2c_return_output;
     VAR_counter_MUX_eth_8_h_l158_c9_d80e_cond := VAR_BIN_OP_EQ_eth_8_h_l158_c12_f600_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l158_c9_d80e_cond := VAR_BIN_OP_EQ_eth_8_h_l158_c12_f600_return_output;
     VAR_o_MUX_eth_8_h_l158_c9_d80e_cond := VAR_BIN_OP_EQ_eth_8_h_l158_c12_f600_return_output;
     VAR_state_MUX_eth_8_h_l158_c9_d80e_cond := VAR_BIN_OP_EQ_eth_8_h_l158_c12_f600_return_output;
     VAR_counter_MUX_eth_8_h_l163_c7_57d0_cond := VAR_BIN_OP_EQ_eth_8_h_l163_c10_2f56_return_output;
     VAR_state_MUX_eth_8_h_l163_c7_57d0_cond := VAR_BIN_OP_EQ_eth_8_h_l163_c10_2f56_return_output;
     VAR_counter_MUX_eth_8_h_l172_c8_38d6_cond := VAR_BIN_OP_EQ_eth_8_h_l172_c11_607c_return_output;
     VAR_o_MUX_eth_8_h_l172_c8_38d6_cond := VAR_BIN_OP_EQ_eth_8_h_l172_c11_607c_return_output;
     VAR_state_MUX_eth_8_h_l172_c8_38d6_cond := VAR_BIN_OP_EQ_eth_8_h_l172_c11_607c_return_output;
     VAR_counter_MUX_eth_8_h_l195_c8_3c8b_cond := VAR_BIN_OP_EQ_eth_8_h_l195_c11_f17c_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_cond := VAR_BIN_OP_EQ_eth_8_h_l195_c11_f17c_return_output;
     VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_cond := VAR_BIN_OP_EQ_eth_8_h_l195_c11_f17c_return_output;
     VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_cond := VAR_BIN_OP_EQ_eth_8_h_l195_c11_f17c_return_output;
     VAR_state_MUX_eth_8_h_l195_c8_3c8b_cond := VAR_BIN_OP_EQ_eth_8_h_l195_c11_f17c_return_output;
     VAR_MUX_eth_8_h_l176_c29_4f89_cond := VAR_BIN_OP_LT_eth_8_h_l124_c32_640c_return_output;
     VAR_UNARY_OP_NOT_eth_8_h_l197_c30_5894_expr := VAR_BIN_OP_LT_eth_8_h_l124_c32_640c_return_output;
     VAR_counter_MUX_eth_8_h_l182_c9_d4cc_cond := VAR_BIN_OP_LT_eth_8_h_l124_c32_640c_return_output;
     VAR_counter_MUX_eth_8_h_l189_c7_29e5_cond := VAR_BIN_OP_LT_eth_8_h_l124_c32_640c_return_output;
     VAR_state_MUX_eth_8_h_l182_c9_d4cc_cond := VAR_BIN_OP_LT_eth_8_h_l124_c32_640c_return_output;
     VAR_counter_eth_8_h_l142_c11_f1bb := resize(VAR_BIN_OP_PLUS_eth_8_h_l142_c11_aae5_return_output, 6);
     VAR_counter_eth_8_h_l155_c9_d734 := resize(VAR_BIN_OP_PLUS_eth_8_h_l155_c9_b025_return_output, 6);
     VAR_counter_eth_8_h_l167_c9_723c := resize(VAR_BIN_OP_PLUS_eth_8_h_l167_c9_e46d_return_output, 6);
     VAR_counter_eth_8_h_l200_c7_1857 := resize(VAR_BIN_OP_PLUS_eth_8_h_l200_c7_5770_return_output, 6);
     VAR_header_MUX_eth_8_h_l131_c7_735e_iftrue := VAR_CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d_eth_8_h_l132_c18_6572_return_output;
     VAR_CONST_SL_8_eth_8_h_l162_c26_e9e7_x := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l161_l158_l162_l146_l160_DUPLICATE_bdf9_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l146_c9_6103_iftrue := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l161_l158_l162_l146_l160_DUPLICATE_bdf9_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l158_c9_d80e_iffalse := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l161_l158_l162_l146_l160_DUPLICATE_bdf9_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l161_c5_c771_iffalse := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l161_l158_l162_l146_l160_DUPLICATE_bdf9_return_output;
     VAR_MUX_eth_8_h_l176_c29_4f89_iffalse := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l180_l176_DUPLICATE_52fa_return_output;
     VAR_counter_MUX_eth_8_h_l180_c7_4857_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l180_l176_DUPLICATE_52fa_return_output;
     VAR_state_MUX_eth_8_h_l180_c7_4857_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_d41d_eth_8_h_l180_l176_DUPLICATE_52fa_return_output;
     VAR_BIN_OP_AND_eth_8_h_l179_c8_e95b_left := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l130_l177_DUPLICATE_84b2_return_output;
     VAR_counter_MUX_eth_8_h_l130_c5_1846_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l130_l177_DUPLICATE_84b2_return_output;
     VAR_header_MUX_eth_8_h_l130_c5_1846_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l130_l177_DUPLICATE_84b2_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l130_l177_DUPLICATE_84b2_return_output;
     VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l130_l177_DUPLICATE_84b2_return_output;
     VAR_state_MUX_eth_8_h_l130_c5_1846_cond := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l130_l177_DUPLICATE_84b2_return_output;
     VAR_CONST_SL_8_eth_8_h_l150_c24_73f9_x := VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l148_l149_l146_l150_DUPLICATE_b114_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l146_c9_6103_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l148_l149_l146_l150_DUPLICATE_b114_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l149_c5_bb32_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l148_l149_l146_l150_DUPLICATE_b114_return_output;
     VAR_counter_MUX_eth_8_h_l138_c9_3fa7_iffalse := VAR_counter_eth_8_h_l142_c11_f1bb;
     VAR_counter_MUX_eth_8_h_l151_c7_ca0d_iffalse := VAR_counter_eth_8_h_l155_c9_d734;
     VAR_counter_MUX_eth_8_h_l163_c7_57d0_iffalse := VAR_counter_eth_8_h_l167_c9_723c;
     VAR_counter_MUX_eth_8_h_l201_c7_158f_iffalse := VAR_counter_eth_8_h_l200_c7_1857;
     -- CONST_SL_8[eth_8_h_l162_c26_e9e7] LATENCY=0
     -- Inputs
     CONST_SL_8_eth_8_h_l162_c26_e9e7_x <= VAR_CONST_SL_8_eth_8_h_l162_c26_e9e7_x;
     -- Outputs
     VAR_CONST_SL_8_eth_8_h_l162_c26_e9e7_return_output := CONST_SL_8_eth_8_h_l162_c26_e9e7_return_output;

     -- UNARY_OP_NOT[eth_8_h_l197_c30_5894] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_eth_8_h_l197_c30_5894_expr <= VAR_UNARY_OP_NOT_eth_8_h_l197_c30_5894_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_eth_8_h_l197_c30_5894_return_output := UNARY_OP_NOT_eth_8_h_l197_c30_5894_return_output;

     -- state_MUX[eth_8_h_l182_c9_d4cc] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l182_c9_d4cc_cond <= VAR_state_MUX_eth_8_h_l182_c9_d4cc_cond;
     state_MUX_eth_8_h_l182_c9_d4cc_iftrue <= VAR_state_MUX_eth_8_h_l182_c9_d4cc_iftrue;
     state_MUX_eth_8_h_l182_c9_d4cc_iffalse <= VAR_state_MUX_eth_8_h_l182_c9_d4cc_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l182_c9_d4cc_return_output := state_MUX_eth_8_h_l182_c9_d4cc_return_output;

     -- o_mac_axis_valid_MUX[eth_8_h_l130_c5_1846] LATENCY=0
     -- Inputs
     o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_cond <= VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_cond;
     o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_iftrue <= VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_iftrue;
     o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_iffalse <= VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_iffalse;
     -- Outputs
     VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_return_output := o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_return_output;

     -- uint16_15_8[eth_8_h_l160_c32_a183] LATENCY=0
     VAR_uint16_15_8_eth_8_h_l160_c32_a183_return_output := uint16_15_8(
     VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l161_l158_l162_l146_l160_DUPLICATE_bdf9_return_output);

     -- o_mac_axis_valid_MUX[eth_8_h_l195_c8_3c8b] LATENCY=0
     -- Inputs
     o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_cond <= VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_cond;
     o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_iftrue <= VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_iftrue;
     o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_iffalse <= VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_iffalse;
     -- Outputs
     VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_return_output := o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_return_output;

     -- state_MUX[eth_8_h_l138_c9_3fa7] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l138_c9_3fa7_cond <= VAR_state_MUX_eth_8_h_l138_c9_3fa7_cond;
     state_MUX_eth_8_h_l138_c9_3fa7_iftrue <= VAR_state_MUX_eth_8_h_l138_c9_3fa7_iftrue;
     state_MUX_eth_8_h_l138_c9_3fa7_iffalse <= VAR_state_MUX_eth_8_h_l138_c9_3fa7_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l138_c9_3fa7_return_output := state_MUX_eth_8_h_l138_c9_3fa7_return_output;

     -- uint48_47_40[eth_8_h_l148_c32_f648] LATENCY=0
     VAR_uint48_47_40_eth_8_h_l148_c32_f648_return_output := uint48_47_40(
     VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l148_l149_l146_l150_DUPLICATE_b114_return_output);

     -- header_MUX[eth_8_h_l131_c7_735e] LATENCY=0
     -- Inputs
     header_MUX_eth_8_h_l131_c7_735e_cond <= VAR_header_MUX_eth_8_h_l131_c7_735e_cond;
     header_MUX_eth_8_h_l131_c7_735e_iftrue <= VAR_header_MUX_eth_8_h_l131_c7_735e_iftrue;
     header_MUX_eth_8_h_l131_c7_735e_iffalse <= VAR_header_MUX_eth_8_h_l131_c7_735e_iffalse;
     -- Outputs
     VAR_header_MUX_eth_8_h_l131_c7_735e_return_output := header_MUX_eth_8_h_l131_c7_735e_return_output;

     -- counter_MUX[eth_8_h_l163_c7_57d0] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l163_c7_57d0_cond <= VAR_counter_MUX_eth_8_h_l163_c7_57d0_cond;
     counter_MUX_eth_8_h_l163_c7_57d0_iftrue <= VAR_counter_MUX_eth_8_h_l163_c7_57d0_iftrue;
     counter_MUX_eth_8_h_l163_c7_57d0_iffalse <= VAR_counter_MUX_eth_8_h_l163_c7_57d0_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l163_c7_57d0_return_output := counter_MUX_eth_8_h_l163_c7_57d0_return_output;

     -- MUX[eth_8_h_l176_c29_4f89] LATENCY=0
     -- Inputs
     MUX_eth_8_h_l176_c29_4f89_cond <= VAR_MUX_eth_8_h_l176_c29_4f89_cond;
     MUX_eth_8_h_l176_c29_4f89_iftrue <= VAR_MUX_eth_8_h_l176_c29_4f89_iftrue;
     MUX_eth_8_h_l176_c29_4f89_iffalse <= VAR_MUX_eth_8_h_l176_c29_4f89_iffalse;
     -- Outputs
     VAR_MUX_eth_8_h_l176_c29_4f89_return_output := MUX_eth_8_h_l176_c29_4f89_return_output;

     -- counter_MUX[eth_8_h_l182_c9_d4cc] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l182_c9_d4cc_cond <= VAR_counter_MUX_eth_8_h_l182_c9_d4cc_cond;
     counter_MUX_eth_8_h_l182_c9_d4cc_iftrue <= VAR_counter_MUX_eth_8_h_l182_c9_d4cc_iftrue;
     counter_MUX_eth_8_h_l182_c9_d4cc_iffalse <= VAR_counter_MUX_eth_8_h_l182_c9_d4cc_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l182_c9_d4cc_return_output := counter_MUX_eth_8_h_l182_c9_d4cc_return_output;

     -- state_MUX[eth_8_h_l163_c7_57d0] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l163_c7_57d0_cond <= VAR_state_MUX_eth_8_h_l163_c7_57d0_cond;
     state_MUX_eth_8_h_l163_c7_57d0_iftrue <= VAR_state_MUX_eth_8_h_l163_c7_57d0_iftrue;
     state_MUX_eth_8_h_l163_c7_57d0_iffalse <= VAR_state_MUX_eth_8_h_l163_c7_57d0_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l163_c7_57d0_return_output := state_MUX_eth_8_h_l163_c7_57d0_return_output;

     -- o_mac_axis_data_tdata_MUX[eth_8_h_l195_c8_3c8b] LATENCY=0
     -- Inputs
     o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_cond <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_cond;
     o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_iftrue <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_iftrue;
     o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_iffalse <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_iffalse;
     -- Outputs
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_return_output := o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_return_output;

     -- BIN_OP_AND[eth_8_h_l179_c8_e95b] LATENCY=0
     -- Inputs
     BIN_OP_AND_eth_8_h_l179_c8_e95b_left <= VAR_BIN_OP_AND_eth_8_h_l179_c8_e95b_left;
     BIN_OP_AND_eth_8_h_l179_c8_e95b_right <= VAR_BIN_OP_AND_eth_8_h_l179_c8_e95b_right;
     -- Outputs
     VAR_BIN_OP_AND_eth_8_h_l179_c8_e95b_return_output := BIN_OP_AND_eth_8_h_l179_c8_e95b_return_output;

     -- state_MUX[eth_8_h_l151_c7_ca0d] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l151_c7_ca0d_cond <= VAR_state_MUX_eth_8_h_l151_c7_ca0d_cond;
     state_MUX_eth_8_h_l151_c7_ca0d_iftrue <= VAR_state_MUX_eth_8_h_l151_c7_ca0d_iftrue;
     state_MUX_eth_8_h_l151_c7_ca0d_iffalse <= VAR_state_MUX_eth_8_h_l151_c7_ca0d_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l151_c7_ca0d_return_output := state_MUX_eth_8_h_l151_c7_ca0d_return_output;

     -- counter_MUX[eth_8_h_l138_c9_3fa7] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l138_c9_3fa7_cond <= VAR_counter_MUX_eth_8_h_l138_c9_3fa7_cond;
     counter_MUX_eth_8_h_l138_c9_3fa7_iftrue <= VAR_counter_MUX_eth_8_h_l138_c9_3fa7_iftrue;
     counter_MUX_eth_8_h_l138_c9_3fa7_iffalse <= VAR_counter_MUX_eth_8_h_l138_c9_3fa7_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l138_c9_3fa7_return_output := counter_MUX_eth_8_h_l138_c9_3fa7_return_output;

     -- CONST_SL_8[eth_8_h_l150_c24_73f9] LATENCY=0
     -- Inputs
     CONST_SL_8_eth_8_h_l150_c24_73f9_x <= VAR_CONST_SL_8_eth_8_h_l150_c24_73f9_x;
     -- Outputs
     VAR_CONST_SL_8_eth_8_h_l150_c24_73f9_return_output := CONST_SL_8_eth_8_h_l150_c24_73f9_return_output;

     -- counter_MUX[eth_8_h_l151_c7_ca0d] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l151_c7_ca0d_cond <= VAR_counter_MUX_eth_8_h_l151_c7_ca0d_cond;
     counter_MUX_eth_8_h_l151_c7_ca0d_iftrue <= VAR_counter_MUX_eth_8_h_l151_c7_ca0d_iftrue;
     counter_MUX_eth_8_h_l151_c7_ca0d_iffalse <= VAR_counter_MUX_eth_8_h_l151_c7_ca0d_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l151_c7_ca0d_return_output := counter_MUX_eth_8_h_l151_c7_ca0d_return_output;

     -- Submodule level 2
     VAR_counter_MUX_eth_8_h_l179_c5_a045_cond := VAR_BIN_OP_AND_eth_8_h_l179_c8_e95b_return_output;
     VAR_state_MUX_eth_8_h_l179_c5_a045_cond := VAR_BIN_OP_AND_eth_8_h_l179_c8_e95b_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l149_c5_bb32_iftrue := VAR_CONST_SL_8_eth_8_h_l150_c24_73f9_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l161_c5_c771_iftrue := VAR_CONST_SL_8_eth_8_h_l162_c26_e9e7_return_output;
     VAR_counter_MUX_eth_8_h_l201_c7_158f_cond := VAR_UNARY_OP_NOT_eth_8_h_l197_c30_5894_return_output;
     VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_iftrue := VAR_UNARY_OP_NOT_eth_8_h_l197_c30_5894_return_output;
     VAR_state_MUX_eth_8_h_l201_c7_158f_cond := VAR_UNARY_OP_NOT_eth_8_h_l197_c30_5894_return_output;
     VAR_counter_MUX_eth_8_h_l136_c7_5084_iftrue := VAR_counter_MUX_eth_8_h_l138_c9_3fa7_return_output;
     VAR_counter_MUX_eth_8_h_l149_c5_bb32_iftrue := VAR_counter_MUX_eth_8_h_l151_c7_ca0d_return_output;
     VAR_counter_MUX_eth_8_h_l161_c5_c771_iftrue := VAR_counter_MUX_eth_8_h_l163_c7_57d0_return_output;
     VAR_counter_MUX_eth_8_h_l180_c7_4857_iftrue := VAR_counter_MUX_eth_8_h_l182_c9_d4cc_return_output;
     VAR_state_MUX_eth_8_h_l136_c7_5084_iftrue := VAR_state_MUX_eth_8_h_l138_c9_3fa7_return_output;
     VAR_state_MUX_eth_8_h_l149_c5_bb32_iftrue := VAR_state_MUX_eth_8_h_l151_c7_ca0d_return_output;
     VAR_state_MUX_eth_8_h_l161_c5_c771_iftrue := VAR_state_MUX_eth_8_h_l163_c7_57d0_return_output;
     VAR_state_MUX_eth_8_h_l180_c7_4857_iftrue := VAR_state_MUX_eth_8_h_l182_c9_d4cc_return_output;
     -- state_MUX[eth_8_h_l180_c7_4857] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l180_c7_4857_cond <= VAR_state_MUX_eth_8_h_l180_c7_4857_cond;
     state_MUX_eth_8_h_l180_c7_4857_iftrue <= VAR_state_MUX_eth_8_h_l180_c7_4857_iftrue;
     state_MUX_eth_8_h_l180_c7_4857_iffalse <= VAR_state_MUX_eth_8_h_l180_c7_4857_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l180_c7_4857_return_output := state_MUX_eth_8_h_l180_c7_4857_return_output;

     -- state_MUX[eth_8_h_l201_c7_158f] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l201_c7_158f_cond <= VAR_state_MUX_eth_8_h_l201_c7_158f_cond;
     state_MUX_eth_8_h_l201_c7_158f_iftrue <= VAR_state_MUX_eth_8_h_l201_c7_158f_iftrue;
     state_MUX_eth_8_h_l201_c7_158f_iffalse <= VAR_state_MUX_eth_8_h_l201_c7_158f_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l201_c7_158f_return_output := state_MUX_eth_8_h_l201_c7_158f_return_output;

     -- state_MUX[eth_8_h_l136_c7_5084] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l136_c7_5084_cond <= VAR_state_MUX_eth_8_h_l136_c7_5084_cond;
     state_MUX_eth_8_h_l136_c7_5084_iftrue <= VAR_state_MUX_eth_8_h_l136_c7_5084_iftrue;
     state_MUX_eth_8_h_l136_c7_5084_iffalse <= VAR_state_MUX_eth_8_h_l136_c7_5084_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l136_c7_5084_return_output := state_MUX_eth_8_h_l136_c7_5084_return_output;

     -- counter_MUX[eth_8_h_l161_c5_c771] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l161_c5_c771_cond <= VAR_counter_MUX_eth_8_h_l161_c5_c771_cond;
     counter_MUX_eth_8_h_l161_c5_c771_iftrue <= VAR_counter_MUX_eth_8_h_l161_c5_c771_iftrue;
     counter_MUX_eth_8_h_l161_c5_c771_iffalse <= VAR_counter_MUX_eth_8_h_l161_c5_c771_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l161_c5_c771_return_output := counter_MUX_eth_8_h_l161_c5_c771_return_output;

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb[eth_8_h_l158_c9_d80e] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l158_c9_d80e_return_output := CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb(
     eth_8_tx_t_NULL,
     to_unsigned(1, 1),
     to_unsigned(0, 1),
     to_unsigned(1, 1),
     VAR_uint16_15_8_eth_8_h_l160_c32_a183_return_output);

     -- header_src_mac_MUX[eth_8_h_l149_c5_bb32] LATENCY=0
     -- Inputs
     header_src_mac_MUX_eth_8_h_l149_c5_bb32_cond <= VAR_header_src_mac_MUX_eth_8_h_l149_c5_bb32_cond;
     header_src_mac_MUX_eth_8_h_l149_c5_bb32_iftrue <= VAR_header_src_mac_MUX_eth_8_h_l149_c5_bb32_iftrue;
     header_src_mac_MUX_eth_8_h_l149_c5_bb32_iffalse <= VAR_header_src_mac_MUX_eth_8_h_l149_c5_bb32_iffalse;
     -- Outputs
     VAR_header_src_mac_MUX_eth_8_h_l149_c5_bb32_return_output := header_src_mac_MUX_eth_8_h_l149_c5_bb32_return_output;

     -- state_MUX[eth_8_h_l149_c5_bb32] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l149_c5_bb32_cond <= VAR_state_MUX_eth_8_h_l149_c5_bb32_cond;
     state_MUX_eth_8_h_l149_c5_bb32_iftrue <= VAR_state_MUX_eth_8_h_l149_c5_bb32_iftrue;
     state_MUX_eth_8_h_l149_c5_bb32_iffalse <= VAR_state_MUX_eth_8_h_l149_c5_bb32_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l149_c5_bb32_return_output := state_MUX_eth_8_h_l149_c5_bb32_return_output;

     -- o_mac_axis_data_tlast_MUX[eth_8_h_l195_c8_3c8b] LATENCY=0
     -- Inputs
     o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_cond <= VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_cond;
     o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_iftrue <= VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_iftrue;
     o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_iffalse <= VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_iffalse;
     -- Outputs
     VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_return_output := o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_return_output;

     -- counter_MUX[eth_8_h_l180_c7_4857] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l180_c7_4857_cond <= VAR_counter_MUX_eth_8_h_l180_c7_4857_cond;
     counter_MUX_eth_8_h_l180_c7_4857_iftrue <= VAR_counter_MUX_eth_8_h_l180_c7_4857_iftrue;
     counter_MUX_eth_8_h_l180_c7_4857_iffalse <= VAR_counter_MUX_eth_8_h_l180_c7_4857_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l180_c7_4857_return_output := counter_MUX_eth_8_h_l180_c7_4857_return_output;

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb[eth_8_h_l146_c9_6103] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l146_c9_6103_return_output := CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb(
     eth_8_tx_t_NULL,
     to_unsigned(1, 1),
     to_unsigned(0, 1),
     to_unsigned(1, 1),
     VAR_uint48_47_40_eth_8_h_l148_c32_f648_return_output);

     -- CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l136_l135_l137_DUPLICATE_04d7 LATENCY=0
     VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l136_l135_l137_DUPLICATE_04d7_return_output := VAR_header_MUX_eth_8_h_l131_c7_735e_return_output.dst_mac;

     -- counter_MUX[eth_8_h_l149_c5_bb32] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l149_c5_bb32_cond <= VAR_counter_MUX_eth_8_h_l149_c5_bb32_cond;
     counter_MUX_eth_8_h_l149_c5_bb32_iftrue <= VAR_counter_MUX_eth_8_h_l149_c5_bb32_iftrue;
     counter_MUX_eth_8_h_l149_c5_bb32_iffalse <= VAR_counter_MUX_eth_8_h_l149_c5_bb32_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l149_c5_bb32_return_output := counter_MUX_eth_8_h_l149_c5_bb32_return_output;

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524[eth_8_h_l172_c8_38d6] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524_eth_8_h_l172_c8_38d6_return_output := CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524(
     VAR_CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d_eth_8_h_l174_c23_ce30_return_output,
     VAR_MUX_eth_8_h_l176_c29_4f89_return_output,
     VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_eth_8_h_l130_l177_DUPLICATE_84b2_return_output,
     VAR_mac_axis_ready);

     -- header_ethertype_MUX[eth_8_h_l161_c5_c771] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l161_c5_c771_cond <= VAR_header_ethertype_MUX_eth_8_h_l161_c5_c771_cond;
     header_ethertype_MUX_eth_8_h_l161_c5_c771_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l161_c5_c771_iftrue;
     header_ethertype_MUX_eth_8_h_l161_c5_c771_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l161_c5_c771_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l161_c5_c771_return_output := header_ethertype_MUX_eth_8_h_l161_c5_c771_return_output;

     -- state_MUX[eth_8_h_l161_c5_c771] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l161_c5_c771_cond <= VAR_state_MUX_eth_8_h_l161_c5_c771_cond;
     state_MUX_eth_8_h_l161_c5_c771_iftrue <= VAR_state_MUX_eth_8_h_l161_c5_c771_iftrue;
     state_MUX_eth_8_h_l161_c5_c771_iffalse <= VAR_state_MUX_eth_8_h_l161_c5_c771_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l161_c5_c771_return_output := state_MUX_eth_8_h_l161_c5_c771_return_output;

     -- counter_MUX[eth_8_h_l201_c7_158f] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l201_c7_158f_cond <= VAR_counter_MUX_eth_8_h_l201_c7_158f_cond;
     counter_MUX_eth_8_h_l201_c7_158f_iftrue <= VAR_counter_MUX_eth_8_h_l201_c7_158f_iftrue;
     counter_MUX_eth_8_h_l201_c7_158f_iffalse <= VAR_counter_MUX_eth_8_h_l201_c7_158f_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l201_c7_158f_return_output := counter_MUX_eth_8_h_l201_c7_158f_return_output;

     -- counter_MUX[eth_8_h_l136_c7_5084] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l136_c7_5084_cond <= VAR_counter_MUX_eth_8_h_l136_c7_5084_cond;
     counter_MUX_eth_8_h_l136_c7_5084_iftrue <= VAR_counter_MUX_eth_8_h_l136_c7_5084_iftrue;
     counter_MUX_eth_8_h_l136_c7_5084_iffalse <= VAR_counter_MUX_eth_8_h_l136_c7_5084_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l136_c7_5084_return_output := counter_MUX_eth_8_h_l136_c7_5084_return_output;

     -- Submodule level 3
     VAR_CONST_SL_8_eth_8_h_l137_c26_de6d_x := VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l136_l135_l137_DUPLICATE_04d7_return_output;
     VAR_header_dst_mac_MUX_eth_8_h_l136_c7_5084_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l136_l135_l137_DUPLICATE_04d7_return_output;
     VAR_counter_MUX_eth_8_h_l130_c5_1846_iftrue := VAR_counter_MUX_eth_8_h_l136_c7_5084_return_output;
     VAR_counter_MUX_eth_8_h_l146_c9_6103_iftrue := VAR_counter_MUX_eth_8_h_l149_c5_bb32_return_output;
     VAR_counter_MUX_eth_8_h_l158_c9_d80e_iftrue := VAR_counter_MUX_eth_8_h_l161_c5_c771_return_output;
     VAR_BIN_OP_PLUS_eth_8_h_l190_c9_5f8a_left := VAR_counter_MUX_eth_8_h_l180_c7_4857_return_output;
     VAR_counter_MUX_eth_8_h_l189_c7_29e5_iffalse := VAR_counter_MUX_eth_8_h_l180_c7_4857_return_output;
     VAR_counter_MUX_eth_8_h_l199_c5_b162_iftrue := VAR_counter_MUX_eth_8_h_l201_c7_158f_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l158_c9_d80e_iftrue := VAR_header_ethertype_MUX_eth_8_h_l161_c5_c771_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l146_c9_6103_iftrue := VAR_header_src_mac_MUX_eth_8_h_l149_c5_bb32_return_output;
     VAR_o_MUX_eth_8_h_l146_c9_6103_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l146_c9_6103_return_output;
     VAR_o_MUX_eth_8_h_l158_c9_d80e_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_0dfb_eth_8_h_l158_c9_d80e_return_output;
     VAR_o_MUX_eth_8_h_l172_c8_38d6_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_e524_eth_8_h_l172_c8_38d6_return_output;
     VAR_state_MUX_eth_8_h_l130_c5_1846_iftrue := VAR_state_MUX_eth_8_h_l136_c7_5084_return_output;
     VAR_state_MUX_eth_8_h_l146_c9_6103_iftrue := VAR_state_MUX_eth_8_h_l149_c5_bb32_return_output;
     VAR_state_MUX_eth_8_h_l158_c9_d80e_iftrue := VAR_state_MUX_eth_8_h_l161_c5_c771_return_output;
     VAR_state_MUX_eth_8_h_l179_c5_a045_iftrue := VAR_state_MUX_eth_8_h_l180_c7_4857_return_output;
     VAR_state_MUX_eth_8_h_l199_c5_b162_iftrue := VAR_state_MUX_eth_8_h_l201_c7_158f_return_output;
     -- counter_MUX[eth_8_h_l130_c5_1846] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l130_c5_1846_cond <= VAR_counter_MUX_eth_8_h_l130_c5_1846_cond;
     counter_MUX_eth_8_h_l130_c5_1846_iftrue <= VAR_counter_MUX_eth_8_h_l130_c5_1846_iftrue;
     counter_MUX_eth_8_h_l130_c5_1846_iffalse <= VAR_counter_MUX_eth_8_h_l130_c5_1846_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l130_c5_1846_return_output := counter_MUX_eth_8_h_l130_c5_1846_return_output;

     -- uint48_47_40[eth_8_h_l135_c34_2236] LATENCY=0
     VAR_uint48_47_40_eth_8_h_l135_c34_2236_return_output := uint48_47_40(
     VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l136_l135_l137_DUPLICATE_04d7_return_output);

     -- BIN_OP_PLUS[eth_8_h_l190_c9_5f8a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l190_c9_5f8a_left <= VAR_BIN_OP_PLUS_eth_8_h_l190_c9_5f8a_left;
     BIN_OP_PLUS_eth_8_h_l190_c9_5f8a_right <= VAR_BIN_OP_PLUS_eth_8_h_l190_c9_5f8a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l190_c9_5f8a_return_output := BIN_OP_PLUS_eth_8_h_l190_c9_5f8a_return_output;

     -- CONST_SL_8[eth_8_h_l137_c26_de6d] LATENCY=0
     -- Inputs
     CONST_SL_8_eth_8_h_l137_c26_de6d_x <= VAR_CONST_SL_8_eth_8_h_l137_c26_de6d_x;
     -- Outputs
     VAR_CONST_SL_8_eth_8_h_l137_c26_de6d_return_output := CONST_SL_8_eth_8_h_l137_c26_de6d_return_output;

     -- o_FALSE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_eef4[eth_8_h_l172_c8_38d6] LATENCY=0
     VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_eef4_eth_8_h_l172_c8_38d6_return_output := CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_eef4(
     to_unsigned(1, 1),
     to_unsigned(0, 1),
     VAR_o_mac_axis_data_tlast_MUX_eth_8_h_l195_c8_3c8b_return_output,
     VAR_o_mac_axis_valid_MUX_eth_8_h_l195_c8_3c8b_return_output,
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l195_c8_3c8b_return_output);

     -- header_ethertype_MUX[eth_8_h_l158_c9_d80e] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l158_c9_d80e_cond <= VAR_header_ethertype_MUX_eth_8_h_l158_c9_d80e_cond;
     header_ethertype_MUX_eth_8_h_l158_c9_d80e_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l158_c9_d80e_iftrue;
     header_ethertype_MUX_eth_8_h_l158_c9_d80e_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l158_c9_d80e_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l158_c9_d80e_return_output := header_ethertype_MUX_eth_8_h_l158_c9_d80e_return_output;

     -- counter_MUX[eth_8_h_l199_c5_b162] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l199_c5_b162_cond <= VAR_counter_MUX_eth_8_h_l199_c5_b162_cond;
     counter_MUX_eth_8_h_l199_c5_b162_iftrue <= VAR_counter_MUX_eth_8_h_l199_c5_b162_iftrue;
     counter_MUX_eth_8_h_l199_c5_b162_iffalse <= VAR_counter_MUX_eth_8_h_l199_c5_b162_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l199_c5_b162_return_output := counter_MUX_eth_8_h_l199_c5_b162_return_output;

     -- header_src_mac_MUX[eth_8_h_l146_c9_6103] LATENCY=0
     -- Inputs
     header_src_mac_MUX_eth_8_h_l146_c9_6103_cond <= VAR_header_src_mac_MUX_eth_8_h_l146_c9_6103_cond;
     header_src_mac_MUX_eth_8_h_l146_c9_6103_iftrue <= VAR_header_src_mac_MUX_eth_8_h_l146_c9_6103_iftrue;
     header_src_mac_MUX_eth_8_h_l146_c9_6103_iffalse <= VAR_header_src_mac_MUX_eth_8_h_l146_c9_6103_iffalse;
     -- Outputs
     VAR_header_src_mac_MUX_eth_8_h_l146_c9_6103_return_output := header_src_mac_MUX_eth_8_h_l146_c9_6103_return_output;

     -- state_MUX[eth_8_h_l199_c5_b162] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l199_c5_b162_cond <= VAR_state_MUX_eth_8_h_l199_c5_b162_cond;
     state_MUX_eth_8_h_l199_c5_b162_iftrue <= VAR_state_MUX_eth_8_h_l199_c5_b162_iftrue;
     state_MUX_eth_8_h_l199_c5_b162_iffalse <= VAR_state_MUX_eth_8_h_l199_c5_b162_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l199_c5_b162_return_output := state_MUX_eth_8_h_l199_c5_b162_return_output;

     -- state_MUX[eth_8_h_l179_c5_a045] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l179_c5_a045_cond <= VAR_state_MUX_eth_8_h_l179_c5_a045_cond;
     state_MUX_eth_8_h_l179_c5_a045_iftrue <= VAR_state_MUX_eth_8_h_l179_c5_a045_iftrue;
     state_MUX_eth_8_h_l179_c5_a045_iffalse <= VAR_state_MUX_eth_8_h_l179_c5_a045_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l179_c5_a045_return_output := state_MUX_eth_8_h_l179_c5_a045_return_output;

     -- state_MUX[eth_8_h_l130_c5_1846] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l130_c5_1846_cond <= VAR_state_MUX_eth_8_h_l130_c5_1846_cond;
     state_MUX_eth_8_h_l130_c5_1846_iftrue <= VAR_state_MUX_eth_8_h_l130_c5_1846_iftrue;
     state_MUX_eth_8_h_l130_c5_1846_iffalse <= VAR_state_MUX_eth_8_h_l130_c5_1846_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l130_c5_1846_return_output := state_MUX_eth_8_h_l130_c5_1846_return_output;

     -- Submodule level 4
     VAR_counter_eth_8_h_l190_c9_36b7 := resize(VAR_BIN_OP_PLUS_eth_8_h_l190_c9_5f8a_return_output, 6);
     VAR_header_dst_mac_MUX_eth_8_h_l136_c7_5084_iftrue := VAR_CONST_SL_8_eth_8_h_l137_c26_de6d_return_output;
     VAR_counter_MUX_eth_8_h_l128_c3_f71d_iftrue := VAR_counter_MUX_eth_8_h_l130_c5_1846_return_output;
     VAR_counter_MUX_eth_8_h_l195_c8_3c8b_iftrue := VAR_counter_MUX_eth_8_h_l199_c5_b162_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l146_c9_6103_iffalse := VAR_header_ethertype_MUX_eth_8_h_l158_c9_d80e_return_output;
     VAR_o_MUX_eth_8_h_l172_c8_38d6_iffalse := VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_eef4_eth_8_h_l172_c8_38d6_return_output;
     VAR_state_MUX_eth_8_h_l128_c3_f71d_iftrue := VAR_state_MUX_eth_8_h_l130_c5_1846_return_output;
     VAR_state_MUX_eth_8_h_l172_c8_38d6_iftrue := VAR_state_MUX_eth_8_h_l179_c5_a045_return_output;
     VAR_state_MUX_eth_8_h_l195_c8_3c8b_iftrue := VAR_state_MUX_eth_8_h_l199_c5_b162_return_output;
     VAR_counter_MUX_eth_8_h_l189_c7_29e5_iftrue := VAR_counter_eth_8_h_l190_c9_36b7;
     -- header_ethertype_MUX[eth_8_h_l146_c9_6103] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l146_c9_6103_cond <= VAR_header_ethertype_MUX_eth_8_h_l146_c9_6103_cond;
     header_ethertype_MUX_eth_8_h_l146_c9_6103_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l146_c9_6103_iftrue;
     header_ethertype_MUX_eth_8_h_l146_c9_6103_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l146_c9_6103_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l146_c9_6103_return_output := header_ethertype_MUX_eth_8_h_l146_c9_6103_return_output;

     -- o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3[eth_8_h_l130_c5_1846] LATENCY=0
     VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l130_c5_1846_return_output := CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3(
     VAR_uint48_47_40_eth_8_h_l135_c34_2236_return_output);

     -- counter_MUX[eth_8_h_l195_c8_3c8b] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l195_c8_3c8b_cond <= VAR_counter_MUX_eth_8_h_l195_c8_3c8b_cond;
     counter_MUX_eth_8_h_l195_c8_3c8b_iftrue <= VAR_counter_MUX_eth_8_h_l195_c8_3c8b_iftrue;
     counter_MUX_eth_8_h_l195_c8_3c8b_iffalse <= VAR_counter_MUX_eth_8_h_l195_c8_3c8b_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l195_c8_3c8b_return_output := counter_MUX_eth_8_h_l195_c8_3c8b_return_output;

     -- state_MUX[eth_8_h_l195_c8_3c8b] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l195_c8_3c8b_cond <= VAR_state_MUX_eth_8_h_l195_c8_3c8b_cond;
     state_MUX_eth_8_h_l195_c8_3c8b_iftrue <= VAR_state_MUX_eth_8_h_l195_c8_3c8b_iftrue;
     state_MUX_eth_8_h_l195_c8_3c8b_iffalse <= VAR_state_MUX_eth_8_h_l195_c8_3c8b_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l195_c8_3c8b_return_output := state_MUX_eth_8_h_l195_c8_3c8b_return_output;

     -- counter_MUX[eth_8_h_l189_c7_29e5] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l189_c7_29e5_cond <= VAR_counter_MUX_eth_8_h_l189_c7_29e5_cond;
     counter_MUX_eth_8_h_l189_c7_29e5_iftrue <= VAR_counter_MUX_eth_8_h_l189_c7_29e5_iftrue;
     counter_MUX_eth_8_h_l189_c7_29e5_iffalse <= VAR_counter_MUX_eth_8_h_l189_c7_29e5_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l189_c7_29e5_return_output := counter_MUX_eth_8_h_l189_c7_29e5_return_output;

     -- header_dst_mac_MUX[eth_8_h_l136_c7_5084] LATENCY=0
     -- Inputs
     header_dst_mac_MUX_eth_8_h_l136_c7_5084_cond <= VAR_header_dst_mac_MUX_eth_8_h_l136_c7_5084_cond;
     header_dst_mac_MUX_eth_8_h_l136_c7_5084_iftrue <= VAR_header_dst_mac_MUX_eth_8_h_l136_c7_5084_iftrue;
     header_dst_mac_MUX_eth_8_h_l136_c7_5084_iffalse <= VAR_header_dst_mac_MUX_eth_8_h_l136_c7_5084_iffalse;
     -- Outputs
     VAR_header_dst_mac_MUX_eth_8_h_l136_c7_5084_return_output := header_dst_mac_MUX_eth_8_h_l136_c7_5084_return_output;

     -- o_MUX[eth_8_h_l172_c8_38d6] LATENCY=0
     -- Inputs
     o_MUX_eth_8_h_l172_c8_38d6_cond <= VAR_o_MUX_eth_8_h_l172_c8_38d6_cond;
     o_MUX_eth_8_h_l172_c8_38d6_iftrue <= VAR_o_MUX_eth_8_h_l172_c8_38d6_iftrue;
     o_MUX_eth_8_h_l172_c8_38d6_iffalse <= VAR_o_MUX_eth_8_h_l172_c8_38d6_iffalse;
     -- Outputs
     VAR_o_MUX_eth_8_h_l172_c8_38d6_return_output := o_MUX_eth_8_h_l172_c8_38d6_return_output;

     -- Submodule level 5
     VAR_counter_MUX_eth_8_h_l179_c5_a045_iftrue := VAR_counter_MUX_eth_8_h_l189_c7_29e5_return_output;
     VAR_counter_MUX_eth_8_h_l172_c8_38d6_iffalse := VAR_counter_MUX_eth_8_h_l195_c8_3c8b_return_output;
     VAR_o_MUX_eth_8_h_l158_c9_d80e_iffalse := VAR_o_MUX_eth_8_h_l172_c8_38d6_return_output;
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_iftrue := VAR_o_mac_axis_data_tdata_TRUE_INPUT_MUX_CONST_REF_RD_uint8_t_1_eth_8_tx_t_mac_axis_data_tdata_37d3_eth_8_h_l130_c5_1846_return_output;
     VAR_state_MUX_eth_8_h_l172_c8_38d6_iffalse := VAR_state_MUX_eth_8_h_l195_c8_3c8b_return_output;
     -- o_MUX[eth_8_h_l158_c9_d80e] LATENCY=0
     -- Inputs
     o_MUX_eth_8_h_l158_c9_d80e_cond <= VAR_o_MUX_eth_8_h_l158_c9_d80e_cond;
     o_MUX_eth_8_h_l158_c9_d80e_iftrue <= VAR_o_MUX_eth_8_h_l158_c9_d80e_iftrue;
     o_MUX_eth_8_h_l158_c9_d80e_iffalse <= VAR_o_MUX_eth_8_h_l158_c9_d80e_iffalse;
     -- Outputs
     VAR_o_MUX_eth_8_h_l158_c9_d80e_return_output := o_MUX_eth_8_h_l158_c9_d80e_return_output;

     -- state_MUX[eth_8_h_l172_c8_38d6] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l172_c8_38d6_cond <= VAR_state_MUX_eth_8_h_l172_c8_38d6_cond;
     state_MUX_eth_8_h_l172_c8_38d6_iftrue <= VAR_state_MUX_eth_8_h_l172_c8_38d6_iftrue;
     state_MUX_eth_8_h_l172_c8_38d6_iffalse <= VAR_state_MUX_eth_8_h_l172_c8_38d6_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l172_c8_38d6_return_output := state_MUX_eth_8_h_l172_c8_38d6_return_output;

     -- o_mac_axis_data_tdata_MUX[eth_8_h_l130_c5_1846] LATENCY=0
     -- Inputs
     o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_cond <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_cond;
     o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_iftrue <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_iftrue;
     o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_iffalse <= VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_iffalse;
     -- Outputs
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_return_output := o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_return_output;

     -- counter_MUX[eth_8_h_l179_c5_a045] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l179_c5_a045_cond <= VAR_counter_MUX_eth_8_h_l179_c5_a045_cond;
     counter_MUX_eth_8_h_l179_c5_a045_iftrue <= VAR_counter_MUX_eth_8_h_l179_c5_a045_iftrue;
     counter_MUX_eth_8_h_l179_c5_a045_iffalse <= VAR_counter_MUX_eth_8_h_l179_c5_a045_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l179_c5_a045_return_output := counter_MUX_eth_8_h_l179_c5_a045_return_output;

     -- header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_488d[eth_8_h_l128_c3_f71d] LATENCY=0
     VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_488d_eth_8_h_l128_c3_f71d_return_output := CONST_REF_RD_eth_header_t_eth_header_t_488d(
     header,
     VAR_header_src_mac_MUX_eth_8_h_l146_c9_6103_return_output,
     VAR_header_ethertype_MUX_eth_8_h_l146_c9_6103_return_output);

     -- header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484[eth_8_h_l130_c5_1846] LATENCY=0
     VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l130_c5_1846_return_output := CONST_REF_RD_eth_header_t_eth_header_t_e484(
     VAR_header_MUX_eth_8_h_l131_c7_735e_return_output,
     VAR_header_dst_mac_MUX_eth_8_h_l136_c7_5084_return_output);

     -- Submodule level 6
     VAR_counter_MUX_eth_8_h_l172_c8_38d6_iftrue := VAR_counter_MUX_eth_8_h_l179_c5_a045_return_output;
     VAR_header_MUX_eth_8_h_l128_c3_f71d_iffalse := VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_488d_eth_8_h_l128_c3_f71d_return_output;
     VAR_header_MUX_eth_8_h_l130_c5_1846_iftrue := VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l130_c5_1846_return_output;
     VAR_o_MUX_eth_8_h_l146_c9_6103_iffalse := VAR_o_MUX_eth_8_h_l158_c9_d80e_return_output;
     VAR_state_MUX_eth_8_h_l158_c9_d80e_iffalse := VAR_state_MUX_eth_8_h_l172_c8_38d6_return_output;
     -- header_MUX[eth_8_h_l130_c5_1846] LATENCY=0
     -- Inputs
     header_MUX_eth_8_h_l130_c5_1846_cond <= VAR_header_MUX_eth_8_h_l130_c5_1846_cond;
     header_MUX_eth_8_h_l130_c5_1846_iftrue <= VAR_header_MUX_eth_8_h_l130_c5_1846_iftrue;
     header_MUX_eth_8_h_l130_c5_1846_iffalse <= VAR_header_MUX_eth_8_h_l130_c5_1846_iffalse;
     -- Outputs
     VAR_header_MUX_eth_8_h_l130_c5_1846_return_output := header_MUX_eth_8_h_l130_c5_1846_return_output;

     -- counter_MUX[eth_8_h_l172_c8_38d6] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l172_c8_38d6_cond <= VAR_counter_MUX_eth_8_h_l172_c8_38d6_cond;
     counter_MUX_eth_8_h_l172_c8_38d6_iftrue <= VAR_counter_MUX_eth_8_h_l172_c8_38d6_iftrue;
     counter_MUX_eth_8_h_l172_c8_38d6_iffalse <= VAR_counter_MUX_eth_8_h_l172_c8_38d6_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l172_c8_38d6_return_output := counter_MUX_eth_8_h_l172_c8_38d6_return_output;

     -- o_MUX[eth_8_h_l146_c9_6103] LATENCY=0
     -- Inputs
     o_MUX_eth_8_h_l146_c9_6103_cond <= VAR_o_MUX_eth_8_h_l146_c9_6103_cond;
     o_MUX_eth_8_h_l146_c9_6103_iftrue <= VAR_o_MUX_eth_8_h_l146_c9_6103_iftrue;
     o_MUX_eth_8_h_l146_c9_6103_iffalse <= VAR_o_MUX_eth_8_h_l146_c9_6103_iffalse;
     -- Outputs
     VAR_o_MUX_eth_8_h_l146_c9_6103_return_output := o_MUX_eth_8_h_l146_c9_6103_return_output;

     -- state_MUX[eth_8_h_l158_c9_d80e] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l158_c9_d80e_cond <= VAR_state_MUX_eth_8_h_l158_c9_d80e_cond;
     state_MUX_eth_8_h_l158_c9_d80e_iftrue <= VAR_state_MUX_eth_8_h_l158_c9_d80e_iftrue;
     state_MUX_eth_8_h_l158_c9_d80e_iffalse <= VAR_state_MUX_eth_8_h_l158_c9_d80e_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l158_c9_d80e_return_output := state_MUX_eth_8_h_l158_c9_d80e_return_output;

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856[eth_8_h_l128_c3_f71d] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856_eth_8_h_l128_c3_f71d_return_output := CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856(
     eth_8_tx_t_NULL,
     to_unsigned(1, 1),
     to_unsigned(0, 1),
     VAR_o_mac_axis_valid_MUX_eth_8_h_l130_c5_1846_return_output,
     VAR_o_mac_axis_data_tdata_MUX_eth_8_h_l130_c5_1846_return_output);

     -- Submodule level 7
     VAR_counter_MUX_eth_8_h_l158_c9_d80e_iffalse := VAR_counter_MUX_eth_8_h_l172_c8_38d6_return_output;
     VAR_header_MUX_eth_8_h_l128_c3_f71d_iftrue := VAR_header_MUX_eth_8_h_l130_c5_1846_return_output;
     VAR_o_MUX_eth_8_h_l128_c3_f71d_iffalse := VAR_o_MUX_eth_8_h_l146_c9_6103_return_output;
     VAR_o_MUX_eth_8_h_l128_c3_f71d_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_eth_8_tx_t_eth_8_tx_t_4856_eth_8_h_l128_c3_f71d_return_output;
     VAR_state_MUX_eth_8_h_l146_c9_6103_iffalse := VAR_state_MUX_eth_8_h_l158_c9_d80e_return_output;
     -- counter_MUX[eth_8_h_l158_c9_d80e] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l158_c9_d80e_cond <= VAR_counter_MUX_eth_8_h_l158_c9_d80e_cond;
     counter_MUX_eth_8_h_l158_c9_d80e_iftrue <= VAR_counter_MUX_eth_8_h_l158_c9_d80e_iftrue;
     counter_MUX_eth_8_h_l158_c9_d80e_iffalse <= VAR_counter_MUX_eth_8_h_l158_c9_d80e_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l158_c9_d80e_return_output := counter_MUX_eth_8_h_l158_c9_d80e_return_output;

     -- state_MUX[eth_8_h_l146_c9_6103] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l146_c9_6103_cond <= VAR_state_MUX_eth_8_h_l146_c9_6103_cond;
     state_MUX_eth_8_h_l146_c9_6103_iftrue <= VAR_state_MUX_eth_8_h_l146_c9_6103_iftrue;
     state_MUX_eth_8_h_l146_c9_6103_iffalse <= VAR_state_MUX_eth_8_h_l146_c9_6103_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l146_c9_6103_return_output := state_MUX_eth_8_h_l146_c9_6103_return_output;

     -- o_MUX[eth_8_h_l128_c3_f71d] LATENCY=0
     -- Inputs
     o_MUX_eth_8_h_l128_c3_f71d_cond <= VAR_o_MUX_eth_8_h_l128_c3_f71d_cond;
     o_MUX_eth_8_h_l128_c3_f71d_iftrue <= VAR_o_MUX_eth_8_h_l128_c3_f71d_iftrue;
     o_MUX_eth_8_h_l128_c3_f71d_iffalse <= VAR_o_MUX_eth_8_h_l128_c3_f71d_iffalse;
     -- Outputs
     VAR_o_MUX_eth_8_h_l128_c3_f71d_return_output := o_MUX_eth_8_h_l128_c3_f71d_return_output;

     -- header_MUX[eth_8_h_l128_c3_f71d] LATENCY=0
     -- Inputs
     header_MUX_eth_8_h_l128_c3_f71d_cond <= VAR_header_MUX_eth_8_h_l128_c3_f71d_cond;
     header_MUX_eth_8_h_l128_c3_f71d_iftrue <= VAR_header_MUX_eth_8_h_l128_c3_f71d_iftrue;
     header_MUX_eth_8_h_l128_c3_f71d_iffalse <= VAR_header_MUX_eth_8_h_l128_c3_f71d_iffalse;
     -- Outputs
     VAR_header_MUX_eth_8_h_l128_c3_f71d_return_output := header_MUX_eth_8_h_l128_c3_f71d_return_output;

     -- Submodule level 8
     VAR_counter_MUX_eth_8_h_l146_c9_6103_iffalse := VAR_counter_MUX_eth_8_h_l158_c9_d80e_return_output;
     REG_VAR_header := VAR_header_MUX_eth_8_h_l128_c3_f71d_return_output;
     VAR_return_output := VAR_o_MUX_eth_8_h_l128_c3_f71d_return_output;
     VAR_state_MUX_eth_8_h_l128_c3_f71d_iffalse := VAR_state_MUX_eth_8_h_l146_c9_6103_return_output;
     -- counter_MUX[eth_8_h_l146_c9_6103] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l146_c9_6103_cond <= VAR_counter_MUX_eth_8_h_l146_c9_6103_cond;
     counter_MUX_eth_8_h_l146_c9_6103_iftrue <= VAR_counter_MUX_eth_8_h_l146_c9_6103_iftrue;
     counter_MUX_eth_8_h_l146_c9_6103_iffalse <= VAR_counter_MUX_eth_8_h_l146_c9_6103_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l146_c9_6103_return_output := counter_MUX_eth_8_h_l146_c9_6103_return_output;

     -- state_MUX[eth_8_h_l128_c3_f71d] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l128_c3_f71d_cond <= VAR_state_MUX_eth_8_h_l128_c3_f71d_cond;
     state_MUX_eth_8_h_l128_c3_f71d_iftrue <= VAR_state_MUX_eth_8_h_l128_c3_f71d_iftrue;
     state_MUX_eth_8_h_l128_c3_f71d_iffalse <= VAR_state_MUX_eth_8_h_l128_c3_f71d_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l128_c3_f71d_return_output := state_MUX_eth_8_h_l128_c3_f71d_return_output;

     -- Submodule level 9
     VAR_counter_MUX_eth_8_h_l128_c3_f71d_iffalse := VAR_counter_MUX_eth_8_h_l146_c9_6103_return_output;
     REG_VAR_state := VAR_state_MUX_eth_8_h_l128_c3_f71d_return_output;
     -- counter_MUX[eth_8_h_l128_c3_f71d] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l128_c3_f71d_cond <= VAR_counter_MUX_eth_8_h_l128_c3_f71d_cond;
     counter_MUX_eth_8_h_l128_c3_f71d_iftrue <= VAR_counter_MUX_eth_8_h_l128_c3_f71d_iftrue;
     counter_MUX_eth_8_h_l128_c3_f71d_iffalse <= VAR_counter_MUX_eth_8_h_l128_c3_f71d_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l128_c3_f71d_return_output := counter_MUX_eth_8_h_l128_c3_f71d_return_output;

     -- Submodule level 10
     REG_VAR_counter := VAR_counter_MUX_eth_8_h_l128_c3_f71d_return_output;
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
