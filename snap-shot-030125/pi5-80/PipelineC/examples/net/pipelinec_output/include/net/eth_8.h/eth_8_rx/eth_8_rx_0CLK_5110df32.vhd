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
-- BIN_OP_EQ[eth_8_h_l51_c6_3ab7]
signal BIN_OP_EQ_eth_8_h_l51_c6_3ab7_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l51_c6_3ab7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l51_c6_3ab7_return_output : unsigned(0 downto 0);

-- header_MUX[eth_8_h_l51_c3_9dc8]
signal header_MUX_eth_8_h_l51_c3_9dc8_cond : unsigned(0 downto 0);
signal header_MUX_eth_8_h_l51_c3_9dc8_iftrue : eth_header_t;
signal header_MUX_eth_8_h_l51_c3_9dc8_iffalse : eth_header_t;
signal header_MUX_eth_8_h_l51_c3_9dc8_return_output : eth_header_t;

-- counter_MUX[eth_8_h_l51_c3_9dc8]
signal counter_MUX_eth_8_h_l51_c3_9dc8_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l51_c3_9dc8_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l51_c3_9dc8_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l51_c3_9dc8_return_output : unsigned(2 downto 0);

-- o_frame_valid_MUX[eth_8_h_l51_c3_9dc8]
signal o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_cond : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_iftrue : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_iffalse : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_return_output : unsigned(0 downto 0);

-- o_frame_data_payload_MUX[eth_8_h_l51_c3_9dc8]
signal o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_cond : unsigned(0 downto 0);
signal o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_iftrue : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_iffalse : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_return_output : axis8_t;

-- o_overflow_MUX[eth_8_h_l51_c3_9dc8]
signal o_overflow_MUX_eth_8_h_l51_c3_9dc8_cond : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l51_c3_9dc8_iftrue : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l51_c3_9dc8_iffalse : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l51_c3_9dc8_return_output : unsigned(0 downto 0);

-- o_frame_data_start_of_payload_MUX[eth_8_h_l51_c3_9dc8]
signal o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_cond : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_iftrue : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_iffalse : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l51_c3_9dc8]
signal state_MUX_eth_8_h_l51_c3_9dc8_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l51_c3_9dc8_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l51_c3_9dc8_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l51_c3_9dc8_return_output : unsigned(2 downto 0);

-- header_dst_mac_MUX[eth_8_h_l52_c5_5ea5]
signal header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_cond : unsigned(0 downto 0);
signal header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_iftrue : unsigned(47 downto 0);
signal header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_iffalse : unsigned(47 downto 0);
signal header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_return_output : unsigned(47 downto 0);

-- counter_MUX[eth_8_h_l52_c5_5ea5]
signal counter_MUX_eth_8_h_l52_c5_5ea5_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l52_c5_5ea5_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l52_c5_5ea5_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l52_c5_5ea5_return_output : unsigned(2 downto 0);

-- state_MUX[eth_8_h_l52_c5_5ea5]
signal state_MUX_eth_8_h_l52_c5_5ea5_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l52_c5_5ea5_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l52_c5_5ea5_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l52_c5_5ea5_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[eth_8_h_l54_c10_d6a0]
signal BIN_OP_EQ_eth_8_h_l54_c10_d6a0_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l54_c10_d6a0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l54_c10_d6a0_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l54_c7_6adc]
signal counter_MUX_eth_8_h_l54_c7_6adc_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l54_c7_6adc_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l54_c7_6adc_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l54_c7_6adc_return_output : unsigned(2 downto 0);

-- state_MUX[eth_8_h_l54_c7_6adc]
signal state_MUX_eth_8_h_l54_c7_6adc_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l54_c7_6adc_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l54_c7_6adc_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l54_c7_6adc_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l58_c9_d75a]
signal BIN_OP_PLUS_eth_8_h_l58_c9_d75a_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_eth_8_h_l58_c9_d75a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l58_c9_d75a_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[eth_8_h_l61_c12_529a]
signal BIN_OP_EQ_eth_8_h_l61_c12_529a_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l61_c12_529a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l61_c12_529a_return_output : unsigned(0 downto 0);

-- header_ethertype_MUX[eth_8_h_l61_c9_d24e]
signal header_ethertype_MUX_eth_8_h_l61_c9_d24e_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l61_c9_d24e_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l61_c9_d24e_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l61_c9_d24e_return_output : unsigned(15 downto 0);

-- header_src_mac_MUX[eth_8_h_l61_c9_d24e]
signal header_src_mac_MUX_eth_8_h_l61_c9_d24e_cond : unsigned(0 downto 0);
signal header_src_mac_MUX_eth_8_h_l61_c9_d24e_iftrue : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l61_c9_d24e_iffalse : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l61_c9_d24e_return_output : unsigned(47 downto 0);

-- counter_MUX[eth_8_h_l61_c9_d24e]
signal counter_MUX_eth_8_h_l61_c9_d24e_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l61_c9_d24e_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l61_c9_d24e_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l61_c9_d24e_return_output : unsigned(2 downto 0);

-- o_frame_valid_MUX[eth_8_h_l61_c9_d24e]
signal o_frame_valid_MUX_eth_8_h_l61_c9_d24e_cond : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l61_c9_d24e_iftrue : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l61_c9_d24e_iffalse : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l61_c9_d24e_return_output : unsigned(0 downto 0);

-- o_frame_data_payload_MUX[eth_8_h_l61_c9_d24e]
signal o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_cond : unsigned(0 downto 0);
signal o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_iftrue : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_iffalse : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_return_output : axis8_t;

-- o_overflow_MUX[eth_8_h_l61_c9_d24e]
signal o_overflow_MUX_eth_8_h_l61_c9_d24e_cond : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l61_c9_d24e_iftrue : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l61_c9_d24e_iffalse : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l61_c9_d24e_return_output : unsigned(0 downto 0);

-- o_frame_data_start_of_payload_MUX[eth_8_h_l61_c9_d24e]
signal o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_cond : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_iftrue : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_iffalse : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l61_c9_d24e]
signal state_MUX_eth_8_h_l61_c9_d24e_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l61_c9_d24e_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l61_c9_d24e_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l61_c9_d24e_return_output : unsigned(2 downto 0);

-- header_src_mac_MUX[eth_8_h_l62_c5_5667]
signal header_src_mac_MUX_eth_8_h_l62_c5_5667_cond : unsigned(0 downto 0);
signal header_src_mac_MUX_eth_8_h_l62_c5_5667_iftrue : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l62_c5_5667_iffalse : unsigned(47 downto 0);
signal header_src_mac_MUX_eth_8_h_l62_c5_5667_return_output : unsigned(47 downto 0);

-- counter_MUX[eth_8_h_l62_c5_5667]
signal counter_MUX_eth_8_h_l62_c5_5667_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l62_c5_5667_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l62_c5_5667_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l62_c5_5667_return_output : unsigned(2 downto 0);

-- state_MUX[eth_8_h_l62_c5_5667]
signal state_MUX_eth_8_h_l62_c5_5667_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l62_c5_5667_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l62_c5_5667_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l62_c5_5667_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[eth_8_h_l64_c10_3bbf]
signal BIN_OP_EQ_eth_8_h_l64_c10_3bbf_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l64_c10_3bbf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l64_c10_3bbf_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l64_c7_c33a]
signal counter_MUX_eth_8_h_l64_c7_c33a_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l64_c7_c33a_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l64_c7_c33a_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l64_c7_c33a_return_output : unsigned(2 downto 0);

-- state_MUX[eth_8_h_l64_c7_c33a]
signal state_MUX_eth_8_h_l64_c7_c33a_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l64_c7_c33a_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l64_c7_c33a_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l64_c7_c33a_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l68_c9_7f42]
signal BIN_OP_PLUS_eth_8_h_l68_c9_7f42_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_eth_8_h_l68_c9_7f42_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l68_c9_7f42_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[eth_8_h_l71_c12_b991]
signal BIN_OP_EQ_eth_8_h_l71_c12_b991_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l71_c12_b991_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l71_c12_b991_return_output : unsigned(0 downto 0);

-- header_ethertype_MUX[eth_8_h_l71_c9_599a]
signal header_ethertype_MUX_eth_8_h_l71_c9_599a_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l71_c9_599a_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l71_c9_599a_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l71_c9_599a_return_output : unsigned(15 downto 0);

-- counter_MUX[eth_8_h_l71_c9_599a]
signal counter_MUX_eth_8_h_l71_c9_599a_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l71_c9_599a_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l71_c9_599a_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l71_c9_599a_return_output : unsigned(2 downto 0);

-- o_frame_valid_MUX[eth_8_h_l71_c9_599a]
signal o_frame_valid_MUX_eth_8_h_l71_c9_599a_cond : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l71_c9_599a_iftrue : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l71_c9_599a_iffalse : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l71_c9_599a_return_output : unsigned(0 downto 0);

-- o_frame_data_payload_MUX[eth_8_h_l71_c9_599a]
signal o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_cond : unsigned(0 downto 0);
signal o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_iftrue : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_iffalse : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_return_output : axis8_t;

-- o_overflow_MUX[eth_8_h_l71_c9_599a]
signal o_overflow_MUX_eth_8_h_l71_c9_599a_cond : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l71_c9_599a_iftrue : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l71_c9_599a_iffalse : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l71_c9_599a_return_output : unsigned(0 downto 0);

-- o_frame_data_start_of_payload_MUX[eth_8_h_l71_c9_599a]
signal o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_cond : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_iftrue : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_iffalse : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l71_c9_599a]
signal state_MUX_eth_8_h_l71_c9_599a_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l71_c9_599a_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l71_c9_599a_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l71_c9_599a_return_output : unsigned(2 downto 0);

-- header_ethertype_MUX[eth_8_h_l72_c5_a8e8]
signal header_ethertype_MUX_eth_8_h_l72_c5_a8e8_cond : unsigned(0 downto 0);
signal header_ethertype_MUX_eth_8_h_l72_c5_a8e8_iftrue : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l72_c5_a8e8_iffalse : unsigned(15 downto 0);
signal header_ethertype_MUX_eth_8_h_l72_c5_a8e8_return_output : unsigned(15 downto 0);

-- counter_MUX[eth_8_h_l72_c5_a8e8]
signal counter_MUX_eth_8_h_l72_c5_a8e8_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l72_c5_a8e8_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l72_c5_a8e8_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l72_c5_a8e8_return_output : unsigned(2 downto 0);

-- state_MUX[eth_8_h_l72_c5_a8e8]
signal state_MUX_eth_8_h_l72_c5_a8e8_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l72_c5_a8e8_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l72_c5_a8e8_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l72_c5_a8e8_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[eth_8_h_l74_c10_c903]
signal BIN_OP_EQ_eth_8_h_l74_c10_c903_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l74_c10_c903_right : unsigned(0 downto 0);
signal BIN_OP_EQ_eth_8_h_l74_c10_c903_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l74_c7_d24a]
signal counter_MUX_eth_8_h_l74_c7_d24a_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l74_c7_d24a_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l74_c7_d24a_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l74_c7_d24a_return_output : unsigned(2 downto 0);

-- state_MUX[eth_8_h_l74_c7_d24a]
signal state_MUX_eth_8_h_l74_c7_d24a_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l74_c7_d24a_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l74_c7_d24a_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l74_c7_d24a_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l78_c9_283e]
signal BIN_OP_PLUS_eth_8_h_l78_c9_283e_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_eth_8_h_l78_c9_283e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l78_c9_283e_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[eth_8_h_l83_c11_9324]
signal BIN_OP_EQ_eth_8_h_l83_c11_9324_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l83_c11_9324_right : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l83_c11_9324_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l83_c8_3f60]
signal counter_MUX_eth_8_h_l83_c8_3f60_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l83_c8_3f60_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l83_c8_3f60_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l83_c8_3f60_return_output : unsigned(2 downto 0);

-- o_frame_valid_MUX[eth_8_h_l83_c8_3f60]
signal o_frame_valid_MUX_eth_8_h_l83_c8_3f60_cond : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l83_c8_3f60_iftrue : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l83_c8_3f60_iffalse : unsigned(0 downto 0);
signal o_frame_valid_MUX_eth_8_h_l83_c8_3f60_return_output : unsigned(0 downto 0);

-- o_frame_data_payload_MUX[eth_8_h_l83_c8_3f60]
signal o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_cond : unsigned(0 downto 0);
signal o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_iftrue : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_iffalse : axis8_t;
signal o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_return_output : axis8_t;

-- o_overflow_MUX[eth_8_h_l83_c8_3f60]
signal o_overflow_MUX_eth_8_h_l83_c8_3f60_cond : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l83_c8_3f60_iftrue : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l83_c8_3f60_iffalse : unsigned(0 downto 0);
signal o_overflow_MUX_eth_8_h_l83_c8_3f60_return_output : unsigned(0 downto 0);

-- o_frame_data_start_of_payload_MUX[eth_8_h_l83_c8_3f60]
signal o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_cond : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_iftrue : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_iffalse : unsigned(0 downto 0);
signal o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_return_output : unsigned(0 downto 0);

-- state_MUX[eth_8_h_l83_c8_3f60]
signal state_MUX_eth_8_h_l83_c8_3f60_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l83_c8_3f60_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l83_c8_3f60_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l83_c8_3f60_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[eth_8_h_l86_c37_d324]
signal BIN_OP_EQ_eth_8_h_l86_c37_d324_left : unsigned(2 downto 0);
signal BIN_OP_EQ_eth_8_h_l86_c37_d324_right : unsigned(0 downto 0);
signal BIN_OP_EQ_eth_8_h_l86_c37_d324_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[eth_8_h_l89_c35_8ad5]
signal UNARY_OP_NOT_eth_8_h_l89_c35_8ad5_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_eth_8_h_l89_c35_8ad5_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[eth_8_h_l89_c18_be29]
signal BIN_OP_AND_eth_8_h_l89_c18_be29_left : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l89_c18_be29_right : unsigned(0 downto 0);
signal BIN_OP_AND_eth_8_h_l89_c18_be29_return_output : unsigned(0 downto 0);

-- counter_MUX[eth_8_h_l90_c5_a12c]
signal counter_MUX_eth_8_h_l90_c5_a12c_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l90_c5_a12c_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l90_c5_a12c_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l90_c5_a12c_return_output : unsigned(2 downto 0);

-- state_MUX[eth_8_h_l90_c5_a12c]
signal state_MUX_eth_8_h_l90_c5_a12c_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l90_c5_a12c_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l90_c5_a12c_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l90_c5_a12c_return_output : unsigned(2 downto 0);

-- counter_MUX[eth_8_h_l91_c7_a691]
signal counter_MUX_eth_8_h_l91_c7_a691_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l91_c7_a691_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l91_c7_a691_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l91_c7_a691_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[eth_8_h_l92_c9_1f63]
signal BIN_OP_PLUS_eth_8_h_l92_c9_1f63_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_eth_8_h_l92_c9_1f63_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_eth_8_h_l92_c9_1f63_return_output : unsigned(3 downto 0);

-- counter_MUX[eth_8_h_l94_c7_5306]
signal counter_MUX_eth_8_h_l94_c7_5306_cond : unsigned(0 downto 0);
signal counter_MUX_eth_8_h_l94_c7_5306_iftrue : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l94_c7_5306_iffalse : unsigned(2 downto 0);
signal counter_MUX_eth_8_h_l94_c7_5306_return_output : unsigned(2 downto 0);

-- state_MUX[eth_8_h_l94_c7_5306]
signal state_MUX_eth_8_h_l94_c7_5306_cond : unsigned(0 downto 0);
signal state_MUX_eth_8_h_l94_c7_5306_iftrue : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l94_c7_5306_iffalse : unsigned(2 downto 0);
signal state_MUX_eth_8_h_l94_c7_5306_return_output : unsigned(2 downto 0);

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

function CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_8d08( ref_toks_0 : eth_header_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : axis8_t;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return eth_8_rx_t is
 
  variable base : eth_8_rx_t; 
  variable return_output : eth_8_rx_t;
begin
      base.frame.data.header := ref_toks_0;
      base.frame.valid := ref_toks_1;
      base.frame.data.payload := ref_toks_2;
      base.overflow := ref_toks_3;
      base.frame.data.start_of_payload := ref_toks_4;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_eth_8_h_l51_c6_3ab7 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l51_c6_3ab7 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l51_c6_3ab7_left,
BIN_OP_EQ_eth_8_h_l51_c6_3ab7_right,
BIN_OP_EQ_eth_8_h_l51_c6_3ab7_return_output);

-- header_MUX_eth_8_h_l51_c3_9dc8 : 0 clocks latency
header_MUX_eth_8_h_l51_c3_9dc8 : entity work.MUX_uint1_t_eth_header_t_eth_header_t_0CLK_de264c78 port map (
header_MUX_eth_8_h_l51_c3_9dc8_cond,
header_MUX_eth_8_h_l51_c3_9dc8_iftrue,
header_MUX_eth_8_h_l51_c3_9dc8_iffalse,
header_MUX_eth_8_h_l51_c3_9dc8_return_output);

-- counter_MUX_eth_8_h_l51_c3_9dc8 : 0 clocks latency
counter_MUX_eth_8_h_l51_c3_9dc8 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l51_c3_9dc8_cond,
counter_MUX_eth_8_h_l51_c3_9dc8_iftrue,
counter_MUX_eth_8_h_l51_c3_9dc8_iffalse,
counter_MUX_eth_8_h_l51_c3_9dc8_return_output);

-- o_frame_valid_MUX_eth_8_h_l51_c3_9dc8 : 0 clocks latency
o_frame_valid_MUX_eth_8_h_l51_c3_9dc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_cond,
o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_iftrue,
o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_iffalse,
o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_return_output);

-- o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8 : 0 clocks latency
o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8 : entity work.MUX_uint1_t_axis8_t_axis8_t_0CLK_de264c78 port map (
o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_cond,
o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_iftrue,
o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_iffalse,
o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_return_output);

-- o_overflow_MUX_eth_8_h_l51_c3_9dc8 : 0 clocks latency
o_overflow_MUX_eth_8_h_l51_c3_9dc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_overflow_MUX_eth_8_h_l51_c3_9dc8_cond,
o_overflow_MUX_eth_8_h_l51_c3_9dc8_iftrue,
o_overflow_MUX_eth_8_h_l51_c3_9dc8_iffalse,
o_overflow_MUX_eth_8_h_l51_c3_9dc8_return_output);

-- o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8 : 0 clocks latency
o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_cond,
o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_iftrue,
o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_iffalse,
o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_return_output);

-- state_MUX_eth_8_h_l51_c3_9dc8 : 0 clocks latency
state_MUX_eth_8_h_l51_c3_9dc8 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l51_c3_9dc8_cond,
state_MUX_eth_8_h_l51_c3_9dc8_iftrue,
state_MUX_eth_8_h_l51_c3_9dc8_iffalse,
state_MUX_eth_8_h_l51_c3_9dc8_return_output);

-- header_dst_mac_MUX_eth_8_h_l52_c5_5ea5 : 0 clocks latency
header_dst_mac_MUX_eth_8_h_l52_c5_5ea5 : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_cond,
header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_iftrue,
header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_iffalse,
header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_return_output);

-- counter_MUX_eth_8_h_l52_c5_5ea5 : 0 clocks latency
counter_MUX_eth_8_h_l52_c5_5ea5 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l52_c5_5ea5_cond,
counter_MUX_eth_8_h_l52_c5_5ea5_iftrue,
counter_MUX_eth_8_h_l52_c5_5ea5_iffalse,
counter_MUX_eth_8_h_l52_c5_5ea5_return_output);

-- state_MUX_eth_8_h_l52_c5_5ea5 : 0 clocks latency
state_MUX_eth_8_h_l52_c5_5ea5 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l52_c5_5ea5_cond,
state_MUX_eth_8_h_l52_c5_5ea5_iftrue,
state_MUX_eth_8_h_l52_c5_5ea5_iffalse,
state_MUX_eth_8_h_l52_c5_5ea5_return_output);

-- BIN_OP_EQ_eth_8_h_l54_c10_d6a0 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l54_c10_d6a0 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l54_c10_d6a0_left,
BIN_OP_EQ_eth_8_h_l54_c10_d6a0_right,
BIN_OP_EQ_eth_8_h_l54_c10_d6a0_return_output);

-- counter_MUX_eth_8_h_l54_c7_6adc : 0 clocks latency
counter_MUX_eth_8_h_l54_c7_6adc : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l54_c7_6adc_cond,
counter_MUX_eth_8_h_l54_c7_6adc_iftrue,
counter_MUX_eth_8_h_l54_c7_6adc_iffalse,
counter_MUX_eth_8_h_l54_c7_6adc_return_output);

-- state_MUX_eth_8_h_l54_c7_6adc : 0 clocks latency
state_MUX_eth_8_h_l54_c7_6adc : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l54_c7_6adc_cond,
state_MUX_eth_8_h_l54_c7_6adc_iftrue,
state_MUX_eth_8_h_l54_c7_6adc_iffalse,
state_MUX_eth_8_h_l54_c7_6adc_return_output);

-- BIN_OP_PLUS_eth_8_h_l58_c9_d75a : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l58_c9_d75a : entity work.BIN_OP_PLUS_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l58_c9_d75a_left,
BIN_OP_PLUS_eth_8_h_l58_c9_d75a_right,
BIN_OP_PLUS_eth_8_h_l58_c9_d75a_return_output);

-- BIN_OP_EQ_eth_8_h_l61_c12_529a : 0 clocks latency
BIN_OP_EQ_eth_8_h_l61_c12_529a : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l61_c12_529a_left,
BIN_OP_EQ_eth_8_h_l61_c12_529a_right,
BIN_OP_EQ_eth_8_h_l61_c12_529a_return_output);

-- header_ethertype_MUX_eth_8_h_l61_c9_d24e : 0 clocks latency
header_ethertype_MUX_eth_8_h_l61_c9_d24e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l61_c9_d24e_cond,
header_ethertype_MUX_eth_8_h_l61_c9_d24e_iftrue,
header_ethertype_MUX_eth_8_h_l61_c9_d24e_iffalse,
header_ethertype_MUX_eth_8_h_l61_c9_d24e_return_output);

-- header_src_mac_MUX_eth_8_h_l61_c9_d24e : 0 clocks latency
header_src_mac_MUX_eth_8_h_l61_c9_d24e : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_src_mac_MUX_eth_8_h_l61_c9_d24e_cond,
header_src_mac_MUX_eth_8_h_l61_c9_d24e_iftrue,
header_src_mac_MUX_eth_8_h_l61_c9_d24e_iffalse,
header_src_mac_MUX_eth_8_h_l61_c9_d24e_return_output);

-- counter_MUX_eth_8_h_l61_c9_d24e : 0 clocks latency
counter_MUX_eth_8_h_l61_c9_d24e : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l61_c9_d24e_cond,
counter_MUX_eth_8_h_l61_c9_d24e_iftrue,
counter_MUX_eth_8_h_l61_c9_d24e_iffalse,
counter_MUX_eth_8_h_l61_c9_d24e_return_output);

-- o_frame_valid_MUX_eth_8_h_l61_c9_d24e : 0 clocks latency
o_frame_valid_MUX_eth_8_h_l61_c9_d24e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_valid_MUX_eth_8_h_l61_c9_d24e_cond,
o_frame_valid_MUX_eth_8_h_l61_c9_d24e_iftrue,
o_frame_valid_MUX_eth_8_h_l61_c9_d24e_iffalse,
o_frame_valid_MUX_eth_8_h_l61_c9_d24e_return_output);

-- o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e : 0 clocks latency
o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e : entity work.MUX_uint1_t_axis8_t_axis8_t_0CLK_de264c78 port map (
o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_cond,
o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_iftrue,
o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_iffalse,
o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_return_output);

-- o_overflow_MUX_eth_8_h_l61_c9_d24e : 0 clocks latency
o_overflow_MUX_eth_8_h_l61_c9_d24e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_overflow_MUX_eth_8_h_l61_c9_d24e_cond,
o_overflow_MUX_eth_8_h_l61_c9_d24e_iftrue,
o_overflow_MUX_eth_8_h_l61_c9_d24e_iffalse,
o_overflow_MUX_eth_8_h_l61_c9_d24e_return_output);

-- o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e : 0 clocks latency
o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_cond,
o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_iftrue,
o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_iffalse,
o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_return_output);

-- state_MUX_eth_8_h_l61_c9_d24e : 0 clocks latency
state_MUX_eth_8_h_l61_c9_d24e : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l61_c9_d24e_cond,
state_MUX_eth_8_h_l61_c9_d24e_iftrue,
state_MUX_eth_8_h_l61_c9_d24e_iffalse,
state_MUX_eth_8_h_l61_c9_d24e_return_output);

-- header_src_mac_MUX_eth_8_h_l62_c5_5667 : 0 clocks latency
header_src_mac_MUX_eth_8_h_l62_c5_5667 : entity work.MUX_uint1_t_uint48_t_uint48_t_0CLK_de264c78 port map (
header_src_mac_MUX_eth_8_h_l62_c5_5667_cond,
header_src_mac_MUX_eth_8_h_l62_c5_5667_iftrue,
header_src_mac_MUX_eth_8_h_l62_c5_5667_iffalse,
header_src_mac_MUX_eth_8_h_l62_c5_5667_return_output);

-- counter_MUX_eth_8_h_l62_c5_5667 : 0 clocks latency
counter_MUX_eth_8_h_l62_c5_5667 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l62_c5_5667_cond,
counter_MUX_eth_8_h_l62_c5_5667_iftrue,
counter_MUX_eth_8_h_l62_c5_5667_iffalse,
counter_MUX_eth_8_h_l62_c5_5667_return_output);

-- state_MUX_eth_8_h_l62_c5_5667 : 0 clocks latency
state_MUX_eth_8_h_l62_c5_5667 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l62_c5_5667_cond,
state_MUX_eth_8_h_l62_c5_5667_iftrue,
state_MUX_eth_8_h_l62_c5_5667_iffalse,
state_MUX_eth_8_h_l62_c5_5667_return_output);

-- BIN_OP_EQ_eth_8_h_l64_c10_3bbf : 0 clocks latency
BIN_OP_EQ_eth_8_h_l64_c10_3bbf : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l64_c10_3bbf_left,
BIN_OP_EQ_eth_8_h_l64_c10_3bbf_right,
BIN_OP_EQ_eth_8_h_l64_c10_3bbf_return_output);

-- counter_MUX_eth_8_h_l64_c7_c33a : 0 clocks latency
counter_MUX_eth_8_h_l64_c7_c33a : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l64_c7_c33a_cond,
counter_MUX_eth_8_h_l64_c7_c33a_iftrue,
counter_MUX_eth_8_h_l64_c7_c33a_iffalse,
counter_MUX_eth_8_h_l64_c7_c33a_return_output);

-- state_MUX_eth_8_h_l64_c7_c33a : 0 clocks latency
state_MUX_eth_8_h_l64_c7_c33a : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l64_c7_c33a_cond,
state_MUX_eth_8_h_l64_c7_c33a_iftrue,
state_MUX_eth_8_h_l64_c7_c33a_iffalse,
state_MUX_eth_8_h_l64_c7_c33a_return_output);

-- BIN_OP_PLUS_eth_8_h_l68_c9_7f42 : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l68_c9_7f42 : entity work.BIN_OP_PLUS_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l68_c9_7f42_left,
BIN_OP_PLUS_eth_8_h_l68_c9_7f42_right,
BIN_OP_PLUS_eth_8_h_l68_c9_7f42_return_output);

-- BIN_OP_EQ_eth_8_h_l71_c12_b991 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l71_c12_b991 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l71_c12_b991_left,
BIN_OP_EQ_eth_8_h_l71_c12_b991_right,
BIN_OP_EQ_eth_8_h_l71_c12_b991_return_output);

-- header_ethertype_MUX_eth_8_h_l71_c9_599a : 0 clocks latency
header_ethertype_MUX_eth_8_h_l71_c9_599a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l71_c9_599a_cond,
header_ethertype_MUX_eth_8_h_l71_c9_599a_iftrue,
header_ethertype_MUX_eth_8_h_l71_c9_599a_iffalse,
header_ethertype_MUX_eth_8_h_l71_c9_599a_return_output);

-- counter_MUX_eth_8_h_l71_c9_599a : 0 clocks latency
counter_MUX_eth_8_h_l71_c9_599a : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l71_c9_599a_cond,
counter_MUX_eth_8_h_l71_c9_599a_iftrue,
counter_MUX_eth_8_h_l71_c9_599a_iffalse,
counter_MUX_eth_8_h_l71_c9_599a_return_output);

-- o_frame_valid_MUX_eth_8_h_l71_c9_599a : 0 clocks latency
o_frame_valid_MUX_eth_8_h_l71_c9_599a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_valid_MUX_eth_8_h_l71_c9_599a_cond,
o_frame_valid_MUX_eth_8_h_l71_c9_599a_iftrue,
o_frame_valid_MUX_eth_8_h_l71_c9_599a_iffalse,
o_frame_valid_MUX_eth_8_h_l71_c9_599a_return_output);

-- o_frame_data_payload_MUX_eth_8_h_l71_c9_599a : 0 clocks latency
o_frame_data_payload_MUX_eth_8_h_l71_c9_599a : entity work.MUX_uint1_t_axis8_t_axis8_t_0CLK_de264c78 port map (
o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_cond,
o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_iftrue,
o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_iffalse,
o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_return_output);

-- o_overflow_MUX_eth_8_h_l71_c9_599a : 0 clocks latency
o_overflow_MUX_eth_8_h_l71_c9_599a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_overflow_MUX_eth_8_h_l71_c9_599a_cond,
o_overflow_MUX_eth_8_h_l71_c9_599a_iftrue,
o_overflow_MUX_eth_8_h_l71_c9_599a_iffalse,
o_overflow_MUX_eth_8_h_l71_c9_599a_return_output);

-- o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a : 0 clocks latency
o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_cond,
o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_iftrue,
o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_iffalse,
o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_return_output);

-- state_MUX_eth_8_h_l71_c9_599a : 0 clocks latency
state_MUX_eth_8_h_l71_c9_599a : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l71_c9_599a_cond,
state_MUX_eth_8_h_l71_c9_599a_iftrue,
state_MUX_eth_8_h_l71_c9_599a_iffalse,
state_MUX_eth_8_h_l71_c9_599a_return_output);

-- header_ethertype_MUX_eth_8_h_l72_c5_a8e8 : 0 clocks latency
header_ethertype_MUX_eth_8_h_l72_c5_a8e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
header_ethertype_MUX_eth_8_h_l72_c5_a8e8_cond,
header_ethertype_MUX_eth_8_h_l72_c5_a8e8_iftrue,
header_ethertype_MUX_eth_8_h_l72_c5_a8e8_iffalse,
header_ethertype_MUX_eth_8_h_l72_c5_a8e8_return_output);

-- counter_MUX_eth_8_h_l72_c5_a8e8 : 0 clocks latency
counter_MUX_eth_8_h_l72_c5_a8e8 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l72_c5_a8e8_cond,
counter_MUX_eth_8_h_l72_c5_a8e8_iftrue,
counter_MUX_eth_8_h_l72_c5_a8e8_iffalse,
counter_MUX_eth_8_h_l72_c5_a8e8_return_output);

-- state_MUX_eth_8_h_l72_c5_a8e8 : 0 clocks latency
state_MUX_eth_8_h_l72_c5_a8e8 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l72_c5_a8e8_cond,
state_MUX_eth_8_h_l72_c5_a8e8_iftrue,
state_MUX_eth_8_h_l72_c5_a8e8_iffalse,
state_MUX_eth_8_h_l72_c5_a8e8_return_output);

-- BIN_OP_EQ_eth_8_h_l74_c10_c903 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l74_c10_c903 : entity work.BIN_OP_EQ_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l74_c10_c903_left,
BIN_OP_EQ_eth_8_h_l74_c10_c903_right,
BIN_OP_EQ_eth_8_h_l74_c10_c903_return_output);

-- counter_MUX_eth_8_h_l74_c7_d24a : 0 clocks latency
counter_MUX_eth_8_h_l74_c7_d24a : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l74_c7_d24a_cond,
counter_MUX_eth_8_h_l74_c7_d24a_iftrue,
counter_MUX_eth_8_h_l74_c7_d24a_iffalse,
counter_MUX_eth_8_h_l74_c7_d24a_return_output);

-- state_MUX_eth_8_h_l74_c7_d24a : 0 clocks latency
state_MUX_eth_8_h_l74_c7_d24a : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l74_c7_d24a_cond,
state_MUX_eth_8_h_l74_c7_d24a_iftrue,
state_MUX_eth_8_h_l74_c7_d24a_iffalse,
state_MUX_eth_8_h_l74_c7_d24a_return_output);

-- BIN_OP_PLUS_eth_8_h_l78_c9_283e : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l78_c9_283e : entity work.BIN_OP_PLUS_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l78_c9_283e_left,
BIN_OP_PLUS_eth_8_h_l78_c9_283e_right,
BIN_OP_PLUS_eth_8_h_l78_c9_283e_return_output);

-- BIN_OP_EQ_eth_8_h_l83_c11_9324 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l83_c11_9324 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l83_c11_9324_left,
BIN_OP_EQ_eth_8_h_l83_c11_9324_right,
BIN_OP_EQ_eth_8_h_l83_c11_9324_return_output);

-- counter_MUX_eth_8_h_l83_c8_3f60 : 0 clocks latency
counter_MUX_eth_8_h_l83_c8_3f60 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l83_c8_3f60_cond,
counter_MUX_eth_8_h_l83_c8_3f60_iftrue,
counter_MUX_eth_8_h_l83_c8_3f60_iffalse,
counter_MUX_eth_8_h_l83_c8_3f60_return_output);

-- o_frame_valid_MUX_eth_8_h_l83_c8_3f60 : 0 clocks latency
o_frame_valid_MUX_eth_8_h_l83_c8_3f60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_valid_MUX_eth_8_h_l83_c8_3f60_cond,
o_frame_valid_MUX_eth_8_h_l83_c8_3f60_iftrue,
o_frame_valid_MUX_eth_8_h_l83_c8_3f60_iffalse,
o_frame_valid_MUX_eth_8_h_l83_c8_3f60_return_output);

-- o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60 : 0 clocks latency
o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60 : entity work.MUX_uint1_t_axis8_t_axis8_t_0CLK_de264c78 port map (
o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_cond,
o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_iftrue,
o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_iffalse,
o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_return_output);

-- o_overflow_MUX_eth_8_h_l83_c8_3f60 : 0 clocks latency
o_overflow_MUX_eth_8_h_l83_c8_3f60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_overflow_MUX_eth_8_h_l83_c8_3f60_cond,
o_overflow_MUX_eth_8_h_l83_c8_3f60_iftrue,
o_overflow_MUX_eth_8_h_l83_c8_3f60_iffalse,
o_overflow_MUX_eth_8_h_l83_c8_3f60_return_output);

-- o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60 : 0 clocks latency
o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_cond,
o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_iftrue,
o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_iffalse,
o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_return_output);

-- state_MUX_eth_8_h_l83_c8_3f60 : 0 clocks latency
state_MUX_eth_8_h_l83_c8_3f60 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l83_c8_3f60_cond,
state_MUX_eth_8_h_l83_c8_3f60_iftrue,
state_MUX_eth_8_h_l83_c8_3f60_iffalse,
state_MUX_eth_8_h_l83_c8_3f60_return_output);

-- BIN_OP_EQ_eth_8_h_l86_c37_d324 : 0 clocks latency
BIN_OP_EQ_eth_8_h_l86_c37_d324 : entity work.BIN_OP_EQ_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_eth_8_h_l86_c37_d324_left,
BIN_OP_EQ_eth_8_h_l86_c37_d324_right,
BIN_OP_EQ_eth_8_h_l86_c37_d324_return_output);

-- UNARY_OP_NOT_eth_8_h_l89_c35_8ad5 : 0 clocks latency
UNARY_OP_NOT_eth_8_h_l89_c35_8ad5 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_eth_8_h_l89_c35_8ad5_expr,
UNARY_OP_NOT_eth_8_h_l89_c35_8ad5_return_output);

-- BIN_OP_AND_eth_8_h_l89_c18_be29 : 0 clocks latency
BIN_OP_AND_eth_8_h_l89_c18_be29 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_eth_8_h_l89_c18_be29_left,
BIN_OP_AND_eth_8_h_l89_c18_be29_right,
BIN_OP_AND_eth_8_h_l89_c18_be29_return_output);

-- counter_MUX_eth_8_h_l90_c5_a12c : 0 clocks latency
counter_MUX_eth_8_h_l90_c5_a12c : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l90_c5_a12c_cond,
counter_MUX_eth_8_h_l90_c5_a12c_iftrue,
counter_MUX_eth_8_h_l90_c5_a12c_iffalse,
counter_MUX_eth_8_h_l90_c5_a12c_return_output);

-- state_MUX_eth_8_h_l90_c5_a12c : 0 clocks latency
state_MUX_eth_8_h_l90_c5_a12c : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l90_c5_a12c_cond,
state_MUX_eth_8_h_l90_c5_a12c_iftrue,
state_MUX_eth_8_h_l90_c5_a12c_iffalse,
state_MUX_eth_8_h_l90_c5_a12c_return_output);

-- counter_MUX_eth_8_h_l91_c7_a691 : 0 clocks latency
counter_MUX_eth_8_h_l91_c7_a691 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l91_c7_a691_cond,
counter_MUX_eth_8_h_l91_c7_a691_iftrue,
counter_MUX_eth_8_h_l91_c7_a691_iffalse,
counter_MUX_eth_8_h_l91_c7_a691_return_output);

-- BIN_OP_PLUS_eth_8_h_l92_c9_1f63 : 0 clocks latency
BIN_OP_PLUS_eth_8_h_l92_c9_1f63 : entity work.BIN_OP_PLUS_uint3_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_eth_8_h_l92_c9_1f63_left,
BIN_OP_PLUS_eth_8_h_l92_c9_1f63_right,
BIN_OP_PLUS_eth_8_h_l92_c9_1f63_return_output);

-- counter_MUX_eth_8_h_l94_c7_5306 : 0 clocks latency
counter_MUX_eth_8_h_l94_c7_5306 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
counter_MUX_eth_8_h_l94_c7_5306_cond,
counter_MUX_eth_8_h_l94_c7_5306_iftrue,
counter_MUX_eth_8_h_l94_c7_5306_iffalse,
counter_MUX_eth_8_h_l94_c7_5306_return_output);

-- state_MUX_eth_8_h_l94_c7_5306 : 0 clocks latency
state_MUX_eth_8_h_l94_c7_5306 : entity work.MUX_uint1_t_eth8_state_t_eth8_state_t_0CLK_de264c78 port map (
state_MUX_eth_8_h_l94_c7_5306_cond,
state_MUX_eth_8_h_l94_c7_5306_iftrue,
state_MUX_eth_8_h_l94_c7_5306_iffalse,
state_MUX_eth_8_h_l94_c7_5306_return_output);



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
 BIN_OP_EQ_eth_8_h_l51_c6_3ab7_return_output,
 header_MUX_eth_8_h_l51_c3_9dc8_return_output,
 counter_MUX_eth_8_h_l51_c3_9dc8_return_output,
 o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_return_output,
 o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_return_output,
 o_overflow_MUX_eth_8_h_l51_c3_9dc8_return_output,
 o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_return_output,
 state_MUX_eth_8_h_l51_c3_9dc8_return_output,
 header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_return_output,
 counter_MUX_eth_8_h_l52_c5_5ea5_return_output,
 state_MUX_eth_8_h_l52_c5_5ea5_return_output,
 BIN_OP_EQ_eth_8_h_l54_c10_d6a0_return_output,
 counter_MUX_eth_8_h_l54_c7_6adc_return_output,
 state_MUX_eth_8_h_l54_c7_6adc_return_output,
 BIN_OP_PLUS_eth_8_h_l58_c9_d75a_return_output,
 BIN_OP_EQ_eth_8_h_l61_c12_529a_return_output,
 header_ethertype_MUX_eth_8_h_l61_c9_d24e_return_output,
 header_src_mac_MUX_eth_8_h_l61_c9_d24e_return_output,
 counter_MUX_eth_8_h_l61_c9_d24e_return_output,
 o_frame_valid_MUX_eth_8_h_l61_c9_d24e_return_output,
 o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_return_output,
 o_overflow_MUX_eth_8_h_l61_c9_d24e_return_output,
 o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_return_output,
 state_MUX_eth_8_h_l61_c9_d24e_return_output,
 header_src_mac_MUX_eth_8_h_l62_c5_5667_return_output,
 counter_MUX_eth_8_h_l62_c5_5667_return_output,
 state_MUX_eth_8_h_l62_c5_5667_return_output,
 BIN_OP_EQ_eth_8_h_l64_c10_3bbf_return_output,
 counter_MUX_eth_8_h_l64_c7_c33a_return_output,
 state_MUX_eth_8_h_l64_c7_c33a_return_output,
 BIN_OP_PLUS_eth_8_h_l68_c9_7f42_return_output,
 BIN_OP_EQ_eth_8_h_l71_c12_b991_return_output,
 header_ethertype_MUX_eth_8_h_l71_c9_599a_return_output,
 counter_MUX_eth_8_h_l71_c9_599a_return_output,
 o_frame_valid_MUX_eth_8_h_l71_c9_599a_return_output,
 o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_return_output,
 o_overflow_MUX_eth_8_h_l71_c9_599a_return_output,
 o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_return_output,
 state_MUX_eth_8_h_l71_c9_599a_return_output,
 header_ethertype_MUX_eth_8_h_l72_c5_a8e8_return_output,
 counter_MUX_eth_8_h_l72_c5_a8e8_return_output,
 state_MUX_eth_8_h_l72_c5_a8e8_return_output,
 BIN_OP_EQ_eth_8_h_l74_c10_c903_return_output,
 counter_MUX_eth_8_h_l74_c7_d24a_return_output,
 state_MUX_eth_8_h_l74_c7_d24a_return_output,
 BIN_OP_PLUS_eth_8_h_l78_c9_283e_return_output,
 BIN_OP_EQ_eth_8_h_l83_c11_9324_return_output,
 counter_MUX_eth_8_h_l83_c8_3f60_return_output,
 o_frame_valid_MUX_eth_8_h_l83_c8_3f60_return_output,
 o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_return_output,
 o_overflow_MUX_eth_8_h_l83_c8_3f60_return_output,
 o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_return_output,
 state_MUX_eth_8_h_l83_c8_3f60_return_output,
 BIN_OP_EQ_eth_8_h_l86_c37_d324_return_output,
 UNARY_OP_NOT_eth_8_h_l89_c35_8ad5_return_output,
 BIN_OP_AND_eth_8_h_l89_c18_be29_return_output,
 counter_MUX_eth_8_h_l90_c5_a12c_return_output,
 state_MUX_eth_8_h_l90_c5_a12c_return_output,
 counter_MUX_eth_8_h_l91_c7_a691_return_output,
 BIN_OP_PLUS_eth_8_h_l92_c9_1f63_return_output,
 counter_MUX_eth_8_h_l94_c7_5306_return_output,
 state_MUX_eth_8_h_l94_c7_5306_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eth_8_rx_t;
 variable VAR_mac_axis : axis8_t_stream_t;
 variable VAR_frame_ready : unsigned(0 downto 0);
 variable VAR_o : eth_8_rx_t;
 variable VAR_BIN_OP_EQ_eth_8_h_l51_c6_3ab7_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l51_c6_3ab7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l51_c6_3ab7_return_output : unsigned(0 downto 0);
 variable VAR_header_MUX_eth_8_h_l51_c3_9dc8_iftrue : eth_header_t;
 variable VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l51_c3_9dc8_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l51_c3_9dc8_iffalse : eth_header_t;
 variable VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a_eth_8_h_l51_c3_9dc8_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l51_c3_9dc8_return_output : eth_header_t;
 variable VAR_header_MUX_eth_8_h_l51_c3_9dc8_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l51_c3_9dc8_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l52_c5_5ea5_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l51_c3_9dc8_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l61_c9_d24e_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l51_c3_9dc8_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l51_c3_9dc8_cond : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l61_c9_d24e_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_iftrue : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_iffalse : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_return_output : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_return_output : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_cond : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l51_c3_9dc8_iftrue : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l51_c3_9dc8_iffalse : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l61_c9_d24e_return_output : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l51_c3_9dc8_return_output : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l51_c3_9dc8_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l51_c3_9dc8_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l52_c5_5ea5_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l51_c3_9dc8_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l61_c9_d24e_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l51_c3_9dc8_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l51_c3_9dc8_cond : unsigned(0 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_iftrue : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_iffalse : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_return_output : unsigned(47 downto 0);
 variable VAR_header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l52_c5_5ea5_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l54_c7_6adc_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l52_c5_5ea5_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l52_c5_5ea5_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l52_c5_5ea5_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l54_c7_6adc_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l52_c5_5ea5_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l52_c5_5ea5_cond : unsigned(0 downto 0);
 variable VAR_uint40_uint8_eth_8_h_l53_c24_f871_return_output : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l54_c10_d6a0_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l54_c10_d6a0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l54_c10_d6a0_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l54_c7_6adc_iftrue : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l56_c9_aae8 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l54_c7_6adc_iffalse : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l58_c9_d373 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l54_c7_6adc_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l54_c7_6adc_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l54_c7_6adc_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l54_c7_6adc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l58_c9_d75a_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l58_c9_d75a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l58_c9_d75a_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l61_c12_529a_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l61_c12_529a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l61_c12_529a_return_output : unsigned(0 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l61_c9_d24e_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l61_c9_d24e_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l71_c9_599a_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l61_c9_d24e_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l61_c9_d24e_cond : unsigned(0 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l61_c9_d24e_iftrue : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l62_c5_5667_return_output : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l61_c9_d24e_iffalse : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l61_c9_d24e_return_output : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l61_c9_d24e_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l61_c9_d24e_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l62_c5_5667_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l61_c9_d24e_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l71_c9_599a_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l61_c9_d24e_cond : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l61_c9_d24e_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l61_c9_d24e_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l71_c9_599a_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l61_c9_d24e_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_iftrue : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_iffalse : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_return_output : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_cond : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l61_c9_d24e_iftrue : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l61_c9_d24e_iffalse : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l71_c9_599a_return_output : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l61_c9_d24e_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l61_c9_d24e_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l62_c5_5667_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l61_c9_d24e_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l71_c9_599a_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l61_c9_d24e_cond : unsigned(0 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l62_c5_5667_iftrue : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l62_c5_5667_iffalse : unsigned(47 downto 0);
 variable VAR_header_src_mac_MUX_eth_8_h_l62_c5_5667_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l62_c5_5667_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l64_c7_c33a_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l62_c5_5667_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l62_c5_5667_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l62_c5_5667_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l64_c7_c33a_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l62_c5_5667_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l62_c5_5667_cond : unsigned(0 downto 0);
 variable VAR_uint40_uint8_eth_8_h_l63_c24_1372_return_output : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l64_c10_3bbf_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l64_c10_3bbf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l64_c10_3bbf_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l64_c7_c33a_iftrue : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l66_c9_38b7 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l64_c7_c33a_iffalse : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l68_c9_54c2 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l64_c7_c33a_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l64_c7_c33a_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l64_c7_c33a_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l64_c7_c33a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l68_c9_7f42_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l68_c9_7f42_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l68_c9_7f42_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l71_c12_b991_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l71_c12_b991_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l71_c12_b991_return_output : unsigned(0 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l71_c9_599a_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l72_c5_a8e8_return_output : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l71_c9_599a_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l71_c9_599a_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l71_c9_599a_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l72_c5_a8e8_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l71_c9_599a_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l83_c8_3f60_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l71_c9_599a_cond : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l71_c9_599a_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l71_c9_599a_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l83_c8_3f60_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l71_c9_599a_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_iftrue : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_iffalse : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_return_output : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_cond : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l71_c9_599a_iftrue : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l71_c9_599a_iffalse : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l83_c8_3f60_return_output : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l71_c9_599a_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_return_output : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l71_c9_599a_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l72_c5_a8e8_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l71_c9_599a_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l83_c8_3f60_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l71_c9_599a_cond : unsigned(0 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l72_c5_a8e8_iftrue : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l72_c5_a8e8_iffalse : unsigned(15 downto 0);
 variable VAR_header_ethertype_MUX_eth_8_h_l72_c5_a8e8_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l72_c5_a8e8_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l74_c7_d24a_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l72_c5_a8e8_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l72_c5_a8e8_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l72_c5_a8e8_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l74_c7_d24a_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l72_c5_a8e8_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l72_c5_a8e8_cond : unsigned(0 downto 0);
 variable VAR_uint8_uint8_eth_8_h_l73_c26_64f3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l74_c10_c903_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l74_c10_c903_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l74_c10_c903_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l74_c7_d24a_iftrue : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l76_c9_82b8 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l74_c7_d24a_iffalse : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l78_c9_2bd8 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l74_c7_d24a_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l74_c7_d24a_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l74_c7_d24a_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l74_c7_d24a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l78_c9_283e_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l78_c9_283e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l78_c9_283e_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l83_c11_9324_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l83_c11_9324_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l83_c11_9324_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l83_c8_3f60_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l90_c5_a12c_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l83_c8_3f60_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l83_c8_3f60_cond : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l83_c8_3f60_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l83_c8_3f60_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_valid_MUX_eth_8_h_l83_c8_3f60_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_iftrue : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_iffalse : axis8_t;
 variable VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_cond : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l83_c8_3f60_iftrue : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l83_c8_3f60_iffalse : unsigned(0 downto 0);
 variable VAR_o_overflow_MUX_eth_8_h_l83_c8_3f60_cond : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_iftrue : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_iffalse : unsigned(0 downto 0);
 variable VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l83_c8_3f60_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l90_c5_a12c_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l83_c8_3f60_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l83_c8_3f60_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d_eth_8_h_l85_c28_c5ea_return_output : axis8_t;
 variable VAR_BIN_OP_EQ_eth_8_h_l86_c37_d324_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l86_c37_d324_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_eth_8_h_l86_c37_d324_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l89_c18_be29_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_eth_8_h_l89_c35_8ad5_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_eth_8_h_l89_c35_8ad5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l89_c18_be29_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_eth_8_h_l89_c18_be29_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l90_c5_a12c_iftrue : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l94_c7_5306_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l90_c5_a12c_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l90_c5_a12c_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l90_c5_a12c_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l94_c7_5306_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l90_c5_a12c_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l90_c5_a12c_cond : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l91_c7_a691_iftrue : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l92_c9_c0f5 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l91_c7_a691_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l91_c7_a691_return_output : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l91_c7_a691_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l92_c9_1f63_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l92_c9_1f63_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_eth_8_h_l92_c9_1f63_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7_eth_8_h_l94_c10_e3bf_return_output : unsigned(0 downto 0);
 variable VAR_counter_MUX_eth_8_h_l94_c7_5306_iftrue : unsigned(2 downto 0);
 variable VAR_counter_eth_8_h_l96_c9_c471 : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l94_c7_5306_iffalse : unsigned(2 downto 0);
 variable VAR_counter_MUX_eth_8_h_l94_c7_5306_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_eth_8_h_l94_c7_5306_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l94_c7_5306_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_eth_8_h_l94_c7_5306_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_8d08_eth_8_h_l100_c10_78cd_return_output : eth_8_rx_t;
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l87_l52_l72_l62_DUPLICATE_41de_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l52_l53_DUPLICATE_b770_return_output : unsigned(47 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l63_l73_DUPLICATE_dee5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l61_l71_l51_l83_DUPLICATE_cdca_return_output : axis8_t;
 variable VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l61_l62_l63_DUPLICATE_4276_return_output : unsigned(47 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l71_l61_l73_l72_DUPLICATE_9d1b_return_output : unsigned(15 downto 0);
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
     VAR_counter_eth_8_h_l66_c9_38b7 := resize(to_unsigned(0, 1), 3);
     VAR_counter_MUX_eth_8_h_l64_c7_c33a_iftrue := VAR_counter_eth_8_h_l66_c9_38b7;
     VAR_counter_eth_8_h_l56_c9_aae8 := resize(to_unsigned(0, 1), 3);
     VAR_counter_MUX_eth_8_h_l54_c7_6adc_iftrue := VAR_counter_eth_8_h_l56_c9_aae8;
     VAR_BIN_OP_EQ_eth_8_h_l86_c37_d324_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_eth_8_h_l61_c12_529a_right := unsigned(eth8_state_t_to_slv(SRC_MAC));
     VAR_BIN_OP_EQ_eth_8_h_l74_c10_c903_right := to_unsigned(1, 1);
     VAR_state_MUX_eth_8_h_l74_c7_d24a_iftrue := unsigned(eth8_state_t_to_slv(PAYLOAD));
     VAR_o_frame_valid_MUX_eth_8_h_l83_c8_3f60_iffalse := to_unsigned(0, 1);
     VAR_o_frame_valid_MUX_eth_8_h_l71_c9_599a_iftrue := to_unsigned(0, 1);
     VAR_o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_iftrue := to_unsigned(0, 1);
     VAR_o_frame_valid_MUX_eth_8_h_l61_c9_d24e_iftrue := to_unsigned(0, 1);
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_iffalse := to_unsigned(0, 1);
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_iftrue := to_unsigned(0, 1);
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_iftrue := to_unsigned(0, 1);
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_eth_8_h_l78_c9_283e_right := to_unsigned(1, 1);
     VAR_counter_eth_8_h_l96_c9_c471 := resize(to_unsigned(0, 1), 3);
     VAR_counter_MUX_eth_8_h_l94_c7_5306_iftrue := VAR_counter_eth_8_h_l96_c9_c471;
     VAR_o_overflow_MUX_eth_8_h_l51_c3_9dc8_iftrue := to_unsigned(0, 1);
     VAR_o_overflow_MUX_eth_8_h_l61_c9_d24e_iftrue := to_unsigned(0, 1);
     VAR_o_overflow_MUX_eth_8_h_l71_c9_599a_iftrue := to_unsigned(0, 1);
     VAR_o_overflow_MUX_eth_8_h_l83_c8_3f60_iffalse := to_unsigned(0, 1);
     VAR_state_MUX_eth_8_h_l54_c7_6adc_iftrue := unsigned(eth8_state_t_to_slv(SRC_MAC));
     VAR_BIN_OP_PLUS_eth_8_h_l92_c9_1f63_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_eth_8_h_l71_c12_b991_right := unsigned(eth8_state_t_to_slv(LEN_TYPE));
     VAR_counter_eth_8_h_l76_c9_82b8 := resize(to_unsigned(0, 1), 3);
     VAR_counter_MUX_eth_8_h_l74_c7_d24a_iftrue := VAR_counter_eth_8_h_l76_c9_82b8;
     VAR_state_MUX_eth_8_h_l94_c7_5306_iftrue := unsigned(eth8_state_t_to_slv(IDLE_DST_MAC));
     VAR_BIN_OP_PLUS_eth_8_h_l58_c9_d75a_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_eth_8_h_l51_c6_3ab7_right := unsigned(eth8_state_t_to_slv(IDLE_DST_MAC));
     VAR_BIN_OP_PLUS_eth_8_h_l68_c9_7f42_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_eth_8_h_l54_c10_d6a0_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_eth_8_h_l83_c11_9324_right := unsigned(eth8_state_t_to_slv(PAYLOAD));
     VAR_state_MUX_eth_8_h_l64_c7_c33a_iftrue := unsigned(eth8_state_t_to_slv(LEN_TYPE));
     VAR_BIN_OP_EQ_eth_8_h_l64_c10_3bbf_right := to_unsigned(5, 3);
     -- CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l61_l71_l51_l83_DUPLICATE_cdca LATENCY=0
     VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l61_l71_l51_l83_DUPLICATE_cdca_return_output := eth_8_rx_t_NULL.frame.data.payload;

     -- Submodule level 1
     VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_iftrue := VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l61_l71_l51_l83_DUPLICATE_cdca_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_iftrue := VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l61_l71_l51_l83_DUPLICATE_cdca_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_iffalse := VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l61_l71_l51_l83_DUPLICATE_cdca_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_iftrue := VAR_CONST_REF_RD_axis8_t_eth_8_rx_t_frame_data_payload_d41d_eth_8_h_l61_l71_l51_l83_DUPLICATE_cdca_return_output;

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
     VAR_BIN_OP_EQ_eth_8_h_l54_c10_d6a0_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l64_c10_3bbf_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l74_c10_c903_left := counter;
     VAR_BIN_OP_EQ_eth_8_h_l86_c37_d324_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l58_c9_d75a_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l68_c9_7f42_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l78_c9_283e_left := counter;
     VAR_BIN_OP_PLUS_eth_8_h_l92_c9_1f63_left := counter;
     VAR_counter_MUX_eth_8_h_l52_c5_5ea5_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l62_c5_5667_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l72_c5_a8e8_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l83_c8_3f60_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l90_c5_a12c_iffalse := counter;
     VAR_counter_MUX_eth_8_h_l91_c7_a691_iffalse := counter;
     VAR_UNARY_OP_NOT_eth_8_h_l89_c35_8ad5_expr := VAR_frame_ready;
     VAR_BIN_OP_EQ_eth_8_h_l51_c6_3ab7_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l61_c12_529a_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l71_c12_b991_left := state;
     VAR_BIN_OP_EQ_eth_8_h_l83_c11_9324_left := state;
     VAR_state_MUX_eth_8_h_l52_c5_5ea5_iffalse := state;
     VAR_state_MUX_eth_8_h_l54_c7_6adc_iffalse := state;
     VAR_state_MUX_eth_8_h_l62_c5_5667_iffalse := state;
     VAR_state_MUX_eth_8_h_l64_c7_c33a_iffalse := state;
     VAR_state_MUX_eth_8_h_l72_c5_a8e8_iffalse := state;
     VAR_state_MUX_eth_8_h_l74_c7_d24a_iffalse := state;
     VAR_state_MUX_eth_8_h_l83_c8_3f60_iffalse := state;
     VAR_state_MUX_eth_8_h_l90_c5_a12c_iffalse := state;
     VAR_state_MUX_eth_8_h_l94_c7_5306_iffalse := state;
     -- BIN_OP_EQ[eth_8_h_l61_c12_529a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l61_c12_529a_left <= VAR_BIN_OP_EQ_eth_8_h_l61_c12_529a_left;
     BIN_OP_EQ_eth_8_h_l61_c12_529a_right <= VAR_BIN_OP_EQ_eth_8_h_l61_c12_529a_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l61_c12_529a_return_output := BIN_OP_EQ_eth_8_h_l61_c12_529a_return_output;

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l87_l52_l72_l62_DUPLICATE_41de LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l87_l52_l72_l62_DUPLICATE_41de_return_output := VAR_mac_axis.valid;

     -- BIN_OP_EQ[eth_8_h_l86_c37_d324] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l86_c37_d324_left <= VAR_BIN_OP_EQ_eth_8_h_l86_c37_d324_left;
     BIN_OP_EQ_eth_8_h_l86_c37_d324_right <= VAR_BIN_OP_EQ_eth_8_h_l86_c37_d324_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l86_c37_d324_return_output := BIN_OP_EQ_eth_8_h_l86_c37_d324_return_output;

     -- BIN_OP_EQ[eth_8_h_l51_c6_3ab7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l51_c6_3ab7_left <= VAR_BIN_OP_EQ_eth_8_h_l51_c6_3ab7_left;
     BIN_OP_EQ_eth_8_h_l51_c6_3ab7_right <= VAR_BIN_OP_EQ_eth_8_h_l51_c6_3ab7_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l51_c6_3ab7_return_output := BIN_OP_EQ_eth_8_h_l51_c6_3ab7_return_output;

     -- BIN_OP_EQ[eth_8_h_l64_c10_3bbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l64_c10_3bbf_left <= VAR_BIN_OP_EQ_eth_8_h_l64_c10_3bbf_left;
     BIN_OP_EQ_eth_8_h_l64_c10_3bbf_right <= VAR_BIN_OP_EQ_eth_8_h_l64_c10_3bbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l64_c10_3bbf_return_output := BIN_OP_EQ_eth_8_h_l64_c10_3bbf_return_output;

     -- BIN_OP_PLUS[eth_8_h_l92_c9_1f63] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l92_c9_1f63_left <= VAR_BIN_OP_PLUS_eth_8_h_l92_c9_1f63_left;
     BIN_OP_PLUS_eth_8_h_l92_c9_1f63_right <= VAR_BIN_OP_PLUS_eth_8_h_l92_c9_1f63_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l92_c9_1f63_return_output := BIN_OP_PLUS_eth_8_h_l92_c9_1f63_return_output;

     -- UNARY_OP_NOT[eth_8_h_l89_c35_8ad5] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_eth_8_h_l89_c35_8ad5_expr <= VAR_UNARY_OP_NOT_eth_8_h_l89_c35_8ad5_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_eth_8_h_l89_c35_8ad5_return_output := UNARY_OP_NOT_eth_8_h_l89_c35_8ad5_return_output;

     -- CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l63_l73_DUPLICATE_dee5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l63_l73_DUPLICATE_dee5_return_output := VAR_mac_axis.data.tdata(0);

     -- BIN_OP_EQ[eth_8_h_l71_c12_b991] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l71_c12_b991_left <= VAR_BIN_OP_EQ_eth_8_h_l71_c12_b991_left;
     BIN_OP_EQ_eth_8_h_l71_c12_b991_right <= VAR_BIN_OP_EQ_eth_8_h_l71_c12_b991_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l71_c12_b991_return_output := BIN_OP_EQ_eth_8_h_l71_c12_b991_return_output;

     -- CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d[eth_8_h_l85_c28_c5ea] LATENCY=0
     VAR_CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d_eth_8_h_l85_c28_c5ea_return_output := VAR_mac_axis.data;

     -- BIN_OP_PLUS[eth_8_h_l68_c9_7f42] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l68_c9_7f42_left <= VAR_BIN_OP_PLUS_eth_8_h_l68_c9_7f42_left;
     BIN_OP_PLUS_eth_8_h_l68_c9_7f42_right <= VAR_BIN_OP_PLUS_eth_8_h_l68_c9_7f42_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l68_c9_7f42_return_output := BIN_OP_PLUS_eth_8_h_l68_c9_7f42_return_output;

     -- BIN_OP_EQ[eth_8_h_l54_c10_d6a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l54_c10_d6a0_left <= VAR_BIN_OP_EQ_eth_8_h_l54_c10_d6a0_left;
     BIN_OP_EQ_eth_8_h_l54_c10_d6a0_right <= VAR_BIN_OP_EQ_eth_8_h_l54_c10_d6a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l54_c10_d6a0_return_output := BIN_OP_EQ_eth_8_h_l54_c10_d6a0_return_output;

     -- CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l61_l62_l63_DUPLICATE_4276 LATENCY=0
     VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l61_l62_l63_DUPLICATE_4276_return_output := header.src_mac;

     -- BIN_OP_EQ[eth_8_h_l83_c11_9324] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l83_c11_9324_left <= VAR_BIN_OP_EQ_eth_8_h_l83_c11_9324_left;
     BIN_OP_EQ_eth_8_h_l83_c11_9324_right <= VAR_BIN_OP_EQ_eth_8_h_l83_c11_9324_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l83_c11_9324_return_output := BIN_OP_EQ_eth_8_h_l83_c11_9324_return_output;

     -- BIN_OP_PLUS[eth_8_h_l58_c9_d75a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l58_c9_d75a_left <= VAR_BIN_OP_PLUS_eth_8_h_l58_c9_d75a_left;
     BIN_OP_PLUS_eth_8_h_l58_c9_d75a_right <= VAR_BIN_OP_PLUS_eth_8_h_l58_c9_d75a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l58_c9_d75a_return_output := BIN_OP_PLUS_eth_8_h_l58_c9_d75a_return_output;

     -- CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l71_l61_l73_l72_DUPLICATE_9d1b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l71_l61_l73_l72_DUPLICATE_9d1b_return_output := header.ethertype;

     -- BIN_OP_EQ[eth_8_h_l74_c10_c903] LATENCY=0
     -- Inputs
     BIN_OP_EQ_eth_8_h_l74_c10_c903_left <= VAR_BIN_OP_EQ_eth_8_h_l74_c10_c903_left;
     BIN_OP_EQ_eth_8_h_l74_c10_c903_right <= VAR_BIN_OP_EQ_eth_8_h_l74_c10_c903_right;
     -- Outputs
     VAR_BIN_OP_EQ_eth_8_h_l74_c10_c903_return_output := BIN_OP_EQ_eth_8_h_l74_c10_c903_return_output;

     -- BIN_OP_PLUS[eth_8_h_l78_c9_283e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_eth_8_h_l78_c9_283e_left <= VAR_BIN_OP_PLUS_eth_8_h_l78_c9_283e_left;
     BIN_OP_PLUS_eth_8_h_l78_c9_283e_right <= VAR_BIN_OP_PLUS_eth_8_h_l78_c9_283e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_eth_8_h_l78_c9_283e_return_output := BIN_OP_PLUS_eth_8_h_l78_c9_283e_return_output;

     -- CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l52_l53_DUPLICATE_b770 LATENCY=0
     VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l52_l53_DUPLICATE_b770_return_output := header.dst_mac;

     -- Submodule level 1
     VAR_counter_MUX_eth_8_h_l51_c3_9dc8_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_3ab7_return_output;
     VAR_header_MUX_eth_8_h_l51_c3_9dc8_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_3ab7_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_3ab7_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_3ab7_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_3ab7_return_output;
     VAR_o_overflow_MUX_eth_8_h_l51_c3_9dc8_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_3ab7_return_output;
     VAR_state_MUX_eth_8_h_l51_c3_9dc8_cond := VAR_BIN_OP_EQ_eth_8_h_l51_c6_3ab7_return_output;
     VAR_counter_MUX_eth_8_h_l54_c7_6adc_cond := VAR_BIN_OP_EQ_eth_8_h_l54_c10_d6a0_return_output;
     VAR_state_MUX_eth_8_h_l54_c7_6adc_cond := VAR_BIN_OP_EQ_eth_8_h_l54_c10_d6a0_return_output;
     VAR_counter_MUX_eth_8_h_l61_c9_d24e_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_529a_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l61_c9_d24e_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_529a_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l61_c9_d24e_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_529a_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_529a_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_529a_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l61_c9_d24e_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_529a_return_output;
     VAR_o_overflow_MUX_eth_8_h_l61_c9_d24e_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_529a_return_output;
     VAR_state_MUX_eth_8_h_l61_c9_d24e_cond := VAR_BIN_OP_EQ_eth_8_h_l61_c12_529a_return_output;
     VAR_counter_MUX_eth_8_h_l64_c7_c33a_cond := VAR_BIN_OP_EQ_eth_8_h_l64_c10_3bbf_return_output;
     VAR_state_MUX_eth_8_h_l64_c7_c33a_cond := VAR_BIN_OP_EQ_eth_8_h_l64_c10_3bbf_return_output;
     VAR_counter_MUX_eth_8_h_l71_c9_599a_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_b991_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l71_c9_599a_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_b991_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_b991_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_b991_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l71_c9_599a_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_b991_return_output;
     VAR_o_overflow_MUX_eth_8_h_l71_c9_599a_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_b991_return_output;
     VAR_state_MUX_eth_8_h_l71_c9_599a_cond := VAR_BIN_OP_EQ_eth_8_h_l71_c12_b991_return_output;
     VAR_counter_MUX_eth_8_h_l74_c7_d24a_cond := VAR_BIN_OP_EQ_eth_8_h_l74_c10_c903_return_output;
     VAR_state_MUX_eth_8_h_l74_c7_d24a_cond := VAR_BIN_OP_EQ_eth_8_h_l74_c10_c903_return_output;
     VAR_counter_MUX_eth_8_h_l83_c8_3f60_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_9324_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_9324_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_9324_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l83_c8_3f60_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_9324_return_output;
     VAR_o_overflow_MUX_eth_8_h_l83_c8_3f60_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_9324_return_output;
     VAR_state_MUX_eth_8_h_l83_c8_3f60_cond := VAR_BIN_OP_EQ_eth_8_h_l83_c11_9324_return_output;
     VAR_counter_MUX_eth_8_h_l91_c7_a691_cond := VAR_BIN_OP_EQ_eth_8_h_l86_c37_d324_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_iftrue := VAR_BIN_OP_EQ_eth_8_h_l86_c37_d324_return_output;
     VAR_counter_eth_8_h_l58_c9_d373 := resize(VAR_BIN_OP_PLUS_eth_8_h_l58_c9_d75a_return_output, 3);
     VAR_counter_eth_8_h_l68_c9_54c2 := resize(VAR_BIN_OP_PLUS_eth_8_h_l68_c9_7f42_return_output, 3);
     VAR_counter_eth_8_h_l78_c9_2bd8 := resize(VAR_BIN_OP_PLUS_eth_8_h_l78_c9_283e_return_output, 3);
     VAR_counter_eth_8_h_l92_c9_c0f5 := resize(VAR_BIN_OP_PLUS_eth_8_h_l92_c9_1f63_return_output, 3);
     VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_iftrue := VAR_CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d_eth_8_h_l85_c28_c5ea_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l61_c9_d24e_iftrue := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l71_l61_l73_l72_DUPLICATE_9d1b_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l71_c9_599a_iffalse := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l71_l61_l73_l72_DUPLICATE_9d1b_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l72_c5_a8e8_iffalse := VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l71_l61_l73_l72_DUPLICATE_9d1b_return_output;
     VAR_BIN_OP_AND_eth_8_h_l89_c18_be29_left := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l87_l52_l72_l62_DUPLICATE_41de_return_output;
     VAR_counter_MUX_eth_8_h_l52_c5_5ea5_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l87_l52_l72_l62_DUPLICATE_41de_return_output;
     VAR_counter_MUX_eth_8_h_l62_c5_5667_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l87_l52_l72_l62_DUPLICATE_41de_return_output;
     VAR_counter_MUX_eth_8_h_l72_c5_a8e8_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l87_l52_l72_l62_DUPLICATE_41de_return_output;
     VAR_counter_MUX_eth_8_h_l90_c5_a12c_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l87_l52_l72_l62_DUPLICATE_41de_return_output;
     VAR_header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l87_l52_l72_l62_DUPLICATE_41de_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l72_c5_a8e8_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l87_l52_l72_l62_DUPLICATE_41de_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l62_c5_5667_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l87_l52_l72_l62_DUPLICATE_41de_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l83_c8_3f60_iftrue := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l87_l52_l72_l62_DUPLICATE_41de_return_output;
     VAR_state_MUX_eth_8_h_l52_c5_5ea5_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l87_l52_l72_l62_DUPLICATE_41de_return_output;
     VAR_state_MUX_eth_8_h_l62_c5_5667_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l87_l52_l72_l62_DUPLICATE_41de_return_output;
     VAR_state_MUX_eth_8_h_l72_c5_a8e8_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l87_l52_l72_l62_DUPLICATE_41de_return_output;
     VAR_state_MUX_eth_8_h_l90_c5_a12c_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_eth_8_h_l87_l52_l72_l62_DUPLICATE_41de_return_output;
     VAR_header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l52_l53_DUPLICATE_b770_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l61_c9_d24e_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l61_l62_l63_DUPLICATE_4276_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l62_c5_5667_iffalse := VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l61_l62_l63_DUPLICATE_4276_return_output;
     VAR_BIN_OP_AND_eth_8_h_l89_c18_be29_right := VAR_UNARY_OP_NOT_eth_8_h_l89_c35_8ad5_return_output;
     VAR_counter_MUX_eth_8_h_l54_c7_6adc_iffalse := VAR_counter_eth_8_h_l58_c9_d373;
     VAR_counter_MUX_eth_8_h_l64_c7_c33a_iffalse := VAR_counter_eth_8_h_l68_c9_54c2;
     VAR_counter_MUX_eth_8_h_l74_c7_d24a_iffalse := VAR_counter_eth_8_h_l78_c9_2bd8;
     VAR_counter_MUX_eth_8_h_l91_c7_a691_iftrue := VAR_counter_eth_8_h_l92_c9_c0f5;
     -- counter_MUX[eth_8_h_l91_c7_a691] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l91_c7_a691_cond <= VAR_counter_MUX_eth_8_h_l91_c7_a691_cond;
     counter_MUX_eth_8_h_l91_c7_a691_iftrue <= VAR_counter_MUX_eth_8_h_l91_c7_a691_iftrue;
     counter_MUX_eth_8_h_l91_c7_a691_iffalse <= VAR_counter_MUX_eth_8_h_l91_c7_a691_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l91_c7_a691_return_output := counter_MUX_eth_8_h_l91_c7_a691_return_output;

     -- o_frame_data_start_of_payload_MUX[eth_8_h_l83_c8_3f60] LATENCY=0
     -- Inputs
     o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_cond <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_cond;
     o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_iftrue <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_iftrue;
     o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_iffalse <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_iffalse;
     -- Outputs
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_return_output := o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_return_output;

     -- counter_MUX[eth_8_h_l54_c7_6adc] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l54_c7_6adc_cond <= VAR_counter_MUX_eth_8_h_l54_c7_6adc_cond;
     counter_MUX_eth_8_h_l54_c7_6adc_iftrue <= VAR_counter_MUX_eth_8_h_l54_c7_6adc_iftrue;
     counter_MUX_eth_8_h_l54_c7_6adc_iffalse <= VAR_counter_MUX_eth_8_h_l54_c7_6adc_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l54_c7_6adc_return_output := counter_MUX_eth_8_h_l54_c7_6adc_return_output;

     -- o_frame_data_payload_MUX[eth_8_h_l83_c8_3f60] LATENCY=0
     -- Inputs
     o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_cond <= VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_cond;
     o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_iftrue <= VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_iftrue;
     o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_iffalse <= VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_iffalse;
     -- Outputs
     VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_return_output := o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_return_output;

     -- BIN_OP_AND[eth_8_h_l89_c18_be29] LATENCY=0
     -- Inputs
     BIN_OP_AND_eth_8_h_l89_c18_be29_left <= VAR_BIN_OP_AND_eth_8_h_l89_c18_be29_left;
     BIN_OP_AND_eth_8_h_l89_c18_be29_right <= VAR_BIN_OP_AND_eth_8_h_l89_c18_be29_right;
     -- Outputs
     VAR_BIN_OP_AND_eth_8_h_l89_c18_be29_return_output := BIN_OP_AND_eth_8_h_l89_c18_be29_return_output;

     -- counter_MUX[eth_8_h_l64_c7_c33a] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l64_c7_c33a_cond <= VAR_counter_MUX_eth_8_h_l64_c7_c33a_cond;
     counter_MUX_eth_8_h_l64_c7_c33a_iftrue <= VAR_counter_MUX_eth_8_h_l64_c7_c33a_iftrue;
     counter_MUX_eth_8_h_l64_c7_c33a_iffalse <= VAR_counter_MUX_eth_8_h_l64_c7_c33a_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l64_c7_c33a_return_output := counter_MUX_eth_8_h_l64_c7_c33a_return_output;

     -- state_MUX[eth_8_h_l64_c7_c33a] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l64_c7_c33a_cond <= VAR_state_MUX_eth_8_h_l64_c7_c33a_cond;
     state_MUX_eth_8_h_l64_c7_c33a_iftrue <= VAR_state_MUX_eth_8_h_l64_c7_c33a_iftrue;
     state_MUX_eth_8_h_l64_c7_c33a_iffalse <= VAR_state_MUX_eth_8_h_l64_c7_c33a_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l64_c7_c33a_return_output := state_MUX_eth_8_h_l64_c7_c33a_return_output;

     -- uint8_uint8[eth_8_h_l73_c26_64f3] LATENCY=0
     VAR_uint8_uint8_eth_8_h_l73_c26_64f3_return_output := uint8_uint8(
     resize(VAR_CONST_REF_RD_uint16_t_eth_header_t_ethertype_d41d_eth_8_h_l71_l61_l73_l72_DUPLICATE_9d1b_return_output, 8),
     VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l63_l73_DUPLICATE_dee5_return_output);

     -- counter_MUX[eth_8_h_l74_c7_d24a] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l74_c7_d24a_cond <= VAR_counter_MUX_eth_8_h_l74_c7_d24a_cond;
     counter_MUX_eth_8_h_l74_c7_d24a_iftrue <= VAR_counter_MUX_eth_8_h_l74_c7_d24a_iftrue;
     counter_MUX_eth_8_h_l74_c7_d24a_iffalse <= VAR_counter_MUX_eth_8_h_l74_c7_d24a_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l74_c7_d24a_return_output := counter_MUX_eth_8_h_l74_c7_d24a_return_output;

     -- o_frame_valid_MUX[eth_8_h_l83_c8_3f60] LATENCY=0
     -- Inputs
     o_frame_valid_MUX_eth_8_h_l83_c8_3f60_cond <= VAR_o_frame_valid_MUX_eth_8_h_l83_c8_3f60_cond;
     o_frame_valid_MUX_eth_8_h_l83_c8_3f60_iftrue <= VAR_o_frame_valid_MUX_eth_8_h_l83_c8_3f60_iftrue;
     o_frame_valid_MUX_eth_8_h_l83_c8_3f60_iffalse <= VAR_o_frame_valid_MUX_eth_8_h_l83_c8_3f60_iffalse;
     -- Outputs
     VAR_o_frame_valid_MUX_eth_8_h_l83_c8_3f60_return_output := o_frame_valid_MUX_eth_8_h_l83_c8_3f60_return_output;

     -- uint40_uint8[eth_8_h_l53_c24_f871] LATENCY=0
     VAR_uint40_uint8_eth_8_h_l53_c24_f871_return_output := uint40_uint8(
     resize(VAR_CONST_REF_RD_uint48_t_eth_header_t_dst_mac_d41d_eth_8_h_l52_l53_DUPLICATE_b770_return_output, 40),
     VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l63_l73_DUPLICATE_dee5_return_output);

     -- state_MUX[eth_8_h_l54_c7_6adc] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l54_c7_6adc_cond <= VAR_state_MUX_eth_8_h_l54_c7_6adc_cond;
     state_MUX_eth_8_h_l54_c7_6adc_iftrue <= VAR_state_MUX_eth_8_h_l54_c7_6adc_iftrue;
     state_MUX_eth_8_h_l54_c7_6adc_iffalse <= VAR_state_MUX_eth_8_h_l54_c7_6adc_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l54_c7_6adc_return_output := state_MUX_eth_8_h_l54_c7_6adc_return_output;

     -- state_MUX[eth_8_h_l74_c7_d24a] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l74_c7_d24a_cond <= VAR_state_MUX_eth_8_h_l74_c7_d24a_cond;
     state_MUX_eth_8_h_l74_c7_d24a_iftrue <= VAR_state_MUX_eth_8_h_l74_c7_d24a_iftrue;
     state_MUX_eth_8_h_l74_c7_d24a_iffalse <= VAR_state_MUX_eth_8_h_l74_c7_d24a_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l74_c7_d24a_return_output := state_MUX_eth_8_h_l74_c7_d24a_return_output;

     -- uint40_uint8[eth_8_h_l63_c24_1372] LATENCY=0
     VAR_uint40_uint8_eth_8_h_l63_c24_1372_return_output := uint40_uint8(
     resize(VAR_CONST_REF_RD_uint48_t_eth_header_t_src_mac_d41d_eth_8_h_l61_l62_l63_DUPLICATE_4276_return_output, 40),
     VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_eth_8_h_l53_l63_l73_DUPLICATE_dee5_return_output);

     -- CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7[eth_8_h_l94_c10_e3bf] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7_eth_8_h_l94_c10_e3bf_return_output := CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7(
     VAR_CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d_eth_8_h_l85_c28_c5ea_return_output);

     -- Submodule level 2
     VAR_o_overflow_MUX_eth_8_h_l83_c8_3f60_iftrue := VAR_BIN_OP_AND_eth_8_h_l89_c18_be29_return_output;
     VAR_counter_MUX_eth_8_h_l94_c7_5306_cond := VAR_CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7_eth_8_h_l94_c10_e3bf_return_output;
     VAR_state_MUX_eth_8_h_l94_c7_5306_cond := VAR_CONST_REF_RD_uint1_t_eth_8_rx_t_frame_data_payload_tlast_30a7_eth_8_h_l94_c10_e3bf_return_output;
     VAR_counter_MUX_eth_8_h_l52_c5_5ea5_iftrue := VAR_counter_MUX_eth_8_h_l54_c7_6adc_return_output;
     VAR_counter_MUX_eth_8_h_l62_c5_5667_iftrue := VAR_counter_MUX_eth_8_h_l64_c7_c33a_return_output;
     VAR_counter_MUX_eth_8_h_l72_c5_a8e8_iftrue := VAR_counter_MUX_eth_8_h_l74_c7_d24a_return_output;
     VAR_counter_MUX_eth_8_h_l94_c7_5306_iffalse := VAR_counter_MUX_eth_8_h_l91_c7_a691_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_iffalse := VAR_o_frame_data_payload_MUX_eth_8_h_l83_c8_3f60_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_iffalse := VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l83_c8_3f60_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l71_c9_599a_iffalse := VAR_o_frame_valid_MUX_eth_8_h_l83_c8_3f60_return_output;
     VAR_state_MUX_eth_8_h_l52_c5_5ea5_iftrue := VAR_state_MUX_eth_8_h_l54_c7_6adc_return_output;
     VAR_state_MUX_eth_8_h_l62_c5_5667_iftrue := VAR_state_MUX_eth_8_h_l64_c7_c33a_return_output;
     VAR_state_MUX_eth_8_h_l72_c5_a8e8_iftrue := VAR_state_MUX_eth_8_h_l74_c7_d24a_return_output;
     VAR_header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_iftrue := VAR_uint40_uint8_eth_8_h_l53_c24_f871_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l62_c5_5667_iftrue := VAR_uint40_uint8_eth_8_h_l63_c24_1372_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l72_c5_a8e8_iftrue := VAR_uint8_uint8_eth_8_h_l73_c26_64f3_return_output;
     -- o_overflow_MUX[eth_8_h_l83_c8_3f60] LATENCY=0
     -- Inputs
     o_overflow_MUX_eth_8_h_l83_c8_3f60_cond <= VAR_o_overflow_MUX_eth_8_h_l83_c8_3f60_cond;
     o_overflow_MUX_eth_8_h_l83_c8_3f60_iftrue <= VAR_o_overflow_MUX_eth_8_h_l83_c8_3f60_iftrue;
     o_overflow_MUX_eth_8_h_l83_c8_3f60_iffalse <= VAR_o_overflow_MUX_eth_8_h_l83_c8_3f60_iffalse;
     -- Outputs
     VAR_o_overflow_MUX_eth_8_h_l83_c8_3f60_return_output := o_overflow_MUX_eth_8_h_l83_c8_3f60_return_output;

     -- header_dst_mac_MUX[eth_8_h_l52_c5_5ea5] LATENCY=0
     -- Inputs
     header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_cond <= VAR_header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_cond;
     header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_iftrue <= VAR_header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_iftrue;
     header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_iffalse <= VAR_header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_iffalse;
     -- Outputs
     VAR_header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_return_output := header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_return_output;

     -- counter_MUX[eth_8_h_l94_c7_5306] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l94_c7_5306_cond <= VAR_counter_MUX_eth_8_h_l94_c7_5306_cond;
     counter_MUX_eth_8_h_l94_c7_5306_iftrue <= VAR_counter_MUX_eth_8_h_l94_c7_5306_iftrue;
     counter_MUX_eth_8_h_l94_c7_5306_iffalse <= VAR_counter_MUX_eth_8_h_l94_c7_5306_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l94_c7_5306_return_output := counter_MUX_eth_8_h_l94_c7_5306_return_output;

     -- state_MUX[eth_8_h_l52_c5_5ea5] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l52_c5_5ea5_cond <= VAR_state_MUX_eth_8_h_l52_c5_5ea5_cond;
     state_MUX_eth_8_h_l52_c5_5ea5_iftrue <= VAR_state_MUX_eth_8_h_l52_c5_5ea5_iftrue;
     state_MUX_eth_8_h_l52_c5_5ea5_iffalse <= VAR_state_MUX_eth_8_h_l52_c5_5ea5_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l52_c5_5ea5_return_output := state_MUX_eth_8_h_l52_c5_5ea5_return_output;

     -- o_frame_valid_MUX[eth_8_h_l71_c9_599a] LATENCY=0
     -- Inputs
     o_frame_valid_MUX_eth_8_h_l71_c9_599a_cond <= VAR_o_frame_valid_MUX_eth_8_h_l71_c9_599a_cond;
     o_frame_valid_MUX_eth_8_h_l71_c9_599a_iftrue <= VAR_o_frame_valid_MUX_eth_8_h_l71_c9_599a_iftrue;
     o_frame_valid_MUX_eth_8_h_l71_c9_599a_iffalse <= VAR_o_frame_valid_MUX_eth_8_h_l71_c9_599a_iffalse;
     -- Outputs
     VAR_o_frame_valid_MUX_eth_8_h_l71_c9_599a_return_output := o_frame_valid_MUX_eth_8_h_l71_c9_599a_return_output;

     -- state_MUX[eth_8_h_l62_c5_5667] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l62_c5_5667_cond <= VAR_state_MUX_eth_8_h_l62_c5_5667_cond;
     state_MUX_eth_8_h_l62_c5_5667_iftrue <= VAR_state_MUX_eth_8_h_l62_c5_5667_iftrue;
     state_MUX_eth_8_h_l62_c5_5667_iffalse <= VAR_state_MUX_eth_8_h_l62_c5_5667_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l62_c5_5667_return_output := state_MUX_eth_8_h_l62_c5_5667_return_output;

     -- header_src_mac_MUX[eth_8_h_l62_c5_5667] LATENCY=0
     -- Inputs
     header_src_mac_MUX_eth_8_h_l62_c5_5667_cond <= VAR_header_src_mac_MUX_eth_8_h_l62_c5_5667_cond;
     header_src_mac_MUX_eth_8_h_l62_c5_5667_iftrue <= VAR_header_src_mac_MUX_eth_8_h_l62_c5_5667_iftrue;
     header_src_mac_MUX_eth_8_h_l62_c5_5667_iffalse <= VAR_header_src_mac_MUX_eth_8_h_l62_c5_5667_iffalse;
     -- Outputs
     VAR_header_src_mac_MUX_eth_8_h_l62_c5_5667_return_output := header_src_mac_MUX_eth_8_h_l62_c5_5667_return_output;

     -- state_MUX[eth_8_h_l72_c5_a8e8] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l72_c5_a8e8_cond <= VAR_state_MUX_eth_8_h_l72_c5_a8e8_cond;
     state_MUX_eth_8_h_l72_c5_a8e8_iftrue <= VAR_state_MUX_eth_8_h_l72_c5_a8e8_iftrue;
     state_MUX_eth_8_h_l72_c5_a8e8_iffalse <= VAR_state_MUX_eth_8_h_l72_c5_a8e8_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l72_c5_a8e8_return_output := state_MUX_eth_8_h_l72_c5_a8e8_return_output;

     -- counter_MUX[eth_8_h_l52_c5_5ea5] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l52_c5_5ea5_cond <= VAR_counter_MUX_eth_8_h_l52_c5_5ea5_cond;
     counter_MUX_eth_8_h_l52_c5_5ea5_iftrue <= VAR_counter_MUX_eth_8_h_l52_c5_5ea5_iftrue;
     counter_MUX_eth_8_h_l52_c5_5ea5_iffalse <= VAR_counter_MUX_eth_8_h_l52_c5_5ea5_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l52_c5_5ea5_return_output := counter_MUX_eth_8_h_l52_c5_5ea5_return_output;

     -- o_frame_data_payload_MUX[eth_8_h_l71_c9_599a] LATENCY=0
     -- Inputs
     o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_cond <= VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_cond;
     o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_iftrue <= VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_iftrue;
     o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_iffalse <= VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_iffalse;
     -- Outputs
     VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_return_output := o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_return_output;

     -- state_MUX[eth_8_h_l94_c7_5306] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l94_c7_5306_cond <= VAR_state_MUX_eth_8_h_l94_c7_5306_cond;
     state_MUX_eth_8_h_l94_c7_5306_iftrue <= VAR_state_MUX_eth_8_h_l94_c7_5306_iftrue;
     state_MUX_eth_8_h_l94_c7_5306_iffalse <= VAR_state_MUX_eth_8_h_l94_c7_5306_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l94_c7_5306_return_output := state_MUX_eth_8_h_l94_c7_5306_return_output;

     -- counter_MUX[eth_8_h_l62_c5_5667] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l62_c5_5667_cond <= VAR_counter_MUX_eth_8_h_l62_c5_5667_cond;
     counter_MUX_eth_8_h_l62_c5_5667_iftrue <= VAR_counter_MUX_eth_8_h_l62_c5_5667_iftrue;
     counter_MUX_eth_8_h_l62_c5_5667_iffalse <= VAR_counter_MUX_eth_8_h_l62_c5_5667_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l62_c5_5667_return_output := counter_MUX_eth_8_h_l62_c5_5667_return_output;

     -- counter_MUX[eth_8_h_l72_c5_a8e8] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l72_c5_a8e8_cond <= VAR_counter_MUX_eth_8_h_l72_c5_a8e8_cond;
     counter_MUX_eth_8_h_l72_c5_a8e8_iftrue <= VAR_counter_MUX_eth_8_h_l72_c5_a8e8_iftrue;
     counter_MUX_eth_8_h_l72_c5_a8e8_iffalse <= VAR_counter_MUX_eth_8_h_l72_c5_a8e8_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l72_c5_a8e8_return_output := counter_MUX_eth_8_h_l72_c5_a8e8_return_output;

     -- o_frame_data_start_of_payload_MUX[eth_8_h_l71_c9_599a] LATENCY=0
     -- Inputs
     o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_cond <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_cond;
     o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_iftrue <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_iftrue;
     o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_iffalse <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_iffalse;
     -- Outputs
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_return_output := o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_return_output;

     -- header_ethertype_MUX[eth_8_h_l72_c5_a8e8] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l72_c5_a8e8_cond <= VAR_header_ethertype_MUX_eth_8_h_l72_c5_a8e8_cond;
     header_ethertype_MUX_eth_8_h_l72_c5_a8e8_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l72_c5_a8e8_iftrue;
     header_ethertype_MUX_eth_8_h_l72_c5_a8e8_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l72_c5_a8e8_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l72_c5_a8e8_return_output := header_ethertype_MUX_eth_8_h_l72_c5_a8e8_return_output;

     -- Submodule level 3
     VAR_counter_MUX_eth_8_h_l51_c3_9dc8_iftrue := VAR_counter_MUX_eth_8_h_l52_c5_5ea5_return_output;
     VAR_counter_MUX_eth_8_h_l61_c9_d24e_iftrue := VAR_counter_MUX_eth_8_h_l62_c5_5667_return_output;
     VAR_counter_MUX_eth_8_h_l71_c9_599a_iftrue := VAR_counter_MUX_eth_8_h_l72_c5_a8e8_return_output;
     VAR_counter_MUX_eth_8_h_l90_c5_a12c_iftrue := VAR_counter_MUX_eth_8_h_l94_c7_5306_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l71_c9_599a_iftrue := VAR_header_ethertype_MUX_eth_8_h_l72_c5_a8e8_return_output;
     VAR_header_src_mac_MUX_eth_8_h_l61_c9_d24e_iftrue := VAR_header_src_mac_MUX_eth_8_h_l62_c5_5667_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_iffalse := VAR_o_frame_data_payload_MUX_eth_8_h_l71_c9_599a_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_iffalse := VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l71_c9_599a_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l61_c9_d24e_iffalse := VAR_o_frame_valid_MUX_eth_8_h_l71_c9_599a_return_output;
     VAR_o_overflow_MUX_eth_8_h_l71_c9_599a_iffalse := VAR_o_overflow_MUX_eth_8_h_l83_c8_3f60_return_output;
     VAR_state_MUX_eth_8_h_l51_c3_9dc8_iftrue := VAR_state_MUX_eth_8_h_l52_c5_5ea5_return_output;
     VAR_state_MUX_eth_8_h_l61_c9_d24e_iftrue := VAR_state_MUX_eth_8_h_l62_c5_5667_return_output;
     VAR_state_MUX_eth_8_h_l71_c9_599a_iftrue := VAR_state_MUX_eth_8_h_l72_c5_a8e8_return_output;
     VAR_state_MUX_eth_8_h_l90_c5_a12c_iftrue := VAR_state_MUX_eth_8_h_l94_c7_5306_return_output;
     -- header_src_mac_MUX[eth_8_h_l61_c9_d24e] LATENCY=0
     -- Inputs
     header_src_mac_MUX_eth_8_h_l61_c9_d24e_cond <= VAR_header_src_mac_MUX_eth_8_h_l61_c9_d24e_cond;
     header_src_mac_MUX_eth_8_h_l61_c9_d24e_iftrue <= VAR_header_src_mac_MUX_eth_8_h_l61_c9_d24e_iftrue;
     header_src_mac_MUX_eth_8_h_l61_c9_d24e_iffalse <= VAR_header_src_mac_MUX_eth_8_h_l61_c9_d24e_iffalse;
     -- Outputs
     VAR_header_src_mac_MUX_eth_8_h_l61_c9_d24e_return_output := header_src_mac_MUX_eth_8_h_l61_c9_d24e_return_output;

     -- header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484[eth_8_h_l51_c3_9dc8] LATENCY=0
     VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l51_c3_9dc8_return_output := CONST_REF_RD_eth_header_t_eth_header_t_e484(
     header,
     VAR_header_dst_mac_MUX_eth_8_h_l52_c5_5ea5_return_output);

     -- o_frame_data_start_of_payload_MUX[eth_8_h_l61_c9_d24e] LATENCY=0
     -- Inputs
     o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_cond <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_cond;
     o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_iftrue <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_iftrue;
     o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_iffalse <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_iffalse;
     -- Outputs
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_return_output := o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_return_output;

     -- state_MUX[eth_8_h_l90_c5_a12c] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l90_c5_a12c_cond <= VAR_state_MUX_eth_8_h_l90_c5_a12c_cond;
     state_MUX_eth_8_h_l90_c5_a12c_iftrue <= VAR_state_MUX_eth_8_h_l90_c5_a12c_iftrue;
     state_MUX_eth_8_h_l90_c5_a12c_iffalse <= VAR_state_MUX_eth_8_h_l90_c5_a12c_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l90_c5_a12c_return_output := state_MUX_eth_8_h_l90_c5_a12c_return_output;

     -- counter_MUX[eth_8_h_l90_c5_a12c] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l90_c5_a12c_cond <= VAR_counter_MUX_eth_8_h_l90_c5_a12c_cond;
     counter_MUX_eth_8_h_l90_c5_a12c_iftrue <= VAR_counter_MUX_eth_8_h_l90_c5_a12c_iftrue;
     counter_MUX_eth_8_h_l90_c5_a12c_iffalse <= VAR_counter_MUX_eth_8_h_l90_c5_a12c_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l90_c5_a12c_return_output := counter_MUX_eth_8_h_l90_c5_a12c_return_output;

     -- header_ethertype_MUX[eth_8_h_l71_c9_599a] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l71_c9_599a_cond <= VAR_header_ethertype_MUX_eth_8_h_l71_c9_599a_cond;
     header_ethertype_MUX_eth_8_h_l71_c9_599a_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l71_c9_599a_iftrue;
     header_ethertype_MUX_eth_8_h_l71_c9_599a_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l71_c9_599a_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l71_c9_599a_return_output := header_ethertype_MUX_eth_8_h_l71_c9_599a_return_output;

     -- o_overflow_MUX[eth_8_h_l71_c9_599a] LATENCY=0
     -- Inputs
     o_overflow_MUX_eth_8_h_l71_c9_599a_cond <= VAR_o_overflow_MUX_eth_8_h_l71_c9_599a_cond;
     o_overflow_MUX_eth_8_h_l71_c9_599a_iftrue <= VAR_o_overflow_MUX_eth_8_h_l71_c9_599a_iftrue;
     o_overflow_MUX_eth_8_h_l71_c9_599a_iffalse <= VAR_o_overflow_MUX_eth_8_h_l71_c9_599a_iffalse;
     -- Outputs
     VAR_o_overflow_MUX_eth_8_h_l71_c9_599a_return_output := o_overflow_MUX_eth_8_h_l71_c9_599a_return_output;

     -- o_frame_valid_MUX[eth_8_h_l61_c9_d24e] LATENCY=0
     -- Inputs
     o_frame_valid_MUX_eth_8_h_l61_c9_d24e_cond <= VAR_o_frame_valid_MUX_eth_8_h_l61_c9_d24e_cond;
     o_frame_valid_MUX_eth_8_h_l61_c9_d24e_iftrue <= VAR_o_frame_valid_MUX_eth_8_h_l61_c9_d24e_iftrue;
     o_frame_valid_MUX_eth_8_h_l61_c9_d24e_iffalse <= VAR_o_frame_valid_MUX_eth_8_h_l61_c9_d24e_iffalse;
     -- Outputs
     VAR_o_frame_valid_MUX_eth_8_h_l61_c9_d24e_return_output := o_frame_valid_MUX_eth_8_h_l61_c9_d24e_return_output;

     -- o_frame_data_payload_MUX[eth_8_h_l61_c9_d24e] LATENCY=0
     -- Inputs
     o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_cond <= VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_cond;
     o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_iftrue <= VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_iftrue;
     o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_iffalse <= VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_iffalse;
     -- Outputs
     VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_return_output := o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_return_output;

     -- Submodule level 4
     VAR_counter_MUX_eth_8_h_l83_c8_3f60_iftrue := VAR_counter_MUX_eth_8_h_l90_c5_a12c_return_output;
     VAR_header_MUX_eth_8_h_l51_c3_9dc8_iftrue := VAR_header_TRUE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_e484_eth_8_h_l51_c3_9dc8_return_output;
     VAR_header_ethertype_MUX_eth_8_h_l61_c9_d24e_iffalse := VAR_header_ethertype_MUX_eth_8_h_l71_c9_599a_return_output;
     VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_iffalse := VAR_o_frame_data_payload_MUX_eth_8_h_l61_c9_d24e_return_output;
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_iffalse := VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l61_c9_d24e_return_output;
     VAR_o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_iffalse := VAR_o_frame_valid_MUX_eth_8_h_l61_c9_d24e_return_output;
     VAR_o_overflow_MUX_eth_8_h_l61_c9_d24e_iffalse := VAR_o_overflow_MUX_eth_8_h_l71_c9_599a_return_output;
     VAR_state_MUX_eth_8_h_l83_c8_3f60_iftrue := VAR_state_MUX_eth_8_h_l90_c5_a12c_return_output;
     -- header_ethertype_MUX[eth_8_h_l61_c9_d24e] LATENCY=0
     -- Inputs
     header_ethertype_MUX_eth_8_h_l61_c9_d24e_cond <= VAR_header_ethertype_MUX_eth_8_h_l61_c9_d24e_cond;
     header_ethertype_MUX_eth_8_h_l61_c9_d24e_iftrue <= VAR_header_ethertype_MUX_eth_8_h_l61_c9_d24e_iftrue;
     header_ethertype_MUX_eth_8_h_l61_c9_d24e_iffalse <= VAR_header_ethertype_MUX_eth_8_h_l61_c9_d24e_iffalse;
     -- Outputs
     VAR_header_ethertype_MUX_eth_8_h_l61_c9_d24e_return_output := header_ethertype_MUX_eth_8_h_l61_c9_d24e_return_output;

     -- counter_MUX[eth_8_h_l83_c8_3f60] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l83_c8_3f60_cond <= VAR_counter_MUX_eth_8_h_l83_c8_3f60_cond;
     counter_MUX_eth_8_h_l83_c8_3f60_iftrue <= VAR_counter_MUX_eth_8_h_l83_c8_3f60_iftrue;
     counter_MUX_eth_8_h_l83_c8_3f60_iffalse <= VAR_counter_MUX_eth_8_h_l83_c8_3f60_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l83_c8_3f60_return_output := counter_MUX_eth_8_h_l83_c8_3f60_return_output;

     -- o_frame_data_start_of_payload_MUX[eth_8_h_l51_c3_9dc8] LATENCY=0
     -- Inputs
     o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_cond <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_cond;
     o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_iftrue <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_iftrue;
     o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_iffalse <= VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_iffalse;
     -- Outputs
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_return_output := o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_return_output;

     -- o_overflow_MUX[eth_8_h_l61_c9_d24e] LATENCY=0
     -- Inputs
     o_overflow_MUX_eth_8_h_l61_c9_d24e_cond <= VAR_o_overflow_MUX_eth_8_h_l61_c9_d24e_cond;
     o_overflow_MUX_eth_8_h_l61_c9_d24e_iftrue <= VAR_o_overflow_MUX_eth_8_h_l61_c9_d24e_iftrue;
     o_overflow_MUX_eth_8_h_l61_c9_d24e_iffalse <= VAR_o_overflow_MUX_eth_8_h_l61_c9_d24e_iffalse;
     -- Outputs
     VAR_o_overflow_MUX_eth_8_h_l61_c9_d24e_return_output := o_overflow_MUX_eth_8_h_l61_c9_d24e_return_output;

     -- o_frame_data_payload_MUX[eth_8_h_l51_c3_9dc8] LATENCY=0
     -- Inputs
     o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_cond <= VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_cond;
     o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_iftrue <= VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_iftrue;
     o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_iffalse <= VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_iffalse;
     -- Outputs
     VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_return_output := o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_return_output;

     -- o_frame_valid_MUX[eth_8_h_l51_c3_9dc8] LATENCY=0
     -- Inputs
     o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_cond <= VAR_o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_cond;
     o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_iftrue <= VAR_o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_iftrue;
     o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_iffalse <= VAR_o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_iffalse;
     -- Outputs
     VAR_o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_return_output := o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_return_output;

     -- state_MUX[eth_8_h_l83_c8_3f60] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l83_c8_3f60_cond <= VAR_state_MUX_eth_8_h_l83_c8_3f60_cond;
     state_MUX_eth_8_h_l83_c8_3f60_iftrue <= VAR_state_MUX_eth_8_h_l83_c8_3f60_iftrue;
     state_MUX_eth_8_h_l83_c8_3f60_iffalse <= VAR_state_MUX_eth_8_h_l83_c8_3f60_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l83_c8_3f60_return_output := state_MUX_eth_8_h_l83_c8_3f60_return_output;

     -- Submodule level 5
     VAR_counter_MUX_eth_8_h_l71_c9_599a_iffalse := VAR_counter_MUX_eth_8_h_l83_c8_3f60_return_output;
     VAR_o_overflow_MUX_eth_8_h_l51_c3_9dc8_iffalse := VAR_o_overflow_MUX_eth_8_h_l61_c9_d24e_return_output;
     VAR_state_MUX_eth_8_h_l71_c9_599a_iffalse := VAR_state_MUX_eth_8_h_l83_c8_3f60_return_output;
     -- state_MUX[eth_8_h_l71_c9_599a] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l71_c9_599a_cond <= VAR_state_MUX_eth_8_h_l71_c9_599a_cond;
     state_MUX_eth_8_h_l71_c9_599a_iftrue <= VAR_state_MUX_eth_8_h_l71_c9_599a_iftrue;
     state_MUX_eth_8_h_l71_c9_599a_iffalse <= VAR_state_MUX_eth_8_h_l71_c9_599a_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l71_c9_599a_return_output := state_MUX_eth_8_h_l71_c9_599a_return_output;

     -- counter_MUX[eth_8_h_l71_c9_599a] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l71_c9_599a_cond <= VAR_counter_MUX_eth_8_h_l71_c9_599a_cond;
     counter_MUX_eth_8_h_l71_c9_599a_iftrue <= VAR_counter_MUX_eth_8_h_l71_c9_599a_iftrue;
     counter_MUX_eth_8_h_l71_c9_599a_iffalse <= VAR_counter_MUX_eth_8_h_l71_c9_599a_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l71_c9_599a_return_output := counter_MUX_eth_8_h_l71_c9_599a_return_output;

     -- o_overflow_MUX[eth_8_h_l51_c3_9dc8] LATENCY=0
     -- Inputs
     o_overflow_MUX_eth_8_h_l51_c3_9dc8_cond <= VAR_o_overflow_MUX_eth_8_h_l51_c3_9dc8_cond;
     o_overflow_MUX_eth_8_h_l51_c3_9dc8_iftrue <= VAR_o_overflow_MUX_eth_8_h_l51_c3_9dc8_iftrue;
     o_overflow_MUX_eth_8_h_l51_c3_9dc8_iffalse <= VAR_o_overflow_MUX_eth_8_h_l51_c3_9dc8_iffalse;
     -- Outputs
     VAR_o_overflow_MUX_eth_8_h_l51_c3_9dc8_return_output := o_overflow_MUX_eth_8_h_l51_c3_9dc8_return_output;

     -- header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a[eth_8_h_l51_c3_9dc8] LATENCY=0
     VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a_eth_8_h_l51_c3_9dc8_return_output := CONST_REF_RD_eth_header_t_eth_header_t_325a(
     header,
     VAR_header_ethertype_MUX_eth_8_h_l61_c9_d24e_return_output,
     VAR_header_src_mac_MUX_eth_8_h_l61_c9_d24e_return_output);

     -- Submodule level 6
     VAR_counter_MUX_eth_8_h_l61_c9_d24e_iffalse := VAR_counter_MUX_eth_8_h_l71_c9_599a_return_output;
     VAR_header_MUX_eth_8_h_l51_c3_9dc8_iffalse := VAR_header_FALSE_INPUT_MUX_CONST_REF_RD_eth_header_t_eth_header_t_325a_eth_8_h_l51_c3_9dc8_return_output;
     VAR_state_MUX_eth_8_h_l61_c9_d24e_iffalse := VAR_state_MUX_eth_8_h_l71_c9_599a_return_output;
     -- header_MUX[eth_8_h_l51_c3_9dc8] LATENCY=0
     -- Inputs
     header_MUX_eth_8_h_l51_c3_9dc8_cond <= VAR_header_MUX_eth_8_h_l51_c3_9dc8_cond;
     header_MUX_eth_8_h_l51_c3_9dc8_iftrue <= VAR_header_MUX_eth_8_h_l51_c3_9dc8_iftrue;
     header_MUX_eth_8_h_l51_c3_9dc8_iffalse <= VAR_header_MUX_eth_8_h_l51_c3_9dc8_iffalse;
     -- Outputs
     VAR_header_MUX_eth_8_h_l51_c3_9dc8_return_output := header_MUX_eth_8_h_l51_c3_9dc8_return_output;

     -- counter_MUX[eth_8_h_l61_c9_d24e] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l61_c9_d24e_cond <= VAR_counter_MUX_eth_8_h_l61_c9_d24e_cond;
     counter_MUX_eth_8_h_l61_c9_d24e_iftrue <= VAR_counter_MUX_eth_8_h_l61_c9_d24e_iftrue;
     counter_MUX_eth_8_h_l61_c9_d24e_iffalse <= VAR_counter_MUX_eth_8_h_l61_c9_d24e_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l61_c9_d24e_return_output := counter_MUX_eth_8_h_l61_c9_d24e_return_output;

     -- CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_8d08[eth_8_h_l100_c10_78cd] LATENCY=0
     VAR_CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_8d08_eth_8_h_l100_c10_78cd_return_output := CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_8d08(
     header,
     VAR_o_frame_valid_MUX_eth_8_h_l51_c3_9dc8_return_output,
     VAR_o_frame_data_payload_MUX_eth_8_h_l51_c3_9dc8_return_output,
     VAR_o_overflow_MUX_eth_8_h_l51_c3_9dc8_return_output,
     VAR_o_frame_data_start_of_payload_MUX_eth_8_h_l51_c3_9dc8_return_output);

     -- state_MUX[eth_8_h_l61_c9_d24e] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l61_c9_d24e_cond <= VAR_state_MUX_eth_8_h_l61_c9_d24e_cond;
     state_MUX_eth_8_h_l61_c9_d24e_iftrue <= VAR_state_MUX_eth_8_h_l61_c9_d24e_iftrue;
     state_MUX_eth_8_h_l61_c9_d24e_iffalse <= VAR_state_MUX_eth_8_h_l61_c9_d24e_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l61_c9_d24e_return_output := state_MUX_eth_8_h_l61_c9_d24e_return_output;

     -- Submodule level 7
     VAR_return_output := VAR_CONST_REF_RD_eth_8_rx_t_eth_8_rx_t_8d08_eth_8_h_l100_c10_78cd_return_output;
     VAR_counter_MUX_eth_8_h_l51_c3_9dc8_iffalse := VAR_counter_MUX_eth_8_h_l61_c9_d24e_return_output;
     REG_VAR_header := VAR_header_MUX_eth_8_h_l51_c3_9dc8_return_output;
     VAR_state_MUX_eth_8_h_l51_c3_9dc8_iffalse := VAR_state_MUX_eth_8_h_l61_c9_d24e_return_output;
     -- counter_MUX[eth_8_h_l51_c3_9dc8] LATENCY=0
     -- Inputs
     counter_MUX_eth_8_h_l51_c3_9dc8_cond <= VAR_counter_MUX_eth_8_h_l51_c3_9dc8_cond;
     counter_MUX_eth_8_h_l51_c3_9dc8_iftrue <= VAR_counter_MUX_eth_8_h_l51_c3_9dc8_iftrue;
     counter_MUX_eth_8_h_l51_c3_9dc8_iffalse <= VAR_counter_MUX_eth_8_h_l51_c3_9dc8_iffalse;
     -- Outputs
     VAR_counter_MUX_eth_8_h_l51_c3_9dc8_return_output := counter_MUX_eth_8_h_l51_c3_9dc8_return_output;

     -- state_MUX[eth_8_h_l51_c3_9dc8] LATENCY=0
     -- Inputs
     state_MUX_eth_8_h_l51_c3_9dc8_cond <= VAR_state_MUX_eth_8_h_l51_c3_9dc8_cond;
     state_MUX_eth_8_h_l51_c3_9dc8_iftrue <= VAR_state_MUX_eth_8_h_l51_c3_9dc8_iftrue;
     state_MUX_eth_8_h_l51_c3_9dc8_iffalse <= VAR_state_MUX_eth_8_h_l51_c3_9dc8_iffalse;
     -- Outputs
     VAR_state_MUX_eth_8_h_l51_c3_9dc8_return_output := state_MUX_eth_8_h_l51_c3_9dc8_return_output;

     -- Submodule level 8
     REG_VAR_counter := VAR_counter_MUX_eth_8_h_l51_c3_9dc8_return_output;
     REG_VAR_state := VAR_state_MUX_eth_8_h_l51_c3_9dc8_return_output;
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
