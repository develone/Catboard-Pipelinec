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
-- BIN_OP_EQ[eth_8_h_l51_c6_60ab]
signal BIN_OP_EQ_eth_8_h_l51_c6_60ab_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l51_c6_60ab_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l51_c6_60ab_return_output : unsigned(0 downto 0);

-- o_frame_data_payload_MUX[eth_8_h_l51_c3_b743]
signal o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_cond : unsigned(0 downto 0);
signal o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_iftrue : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_iffalse : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_return_output : axis8_t;

-- o_overflow_MUX[eth_8_h_l51_c3_b743]
signal o_overflow_MUX_eth_8_h_l51_c3_b743_cond : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l51_c3_b743_iftrue : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l51_c3_b743_iffalse : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l51_c3_b743_return_output : unsigned(0 downto 0);

-- o_frame_valid_MUX[eth_8_h_l51_c3_b743]
signal o_frame_valid_MUX_eth_8_h_l51_c3_b743_cond : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l51_c3_b743_iftrue : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l51_c3_b743_iffalse : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l51_c3_b743_return_output : unsigned(0 downto 0);

-- o_frame_data_start_of_payload_MUX[eth_8_h_l51_c3_b743]
signal o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_cond : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_iftrue : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_iffalse : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_return_output : unsigned(0 downto 0);

-- header_MUX[eth_8_h_l51_c3_b743]
signal header_MUX_eth_8_h_l51_c3_b743_cond : unsigned(0 downto 0);
signal header_MUX_eth_8_h_l51_c3_b743_iftrue : eth_header_t;
signal header_MUX_eth_8_h_l51_c3_b743_iffalse : eth_header_t;
signal header_MUX_eth_8_h_l51_c3_b743_return_output : eth_header_t;

-- state_MUX[eth_8_h_l51_c3_b743]
signal state_MUX_eth_8_h_l51_c3_b743_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l51_c3_b743_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l51_c3_b743_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l51_c3_b743_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l51_c3_b743]
signal counter_MUX_eth_8_h_l51_c3_b743_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l51_c3_b743_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l51_c3_b743_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l51_c3_b743_return_output : unsigned(2 downto 0);

-- header_dst_mac_MUX[eth_8_h_l52_c5_63c9]
signal header_dst_mac_MUX_eth_8_h_l52_c5_63c9_cond : unsigned(0 downto 0);
signal header_dst_mac_MUX_eth_8_h_l52_c5_63c9_iftrue : unsigned(47 downto 0);
signal header_dst_mac_MUX_eth_8_h_l52_c5_63c9_iffalse : unsigned(47 downto 0);
signal header_dst_mac_MUX_eth_8_h_l52_c5_63c9_return_output : unsigned(47 downto 0);

-- state_MUX[eth_8_h_l52_c5_63c9]
signal state_MUX_eth_8_h_l52_c5_63c9_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l52_c5_63c9_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l52_c5_63c9_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l52_c5_63c9_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l52_c5_63c9]
signal counter_MUX_eth_8_h_l52_c5_63c9_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l52_c5_63c9_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l52_c5_63c9_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l52_c5_63c9_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[eth_8_h_l54_c10_310c]
signal BIN_OP_EQ_eth_8_h_l54_c10_310c_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l54_c10_310c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l54_c10_310c_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l54_c7_7ecb]
signal state_MUX_eth_8_h_l54_c7_7ecb_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l54_c7_7ecb_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l54_c7_7ecb_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l54_c7_7ecb_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l54_c7_7ecb]
signal counter_MUX_eth_8_h_l54_c7_7ecb_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l54_c7_7ecb_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l54_c7_7ecb_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l54_c7_7ecb_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l58_c9_1b60]
signal BIN_OP_PLUS_eth_8_h_l58_c9_1b60_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_eth_8_h_l58_c9_1b60_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l58_c9_1b60_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[eth_8_h_l61_c12_a3f8]
signal BIN_OP_EQ_eth_8_h_l61_c12_a3f8_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l61_c12_a3f8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l61_c12_a3f8_return_output : unsigned(0 downto 0);

-- o_frame_data_payload_MUX[eth_8_h_l61_c9_a8e5]
signal o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_cond : unsigned(0 downto 0);
signal o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_iftrue : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_iffalse : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_return_output : axis8_t;

-- o_overflow_MUX[eth_8_h_l61_c9_a8e5]
signal o_overflow_MUX_eth_8_h_l61_c9_a8e5_cond : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l61_c9_a8e5_iftrue : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l61_c9_a8e5_iffalse : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l61_c9_a8e5_return_output : unsigned(0 downto 0);

-- o_frame_valid_MUX[eth_8_h_l61_c9_a8e5]
signal o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_cond : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_iftrue : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_iffalse : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_return_output : unsigned(0 downto 0);

-- o_frame_data_start_of_payload_MUX[eth_8_h_l61_c9_a8e5]
signal o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_cond : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_iftrue : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_iffalse : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_return_output : unsigned(0 downto 0);

-- header_ethertype_MUX[eth_8_h_l61_c9_a8e5]
signal header_ethertype_MUX_eth_8_h_l61_c9_a8e5_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l61_c9_a8e5_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l61_c9_a8e5_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l61_c9_a8e5_return_output : unsigned(15 downto 0);

-- header_src_mac_MUX[eth_8_h_l61_c9_a8e5]
signal header_src_mac_MUX_eth_8_h_l61_c9_a8e5_cond : unsigned(0 downto 0);
signal header_src_mac_MUX_eth_8_h_l61_c9_a8e5_iftrue : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l61_c9_a8e5_iffalse : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l61_c9_a8e5_return_output : unsigned(47 downto 0);

-- state_MUX[eth_8_h_l61_c9_a8e5]
signal state_MUX_eth_8_h_l61_c9_a8e5_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l61_c9_a8e5_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l61_c9_a8e5_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l61_c9_a8e5_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l61_c9_a8e5]
signal counter_MUX_eth_8_h_l61_c9_a8e5_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l61_c9_a8e5_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l61_c9_a8e5_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l61_c9_a8e5_return_output : unsigned(2 downto 0);

-- header_src_mac_MUX[eth_8_h_l62_c5_b9b0]
signal header_src_mac_MUX_eth_8_h_l62_c5_b9b0_cond : unsigned(0 downto 0);
signal header_src_mac_MUX_eth_8_h_l62_c5_b9b0_iftrue : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l62_c5_b9b0_iffalse : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l62_c5_b9b0_return_output : unsigned(47 downto 0);

-- state_MUX[eth_8_h_l62_c5_b9b0]
signal state_MUX_eth_8_h_l62_c5_b9b0_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l62_c5_b9b0_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l62_c5_b9b0_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l62_c5_b9b0_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l62_c5_b9b0]
signal counter_MUX_eth_8_h_l62_c5_b9b0_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l62_c5_b9b0_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l62_c5_b9b0_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l62_c5_b9b0_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[eth_8_h_l64_c10_ecdf]
signal BIN_OP_EQ_eth_8_h_l64_c10_ecdf_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l64_c10_ecdf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l64_c10_ecdf_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l64_c7_e49a]
signal state_MUX_eth_8_h_l64_c7_e49a_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l64_c7_e49a_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l64_c7_e49a_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l64_c7_e49a_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l64_c7_e49a]
signal counter_MUX_eth_8_h_l64_c7_e49a_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l64_c7_e49a_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l64_c7_e49a_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l64_c7_e49a_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l68_c9_9ce2]
signal BIN_OP_PLUS_eth_8_h_l68_c9_9ce2_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_eth_8_h_l68_c9_9ce2_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l68_c9_9ce2_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[eth_8_h_l71_c12_b3f7]
signal BIN_OP_EQ_eth_8_h_l71_c12_b3f7_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l71_c12_b3f7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l71_c12_b3f7_return_output : unsigned(0 downto 0);

-- o_frame_data_payload_MUX[eth_8_h_l71_c9_38d1]
signal o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_cond : unsigned(0 downto 0);
signal o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_iftrue : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_iffalse : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_return_output : axis8_t;

-- o_overflow_MUX[eth_8_h_l71_c9_38d1]
signal o_overflow_MUX_eth_8_h_l71_c9_38d1_cond : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l71_c9_38d1_iftrue : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l71_c9_38d1_iffalse : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l71_c9_38d1_return_output : unsigned(0 downto 0);

-- o_frame_valid_MUX[eth_8_h_l71_c9_38d1]
signal o_frame_valid_MUX_eth_8_h_l71_c9_38d1_cond : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l71_c9_38d1_iftrue : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l71_c9_38d1_iffalse : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l71_c9_38d1_return_output : unsigned(0 downto 0);

-- o_frame_data_start_of_payload_MUX[eth_8_h_l71_c9_38d1]
signal o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_cond : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_iftrue : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_iffalse : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_return_output : unsigned(0 downto 0);

-- header_ethertype_MUX[eth_8_h_l71_c9_38d1]
signal header_ethertype_MUX_eth_8_h_l71_c9_38d1_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l71_c9_38d1_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l71_c9_38d1_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l71_c9_38d1_return_output : unsigned(15 downto 0);

-- state_MUX[eth_8_h_l71_c9_38d1]
signal state_MUX_eth_8_h_l71_c9_38d1_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l71_c9_38d1_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l71_c9_38d1_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l71_c9_38d1_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l71_c9_38d1]
signal counter_MUX_eth_8_h_l71_c9_38d1_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l71_c9_38d1_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l71_c9_38d1_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l71_c9_38d1_return_output : unsigned(2 downto 0);

-- header_ethertype_MUX[eth_8_h_l72_c5_d079]
signal header_ethertype_MUX_eth_8_h_l72_c5_d079_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l72_c5_d079_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l72_c5_d079_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l72_c5_d079_return_output : unsigned(15 downto 0);

-- state_MUX[eth_8_h_l72_c5_d079]
signal state_MUX_eth_8_h_l72_c5_d079_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l72_c5_d079_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l72_c5_d079_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l72_c5_d079_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l72_c5_d079]
signal counter_MUX_eth_8_h_l72_c5_d079_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l72_c5_d079_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l72_c5_d079_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l72_c5_d079_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[eth_8_h_l74_c10_cdd4]
signal BIN_OP_EQ_eth_8_h_l74_c10_cdd4_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l74_c10_cdd4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_eth_8_h_l74_c10_cdd4_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l74_c7_2bd2]
signal state_MUX_eth_8_h_l74_c7_2bd2_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l74_c7_2bd2_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l74_c7_2bd2_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l74_c7_2bd2_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l74_c7_2bd2]
signal counter_MUX_eth_8_h_l74_c7_2bd2_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l74_c7_2bd2_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l74_c7_2bd2_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l74_c7_2bd2_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l78_c9_d4a9]
signal BIN_OP_PLUS_eth_8_h_l78_c9_d4a9_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_eth_8_h_l78_c9_d4a9_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l78_c9_d4a9_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[eth_8_h_l83_c11_d163]
signal BIN_OP_EQ_eth_8_h_l83_c11_d163_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l83_c11_d163_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l83_c11_d163_return_output : unsigned(0 downto 0);

-- o_frame_data_payload_MUX[eth_8_h_l83_c8_31b0]
signal o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_cond : unsigned(0 downto 0);
signal o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_iftrue : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_iffalse : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_return_output : axis8_t;

-- o_overflow_MUX[eth_8_h_l83_c8_31b0]
signal o_overflow_MUX_eth_8_h_l83_c8_31b0_cond : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l83_c8_31b0_iftrue : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l83_c8_31b0_iffalse : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l83_c8_31b0_return_output : unsigned(0 downto 0);

-- o_frame_valid_MUX[eth_8_h_l83_c8_31b0]
signal o_frame_valid_MUX_eth_8_h_l83_c8_31b0_cond : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l83_c8_31b0_iftrue : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l83_c8_31b0_iffalse : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l83_c8_31b0_return_output : unsigned(0 downto 0);

-- o_frame_data_start_of_payload_MUX[eth_8_h_l83_c8_31b0]
signal o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_cond : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_iftrue : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_iffalse : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l83_c8_31b0]
signal state_MUX_eth_8_h_l83_c8_31b0_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l83_c8_31b0_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l83_c8_31b0_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l83_c8_31b0_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l83_c8_31b0]
signal counter_MUX_eth_8_h_l83_c8_31b0_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l83_c8_31b0_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l83_c8_31b0_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l83_c8_31b0_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[eth_8_h_l86_c37_fb51]
signal BIN_OP_EQ_eth_8_h_l86_c37_fb51_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l86_c37_fb51_right : unsigned(0 downto 0);
signal BIN_OP_EQ_eth_8_h_l86_c37_fb51_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[eth_8_h_l89_c35_f074]
signal UNARY_OP_NOT_eth_8_h_l89_c35_f074_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_eth_8_h_l89_c35_f074_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[eth_8_h_l89_c18_83e3]
signal BIN_OP_AND_eth_8_h_l89_c18_83e3_left : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l89_c18_83e3_right : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l89_c18_83e3_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l90_c5_5066]
signal state_MUX_eth_8_h_l90_c5_5066_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l90_c5_5066_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l90_c5_5066_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l90_c5_5066_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l90_c5_5066]
signal counter_MUX_eth_8_h_l90_c5_5066_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l90_c5_5066_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l90_c5_5066_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l90_c5_5066_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l91_c7_adbc]
signal counter_MUX_eth_8_h_l91_c7_adbc_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l91_c7_adbc_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l91_c7_adbc_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l91_c7_adbc_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l92_c9_aa68]
signal BIN_OP_PLUS_eth_8_h_l92_c9_aa68_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_eth_8_h_l92_c9_aa68_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l92_c9_aa68_return_output : unsigned(3 downto 0);

-- state_MUX[eth_8_h_l94_c7_7073]
signal state_MUX_eth_8_h_l94_c7_7073_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l94_c7_7073_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l94_c7_7073_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l94_c7_7073_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l94_c7_7073]
signal counter_MUX_eth_8_h_l94_c7_7073_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l94_c7_7073_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l94_c7_7073_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l94_c7_7073_return_output : unsigned(2 downto 0);

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
-- BIN_OP_EQ_eth_8_h_l51_c6_60ab : 0 clocks latency
BIN_OP_EQ_eth_8_h_l51_c6_60ab : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l51_c6_60ab_left,
BIN_OP_EQ_eth_8_h_l51_c6_60ab_right,
BIN_OP_EQ_eth_8_h_l51_c6_60ab_return_output);

-- o_frame_data_payload_MUX_eth_8_h_l51_c3_b743 : 0 clocks latency
o_frame_data_payload_MUX_eth_8_h_l51_c3_b743 : entity work.MUX_uint1_t_axis8_t_axis8_t_0CLK_de264c78 port map (
o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_cond,
o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_iftrue,
o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_iffalse,
o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_return_output);

-- o_overflow_MUX_eth_8_h_l51_c3_b743 : 0 clocks latency
o_overflow_MUX_eth_8_h_l51_c3_b743 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_overflow_MUX_eth_8_h_l51_c3_b743_cond,
o_overflow_MUX_eth_8_h_l51_c3_b743_iftrue,
o_overflow_MUX_eth_8_h_l51_c3_b743_iffalse,
o_overflow_MUX_eth_8_h_l51_c3_b743_return_output);

-- o_frame_valid_MUX_eth_8_h_l51_c3_b743 : 0 clocks latency
o_frame_valid_MUX_eth_8_h_l51_c3_b743 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_valid_MUX_eth_8_h_l51_c3_b743_cond,
o_frame_valid_MUX_eth_8_h_l51_c3_b743_iftrue,
o_frame_valid_MUX_eth_8_h_l51_c3_b743_iffalse,
o_frame_valid_MUX_eth_8_h_l51_c3_b743_return_output);

-- o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743 : 0 clocks latency
o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_cond,
o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_iftrue,
o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_iffalse,
o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_return_output);

-- header_MUX_eth_8_h_l51_c3_b743 : 0 clocks latency
header_MUX_eth_8_h_l51_c3_b743 : entity work.MUX_uint1_t_eth_header_t_eth_header_t_0CLK_de264c78 port map (
header_MUX_eth_8_h_l51_c3_b743_cond,
header_MUX_eth_8_h_l51_c3_b743_iftrue,
header_MUX_eth_8_h_l51_c3_b743_iffalse,
header_MUX_eth_8_h_l51_c3_b743_return_output);

-- state_MUX_eth_8_h_l51_c3_b743 : 0 clocks latency
state_MUX_eth_8_h_l51_c3_b743 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l51_c3_b743_cond,
state_MUX_eth_8_h_l51_c3_b743_iftrue,
state_MUX_eth_8_h_l51_c3_b743_iffalse,
state_MUX_eth_8_h_l51_c3_b743_return_output);

-- counter_MUX_eth_8_h_l51_c3_b743 : 0 clocks latency
counter_MUX_eth_8_h_l51_c3_b743 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l51_c3_b743_cond,
counter_MUX_eth_8_h_l51_c3_b743_iftrue,
counter_MUX_eth_8_h_l51_c3_b743_iffalse,
counter_MUX_eth_8_h_l51_c3_b743_return_output);

-- header_dst_mac_MUX_eth_8_h_l52_c5_63c9 : 0 clocks latency
header_dst_mac_MUX_eth_8_h_l52_c5_63c9 : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_dst_mac_MUX_eth_8_h_l52_c5_63c9_cond,
header_dst_mac_MUX_eth_8_h_l52_c5_63c9_iftrue,
header_dst_mac_MUX_eth_8_h_l52_c5_63c9_iffalse,
header_dst_mac_MUX_eth_8_h_l52_c5_63c9_return_output);

-- state_MUX_eth_8_h_l52_c5_63c9 : 0 clocks latency
state_MUX_eth_8_h_l52_c5_63c9 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l52_c5_63c9_cond,
state_MUX_eth_8_h_l52_c5_63c9_iftrue,
state_MUX_eth_8_h_l52_c5_63c9_iffalse,
state_MUX_eth_8_h_l52_c5_63c9_return_output);

-- counter_MUX_eth_8_h_l52_c5_63c9 : 0 clocks latency
counter_MUX_eth_8_h_l52_c5_63c9 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l52_c5_63c9_cond,
counter_MUX_eth_8_h_l52_c5_63c9_iftrue,
counter_MUX_eth_8_h_l52_c5_63c9_iffalse,
counter_MUX_eth_8_h_l52_c5_63c9_return_output);

-- BIN_OP_EQ_eth_8_h_l54_c10_310c : 0 clocks latency
BIN_OP_EQ_eth_8_h_l54_c10_310c : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l54_c10_310c_left,
BIN_OP_EQ_eth_8_h_l54_c10_310c_right,
BIN_OP_EQ_eth_8_h_l54_c10_310c_return_output);

-- state_MUX_eth_8_h_l54_c7_7ecb : 0 clocks latency
state_MUX_eth_8_h_l54_c7_7ecb : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l54_c7_7ecb_cond,
state_MUX_eth_8_h_l54_c7_7ecb_iftrue,
state_MUX_eth_8_h_l54_c7_7ecb_iffalse,
state_MUX_eth_8_h_l54_c7_7ecb_return_output);

-- counter_MUX_eth_8_h_l54_c7_7ecb : 0 clocks latency
counter_MUX_eth_8_h_l54_c7_7ecb : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l54_c7_7ecb_cond,
counter_MUX_eth_8_h_l54_c7_7ecb_iftrue,
counter_MUX_eth_8_h_l54_c7_7ecb_iffalse,
counter_MUX_eth_8_h_l54_c7_7ecb_return_output);

-- BIN_OP_PLUS_eth_8_h_l58_c9_1b60 : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l58_c9_1b60 : entity work.BIN_OP_PLUS_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l58_c9_1b60_left,
BIN_OP_PLUS_eth_8_h_l58_c9_1b60_right,
BIN_OP_PLUS_eth_8_h_l58_c9_1b60_return_output);

-- BIN_OP_EQ_eth_8_h_l61_c12_a3f8 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l61_c12_a3f8 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l61_c12_a3f8_left,
BIN_OP_EQ_eth_8_h_l61_c12_a3f8_right,
BIN_OP_EQ_eth_8_h_l61_c12_a3f8_return_output);

-- o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5 : 0 clocks latency
o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5 : entity work.MUX_uint1_t_axis8_t_axis8_t_0CLK_de264c78 port map (
o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_cond,
o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_iftrue,
o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_iffalse,
o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_return_output);

-- o_overflow_MUX_eth_8_h_l61_c9_a8e5 : 0 clocks latency
o_overflow_MUX_eth_8_h_l61_c9_a8e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_overflow_MUX_eth_8_h_l61_c9_a8e5_cond,
o_overflow_MUX_eth_8_h_l61_c9_a8e5_iftrue,
o_overflow_MUX_eth_8_h_l61_c9_a8e5_iffalse,
o_overflow_MUX_eth_8_h_l61_c9_a8e5_return_output);

-- o_frame_valid_MUX_eth_8_h_l61_c9_a8e5 : 0 clocks latency
o_frame_valid_MUX_eth_8_h_l61_c9_a8e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_cond,
o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_iftrue,
o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_iffalse,
o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_return_output);

-- o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5 : 0 clocks latency
o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_cond,
o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_iftrue,
o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_iffalse,
o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_return_output);

-- header_ethertype_MUX_eth_8_h_l61_c9_a8e5 : 0 clocks latency
header_ethertype_MUX_eth_8_h_l61_c9_a8e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l61_c9_a8e5_cond,
header_ethertype_MUX_eth_8_h_l61_c9_a8e5_iftrue,
header_ethertype_MUX_eth_8_h_l61_c9_a8e5_iffalse,
header_ethertype_MUX_eth_8_h_l61_c9_a8e5_return_output);

-- header_src_mac_MUX_eth_8_h_l61_c9_a8e5 : 0 clocks latency
header_src_mac_MUX_eth_8_h_l61_c9_a8e5 : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_src_mac_MUX_eth_8_h_l61_c9_a8e5_cond,
header_src_mac_MUX_eth_8_h_l61_c9_a8e5_iftrue,
header_src_mac_MUX_eth_8_h_l61_c9_a8e5_iffalse,
header_src_mac_MUX_eth_8_h_l61_c9_a8e5_return_output);

-- state_MUX_eth_8_h_l61_c9_a8e5 : 0 clocks latency
state_MUX_eth_8_h_l61_c9_a8e5 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l61_c9_a8e5_cond,
state_MUX_eth_8_h_l61_c9_a8e5_iftrue,
state_MUX_eth_8_h_l61_c9_a8e5_iffalse,
state_MUX_eth_8_h_l61_c9_a8e5_return_output);

-- counter_MUX_eth_8_h_l61_c9_a8e5 : 0 clocks latency
counter_MUX_eth_8_h_l61_c9_a8e5 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l61_c9_a8e5_cond,
counter_MUX_eth_8_h_l61_c9_a8e5_iftrue,
counter_MUX_eth_8_h_l61_c9_a8e5_iffalse,
counter_MUX_eth_8_h_l61_c9_a8e5_return_output);

-- header_src_mac_MUX_eth_8_h_l62_c5_b9b0 : 0 clocks latency
header_src_mac_MUX_eth_8_h_l62_c5_b9b0 : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_src_mac_MUX_eth_8_h_l62_c5_b9b0_cond,
header_src_mac_MUX_eth_8_h_l62_c5_b9b0_iftrue,
header_src_mac_MUX_eth_8_h_l62_c5_b9b0_iffalse,
header_src_mac_MUX_eth_8_h_l62_c5_b9b0_return_output);

-- state_MUX_eth_8_h_l62_c5_b9b0 : 0 clocks latency
state_MUX_eth_8_h_l62_c5_b9b0 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l62_c5_b9b0_cond,
state_MUX_eth_8_h_l62_c5_b9b0_iftrue,
state_MUX_eth_8_h_l62_c5_b9b0_iffalse,
state_MUX_eth_8_h_l62_c5_b9b0_return_output);

-- counter_MUX_eth_8_h_l62_c5_b9b0 : 0 clocks latency
counter_MUX_eth_8_h_l62_c5_b9b0 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l62_c5_b9b0_cond,
counter_MUX_eth_8_h_l62_c5_b9b0_iftrue,
counter_MUX_eth_8_h_l62_c5_b9b0_iffalse,
counter_MUX_eth_8_h_l62_c5_b9b0_return_output);

-- BIN_OP_EQ_eth_8_h_l64_c10_ecdf : 0 clocks latency
BIN_OP_EQ_eth_8_h_l64_c10_ecdf : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l64_c10_ecdf_left,
BIN_OP_EQ_eth_8_h_l64_c10_ecdf_right,
BIN_OP_EQ_eth_8_h_l64_c10_ecdf_return_output);

-- state_MUX_eth_8_h_l64_c7_e49a : 0 clocks latency
state_MUX_eth_8_h_l64_c7_e49a : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l64_c7_e49a_cond,
state_MUX_eth_8_h_l64_c7_e49a_iftrue,
state_MUX_eth_8_h_l64_c7_e49a_iffalse,
state_MUX_eth_8_h_l64_c7_e49a_return_output);

-- counter_MUX_eth_8_h_l64_c7_e49a : 0 clocks latency
counter_MUX_eth_8_h_l64_c7_e49a : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l64_c7_e49a_cond,
counter_MUX_eth_8_h_l64_c7_e49a_iftrue,
counter_MUX_eth_8_h_l64_c7_e49a_iffalse,
counter_MUX_eth_8_h_l64_c7_e49a_return_output);

-- BIN_OP_PLUS_eth_8_h_l68_c9_9ce2 : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l68_c9_9ce2 : entity work.BIN_OP_PLUS_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l68_c9_9ce2_left,
BIN_OP_PLUS_eth_8_h_l68_c9_9ce2_right,
BIN_OP_PLUS_eth_8_h_l68_c9_9ce2_return_output);

-- BIN_OP_EQ_eth_8_h_l71_c12_b3f7 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l71_c12_b3f7 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l71_c12_b3f7_left,
BIN_OP_EQ_eth_8_h_l71_c12_b3f7_right,
BIN_OP_EQ_eth_8_h_l71_c12_b3f7_return_output);

-- o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1 : 0 clocks latency
o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1 : entity work.MUX_uint1_t_axis8_t_axis8_t_0CLK_de264c78 port map (
o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_cond,
o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_iftrue,
o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_iffalse,
o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_return_output);

-- o_overflow_MUX_eth_8_h_l71_c9_38d1 : 0 clocks latency
o_overflow_MUX_eth_8_h_l71_c9_38d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_overflow_MUX_eth_8_h_l71_c9_38d1_cond,
o_overflow_MUX_eth_8_h_l71_c9_38d1_iftrue,
o_overflow_MUX_eth_8_h_l71_c9_38d1_iffalse,
o_overflow_MUX_eth_8_h_l71_c9_38d1_return_output);

-- o_frame_valid_MUX_eth_8_h_l71_c9_38d1 : 0 clocks latency
o_frame_valid_MUX_eth_8_h_l71_c9_38d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_valid_MUX_eth_8_h_l71_c9_38d1_cond,
o_frame_valid_MUX_eth_8_h_l71_c9_38d1_iftrue,
o_frame_valid_MUX_eth_8_h_l71_c9_38d1_iffalse,
o_frame_valid_MUX_eth_8_h_l71_c9_38d1_return_output);

-- o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1 : 0 clocks latency
o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_cond,
o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_iftrue,
o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_iffalse,
o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_return_output);

-- header_ethertype_MUX_eth_8_h_l71_c9_38d1 : 0 clocks latency
header_ethertype_MUX_eth_8_h_l71_c9_38d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l71_c9_38d1_cond,
header_ethertype_MUX_eth_8_h_l71_c9_38d1_iftrue,
header_ethertype_MUX_eth_8_h_l71_c9_38d1_iffalse,
header_ethertype_MUX_eth_8_h_l71_c9_38d1_return_output);

-- state_MUX_eth_8_h_l71_c9_38d1 : 0 clocks latency
state_MUX_eth_8_h_l71_c9_38d1 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l71_c9_38d1_cond,
state_MUX_eth_8_h_l71_c9_38d1_iftrue,
state_MUX_eth_8_h_l71_c9_38d1_iffalse,
state_MUX_eth_8_h_l71_c9_38d1_return_output);

-- counter_MUX_eth_8_h_l71_c9_38d1 : 0 clocks latency
counter_MUX_eth_8_h_l71_c9_38d1 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l71_c9_38d1_cond,
counter_MUX_eth_8_h_l71_c9_38d1_iftrue,
counter_MUX_eth_8_h_l71_c9_38d1_iffalse,
counter_MUX_eth_8_h_l71_c9_38d1_return_output);

-- header_ethertype_MUX_eth_8_h_l72_c5_d079 : 0 clocks latency
header_ethertype_MUX_eth_8_h_l72_c5_d079 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l72_c5_d079_cond,
header_ethertype_MUX_eth_8_h_l72_c5_d079_iftrue,
header_ethertype_MUX_eth_8_h_l72_c5_d079_iffalse,
header_ethertype_MUX_eth_8_h_l72_c5_d079_return_output);

-- state_MUX_eth_8_h_l72_c5_d079 : 0 clocks latency
state_MUX_eth_8_h_l72_c5_d079 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l72_c5_d079_cond,
state_MUX_eth_8_h_l72_c5_d079_iftrue,
state_MUX_eth_8_h_l72_c5_d079_iffalse,
state_MUX_eth_8_h_l72_c5_d079_return_output);

-- counter_MUX_eth_8_h_l72_c5_d079 : 0 clocks latency
counter_MUX_eth_8_h_l72_c5_d079 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l72_c5_d079_cond,
counter_MUX_eth_8_h_l72_c5_d079_iftrue,
counter_MUX_eth_8_h_l72_c5_d079_iffalse,
counter_MUX_eth_8_h_l72_c5_d079_return_output);

-- BIN_OP_EQ_eth_8_h_l74_c10_cdd4 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l74_c10_cdd4 : entity work.BIN_OP_EQ_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l74_c10_cdd4_left,
BIN_OP_EQ_eth_8_h_l74_c10_cdd4_right,
BIN_OP_EQ_eth_8_h_l74_c10_cdd4_return_output);

-- state_MUX_eth_8_h_l74_c7_2bd2 : 0 clocks latency
state_MUX_eth_8_h_l74_c7_2bd2 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l74_c7_2bd2_cond,
state_MUX_eth_8_h_l74_c7_2bd2_iftrue,
state_MUX_eth_8_h_l74_c7_2bd2_iffalse,
state_MUX_eth_8_h_l74_c7_2bd2_return_output);

-- counter_MUX_eth_8_h_l74_c7_2bd2 : 0 clocks latency
counter_MUX_eth_8_h_l74_c7_2bd2 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l74_c7_2bd2_cond,
counter_MUX_eth_8_h_l74_c7_2bd2_iftrue,
counter_MUX_eth_8_h_l74_c7_2bd2_iffalse,
counter_MUX_eth_8_h_l74_c7_2bd2_return_output);

-- BIN_OP_PLUS_eth_8_h_l78_c9_d4a9 : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l78_c9_d4a9 : entity work.BIN_OP_PLUS_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l78_c9_d4a9_left,
BIN_OP_PLUS_eth_8_h_l78_c9_d4a9_right,
BIN_OP_PLUS_eth_8_h_l78_c9_d4a9_return_output);

-- BIN_OP_EQ_eth_8_h_l83_c11_d163 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l83_c11_d163 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l83_c11_d163_left,
BIN_OP_EQ_eth_8_h_l83_c11_d163_right,
BIN_OP_EQ_eth_8_h_l83_c11_d163_return_output);

-- o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0 : 0 clocks latency
o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0 : entity work.MUX_uint1_t_axis8_t_axis8_t_0CLK_de264c78 port map (
o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_cond,
o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_iftrue,
o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_iffalse,
o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_return_output);

-- o_overflow_MUX_eth_8_h_l83_c8_31b0 : 0 clocks latency
o_overflow_MUX_eth_8_h_l83_c8_31b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_overflow_MUX_eth_8_h_l83_c8_31b0_cond,
o_overflow_MUX_eth_8_h_l83_c8_31b0_iftrue,
o_overflow_MUX_eth_8_h_l83_c8_31b0_iffalse,
o_overflow_MUX_eth_8_h_l83_c8_31b0_return_output);

-- o_frame_valid_MUX_eth_8_h_l83_c8_31b0 : 0 clocks latency
o_frame_valid_MUX_eth_8_h_l83_c8_31b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_valid_MUX_eth_8_h_l83_c8_31b0_cond,
o_frame_valid_MUX_eth_8_h_l83_c8_31b0_iftrue,
o_frame_valid_MUX_eth_8_h_l83_c8_31b0_iffalse,
o_frame_valid_MUX_eth_8_h_l83_c8_31b0_return_output);

-- o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0 : 0 clocks latency
o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_cond,
o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_iftrue,
o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_iffalse,
o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_return_output);

-- state_MUX_eth_8_h_l83_c8_31b0 : 0 clocks latency
state_MUX_eth_8_h_l83_c8_31b0 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l83_c8_31b0_cond,
state_MUX_eth_8_h_l83_c8_31b0_iftrue,
state_MUX_eth_8_h_l83_c8_31b0_iffalse,
state_MUX_eth_8_h_l83_c8_31b0_return_output);

-- counter_MUX_eth_8_h_l83_c8_31b0 : 0 clocks latency
counter_MUX_eth_8_h_l83_c8_31b0 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l83_c8_31b0_cond,
counter_MUX_eth_8_h_l83_c8_31b0_iftrue,
counter_MUX_eth_8_h_l83_c8_31b0_iffalse,
counter_MUX_eth_8_h_l83_c8_31b0_return_output);

-- BIN_OP_EQ_eth_8_h_l86_c37_fb51 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l86_c37_fb51 : entity work.BIN_OP_EQ_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l86_c37_fb51_left,
BIN_OP_EQ_eth_8_h_l86_c37_fb51_right,
BIN_OP_EQ_eth_8_h_l86_c37_fb51_return_output);

-- UNARY_OP_NOT_eth_8_h_l89_c35_f074 : 0 clocks latency
UNARY_OP_NOT_eth_8_h_l89_c35_f074 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_eth_8_h_l89_c35_f074_expr,
UNARY_OP_NOT_eth_8_h_l89_c35_f074_return_output);

-- BIN_OP_AND_eth_8_h_l89_c18_83e3 : 0 clocks latency
BIN_OP_AND_eth_8_h_l89_c18_83e3 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_eth_8_h_l89_c18_83e3_left,
BIN_OP_AND_eth_8_h_l89_c18_83e3_right,
BIN_OP_AND_eth_8_h_l89_c18_83e3_return_output);

-- state_MUX_eth_8_h_l90_c5_5066 : 0 clocks latency
state_MUX_eth_8_h_l90_c5_5066 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l90_c5_5066_cond,
state_MUX_eth_8_h_l90_c5_5066_iftrue,
state_MUX_eth_8_h_l90_c5_5066_iffalse,
state_MUX_eth_8_h_l90_c5_5066_return_output);

-- counter_MUX_eth_8_h_l90_c5_5066 : 0 clocks latency
counter_MUX_eth_8_h_l90_c5_5066 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l90_c5_5066_cond,
counter_MUX_eth_8_h_l90_c5_5066_iftrue,
counter_MUX_eth_8_h_l90_c5_5066_iffalse,
counter_MUX_eth_8_h_l90_c5_5066_return_output);

-- counter_MUX_eth_8_h_l91_c7_adbc : 0 clocks latency
counter_MUX_eth_8_h_l91_c7_adbc : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l91_c7_adbc_cond,
counter_MUX_eth_8_h_l91_c7_adbc_iftrue,
counter_MUX_eth_8_h_l91_c7_adbc_iffalse,
counter_MUX_eth_8_h_l91_c7_adbc_return_output);

-- BIN_OP_PLUS_eth_8_h_l92_c9_aa68 : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l92_c9_aa68 : entity work.BIN_OP_PLUS_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l92_c9_aa68_left,
BIN_OP_PLUS_eth_8_h_l92_c9_aa68_right,
BIN_OP_PLUS_eth_8_h_l92_c9_aa68_return_output);

-- state_MUX_eth_8_h_l94_c7_7073 : 0 clocks latency
state_MUX_eth_8_h_l94_c7_7073 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l94_c7_7073_cond,
state_MUX_eth_8_h_l94_c7_7073_iftrue,
state_MUX_eth_8_h_l94_c7_7073_iffalse,
state_MUX_eth_8_h_l94_c7_7073_return_output);

-- counter_MUX_eth_8_h_l94_c7_7073 : 0 clocks latency
counter_MUX_eth_8_h_l94_c7_7073 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l94_c7_7073_cond,
counter_MUX_eth_8_h_l94_c7_7073_iftrue,
counter_MUX_eth_8_h_l94_c7_7073_iffalse,
counter_MUX_eth_8_h_l94_c7_7073_return_output);



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
 BIN_OP_EQ_eth_8_h_l51_c6_60ab_return_output,
 o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_return_output,
 o_overflow_MUX_eth_8_h_l51_c3_b743_return_output,
 o_frame_valid_MUX_eth_8_h_l51_c3_b743_return_output,
 o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_return_output,
 header_MUX_eth_8_h_l51_c3_b743_return_output,
 state_MUX_eth_8_h_l51_c3_b743_return_output,
 counter_MUX_eth_8_h_l51_c3_b743_return_output,
 header_dst_mac_MUX_eth_8_h_l52_c5_63c9_return_output,
 state_MUX_eth_8_h_l52_c5_63c9_return_output,
 counter_MUX_eth_8_h_l52_c5_63c9_return_output,
 BIN_OP_EQ_eth_8_h_l54_c10_310c_return_output,
 state_MUX_eth_8_h_l54_c7_7ecb_return_output,
 counter_MUX_eth_8_h_l54_c7_7ecb_return_output,
 BIN_OP_PLUS_eth_8_h_l58_c9_1b60_return_output,
 BIN_OP_EQ_eth_8_h_l61_c12_a3f8_return_output,
 o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_return_output,
 o_overflow_MUX_eth_8_h_l61_c9_a8e5_return_output,
 o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_return_output,
 o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_return_output,
 header_ethertype_MUX_eth_8_h_l61_c9_a8e5_return_output,
 header_src_mac_MUX_eth_8_h_l61_c9_a8e5_return_output,
 state_MUX_eth_8_h_l61_c9_a8e5_return_output,
 counter_MUX_eth_8_h_l61_c9_a8e5_return_output,
 header_src_mac_MUX_eth_8_h_l62_c5_b9b0_return_output,
 state_MUX_eth_8_h_l62_c5_b9b0_return_output,
 counter_MUX_eth_8_h_l62_c5_b9b0_return_output,
 BIN_OP_EQ_eth_8_h_l64_c10_ecdf_return_output,
 state_MUX_eth_8_h_l64_c7_e49a_return_output,
 counter_MUX_eth_8_h_l64_c7_e49a_return_output,
 BIN_OP_PLUS_eth_8_h_l68_c9_9ce2_return_output,
 BIN_OP_EQ_eth_8_h_l71_c12_b3f7_return_output,
 o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_return_output,
 o_overflow_MUX_eth_8_h_l71_c9_38d1_return_output,
 o_frame_valid_MUX_eth_8_h_l71_c9_38d1_return_output,
 o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_return_output,
 header_ethertype_MUX_eth_8_h_l71_c9_38d1_return_output,
 state_MUX_eth_8_h_l71_c9_38d1_return_output,
 counter_MUX_eth_8_h_l71_c9_38d1_return_output,
 header_ethertype_MUX_eth_8_h_l72_c5_d079_return_output,
 state_MUX_eth_8_h_l72_c5_d079_return_output,
 counter_MUX_eth_8_h_l72_c5_d079_return_output,
 BIN_OP_EQ_eth_8_h_l74_c10_cdd4_return_output,
 state_MUX_eth_8_h_l74_c7_2bd2_return_output,
 counter_MUX_eth_8_h_l74_c7_2bd2_return_output,
 BIN_OP_PLUS_eth_8_h_l78_c9_d4a9_return_output,
 BIN_OP_EQ_eth_8_h_l83_c11_d163_return_output,
 o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_return_output,
 o_overflow_MUX_eth_8_h_l83_c8_31b0_return_output,
 o_frame_valid_MUX_eth_8_h_l83_c8_31b0_return_output,
 o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_return_output,
 state_MUX_eth_8_h_l83_c8_31b0_return_output,
 counter_MUX_eth_8_h_l83_c8_31b0_return_output,
 BIN_OP_EQ_eth_8_h_l86_c37_fb51_return_output,
 UNARY_OP_NOT_eth_8_h_l89_c35_f074_return_output,
 BIN_OP_AND_eth_8_h_l89_c18_83e3_return_output,
 state_MUX_eth_8_h_l90_c5_5066_return_output,
 counter_MUX_eth_8_h_l90_c5_5066_return_output,
 counter_MUX_eth_8_h_l91_c7_adbc_return_output,
 BIN_OP_PLUS_eth_8_h_l92_c9_aa68_return_output,
 state_MUX_eth_8_h_l94_c7_7073_return_output,
 counter_MUX_eth_8_h_l94_c7_7073_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eth_8_rx_t;
 variable VAR_mac_axis : axis8_t_stream_t;
 variable VAR_frame_ready : unsigned(0 downto 0);
 variable VAR_o : eth_8_rx_t;
 variable VAR_BIN_OP_EQ_eth_8_h_l51_c6_60ab_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l51_c6_60ab_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l51_c6_60ab_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_iftrue : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_iffalse : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_return_output : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_return_output : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_cond : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l51_c3_b743_iftrue : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l51_c3_b743_iffalse : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l61_c9_a8e5_return_output : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l51_c3_b743_return_output : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l51_c3_b743_cond : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l51_c3_b743_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l51_c3_b743_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l51_c3_b743_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l51_c3_b743_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_cond : unsigned(0 downto 0);
 variable VAR_header_MUX_eth_8_h_l51_c3_b743_iftrue : eth_header_t;
 variable VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l51_c3_b743_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l51_c3_b743_iffalse : eth_header_t;
 variable VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a_eth_8_h_l51_c3_b743_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l51_c3_b743_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l51_c3_b743_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l51_c3_b743_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l52_c5_63c9_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l51_c3_b743_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l61_c9_a8e5_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l51_c3_b743_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l51_c3_b743_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l51_c3_b743_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l52_c5_63c9_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l51_c3_b743_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l61_c9_a8e5_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l51_c3_b743_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l51_c3_b743_cond : unsigned(0 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l52_c5_63c9_iftrue : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l52_c5_63c9_iffalse : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l52_c5_63c9_return_output : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l52_c5_63c9_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l52_c5_63c9_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l54_c7_7ecb_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l52_c5_63c9_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l52_c5_63c9_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l52_c5_63c9_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l54_c7_7ecb_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l52_c5_63c9_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l52_c5_63c9_cond : unsigned(0 downto 0);
 variable VAR_uint40_uint8_eth_8_h_l53_c24_7e11_return_output : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l54_c10_310c_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l54_c10_310c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l54_c10_310c_return_output : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l54_c7_7ecb_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l54_c7_7ecb_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l54_c7_7ecb_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l54_c7_7ecb_iftrue : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l56_c9_3982 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l54_c7_7ecb_iffalse : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l58_c9_ad63 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l54_c7_7ecb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l58_c9_1b60_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l58_c9_1b60_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l58_c9_1b60_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l61_c12_a3f8_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l61_c12_a3f8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l61_c12_a3f8_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_iftrue : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_iffalse : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_return_output : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_cond : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l61_c9_a8e5_iftrue : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l61_c9_a8e5_iffalse : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l71_c9_38d1_return_output : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l61_c9_a8e5_cond : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l71_c9_38d1_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_cond : unsigned(0 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l61_c9_a8e5_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l61_c9_a8e5_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l71_c9_38d1_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l61_c9_a8e5_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l61_c9_a8e5_cond : unsigned(0 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l61_c9_a8e5_iftrue : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l62_c5_b9b0_return_output : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l61_c9_a8e5_iffalse : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l61_c9_a8e5_return_output : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l61_c9_a8e5_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l61_c9_a8e5_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l62_c5_b9b0_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l61_c9_a8e5_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l71_c9_38d1_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l61_c9_a8e5_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l61_c9_a8e5_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l62_c5_b9b0_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l61_c9_a8e5_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l71_c9_38d1_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l61_c9_a8e5_cond : unsigned(0 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l62_c5_b9b0_iftrue : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l62_c5_b9b0_iffalse : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l62_c5_b9b0_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l62_c5_b9b0_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l64_c7_e49a_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l62_c5_b9b0_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l62_c5_b9b0_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l62_c5_b9b0_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l64_c7_e49a_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l62_c5_b9b0_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l62_c5_b9b0_cond : unsigned(0 downto 0);
 variable VAR_uint40_uint8_eth_8_h_l63_c24_536c_return_output : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l64_c10_ecdf_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l64_c10_ecdf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l64_c10_ecdf_return_output : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l64_c7_e49a_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l64_c7_e49a_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l64_c7_e49a_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l64_c7_e49a_iftrue : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l66_c9_6d2b : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l64_c7_e49a_iffalse : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l68_c9_59b1 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l64_c7_e49a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l68_c9_9ce2_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l68_c9_9ce2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l68_c9_9ce2_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l71_c12_b3f7_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l71_c12_b3f7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l71_c12_b3f7_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_iftrue : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_iffalse : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_return_output : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_cond : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l71_c9_38d1_iftrue : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l71_c9_38d1_iffalse : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l83_c8_31b0_return_output : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l71_c9_38d1_cond : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l71_c9_38d1_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l71_c9_38d1_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l83_c8_31b0_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l71_c9_38d1_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_cond : unsigned(0 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l71_c9_38d1_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l72_c5_d079_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l71_c9_38d1_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l71_c9_38d1_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l71_c9_38d1_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l72_c5_d079_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l71_c9_38d1_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l83_c8_31b0_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l71_c9_38d1_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l71_c9_38d1_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l72_c5_d079_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l71_c9_38d1_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l83_c8_31b0_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l71_c9_38d1_cond : unsigned(0 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l72_c5_d079_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l72_c5_d079_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l72_c5_d079_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l72_c5_d079_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l74_c7_2bd2_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l72_c5_d079_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l72_c5_d079_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l72_c5_d079_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l74_c7_2bd2_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l72_c5_d079_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l72_c5_d079_cond : unsigned(0 downto 0);
 variable VAR_uint8_uint8_eth_8_h_l73_c26_71de_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l74_c10_cdd4_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l74_c10_cdd4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l74_c10_cdd4_return_output : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l74_c7_2bd2_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l74_c7_2bd2_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l74_c7_2bd2_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l74_c7_2bd2_iftrue : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l76_c9_1927 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l74_c7_2bd2_iffalse : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l78_c9_a99f : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l74_c7_2bd2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l78_c9_d4a9_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l78_c9_d4a9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l78_c9_d4a9_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l83_c11_d163_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l83_c11_d163_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l83_c11_d163_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_iftrue : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_iffalse : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_cond : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l83_c8_31b0_iftrue : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l83_c8_31b0_iffalse : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l83_c8_31b0_cond : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l83_c8_31b0_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l83_c8_31b0_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l83_c8_31b0_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l83_c8_31b0_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l90_c5_5066_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l83_c8_31b0_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l83_c8_31b0_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l83_c8_31b0_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l90_c5_5066_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l83_c8_31b0_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l83_c8_31b0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d_eth_8_h_l85_c28_454e_return_output : axis8_t;
 variable VAR_BIN_OP_EQ_eth_8_h_l86_c37_fb51_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l86_c37_fb51_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l86_c37_fb51_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l89_c18_83e3_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_eth_8_h_l89_c35_f074_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_eth_8_h_l89_c35_f074_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l89_c18_83e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l89_c18_83e3_return_output : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l90_c5_5066_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l94_c7_7073_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l90_c5_5066_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l90_c5_5066_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l90_c5_5066_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l94_c7_7073_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l90_c5_5066_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l90_c5_5066_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l91_c7_adbc_iftrue : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l92_c9_3bfe : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l91_c7_adbc_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l91_c7_adbc_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l91_c7_adbc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l92_c9_aa68_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l92_c9_aa68_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l92_c9_aa68_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7_eth_8_h_l94_c10_900e_return_output : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l94_c7_7073_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l94_c7_7073_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l94_c7_7073_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l94_c7_7073_iftrue : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l96_c9_f926 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l94_c7_7073_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l94_c7_7073_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_1622_eth_8_h_l100_c10_a09a_return_output : eth_8_rx_t;
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l52_l87_l72_l62_DUPLICATE_509d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l52_l53_DUPLICATE_bcf0_return_output : unsigned(47 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l73_l63_DUPLICATE_2280_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l71_l51_l83_l61_DUPLICATE_6020_return_output : axis8_t;
 variable VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l62_l63_l61_DUPLICATE_53b4_return_output : unsigned(47 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l73_l72_l71_l61_DUPLICATE_bcbe_return_output : unsigned(15 downto 0);
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
     VAR_o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_iftrue := to_unsigned(0, 1);
     VAR_o_frame_valid_MUX_eth_8_h_l51_c3_b743_iftrue := to_unsigned(0, 1);
     VAR_o_frame_valid_MUX_eth_8_h_l83_c8_31b0_iffalse := to_unsigned(0, 1);
     VAR_o_frame_valid_MUX_eth_8_h_l71_c9_38d1_iftrue := to_unsigned(0, 1);
     VAR_state_MUX_eth_8_h_l54_c7_7ecb_iftrue := unsigned(eth8_state_t_to_slv(SRC_MAC));
     VAR_BIN_OP_PLUS_eth_8_h_l58_c9_1b60_right := to_unsigned(1, 1);
     VAR_state_MUX_eth_8_h_l64_c7_e49a_iftrue := unsigned(eth8_state_t_to_slv(LEN_TYPE));
     VAR_o_overflow_MUX_eth_8_h_l61_c9_a8e5_iftrue := to_unsigned(0, 1);
     VAR_o_overflow_MUX_eth_8_h_l83_c8_31b0_iffalse := to_unsigned(0, 1);
     VAR_o_overflow_MUX_eth_8_h_l71_c9_38d1_iftrue := to_unsigned(0, 1);
     VAR_o_overflow_MUX_eth_8_h_l51_c3_b743_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_eth_8_h_l78_c9_d4a9_right := to_unsigned(1, 1);
     VAR_state_MUX_eth_8_h_l74_c7_2bd2_iftrue := unsigned(eth8_state_t_to_slv(PAYLOAD));
     VAR_BIN_OP_PLUS_eth_8_h_l68_c9_9ce2_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_eth_8_h_l86_c37_fb51_right := to_unsigned(0, 1);
     VAR_counter_eth_8_h_l96_c9_f926 := resize(to_unsigned(0, 1), 3);
     VAR_counter_MUX_eth_8_h_l94_c7_7073_iftrue := VAR_counter_eth_8_h_l96_c9_f926;
     VAR_counter_eth_8_h_l66_c9_6d2b := resize(to_unsigned(0, 1), 3);
     VAR_counter_MUX_eth_8_h_l64_c7_e49a_iftrue := VAR_counter_eth_8_h_l66_c9_6d2b;
     VAR_BIN_OP_EQ_eth_8_h_l83_c11_d163_right := unsigned(eth8_state_t_to_slv(PAYLOAD));
     VAR_BIN_OP_EQ_eth_8_h_l74_c10_cdd4_right := to_unsigned(1, 1);
     VAR_state_MUX_eth_8_h_l94_c7_7073_iftrue := unsigned(eth8_state_t_to_slv(IDLE_DST_MAC));
     VAR_counter_eth_8_h_l76_c9_1927 := resize(to_unsigned(0, 1), 3);
     VAR_counter_MUX_eth_8_h_l74_c7_2bd2_iftrue := VAR_counter_eth_8_h_l76_c9_1927;
     VAR_BIN_OP_PLUS_eth_8_h_l92_c9_aa68_right := to_unsigned(1, 1);
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_iftrue := to_unsigned(0, 1);
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_iftrue := to_unsigned(0, 1);
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_iftrue := to_unsigned(0, 1);
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_eth_8_h_l64_c10_ecdf_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_eth_8_h_l71_c12_b3f7_right := unsigned(eth8_state_t_to_slv(LEN_TYPE));
     VAR_counter_eth_8_h_l56_c9_3982 := resize(to_unsigned(0, 1), 3);
     VAR_counter_MUX_eth_8_h_l54_c7_7ecb_iftrue := VAR_counter_eth_8_h_l56_c9_3982;
     VAR_BIN_OP_EQ_eth_8_h_l61_c12_a3f8_right := unsigned(eth8_state_t_to_slv(SRC_MAC));
     VAR_BIN_OP_EQ_eth_8_h_l51_c6_60ab_right := unsigned(eth8_state_t_to_slv(IDLE_DST_MAC));
     VAR_BIN_OP_EQ_eth_8_h_l54_c10_310c_right := to_unsigned(5, 3);
     -- CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l71_l51_l83_l61_DUPLICATE_6020 LATENCY=0
     VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l71_l51_l83_l61_DUPLICATE_6020_return_output := eth_8_rx_t_NULL.frame.data.payload;

     -- Submodule level 1
     VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_iftrue := VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l71_l51_l83_l61_DUPLICATE_6020_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_iftrue := VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l71_l51_l83_l61_DUPLICATE_6020_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_iftrue := VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l71_l51_l83_l61_DUPLICATE_6020_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_iffalse := VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l71_l51_l83_l61_DUPLICATE_6020_return_output;

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
     VAR_BIN_OP_EQ_eth_8_h_l54_c10_310c_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l64_c10_ecdf_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l74_c10_cdd4_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l86_c37_fb51_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l58_c9_1b60_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l68_c9_9ce2_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l78_c9_d4a9_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l92_c9_aa68_left := counter;
     VAR_counter_MUX_eth_8_h_l52_c5_63c9_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l62_c5_b9b0_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l72_c5_d079_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l83_c8_31b0_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l90_c5_5066_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l91_c7_adbc_iffalse := counter;
     VAR_UNARY_OP_NOT_eth_8_h_l89_c35_f074_expr := VAR_frame_ready;
     VAR_BIN_OP_EQ_eth_8_h_l51_c6_60ab_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l61_c12_a3f8_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l71_c12_b3f7_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l83_c11_d163_left := state;
     VAR_state_MUX_eth_8_h_l52_c5_63c9_iffalse := state;
     VAR_state_MUX_eth_8_h_l54_c7_7ecb_iffalse := state;
     VAR_state_MUX_eth_8_h_l62_c5_b9b0_iffalse := state;
     VAR_state_MUX_eth_8_h_l64_c7_e49a_iffalse := state;
     VAR_state_MUX_eth_8_h_l72_c5_d079_iffalse := state;
     VAR_state_MUX_eth_8_h_l74_c7_2bd2_iffalse := state;
     VAR_state_MUX_eth_8_h_l83_c8_31b0_iffalse := state;
     VAR_state_MUX_eth_8_h_l90_c5_5066_iffalse := state;
     VAR_state_MUX_eth_8_h_l94_c7_7073_iffalse := state;
     -- CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d[eth_8_h_l85_c28_454e] LATENCY=0
     VAR_CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d_eth_8_h_l85_c28_454e_return_output := VAR_mac_axis.data;

     -- BIN_OP_EQ[eth_8_h_l74_c10_cdd4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l74_c10_cdd4_left <= VAR_BIN_OP_EQ_eth_8_h_l74_c10_cdd4_left;
     BIN_OP_EQ_eth_8_h_l74_c10_cdd4_right <= VAR_BIN_OP_EQ_eth_8_h_l74_c10_cdd4_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l74_c10_cdd4_return_output := BIN_OP_EQ_eth_8_h_l74_c10_cdd4_return_output;

     -- BIN_OP_PLUS[eth_8_h_l78_c9_d4a9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l78_c9_d4a9_left <= VAR_BIN_OP_PLUS_eth_8_h_l78_c9_d4a9_left;
     BIN_OP_PLUS_eth_8_h_l78_c9_d4a9_right <= VAR_BIN_OP_PLUS_eth_8_h_l78_c9_d4a9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l78_c9_d4a9_return_output := BIN_OP_PLUS_eth_8_h_l78_c9_d4a9_return_output;

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l52_l87_l72_l62_DUPLICATE_509d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l52_l87_l72_l62_DUPLICATE_509d_return_output := VAR_mac_axis.valid;

     -- BIN_OP_EQ[eth_8_h_l51_c6_60ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l51_c6_60ab_left <= VAR_BIN_OP_EQ_eth_8_h_l51_c6_60ab_left;
     BIN_OP_EQ_eth_8_h_l51_c6_60ab_right <= VAR_BIN_OP_EQ_eth_8_h_l51_c6_60ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l51_c6_60ab_return_output := BIN_OP_EQ_eth_8_h_l51_c6_60ab_return_output;

     -- BIN_OP_PLUS[eth_8_h_l58_c9_1b60] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l58_c9_1b60_left <= VAR_BIN_OP_PLUS_eth_8_h_l58_c9_1b60_left;
     BIN_OP_PLUS_eth_8_h_l58_c9_1b60_right <= VAR_BIN_OP_PLUS_eth_8_h_l58_c9_1b60_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l58_c9_1b60_return_output := BIN_OP_PLUS_eth_8_h_l58_c9_1b60_return_output;

     -- BIN_OP_EQ[eth_8_h_l64_c10_ecdf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l64_c10_ecdf_left <= VAR_BIN_OP_EQ_eth_8_h_l64_c10_ecdf_left;
     BIN_OP_EQ_eth_8_h_l64_c10_ecdf_right <= VAR_BIN_OP_EQ_eth_8_h_l64_c10_ecdf_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l64_c10_ecdf_return_output := BIN_OP_EQ_eth_8_h_l64_c10_ecdf_return_output;

     -- BIN_OP_PLUS[eth_8_h_l92_c9_aa68] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l92_c9_aa68_left <= VAR_BIN_OP_PLUS_eth_8_h_l92_c9_aa68_left;
     BIN_OP_PLUS_eth_8_h_l92_c9_aa68_right <= VAR_BIN_OP_PLUS_eth_8_h_l92_c9_aa68_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l92_c9_aa68_return_output := BIN_OP_PLUS_eth_8_h_l92_c9_aa68_return_output;

     -- BIN_OP_EQ[eth_8_h_l86_c37_fb51] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l86_c37_fb51_left <= VAR_BIN_OP_EQ_eth_8_h_l86_c37_fb51_left;
     BIN_OP_EQ_eth_8_h_l86_c37_fb51_right <= VAR_BIN_OP_EQ_eth_8_h_l86_c37_fb51_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l86_c37_fb51_return_output := BIN_OP_EQ_eth_8_h_l86_c37_fb51_return_output;

     -- BIN_OP_EQ[eth_8_h_l54_c10_310c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l54_c10_310c_left <= VAR_BIN_OP_EQ_eth_8_h_l54_c10_310c_left;
     BIN_OP_EQ_eth_8_h_l54_c10_310c_right <= VAR_BIN_OP_EQ_eth_8_h_l54_c10_310c_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l54_c10_310c_return_output := BIN_OP_EQ_eth_8_h_l54_c10_310c_return_output;

     -- BIN_OP_EQ[eth_8_h_l61_c12_a3f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l61_c12_a3f8_left <= VAR_BIN_OP_EQ_eth_8_h_l61_c12_a3f8_left;
     BIN_OP_EQ_eth_8_h_l61_c12_a3f8_right <= VAR_BIN_OP_EQ_eth_8_h_l61_c12_a3f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l61_c12_a3f8_return_output := BIN_OP_EQ_eth_8_h_l61_c12_a3f8_return_output;

     -- BIN_OP_PLUS[eth_8_h_l68_c9_9ce2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l68_c9_9ce2_left <= VAR_BIN_OP_PLUS_eth_8_h_l68_c9_9ce2_left;
     BIN_OP_PLUS_eth_8_h_l68_c9_9ce2_right <= VAR_BIN_OP_PLUS_eth_8_h_l68_c9_9ce2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l68_c9_9ce2_return_output := BIN_OP_PLUS_eth_8_h_l68_c9_9ce2_return_output;

     -- CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l62_l63_l61_DUPLICATE_53b4 LATENCY=0
     VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l62_l63_l61_DUPLICATE_53b4_return_output := header.src_mac;

     -- BIN_OP_EQ[eth_8_h_l83_c11_d163] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l83_c11_d163_left <= VAR_BIN_OP_EQ_eth_8_h_l83_c11_d163_left;
     BIN_OP_EQ_eth_8_h_l83_c11_d163_right <= VAR_BIN_OP_EQ_eth_8_h_l83_c11_d163_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l83_c11_d163_return_output := BIN_OP_EQ_eth_8_h_l83_c11_d163_return_output;

     -- CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l52_l53_DUPLICATE_bcf0 LATENCY=0
     VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l52_l53_DUPLICATE_bcf0_return_output := header.dst_mac;

     -- CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l73_l63_DUPLICATE_2280 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l73_l63_DUPLICATE_2280_return_output := VAR_mac_axis.data.tdata(0);

     -- CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l73_l72_l71_l61_DUPLICATE_bcbe LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l73_l72_l71_l61_DUPLICATE_bcbe_return_output := header.ethertype;

     -- UNARY_OP_NOT[eth_8_h_l89_c35_f074] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_eth_8_h_l89_c35_f074_expr <= VAR_UNARY_OP_NOT_eth_8_h_l89_c35_f074_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_eth_8_h_l89_c35_f074_return_output := UNARY_OP_NOT_eth_8_h_l89_c35_f074_return_output;

     -- BIN_OP_EQ[eth_8_h_l71_c12_b3f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l71_c12_b3f7_left <= VAR_BIN_OP_EQ_eth_8_h_l71_c12_b3f7_left;
     BIN_OP_EQ_eth_8_h_l71_c12_b3f7_right <= VAR_BIN_OP_EQ_eth_8_h_l71_c12_b3f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l71_c12_b3f7_return_output := BIN_OP_EQ_eth_8_h_l71_c12_b3f7_return_output;

     -- Submodule level 1
     VAR_counter_MUX_eth_8_h_l51_c3_b743_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_60ab_return_output;
     VAR_header_MUX_eth_8_h_l51_c3_b743_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_60ab_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_60ab_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_60ab_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l51_c3_b743_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_60ab_return_output;
     VAR_o_overflow_MUX_eth_8_h_l51_c3_b743_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_60ab_return_output;
     VAR_state_MUX_eth_8_h_l51_c3_b743_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_60ab_return_output;
     VAR_counter_MUX_eth_8_h_l54_c7_7ecb_cond := VAR_BIN_OP_EQ_eth_8_h_l54_c10_310c_return_output;
     VAR_state_MUX_eth_8_h_l54_c7_7ecb_cond := VAR_BIN_OP_EQ_eth_8_h_l54_c10_310c_return_output;
     VAR_counter_MUX_eth_8_h_l61_c9_a8e5_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_a3f8_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l61_c9_a8e5_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_a3f8_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l61_c9_a8e5_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_a3f8_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_a3f8_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_a3f8_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_a3f8_return_output;
     VAR_o_overflow_MUX_eth_8_h_l61_c9_a8e5_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_a3f8_return_output;
     VAR_state_MUX_eth_8_h_l61_c9_a8e5_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_a3f8_return_output;
     VAR_counter_MUX_eth_8_h_l64_c7_e49a_cond := VAR_BIN_OP_EQ_eth_8_h_l64_c10_ecdf_return_output;
     VAR_state_MUX_eth_8_h_l64_c7_e49a_cond := VAR_BIN_OP_EQ_eth_8_h_l64_c10_ecdf_return_output;
     VAR_counter_MUX_eth_8_h_l71_c9_38d1_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_b3f7_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l71_c9_38d1_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_b3f7_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_b3f7_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_b3f7_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l71_c9_38d1_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_b3f7_return_output;
     VAR_o_overflow_MUX_eth_8_h_l71_c9_38d1_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_b3f7_return_output;
     VAR_state_MUX_eth_8_h_l71_c9_38d1_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_b3f7_return_output;
     VAR_counter_MUX_eth_8_h_l74_c7_2bd2_cond := VAR_BIN_OP_EQ_eth_8_h_l74_c10_cdd4_return_output;
     VAR_state_MUX_eth_8_h_l74_c7_2bd2_cond := VAR_BIN_OP_EQ_eth_8_h_l74_c10_cdd4_return_output;
     VAR_counter_MUX_eth_8_h_l83_c8_31b0_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_d163_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_d163_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_d163_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l83_c8_31b0_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_d163_return_output;
     VAR_o_overflow_MUX_eth_8_h_l83_c8_31b0_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_d163_return_output;
     VAR_state_MUX_eth_8_h_l83_c8_31b0_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_d163_return_output;
     VAR_counter_MUX_eth_8_h_l91_c7_adbc_cond := VAR_BIN_OP_EQ_eth_8_h_l86_c37_fb51_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_iftrue := VAR_BIN_OP_EQ_eth_8_h_l86_c37_fb51_return_output;
     VAR_counter_eth_8_h_l58_c9_ad63 := resize(VAR_BIN_OP_PLUS_eth_8_h_l58_c9_1b60_return_output, 3);
     VAR_counter_eth_8_h_l68_c9_59b1 := resize(VAR_BIN_OP_PLUS_eth_8_h_l68_c9_9ce2_return_output, 3);
     VAR_counter_eth_8_h_l78_c9_a99f := resize(VAR_BIN_OP_PLUS_eth_8_h_l78_c9_d4a9_return_output, 3);
     VAR_counter_eth_8_h_l92_c9_3bfe := resize(VAR_BIN_OP_PLUS_eth_8_h_l92_c9_aa68_return_output, 3);
     VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_iftrue := VAR_CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d_eth_8_h_l85_c28_454e_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l61_c9_a8e5_iftrue := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l73_l72_l71_l61_DUPLICATE_bcbe_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l71_c9_38d1_iffalse := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l73_l72_l71_l61_DUPLICATE_bcbe_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l72_c5_d079_iffalse := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l73_l72_l71_l61_DUPLICATE_bcbe_return_output;
     VAR_BIN_OP_AND_eth_8_h_l89_c18_83e3_left := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l52_l87_l72_l62_DUPLICATE_509d_return_output;
     VAR_counter_MUX_eth_8_h_l52_c5_63c9_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l52_l87_l72_l62_DUPLICATE_509d_return_output;
     VAR_counter_MUX_eth_8_h_l62_c5_b9b0_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l52_l87_l72_l62_DUPLICATE_509d_return_output;
     VAR_counter_MUX_eth_8_h_l72_c5_d079_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l52_l87_l72_l62_DUPLICATE_509d_return_output;
     VAR_counter_MUX_eth_8_h_l90_c5_5066_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l52_l87_l72_l62_DUPLICATE_509d_return_output;
     VAR_header_dst_mac_MUX_eth_8_h_l52_c5_63c9_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l52_l87_l72_l62_DUPLICATE_509d_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l72_c5_d079_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l52_l87_l72_l62_DUPLICATE_509d_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l62_c5_b9b0_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l52_l87_l72_l62_DUPLICATE_509d_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l83_c8_31b0_iftrue := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l52_l87_l72_l62_DUPLICATE_509d_return_output;
     VAR_state_MUX_eth_8_h_l52_c5_63c9_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l52_l87_l72_l62_DUPLICATE_509d_return_output;
     VAR_state_MUX_eth_8_h_l62_c5_b9b0_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l52_l87_l72_l62_DUPLICATE_509d_return_output;
     VAR_state_MUX_eth_8_h_l72_c5_d079_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l52_l87_l72_l62_DUPLICATE_509d_return_output;
     VAR_state_MUX_eth_8_h_l90_c5_5066_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l52_l87_l72_l62_DUPLICATE_509d_return_output;
     VAR_header_dst_mac_MUX_eth_8_h_l52_c5_63c9_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l52_l53_DUPLICATE_bcf0_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l61_c9_a8e5_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l62_l63_l61_DUPLICATE_53b4_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l62_c5_b9b0_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l62_l63_l61_DUPLICATE_53b4_return_output;
     VAR_BIN_OP_AND_eth_8_h_l89_c18_83e3_right := VAR_UNARY_OP_NOT_eth_8_h_l89_c35_f074_return_output;
     VAR_counter_MUX_eth_8_h_l54_c7_7ecb_iffalse := VAR_counter_eth_8_h_l58_c9_ad63;
     VAR_counter_MUX_eth_8_h_l64_c7_e49a_iffalse := VAR_counter_eth_8_h_l68_c9_59b1;
     VAR_counter_MUX_eth_8_h_l74_c7_2bd2_iffalse := VAR_counter_eth_8_h_l78_c9_a99f;
     VAR_counter_MUX_eth_8_h_l91_c7_adbc_iftrue := VAR_counter_eth_8_h_l92_c9_3bfe;
     -- state_MUX[eth_8_h_l54_c7_7ecb] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l54_c7_7ecb_cond <= VAR_state_MUX_eth_8_h_l54_c7_7ecb_cond;
     state_MUX_eth_8_h_l54_c7_7ecb_iftrue <= VAR_state_MUX_eth_8_h_l54_c7_7ecb_iftrue;
     state_MUX_eth_8_h_l54_c7_7ecb_iffalse <= VAR_state_MUX_eth_8_h_l54_c7_7ecb_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l54_c7_7ecb_return_output := state_MUX_eth_8_h_l54_c7_7ecb_return_output;

     -- BIN_OP_AND[eth_8_h_l89_c18_83e3] LATENCY=0
     -- Inputs
     BIN_OP_AND_eth_8_h_l89_c18_83e3_left <= VAR_BIN_OP_AND_eth_8_h_l89_c18_83e3_left;
     BIN_OP_AND_eth_8_h_l89_c18_83e3_right <= VAR_BIN_OP_AND_eth_8_h_l89_c18_83e3_right;
     -- Outputs
     VAR_BIN_OP_AND_eth_8_h_l89_c18_83e3_return_output := BIN_OP_AND_eth_8_h_l89_c18_83e3_return_output;

     -- o_frame_valid_MUX[eth_8_h_l83_c8_31b0] LATENCY=0
     -- Inputs
     o_frame_valid_MUX_eth_8_h_l83_c8_31b0_cond <= VAR_o_frame_valid_MUX_eth_8_h_l83_c8_31b0_cond;
     o_frame_valid_MUX_eth_8_h_l83_c8_31b0_iftrue <= VAR_o_frame_valid_MUX_eth_8_h_l83_c8_31b0_iftrue;
     o_frame_valid_MUX_eth_8_h_l83_c8_31b0_iffalse <= VAR_o_frame_valid_MUX_eth_8_h_l83_c8_31b0_iffalse;
     -- Outputs
     VAR_o_frame_valid_MUX_eth_8_h_l83_c8_31b0_return_output := o_frame_valid_MUX_eth_8_h_l83_c8_31b0_return_output;

     -- state_MUX[eth_8_h_l64_c7_e49a] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l64_c7_e49a_cond <= VAR_state_MUX_eth_8_h_l64_c7_e49a_cond;
     state_MUX_eth_8_h_l64_c7_e49a_iftrue <= VAR_state_MUX_eth_8_h_l64_c7_e49a_iftrue;
     state_MUX_eth_8_h_l64_c7_e49a_iffalse <= VAR_state_MUX_eth_8_h_l64_c7_e49a_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l64_c7_e49a_return_output := state_MUX_eth_8_h_l64_c7_e49a_return_output;

     -- state_MUX[eth_8_h_l74_c7_2bd2] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l74_c7_2bd2_cond <= VAR_state_MUX_eth_8_h_l74_c7_2bd2_cond;
     state_MUX_eth_8_h_l74_c7_2bd2_iftrue <= VAR_state_MUX_eth_8_h_l74_c7_2bd2_iftrue;
     state_MUX_eth_8_h_l74_c7_2bd2_iffalse <= VAR_state_MUX_eth_8_h_l74_c7_2bd2_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l74_c7_2bd2_return_output := state_MUX_eth_8_h_l74_c7_2bd2_return_output;

     -- o_frame_data_start_of_payload_MUX[eth_8_h_l83_c8_31b0] LATENCY=0
     -- Inputs
     o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_cond <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_cond;
     o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_iftrue <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_iftrue;
     o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_iffalse <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_iffalse;
     -- Outputs
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_return_output := o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_return_output;

     -- CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7[eth_8_h_l94_c10_900e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7_eth_8_h_l94_c10_900e_return_output := CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7(
     VAR_CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d_eth_8_h_l85_c28_454e_return_output);

     -- uint40_uint8[eth_8_h_l63_c24_536c] LATENCY=0
     VAR_uint40_uint8_eth_8_h_l63_c24_536c_return_output := uint40_uint8(
     resize(VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l62_l63_l61_DUPLICATE_53b4_return_output, 40),
     VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l73_l63_DUPLICATE_2280_return_output);

     -- counter_MUX[eth_8_h_l91_c7_adbc] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l91_c7_adbc_cond <= VAR_counter_MUX_eth_8_h_l91_c7_adbc_cond;
     counter_MUX_eth_8_h_l91_c7_adbc_iftrue <= VAR_counter_MUX_eth_8_h_l91_c7_adbc_iftrue;
     counter_MUX_eth_8_h_l91_c7_adbc_iffalse <= VAR_counter_MUX_eth_8_h_l91_c7_adbc_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l91_c7_adbc_return_output := counter_MUX_eth_8_h_l91_c7_adbc_return_output;

     -- uint8_uint8[eth_8_h_l73_c26_71de] LATENCY=0
     VAR_uint8_uint8_eth_8_h_l73_c26_71de_return_output := uint8_uint8(
     resize(VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l73_l72_l71_l61_DUPLICATE_bcbe_return_output, 8),
     VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l73_l63_DUPLICATE_2280_return_output);

     -- counter_MUX[eth_8_h_l74_c7_2bd2] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l74_c7_2bd2_cond <= VAR_counter_MUX_eth_8_h_l74_c7_2bd2_cond;
     counter_MUX_eth_8_h_l74_c7_2bd2_iftrue <= VAR_counter_MUX_eth_8_h_l74_c7_2bd2_iftrue;
     counter_MUX_eth_8_h_l74_c7_2bd2_iffalse <= VAR_counter_MUX_eth_8_h_l74_c7_2bd2_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l74_c7_2bd2_return_output := counter_MUX_eth_8_h_l74_c7_2bd2_return_output;

     -- counter_MUX[eth_8_h_l54_c7_7ecb] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l54_c7_7ecb_cond <= VAR_counter_MUX_eth_8_h_l54_c7_7ecb_cond;
     counter_MUX_eth_8_h_l54_c7_7ecb_iftrue <= VAR_counter_MUX_eth_8_h_l54_c7_7ecb_iftrue;
     counter_MUX_eth_8_h_l54_c7_7ecb_iffalse <= VAR_counter_MUX_eth_8_h_l54_c7_7ecb_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l54_c7_7ecb_return_output := counter_MUX_eth_8_h_l54_c7_7ecb_return_output;

     -- uint40_uint8[eth_8_h_l53_c24_7e11] LATENCY=0
     VAR_uint40_uint8_eth_8_h_l53_c24_7e11_return_output := uint40_uint8(
     resize(VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l52_l53_DUPLICATE_bcf0_return_output, 40),
     VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l73_l63_DUPLICATE_2280_return_output);

     -- counter_MUX[eth_8_h_l64_c7_e49a] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l64_c7_e49a_cond <= VAR_counter_MUX_eth_8_h_l64_c7_e49a_cond;
     counter_MUX_eth_8_h_l64_c7_e49a_iftrue <= VAR_counter_MUX_eth_8_h_l64_c7_e49a_iftrue;
     counter_MUX_eth_8_h_l64_c7_e49a_iffalse <= VAR_counter_MUX_eth_8_h_l64_c7_e49a_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l64_c7_e49a_return_output := counter_MUX_eth_8_h_l64_c7_e49a_return_output;

     -- o_frame_data_payload_MUX[eth_8_h_l83_c8_31b0] LATENCY=0
     -- Inputs
     o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_cond <= VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_cond;
     o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_iftrue <= VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_iftrue;
     o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_iffalse <= VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_iffalse;
     -- Outputs
     VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_return_output := o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_return_output;

     -- Submodule level 2
     VAR_o_overflow_MUX_eth_8_h_l83_c8_31b0_iftrue := VAR_BIN_OP_AND_eth_8_h_l89_c18_83e3_return_output;
     VAR_counter_MUX_eth_8_h_l94_c7_7073_cond := VAR_CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7_eth_8_h_l94_c10_900e_return_output;
     VAR_state_MUX_eth_8_h_l94_c7_7073_cond := VAR_CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7_eth_8_h_l94_c10_900e_return_output;
     VAR_counter_MUX_eth_8_h_l52_c5_63c9_iftrue := VAR_counter_MUX_eth_8_h_l54_c7_7ecb_return_output;
     VAR_counter_MUX_eth_8_h_l62_c5_b9b0_iftrue := VAR_counter_MUX_eth_8_h_l64_c7_e49a_return_output;
     VAR_counter_MUX_eth_8_h_l72_c5_d079_iftrue := VAR_counter_MUX_eth_8_h_l74_c7_2bd2_return_output;
     VAR_counter_MUX_eth_8_h_l94_c7_7073_iffalse := VAR_counter_MUX_eth_8_h_l91_c7_adbc_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_iffalse := VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_31b0_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_iffalse := VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_31b0_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l71_c9_38d1_iffalse := VAR_o_frame_valid_MUX_eth_8_h_l83_c8_31b0_return_output;
     VAR_state_MUX_eth_8_h_l52_c5_63c9_iftrue := VAR_state_MUX_eth_8_h_l54_c7_7ecb_return_output;
     VAR_state_MUX_eth_8_h_l62_c5_b9b0_iftrue := VAR_state_MUX_eth_8_h_l64_c7_e49a_return_output;
     VAR_state_MUX_eth_8_h_l72_c5_d079_iftrue := VAR_state_MUX_eth_8_h_l74_c7_2bd2_return_output;
     VAR_header_dst_mac_MUX_eth_8_h_l52_c5_63c9_iftrue := VAR_uint40_uint8_eth_8_h_l53_c24_7e11_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l62_c5_b9b0_iftrue := VAR_uint40_uint8_eth_8_h_l63_c24_536c_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l72_c5_d079_iftrue := VAR_uint8_uint8_eth_8_h_l73_c26_71de_return_output;
     -- counter_MUX[eth_8_h_l94_c7_7073] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l94_c7_7073_cond <= VAR_counter_MUX_eth_8_h_l94_c7_7073_cond;
     counter_MUX_eth_8_h_l94_c7_7073_iftrue <= VAR_counter_MUX_eth_8_h_l94_c7_7073_iftrue;
     counter_MUX_eth_8_h_l94_c7_7073_iffalse <= VAR_counter_MUX_eth_8_h_l94_c7_7073_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l94_c7_7073_return_output := counter_MUX_eth_8_h_l94_c7_7073_return_output;

     -- header_src_mac_MUX[eth_8_h_l62_c5_b9b0] LATENCY=0
     -- Inputs
     header_src_mac_MUX_eth_8_h_l62_c5_b9b0_cond <= VAR_header_src_mac_MUX_eth_8_h_l62_c5_b9b0_cond;
     header_src_mac_MUX_eth_8_h_l62_c5_b9b0_iftrue <= VAR_header_src_mac_MUX_eth_8_h_l62_c5_b9b0_iftrue;
     header_src_mac_MUX_eth_8_h_l62_c5_b9b0_iffalse <= VAR_header_src_mac_MUX_eth_8_h_l62_c5_b9b0_iffalse;
     -- Outputs
     VAR_header_src_mac_MUX_eth_8_h_l62_c5_b9b0_return_output := header_src_mac_MUX_eth_8_h_l62_c5_b9b0_return_output;

     -- header_ethertype_MUX[eth_8_h_l72_c5_d079] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l72_c5_d079_cond <= VAR_header_ethertype_MUX_eth_8_h_l72_c5_d079_cond;
     header_ethertype_MUX_eth_8_h_l72_c5_d079_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l72_c5_d079_iftrue;
     header_ethertype_MUX_eth_8_h_l72_c5_d079_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l72_c5_d079_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l72_c5_d079_return_output := header_ethertype_MUX_eth_8_h_l72_c5_d079_return_output;

     -- header_dst_mac_MUX[eth_8_h_l52_c5_63c9] LATENCY=0
     -- Inputs
     header_dst_mac_MUX_eth_8_h_l52_c5_63c9_cond <= VAR_header_dst_mac_MUX_eth_8_h_l52_c5_63c9_cond;
     header_dst_mac_MUX_eth_8_h_l52_c5_63c9_iftrue <= VAR_header_dst_mac_MUX_eth_8_h_l52_c5_63c9_iftrue;
     header_dst_mac_MUX_eth_8_h_l52_c5_63c9_iffalse <= VAR_header_dst_mac_MUX_eth_8_h_l52_c5_63c9_iffalse;
     -- Outputs
     VAR_header_dst_mac_MUX_eth_8_h_l52_c5_63c9_return_output := header_dst_mac_MUX_eth_8_h_l52_c5_63c9_return_output;

     -- state_MUX[eth_8_h_l62_c5_b9b0] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l62_c5_b9b0_cond <= VAR_state_MUX_eth_8_h_l62_c5_b9b0_cond;
     state_MUX_eth_8_h_l62_c5_b9b0_iftrue <= VAR_state_MUX_eth_8_h_l62_c5_b9b0_iftrue;
     state_MUX_eth_8_h_l62_c5_b9b0_iffalse <= VAR_state_MUX_eth_8_h_l62_c5_b9b0_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l62_c5_b9b0_return_output := state_MUX_eth_8_h_l62_c5_b9b0_return_output;

     -- o_overflow_MUX[eth_8_h_l83_c8_31b0] LATENCY=0
     -- Inputs
     o_overflow_MUX_eth_8_h_l83_c8_31b0_cond <= VAR_o_overflow_MUX_eth_8_h_l83_c8_31b0_cond;
     o_overflow_MUX_eth_8_h_l83_c8_31b0_iftrue <= VAR_o_overflow_MUX_eth_8_h_l83_c8_31b0_iftrue;
     o_overflow_MUX_eth_8_h_l83_c8_31b0_iffalse <= VAR_o_overflow_MUX_eth_8_h_l83_c8_31b0_iffalse;
     -- Outputs
     VAR_o_overflow_MUX_eth_8_h_l83_c8_31b0_return_output := o_overflow_MUX_eth_8_h_l83_c8_31b0_return_output;

     -- state_MUX[eth_8_h_l52_c5_63c9] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l52_c5_63c9_cond <= VAR_state_MUX_eth_8_h_l52_c5_63c9_cond;
     state_MUX_eth_8_h_l52_c5_63c9_iftrue <= VAR_state_MUX_eth_8_h_l52_c5_63c9_iftrue;
     state_MUX_eth_8_h_l52_c5_63c9_iffalse <= VAR_state_MUX_eth_8_h_l52_c5_63c9_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l52_c5_63c9_return_output := state_MUX_eth_8_h_l52_c5_63c9_return_output;

     -- counter_MUX[eth_8_h_l52_c5_63c9] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l52_c5_63c9_cond <= VAR_counter_MUX_eth_8_h_l52_c5_63c9_cond;
     counter_MUX_eth_8_h_l52_c5_63c9_iftrue <= VAR_counter_MUX_eth_8_h_l52_c5_63c9_iftrue;
     counter_MUX_eth_8_h_l52_c5_63c9_iffalse <= VAR_counter_MUX_eth_8_h_l52_c5_63c9_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l52_c5_63c9_return_output := counter_MUX_eth_8_h_l52_c5_63c9_return_output;

     -- o_frame_data_payload_MUX[eth_8_h_l71_c9_38d1] LATENCY=0
     -- Inputs
     o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_cond <= VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_cond;
     o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_iftrue <= VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_iftrue;
     o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_iffalse <= VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_iffalse;
     -- Outputs
     VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_return_output := o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_return_output;

     -- o_frame_data_start_of_payload_MUX[eth_8_h_l71_c9_38d1] LATENCY=0
     -- Inputs
     o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_cond <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_cond;
     o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_iftrue <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_iftrue;
     o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_iffalse <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_iffalse;
     -- Outputs
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_return_output := o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_return_output;

     -- state_MUX[eth_8_h_l72_c5_d079] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l72_c5_d079_cond <= VAR_state_MUX_eth_8_h_l72_c5_d079_cond;
     state_MUX_eth_8_h_l72_c5_d079_iftrue <= VAR_state_MUX_eth_8_h_l72_c5_d079_iftrue;
     state_MUX_eth_8_h_l72_c5_d079_iffalse <= VAR_state_MUX_eth_8_h_l72_c5_d079_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l72_c5_d079_return_output := state_MUX_eth_8_h_l72_c5_d079_return_output;

     -- counter_MUX[eth_8_h_l62_c5_b9b0] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l62_c5_b9b0_cond <= VAR_counter_MUX_eth_8_h_l62_c5_b9b0_cond;
     counter_MUX_eth_8_h_l62_c5_b9b0_iftrue <= VAR_counter_MUX_eth_8_h_l62_c5_b9b0_iftrue;
     counter_MUX_eth_8_h_l62_c5_b9b0_iffalse <= VAR_counter_MUX_eth_8_h_l62_c5_b9b0_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l62_c5_b9b0_return_output := counter_MUX_eth_8_h_l62_c5_b9b0_return_output;

     -- counter_MUX[eth_8_h_l72_c5_d079] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l72_c5_d079_cond <= VAR_counter_MUX_eth_8_h_l72_c5_d079_cond;
     counter_MUX_eth_8_h_l72_c5_d079_iftrue <= VAR_counter_MUX_eth_8_h_l72_c5_d079_iftrue;
     counter_MUX_eth_8_h_l72_c5_d079_iffalse <= VAR_counter_MUX_eth_8_h_l72_c5_d079_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l72_c5_d079_return_output := counter_MUX_eth_8_h_l72_c5_d079_return_output;

     -- o_frame_valid_MUX[eth_8_h_l71_c9_38d1] LATENCY=0
     -- Inputs
     o_frame_valid_MUX_eth_8_h_l71_c9_38d1_cond <= VAR_o_frame_valid_MUX_eth_8_h_l71_c9_38d1_cond;
     o_frame_valid_MUX_eth_8_h_l71_c9_38d1_iftrue <= VAR_o_frame_valid_MUX_eth_8_h_l71_c9_38d1_iftrue;
     o_frame_valid_MUX_eth_8_h_l71_c9_38d1_iffalse <= VAR_o_frame_valid_MUX_eth_8_h_l71_c9_38d1_iffalse;
     -- Outputs
     VAR_o_frame_valid_MUX_eth_8_h_l71_c9_38d1_return_output := o_frame_valid_MUX_eth_8_h_l71_c9_38d1_return_output;

     -- state_MUX[eth_8_h_l94_c7_7073] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l94_c7_7073_cond <= VAR_state_MUX_eth_8_h_l94_c7_7073_cond;
     state_MUX_eth_8_h_l94_c7_7073_iftrue <= VAR_state_MUX_eth_8_h_l94_c7_7073_iftrue;
     state_MUX_eth_8_h_l94_c7_7073_iffalse <= VAR_state_MUX_eth_8_h_l94_c7_7073_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l94_c7_7073_return_output := state_MUX_eth_8_h_l94_c7_7073_return_output;

     -- Submodule level 3
     VAR_counter_MUX_eth_8_h_l51_c3_b743_iftrue := VAR_counter_MUX_eth_8_h_l52_c5_63c9_return_output;
     VAR_counter_MUX_eth_8_h_l61_c9_a8e5_iftrue := VAR_counter_MUX_eth_8_h_l62_c5_b9b0_return_output;
     VAR_counter_MUX_eth_8_h_l71_c9_38d1_iftrue := VAR_counter_MUX_eth_8_h_l72_c5_d079_return_output;
     VAR_counter_MUX_eth_8_h_l90_c5_5066_iftrue := VAR_counter_MUX_eth_8_h_l94_c7_7073_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l71_c9_38d1_iftrue := VAR_header_ethertype_MUX_eth_8_h_l72_c5_d079_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l61_c9_a8e5_iftrue := VAR_header_src_mac_MUX_eth_8_h_l62_c5_b9b0_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_iffalse := VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_38d1_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_iffalse := VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_38d1_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_iffalse := VAR_o_frame_valid_MUX_eth_8_h_l71_c9_38d1_return_output;
     VAR_o_overflow_MUX_eth_8_h_l71_c9_38d1_iffalse := VAR_o_overflow_MUX_eth_8_h_l83_c8_31b0_return_output;
     VAR_state_MUX_eth_8_h_l51_c3_b743_iftrue := VAR_state_MUX_eth_8_h_l52_c5_63c9_return_output;
     VAR_state_MUX_eth_8_h_l61_c9_a8e5_iftrue := VAR_state_MUX_eth_8_h_l62_c5_b9b0_return_output;
     VAR_state_MUX_eth_8_h_l71_c9_38d1_iftrue := VAR_state_MUX_eth_8_h_l72_c5_d079_return_output;
     VAR_state_MUX_eth_8_h_l90_c5_5066_iftrue := VAR_state_MUX_eth_8_h_l94_c7_7073_return_output;
     -- state_MUX[eth_8_h_l90_c5_5066] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l90_c5_5066_cond <= VAR_state_MUX_eth_8_h_l90_c5_5066_cond;
     state_MUX_eth_8_h_l90_c5_5066_iftrue <= VAR_state_MUX_eth_8_h_l90_c5_5066_iftrue;
     state_MUX_eth_8_h_l90_c5_5066_iffalse <= VAR_state_MUX_eth_8_h_l90_c5_5066_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l90_c5_5066_return_output := state_MUX_eth_8_h_l90_c5_5066_return_output;

     -- o_frame_data_payload_MUX[eth_8_h_l61_c9_a8e5] LATENCY=0
     -- Inputs
     o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_cond <= VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_cond;
     o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_iftrue <= VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_iftrue;
     o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_iffalse <= VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_iffalse;
     -- Outputs
     VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_return_output := o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_return_output;

     -- header_src_mac_MUX[eth_8_h_l61_c9_a8e5] LATENCY=0
     -- Inputs
     header_src_mac_MUX_eth_8_h_l61_c9_a8e5_cond <= VAR_header_src_mac_MUX_eth_8_h_l61_c9_a8e5_cond;
     header_src_mac_MUX_eth_8_h_l61_c9_a8e5_iftrue <= VAR_header_src_mac_MUX_eth_8_h_l61_c9_a8e5_iftrue;
     header_src_mac_MUX_eth_8_h_l61_c9_a8e5_iffalse <= VAR_header_src_mac_MUX_eth_8_h_l61_c9_a8e5_iffalse;
     -- Outputs
     VAR_header_src_mac_MUX_eth_8_h_l61_c9_a8e5_return_output := header_src_mac_MUX_eth_8_h_l61_c9_a8e5_return_output;

     -- o_frame_valid_MUX[eth_8_h_l61_c9_a8e5] LATENCY=0
     -- Inputs
     o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_cond <= VAR_o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_cond;
     o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_iftrue <= VAR_o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_iftrue;
     o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_iffalse <= VAR_o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_iffalse;
     -- Outputs
     VAR_o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_return_output := o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_return_output;

     -- o_frame_data_start_of_payload_MUX[eth_8_h_l61_c9_a8e5] LATENCY=0
     -- Inputs
     o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_cond <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_cond;
     o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_iftrue <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_iftrue;
     o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_iffalse <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_iffalse;
     -- Outputs
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_return_output := o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_return_output;

     -- o_overflow_MUX[eth_8_h_l71_c9_38d1] LATENCY=0
     -- Inputs
     o_overflow_MUX_eth_8_h_l71_c9_38d1_cond <= VAR_o_overflow_MUX_eth_8_h_l71_c9_38d1_cond;
     o_overflow_MUX_eth_8_h_l71_c9_38d1_iftrue <= VAR_o_overflow_MUX_eth_8_h_l71_c9_38d1_iftrue;
     o_overflow_MUX_eth_8_h_l71_c9_38d1_iffalse <= VAR_o_overflow_MUX_eth_8_h_l71_c9_38d1_iffalse;
     -- Outputs
     VAR_o_overflow_MUX_eth_8_h_l71_c9_38d1_return_output := o_overflow_MUX_eth_8_h_l71_c9_38d1_return_output;

     -- header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484[eth_8_h_l51_c3_b743] LATENCY=0
     VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l51_c3_b743_return_output := CONST_REF_RD_eth_header_t_eth_header_t_e484(
     header,
     VAR_header_dst_mac_MUX_eth_8_h_l52_c5_63c9_return_output);

     -- header_ethertype_MUX[eth_8_h_l71_c9_38d1] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l71_c9_38d1_cond <= VAR_header_ethertype_MUX_eth_8_h_l71_c9_38d1_cond;
     header_ethertype_MUX_eth_8_h_l71_c9_38d1_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l71_c9_38d1_iftrue;
     header_ethertype_MUX_eth_8_h_l71_c9_38d1_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l71_c9_38d1_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l71_c9_38d1_return_output := header_ethertype_MUX_eth_8_h_l71_c9_38d1_return_output;

     -- counter_MUX[eth_8_h_l90_c5_5066] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l90_c5_5066_cond <= VAR_counter_MUX_eth_8_h_l90_c5_5066_cond;
     counter_MUX_eth_8_h_l90_c5_5066_iftrue <= VAR_counter_MUX_eth_8_h_l90_c5_5066_iftrue;
     counter_MUX_eth_8_h_l90_c5_5066_iffalse <= VAR_counter_MUX_eth_8_h_l90_c5_5066_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l90_c5_5066_return_output := counter_MUX_eth_8_h_l90_c5_5066_return_output;

     -- Submodule level 4
     VAR_counter_MUX_eth_8_h_l83_c8_31b0_iftrue := VAR_counter_MUX_eth_8_h_l90_c5_5066_return_output;
     VAR_header_MUX_eth_8_h_l51_c3_b743_iftrue := VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l51_c3_b743_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l61_c9_a8e5_iffalse := VAR_header_ethertype_MUX_eth_8_h_l71_c9_38d1_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_iffalse := VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_a8e5_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_iffalse := VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_a8e5_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l51_c3_b743_iffalse := VAR_o_frame_valid_MUX_eth_8_h_l61_c9_a8e5_return_output;
     VAR_o_overflow_MUX_eth_8_h_l61_c9_a8e5_iffalse := VAR_o_overflow_MUX_eth_8_h_l71_c9_38d1_return_output;
     VAR_state_MUX_eth_8_h_l83_c8_31b0_iftrue := VAR_state_MUX_eth_8_h_l90_c5_5066_return_output;
     -- counter_MUX[eth_8_h_l83_c8_31b0] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l83_c8_31b0_cond <= VAR_counter_MUX_eth_8_h_l83_c8_31b0_cond;
     counter_MUX_eth_8_h_l83_c8_31b0_iftrue <= VAR_counter_MUX_eth_8_h_l83_c8_31b0_iftrue;
     counter_MUX_eth_8_h_l83_c8_31b0_iffalse <= VAR_counter_MUX_eth_8_h_l83_c8_31b0_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l83_c8_31b0_return_output := counter_MUX_eth_8_h_l83_c8_31b0_return_output;

     -- o_overflow_MUX[eth_8_h_l61_c9_a8e5] LATENCY=0
     -- Inputs
     o_overflow_MUX_eth_8_h_l61_c9_a8e5_cond <= VAR_o_overflow_MUX_eth_8_h_l61_c9_a8e5_cond;
     o_overflow_MUX_eth_8_h_l61_c9_a8e5_iftrue <= VAR_o_overflow_MUX_eth_8_h_l61_c9_a8e5_iftrue;
     o_overflow_MUX_eth_8_h_l61_c9_a8e5_iffalse <= VAR_o_overflow_MUX_eth_8_h_l61_c9_a8e5_iffalse;
     -- Outputs
     VAR_o_overflow_MUX_eth_8_h_l61_c9_a8e5_return_output := o_overflow_MUX_eth_8_h_l61_c9_a8e5_return_output;

     -- o_frame_data_start_of_payload_MUX[eth_8_h_l51_c3_b743] LATENCY=0
     -- Inputs
     o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_cond <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_cond;
     o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_iftrue <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_iftrue;
     o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_iffalse <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_iffalse;
     -- Outputs
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_return_output := o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_return_output;

     -- o_frame_data_payload_MUX[eth_8_h_l51_c3_b743] LATENCY=0
     -- Inputs
     o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_cond <= VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_cond;
     o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_iftrue <= VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_iftrue;
     o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_iffalse <= VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_iffalse;
     -- Outputs
     VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_return_output := o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_return_output;

     -- o_frame_valid_MUX[eth_8_h_l51_c3_b743] LATENCY=0
     -- Inputs
     o_frame_valid_MUX_eth_8_h_l51_c3_b743_cond <= VAR_o_frame_valid_MUX_eth_8_h_l51_c3_b743_cond;
     o_frame_valid_MUX_eth_8_h_l51_c3_b743_iftrue <= VAR_o_frame_valid_MUX_eth_8_h_l51_c3_b743_iftrue;
     o_frame_valid_MUX_eth_8_h_l51_c3_b743_iffalse <= VAR_o_frame_valid_MUX_eth_8_h_l51_c3_b743_iffalse;
     -- Outputs
     VAR_o_frame_valid_MUX_eth_8_h_l51_c3_b743_return_output := o_frame_valid_MUX_eth_8_h_l51_c3_b743_return_output;

     -- header_ethertype_MUX[eth_8_h_l61_c9_a8e5] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l61_c9_a8e5_cond <= VAR_header_ethertype_MUX_eth_8_h_l61_c9_a8e5_cond;
     header_ethertype_MUX_eth_8_h_l61_c9_a8e5_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l61_c9_a8e5_iftrue;
     header_ethertype_MUX_eth_8_h_l61_c9_a8e5_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l61_c9_a8e5_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l61_c9_a8e5_return_output := header_ethertype_MUX_eth_8_h_l61_c9_a8e5_return_output;

     -- state_MUX[eth_8_h_l83_c8_31b0] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l83_c8_31b0_cond <= VAR_state_MUX_eth_8_h_l83_c8_31b0_cond;
     state_MUX_eth_8_h_l83_c8_31b0_iftrue <= VAR_state_MUX_eth_8_h_l83_c8_31b0_iftrue;
     state_MUX_eth_8_h_l83_c8_31b0_iffalse <= VAR_state_MUX_eth_8_h_l83_c8_31b0_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l83_c8_31b0_return_output := state_MUX_eth_8_h_l83_c8_31b0_return_output;

     -- Submodule level 5
     VAR_counter_MUX_eth_8_h_l71_c9_38d1_iffalse := VAR_counter_MUX_eth_8_h_l83_c8_31b0_return_output;
     VAR_o_overflow_MUX_eth_8_h_l51_c3_b743_iffalse := VAR_o_overflow_MUX_eth_8_h_l61_c9_a8e5_return_output;
     VAR_state_MUX_eth_8_h_l71_c9_38d1_iffalse := VAR_state_MUX_eth_8_h_l83_c8_31b0_return_output;
     -- state_MUX[eth_8_h_l71_c9_38d1] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l71_c9_38d1_cond <= VAR_state_MUX_eth_8_h_l71_c9_38d1_cond;
     state_MUX_eth_8_h_l71_c9_38d1_iftrue <= VAR_state_MUX_eth_8_h_l71_c9_38d1_iftrue;
     state_MUX_eth_8_h_l71_c9_38d1_iffalse <= VAR_state_MUX_eth_8_h_l71_c9_38d1_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l71_c9_38d1_return_output := state_MUX_eth_8_h_l71_c9_38d1_return_output;

     -- o_overflow_MUX[eth_8_h_l51_c3_b743] LATENCY=0
     -- Inputs
     o_overflow_MUX_eth_8_h_l51_c3_b743_cond <= VAR_o_overflow_MUX_eth_8_h_l51_c3_b743_cond;
     o_overflow_MUX_eth_8_h_l51_c3_b743_iftrue <= VAR_o_overflow_MUX_eth_8_h_l51_c3_b743_iftrue;
     o_overflow_MUX_eth_8_h_l51_c3_b743_iffalse <= VAR_o_overflow_MUX_eth_8_h_l51_c3_b743_iffalse;
     -- Outputs
     VAR_o_overflow_MUX_eth_8_h_l51_c3_b743_return_output := o_overflow_MUX_eth_8_h_l51_c3_b743_return_output;

     -- counter_MUX[eth_8_h_l71_c9_38d1] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l71_c9_38d1_cond <= VAR_counter_MUX_eth_8_h_l71_c9_38d1_cond;
     counter_MUX_eth_8_h_l71_c9_38d1_iftrue <= VAR_counter_MUX_eth_8_h_l71_c9_38d1_iftrue;
     counter_MUX_eth_8_h_l71_c9_38d1_iffalse <= VAR_counter_MUX_eth_8_h_l71_c9_38d1_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l71_c9_38d1_return_output := counter_MUX_eth_8_h_l71_c9_38d1_return_output;

     -- header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a[eth_8_h_l51_c3_b743] LATENCY=0
     VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a_eth_8_h_l51_c3_b743_return_output := CONST_REF_RD_eth_header_t_eth_header_t_325a(
     header,
     VAR_header_ethertype_MUX_eth_8_h_l61_c9_a8e5_return_output,
     VAR_header_src_mac_MUX_eth_8_h_l61_c9_a8e5_return_output);

     -- Submodule level 6
     VAR_counter_MUX_eth_8_h_l61_c9_a8e5_iffalse := VAR_counter_MUX_eth_8_h_l71_c9_38d1_return_output;
     VAR_header_MUX_eth_8_h_l51_c3_b743_iffalse := VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a_eth_8_h_l51_c3_b743_return_output;
     VAR_state_MUX_eth_8_h_l61_c9_a8e5_iffalse := VAR_state_MUX_eth_8_h_l71_c9_38d1_return_output;
     -- counter_MUX[eth_8_h_l61_c9_a8e5] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l61_c9_a8e5_cond <= VAR_counter_MUX_eth_8_h_l61_c9_a8e5_cond;
     counter_MUX_eth_8_h_l61_c9_a8e5_iftrue <= VAR_counter_MUX_eth_8_h_l61_c9_a8e5_iftrue;
     counter_MUX_eth_8_h_l61_c9_a8e5_iffalse <= VAR_counter_MUX_eth_8_h_l61_c9_a8e5_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l61_c9_a8e5_return_output := counter_MUX_eth_8_h_l61_c9_a8e5_return_output;

     -- CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_1622[eth_8_h_l100_c10_a09a] LATENCY=0
     VAR_CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_1622_eth_8_h_l100_c10_a09a_return_output := CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_1622(
     header,
     VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_b743_return_output,
     VAR_o_overflow_MUX_eth_8_h_l51_c3_b743_return_output,
     VAR_o_frame_valid_MUX_eth_8_h_l51_c3_b743_return_output,
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_b743_return_output);

     -- state_MUX[eth_8_h_l61_c9_a8e5] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l61_c9_a8e5_cond <= VAR_state_MUX_eth_8_h_l61_c9_a8e5_cond;
     state_MUX_eth_8_h_l61_c9_a8e5_iftrue <= VAR_state_MUX_eth_8_h_l61_c9_a8e5_iftrue;
     state_MUX_eth_8_h_l61_c9_a8e5_iffalse <= VAR_state_MUX_eth_8_h_l61_c9_a8e5_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l61_c9_a8e5_return_output := state_MUX_eth_8_h_l61_c9_a8e5_return_output;

     -- header_MUX[eth_8_h_l51_c3_b743] LATENCY=0
     -- Inputs
     header_MUX_eth_8_h_l51_c3_b743_cond <= VAR_header_MUX_eth_8_h_l51_c3_b743_cond;
     header_MUX_eth_8_h_l51_c3_b743_iftrue <= VAR_header_MUX_eth_8_h_l51_c3_b743_iftrue;
     header_MUX_eth_8_h_l51_c3_b743_iffalse <= VAR_header_MUX_eth_8_h_l51_c3_b743_iffalse;
     -- Outputs
     VAR_header_MUX_eth_8_h_l51_c3_b743_return_output := header_MUX_eth_8_h_l51_c3_b743_return_output;

     -- Submodule level 7
     VAR_return_output := VAR_CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_1622_eth_8_h_l100_c10_a09a_return_output;
     VAR_counter_MUX_eth_8_h_l51_c3_b743_iffalse := VAR_counter_MUX_eth_8_h_l61_c9_a8e5_return_output;
     REG_VAR_header := VAR_header_MUX_eth_8_h_l51_c3_b743_return_output;
     VAR_state_MUX_eth_8_h_l51_c3_b743_iffalse := VAR_state_MUX_eth_8_h_l61_c9_a8e5_return_output;
     -- counter_MUX[eth_8_h_l51_c3_b743] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l51_c3_b743_cond <= VAR_counter_MUX_eth_8_h_l51_c3_b743_cond;
     counter_MUX_eth_8_h_l51_c3_b743_iftrue <= VAR_counter_MUX_eth_8_h_l51_c3_b743_iftrue;
     counter_MUX_eth_8_h_l51_c3_b743_iffalse <= VAR_counter_MUX_eth_8_h_l51_c3_b743_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l51_c3_b743_return_output := counter_MUX_eth_8_h_l51_c3_b743_return_output;

     -- state_MUX[eth_8_h_l51_c3_b743] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l51_c3_b743_cond <= VAR_state_MUX_eth_8_h_l51_c3_b743_cond;
     state_MUX_eth_8_h_l51_c3_b743_iftrue <= VAR_state_MUX_eth_8_h_l51_c3_b743_iftrue;
     state_MUX_eth_8_h_l51_c3_b743_iffalse <= VAR_state_MUX_eth_8_h_l51_c3_b743_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l51_c3_b743_return_output := state_MUX_eth_8_h_l51_c3_b743_return_output;

     -- Submodule level 8
     REG_VAR_counter := VAR_counter_MUX_eth_8_h_l51_c3_b743_return_output;
     REG_VAR_state := VAR_state_MUX_eth_8_h_l51_c3_b743_return_output;
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
