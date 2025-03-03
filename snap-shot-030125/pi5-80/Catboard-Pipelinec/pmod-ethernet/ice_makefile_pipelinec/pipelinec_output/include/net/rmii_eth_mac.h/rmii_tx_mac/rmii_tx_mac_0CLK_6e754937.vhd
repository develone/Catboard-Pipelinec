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
-- Submodules: 80
entity rmii_tx_mac_0CLK_6e754937 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 axis_in : in axis8_t_stream_t;
 return_output : out rmii_tx_mac_t);
end rmii_tx_mac_0CLK_6e754937;
architecture arch of rmii_tx_mac_0CLK_6e754937 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal state : unsigned(2 downto 0) := unsigned(rmii_tx_mac_state_t_to_slv(rmii_tx_mac_state_t'left));
signal bit_counter : unsigned(5 downto 0) := to_unsigned(0, 6);
signal crc : unsigned(31 downto 0) := to_unsigned(0, 32);
signal crc_shift_reg : unsigned(31 downto 0) := to_unsigned(0, 32);
signal data_reg : unsigned(7 downto 0) := to_unsigned(0, 8);
signal last_byte_reg : unsigned(0 downto 0) := to_unsigned(0, 1);
signal axis_in_data_reg : unsigned(7 downto 0) := to_unsigned(0, 8);
signal axis_in_data_reg_valid : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_state : unsigned(2 downto 0);
signal REG_COMB_bit_counter : unsigned(5 downto 0);
signal REG_COMB_crc : unsigned(31 downto 0);
signal REG_COMB_crc_shift_reg : unsigned(31 downto 0);
signal REG_COMB_data_reg : unsigned(7 downto 0);
signal REG_COMB_last_byte_reg : unsigned(0 downto 0);
signal REG_COMB_axis_in_data_reg : unsigned(7 downto 0);
signal REG_COMB_axis_in_data_reg_valid : unsigned(0 downto 0);

-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Each function instance gets signals
-- BIN_OP_EQ[rmii_eth_mac_h_l158_c31_2944]
signal BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944_left : unsigned(5 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944_right : unsigned(5 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l159_c26_004b]
signal BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b_left : unsigned(5 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b_right : unsigned(4 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l160_c32_12b4]
signal BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_left : unsigned(5 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l167_c6_6d6e]
signal BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_return_output : unsigned(0 downto 0);

-- o_MUX[rmii_eth_mac_h_l167_c3_2dc7]
signal o_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond : unsigned(0 downto 0);
signal o_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output : rmii_tx_mac_t;

-- bit_counter_MUX[rmii_eth_mac_h_l167_c3_2dc7]
signal bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output : unsigned(5 downto 0);

-- state_MUX[rmii_eth_mac_h_l167_c3_2dc7]
signal state_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output : unsigned(2 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l167_c3_2dc7]
signal data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output : unsigned(7 downto 0);

-- crc_shift_reg_MUX[rmii_eth_mac_h_l167_c3_2dc7]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output : unsigned(31 downto 0);

-- reset_crc_MUX[rmii_eth_mac_h_l167_c3_2dc7]
signal reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond : unsigned(0 downto 0);
signal reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue : unsigned(0 downto 0);
signal reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse : unsigned(0 downto 0);
signal reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output : unsigned(0 downto 0);

-- last_byte_reg_MUX[rmii_eth_mac_h_l167_c3_2dc7]
signal last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l169_c5_75e2]
signal state_MUX_rmii_eth_mac_h_l169_c5_75e2_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l169_c5_75e2_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l169_c5_75e2_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l169_c5_75e2_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l173_c11_2675]
signal BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_return_output : unsigned(0 downto 0);

-- o_MUX[rmii_eth_mac_h_l173_c8_3f4f]
signal o_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond : unsigned(0 downto 0);
signal o_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output : rmii_tx_mac_t;

-- bit_counter_MUX[rmii_eth_mac_h_l173_c8_3f4f]
signal bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output : unsigned(5 downto 0);

-- state_MUX[rmii_eth_mac_h_l173_c8_3f4f]
signal state_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output : unsigned(2 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l173_c8_3f4f]
signal data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output : unsigned(7 downto 0);

-- crc_shift_reg_MUX[rmii_eth_mac_h_l173_c8_3f4f]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output : unsigned(31 downto 0);

-- last_byte_reg_MUX[rmii_eth_mac_h_l173_c8_3f4f]
signal last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l176_c5_632a]
signal bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_return_output : unsigned(5 downto 0);

-- state_MUX[rmii_eth_mac_h_l176_c5_632a]
signal state_MUX_rmii_eth_mac_h_l176_c5_632a_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l176_c5_632a_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l176_c5_632a_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l176_c5_632a_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l184_c11_f0f6]
signal BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_return_output : unsigned(0 downto 0);

-- o_MUX[rmii_eth_mac_h_l184_c8_2a42]
signal o_MUX_rmii_eth_mac_h_l184_c8_2a42_cond : unsigned(0 downto 0);
signal o_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output : rmii_tx_mac_t;

-- bit_counter_MUX[rmii_eth_mac_h_l184_c8_2a42]
signal bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output : unsigned(5 downto 0);

-- state_MUX[rmii_eth_mac_h_l184_c8_2a42]
signal state_MUX_rmii_eth_mac_h_l184_c8_2a42_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output : unsigned(2 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l184_c8_2a42]
signal data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output : unsigned(7 downto 0);

-- crc_shift_reg_MUX[rmii_eth_mac_h_l184_c8_2a42]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output : unsigned(31 downto 0);

-- last_byte_reg_MUX[rmii_eth_mac_h_l184_c8_2a42]
signal last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l194_c11_14a4]
signal BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_return_output : unsigned(0 downto 0);

-- o_MUX[rmii_eth_mac_h_l194_c8_d7b2]
signal o_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond : unsigned(0 downto 0);
signal o_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output : rmii_tx_mac_t;

-- bit_counter_MUX[rmii_eth_mac_h_l194_c8_d7b2]
signal bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output : unsigned(5 downto 0);

-- state_MUX[rmii_eth_mac_h_l194_c8_d7b2]
signal state_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output : unsigned(2 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l194_c8_d7b2]
signal data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output : unsigned(7 downto 0);

-- crc_shift_reg_MUX[rmii_eth_mac_h_l194_c8_d7b2]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output : unsigned(31 downto 0);

-- last_byte_reg_MUX[rmii_eth_mac_h_l194_c8_d7b2]
signal last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l201_c38_8744]
signal BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_left : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_right : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_return_output : unsigned(0 downto 0);

-- o_tx_mac_input_ready_MUX[rmii_eth_mac_h_l202_c5_a4b0]
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l202_c5_a4b0]
signal bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output : unsigned(5 downto 0);

-- state_MUX[rmii_eth_mac_h_l202_c5_a4b0]
signal state_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output : unsigned(2 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l202_c5_a4b0]
signal data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output : unsigned(7 downto 0);

-- last_byte_reg_MUX[rmii_eth_mac_h_l202_c5_a4b0]
signal last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output : unsigned(0 downto 0);

-- o_tx_mac_input_ready_MUX[rmii_eth_mac_h_l203_c7_0abd]
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_cond : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l203_c7_0abd]
signal bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output : unsigned(5 downto 0);

-- state_MUX[rmii_eth_mac_h_l203_c7_0abd]
signal state_MUX_rmii_eth_mac_h_l203_c7_0abd_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output : unsigned(2 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l203_c7_0abd]
signal data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output : unsigned(7 downto 0);

-- last_byte_reg_MUX[rmii_eth_mac_h_l203_c7_0abd]
signal last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output : unsigned(0 downto 0);

-- CONST_SR_2[rmii_eth_mac_h_l218_c18_7451]
signal CONST_SR_2_rmii_eth_mac_h_l218_c18_7451_x : unsigned(7 downto 0);
signal CONST_SR_2_rmii_eth_mac_h_l218_c18_7451_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l221_c11_9f27]
signal BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_return_output : unsigned(0 downto 0);

-- o_tx_mac_output_data_MUX[rmii_eth_mac_h_l221_c8_2bc6]
signal o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond : unsigned(0 downto 0);
signal o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue : unsigned(1 downto 0);
signal o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse : unsigned(1 downto 0);
signal o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output : unsigned(1 downto 0);

-- o_tx_mac_output_valid_MUX[rmii_eth_mac_h_l221_c8_2bc6]
signal o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond : unsigned(0 downto 0);
signal o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue : unsigned(0 downto 0);
signal o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse : unsigned(0 downto 0);
signal o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l221_c8_2bc6]
signal bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output : unsigned(5 downto 0);

-- state_MUX[rmii_eth_mac_h_l221_c8_2bc6]
signal state_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output : unsigned(2 downto 0);

-- crc_shift_reg_MUX[rmii_eth_mac_h_l221_c8_2bc6]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output : unsigned(31 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l226_c5_ff31]
signal bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_return_output : unsigned(5 downto 0);

-- state_MUX[rmii_eth_mac_h_l226_c5_ff31]
signal state_MUX_rmii_eth_mac_h_l226_c5_ff31_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l226_c5_ff31_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l226_c5_ff31_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l226_c5_ff31_return_output : unsigned(2 downto 0);

-- crc_shift_reg_MUX[rmii_eth_mac_h_l226_c5_ff31]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_return_output : unsigned(31 downto 0);

-- CONST_SR_2[rmii_eth_mac_h_l233_c23_6f1b]
signal CONST_SR_2_rmii_eth_mac_h_l233_c23_6f1b_x : unsigned(31 downto 0);
signal CONST_SR_2_rmii_eth_mac_h_l233_c23_6f1b_return_output : unsigned(31 downto 0);

-- crc_MUX[rmii_eth_mac_h_l250_c3_e319]
signal crc_MUX_rmii_eth_mac_h_l250_c3_e319_cond : unsigned(0 downto 0);
signal crc_MUX_rmii_eth_mac_h_l250_c3_e319_iftrue : unsigned(31 downto 0);
signal crc_MUX_rmii_eth_mac_h_l250_c3_e319_iffalse : unsigned(31 downto 0);
signal crc_MUX_rmii_eth_mac_h_l250_c3_e319_return_output : unsigned(31 downto 0);

-- CONST_SR_4[rmii_eth_mac_h_l251_c12_ce6b]
signal CONST_SR_4_rmii_eth_mac_h_l251_c12_ce6b_x : unsigned(31 downto 0);
signal CONST_SR_4_rmii_eth_mac_h_l251_c12_ce6b_return_output : unsigned(31 downto 0);

-- CONST_SR_0[rmii_eth_mac_h_l251_c42_d3bc]
signal CONST_SR_0_rmii_eth_mac_h_l251_c42_d3bc_x : unsigned(7 downto 0);
signal CONST_SR_0_rmii_eth_mac_h_l251_c42_d3bc_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[rmii_eth_mac_h_l251_c35_6795]
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c35_6795_left : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c35_6795_right : unsigned(7 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c35_6795_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l251_c35_231a]
signal BIN_OP_AND_rmii_eth_mac_h_l251_c35_231a_left : unsigned(31 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l251_c35_231a_right : unsigned(7 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l251_c35_231a_return_output : unsigned(31 downto 0);

-- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60[rmii_eth_mac_h_l251_c24_77cd]
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_0 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_1 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_2 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_3 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_4 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_5 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_6 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_7 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_8 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_9 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_10 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_11 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_12 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_13 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_14 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_15 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_return_output : unsigned(31 downto 0);

-- BIN_OP_XOR[rmii_eth_mac_h_l251_c12_5f1f]
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f_left : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f_right : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f_return_output : unsigned(31 downto 0);

-- CONST_SR_4[rmii_eth_mac_h_l252_c12_367f]
signal CONST_SR_4_rmii_eth_mac_h_l252_c12_367f_x : unsigned(31 downto 0);
signal CONST_SR_4_rmii_eth_mac_h_l252_c12_367f_return_output : unsigned(31 downto 0);

-- CONST_SR_4[rmii_eth_mac_h_l252_c42_f680]
signal CONST_SR_4_rmii_eth_mac_h_l252_c42_f680_x : unsigned(7 downto 0);
signal CONST_SR_4_rmii_eth_mac_h_l252_c42_f680_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[rmii_eth_mac_h_l252_c35_9cc2]
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c35_9cc2_left : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c35_9cc2_right : unsigned(7 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c35_9cc2_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l252_c35_b749]
signal BIN_OP_AND_rmii_eth_mac_h_l252_c35_b749_left : unsigned(31 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l252_c35_b749_right : unsigned(7 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l252_c35_b749_return_output : unsigned(31 downto 0);

-- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60[rmii_eth_mac_h_l252_c24_f626]
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_0 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_1 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_2 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_3 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_4 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_5 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_6 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_7 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_8 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_9 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_10 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_11 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_12 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_13 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_14 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_15 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_return_output : unsigned(31 downto 0);

-- BIN_OP_XOR[rmii_eth_mac_h_l252_c12_7261]
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c12_7261_left : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c12_7261_right : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c12_7261_return_output : unsigned(31 downto 0);

-- crc_MUX[rmii_eth_mac_h_l254_c3_0a9a]
signal crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_cond : unsigned(0 downto 0);
signal crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_iftrue : unsigned(31 downto 0);
signal crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_iffalse : unsigned(31 downto 0);
signal crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l258_c28_1ee8]
signal BIN_OP_AND_rmii_eth_mac_h_l258_c28_1ee8_left : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l258_c28_1ee8_right : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l258_c28_1ee8_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47
signal BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47_return_output : unsigned(6 downto 0);

function CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return rmii_tx_mac_t is
 
  variable base : rmii_tx_mac_t; 
  variable return_output : rmii_tx_mac_t;
begin
      base.tx_mac_output_data := ref_toks_0;
      base.tx_mac_output_valid := ref_toks_1;
      base.tx_mac_input_ready := ref_toks_2;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return rmii_tx_mac_t is
 
  variable base : rmii_tx_mac_t; 
  variable return_output : rmii_tx_mac_t;
begin
      base.tx_mac_input_ready := ref_toks_0;
      base.tx_mac_output_data := ref_toks_1;
      base.tx_mac_output_valid := ref_toks_2;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return rmii_tx_mac_t is
 
  variable base : rmii_tx_mac_t; 
  variable return_output : rmii_tx_mac_t;
begin
      base.tx_mac_output_valid := ref_toks_0;
      base.tx_mac_output_data := ref_toks_1;
      base.tx_mac_input_ready := ref_toks_2;

      return_output := base;
      return return_output; 
end function;

function uint8_1_0( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(1 downto 0);
begin
return_output := unsigned(std_logic_vector(x(1 downto 0)));
return return_output;
end function;

function uint32_1_0( x : unsigned) return unsigned is
--variable x : unsigned(31 downto 0);
  variable return_output : unsigned(1 downto 0);
begin
return_output := unsigned(std_logic_vector(x(1 downto 0)));
return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944 : entity work.BIN_OP_EQ_uint6_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944_left,
BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944_right,
BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b : entity work.BIN_OP_EQ_uint6_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b_left,
BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b_right,
BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4 : entity work.BIN_OP_EQ_uint6_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_left,
BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_right,
BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_left,
BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_right,
BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_return_output);

-- o_MUX_rmii_eth_mac_h_l167_c3_2dc7 : 0 clocks latency
o_MUX_rmii_eth_mac_h_l167_c3_2dc7 : entity work.MUX_uint1_t_rmii_tx_mac_t_rmii_tx_mac_t_0CLK_de264c78 port map (
o_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond,
o_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue,
o_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse,
o_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond,
bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output);

-- state_MUX_rmii_eth_mac_h_l167_c3_2dc7 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l167_c3_2dc7 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond,
state_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue,
state_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse,
state_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7 : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond,
data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue,
data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse,
data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7 : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output);

-- reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7 : 0 clocks latency
reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond,
reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue,
reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse,
reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7 : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output);

-- state_MUX_rmii_eth_mac_h_l169_c5_75e2 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l169_c5_75e2 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l169_c5_75e2_cond,
state_MUX_rmii_eth_mac_h_l169_c5_75e2_iftrue,
state_MUX_rmii_eth_mac_h_l169_c5_75e2_iffalse,
state_MUX_rmii_eth_mac_h_l169_c5_75e2_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_left,
BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_right,
BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_return_output);

-- o_MUX_rmii_eth_mac_h_l173_c8_3f4f : 0 clocks latency
o_MUX_rmii_eth_mac_h_l173_c8_3f4f : entity work.MUX_uint1_t_rmii_tx_mac_t_rmii_tx_mac_t_0CLK_de264c78 port map (
o_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond,
o_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue,
o_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse,
o_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond,
bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output);

-- state_MUX_rmii_eth_mac_h_l173_c8_3f4f : 0 clocks latency
state_MUX_rmii_eth_mac_h_l173_c8_3f4f : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond,
state_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue,
state_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse,
state_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond,
data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue,
data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse,
data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_cond,
bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_return_output);

-- state_MUX_rmii_eth_mac_h_l176_c5_632a : 0 clocks latency
state_MUX_rmii_eth_mac_h_l176_c5_632a : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l176_c5_632a_cond,
state_MUX_rmii_eth_mac_h_l176_c5_632a_iftrue,
state_MUX_rmii_eth_mac_h_l176_c5_632a_iffalse,
state_MUX_rmii_eth_mac_h_l176_c5_632a_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_left,
BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_right,
BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_return_output);

-- o_MUX_rmii_eth_mac_h_l184_c8_2a42 : 0 clocks latency
o_MUX_rmii_eth_mac_h_l184_c8_2a42 : entity work.MUX_uint1_t_rmii_tx_mac_t_rmii_tx_mac_t_0CLK_de264c78 port map (
o_MUX_rmii_eth_mac_h_l184_c8_2a42_cond,
o_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue,
o_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse,
o_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_cond,
bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output);

-- state_MUX_rmii_eth_mac_h_l184_c8_2a42 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l184_c8_2a42 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l184_c8_2a42_cond,
state_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue,
state_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse,
state_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42 : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_cond,
data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue,
data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse,
data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42 : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42 : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_left,
BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_right,
BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_return_output);

-- o_MUX_rmii_eth_mac_h_l194_c8_d7b2 : 0 clocks latency
o_MUX_rmii_eth_mac_h_l194_c8_d7b2 : entity work.MUX_uint1_t_rmii_tx_mac_t_rmii_tx_mac_t_0CLK_de264c78 port map (
o_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond,
o_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue,
o_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse,
o_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond,
bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output);

-- state_MUX_rmii_eth_mac_h_l194_c8_d7b2 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l194_c8_d7b2 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond,
state_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue,
state_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse,
state_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2 : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond,
data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue,
data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse,
data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2 : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2 : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744 : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_left,
BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_right,
BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_return_output);

-- o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0 : 0 clocks latency
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond,
bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output);

-- state_MUX_rmii_eth_mac_h_l202_c5_a4b0 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l202_c5_a4b0 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond,
state_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue,
state_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse,
state_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0 : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond,
data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue,
data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse,
data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0 : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output);

-- o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd : 0 clocks latency
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_cond,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_cond,
bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output);

-- state_MUX_rmii_eth_mac_h_l203_c7_0abd : 0 clocks latency
state_MUX_rmii_eth_mac_h_l203_c7_0abd : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l203_c7_0abd_cond,
state_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue,
state_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse,
state_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_cond,
data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue,
data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse,
data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output);

-- CONST_SR_2_rmii_eth_mac_h_l218_c18_7451 : 0 clocks latency
CONST_SR_2_rmii_eth_mac_h_l218_c18_7451 : entity work.CONST_SR_2_uint8_t_0CLK_de264c78 port map (
CONST_SR_2_rmii_eth_mac_h_l218_c18_7451_x,
CONST_SR_2_rmii_eth_mac_h_l218_c18_7451_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_left,
BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_right,
BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_return_output);

-- o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6 : 0 clocks latency
o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond,
o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue,
o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse,
o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output);

-- o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6 : 0 clocks latency
o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond,
o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue,
o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse,
o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond,
bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output);

-- state_MUX_rmii_eth_mac_h_l221_c8_2bc6 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l221_c8_2bc6 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond,
state_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue,
state_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse,
state_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6 : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_cond,
bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_return_output);

-- state_MUX_rmii_eth_mac_h_l226_c5_ff31 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l226_c5_ff31 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l226_c5_ff31_cond,
state_MUX_rmii_eth_mac_h_l226_c5_ff31_iftrue,
state_MUX_rmii_eth_mac_h_l226_c5_ff31_iffalse,
state_MUX_rmii_eth_mac_h_l226_c5_ff31_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31 : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_return_output);

-- CONST_SR_2_rmii_eth_mac_h_l233_c23_6f1b : 0 clocks latency
CONST_SR_2_rmii_eth_mac_h_l233_c23_6f1b : entity work.CONST_SR_2_uint32_t_0CLK_de264c78 port map (
CONST_SR_2_rmii_eth_mac_h_l233_c23_6f1b_x,
CONST_SR_2_rmii_eth_mac_h_l233_c23_6f1b_return_output);

-- crc_MUX_rmii_eth_mac_h_l250_c3_e319 : 0 clocks latency
crc_MUX_rmii_eth_mac_h_l250_c3_e319 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_MUX_rmii_eth_mac_h_l250_c3_e319_cond,
crc_MUX_rmii_eth_mac_h_l250_c3_e319_iftrue,
crc_MUX_rmii_eth_mac_h_l250_c3_e319_iffalse,
crc_MUX_rmii_eth_mac_h_l250_c3_e319_return_output);

-- CONST_SR_4_rmii_eth_mac_h_l251_c12_ce6b : 0 clocks latency
CONST_SR_4_rmii_eth_mac_h_l251_c12_ce6b : entity work.CONST_SR_4_uint32_t_0CLK_de264c78 port map (
CONST_SR_4_rmii_eth_mac_h_l251_c12_ce6b_x,
CONST_SR_4_rmii_eth_mac_h_l251_c12_ce6b_return_output);

-- CONST_SR_0_rmii_eth_mac_h_l251_c42_d3bc : 0 clocks latency
CONST_SR_0_rmii_eth_mac_h_l251_c42_d3bc : entity work.CONST_SR_0_uint8_t_0CLK_de264c78 port map (
CONST_SR_0_rmii_eth_mac_h_l251_c42_d3bc_x,
CONST_SR_0_rmii_eth_mac_h_l251_c42_d3bc_return_output);

-- BIN_OP_XOR_rmii_eth_mac_h_l251_c35_6795 : 0 clocks latency
BIN_OP_XOR_rmii_eth_mac_h_l251_c35_6795 : entity work.BIN_OP_XOR_uint32_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_rmii_eth_mac_h_l251_c35_6795_left,
BIN_OP_XOR_rmii_eth_mac_h_l251_c35_6795_right,
BIN_OP_XOR_rmii_eth_mac_h_l251_c35_6795_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l251_c35_231a : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l251_c35_231a : entity work.BIN_OP_AND_uint32_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l251_c35_231a_left,
BIN_OP_AND_rmii_eth_mac_h_l251_c35_231a_right,
BIN_OP_AND_rmii_eth_mac_h_l251_c35_231a_return_output);

-- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd : 0 clocks latency
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd : entity work.VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_0CLK_8bf83e3e port map (
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_0,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_1,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_2,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_3,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_4,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_5,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_6,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_7,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_8,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_9,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_10,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_11,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_12,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_13,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_14,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_15,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_var_dim_0,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_return_output);

-- BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f : 0 clocks latency
BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f : entity work.BIN_OP_XOR_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f_left,
BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f_right,
BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f_return_output);

-- CONST_SR_4_rmii_eth_mac_h_l252_c12_367f : 0 clocks latency
CONST_SR_4_rmii_eth_mac_h_l252_c12_367f : entity work.CONST_SR_4_uint32_t_0CLK_de264c78 port map (
CONST_SR_4_rmii_eth_mac_h_l252_c12_367f_x,
CONST_SR_4_rmii_eth_mac_h_l252_c12_367f_return_output);

-- CONST_SR_4_rmii_eth_mac_h_l252_c42_f680 : 0 clocks latency
CONST_SR_4_rmii_eth_mac_h_l252_c42_f680 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_rmii_eth_mac_h_l252_c42_f680_x,
CONST_SR_4_rmii_eth_mac_h_l252_c42_f680_return_output);

-- BIN_OP_XOR_rmii_eth_mac_h_l252_c35_9cc2 : 0 clocks latency
BIN_OP_XOR_rmii_eth_mac_h_l252_c35_9cc2 : entity work.BIN_OP_XOR_uint32_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_rmii_eth_mac_h_l252_c35_9cc2_left,
BIN_OP_XOR_rmii_eth_mac_h_l252_c35_9cc2_right,
BIN_OP_XOR_rmii_eth_mac_h_l252_c35_9cc2_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l252_c35_b749 : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l252_c35_b749 : entity work.BIN_OP_AND_uint32_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l252_c35_b749_left,
BIN_OP_AND_rmii_eth_mac_h_l252_c35_b749_right,
BIN_OP_AND_rmii_eth_mac_h_l252_c35_b749_return_output);

-- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626 : 0 clocks latency
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626 : entity work.VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_0CLK_8bf83e3e port map (
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_0,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_1,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_2,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_3,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_4,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_5,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_6,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_7,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_8,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_9,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_10,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_11,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_12,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_13,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_14,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_15,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_var_dim_0,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_return_output);

-- BIN_OP_XOR_rmii_eth_mac_h_l252_c12_7261 : 0 clocks latency
BIN_OP_XOR_rmii_eth_mac_h_l252_c12_7261 : entity work.BIN_OP_XOR_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_XOR_rmii_eth_mac_h_l252_c12_7261_left,
BIN_OP_XOR_rmii_eth_mac_h_l252_c12_7261_right,
BIN_OP_XOR_rmii_eth_mac_h_l252_c12_7261_return_output);

-- crc_MUX_rmii_eth_mac_h_l254_c3_0a9a : 0 clocks latency
crc_MUX_rmii_eth_mac_h_l254_c3_0a9a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_cond,
crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_iftrue,
crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_iffalse,
crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l258_c28_1ee8 : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l258_c28_1ee8 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l258_c28_1ee8_left,
BIN_OP_AND_rmii_eth_mac_h_l258_c28_1ee8_right,
BIN_OP_AND_rmii_eth_mac_h_l258_c28_1ee8_return_output);

-- BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47 : 0 clocks latency
BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47 : entity work.BIN_OP_PLUS_uint6_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47_left,
BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47_right,
BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47_return_output);



-- Resolve what clock enable to use for user logic
clk_en_internal <= CLOCK_ENABLE(0);
-- Combinatorial process for pipeline stages
process (
CLOCK_ENABLE,
clk_en_internal,
 -- Inputs
 axis_in,
 -- Registers
 state,
 bit_counter,
 crc,
 crc_shift_reg,
 data_reg,
 last_byte_reg,
 axis_in_data_reg,
 axis_in_data_reg_valid,
 -- All submodule outputs
 BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_return_output,
 o_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output,
 state_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output,
 data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output,
 reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output,
 state_MUX_rmii_eth_mac_h_l169_c5_75e2_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_return_output,
 o_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output,
 state_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output,
 data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_return_output,
 state_MUX_rmii_eth_mac_h_l176_c5_632a_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_return_output,
 o_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output,
 state_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output,
 data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_return_output,
 o_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output,
 state_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output,
 data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_return_output,
 o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output,
 state_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output,
 data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output,
 o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output,
 state_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output,
 data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output,
 CONST_SR_2_rmii_eth_mac_h_l218_c18_7451_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_return_output,
 o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output,
 o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output,
 state_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_return_output,
 state_MUX_rmii_eth_mac_h_l226_c5_ff31_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_return_output,
 CONST_SR_2_rmii_eth_mac_h_l233_c23_6f1b_return_output,
 crc_MUX_rmii_eth_mac_h_l250_c3_e319_return_output,
 CONST_SR_4_rmii_eth_mac_h_l251_c12_ce6b_return_output,
 CONST_SR_0_rmii_eth_mac_h_l251_c42_d3bc_return_output,
 BIN_OP_XOR_rmii_eth_mac_h_l251_c35_6795_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l251_c35_231a_return_output,
 VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_return_output,
 BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f_return_output,
 CONST_SR_4_rmii_eth_mac_h_l252_c12_367f_return_output,
 CONST_SR_4_rmii_eth_mac_h_l252_c42_f680_return_output,
 BIN_OP_XOR_rmii_eth_mac_h_l252_c35_9cc2_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l252_c35_b749_return_output,
 VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_return_output,
 BIN_OP_XOR_rmii_eth_mac_h_l252_c12_7261_return_output,
 crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l258_c28_1ee8_return_output,
 BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : rmii_tx_mac_t;
 variable VAR_axis_in : axis8_t_stream_t;
 variable VAR_o : rmii_tx_mac_t;
 variable VAR_INC : unsigned(1 downto 0);
 variable VAR_preamble_ctr_end : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944_return_output : unsigned(0 downto 0);
 variable VAR_fcs_ctr_end : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b_return_output : unsigned(0 downto 0);
 variable VAR_last_bits_of_byte : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_return_output : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_data_rmii_eth_mac_h_l163_c3_56fc : unsigned(1 downto 0);
 variable VAR_reset_crc : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_return_output : unsigned(0 downto 0);
 variable VAR_o_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue : rmii_tx_mac_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l167_c3_2dc7_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l169_c5_75e2_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond : unsigned(0 downto 0);
 variable VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue : unsigned(0 downto 0);
 variable VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse : unsigned(0 downto 0);
 variable VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output : unsigned(0 downto 0);
 variable VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l169_c5_75e2_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l169_c5_75e2_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l169_c5_75e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_return_output : unsigned(0 downto 0);
 variable VAR_o_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue : rmii_tx_mac_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb_rmii_eth_mac_h_l173_c8_3f4f_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l176_c5_632a_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l178_c7_47dc : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l181_c7_3555 : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l176_c5_632a_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l176_c5_632a_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l176_c5_632a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_return_output : unsigned(0 downto 0);
 variable VAR_o_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue : rmii_tx_mac_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd_rmii_eth_mac_h_l184_c8_2a42_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l184_c8_2a42_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l192_c5_fc8a : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l184_c8_2a42_cond : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_return_output : unsigned(0 downto 0);
 variable VAR_o_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue : rmii_tx_mac_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l194_c8_d7b2_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse : rmii_tx_mac_t;
 variable VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb_rmii_eth_mac_h_l194_c8_d7b2_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond : unsigned(0 downto 0);
 variable VAR_uint8_1_0_rmii_eth_mac_h_l196_c28_34d1_return_output : unsigned(1 downto 0);
 variable VAR_last_bits_of_last_byte : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_return_output : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l217_c7_c68c : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l204_c9_cb3e : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l212_c9_2774 : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l203_c7_0abd_cond : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_7451_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_7451_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_return_output : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue : unsigned(1 downto 0);
 variable VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse : unsigned(1 downto 0);
 variable VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output : unsigned(1 downto 0);
 variable VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l226_c5_ff31_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond : unsigned(0 downto 0);
 variable VAR_uint32_1_0_rmii_eth_mac_h_l223_c28_4c17_return_output : unsigned(1 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l228_c7_0d1b : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l232_c7_fcce : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l226_c5_ff31_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l226_c5_ff31_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l226_c5_ff31_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_6f1b_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_6f1b_x : unsigned(31 downto 0);
 variable VAR_data_n : unsigned(7 downto 0);
 variable VAR_crc_table : uint32_t_16;
 variable VAR_crc_MUX_rmii_eth_mac_h_l250_c3_e319_iftrue : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l250_c3_e319_iffalse : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l250_c3_e319_return_output : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l250_c3_e319_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_ce6b_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f_left : unsigned(31 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_ce6b_x : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_6795_left : unsigned(31 downto 0);
 variable VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_d3bc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_6795_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_d3bc_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_6795_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_231a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_231a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_231a_return_output : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f_right : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_0 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_1 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_2 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_3 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_4 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_5 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_6 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_7 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_8 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_9 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_10 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_11 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_12 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_13 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_14 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_15 : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_367f_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_7261_left : unsigned(31 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_367f_x : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_9cc2_left : unsigned(31 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_f680_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_9cc2_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_f680_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_9cc2_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_b749_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_b749_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_b749_return_output : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_7261_right : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_0 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_1 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_2 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_3 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_4 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_5 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_6 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_7 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_8 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_9 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_10 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_11 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_12 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_13 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_14 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_15 : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_7261_return_output : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_iftrue : unsigned(31 downto 0);
 variable VAR_crc_rmii_eth_mac_h_l255_c5_a090 : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_iffalse : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_return_output : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_1ee8_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_rmii_tx_mac_t_tx_mac_input_ready_d41d_rmii_eth_mac_h_l258_c44_3db6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_1ee8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_1ee8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_h_l258_l169_DUPLICATE_eb8e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47_return_output : unsigned(6 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l209_l257_l189_DUPLICATE_7bd2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_rmii_eth_mac_h_l190_l210_DUPLICATE_da5e_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_state : unsigned(2 downto 0);
variable REG_VAR_bit_counter : unsigned(5 downto 0);
variable REG_VAR_crc : unsigned(31 downto 0);
variable REG_VAR_crc_shift_reg : unsigned(31 downto 0);
variable REG_VAR_data_reg : unsigned(7 downto 0);
variable REG_VAR_last_byte_reg : unsigned(0 downto 0);
variable REG_VAR_axis_in_data_reg : unsigned(7 downto 0);
variable REG_VAR_axis_in_data_reg_valid : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_state := state;
  REG_VAR_bit_counter := bit_counter;
  REG_VAR_crc := crc;
  REG_VAR_crc_shift_reg := crc_shift_reg;
  REG_VAR_data_reg := data_reg;
  REG_VAR_last_byte_reg := last_byte_reg;
  REG_VAR_axis_in_data_reg := axis_in_data_reg;
  REG_VAR_axis_in_data_reg_valid := axis_in_data_reg_valid;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_state_MUX_rmii_eth_mac_h_l169_c5_75e2_iftrue := unsigned(rmii_tx_mac_state_t_to_slv(PREAMBLE));
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_15 := unsigned'(X"f0000000");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_15 := unsigned'(X"f0000000");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_5 := to_unsigned(651600872, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_5 := to_unsigned(651600872, 32);
     VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_right := unsigned(rmii_tx_mac_state_t_to_slv(FCS));
     VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue := to_unsigned(1, 1);
     VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944_right := to_unsigned(60, 6);
     VAR_crc_rmii_eth_mac_h_l255_c5_a090 := resize(to_unsigned(0, 1), 32);
     VAR_crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_iftrue := VAR_crc_rmii_eth_mac_h_l255_c5_a090;
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_14 := unsigned'(X"edb71064");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_14 := unsigned'(X"edb71064");
     VAR_bit_counter_rmii_eth_mac_h_l178_c7_47dc := resize(to_unsigned(0, 1), 6);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_iftrue := VAR_bit_counter_rmii_eth_mac_h_l178_c7_47dc;
     VAR_state_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue := unsigned(rmii_tx_mac_state_t_to_slv(DATA));
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_2 := to_unsigned(1993593556, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_2 := to_unsigned(1993593556, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_6 := to_unsigned(1020740, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_6 := to_unsigned(1020740, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_1 := to_unsigned(1342890616, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_1 := to_unsigned(1342890616, 32);
     VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47_right := to_unsigned(2, 2);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_3 := to_unsigned(1801765552, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_3 := to_unsigned(1801765552, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_12 := unsigned'(X"d6d930ac");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_12 := unsigned'(X"d6d930ac");
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_right := unsigned(rmii_tx_mac_state_t_to_slv(IDLE));
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_7 := to_unsigned(498631456, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_7 := to_unsigned(498631456, 32);
     VAR_state_MUX_rmii_eth_mac_h_l226_c5_ff31_iftrue := unsigned(rmii_tx_mac_state_t_to_slv(IDLE));
     VAR_bit_counter_rmii_eth_mac_h_l212_c9_2774 := resize(to_unsigned(0, 1), 6);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse := VAR_bit_counter_rmii_eth_mac_h_l212_c9_2774;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_right := unsigned(rmii_tx_mac_state_t_to_slv(SFD));
     VAR_o_tx_mac_output_data_rmii_eth_mac_h_l163_c3_56fc := resize(to_unsigned(0, 1), 2);
     VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse := VAR_o_tx_mac_output_data_rmii_eth_mac_h_l163_c3_56fc;
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse := to_unsigned(1, 1);
     VAR_bit_counter_rmii_eth_mac_h_l192_c5_fc8a := resize(to_unsigned(0, 1), 6);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue := VAR_bit_counter_rmii_eth_mac_h_l192_c5_fc8a;
     VAR_bit_counter_rmii_eth_mac_h_l228_c7_0d1b := resize(to_unsigned(0, 1), 6);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_iftrue := VAR_bit_counter_rmii_eth_mac_h_l228_c7_0d1b;
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_10 := unsigned'(X"9b6b51f4");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_10 := unsigned'(X"9b6b51f4");
     VAR_bit_counter_rmii_eth_mac_h_l204_c9_cb3e := resize(to_unsigned(0, 1), 6);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue := VAR_bit_counter_rmii_eth_mac_h_l204_c9_cb3e;
     VAR_state_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue := unsigned(rmii_tx_mac_state_t_to_slv(FCS));
     VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_right := unsigned(rmii_tx_mac_state_t_to_slv(PREAMBLE));
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue := to_unsigned(0, 1);
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b_right := to_unsigned(30, 5);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_right := unsigned(rmii_tx_mac_state_t_to_slv(DATA));
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_9 := unsigned'(X"bdb26158");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_9 := unsigned'(X"bdb26158");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_4 := to_unsigned(996258700, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_4 := to_unsigned(996258700, 32);
     VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_b749_right := to_unsigned(15, 8);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_right := to_unsigned(6, 3);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_0 := to_unsigned(1304293916, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_0 := to_unsigned(1304293916, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_8 := unsigned'(X"a005713c");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_8 := unsigned'(X"a005713c");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_11 := unsigned'(X"86dc4190");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_11 := unsigned'(X"86dc4190");
     VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_231a_right := to_unsigned(15, 8);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_13 := unsigned'(X"cb6e20c8");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_13 := unsigned'(X"cb6e20c8");
     VAR_state_MUX_rmii_eth_mac_h_l176_c5_632a_iftrue := unsigned(rmii_tx_mac_state_t_to_slv(SFD));
     -- o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb[rmii_eth_mac_h_l173_c8_3f4f] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb_rmii_eth_mac_h_l173_c8_3f4f_return_output := CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb(
     to_unsigned(0, 1),
     to_unsigned(1, 2),
     to_unsigned(1, 1));

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd[rmii_eth_mac_h_l184_c8_2a42] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd_rmii_eth_mac_h_l184_c8_2a42_return_output := CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd(
     to_unsigned(1, 1),
     to_unsigned(3, 2),
     to_unsigned(1, 1));

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724[rmii_eth_mac_h_l167_c3_2dc7] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l167_c3_2dc7_return_output := CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724(
     VAR_o_tx_mac_output_data_rmii_eth_mac_h_l163_c3_56fc,
     to_unsigned(0, 1),
     to_unsigned(0, 1));

     -- Submodule level 1
     VAR_o_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l167_c3_2dc7_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd_rmii_eth_mac_h_l184_c8_2a42_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb_rmii_eth_mac_h_l173_c8_3f4f_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;
     -- Mux in inputs
     VAR_axis_in := axis_in;

     -- Submodule level 0
     VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_d3bc_x := axis_in_data_reg;
     VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_f680_x := axis_in_data_reg;
     VAR_crc_MUX_rmii_eth_mac_h_l250_c3_e319_cond := axis_in_data_reg_valid;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944_left := bit_counter;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b_left := bit_counter;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_left := bit_counter;
     VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47_left := bit_counter;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue := bit_counter;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse := bit_counter;
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_6795_left := crc;
     VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_ce6b_x := crc;
     VAR_crc_MUX_rmii_eth_mac_h_l250_c3_e319_iffalse := crc;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue := crc;
     VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_6f1b_x := crc_shift_reg;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue := crc_shift_reg;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue := crc_shift_reg;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue := crc_shift_reg;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse := crc_shift_reg;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_iftrue := crc_shift_reg;
     VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_7451_x := data_reg;
     VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue := data_reg;
     VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue := data_reg;
     VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse := data_reg;
     VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue := data_reg;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_right := last_byte_reg;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue := last_byte_reg;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue := last_byte_reg;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse := last_byte_reg;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse := last_byte_reg;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue := last_byte_reg;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_left := state;
     VAR_state_MUX_rmii_eth_mac_h_l169_c5_75e2_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l176_c5_632a_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l226_c5_ff31_iffalse := state;
     -- CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l209_l257_l189_DUPLICATE_7bd2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l209_l257_l189_DUPLICATE_7bd2_return_output := VAR_axis_in.data.tdata(0);

     -- BIN_OP_EQ[rmii_eth_mac_h_l167_c6_6d6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_left;
     BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_return_output := BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_return_output;

     -- uint8_1_0[rmii_eth_mac_h_l196_c28_34d1] LATENCY=0
     VAR_uint8_1_0_rmii_eth_mac_h_l196_c28_34d1_return_output := uint8_1_0(
     data_reg);

     -- BIN_OP_EQ[rmii_eth_mac_h_l160_c32_12b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_left;
     BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_return_output := BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l194_c11_14a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_left;
     BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_return_output := BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_return_output;

     -- CONST_SR_2[rmii_eth_mac_h_l218_c18_7451] LATENCY=0
     -- Inputs
     CONST_SR_2_rmii_eth_mac_h_l218_c18_7451_x <= VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_7451_x;
     -- Outputs
     VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_7451_return_output := CONST_SR_2_rmii_eth_mac_h_l218_c18_7451_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l184_c11_f0f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_left;
     BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_return_output := BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_return_output;

     -- CONST_SR_2[rmii_eth_mac_h_l233_c23_6f1b] LATENCY=0
     -- Inputs
     CONST_SR_2_rmii_eth_mac_h_l233_c23_6f1b_x <= VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_6f1b_x;
     -- Outputs
     VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_6f1b_return_output := CONST_SR_2_rmii_eth_mac_h_l233_c23_6f1b_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l173_c11_2675] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_left;
     BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_return_output := BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_return_output;

     -- uint32_1_0[rmii_eth_mac_h_l223_c28_4c17] LATENCY=0
     VAR_uint32_1_0_rmii_eth_mac_h_l223_c28_4c17_return_output := uint32_1_0(
     crc_shift_reg);

     -- BIN_OP_EQ[rmii_eth_mac_h_l158_c31_2944] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944_left;
     BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944_return_output := BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944_return_output;

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_h_l258_l169_DUPLICATE_eb8e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_h_l258_l169_DUPLICATE_eb8e_return_output := VAR_axis_in.valid;

     -- BIN_OP_EQ[rmii_eth_mac_h_l159_c26_004b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b_left;
     BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b_return_output := BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b_return_output;

     -- CONST_SR_4[rmii_eth_mac_h_l251_c12_ce6b] LATENCY=0
     -- Inputs
     CONST_SR_4_rmii_eth_mac_h_l251_c12_ce6b_x <= VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_ce6b_x;
     -- Outputs
     VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_ce6b_return_output := CONST_SR_4_rmii_eth_mac_h_l251_c12_ce6b_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l221_c11_9f27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_left;
     BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_return_output := BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_return_output;

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_rmii_eth_mac_h_l190_l210_DUPLICATE_da5e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_rmii_eth_mac_h_l190_l210_DUPLICATE_da5e_return_output := VAR_axis_in.data.tlast;

     -- CONST_SR_4[rmii_eth_mac_h_l252_c42_f680] LATENCY=0
     -- Inputs
     CONST_SR_4_rmii_eth_mac_h_l252_c42_f680_x <= VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_f680_x;
     -- Outputs
     VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_f680_return_output := CONST_SR_4_rmii_eth_mac_h_l252_c42_f680_return_output;

     -- CONST_SR_0[rmii_eth_mac_h_l251_c42_d3bc] LATENCY=0
     -- Inputs
     CONST_SR_0_rmii_eth_mac_h_l251_c42_d3bc_x <= VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_d3bc_x;
     -- Outputs
     VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_d3bc_return_output := CONST_SR_0_rmii_eth_mac_h_l251_c42_d3bc_return_output;

     -- BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47_left <= VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47_left;
     BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47_right <= VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47_return_output := BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47_return_output;

     -- Submodule level 1
     VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l176_c5_632a_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_2944_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l226_c5_ff31_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_004b_return_output;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_left := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_return_output;
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_12b4_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_return_output;
     VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6d6e_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_2675_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l184_c8_2a42_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l184_c8_2a42_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f0f6_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_14a4_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_return_output;
     VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_return_output;
     VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9f27_return_output;
     VAR_bit_counter_rmii_eth_mac_h_l181_c7_3555 := resize(VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47_return_output, 6);
     VAR_bit_counter_rmii_eth_mac_h_l217_c7_c68c := resize(VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47_return_output, 6);
     VAR_bit_counter_rmii_eth_mac_h_l232_c7_fcce := resize(VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_1d47_return_output, 6);
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_rmii_eth_mac_h_l190_l210_DUPLICATE_da5e_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_rmii_eth_mac_h_l190_l210_DUPLICATE_da5e_return_output;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_1ee8_left := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_h_l258_l169_DUPLICATE_eb8e_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l169_c5_75e2_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_h_l258_l169_DUPLICATE_eb8e_return_output;
     REG_VAR_axis_in_data_reg := VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l209_l257_l189_DUPLICATE_7bd2_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue := VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l209_l257_l189_DUPLICATE_7bd2_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse := VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l209_l257_l189_DUPLICATE_7bd2_return_output;
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_6795_right := VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_d3bc_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse := VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_7451_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_iffalse := VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_6f1b_return_output;
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f_left := VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_ce6b_return_output;
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_9cc2_right := VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_f680_return_output;
     VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue := VAR_uint32_1_0_rmii_eth_mac_h_l223_c28_4c17_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_iffalse := VAR_bit_counter_rmii_eth_mac_h_l181_c7_3555;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse := VAR_bit_counter_rmii_eth_mac_h_l217_c7_c68c;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_iffalse := VAR_bit_counter_rmii_eth_mac_h_l232_c7_fcce;
     -- reset_crc_MUX[rmii_eth_mac_h_l167_c3_2dc7] LATENCY=0
     -- Inputs
     reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond <= VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond;
     reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue <= VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue;
     reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse <= VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse;
     -- Outputs
     VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output := reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output;

     -- state_MUX[rmii_eth_mac_h_l176_c5_632a] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l176_c5_632a_cond <= VAR_state_MUX_rmii_eth_mac_h_l176_c5_632a_cond;
     state_MUX_rmii_eth_mac_h_l176_c5_632a_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l176_c5_632a_iftrue;
     state_MUX_rmii_eth_mac_h_l176_c5_632a_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l176_c5_632a_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l176_c5_632a_return_output := state_MUX_rmii_eth_mac_h_l176_c5_632a_return_output;

     -- BIN_OP_XOR[rmii_eth_mac_h_l251_c35_6795] LATENCY=0
     -- Inputs
     BIN_OP_XOR_rmii_eth_mac_h_l251_c35_6795_left <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_6795_left;
     BIN_OP_XOR_rmii_eth_mac_h_l251_c35_6795_right <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_6795_right;
     -- Outputs
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_6795_return_output := BIN_OP_XOR_rmii_eth_mac_h_l251_c35_6795_return_output;

     -- state_MUX[rmii_eth_mac_h_l169_c5_75e2] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l169_c5_75e2_cond <= VAR_state_MUX_rmii_eth_mac_h_l169_c5_75e2_cond;
     state_MUX_rmii_eth_mac_h_l169_c5_75e2_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l169_c5_75e2_iftrue;
     state_MUX_rmii_eth_mac_h_l169_c5_75e2_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l169_c5_75e2_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l169_c5_75e2_return_output := state_MUX_rmii_eth_mac_h_l169_c5_75e2_return_output;

     -- state_MUX[rmii_eth_mac_h_l226_c5_ff31] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l226_c5_ff31_cond <= VAR_state_MUX_rmii_eth_mac_h_l226_c5_ff31_cond;
     state_MUX_rmii_eth_mac_h_l226_c5_ff31_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l226_c5_ff31_iftrue;
     state_MUX_rmii_eth_mac_h_l226_c5_ff31_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l226_c5_ff31_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l226_c5_ff31_return_output := state_MUX_rmii_eth_mac_h_l226_c5_ff31_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l226_c5_ff31] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_cond;
     bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_return_output := bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_return_output;

     -- crc_shift_reg_MUX[rmii_eth_mac_h_l226_c5_ff31] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_return_output;

     -- o_tx_mac_output_valid_MUX[rmii_eth_mac_h_l221_c8_2bc6] LATENCY=0
     -- Inputs
     o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond <= VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond;
     o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue <= VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue;
     o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse <= VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse;
     -- Outputs
     VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output := o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l176_c5_632a] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_cond;
     bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_return_output := bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_return_output;

     -- BIN_OP_AND[rmii_eth_mac_h_l201_c38_8744] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_left;
     BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_return_output := BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_return_output;

     -- o_tx_mac_output_data_MUX[rmii_eth_mac_h_l221_c8_2bc6] LATENCY=0
     -- Inputs
     o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond <= VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond;
     o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue <= VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue;
     o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse <= VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse;
     -- Outputs
     VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output := o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output;

     -- Submodule level 2
     VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_return_output;
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l203_c7_0abd_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_8744_return_output;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_231a_left := VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_6795_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_632a_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_ff31_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_ff31_return_output;
     VAR_crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_cond := VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue := VAR_state_MUX_rmii_eth_mac_h_l169_c5_75e2_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue := VAR_state_MUX_rmii_eth_mac_h_l176_c5_632a_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue := VAR_state_MUX_rmii_eth_mac_h_l226_c5_ff31_return_output;
     -- last_byte_reg_MUX[rmii_eth_mac_h_l203_c7_0abd] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l221_c8_2bc6] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond;
     bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output := bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output;

     -- o_tx_mac_input_ready_MUX[rmii_eth_mac_h_l203_c7_0abd] LATENCY=0
     -- Inputs
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_cond <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_cond;
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue;
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse;
     -- Outputs
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output := o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output;

     -- state_MUX[rmii_eth_mac_h_l221_c8_2bc6] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond <= VAR_state_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond;
     state_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue;
     state_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output := state_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output;

     -- BIN_OP_AND[rmii_eth_mac_h_l251_c35_231a] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l251_c35_231a_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_231a_left;
     BIN_OP_AND_rmii_eth_mac_h_l251_c35_231a_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_231a_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_231a_return_output := BIN_OP_AND_rmii_eth_mac_h_l251_c35_231a_return_output;

     -- state_MUX[rmii_eth_mac_h_l203_c7_0abd] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l203_c7_0abd_cond <= VAR_state_MUX_rmii_eth_mac_h_l203_c7_0abd_cond;
     state_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue;
     state_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output := state_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output;

     -- data_reg_MUX[rmii_eth_mac_h_l203_c7_0abd] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_cond;
     data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output := data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output;

     -- o_FALSE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb[rmii_eth_mac_h_l194_c8_d7b2] LATENCY=0
     VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb_rmii_eth_mac_h_l194_c8_d7b2_return_output := CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb(
     to_unsigned(0, 1),
     VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output,
     VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output);

     -- bit_counter_MUX[rmii_eth_mac_h_l203_c7_0abd] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_cond;
     bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output := bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output;

     -- crc_shift_reg_MUX[rmii_eth_mac_h_l221_c8_2bc6] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output;

     -- Submodule level 3
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_var_dim_0 := resize(VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_231a_return_output, 4);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue := VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse := VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb_rmii_eth_mac_h_l194_c8_d7b2_return_output;
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue := VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue := VAR_state_MUX_rmii_eth_mac_h_l203_c7_0abd_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse := VAR_state_MUX_rmii_eth_mac_h_l221_c8_2bc6_return_output;
     -- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60[rmii_eth_mac_h_l251_c24_77cd] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_0 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_0;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_1 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_1;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_2 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_2;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_3 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_3;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_4 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_4;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_5 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_5;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_6 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_6;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_7 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_7;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_8 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_8;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_9 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_9;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_10 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_10;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_11 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_11;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_12 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_12;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_13 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_13;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_14 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_14;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_15 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_ref_toks_15;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_var_dim_0 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_return_output := VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_return_output;

     -- state_MUX[rmii_eth_mac_h_l202_c5_a4b0] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond <= VAR_state_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond;
     state_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue;
     state_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output := state_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output;

     -- last_byte_reg_MUX[rmii_eth_mac_h_l202_c5_a4b0] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output;

     -- data_reg_MUX[rmii_eth_mac_h_l202_c5_a4b0] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond;
     data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output := data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output;

     -- o_tx_mac_input_ready_MUX[rmii_eth_mac_h_l202_c5_a4b0] LATENCY=0
     -- Inputs
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond;
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue;
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse;
     -- Outputs
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output := o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output;

     -- crc_shift_reg_MUX[rmii_eth_mac_h_l194_c8_d7b2] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l202_c5_a4b0] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_cond;
     bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output := bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output;

     -- Submodule level 4
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f_right := VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_77cd_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue := VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue := VAR_state_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output;
     -- data_reg_MUX[rmii_eth_mac_h_l194_c8_d7b2] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond;
     data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output := data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output;

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724[rmii_eth_mac_h_l194_c8_d7b2] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l194_c8_d7b2_return_output := CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724(
     VAR_uint8_1_0_rmii_eth_mac_h_l196_c28_34d1_return_output,
     to_unsigned(1, 1),
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_a4b0_return_output);

     -- state_MUX[rmii_eth_mac_h_l194_c8_d7b2] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond <= VAR_state_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond;
     state_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue;
     state_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output := state_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output;

     -- BIN_OP_XOR[rmii_eth_mac_h_l251_c12_5f1f] LATENCY=0
     -- Inputs
     BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f_left <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f_left;
     BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f_right <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f_right;
     -- Outputs
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f_return_output := BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f_return_output;

     -- crc_shift_reg_MUX[rmii_eth_mac_h_l184_c8_2a42] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l194_c8_d7b2] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond;
     bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output := bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output;

     -- last_byte_reg_MUX[rmii_eth_mac_h_l194_c8_d7b2] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output;

     -- Submodule level 5
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_9cc2_left := VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f_return_output;
     VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_367f_x := VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_5f1f_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse := VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l194_c8_d7b2_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse := VAR_state_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output;
     -- bit_counter_MUX[rmii_eth_mac_h_l184_c8_2a42] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_cond;
     bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output := bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output;

     -- data_reg_MUX[rmii_eth_mac_h_l184_c8_2a42] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_cond;
     data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output := data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output;

     -- o_MUX[rmii_eth_mac_h_l194_c8_d7b2] LATENCY=0
     -- Inputs
     o_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond <= VAR_o_MUX_rmii_eth_mac_h_l194_c8_d7b2_cond;
     o_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue <= VAR_o_MUX_rmii_eth_mac_h_l194_c8_d7b2_iftrue;
     o_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse <= VAR_o_MUX_rmii_eth_mac_h_l194_c8_d7b2_iffalse;
     -- Outputs
     VAR_o_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output := o_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output;

     -- last_byte_reg_MUX[rmii_eth_mac_h_l184_c8_2a42] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output;

     -- CONST_SR_4[rmii_eth_mac_h_l252_c12_367f] LATENCY=0
     -- Inputs
     CONST_SR_4_rmii_eth_mac_h_l252_c12_367f_x <= VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_367f_x;
     -- Outputs
     VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_367f_return_output := CONST_SR_4_rmii_eth_mac_h_l252_c12_367f_return_output;

     -- crc_shift_reg_MUX[rmii_eth_mac_h_l173_c8_3f4f] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output;

     -- BIN_OP_XOR[rmii_eth_mac_h_l252_c35_9cc2] LATENCY=0
     -- Inputs
     BIN_OP_XOR_rmii_eth_mac_h_l252_c35_9cc2_left <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_9cc2_left;
     BIN_OP_XOR_rmii_eth_mac_h_l252_c35_9cc2_right <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_9cc2_right;
     -- Outputs
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_9cc2_return_output := BIN_OP_XOR_rmii_eth_mac_h_l252_c35_9cc2_return_output;

     -- state_MUX[rmii_eth_mac_h_l184_c8_2a42] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l184_c8_2a42_cond <= VAR_state_MUX_rmii_eth_mac_h_l184_c8_2a42_cond;
     state_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue;
     state_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output := state_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output;

     -- Submodule level 6
     VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_b749_left := VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_9cc2_return_output;
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_7261_left := VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_367f_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse := VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse := VAR_o_MUX_rmii_eth_mac_h_l194_c8_d7b2_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse := VAR_state_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output;
     -- data_reg_MUX[rmii_eth_mac_h_l173_c8_3f4f] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond;
     data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output := data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output;

     -- last_byte_reg_MUX[rmii_eth_mac_h_l173_c8_3f4f] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output;

     -- crc_shift_reg_MUX[rmii_eth_mac_h_l167_c3_2dc7] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output;

     -- BIN_OP_AND[rmii_eth_mac_h_l252_c35_b749] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l252_c35_b749_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_b749_left;
     BIN_OP_AND_rmii_eth_mac_h_l252_c35_b749_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_b749_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_b749_return_output := BIN_OP_AND_rmii_eth_mac_h_l252_c35_b749_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l173_c8_3f4f] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond;
     bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output := bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output;

     -- o_MUX[rmii_eth_mac_h_l184_c8_2a42] LATENCY=0
     -- Inputs
     o_MUX_rmii_eth_mac_h_l184_c8_2a42_cond <= VAR_o_MUX_rmii_eth_mac_h_l184_c8_2a42_cond;
     o_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue <= VAR_o_MUX_rmii_eth_mac_h_l184_c8_2a42_iftrue;
     o_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse <= VAR_o_MUX_rmii_eth_mac_h_l184_c8_2a42_iffalse;
     -- Outputs
     VAR_o_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output := o_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output;

     -- state_MUX[rmii_eth_mac_h_l173_c8_3f4f] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond <= VAR_state_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond;
     state_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue;
     state_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output := state_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output;

     -- Submodule level 7
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_var_dim_0 := resize(VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_b749_return_output, 4);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output;
     REG_VAR_crc_shift_reg := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse := VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse := VAR_o_MUX_rmii_eth_mac_h_l184_c8_2a42_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse := VAR_state_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output;
     -- state_MUX[rmii_eth_mac_h_l167_c3_2dc7] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond <= VAR_state_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond;
     state_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue;
     state_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output := state_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output;

     -- o_MUX[rmii_eth_mac_h_l173_c8_3f4f] LATENCY=0
     -- Inputs
     o_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond <= VAR_o_MUX_rmii_eth_mac_h_l173_c8_3f4f_cond;
     o_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue <= VAR_o_MUX_rmii_eth_mac_h_l173_c8_3f4f_iftrue;
     o_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse <= VAR_o_MUX_rmii_eth_mac_h_l173_c8_3f4f_iffalse;
     -- Outputs
     VAR_o_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output := o_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output;

     -- last_byte_reg_MUX[rmii_eth_mac_h_l167_c3_2dc7] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output;

     -- data_reg_MUX[rmii_eth_mac_h_l167_c3_2dc7] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond;
     data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output := data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output;

     -- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60[rmii_eth_mac_h_l252_c24_f626] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_0 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_0;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_1 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_1;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_2 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_2;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_3 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_3;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_4 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_4;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_5 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_5;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_6 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_6;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_7 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_7;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_8 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_8;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_9 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_9;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_10 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_10;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_11 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_11;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_12 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_12;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_13 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_13;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_14 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_14;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_15 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_ref_toks_15;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_var_dim_0 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_return_output := VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l167_c3_2dc7] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond;
     bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output := bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output;

     -- Submodule level 8
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_7261_right := VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_f626_return_output;
     REG_VAR_bit_counter := VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output;
     REG_VAR_data_reg := VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output;
     REG_VAR_last_byte_reg := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse := VAR_o_MUX_rmii_eth_mac_h_l173_c8_3f4f_return_output;
     REG_VAR_state := VAR_state_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output;
     -- BIN_OP_XOR[rmii_eth_mac_h_l252_c12_7261] LATENCY=0
     -- Inputs
     BIN_OP_XOR_rmii_eth_mac_h_l252_c12_7261_left <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_7261_left;
     BIN_OP_XOR_rmii_eth_mac_h_l252_c12_7261_right <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_7261_right;
     -- Outputs
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_7261_return_output := BIN_OP_XOR_rmii_eth_mac_h_l252_c12_7261_return_output;

     -- o_MUX[rmii_eth_mac_h_l167_c3_2dc7] LATENCY=0
     -- Inputs
     o_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond <= VAR_o_MUX_rmii_eth_mac_h_l167_c3_2dc7_cond;
     o_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue <= VAR_o_MUX_rmii_eth_mac_h_l167_c3_2dc7_iftrue;
     o_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse <= VAR_o_MUX_rmii_eth_mac_h_l167_c3_2dc7_iffalse;
     -- Outputs
     VAR_o_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output := o_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output;

     -- Submodule level 9
     VAR_crc_MUX_rmii_eth_mac_h_l250_c3_e319_iftrue := VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_7261_return_output;
     VAR_return_output := VAR_o_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output;
     -- crc_MUX[rmii_eth_mac_h_l250_c3_e319] LATENCY=0
     -- Inputs
     crc_MUX_rmii_eth_mac_h_l250_c3_e319_cond <= VAR_crc_MUX_rmii_eth_mac_h_l250_c3_e319_cond;
     crc_MUX_rmii_eth_mac_h_l250_c3_e319_iftrue <= VAR_crc_MUX_rmii_eth_mac_h_l250_c3_e319_iftrue;
     crc_MUX_rmii_eth_mac_h_l250_c3_e319_iffalse <= VAR_crc_MUX_rmii_eth_mac_h_l250_c3_e319_iffalse;
     -- Outputs
     VAR_crc_MUX_rmii_eth_mac_h_l250_c3_e319_return_output := crc_MUX_rmii_eth_mac_h_l250_c3_e319_return_output;

     -- CONST_REF_RD_uint1_t_rmii_tx_mac_t_tx_mac_input_ready_d41d[rmii_eth_mac_h_l258_c44_3db6] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_rmii_tx_mac_t_tx_mac_input_ready_d41d_rmii_eth_mac_h_l258_c44_3db6_return_output := VAR_o_MUX_rmii_eth_mac_h_l167_c3_2dc7_return_output.tx_mac_input_ready;

     -- Submodule level 10
     VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_1ee8_right := VAR_CONST_REF_RD_uint1_t_rmii_tx_mac_t_tx_mac_input_ready_d41d_rmii_eth_mac_h_l258_c44_3db6_return_output;
     VAR_crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_iffalse := VAR_crc_MUX_rmii_eth_mac_h_l250_c3_e319_return_output;
     -- crc_MUX[rmii_eth_mac_h_l254_c3_0a9a] LATENCY=0
     -- Inputs
     crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_cond <= VAR_crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_cond;
     crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_iftrue <= VAR_crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_iftrue;
     crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_iffalse <= VAR_crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_iffalse;
     -- Outputs
     VAR_crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_return_output := crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_return_output;

     -- BIN_OP_AND[rmii_eth_mac_h_l258_c28_1ee8] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l258_c28_1ee8_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_1ee8_left;
     BIN_OP_AND_rmii_eth_mac_h_l258_c28_1ee8_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_1ee8_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_1ee8_return_output := BIN_OP_AND_rmii_eth_mac_h_l258_c28_1ee8_return_output;

     -- Submodule level 11
     REG_VAR_axis_in_data_reg_valid := VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_1ee8_return_output;
     REG_VAR_crc := VAR_crc_MUX_rmii_eth_mac_h_l254_c3_0a9a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_state <= REG_VAR_state;
REG_COMB_bit_counter <= REG_VAR_bit_counter;
REG_COMB_crc <= REG_VAR_crc;
REG_COMB_crc_shift_reg <= REG_VAR_crc_shift_reg;
REG_COMB_data_reg <= REG_VAR_data_reg;
REG_COMB_last_byte_reg <= REG_VAR_last_byte_reg;
REG_COMB_axis_in_data_reg <= REG_VAR_axis_in_data_reg;
REG_COMB_axis_in_data_reg_valid <= REG_VAR_axis_in_data_reg_valid;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if clk_en_internal='1' then
     state <= REG_COMB_state;
     bit_counter <= REG_COMB_bit_counter;
     crc <= REG_COMB_crc;
     crc_shift_reg <= REG_COMB_crc_shift_reg;
     data_reg <= REG_COMB_data_reg;
     last_byte_reg <= REG_COMB_last_byte_reg;
     axis_in_data_reg <= REG_COMB_axis_in_data_reg;
     axis_in_data_reg_valid <= REG_COMB_axis_in_data_reg_valid;
 end if;
 end if;
end process;

end arch;
