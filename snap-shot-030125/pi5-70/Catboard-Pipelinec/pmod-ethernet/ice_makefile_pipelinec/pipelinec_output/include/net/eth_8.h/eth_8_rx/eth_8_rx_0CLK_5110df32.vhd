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
-- Submodules: 69
entity eth_8_rx_0CLK_5110df32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 mac_axis : in axis8_t_stream_t;
 frame_ready : in unsigned(0 downto 0);
 return_output : out eth_8_rx_t);
end eth_8_rx_0CLK_5110df32;
architecture arch of eth_8_rx_0CLK_5110df32 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal state : unsigned(2 downto 0) := unsigned(eth8_state_t_to_slv(eth8_state_t'left));
signal header : eth_header_t := eth_header_t_NULL;
signal counter : unsigned(2 downto 0) := to_unsigned(0, 3);
signal REG_COMB_state : unsigned(2 downto 0);
signal REG_COMB_header : eth_header_t;
signal REG_COMB_counter : unsigned(2 downto 0);

-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Each function instance gets signals
-- BIN_OP_EQ[eth_8_h_l51_c6_4d4d]
signal BIN_OP_EQ_eth_8_h_l51_c6_4d4d_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l51_c6_4d4d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l51_c6_4d4d_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l51_c3_8b25]
signal counter_MUX_eth_8_h_l51_c3_8b25_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l51_c3_8b25_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l51_c3_8b25_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l51_c3_8b25_return_output : unsigned(2 downto 0);

-- o_frame_data_payload_MUX[eth_8_h_l51_c3_8b25]
signal o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_cond : unsigned(0 downto 0);
signal o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_iftrue : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_iffalse : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_return_output : axis8_t;

-- o_overflow_MUX[eth_8_h_l51_c3_8b25]
signal o_overflow_MUX_eth_8_h_l51_c3_8b25_cond : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l51_c3_8b25_iftrue : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l51_c3_8b25_iffalse : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l51_c3_8b25_return_output : unsigned(0 downto 0);

-- o_frame_valid_MUX[eth_8_h_l51_c3_8b25]
signal o_frame_valid_MUX_eth_8_h_l51_c3_8b25_cond : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l51_c3_8b25_iftrue : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l51_c3_8b25_iffalse : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l51_c3_8b25_return_output : unsigned(0 downto 0);

-- o_frame_data_start_of_payload_MUX[eth_8_h_l51_c3_8b25]
signal o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_cond : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_iftrue : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_iffalse : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_return_output : unsigned(0 downto 0);

-- header_MUX[eth_8_h_l51_c3_8b25]
signal header_MUX_eth_8_h_l51_c3_8b25_cond : unsigned(0 downto 0);
signal header_MUX_eth_8_h_l51_c3_8b25_iftrue : eth_header_t;
signal header_MUX_eth_8_h_l51_c3_8b25_iffalse : eth_header_t;
signal header_MUX_eth_8_h_l51_c3_8b25_return_output : eth_header_t;

-- state_MUX[eth_8_h_l51_c3_8b25]
signal state_MUX_eth_8_h_l51_c3_8b25_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l51_c3_8b25_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l51_c3_8b25_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l51_c3_8b25_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l52_c5_c5f0]
signal counter_MUX_eth_8_h_l52_c5_c5f0_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l52_c5_c5f0_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l52_c5_c5f0_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l52_c5_c5f0_return_output : unsigned(2 downto 0);

-- header_dst_mac_MUX[eth_8_h_l52_c5_c5f0]
signal header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_cond : unsigned(0 downto 0);
signal header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_iftrue : unsigned(47 downto 0);
signal header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_iffalse : unsigned(47 downto 0);
signal header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_return_output : unsigned(47 downto 0);

-- state_MUX[eth_8_h_l52_c5_c5f0]
signal state_MUX_eth_8_h_l52_c5_c5f0_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l52_c5_c5f0_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l52_c5_c5f0_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l52_c5_c5f0_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[eth_8_h_l54_c10_f93b]
signal BIN_OP_EQ_eth_8_h_l54_c10_f93b_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l54_c10_f93b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l54_c10_f93b_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l54_c7_7c67]
signal counter_MUX_eth_8_h_l54_c7_7c67_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l54_c7_7c67_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l54_c7_7c67_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l54_c7_7c67_return_output : unsigned(2 downto 0);

-- state_MUX[eth_8_h_l54_c7_7c67]
signal state_MUX_eth_8_h_l54_c7_7c67_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l54_c7_7c67_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l54_c7_7c67_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l54_c7_7c67_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l58_c9_e33e]
signal BIN_OP_PLUS_eth_8_h_l58_c9_e33e_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_eth_8_h_l58_c9_e33e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l58_c9_e33e_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[eth_8_h_l61_c12_a153]
signal BIN_OP_EQ_eth_8_h_l61_c12_a153_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l61_c12_a153_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l61_c12_a153_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l61_c9_590e]
signal counter_MUX_eth_8_h_l61_c9_590e_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l61_c9_590e_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l61_c9_590e_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l61_c9_590e_return_output : unsigned(2 downto 0);

-- o_frame_data_payload_MUX[eth_8_h_l61_c9_590e]
signal o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_cond : unsigned(0 downto 0);
signal o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_iftrue : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_iffalse : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_return_output : axis8_t;

-- o_overflow_MUX[eth_8_h_l61_c9_590e]
signal o_overflow_MUX_eth_8_h_l61_c9_590e_cond : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l61_c9_590e_iftrue : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l61_c9_590e_iffalse : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l61_c9_590e_return_output : unsigned(0 downto 0);

-- o_frame_valid_MUX[eth_8_h_l61_c9_590e]
signal o_frame_valid_MUX_eth_8_h_l61_c9_590e_cond : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l61_c9_590e_iftrue : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l61_c9_590e_iffalse : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l61_c9_590e_return_output : unsigned(0 downto 0);

-- o_frame_data_start_of_payload_MUX[eth_8_h_l61_c9_590e]
signal o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_cond : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_iftrue : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_iffalse : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_return_output : unsigned(0 downto 0);

-- header_src_mac_MUX[eth_8_h_l61_c9_590e]
signal header_src_mac_MUX_eth_8_h_l61_c9_590e_cond : unsigned(0 downto 0);
signal header_src_mac_MUX_eth_8_h_l61_c9_590e_iftrue : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l61_c9_590e_iffalse : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l61_c9_590e_return_output : unsigned(47 downto 0);

-- header_ethertype_MUX[eth_8_h_l61_c9_590e]
signal header_ethertype_MUX_eth_8_h_l61_c9_590e_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l61_c9_590e_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l61_c9_590e_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l61_c9_590e_return_output : unsigned(15 downto 0);

-- state_MUX[eth_8_h_l61_c9_590e]
signal state_MUX_eth_8_h_l61_c9_590e_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l61_c9_590e_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l61_c9_590e_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l61_c9_590e_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l62_c5_a3da]
signal counter_MUX_eth_8_h_l62_c5_a3da_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l62_c5_a3da_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l62_c5_a3da_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l62_c5_a3da_return_output : unsigned(2 downto 0);

-- header_src_mac_MUX[eth_8_h_l62_c5_a3da]
signal header_src_mac_MUX_eth_8_h_l62_c5_a3da_cond : unsigned(0 downto 0);
signal header_src_mac_MUX_eth_8_h_l62_c5_a3da_iftrue : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l62_c5_a3da_iffalse : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l62_c5_a3da_return_output : unsigned(47 downto 0);

-- state_MUX[eth_8_h_l62_c5_a3da]
signal state_MUX_eth_8_h_l62_c5_a3da_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l62_c5_a3da_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l62_c5_a3da_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l62_c5_a3da_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[eth_8_h_l64_c10_d6f6]
signal BIN_OP_EQ_eth_8_h_l64_c10_d6f6_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l64_c10_d6f6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l64_c10_d6f6_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l64_c7_fec9]
signal counter_MUX_eth_8_h_l64_c7_fec9_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l64_c7_fec9_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l64_c7_fec9_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l64_c7_fec9_return_output : unsigned(2 downto 0);

-- state_MUX[eth_8_h_l64_c7_fec9]
signal state_MUX_eth_8_h_l64_c7_fec9_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l64_c7_fec9_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l64_c7_fec9_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l64_c7_fec9_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l68_c9_36ea]
signal BIN_OP_PLUS_eth_8_h_l68_c9_36ea_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_eth_8_h_l68_c9_36ea_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l68_c9_36ea_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[eth_8_h_l71_c12_d8bd]
signal BIN_OP_EQ_eth_8_h_l71_c12_d8bd_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l71_c12_d8bd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l71_c12_d8bd_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l71_c9_bf81]
signal counter_MUX_eth_8_h_l71_c9_bf81_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l71_c9_bf81_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l71_c9_bf81_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l71_c9_bf81_return_output : unsigned(2 downto 0);

-- o_frame_data_payload_MUX[eth_8_h_l71_c9_bf81]
signal o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_cond : unsigned(0 downto 0);
signal o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_iftrue : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_iffalse : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_return_output : axis8_t;

-- o_overflow_MUX[eth_8_h_l71_c9_bf81]
signal o_overflow_MUX_eth_8_h_l71_c9_bf81_cond : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l71_c9_bf81_iftrue : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l71_c9_bf81_iffalse : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l71_c9_bf81_return_output : unsigned(0 downto 0);

-- o_frame_valid_MUX[eth_8_h_l71_c9_bf81]
signal o_frame_valid_MUX_eth_8_h_l71_c9_bf81_cond : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l71_c9_bf81_iftrue : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l71_c9_bf81_iffalse : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l71_c9_bf81_return_output : unsigned(0 downto 0);

-- o_frame_data_start_of_payload_MUX[eth_8_h_l71_c9_bf81]
signal o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_cond : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_iftrue : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_iffalse : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_return_output : unsigned(0 downto 0);

-- header_ethertype_MUX[eth_8_h_l71_c9_bf81]
signal header_ethertype_MUX_eth_8_h_l71_c9_bf81_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l71_c9_bf81_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l71_c9_bf81_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l71_c9_bf81_return_output : unsigned(15 downto 0);

-- state_MUX[eth_8_h_l71_c9_bf81]
signal state_MUX_eth_8_h_l71_c9_bf81_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l71_c9_bf81_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l71_c9_bf81_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l71_c9_bf81_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l72_c5_7cf3]
signal counter_MUX_eth_8_h_l72_c5_7cf3_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l72_c5_7cf3_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l72_c5_7cf3_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l72_c5_7cf3_return_output : unsigned(2 downto 0);

-- header_ethertype_MUX[eth_8_h_l72_c5_7cf3]
signal header_ethertype_MUX_eth_8_h_l72_c5_7cf3_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l72_c5_7cf3_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l72_c5_7cf3_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l72_c5_7cf3_return_output : unsigned(15 downto 0);

-- state_MUX[eth_8_h_l72_c5_7cf3]
signal state_MUX_eth_8_h_l72_c5_7cf3_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l72_c5_7cf3_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l72_c5_7cf3_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l72_c5_7cf3_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[eth_8_h_l74_c10_e95f]
signal BIN_OP_EQ_eth_8_h_l74_c10_e95f_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l74_c10_e95f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_eth_8_h_l74_c10_e95f_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l74_c7_faeb]
signal counter_MUX_eth_8_h_l74_c7_faeb_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l74_c7_faeb_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l74_c7_faeb_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l74_c7_faeb_return_output : unsigned(2 downto 0);

-- state_MUX[eth_8_h_l74_c7_faeb]
signal state_MUX_eth_8_h_l74_c7_faeb_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l74_c7_faeb_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l74_c7_faeb_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l74_c7_faeb_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l78_c9_7dc8]
signal BIN_OP_PLUS_eth_8_h_l78_c9_7dc8_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_eth_8_h_l78_c9_7dc8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l78_c9_7dc8_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[eth_8_h_l83_c11_85c6]
signal BIN_OP_EQ_eth_8_h_l83_c11_85c6_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l83_c11_85c6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l83_c11_85c6_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l83_c8_1dd8]
signal counter_MUX_eth_8_h_l83_c8_1dd8_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l83_c8_1dd8_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l83_c8_1dd8_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l83_c8_1dd8_return_output : unsigned(2 downto 0);

-- o_frame_data_payload_MUX[eth_8_h_l83_c8_1dd8]
signal o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_cond : unsigned(0 downto 0);
signal o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_iftrue : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_iffalse : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_return_output : axis8_t;

-- o_overflow_MUX[eth_8_h_l83_c8_1dd8]
signal o_overflow_MUX_eth_8_h_l83_c8_1dd8_cond : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l83_c8_1dd8_iftrue : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l83_c8_1dd8_iffalse : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l83_c8_1dd8_return_output : unsigned(0 downto 0);

-- o_frame_valid_MUX[eth_8_h_l83_c8_1dd8]
signal o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_cond : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_iftrue : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_iffalse : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_return_output : unsigned(0 downto 0);

-- o_frame_data_start_of_payload_MUX[eth_8_h_l83_c8_1dd8]
signal o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_cond : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_iftrue : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_iffalse : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l83_c8_1dd8]
signal state_MUX_eth_8_h_l83_c8_1dd8_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l83_c8_1dd8_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l83_c8_1dd8_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l83_c8_1dd8_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[eth_8_h_l86_c37_5933]
signal BIN_OP_EQ_eth_8_h_l86_c37_5933_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l86_c37_5933_right : unsigned(0 downto 0);
signal BIN_OP_EQ_eth_8_h_l86_c37_5933_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[eth_8_h_l89_c35_769b]
signal UNARY_OP_NOT_eth_8_h_l89_c35_769b_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_eth_8_h_l89_c35_769b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[eth_8_h_l89_c18_f0b2]
signal BIN_OP_AND_eth_8_h_l89_c18_f0b2_left : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l89_c18_f0b2_right : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l89_c18_f0b2_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l90_c5_9391]
signal counter_MUX_eth_8_h_l90_c5_9391_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l90_c5_9391_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l90_c5_9391_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l90_c5_9391_return_output : unsigned(2 downto 0);

-- state_MUX[eth_8_h_l90_c5_9391]
signal state_MUX_eth_8_h_l90_c5_9391_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l90_c5_9391_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l90_c5_9391_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l90_c5_9391_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l91_c7_8a69]
signal counter_MUX_eth_8_h_l91_c7_8a69_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l91_c7_8a69_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l91_c7_8a69_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l91_c7_8a69_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l92_c9_e96c]
signal BIN_OP_PLUS_eth_8_h_l92_c9_e96c_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_eth_8_h_l92_c9_e96c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l92_c9_e96c_return_output : unsigned(3 downto 0);

-- counter_MUX[eth_8_h_l94_c7_9a01]
signal counter_MUX_eth_8_h_l94_c7_9a01_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l94_c7_9a01_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l94_c7_9a01_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l94_c7_9a01_return_output : unsigned(2 downto 0);

-- state_MUX[eth_8_h_l94_c7_9a01]
signal state_MUX_eth_8_h_l94_c7_9a01_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l94_c7_9a01_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l94_c7_9a01_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l94_c7_9a01_return_output : unsigned(2 downto 0);

function uint40_uint8( x : unsigned;
 y : unsigned) return unsigned is

  --variable x : unsigned(39 downto 0);
  --variable y : unsigned(7 downto 0);
  variable return_output : unsigned(47 downto 0);

begin

    return_output := unsigned(std_logic_vector(x)) & unsigned(std_logic_vector(y));
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

function uint8_uint8( x : unsigned;
 y : unsigned) return unsigned is

  --variable x : unsigned(7 downto 0);
  --variable y : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    return_output := unsigned(std_logic_vector(x)) & unsigned(std_logic_vector(y));
    return return_output;

end function;

function CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7( ref_toks_0 : axis8_t) return unsigned is
 
  variable base : eth_8_rx_t; 
  variable return_output : unsigned(0 downto 0);
begin
      base.frame.data.payload := ref_toks_0;

      return_output := base.frame.data.payload.tlast;
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

function CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_1622( ref_toks_0 : eth_header_t;
 ref_toks_1 : axis8_t;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return eth_8_rx_t is
 
  variable base : eth_8_rx_t; 
  variable return_output : eth_8_rx_t;
begin
      base.frame.data.header := ref_toks_0;
      base.frame.data.payload := ref_toks_1;
      base.overflow := ref_toks_2;
      base.frame.valid := ref_toks_3;
      base.frame.data.start_of_payload := ref_toks_4;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_eth_8_h_l51_c6_4d4d : 0 clocks latency
BIN_OP_EQ_eth_8_h_l51_c6_4d4d : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l51_c6_4d4d_left,
BIN_OP_EQ_eth_8_h_l51_c6_4d4d_right,
BIN_OP_EQ_eth_8_h_l51_c6_4d4d_return_output);

-- counter_MUX_eth_8_h_l51_c3_8b25 : 0 clocks latency
counter_MUX_eth_8_h_l51_c3_8b25 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l51_c3_8b25_cond,
counter_MUX_eth_8_h_l51_c3_8b25_iftrue,
counter_MUX_eth_8_h_l51_c3_8b25_iffalse,
counter_MUX_eth_8_h_l51_c3_8b25_return_output);

-- o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25 : 0 clocks latency
o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25 : entity work.MUX_uint1_t_axis8_t_axis8_t_0CLK_de264c78 port map (
o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_cond,
o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_iftrue,
o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_iffalse,
o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_return_output);

-- o_overflow_MUX_eth_8_h_l51_c3_8b25 : 0 clocks latency
o_overflow_MUX_eth_8_h_l51_c3_8b25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_overflow_MUX_eth_8_h_l51_c3_8b25_cond,
o_overflow_MUX_eth_8_h_l51_c3_8b25_iftrue,
o_overflow_MUX_eth_8_h_l51_c3_8b25_iffalse,
o_overflow_MUX_eth_8_h_l51_c3_8b25_return_output);

-- o_frame_valid_MUX_eth_8_h_l51_c3_8b25 : 0 clocks latency
o_frame_valid_MUX_eth_8_h_l51_c3_8b25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_valid_MUX_eth_8_h_l51_c3_8b25_cond,
o_frame_valid_MUX_eth_8_h_l51_c3_8b25_iftrue,
o_frame_valid_MUX_eth_8_h_l51_c3_8b25_iffalse,
o_frame_valid_MUX_eth_8_h_l51_c3_8b25_return_output);

-- o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25 : 0 clocks latency
o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_cond,
o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_iftrue,
o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_iffalse,
o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_return_output);

-- header_MUX_eth_8_h_l51_c3_8b25 : 0 clocks latency
header_MUX_eth_8_h_l51_c3_8b25 : entity work.MUX_uint1_t_eth_header_t_eth_header_t_0CLK_de264c78 port map (
header_MUX_eth_8_h_l51_c3_8b25_cond,
header_MUX_eth_8_h_l51_c3_8b25_iftrue,
header_MUX_eth_8_h_l51_c3_8b25_iffalse,
header_MUX_eth_8_h_l51_c3_8b25_return_output);

-- state_MUX_eth_8_h_l51_c3_8b25 : 0 clocks latency
state_MUX_eth_8_h_l51_c3_8b25 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l51_c3_8b25_cond,
state_MUX_eth_8_h_l51_c3_8b25_iftrue,
state_MUX_eth_8_h_l51_c3_8b25_iffalse,
state_MUX_eth_8_h_l51_c3_8b25_return_output);

-- counter_MUX_eth_8_h_l52_c5_c5f0 : 0 clocks latency
counter_MUX_eth_8_h_l52_c5_c5f0 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l52_c5_c5f0_cond,
counter_MUX_eth_8_h_l52_c5_c5f0_iftrue,
counter_MUX_eth_8_h_l52_c5_c5f0_iffalse,
counter_MUX_eth_8_h_l52_c5_c5f0_return_output);

-- header_dst_mac_MUX_eth_8_h_l52_c5_c5f0 : 0 clocks latency
header_dst_mac_MUX_eth_8_h_l52_c5_c5f0 : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_cond,
header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_iftrue,
header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_iffalse,
header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_return_output);

-- state_MUX_eth_8_h_l52_c5_c5f0 : 0 clocks latency
state_MUX_eth_8_h_l52_c5_c5f0 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l52_c5_c5f0_cond,
state_MUX_eth_8_h_l52_c5_c5f0_iftrue,
state_MUX_eth_8_h_l52_c5_c5f0_iffalse,
state_MUX_eth_8_h_l52_c5_c5f0_return_output);

-- BIN_OP_EQ_eth_8_h_l54_c10_f93b : 0 clocks latency
BIN_OP_EQ_eth_8_h_l54_c10_f93b : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l54_c10_f93b_left,
BIN_OP_EQ_eth_8_h_l54_c10_f93b_right,
BIN_OP_EQ_eth_8_h_l54_c10_f93b_return_output);

-- counter_MUX_eth_8_h_l54_c7_7c67 : 0 clocks latency
counter_MUX_eth_8_h_l54_c7_7c67 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l54_c7_7c67_cond,
counter_MUX_eth_8_h_l54_c7_7c67_iftrue,
counter_MUX_eth_8_h_l54_c7_7c67_iffalse,
counter_MUX_eth_8_h_l54_c7_7c67_return_output);

-- state_MUX_eth_8_h_l54_c7_7c67 : 0 clocks latency
state_MUX_eth_8_h_l54_c7_7c67 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l54_c7_7c67_cond,
state_MUX_eth_8_h_l54_c7_7c67_iftrue,
state_MUX_eth_8_h_l54_c7_7c67_iffalse,
state_MUX_eth_8_h_l54_c7_7c67_return_output);

-- BIN_OP_PLUS_eth_8_h_l58_c9_e33e : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l58_c9_e33e : entity work.BIN_OP_PLUS_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l58_c9_e33e_left,
BIN_OP_PLUS_eth_8_h_l58_c9_e33e_right,
BIN_OP_PLUS_eth_8_h_l58_c9_e33e_return_output);

-- BIN_OP_EQ_eth_8_h_l61_c12_a153 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l61_c12_a153 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l61_c12_a153_left,
BIN_OP_EQ_eth_8_h_l61_c12_a153_right,
BIN_OP_EQ_eth_8_h_l61_c12_a153_return_output);

-- counter_MUX_eth_8_h_l61_c9_590e : 0 clocks latency
counter_MUX_eth_8_h_l61_c9_590e : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l61_c9_590e_cond,
counter_MUX_eth_8_h_l61_c9_590e_iftrue,
counter_MUX_eth_8_h_l61_c9_590e_iffalse,
counter_MUX_eth_8_h_l61_c9_590e_return_output);

-- o_frame_data_payload_MUX_eth_8_h_l61_c9_590e : 0 clocks latency
o_frame_data_payload_MUX_eth_8_h_l61_c9_590e : entity work.MUX_uint1_t_axis8_t_axis8_t_0CLK_de264c78 port map (
o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_cond,
o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_iftrue,
o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_iffalse,
o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_return_output);

-- o_overflow_MUX_eth_8_h_l61_c9_590e : 0 clocks latency
o_overflow_MUX_eth_8_h_l61_c9_590e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_overflow_MUX_eth_8_h_l61_c9_590e_cond,
o_overflow_MUX_eth_8_h_l61_c9_590e_iftrue,
o_overflow_MUX_eth_8_h_l61_c9_590e_iffalse,
o_overflow_MUX_eth_8_h_l61_c9_590e_return_output);

-- o_frame_valid_MUX_eth_8_h_l61_c9_590e : 0 clocks latency
o_frame_valid_MUX_eth_8_h_l61_c9_590e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_valid_MUX_eth_8_h_l61_c9_590e_cond,
o_frame_valid_MUX_eth_8_h_l61_c9_590e_iftrue,
o_frame_valid_MUX_eth_8_h_l61_c9_590e_iffalse,
o_frame_valid_MUX_eth_8_h_l61_c9_590e_return_output);

-- o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e : 0 clocks latency
o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_cond,
o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_iftrue,
o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_iffalse,
o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_return_output);

-- header_src_mac_MUX_eth_8_h_l61_c9_590e : 0 clocks latency
header_src_mac_MUX_eth_8_h_l61_c9_590e : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_src_mac_MUX_eth_8_h_l61_c9_590e_cond,
header_src_mac_MUX_eth_8_h_l61_c9_590e_iftrue,
header_src_mac_MUX_eth_8_h_l61_c9_590e_iffalse,
header_src_mac_MUX_eth_8_h_l61_c9_590e_return_output);

-- header_ethertype_MUX_eth_8_h_l61_c9_590e : 0 clocks latency
header_ethertype_MUX_eth_8_h_l61_c9_590e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l61_c9_590e_cond,
header_ethertype_MUX_eth_8_h_l61_c9_590e_iftrue,
header_ethertype_MUX_eth_8_h_l61_c9_590e_iffalse,
header_ethertype_MUX_eth_8_h_l61_c9_590e_return_output);

-- state_MUX_eth_8_h_l61_c9_590e : 0 clocks latency
state_MUX_eth_8_h_l61_c9_590e : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l61_c9_590e_cond,
state_MUX_eth_8_h_l61_c9_590e_iftrue,
state_MUX_eth_8_h_l61_c9_590e_iffalse,
state_MUX_eth_8_h_l61_c9_590e_return_output);

-- counter_MUX_eth_8_h_l62_c5_a3da : 0 clocks latency
counter_MUX_eth_8_h_l62_c5_a3da : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l62_c5_a3da_cond,
counter_MUX_eth_8_h_l62_c5_a3da_iftrue,
counter_MUX_eth_8_h_l62_c5_a3da_iffalse,
counter_MUX_eth_8_h_l62_c5_a3da_return_output);

-- header_src_mac_MUX_eth_8_h_l62_c5_a3da : 0 clocks latency
header_src_mac_MUX_eth_8_h_l62_c5_a3da : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_src_mac_MUX_eth_8_h_l62_c5_a3da_cond,
header_src_mac_MUX_eth_8_h_l62_c5_a3da_iftrue,
header_src_mac_MUX_eth_8_h_l62_c5_a3da_iffalse,
header_src_mac_MUX_eth_8_h_l62_c5_a3da_return_output);

-- state_MUX_eth_8_h_l62_c5_a3da : 0 clocks latency
state_MUX_eth_8_h_l62_c5_a3da : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l62_c5_a3da_cond,
state_MUX_eth_8_h_l62_c5_a3da_iftrue,
state_MUX_eth_8_h_l62_c5_a3da_iffalse,
state_MUX_eth_8_h_l62_c5_a3da_return_output);

-- BIN_OP_EQ_eth_8_h_l64_c10_d6f6 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l64_c10_d6f6 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l64_c10_d6f6_left,
BIN_OP_EQ_eth_8_h_l64_c10_d6f6_right,
BIN_OP_EQ_eth_8_h_l64_c10_d6f6_return_output);

-- counter_MUX_eth_8_h_l64_c7_fec9 : 0 clocks latency
counter_MUX_eth_8_h_l64_c7_fec9 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l64_c7_fec9_cond,
counter_MUX_eth_8_h_l64_c7_fec9_iftrue,
counter_MUX_eth_8_h_l64_c7_fec9_iffalse,
counter_MUX_eth_8_h_l64_c7_fec9_return_output);

-- state_MUX_eth_8_h_l64_c7_fec9 : 0 clocks latency
state_MUX_eth_8_h_l64_c7_fec9 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l64_c7_fec9_cond,
state_MUX_eth_8_h_l64_c7_fec9_iftrue,
state_MUX_eth_8_h_l64_c7_fec9_iffalse,
state_MUX_eth_8_h_l64_c7_fec9_return_output);

-- BIN_OP_PLUS_eth_8_h_l68_c9_36ea : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l68_c9_36ea : entity work.BIN_OP_PLUS_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l68_c9_36ea_left,
BIN_OP_PLUS_eth_8_h_l68_c9_36ea_right,
BIN_OP_PLUS_eth_8_h_l68_c9_36ea_return_output);

-- BIN_OP_EQ_eth_8_h_l71_c12_d8bd : 0 clocks latency
BIN_OP_EQ_eth_8_h_l71_c12_d8bd : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l71_c12_d8bd_left,
BIN_OP_EQ_eth_8_h_l71_c12_d8bd_right,
BIN_OP_EQ_eth_8_h_l71_c12_d8bd_return_output);

-- counter_MUX_eth_8_h_l71_c9_bf81 : 0 clocks latency
counter_MUX_eth_8_h_l71_c9_bf81 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l71_c9_bf81_cond,
counter_MUX_eth_8_h_l71_c9_bf81_iftrue,
counter_MUX_eth_8_h_l71_c9_bf81_iffalse,
counter_MUX_eth_8_h_l71_c9_bf81_return_output);

-- o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81 : 0 clocks latency
o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81 : entity work.MUX_uint1_t_axis8_t_axis8_t_0CLK_de264c78 port map (
o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_cond,
o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_iftrue,
o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_iffalse,
o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_return_output);

-- o_overflow_MUX_eth_8_h_l71_c9_bf81 : 0 clocks latency
o_overflow_MUX_eth_8_h_l71_c9_bf81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_overflow_MUX_eth_8_h_l71_c9_bf81_cond,
o_overflow_MUX_eth_8_h_l71_c9_bf81_iftrue,
o_overflow_MUX_eth_8_h_l71_c9_bf81_iffalse,
o_overflow_MUX_eth_8_h_l71_c9_bf81_return_output);

-- o_frame_valid_MUX_eth_8_h_l71_c9_bf81 : 0 clocks latency
o_frame_valid_MUX_eth_8_h_l71_c9_bf81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_valid_MUX_eth_8_h_l71_c9_bf81_cond,
o_frame_valid_MUX_eth_8_h_l71_c9_bf81_iftrue,
o_frame_valid_MUX_eth_8_h_l71_c9_bf81_iffalse,
o_frame_valid_MUX_eth_8_h_l71_c9_bf81_return_output);

-- o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81 : 0 clocks latency
o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_cond,
o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_iftrue,
o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_iffalse,
o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_return_output);

-- header_ethertype_MUX_eth_8_h_l71_c9_bf81 : 0 clocks latency
header_ethertype_MUX_eth_8_h_l71_c9_bf81 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l71_c9_bf81_cond,
header_ethertype_MUX_eth_8_h_l71_c9_bf81_iftrue,
header_ethertype_MUX_eth_8_h_l71_c9_bf81_iffalse,
header_ethertype_MUX_eth_8_h_l71_c9_bf81_return_output);

-- state_MUX_eth_8_h_l71_c9_bf81 : 0 clocks latency
state_MUX_eth_8_h_l71_c9_bf81 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l71_c9_bf81_cond,
state_MUX_eth_8_h_l71_c9_bf81_iftrue,
state_MUX_eth_8_h_l71_c9_bf81_iffalse,
state_MUX_eth_8_h_l71_c9_bf81_return_output);

-- counter_MUX_eth_8_h_l72_c5_7cf3 : 0 clocks latency
counter_MUX_eth_8_h_l72_c5_7cf3 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l72_c5_7cf3_cond,
counter_MUX_eth_8_h_l72_c5_7cf3_iftrue,
counter_MUX_eth_8_h_l72_c5_7cf3_iffalse,
counter_MUX_eth_8_h_l72_c5_7cf3_return_output);

-- header_ethertype_MUX_eth_8_h_l72_c5_7cf3 : 0 clocks latency
header_ethertype_MUX_eth_8_h_l72_c5_7cf3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l72_c5_7cf3_cond,
header_ethertype_MUX_eth_8_h_l72_c5_7cf3_iftrue,
header_ethertype_MUX_eth_8_h_l72_c5_7cf3_iffalse,
header_ethertype_MUX_eth_8_h_l72_c5_7cf3_return_output);

-- state_MUX_eth_8_h_l72_c5_7cf3 : 0 clocks latency
state_MUX_eth_8_h_l72_c5_7cf3 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l72_c5_7cf3_cond,
state_MUX_eth_8_h_l72_c5_7cf3_iftrue,
state_MUX_eth_8_h_l72_c5_7cf3_iffalse,
state_MUX_eth_8_h_l72_c5_7cf3_return_output);

-- BIN_OP_EQ_eth_8_h_l74_c10_e95f : 0 clocks latency
BIN_OP_EQ_eth_8_h_l74_c10_e95f : entity work.BIN_OP_EQ_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l74_c10_e95f_left,
BIN_OP_EQ_eth_8_h_l74_c10_e95f_right,
BIN_OP_EQ_eth_8_h_l74_c10_e95f_return_output);

-- counter_MUX_eth_8_h_l74_c7_faeb : 0 clocks latency
counter_MUX_eth_8_h_l74_c7_faeb : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l74_c7_faeb_cond,
counter_MUX_eth_8_h_l74_c7_faeb_iftrue,
counter_MUX_eth_8_h_l74_c7_faeb_iffalse,
counter_MUX_eth_8_h_l74_c7_faeb_return_output);

-- state_MUX_eth_8_h_l74_c7_faeb : 0 clocks latency
state_MUX_eth_8_h_l74_c7_faeb : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l74_c7_faeb_cond,
state_MUX_eth_8_h_l74_c7_faeb_iftrue,
state_MUX_eth_8_h_l74_c7_faeb_iffalse,
state_MUX_eth_8_h_l74_c7_faeb_return_output);

-- BIN_OP_PLUS_eth_8_h_l78_c9_7dc8 : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l78_c9_7dc8 : entity work.BIN_OP_PLUS_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l78_c9_7dc8_left,
BIN_OP_PLUS_eth_8_h_l78_c9_7dc8_right,
BIN_OP_PLUS_eth_8_h_l78_c9_7dc8_return_output);

-- BIN_OP_EQ_eth_8_h_l83_c11_85c6 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l83_c11_85c6 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l83_c11_85c6_left,
BIN_OP_EQ_eth_8_h_l83_c11_85c6_right,
BIN_OP_EQ_eth_8_h_l83_c11_85c6_return_output);

-- counter_MUX_eth_8_h_l83_c8_1dd8 : 0 clocks latency
counter_MUX_eth_8_h_l83_c8_1dd8 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l83_c8_1dd8_cond,
counter_MUX_eth_8_h_l83_c8_1dd8_iftrue,
counter_MUX_eth_8_h_l83_c8_1dd8_iffalse,
counter_MUX_eth_8_h_l83_c8_1dd8_return_output);

-- o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8 : 0 clocks latency
o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8 : entity work.MUX_uint1_t_axis8_t_axis8_t_0CLK_de264c78 port map (
o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_cond,
o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_iftrue,
o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_iffalse,
o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_return_output);

-- o_overflow_MUX_eth_8_h_l83_c8_1dd8 : 0 clocks latency
o_overflow_MUX_eth_8_h_l83_c8_1dd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_overflow_MUX_eth_8_h_l83_c8_1dd8_cond,
o_overflow_MUX_eth_8_h_l83_c8_1dd8_iftrue,
o_overflow_MUX_eth_8_h_l83_c8_1dd8_iffalse,
o_overflow_MUX_eth_8_h_l83_c8_1dd8_return_output);

-- o_frame_valid_MUX_eth_8_h_l83_c8_1dd8 : 0 clocks latency
o_frame_valid_MUX_eth_8_h_l83_c8_1dd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_cond,
o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_iftrue,
o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_iffalse,
o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_return_output);

-- o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8 : 0 clocks latency
o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_cond,
o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_iftrue,
o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_iffalse,
o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_return_output);

-- state_MUX_eth_8_h_l83_c8_1dd8 : 0 clocks latency
state_MUX_eth_8_h_l83_c8_1dd8 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l83_c8_1dd8_cond,
state_MUX_eth_8_h_l83_c8_1dd8_iftrue,
state_MUX_eth_8_h_l83_c8_1dd8_iffalse,
state_MUX_eth_8_h_l83_c8_1dd8_return_output);

-- BIN_OP_EQ_eth_8_h_l86_c37_5933 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l86_c37_5933 : entity work.BIN_OP_EQ_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l86_c37_5933_left,
BIN_OP_EQ_eth_8_h_l86_c37_5933_right,
BIN_OP_EQ_eth_8_h_l86_c37_5933_return_output);

-- UNARY_OP_NOT_eth_8_h_l89_c35_769b : 0 clocks latency
UNARY_OP_NOT_eth_8_h_l89_c35_769b : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_eth_8_h_l89_c35_769b_expr,
UNARY_OP_NOT_eth_8_h_l89_c35_769b_return_output);

-- BIN_OP_AND_eth_8_h_l89_c18_f0b2 : 0 clocks latency
BIN_OP_AND_eth_8_h_l89_c18_f0b2 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_eth_8_h_l89_c18_f0b2_left,
BIN_OP_AND_eth_8_h_l89_c18_f0b2_right,
BIN_OP_AND_eth_8_h_l89_c18_f0b2_return_output);

-- counter_MUX_eth_8_h_l90_c5_9391 : 0 clocks latency
counter_MUX_eth_8_h_l90_c5_9391 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l90_c5_9391_cond,
counter_MUX_eth_8_h_l90_c5_9391_iftrue,
counter_MUX_eth_8_h_l90_c5_9391_iffalse,
counter_MUX_eth_8_h_l90_c5_9391_return_output);

-- state_MUX_eth_8_h_l90_c5_9391 : 0 clocks latency
state_MUX_eth_8_h_l90_c5_9391 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l90_c5_9391_cond,
state_MUX_eth_8_h_l90_c5_9391_iftrue,
state_MUX_eth_8_h_l90_c5_9391_iffalse,
state_MUX_eth_8_h_l90_c5_9391_return_output);

-- counter_MUX_eth_8_h_l91_c7_8a69 : 0 clocks latency
counter_MUX_eth_8_h_l91_c7_8a69 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l91_c7_8a69_cond,
counter_MUX_eth_8_h_l91_c7_8a69_iftrue,
counter_MUX_eth_8_h_l91_c7_8a69_iffalse,
counter_MUX_eth_8_h_l91_c7_8a69_return_output);

-- BIN_OP_PLUS_eth_8_h_l92_c9_e96c : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l92_c9_e96c : entity work.BIN_OP_PLUS_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l92_c9_e96c_left,
BIN_OP_PLUS_eth_8_h_l92_c9_e96c_right,
BIN_OP_PLUS_eth_8_h_l92_c9_e96c_return_output);

-- counter_MUX_eth_8_h_l94_c7_9a01 : 0 clocks latency
counter_MUX_eth_8_h_l94_c7_9a01 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l94_c7_9a01_cond,
counter_MUX_eth_8_h_l94_c7_9a01_iftrue,
counter_MUX_eth_8_h_l94_c7_9a01_iffalse,
counter_MUX_eth_8_h_l94_c7_9a01_return_output);

-- state_MUX_eth_8_h_l94_c7_9a01 : 0 clocks latency
state_MUX_eth_8_h_l94_c7_9a01 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l94_c7_9a01_cond,
state_MUX_eth_8_h_l94_c7_9a01_iftrue,
state_MUX_eth_8_h_l94_c7_9a01_iffalse,
state_MUX_eth_8_h_l94_c7_9a01_return_output);



-- Resolve what clock enable to use for user logic
clk_en_internal <= CLOCK_ENABLE(0);
-- Combinatorial process for pipeline stages
process (
CLOCK_ENABLE,
clk_en_internal,
 -- Inputs
 mac_axis,
 frame_ready,
 -- Registers
 state,
 header,
 counter,
 -- All submodule outputs
 BIN_OP_EQ_eth_8_h_l51_c6_4d4d_return_output,
 counter_MUX_eth_8_h_l51_c3_8b25_return_output,
 o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_return_output,
 o_overflow_MUX_eth_8_h_l51_c3_8b25_return_output,
 o_frame_valid_MUX_eth_8_h_l51_c3_8b25_return_output,
 o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_return_output,
 header_MUX_eth_8_h_l51_c3_8b25_return_output,
 state_MUX_eth_8_h_l51_c3_8b25_return_output,
 counter_MUX_eth_8_h_l52_c5_c5f0_return_output,
 header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_return_output,
 state_MUX_eth_8_h_l52_c5_c5f0_return_output,
 BIN_OP_EQ_eth_8_h_l54_c10_f93b_return_output,
 counter_MUX_eth_8_h_l54_c7_7c67_return_output,
 state_MUX_eth_8_h_l54_c7_7c67_return_output,
 BIN_OP_PLUS_eth_8_h_l58_c9_e33e_return_output,
 BIN_OP_EQ_eth_8_h_l61_c12_a153_return_output,
 counter_MUX_eth_8_h_l61_c9_590e_return_output,
 o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_return_output,
 o_overflow_MUX_eth_8_h_l61_c9_590e_return_output,
 o_frame_valid_MUX_eth_8_h_l61_c9_590e_return_output,
 o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_return_output,
 header_src_mac_MUX_eth_8_h_l61_c9_590e_return_output,
 header_ethertype_MUX_eth_8_h_l61_c9_590e_return_output,
 state_MUX_eth_8_h_l61_c9_590e_return_output,
 counter_MUX_eth_8_h_l62_c5_a3da_return_output,
 header_src_mac_MUX_eth_8_h_l62_c5_a3da_return_output,
 state_MUX_eth_8_h_l62_c5_a3da_return_output,
 BIN_OP_EQ_eth_8_h_l64_c10_d6f6_return_output,
 counter_MUX_eth_8_h_l64_c7_fec9_return_output,
 state_MUX_eth_8_h_l64_c7_fec9_return_output,
 BIN_OP_PLUS_eth_8_h_l68_c9_36ea_return_output,
 BIN_OP_EQ_eth_8_h_l71_c12_d8bd_return_output,
 counter_MUX_eth_8_h_l71_c9_bf81_return_output,
 o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_return_output,
 o_overflow_MUX_eth_8_h_l71_c9_bf81_return_output,
 o_frame_valid_MUX_eth_8_h_l71_c9_bf81_return_output,
 o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_return_output,
 header_ethertype_MUX_eth_8_h_l71_c9_bf81_return_output,
 state_MUX_eth_8_h_l71_c9_bf81_return_output,
 counter_MUX_eth_8_h_l72_c5_7cf3_return_output,
 header_ethertype_MUX_eth_8_h_l72_c5_7cf3_return_output,
 state_MUX_eth_8_h_l72_c5_7cf3_return_output,
 BIN_OP_EQ_eth_8_h_l74_c10_e95f_return_output,
 counter_MUX_eth_8_h_l74_c7_faeb_return_output,
 state_MUX_eth_8_h_l74_c7_faeb_return_output,
 BIN_OP_PLUS_eth_8_h_l78_c9_7dc8_return_output,
 BIN_OP_EQ_eth_8_h_l83_c11_85c6_return_output,
 counter_MUX_eth_8_h_l83_c8_1dd8_return_output,
 o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_return_output,
 o_overflow_MUX_eth_8_h_l83_c8_1dd8_return_output,
 o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_return_output,
 o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_return_output,
 state_MUX_eth_8_h_l83_c8_1dd8_return_output,
 BIN_OP_EQ_eth_8_h_l86_c37_5933_return_output,
 UNARY_OP_NOT_eth_8_h_l89_c35_769b_return_output,
 BIN_OP_AND_eth_8_h_l89_c18_f0b2_return_output,
 counter_MUX_eth_8_h_l90_c5_9391_return_output,
 state_MUX_eth_8_h_l90_c5_9391_return_output,
 counter_MUX_eth_8_h_l91_c7_8a69_return_output,
 BIN_OP_PLUS_eth_8_h_l92_c9_e96c_return_output,
 counter_MUX_eth_8_h_l94_c7_9a01_return_output,
 state_MUX_eth_8_h_l94_c7_9a01_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eth_8_rx_t;
 variable VAR_mac_axis : axis8_t_stream_t;
 variable VAR_frame_ready : unsigned(0 downto 0);
 variable VAR_o : eth_8_rx_t;
 variable VAR_BIN_OP_EQ_eth_8_h_l51_c6_4d4d_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l51_c6_4d4d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l51_c6_4d4d_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l51_c3_8b25_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l52_c5_c5f0_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l51_c3_8b25_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l61_c9_590e_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l51_c3_8b25_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l51_c3_8b25_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_iftrue : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_iffalse : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_return_output : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_return_output : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_cond : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l51_c3_8b25_iftrue : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l51_c3_8b25_iffalse : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l61_c9_590e_return_output : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l51_c3_8b25_return_output : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l51_c3_8b25_cond : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l51_c3_8b25_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l51_c3_8b25_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l61_c9_590e_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l51_c3_8b25_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l51_c3_8b25_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_cond : unsigned(0 downto 0);
 variable VAR_header_MUX_eth_8_h_l51_c3_8b25_iftrue : eth_header_t;
 variable VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l51_c3_8b25_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l51_c3_8b25_iffalse : eth_header_t;
 variable VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_488d_eth_8_h_l51_c3_8b25_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l51_c3_8b25_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l51_c3_8b25_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l51_c3_8b25_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l52_c5_c5f0_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l51_c3_8b25_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l61_c9_590e_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l51_c3_8b25_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l51_c3_8b25_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l52_c5_c5f0_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l54_c7_7c67_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l52_c5_c5f0_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l52_c5_c5f0_cond : unsigned(0 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_iftrue : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_iffalse : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_return_output : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l52_c5_c5f0_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l54_c7_7c67_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l52_c5_c5f0_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l52_c5_c5f0_cond : unsigned(0 downto 0);
 variable VAR_uint40_uint8_eth_8_h_l53_c24_6c48_return_output : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l54_c10_f93b_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l54_c10_f93b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l54_c10_f93b_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l54_c7_7c67_iftrue : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l56_c9_c34d : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l54_c7_7c67_iffalse : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l58_c9_8f3d : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l54_c7_7c67_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l54_c7_7c67_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l54_c7_7c67_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l54_c7_7c67_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l58_c9_e33e_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l58_c9_e33e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l58_c9_e33e_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l61_c12_a153_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l61_c12_a153_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l61_c12_a153_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l61_c9_590e_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l62_c5_a3da_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l61_c9_590e_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l71_c9_bf81_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l61_c9_590e_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_iftrue : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_iffalse : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_return_output : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_cond : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l61_c9_590e_iftrue : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l61_c9_590e_iffalse : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l71_c9_bf81_return_output : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l61_c9_590e_cond : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l61_c9_590e_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l61_c9_590e_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l71_c9_bf81_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l61_c9_590e_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_cond : unsigned(0 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l61_c9_590e_iftrue : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l62_c5_a3da_return_output : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l61_c9_590e_iffalse : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l61_c9_590e_return_output : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l61_c9_590e_cond : unsigned(0 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l61_c9_590e_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l61_c9_590e_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l71_c9_bf81_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l61_c9_590e_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l61_c9_590e_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l61_c9_590e_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l62_c5_a3da_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l61_c9_590e_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l71_c9_bf81_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l61_c9_590e_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l62_c5_a3da_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l64_c7_fec9_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l62_c5_a3da_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l62_c5_a3da_cond : unsigned(0 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l62_c5_a3da_iftrue : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l62_c5_a3da_iffalse : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l62_c5_a3da_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l62_c5_a3da_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l64_c7_fec9_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l62_c5_a3da_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l62_c5_a3da_cond : unsigned(0 downto 0);
 variable VAR_uint40_uint8_eth_8_h_l63_c24_a2e5_return_output : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l64_c10_d6f6_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l64_c10_d6f6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l64_c10_d6f6_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l64_c7_fec9_iftrue : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l66_c9_d8b5 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l64_c7_fec9_iffalse : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l68_c9_d940 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l64_c7_fec9_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l64_c7_fec9_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l64_c7_fec9_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l64_c7_fec9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l68_c9_36ea_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l68_c9_36ea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l68_c9_36ea_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l71_c12_d8bd_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l71_c12_d8bd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l71_c12_d8bd_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l71_c9_bf81_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l72_c5_7cf3_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l71_c9_bf81_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l83_c8_1dd8_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l71_c9_bf81_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_iftrue : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_iffalse : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_return_output : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_cond : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l71_c9_bf81_iftrue : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l71_c9_bf81_iffalse : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l83_c8_1dd8_return_output : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l71_c9_bf81_cond : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l71_c9_bf81_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l71_c9_bf81_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l71_c9_bf81_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_cond : unsigned(0 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l71_c9_bf81_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l72_c5_7cf3_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l71_c9_bf81_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l71_c9_bf81_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l71_c9_bf81_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l72_c5_7cf3_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l71_c9_bf81_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l83_c8_1dd8_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l71_c9_bf81_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l72_c5_7cf3_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l74_c7_faeb_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l72_c5_7cf3_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l72_c5_7cf3_cond : unsigned(0 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l72_c5_7cf3_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l72_c5_7cf3_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l72_c5_7cf3_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l72_c5_7cf3_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l74_c7_faeb_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l72_c5_7cf3_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l72_c5_7cf3_cond : unsigned(0 downto 0);
 variable VAR_uint8_uint8_eth_8_h_l73_c26_864f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l74_c10_e95f_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l74_c10_e95f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l74_c10_e95f_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l74_c7_faeb_iftrue : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l76_c9_3c68 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l74_c7_faeb_iffalse : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l78_c9_5699 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l74_c7_faeb_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l74_c7_faeb_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l74_c7_faeb_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l74_c7_faeb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l78_c9_7dc8_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l78_c9_7dc8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l78_c9_7dc8_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l83_c11_85c6_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l83_c11_85c6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l83_c11_85c6_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l83_c8_1dd8_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l90_c5_9391_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l83_c8_1dd8_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l83_c8_1dd8_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_iftrue : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_iffalse : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_cond : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l83_c8_1dd8_iftrue : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l83_c8_1dd8_iffalse : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l83_c8_1dd8_cond : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l83_c8_1dd8_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l90_c5_9391_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l83_c8_1dd8_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l83_c8_1dd8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d_eth_8_h_l85_c28_e8de_return_output : axis8_t;
 variable VAR_BIN_OP_EQ_eth_8_h_l86_c37_5933_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l86_c37_5933_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l86_c37_5933_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l89_c18_f0b2_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_eth_8_h_l89_c35_769b_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_eth_8_h_l89_c35_769b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l89_c18_f0b2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l89_c18_f0b2_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l90_c5_9391_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l94_c7_9a01_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l90_c5_9391_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l90_c5_9391_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l90_c5_9391_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l94_c7_9a01_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l90_c5_9391_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l90_c5_9391_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l91_c7_8a69_iftrue : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l92_c9_32d9 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l91_c7_8a69_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l91_c7_8a69_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l91_c7_8a69_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l92_c9_e96c_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l92_c9_e96c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l92_c9_e96c_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7_eth_8_h_l94_c10_bb7c_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l94_c7_9a01_iftrue : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l96_c9_0680 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l94_c7_9a01_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l94_c7_9a01_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l94_c7_9a01_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l94_c7_9a01_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l94_c7_9a01_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_1622_eth_8_h_l100_c10_e99d_return_output : eth_8_rx_t;
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l72_l87_l52_DUPLICATE_8072_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l52_l53_DUPLICATE_0423_return_output : unsigned(47 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l63_l73_DUPLICATE_928d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l51_l83_l61_l71_DUPLICATE_235c_return_output : axis8_t;
 variable VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l63_l61_l62_DUPLICATE_37a1_return_output : unsigned(47 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l72_l73_l61_l71_DUPLICATE_50a4_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_state : unsigned(2 downto 0);
variable REG_VAR_header : eth_header_t;
variable REG_VAR_counter : unsigned(2 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_state := state;
  REG_VAR_header := header;
  REG_VAR_counter := counter;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_eth_8_h_l61_c12_a153_right := unsigned(eth8_state_t_to_slv(SRC_MAC));
     VAR_counter_eth_8_h_l96_c9_0680 := resize(to_unsigned(0, 1), 3);
     VAR_counter_MUX_eth_8_h_l94_c7_9a01_iftrue := VAR_counter_eth_8_h_l96_c9_0680;
     VAR_BIN_OP_PLUS_eth_8_h_l78_c9_7dc8_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_eth_8_h_l51_c6_4d4d_right := unsigned(eth8_state_t_to_slv(IDLE_DST_MAC));
     VAR_state_MUX_eth_8_h_l94_c7_9a01_iftrue := unsigned(eth8_state_t_to_slv(IDLE_DST_MAC));
     VAR_o_frame_valid_MUX_eth_8_h_l71_c9_bf81_iftrue := to_unsigned(0, 1);
     VAR_o_frame_valid_MUX_eth_8_h_l51_c3_8b25_iftrue := to_unsigned(0, 1);
     VAR_o_frame_valid_MUX_eth_8_h_l61_c9_590e_iftrue := to_unsigned(0, 1);
     VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_eth_8_h_l74_c10_e95f_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_eth_8_h_l68_c9_36ea_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_eth_8_h_l83_c11_85c6_right := unsigned(eth8_state_t_to_slv(PAYLOAD));
     VAR_BIN_OP_EQ_eth_8_h_l86_c37_5933_right := to_unsigned(0, 1);
     VAR_o_overflow_MUX_eth_8_h_l83_c8_1dd8_iffalse := to_unsigned(0, 1);
     VAR_o_overflow_MUX_eth_8_h_l51_c3_8b25_iftrue := to_unsigned(0, 1);
     VAR_o_overflow_MUX_eth_8_h_l71_c9_bf81_iftrue := to_unsigned(0, 1);
     VAR_o_overflow_MUX_eth_8_h_l61_c9_590e_iftrue := to_unsigned(0, 1);
     VAR_state_MUX_eth_8_h_l54_c7_7c67_iftrue := unsigned(eth8_state_t_to_slv(SRC_MAC));
     VAR_BIN_OP_EQ_eth_8_h_l64_c10_d6f6_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_eth_8_h_l54_c10_f93b_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_eth_8_h_l58_c9_e33e_right := to_unsigned(1, 1);
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_iftrue := to_unsigned(0, 1);
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_iftrue := to_unsigned(0, 1);
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_iffalse := to_unsigned(0, 1);
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_iftrue := to_unsigned(0, 1);
     VAR_state_MUX_eth_8_h_l74_c7_faeb_iftrue := unsigned(eth8_state_t_to_slv(PAYLOAD));
     VAR_state_MUX_eth_8_h_l64_c7_fec9_iftrue := unsigned(eth8_state_t_to_slv(LEN_TYPE));
     VAR_counter_eth_8_h_l76_c9_3c68 := resize(to_unsigned(0, 1), 3);
     VAR_counter_MUX_eth_8_h_l74_c7_faeb_iftrue := VAR_counter_eth_8_h_l76_c9_3c68;
     VAR_BIN_OP_PLUS_eth_8_h_l92_c9_e96c_right := to_unsigned(1, 1);
     VAR_counter_eth_8_h_l56_c9_c34d := resize(to_unsigned(0, 1), 3);
     VAR_counter_MUX_eth_8_h_l54_c7_7c67_iftrue := VAR_counter_eth_8_h_l56_c9_c34d;
     VAR_BIN_OP_EQ_eth_8_h_l71_c12_d8bd_right := unsigned(eth8_state_t_to_slv(LEN_TYPE));
     VAR_counter_eth_8_h_l66_c9_d8b5 := resize(to_unsigned(0, 1), 3);
     VAR_counter_MUX_eth_8_h_l64_c7_fec9_iftrue := VAR_counter_eth_8_h_l66_c9_d8b5;
     -- CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l51_l83_l61_l71_DUPLICATE_235c LATENCY=0
     VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l51_l83_l61_l71_DUPLICATE_235c_return_output := eth_8_rx_t_NULL.frame.data.payload;

     -- Submodule level 1
     VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_iffalse := VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l51_l83_l61_l71_DUPLICATE_235c_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_iftrue := VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l51_l83_l61_l71_DUPLICATE_235c_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_iftrue := VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l51_l83_l61_l71_DUPLICATE_235c_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_iftrue := VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l51_l83_l61_l71_DUPLICATE_235c_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;
     -- Mux in inputs
     VAR_mac_axis := mac_axis;
     VAR_frame_ready := frame_ready;

     -- Submodule level 0
     VAR_BIN_OP_EQ_eth_8_h_l54_c10_f93b_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l64_c10_d6f6_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l74_c10_e95f_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l86_c37_5933_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l58_c9_e33e_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l68_c9_36ea_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l78_c9_7dc8_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l92_c9_e96c_left := counter;
     VAR_counter_MUX_eth_8_h_l52_c5_c5f0_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l62_c5_a3da_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l72_c5_7cf3_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l83_c8_1dd8_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l90_c5_9391_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l91_c7_8a69_iffalse := counter;
     VAR_UNARY_OP_NOT_eth_8_h_l89_c35_769b_expr := VAR_frame_ready;
     VAR_BIN_OP_EQ_eth_8_h_l51_c6_4d4d_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l61_c12_a153_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l71_c12_d8bd_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l83_c11_85c6_left := state;
     VAR_state_MUX_eth_8_h_l52_c5_c5f0_iffalse := state;
     VAR_state_MUX_eth_8_h_l54_c7_7c67_iffalse := state;
     VAR_state_MUX_eth_8_h_l62_c5_a3da_iffalse := state;
     VAR_state_MUX_eth_8_h_l64_c7_fec9_iffalse := state;
     VAR_state_MUX_eth_8_h_l72_c5_7cf3_iffalse := state;
     VAR_state_MUX_eth_8_h_l74_c7_faeb_iffalse := state;
     VAR_state_MUX_eth_8_h_l83_c8_1dd8_iffalse := state;
     VAR_state_MUX_eth_8_h_l90_c5_9391_iffalse := state;
     VAR_state_MUX_eth_8_h_l94_c7_9a01_iffalse := state;
     -- CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l52_l53_DUPLICATE_0423 LATENCY=0
     VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l52_l53_DUPLICATE_0423_return_output := header.dst_mac;

     -- BIN_OP_EQ[eth_8_h_l74_c10_e95f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l74_c10_e95f_left <= VAR_BIN_OP_EQ_eth_8_h_l74_c10_e95f_left;
     BIN_OP_EQ_eth_8_h_l74_c10_e95f_right <= VAR_BIN_OP_EQ_eth_8_h_l74_c10_e95f_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l74_c10_e95f_return_output := BIN_OP_EQ_eth_8_h_l74_c10_e95f_return_output;

     -- BIN_OP_EQ[eth_8_h_l71_c12_d8bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l71_c12_d8bd_left <= VAR_BIN_OP_EQ_eth_8_h_l71_c12_d8bd_left;
     BIN_OP_EQ_eth_8_h_l71_c12_d8bd_right <= VAR_BIN_OP_EQ_eth_8_h_l71_c12_d8bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l71_c12_d8bd_return_output := BIN_OP_EQ_eth_8_h_l71_c12_d8bd_return_output;

     -- BIN_OP_PLUS[eth_8_h_l68_c9_36ea] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l68_c9_36ea_left <= VAR_BIN_OP_PLUS_eth_8_h_l68_c9_36ea_left;
     BIN_OP_PLUS_eth_8_h_l68_c9_36ea_right <= VAR_BIN_OP_PLUS_eth_8_h_l68_c9_36ea_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l68_c9_36ea_return_output := BIN_OP_PLUS_eth_8_h_l68_c9_36ea_return_output;

     -- BIN_OP_PLUS[eth_8_h_l58_c9_e33e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l58_c9_e33e_left <= VAR_BIN_OP_PLUS_eth_8_h_l58_c9_e33e_left;
     BIN_OP_PLUS_eth_8_h_l58_c9_e33e_right <= VAR_BIN_OP_PLUS_eth_8_h_l58_c9_e33e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l58_c9_e33e_return_output := BIN_OP_PLUS_eth_8_h_l58_c9_e33e_return_output;

     -- CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l72_l73_l61_l71_DUPLICATE_50a4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l72_l73_l61_l71_DUPLICATE_50a4_return_output := header.ethertype;

     -- BIN_OP_EQ[eth_8_h_l51_c6_4d4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l51_c6_4d4d_left <= VAR_BIN_OP_EQ_eth_8_h_l51_c6_4d4d_left;
     BIN_OP_EQ_eth_8_h_l51_c6_4d4d_right <= VAR_BIN_OP_EQ_eth_8_h_l51_c6_4d4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l51_c6_4d4d_return_output := BIN_OP_EQ_eth_8_h_l51_c6_4d4d_return_output;

     -- BIN_OP_PLUS[eth_8_h_l78_c9_7dc8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l78_c9_7dc8_left <= VAR_BIN_OP_PLUS_eth_8_h_l78_c9_7dc8_left;
     BIN_OP_PLUS_eth_8_h_l78_c9_7dc8_right <= VAR_BIN_OP_PLUS_eth_8_h_l78_c9_7dc8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l78_c9_7dc8_return_output := BIN_OP_PLUS_eth_8_h_l78_c9_7dc8_return_output;

     -- BIN_OP_PLUS[eth_8_h_l92_c9_e96c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l92_c9_e96c_left <= VAR_BIN_OP_PLUS_eth_8_h_l92_c9_e96c_left;
     BIN_OP_PLUS_eth_8_h_l92_c9_e96c_right <= VAR_BIN_OP_PLUS_eth_8_h_l92_c9_e96c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l92_c9_e96c_return_output := BIN_OP_PLUS_eth_8_h_l92_c9_e96c_return_output;

     -- BIN_OP_EQ[eth_8_h_l64_c10_d6f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l64_c10_d6f6_left <= VAR_BIN_OP_EQ_eth_8_h_l64_c10_d6f6_left;
     BIN_OP_EQ_eth_8_h_l64_c10_d6f6_right <= VAR_BIN_OP_EQ_eth_8_h_l64_c10_d6f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l64_c10_d6f6_return_output := BIN_OP_EQ_eth_8_h_l64_c10_d6f6_return_output;

     -- UNARY_OP_NOT[eth_8_h_l89_c35_769b] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_eth_8_h_l89_c35_769b_expr <= VAR_UNARY_OP_NOT_eth_8_h_l89_c35_769b_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_eth_8_h_l89_c35_769b_return_output := UNARY_OP_NOT_eth_8_h_l89_c35_769b_return_output;

     -- BIN_OP_EQ[eth_8_h_l83_c11_85c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l83_c11_85c6_left <= VAR_BIN_OP_EQ_eth_8_h_l83_c11_85c6_left;
     BIN_OP_EQ_eth_8_h_l83_c11_85c6_right <= VAR_BIN_OP_EQ_eth_8_h_l83_c11_85c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l83_c11_85c6_return_output := BIN_OP_EQ_eth_8_h_l83_c11_85c6_return_output;

     -- CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l63_l73_DUPLICATE_928d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l63_l73_DUPLICATE_928d_return_output := VAR_mac_axis.data.tdata(0);

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l72_l87_l52_DUPLICATE_8072 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l72_l87_l52_DUPLICATE_8072_return_output := VAR_mac_axis.valid;

     -- CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d[eth_8_h_l85_c28_e8de] LATENCY=0
     VAR_CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d_eth_8_h_l85_c28_e8de_return_output := VAR_mac_axis.data;

     -- BIN_OP_EQ[eth_8_h_l86_c37_5933] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l86_c37_5933_left <= VAR_BIN_OP_EQ_eth_8_h_l86_c37_5933_left;
     BIN_OP_EQ_eth_8_h_l86_c37_5933_right <= VAR_BIN_OP_EQ_eth_8_h_l86_c37_5933_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l86_c37_5933_return_output := BIN_OP_EQ_eth_8_h_l86_c37_5933_return_output;

     -- CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l63_l61_l62_DUPLICATE_37a1 LATENCY=0
     VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l63_l61_l62_DUPLICATE_37a1_return_output := header.src_mac;

     -- BIN_OP_EQ[eth_8_h_l54_c10_f93b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l54_c10_f93b_left <= VAR_BIN_OP_EQ_eth_8_h_l54_c10_f93b_left;
     BIN_OP_EQ_eth_8_h_l54_c10_f93b_right <= VAR_BIN_OP_EQ_eth_8_h_l54_c10_f93b_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l54_c10_f93b_return_output := BIN_OP_EQ_eth_8_h_l54_c10_f93b_return_output;

     -- BIN_OP_EQ[eth_8_h_l61_c12_a153] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l61_c12_a153_left <= VAR_BIN_OP_EQ_eth_8_h_l61_c12_a153_left;
     BIN_OP_EQ_eth_8_h_l61_c12_a153_right <= VAR_BIN_OP_EQ_eth_8_h_l61_c12_a153_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l61_c12_a153_return_output := BIN_OP_EQ_eth_8_h_l61_c12_a153_return_output;

     -- Submodule level 1
     VAR_counter_MUX_eth_8_h_l51_c3_8b25_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_4d4d_return_output;
     VAR_header_MUX_eth_8_h_l51_c3_8b25_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_4d4d_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_4d4d_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_4d4d_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l51_c3_8b25_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_4d4d_return_output;
     VAR_o_overflow_MUX_eth_8_h_l51_c3_8b25_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_4d4d_return_output;
     VAR_state_MUX_eth_8_h_l51_c3_8b25_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_4d4d_return_output;
     VAR_counter_MUX_eth_8_h_l54_c7_7c67_cond := VAR_BIN_OP_EQ_eth_8_h_l54_c10_f93b_return_output;
     VAR_state_MUX_eth_8_h_l54_c7_7c67_cond := VAR_BIN_OP_EQ_eth_8_h_l54_c10_f93b_return_output;
     VAR_counter_MUX_eth_8_h_l61_c9_590e_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_a153_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l61_c9_590e_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_a153_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l61_c9_590e_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_a153_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_a153_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_a153_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l61_c9_590e_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_a153_return_output;
     VAR_o_overflow_MUX_eth_8_h_l61_c9_590e_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_a153_return_output;
     VAR_state_MUX_eth_8_h_l61_c9_590e_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_a153_return_output;
     VAR_counter_MUX_eth_8_h_l64_c7_fec9_cond := VAR_BIN_OP_EQ_eth_8_h_l64_c10_d6f6_return_output;
     VAR_state_MUX_eth_8_h_l64_c7_fec9_cond := VAR_BIN_OP_EQ_eth_8_h_l64_c10_d6f6_return_output;
     VAR_counter_MUX_eth_8_h_l71_c9_bf81_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_d8bd_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l71_c9_bf81_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_d8bd_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_d8bd_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_d8bd_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l71_c9_bf81_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_d8bd_return_output;
     VAR_o_overflow_MUX_eth_8_h_l71_c9_bf81_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_d8bd_return_output;
     VAR_state_MUX_eth_8_h_l71_c9_bf81_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_d8bd_return_output;
     VAR_counter_MUX_eth_8_h_l74_c7_faeb_cond := VAR_BIN_OP_EQ_eth_8_h_l74_c10_e95f_return_output;
     VAR_state_MUX_eth_8_h_l74_c7_faeb_cond := VAR_BIN_OP_EQ_eth_8_h_l74_c10_e95f_return_output;
     VAR_counter_MUX_eth_8_h_l83_c8_1dd8_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_85c6_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_85c6_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_85c6_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_85c6_return_output;
     VAR_o_overflow_MUX_eth_8_h_l83_c8_1dd8_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_85c6_return_output;
     VAR_state_MUX_eth_8_h_l83_c8_1dd8_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_85c6_return_output;
     VAR_counter_MUX_eth_8_h_l91_c7_8a69_cond := VAR_BIN_OP_EQ_eth_8_h_l86_c37_5933_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_iftrue := VAR_BIN_OP_EQ_eth_8_h_l86_c37_5933_return_output;
     VAR_counter_eth_8_h_l58_c9_8f3d := resize(VAR_BIN_OP_PLUS_eth_8_h_l58_c9_e33e_return_output, 3);
     VAR_counter_eth_8_h_l68_c9_d940 := resize(VAR_BIN_OP_PLUS_eth_8_h_l68_c9_36ea_return_output, 3);
     VAR_counter_eth_8_h_l78_c9_5699 := resize(VAR_BIN_OP_PLUS_eth_8_h_l78_c9_7dc8_return_output, 3);
     VAR_counter_eth_8_h_l92_c9_32d9 := resize(VAR_BIN_OP_PLUS_eth_8_h_l92_c9_e96c_return_output, 3);
     VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_iftrue := VAR_CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d_eth_8_h_l85_c28_e8de_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l61_c9_590e_iftrue := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l72_l73_l61_l71_DUPLICATE_50a4_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l71_c9_bf81_iffalse := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l72_l73_l61_l71_DUPLICATE_50a4_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l72_c5_7cf3_iffalse := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l72_l73_l61_l71_DUPLICATE_50a4_return_output;
     VAR_BIN_OP_AND_eth_8_h_l89_c18_f0b2_left := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l72_l87_l52_DUPLICATE_8072_return_output;
     VAR_counter_MUX_eth_8_h_l52_c5_c5f0_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l72_l87_l52_DUPLICATE_8072_return_output;
     VAR_counter_MUX_eth_8_h_l62_c5_a3da_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l72_l87_l52_DUPLICATE_8072_return_output;
     VAR_counter_MUX_eth_8_h_l72_c5_7cf3_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l72_l87_l52_DUPLICATE_8072_return_output;
     VAR_counter_MUX_eth_8_h_l90_c5_9391_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l72_l87_l52_DUPLICATE_8072_return_output;
     VAR_header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l72_l87_l52_DUPLICATE_8072_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l72_c5_7cf3_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l72_l87_l52_DUPLICATE_8072_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l62_c5_a3da_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l72_l87_l52_DUPLICATE_8072_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_iftrue := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l72_l87_l52_DUPLICATE_8072_return_output;
     VAR_state_MUX_eth_8_h_l52_c5_c5f0_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l72_l87_l52_DUPLICATE_8072_return_output;
     VAR_state_MUX_eth_8_h_l62_c5_a3da_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l72_l87_l52_DUPLICATE_8072_return_output;
     VAR_state_MUX_eth_8_h_l72_c5_7cf3_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l72_l87_l52_DUPLICATE_8072_return_output;
     VAR_state_MUX_eth_8_h_l90_c5_9391_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l62_l72_l87_l52_DUPLICATE_8072_return_output;
     VAR_header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l52_l53_DUPLICATE_0423_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l61_c9_590e_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l63_l61_l62_DUPLICATE_37a1_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l62_c5_a3da_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l63_l61_l62_DUPLICATE_37a1_return_output;
     VAR_BIN_OP_AND_eth_8_h_l89_c18_f0b2_right := VAR_UNARY_OP_NOT_eth_8_h_l89_c35_769b_return_output;
     VAR_counter_MUX_eth_8_h_l54_c7_7c67_iffalse := VAR_counter_eth_8_h_l58_c9_8f3d;
     VAR_counter_MUX_eth_8_h_l64_c7_fec9_iffalse := VAR_counter_eth_8_h_l68_c9_d940;
     VAR_counter_MUX_eth_8_h_l74_c7_faeb_iffalse := VAR_counter_eth_8_h_l78_c9_5699;
     VAR_counter_MUX_eth_8_h_l91_c7_8a69_iftrue := VAR_counter_eth_8_h_l92_c9_32d9;
     -- state_MUX[eth_8_h_l74_c7_faeb] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l74_c7_faeb_cond <= VAR_state_MUX_eth_8_h_l74_c7_faeb_cond;
     state_MUX_eth_8_h_l74_c7_faeb_iftrue <= VAR_state_MUX_eth_8_h_l74_c7_faeb_iftrue;
     state_MUX_eth_8_h_l74_c7_faeb_iffalse <= VAR_state_MUX_eth_8_h_l74_c7_faeb_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l74_c7_faeb_return_output := state_MUX_eth_8_h_l74_c7_faeb_return_output;

     -- counter_MUX[eth_8_h_l74_c7_faeb] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l74_c7_faeb_cond <= VAR_counter_MUX_eth_8_h_l74_c7_faeb_cond;
     counter_MUX_eth_8_h_l74_c7_faeb_iftrue <= VAR_counter_MUX_eth_8_h_l74_c7_faeb_iftrue;
     counter_MUX_eth_8_h_l74_c7_faeb_iffalse <= VAR_counter_MUX_eth_8_h_l74_c7_faeb_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l74_c7_faeb_return_output := counter_MUX_eth_8_h_l74_c7_faeb_return_output;

     -- BIN_OP_AND[eth_8_h_l89_c18_f0b2] LATENCY=0
     -- Inputs
     BIN_OP_AND_eth_8_h_l89_c18_f0b2_left <= VAR_BIN_OP_AND_eth_8_h_l89_c18_f0b2_left;
     BIN_OP_AND_eth_8_h_l89_c18_f0b2_right <= VAR_BIN_OP_AND_eth_8_h_l89_c18_f0b2_right;
     -- Outputs
     VAR_BIN_OP_AND_eth_8_h_l89_c18_f0b2_return_output := BIN_OP_AND_eth_8_h_l89_c18_f0b2_return_output;

     -- CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7[eth_8_h_l94_c10_bb7c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7_eth_8_h_l94_c10_bb7c_return_output := CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7(
     VAR_CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d_eth_8_h_l85_c28_e8de_return_output);

     -- state_MUX[eth_8_h_l64_c7_fec9] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l64_c7_fec9_cond <= VAR_state_MUX_eth_8_h_l64_c7_fec9_cond;
     state_MUX_eth_8_h_l64_c7_fec9_iftrue <= VAR_state_MUX_eth_8_h_l64_c7_fec9_iftrue;
     state_MUX_eth_8_h_l64_c7_fec9_iffalse <= VAR_state_MUX_eth_8_h_l64_c7_fec9_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l64_c7_fec9_return_output := state_MUX_eth_8_h_l64_c7_fec9_return_output;

     -- o_frame_valid_MUX[eth_8_h_l83_c8_1dd8] LATENCY=0
     -- Inputs
     o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_cond <= VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_cond;
     o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_iftrue <= VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_iftrue;
     o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_iffalse <= VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_iffalse;
     -- Outputs
     VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_return_output := o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_return_output;

     -- o_frame_data_start_of_payload_MUX[eth_8_h_l83_c8_1dd8] LATENCY=0
     -- Inputs
     o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_cond <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_cond;
     o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_iftrue <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_iftrue;
     o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_iffalse <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_iffalse;
     -- Outputs
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_return_output := o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_return_output;

     -- uint40_uint8[eth_8_h_l53_c24_6c48] LATENCY=0
     VAR_uint40_uint8_eth_8_h_l53_c24_6c48_return_output := uint40_uint8(
     resize(VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l52_l53_DUPLICATE_0423_return_output, 40),
     VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l63_l73_DUPLICATE_928d_return_output);

     -- state_MUX[eth_8_h_l54_c7_7c67] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l54_c7_7c67_cond <= VAR_state_MUX_eth_8_h_l54_c7_7c67_cond;
     state_MUX_eth_8_h_l54_c7_7c67_iftrue <= VAR_state_MUX_eth_8_h_l54_c7_7c67_iftrue;
     state_MUX_eth_8_h_l54_c7_7c67_iffalse <= VAR_state_MUX_eth_8_h_l54_c7_7c67_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l54_c7_7c67_return_output := state_MUX_eth_8_h_l54_c7_7c67_return_output;

     -- counter_MUX[eth_8_h_l54_c7_7c67] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l54_c7_7c67_cond <= VAR_counter_MUX_eth_8_h_l54_c7_7c67_cond;
     counter_MUX_eth_8_h_l54_c7_7c67_iftrue <= VAR_counter_MUX_eth_8_h_l54_c7_7c67_iftrue;
     counter_MUX_eth_8_h_l54_c7_7c67_iffalse <= VAR_counter_MUX_eth_8_h_l54_c7_7c67_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l54_c7_7c67_return_output := counter_MUX_eth_8_h_l54_c7_7c67_return_output;

     -- uint8_uint8[eth_8_h_l73_c26_864f] LATENCY=0
     VAR_uint8_uint8_eth_8_h_l73_c26_864f_return_output := uint8_uint8(
     resize(VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l72_l73_l61_l71_DUPLICATE_50a4_return_output, 8),
     VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l63_l73_DUPLICATE_928d_return_output);

     -- counter_MUX[eth_8_h_l64_c7_fec9] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l64_c7_fec9_cond <= VAR_counter_MUX_eth_8_h_l64_c7_fec9_cond;
     counter_MUX_eth_8_h_l64_c7_fec9_iftrue <= VAR_counter_MUX_eth_8_h_l64_c7_fec9_iftrue;
     counter_MUX_eth_8_h_l64_c7_fec9_iffalse <= VAR_counter_MUX_eth_8_h_l64_c7_fec9_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l64_c7_fec9_return_output := counter_MUX_eth_8_h_l64_c7_fec9_return_output;

     -- uint40_uint8[eth_8_h_l63_c24_a2e5] LATENCY=0
     VAR_uint40_uint8_eth_8_h_l63_c24_a2e5_return_output := uint40_uint8(
     resize(VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l63_l61_l62_DUPLICATE_37a1_return_output, 40),
     VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l63_l73_DUPLICATE_928d_return_output);

     -- counter_MUX[eth_8_h_l91_c7_8a69] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l91_c7_8a69_cond <= VAR_counter_MUX_eth_8_h_l91_c7_8a69_cond;
     counter_MUX_eth_8_h_l91_c7_8a69_iftrue <= VAR_counter_MUX_eth_8_h_l91_c7_8a69_iftrue;
     counter_MUX_eth_8_h_l91_c7_8a69_iffalse <= VAR_counter_MUX_eth_8_h_l91_c7_8a69_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l91_c7_8a69_return_output := counter_MUX_eth_8_h_l91_c7_8a69_return_output;

     -- o_frame_data_payload_MUX[eth_8_h_l83_c8_1dd8] LATENCY=0
     -- Inputs
     o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_cond <= VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_cond;
     o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_iftrue <= VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_iftrue;
     o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_iffalse <= VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_iffalse;
     -- Outputs
     VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_return_output := o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_return_output;

     -- Submodule level 2
     VAR_o_overflow_MUX_eth_8_h_l83_c8_1dd8_iftrue := VAR_BIN_OP_AND_eth_8_h_l89_c18_f0b2_return_output;
     VAR_counter_MUX_eth_8_h_l94_c7_9a01_cond := VAR_CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7_eth_8_h_l94_c10_bb7c_return_output;
     VAR_state_MUX_eth_8_h_l94_c7_9a01_cond := VAR_CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7_eth_8_h_l94_c10_bb7c_return_output;
     VAR_counter_MUX_eth_8_h_l52_c5_c5f0_iftrue := VAR_counter_MUX_eth_8_h_l54_c7_7c67_return_output;
     VAR_counter_MUX_eth_8_h_l62_c5_a3da_iftrue := VAR_counter_MUX_eth_8_h_l64_c7_fec9_return_output;
     VAR_counter_MUX_eth_8_h_l72_c5_7cf3_iftrue := VAR_counter_MUX_eth_8_h_l74_c7_faeb_return_output;
     VAR_counter_MUX_eth_8_h_l94_c7_9a01_iffalse := VAR_counter_MUX_eth_8_h_l91_c7_8a69_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_iffalse := VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_1dd8_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_iffalse := VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_1dd8_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l71_c9_bf81_iffalse := VAR_o_frame_valid_MUX_eth_8_h_l83_c8_1dd8_return_output;
     VAR_state_MUX_eth_8_h_l52_c5_c5f0_iftrue := VAR_state_MUX_eth_8_h_l54_c7_7c67_return_output;
     VAR_state_MUX_eth_8_h_l62_c5_a3da_iftrue := VAR_state_MUX_eth_8_h_l64_c7_fec9_return_output;
     VAR_state_MUX_eth_8_h_l72_c5_7cf3_iftrue := VAR_state_MUX_eth_8_h_l74_c7_faeb_return_output;
     VAR_header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_iftrue := VAR_uint40_uint8_eth_8_h_l53_c24_6c48_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l62_c5_a3da_iftrue := VAR_uint40_uint8_eth_8_h_l63_c24_a2e5_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l72_c5_7cf3_iftrue := VAR_uint8_uint8_eth_8_h_l73_c26_864f_return_output;
     -- counter_MUX[eth_8_h_l72_c5_7cf3] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l72_c5_7cf3_cond <= VAR_counter_MUX_eth_8_h_l72_c5_7cf3_cond;
     counter_MUX_eth_8_h_l72_c5_7cf3_iftrue <= VAR_counter_MUX_eth_8_h_l72_c5_7cf3_iftrue;
     counter_MUX_eth_8_h_l72_c5_7cf3_iffalse <= VAR_counter_MUX_eth_8_h_l72_c5_7cf3_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l72_c5_7cf3_return_output := counter_MUX_eth_8_h_l72_c5_7cf3_return_output;

     -- state_MUX[eth_8_h_l72_c5_7cf3] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l72_c5_7cf3_cond <= VAR_state_MUX_eth_8_h_l72_c5_7cf3_cond;
     state_MUX_eth_8_h_l72_c5_7cf3_iftrue <= VAR_state_MUX_eth_8_h_l72_c5_7cf3_iftrue;
     state_MUX_eth_8_h_l72_c5_7cf3_iffalse <= VAR_state_MUX_eth_8_h_l72_c5_7cf3_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l72_c5_7cf3_return_output := state_MUX_eth_8_h_l72_c5_7cf3_return_output;

     -- o_overflow_MUX[eth_8_h_l83_c8_1dd8] LATENCY=0
     -- Inputs
     o_overflow_MUX_eth_8_h_l83_c8_1dd8_cond <= VAR_o_overflow_MUX_eth_8_h_l83_c8_1dd8_cond;
     o_overflow_MUX_eth_8_h_l83_c8_1dd8_iftrue <= VAR_o_overflow_MUX_eth_8_h_l83_c8_1dd8_iftrue;
     o_overflow_MUX_eth_8_h_l83_c8_1dd8_iffalse <= VAR_o_overflow_MUX_eth_8_h_l83_c8_1dd8_iffalse;
     -- Outputs
     VAR_o_overflow_MUX_eth_8_h_l83_c8_1dd8_return_output := o_overflow_MUX_eth_8_h_l83_c8_1dd8_return_output;

     -- state_MUX[eth_8_h_l62_c5_a3da] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l62_c5_a3da_cond <= VAR_state_MUX_eth_8_h_l62_c5_a3da_cond;
     state_MUX_eth_8_h_l62_c5_a3da_iftrue <= VAR_state_MUX_eth_8_h_l62_c5_a3da_iftrue;
     state_MUX_eth_8_h_l62_c5_a3da_iffalse <= VAR_state_MUX_eth_8_h_l62_c5_a3da_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l62_c5_a3da_return_output := state_MUX_eth_8_h_l62_c5_a3da_return_output;

     -- header_ethertype_MUX[eth_8_h_l72_c5_7cf3] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l72_c5_7cf3_cond <= VAR_header_ethertype_MUX_eth_8_h_l72_c5_7cf3_cond;
     header_ethertype_MUX_eth_8_h_l72_c5_7cf3_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l72_c5_7cf3_iftrue;
     header_ethertype_MUX_eth_8_h_l72_c5_7cf3_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l72_c5_7cf3_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l72_c5_7cf3_return_output := header_ethertype_MUX_eth_8_h_l72_c5_7cf3_return_output;

     -- counter_MUX[eth_8_h_l94_c7_9a01] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l94_c7_9a01_cond <= VAR_counter_MUX_eth_8_h_l94_c7_9a01_cond;
     counter_MUX_eth_8_h_l94_c7_9a01_iftrue <= VAR_counter_MUX_eth_8_h_l94_c7_9a01_iftrue;
     counter_MUX_eth_8_h_l94_c7_9a01_iffalse <= VAR_counter_MUX_eth_8_h_l94_c7_9a01_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l94_c7_9a01_return_output := counter_MUX_eth_8_h_l94_c7_9a01_return_output;

     -- o_frame_data_payload_MUX[eth_8_h_l71_c9_bf81] LATENCY=0
     -- Inputs
     o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_cond <= VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_cond;
     o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_iftrue <= VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_iftrue;
     o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_iffalse <= VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_iffalse;
     -- Outputs
     VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_return_output := o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_return_output;

     -- o_frame_valid_MUX[eth_8_h_l71_c9_bf81] LATENCY=0
     -- Inputs
     o_frame_valid_MUX_eth_8_h_l71_c9_bf81_cond <= VAR_o_frame_valid_MUX_eth_8_h_l71_c9_bf81_cond;
     o_frame_valid_MUX_eth_8_h_l71_c9_bf81_iftrue <= VAR_o_frame_valid_MUX_eth_8_h_l71_c9_bf81_iftrue;
     o_frame_valid_MUX_eth_8_h_l71_c9_bf81_iffalse <= VAR_o_frame_valid_MUX_eth_8_h_l71_c9_bf81_iffalse;
     -- Outputs
     VAR_o_frame_valid_MUX_eth_8_h_l71_c9_bf81_return_output := o_frame_valid_MUX_eth_8_h_l71_c9_bf81_return_output;

     -- counter_MUX[eth_8_h_l62_c5_a3da] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l62_c5_a3da_cond <= VAR_counter_MUX_eth_8_h_l62_c5_a3da_cond;
     counter_MUX_eth_8_h_l62_c5_a3da_iftrue <= VAR_counter_MUX_eth_8_h_l62_c5_a3da_iftrue;
     counter_MUX_eth_8_h_l62_c5_a3da_iffalse <= VAR_counter_MUX_eth_8_h_l62_c5_a3da_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l62_c5_a3da_return_output := counter_MUX_eth_8_h_l62_c5_a3da_return_output;

     -- header_src_mac_MUX[eth_8_h_l62_c5_a3da] LATENCY=0
     -- Inputs
     header_src_mac_MUX_eth_8_h_l62_c5_a3da_cond <= VAR_header_src_mac_MUX_eth_8_h_l62_c5_a3da_cond;
     header_src_mac_MUX_eth_8_h_l62_c5_a3da_iftrue <= VAR_header_src_mac_MUX_eth_8_h_l62_c5_a3da_iftrue;
     header_src_mac_MUX_eth_8_h_l62_c5_a3da_iffalse <= VAR_header_src_mac_MUX_eth_8_h_l62_c5_a3da_iffalse;
     -- Outputs
     VAR_header_src_mac_MUX_eth_8_h_l62_c5_a3da_return_output := header_src_mac_MUX_eth_8_h_l62_c5_a3da_return_output;

     -- state_MUX[eth_8_h_l94_c7_9a01] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l94_c7_9a01_cond <= VAR_state_MUX_eth_8_h_l94_c7_9a01_cond;
     state_MUX_eth_8_h_l94_c7_9a01_iftrue <= VAR_state_MUX_eth_8_h_l94_c7_9a01_iftrue;
     state_MUX_eth_8_h_l94_c7_9a01_iffalse <= VAR_state_MUX_eth_8_h_l94_c7_9a01_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l94_c7_9a01_return_output := state_MUX_eth_8_h_l94_c7_9a01_return_output;

     -- state_MUX[eth_8_h_l52_c5_c5f0] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l52_c5_c5f0_cond <= VAR_state_MUX_eth_8_h_l52_c5_c5f0_cond;
     state_MUX_eth_8_h_l52_c5_c5f0_iftrue <= VAR_state_MUX_eth_8_h_l52_c5_c5f0_iftrue;
     state_MUX_eth_8_h_l52_c5_c5f0_iffalse <= VAR_state_MUX_eth_8_h_l52_c5_c5f0_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l52_c5_c5f0_return_output := state_MUX_eth_8_h_l52_c5_c5f0_return_output;

     -- header_dst_mac_MUX[eth_8_h_l52_c5_c5f0] LATENCY=0
     -- Inputs
     header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_cond <= VAR_header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_cond;
     header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_iftrue <= VAR_header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_iftrue;
     header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_iffalse <= VAR_header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_iffalse;
     -- Outputs
     VAR_header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_return_output := header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_return_output;

     -- o_frame_data_start_of_payload_MUX[eth_8_h_l71_c9_bf81] LATENCY=0
     -- Inputs
     o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_cond <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_cond;
     o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_iftrue <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_iftrue;
     o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_iffalse <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_iffalse;
     -- Outputs
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_return_output := o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_return_output;

     -- counter_MUX[eth_8_h_l52_c5_c5f0] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l52_c5_c5f0_cond <= VAR_counter_MUX_eth_8_h_l52_c5_c5f0_cond;
     counter_MUX_eth_8_h_l52_c5_c5f0_iftrue <= VAR_counter_MUX_eth_8_h_l52_c5_c5f0_iftrue;
     counter_MUX_eth_8_h_l52_c5_c5f0_iffalse <= VAR_counter_MUX_eth_8_h_l52_c5_c5f0_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l52_c5_c5f0_return_output := counter_MUX_eth_8_h_l52_c5_c5f0_return_output;

     -- Submodule level 3
     VAR_counter_MUX_eth_8_h_l51_c3_8b25_iftrue := VAR_counter_MUX_eth_8_h_l52_c5_c5f0_return_output;
     VAR_counter_MUX_eth_8_h_l61_c9_590e_iftrue := VAR_counter_MUX_eth_8_h_l62_c5_a3da_return_output;
     VAR_counter_MUX_eth_8_h_l71_c9_bf81_iftrue := VAR_counter_MUX_eth_8_h_l72_c5_7cf3_return_output;
     VAR_counter_MUX_eth_8_h_l90_c5_9391_iftrue := VAR_counter_MUX_eth_8_h_l94_c7_9a01_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l71_c9_bf81_iftrue := VAR_header_ethertype_MUX_eth_8_h_l72_c5_7cf3_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l61_c9_590e_iftrue := VAR_header_src_mac_MUX_eth_8_h_l62_c5_a3da_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_iffalse := VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_bf81_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_iffalse := VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_bf81_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l61_c9_590e_iffalse := VAR_o_frame_valid_MUX_eth_8_h_l71_c9_bf81_return_output;
     VAR_o_overflow_MUX_eth_8_h_l71_c9_bf81_iffalse := VAR_o_overflow_MUX_eth_8_h_l83_c8_1dd8_return_output;
     VAR_state_MUX_eth_8_h_l51_c3_8b25_iftrue := VAR_state_MUX_eth_8_h_l52_c5_c5f0_return_output;
     VAR_state_MUX_eth_8_h_l61_c9_590e_iftrue := VAR_state_MUX_eth_8_h_l62_c5_a3da_return_output;
     VAR_state_MUX_eth_8_h_l71_c9_bf81_iftrue := VAR_state_MUX_eth_8_h_l72_c5_7cf3_return_output;
     VAR_state_MUX_eth_8_h_l90_c5_9391_iftrue := VAR_state_MUX_eth_8_h_l94_c7_9a01_return_output;
     -- counter_MUX[eth_8_h_l90_c5_9391] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l90_c5_9391_cond <= VAR_counter_MUX_eth_8_h_l90_c5_9391_cond;
     counter_MUX_eth_8_h_l90_c5_9391_iftrue <= VAR_counter_MUX_eth_8_h_l90_c5_9391_iftrue;
     counter_MUX_eth_8_h_l90_c5_9391_iffalse <= VAR_counter_MUX_eth_8_h_l90_c5_9391_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l90_c5_9391_return_output := counter_MUX_eth_8_h_l90_c5_9391_return_output;

     -- state_MUX[eth_8_h_l90_c5_9391] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l90_c5_9391_cond <= VAR_state_MUX_eth_8_h_l90_c5_9391_cond;
     state_MUX_eth_8_h_l90_c5_9391_iftrue <= VAR_state_MUX_eth_8_h_l90_c5_9391_iftrue;
     state_MUX_eth_8_h_l90_c5_9391_iffalse <= VAR_state_MUX_eth_8_h_l90_c5_9391_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l90_c5_9391_return_output := state_MUX_eth_8_h_l90_c5_9391_return_output;

     -- header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484[eth_8_h_l51_c3_8b25] LATENCY=0
     VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l51_c3_8b25_return_output := CONST_REF_RD_eth_header_t_eth_header_t_e484(
     header,
     VAR_header_dst_mac_MUX_eth_8_h_l52_c5_c5f0_return_output);

     -- o_frame_data_start_of_payload_MUX[eth_8_h_l61_c9_590e] LATENCY=0
     -- Inputs
     o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_cond <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_cond;
     o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_iftrue <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_iftrue;
     o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_iffalse <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_iffalse;
     -- Outputs
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_return_output := o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_return_output;

     -- header_src_mac_MUX[eth_8_h_l61_c9_590e] LATENCY=0
     -- Inputs
     header_src_mac_MUX_eth_8_h_l61_c9_590e_cond <= VAR_header_src_mac_MUX_eth_8_h_l61_c9_590e_cond;
     header_src_mac_MUX_eth_8_h_l61_c9_590e_iftrue <= VAR_header_src_mac_MUX_eth_8_h_l61_c9_590e_iftrue;
     header_src_mac_MUX_eth_8_h_l61_c9_590e_iffalse <= VAR_header_src_mac_MUX_eth_8_h_l61_c9_590e_iffalse;
     -- Outputs
     VAR_header_src_mac_MUX_eth_8_h_l61_c9_590e_return_output := header_src_mac_MUX_eth_8_h_l61_c9_590e_return_output;

     -- o_frame_data_payload_MUX[eth_8_h_l61_c9_590e] LATENCY=0
     -- Inputs
     o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_cond <= VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_cond;
     o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_iftrue <= VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_iftrue;
     o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_iffalse <= VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_iffalse;
     -- Outputs
     VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_return_output := o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_return_output;

     -- header_ethertype_MUX[eth_8_h_l71_c9_bf81] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l71_c9_bf81_cond <= VAR_header_ethertype_MUX_eth_8_h_l71_c9_bf81_cond;
     header_ethertype_MUX_eth_8_h_l71_c9_bf81_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l71_c9_bf81_iftrue;
     header_ethertype_MUX_eth_8_h_l71_c9_bf81_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l71_c9_bf81_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l71_c9_bf81_return_output := header_ethertype_MUX_eth_8_h_l71_c9_bf81_return_output;

     -- o_overflow_MUX[eth_8_h_l71_c9_bf81] LATENCY=0
     -- Inputs
     o_overflow_MUX_eth_8_h_l71_c9_bf81_cond <= VAR_o_overflow_MUX_eth_8_h_l71_c9_bf81_cond;
     o_overflow_MUX_eth_8_h_l71_c9_bf81_iftrue <= VAR_o_overflow_MUX_eth_8_h_l71_c9_bf81_iftrue;
     o_overflow_MUX_eth_8_h_l71_c9_bf81_iffalse <= VAR_o_overflow_MUX_eth_8_h_l71_c9_bf81_iffalse;
     -- Outputs
     VAR_o_overflow_MUX_eth_8_h_l71_c9_bf81_return_output := o_overflow_MUX_eth_8_h_l71_c9_bf81_return_output;

     -- o_frame_valid_MUX[eth_8_h_l61_c9_590e] LATENCY=0
     -- Inputs
     o_frame_valid_MUX_eth_8_h_l61_c9_590e_cond <= VAR_o_frame_valid_MUX_eth_8_h_l61_c9_590e_cond;
     o_frame_valid_MUX_eth_8_h_l61_c9_590e_iftrue <= VAR_o_frame_valid_MUX_eth_8_h_l61_c9_590e_iftrue;
     o_frame_valid_MUX_eth_8_h_l61_c9_590e_iffalse <= VAR_o_frame_valid_MUX_eth_8_h_l61_c9_590e_iffalse;
     -- Outputs
     VAR_o_frame_valid_MUX_eth_8_h_l61_c9_590e_return_output := o_frame_valid_MUX_eth_8_h_l61_c9_590e_return_output;

     -- Submodule level 4
     VAR_counter_MUX_eth_8_h_l83_c8_1dd8_iftrue := VAR_counter_MUX_eth_8_h_l90_c5_9391_return_output;
     VAR_header_MUX_eth_8_h_l51_c3_8b25_iftrue := VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l51_c3_8b25_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l61_c9_590e_iffalse := VAR_header_ethertype_MUX_eth_8_h_l71_c9_bf81_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_iffalse := VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_590e_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_iffalse := VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_590e_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l51_c3_8b25_iffalse := VAR_o_frame_valid_MUX_eth_8_h_l61_c9_590e_return_output;
     VAR_o_overflow_MUX_eth_8_h_l61_c9_590e_iffalse := VAR_o_overflow_MUX_eth_8_h_l71_c9_bf81_return_output;
     VAR_state_MUX_eth_8_h_l83_c8_1dd8_iftrue := VAR_state_MUX_eth_8_h_l90_c5_9391_return_output;
     -- o_frame_valid_MUX[eth_8_h_l51_c3_8b25] LATENCY=0
     -- Inputs
     o_frame_valid_MUX_eth_8_h_l51_c3_8b25_cond <= VAR_o_frame_valid_MUX_eth_8_h_l51_c3_8b25_cond;
     o_frame_valid_MUX_eth_8_h_l51_c3_8b25_iftrue <= VAR_o_frame_valid_MUX_eth_8_h_l51_c3_8b25_iftrue;
     o_frame_valid_MUX_eth_8_h_l51_c3_8b25_iffalse <= VAR_o_frame_valid_MUX_eth_8_h_l51_c3_8b25_iffalse;
     -- Outputs
     VAR_o_frame_valid_MUX_eth_8_h_l51_c3_8b25_return_output := o_frame_valid_MUX_eth_8_h_l51_c3_8b25_return_output;

     -- o_frame_data_start_of_payload_MUX[eth_8_h_l51_c3_8b25] LATENCY=0
     -- Inputs
     o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_cond <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_cond;
     o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_iftrue <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_iftrue;
     o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_iffalse <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_iffalse;
     -- Outputs
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_return_output := o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_return_output;

     -- header_ethertype_MUX[eth_8_h_l61_c9_590e] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l61_c9_590e_cond <= VAR_header_ethertype_MUX_eth_8_h_l61_c9_590e_cond;
     header_ethertype_MUX_eth_8_h_l61_c9_590e_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l61_c9_590e_iftrue;
     header_ethertype_MUX_eth_8_h_l61_c9_590e_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l61_c9_590e_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l61_c9_590e_return_output := header_ethertype_MUX_eth_8_h_l61_c9_590e_return_output;

     -- o_overflow_MUX[eth_8_h_l61_c9_590e] LATENCY=0
     -- Inputs
     o_overflow_MUX_eth_8_h_l61_c9_590e_cond <= VAR_o_overflow_MUX_eth_8_h_l61_c9_590e_cond;
     o_overflow_MUX_eth_8_h_l61_c9_590e_iftrue <= VAR_o_overflow_MUX_eth_8_h_l61_c9_590e_iftrue;
     o_overflow_MUX_eth_8_h_l61_c9_590e_iffalse <= VAR_o_overflow_MUX_eth_8_h_l61_c9_590e_iffalse;
     -- Outputs
     VAR_o_overflow_MUX_eth_8_h_l61_c9_590e_return_output := o_overflow_MUX_eth_8_h_l61_c9_590e_return_output;

     -- counter_MUX[eth_8_h_l83_c8_1dd8] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l83_c8_1dd8_cond <= VAR_counter_MUX_eth_8_h_l83_c8_1dd8_cond;
     counter_MUX_eth_8_h_l83_c8_1dd8_iftrue <= VAR_counter_MUX_eth_8_h_l83_c8_1dd8_iftrue;
     counter_MUX_eth_8_h_l83_c8_1dd8_iffalse <= VAR_counter_MUX_eth_8_h_l83_c8_1dd8_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l83_c8_1dd8_return_output := counter_MUX_eth_8_h_l83_c8_1dd8_return_output;

     -- state_MUX[eth_8_h_l83_c8_1dd8] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l83_c8_1dd8_cond <= VAR_state_MUX_eth_8_h_l83_c8_1dd8_cond;
     state_MUX_eth_8_h_l83_c8_1dd8_iftrue <= VAR_state_MUX_eth_8_h_l83_c8_1dd8_iftrue;
     state_MUX_eth_8_h_l83_c8_1dd8_iffalse <= VAR_state_MUX_eth_8_h_l83_c8_1dd8_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l83_c8_1dd8_return_output := state_MUX_eth_8_h_l83_c8_1dd8_return_output;

     -- o_frame_data_payload_MUX[eth_8_h_l51_c3_8b25] LATENCY=0
     -- Inputs
     o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_cond <= VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_cond;
     o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_iftrue <= VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_iftrue;
     o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_iffalse <= VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_iffalse;
     -- Outputs
     VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_return_output := o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_return_output;

     -- Submodule level 5
     VAR_counter_MUX_eth_8_h_l71_c9_bf81_iffalse := VAR_counter_MUX_eth_8_h_l83_c8_1dd8_return_output;
     VAR_o_overflow_MUX_eth_8_h_l51_c3_8b25_iffalse := VAR_o_overflow_MUX_eth_8_h_l61_c9_590e_return_output;
     VAR_state_MUX_eth_8_h_l71_c9_bf81_iffalse := VAR_state_MUX_eth_8_h_l83_c8_1dd8_return_output;
     -- counter_MUX[eth_8_h_l71_c9_bf81] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l71_c9_bf81_cond <= VAR_counter_MUX_eth_8_h_l71_c9_bf81_cond;
     counter_MUX_eth_8_h_l71_c9_bf81_iftrue <= VAR_counter_MUX_eth_8_h_l71_c9_bf81_iftrue;
     counter_MUX_eth_8_h_l71_c9_bf81_iffalse <= VAR_counter_MUX_eth_8_h_l71_c9_bf81_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l71_c9_bf81_return_output := counter_MUX_eth_8_h_l71_c9_bf81_return_output;

     -- state_MUX[eth_8_h_l71_c9_bf81] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l71_c9_bf81_cond <= VAR_state_MUX_eth_8_h_l71_c9_bf81_cond;
     state_MUX_eth_8_h_l71_c9_bf81_iftrue <= VAR_state_MUX_eth_8_h_l71_c9_bf81_iftrue;
     state_MUX_eth_8_h_l71_c9_bf81_iffalse <= VAR_state_MUX_eth_8_h_l71_c9_bf81_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l71_c9_bf81_return_output := state_MUX_eth_8_h_l71_c9_bf81_return_output;

     -- header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_488d[eth_8_h_l51_c3_8b25] LATENCY=0
     VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_488d_eth_8_h_l51_c3_8b25_return_output := CONST_REF_RD_eth_header_t_eth_header_t_488d(
     header,
     VAR_header_src_mac_MUX_eth_8_h_l61_c9_590e_return_output,
     VAR_header_ethertype_MUX_eth_8_h_l61_c9_590e_return_output);

     -- o_overflow_MUX[eth_8_h_l51_c3_8b25] LATENCY=0
     -- Inputs
     o_overflow_MUX_eth_8_h_l51_c3_8b25_cond <= VAR_o_overflow_MUX_eth_8_h_l51_c3_8b25_cond;
     o_overflow_MUX_eth_8_h_l51_c3_8b25_iftrue <= VAR_o_overflow_MUX_eth_8_h_l51_c3_8b25_iftrue;
     o_overflow_MUX_eth_8_h_l51_c3_8b25_iffalse <= VAR_o_overflow_MUX_eth_8_h_l51_c3_8b25_iffalse;
     -- Outputs
     VAR_o_overflow_MUX_eth_8_h_l51_c3_8b25_return_output := o_overflow_MUX_eth_8_h_l51_c3_8b25_return_output;

     -- Submodule level 6
     VAR_counter_MUX_eth_8_h_l61_c9_590e_iffalse := VAR_counter_MUX_eth_8_h_l71_c9_bf81_return_output;
     VAR_header_MUX_eth_8_h_l51_c3_8b25_iffalse := VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_488d_eth_8_h_l51_c3_8b25_return_output;
     VAR_state_MUX_eth_8_h_l61_c9_590e_iffalse := VAR_state_MUX_eth_8_h_l71_c9_bf81_return_output;
     -- counter_MUX[eth_8_h_l61_c9_590e] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l61_c9_590e_cond <= VAR_counter_MUX_eth_8_h_l61_c9_590e_cond;
     counter_MUX_eth_8_h_l61_c9_590e_iftrue <= VAR_counter_MUX_eth_8_h_l61_c9_590e_iftrue;
     counter_MUX_eth_8_h_l61_c9_590e_iffalse <= VAR_counter_MUX_eth_8_h_l61_c9_590e_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l61_c9_590e_return_output := counter_MUX_eth_8_h_l61_c9_590e_return_output;

     -- header_MUX[eth_8_h_l51_c3_8b25] LATENCY=0
     -- Inputs
     header_MUX_eth_8_h_l51_c3_8b25_cond <= VAR_header_MUX_eth_8_h_l51_c3_8b25_cond;
     header_MUX_eth_8_h_l51_c3_8b25_iftrue <= VAR_header_MUX_eth_8_h_l51_c3_8b25_iftrue;
     header_MUX_eth_8_h_l51_c3_8b25_iffalse <= VAR_header_MUX_eth_8_h_l51_c3_8b25_iffalse;
     -- Outputs
     VAR_header_MUX_eth_8_h_l51_c3_8b25_return_output := header_MUX_eth_8_h_l51_c3_8b25_return_output;

     -- state_MUX[eth_8_h_l61_c9_590e] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l61_c9_590e_cond <= VAR_state_MUX_eth_8_h_l61_c9_590e_cond;
     state_MUX_eth_8_h_l61_c9_590e_iftrue <= VAR_state_MUX_eth_8_h_l61_c9_590e_iftrue;
     state_MUX_eth_8_h_l61_c9_590e_iffalse <= VAR_state_MUX_eth_8_h_l61_c9_590e_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l61_c9_590e_return_output := state_MUX_eth_8_h_l61_c9_590e_return_output;

     -- CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_1622[eth_8_h_l100_c10_e99d] LATENCY=0
     VAR_CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_1622_eth_8_h_l100_c10_e99d_return_output := CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_1622(
     header,
     VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_8b25_return_output,
     VAR_o_overflow_MUX_eth_8_h_l51_c3_8b25_return_output,
     VAR_o_frame_valid_MUX_eth_8_h_l51_c3_8b25_return_output,
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_8b25_return_output);

     -- Submodule level 7
     VAR_return_output := VAR_CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_1622_eth_8_h_l100_c10_e99d_return_output;
     VAR_counter_MUX_eth_8_h_l51_c3_8b25_iffalse := VAR_counter_MUX_eth_8_h_l61_c9_590e_return_output;
     REG_VAR_header := VAR_header_MUX_eth_8_h_l51_c3_8b25_return_output;
     VAR_state_MUX_eth_8_h_l51_c3_8b25_iffalse := VAR_state_MUX_eth_8_h_l61_c9_590e_return_output;
     -- counter_MUX[eth_8_h_l51_c3_8b25] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l51_c3_8b25_cond <= VAR_counter_MUX_eth_8_h_l51_c3_8b25_cond;
     counter_MUX_eth_8_h_l51_c3_8b25_iftrue <= VAR_counter_MUX_eth_8_h_l51_c3_8b25_iftrue;
     counter_MUX_eth_8_h_l51_c3_8b25_iffalse <= VAR_counter_MUX_eth_8_h_l51_c3_8b25_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l51_c3_8b25_return_output := counter_MUX_eth_8_h_l51_c3_8b25_return_output;

     -- state_MUX[eth_8_h_l51_c3_8b25] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l51_c3_8b25_cond <= VAR_state_MUX_eth_8_h_l51_c3_8b25_cond;
     state_MUX_eth_8_h_l51_c3_8b25_iftrue <= VAR_state_MUX_eth_8_h_l51_c3_8b25_iftrue;
     state_MUX_eth_8_h_l51_c3_8b25_iffalse <= VAR_state_MUX_eth_8_h_l51_c3_8b25_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l51_c3_8b25_return_output := state_MUX_eth_8_h_l51_c3_8b25_return_output;

     -- Submodule level 8
     REG_VAR_counter := VAR_counter_MUX_eth_8_h_l51_c3_8b25_return_output;
     REG_VAR_state := VAR_state_MUX_eth_8_h_l51_c3_8b25_return_output;
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
