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
-- BIN_OP_EQ[rmii_eth_mac_h_l158_c31_8c24]
signal BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24_left : unsigned(5 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24_right : unsigned(5 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l159_c26_33fa]
signal BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa_left : unsigned(5 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa_right : unsigned(4 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l160_c32_1dc4]
signal BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_left : unsigned(5 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l167_c6_6409]
signal BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_return_output : unsigned(0 downto 0);

-- reset_crc_MUX[rmii_eth_mac_h_l167_c3_e0cd]
signal reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond : unsigned(0 downto 0);
signal reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue : unsigned(0 downto 0);
signal reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse : unsigned(0 downto 0);
signal reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output : unsigned(0 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l167_c3_e0cd]
signal data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output : unsigned(7 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l167_c3_e0cd]
signal bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output : unsigned(5 downto 0);

-- crc_shift_reg_MUX[rmii_eth_mac_h_l167_c3_e0cd]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output : unsigned(31 downto 0);

-- o_MUX[rmii_eth_mac_h_l167_c3_e0cd]
signal o_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond : unsigned(0 downto 0);
signal o_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output : rmii_tx_mac_t;

-- last_byte_reg_MUX[rmii_eth_mac_h_l167_c3_e0cd]
signal last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l167_c3_e0cd]
signal state_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output : unsigned(2 downto 0);

-- state_MUX[rmii_eth_mac_h_l169_c5_1b5c]
signal state_MUX_rmii_eth_mac_h_l169_c5_1b5c_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l169_c5_1b5c_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l169_c5_1b5c_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l169_c5_1b5c_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l173_c11_7083]
signal BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_return_output : unsigned(0 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l173_c8_948e]
signal data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_return_output : unsigned(7 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l173_c8_948e]
signal bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_return_output : unsigned(5 downto 0);

-- crc_shift_reg_MUX[rmii_eth_mac_h_l173_c8_948e]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_return_output : unsigned(31 downto 0);

-- o_MUX[rmii_eth_mac_h_l173_c8_948e]
signal o_MUX_rmii_eth_mac_h_l173_c8_948e_cond : unsigned(0 downto 0);
signal o_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l173_c8_948e_return_output : rmii_tx_mac_t;

-- last_byte_reg_MUX[rmii_eth_mac_h_l173_c8_948e]
signal last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l173_c8_948e]
signal state_MUX_rmii_eth_mac_h_l173_c8_948e_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l173_c8_948e_return_output : unsigned(2 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l176_c5_752f]
signal bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_return_output : unsigned(5 downto 0);

-- state_MUX[rmii_eth_mac_h_l176_c5_752f]
signal state_MUX_rmii_eth_mac_h_l176_c5_752f_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l176_c5_752f_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l176_c5_752f_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l176_c5_752f_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l184_c11_99c9]
signal BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_return_output : unsigned(0 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l184_c8_da19]
signal data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_return_output : unsigned(7 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l184_c8_da19]
signal bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_return_output : unsigned(5 downto 0);

-- crc_shift_reg_MUX[rmii_eth_mac_h_l184_c8_da19]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_return_output : unsigned(31 downto 0);

-- o_MUX[rmii_eth_mac_h_l184_c8_da19]
signal o_MUX_rmii_eth_mac_h_l184_c8_da19_cond : unsigned(0 downto 0);
signal o_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l184_c8_da19_return_output : rmii_tx_mac_t;

-- last_byte_reg_MUX[rmii_eth_mac_h_l184_c8_da19]
signal last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l184_c8_da19]
signal state_MUX_rmii_eth_mac_h_l184_c8_da19_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l184_c8_da19_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l194_c11_0f63]
signal BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_return_output : unsigned(0 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l194_c8_575b]
signal data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_return_output : unsigned(7 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l194_c8_575b]
signal bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_return_output : unsigned(5 downto 0);

-- crc_shift_reg_MUX[rmii_eth_mac_h_l194_c8_575b]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_return_output : unsigned(31 downto 0);

-- o_MUX[rmii_eth_mac_h_l194_c8_575b]
signal o_MUX_rmii_eth_mac_h_l194_c8_575b_cond : unsigned(0 downto 0);
signal o_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l194_c8_575b_return_output : rmii_tx_mac_t;

-- last_byte_reg_MUX[rmii_eth_mac_h_l194_c8_575b]
signal last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l194_c8_575b]
signal state_MUX_rmii_eth_mac_h_l194_c8_575b_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l194_c8_575b_return_output : unsigned(2 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l201_c38_891e]
signal BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_left : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_right : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_return_output : unsigned(0 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l202_c5_5b54]
signal data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output : unsigned(7 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l202_c5_5b54]
signal bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output : unsigned(5 downto 0);

-- o_tx_mac_input_ready_MUX[rmii_eth_mac_h_l202_c5_5b54]
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_cond : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output : unsigned(0 downto 0);

-- last_byte_reg_MUX[rmii_eth_mac_h_l202_c5_5b54]
signal last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l202_c5_5b54]
signal state_MUX_rmii_eth_mac_h_l202_c5_5b54_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output : unsigned(2 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l203_c7_efba]
signal data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_return_output : unsigned(7 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l203_c7_efba]
signal bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_return_output : unsigned(5 downto 0);

-- o_tx_mac_input_ready_MUX[rmii_eth_mac_h_l203_c7_efba]
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_cond : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_return_output : unsigned(0 downto 0);

-- last_byte_reg_MUX[rmii_eth_mac_h_l203_c7_efba]
signal last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l203_c7_efba]
signal state_MUX_rmii_eth_mac_h_l203_c7_efba_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l203_c7_efba_return_output : unsigned(2 downto 0);

-- CONST_SR_2[rmii_eth_mac_h_l218_c18_1de3]
signal CONST_SR_2_rmii_eth_mac_h_l218_c18_1de3_x : unsigned(7 downto 0);
signal CONST_SR_2_rmii_eth_mac_h_l218_c18_1de3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l221_c11_55ef]
signal BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l221_c8_2420]
signal bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_return_output : unsigned(5 downto 0);

-- crc_shift_reg_MUX[rmii_eth_mac_h_l221_c8_2420]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_return_output : unsigned(31 downto 0);

-- o_tx_mac_output_data_MUX[rmii_eth_mac_h_l221_c8_2420]
signal o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_cond : unsigned(0 downto 0);
signal o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue : unsigned(1 downto 0);
signal o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse : unsigned(1 downto 0);
signal o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_return_output : unsigned(1 downto 0);

-- o_tx_mac_output_valid_MUX[rmii_eth_mac_h_l221_c8_2420]
signal o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_cond : unsigned(0 downto 0);
signal o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue : unsigned(0 downto 0);
signal o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse : unsigned(0 downto 0);
signal o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l221_c8_2420]
signal state_MUX_rmii_eth_mac_h_l221_c8_2420_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l221_c8_2420_return_output : unsigned(2 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l226_c5_e484]
signal bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_return_output : unsigned(5 downto 0);

-- crc_shift_reg_MUX[rmii_eth_mac_h_l226_c5_e484]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_return_output : unsigned(31 downto 0);

-- state_MUX[rmii_eth_mac_h_l226_c5_e484]
signal state_MUX_rmii_eth_mac_h_l226_c5_e484_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l226_c5_e484_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l226_c5_e484_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l226_c5_e484_return_output : unsigned(2 downto 0);

-- CONST_SR_2[rmii_eth_mac_h_l233_c23_fafe]
signal CONST_SR_2_rmii_eth_mac_h_l233_c23_fafe_x : unsigned(31 downto 0);
signal CONST_SR_2_rmii_eth_mac_h_l233_c23_fafe_return_output : unsigned(31 downto 0);

-- crc_MUX[rmii_eth_mac_h_l250_c3_7dab]
signal crc_MUX_rmii_eth_mac_h_l250_c3_7dab_cond : unsigned(0 downto 0);
signal crc_MUX_rmii_eth_mac_h_l250_c3_7dab_iftrue : unsigned(31 downto 0);
signal crc_MUX_rmii_eth_mac_h_l250_c3_7dab_iffalse : unsigned(31 downto 0);
signal crc_MUX_rmii_eth_mac_h_l250_c3_7dab_return_output : unsigned(31 downto 0);

-- CONST_SR_4[rmii_eth_mac_h_l251_c12_fe65]
signal CONST_SR_4_rmii_eth_mac_h_l251_c12_fe65_x : unsigned(31 downto 0);
signal CONST_SR_4_rmii_eth_mac_h_l251_c12_fe65_return_output : unsigned(31 downto 0);

-- CONST_SR_0[rmii_eth_mac_h_l251_c42_9293]
signal CONST_SR_0_rmii_eth_mac_h_l251_c42_9293_x : unsigned(7 downto 0);
signal CONST_SR_0_rmii_eth_mac_h_l251_c42_9293_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[rmii_eth_mac_h_l251_c35_bc1d]
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c35_bc1d_left : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c35_bc1d_right : unsigned(7 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c35_bc1d_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l251_c35_4698]
signal BIN_OP_AND_rmii_eth_mac_h_l251_c35_4698_left : unsigned(31 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l251_c35_4698_right : unsigned(7 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l251_c35_4698_return_output : unsigned(31 downto 0);

-- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60[rmii_eth_mac_h_l251_c24_8404]
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_0 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_1 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_2 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_3 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_4 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_5 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_6 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_7 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_8 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_9 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_10 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_11 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_12 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_13 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_14 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_15 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_return_output : unsigned(31 downto 0);

-- BIN_OP_XOR[rmii_eth_mac_h_l251_c12_fa44]
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44_left : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44_right : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44_return_output : unsigned(31 downto 0);

-- CONST_SR_4[rmii_eth_mac_h_l252_c12_d3ef]
signal CONST_SR_4_rmii_eth_mac_h_l252_c12_d3ef_x : unsigned(31 downto 0);
signal CONST_SR_4_rmii_eth_mac_h_l252_c12_d3ef_return_output : unsigned(31 downto 0);

-- CONST_SR_4[rmii_eth_mac_h_l252_c42_e697]
signal CONST_SR_4_rmii_eth_mac_h_l252_c42_e697_x : unsigned(7 downto 0);
signal CONST_SR_4_rmii_eth_mac_h_l252_c42_e697_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[rmii_eth_mac_h_l252_c35_8e1d]
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c35_8e1d_left : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c35_8e1d_right : unsigned(7 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c35_8e1d_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l252_c35_681c]
signal BIN_OP_AND_rmii_eth_mac_h_l252_c35_681c_left : unsigned(31 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l252_c35_681c_right : unsigned(7 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l252_c35_681c_return_output : unsigned(31 downto 0);

-- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60[rmii_eth_mac_h_l252_c24_5718]
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_0 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_1 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_2 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_3 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_4 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_5 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_6 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_7 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_8 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_9 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_10 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_11 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_12 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_13 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_14 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_15 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_return_output : unsigned(31 downto 0);

-- BIN_OP_XOR[rmii_eth_mac_h_l252_c12_9470]
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c12_9470_left : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c12_9470_right : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c12_9470_return_output : unsigned(31 downto 0);

-- crc_MUX[rmii_eth_mac_h_l254_c3_a0a9]
signal crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_cond : unsigned(0 downto 0);
signal crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_iftrue : unsigned(31 downto 0);
signal crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_iffalse : unsigned(31 downto 0);
signal crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l258_c28_ceea]
signal BIN_OP_AND_rmii_eth_mac_h_l258_c28_ceea_left : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l258_c28_ceea_right : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l258_c28_ceea_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2
signal BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2_return_output : unsigned(6 downto 0);

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
-- BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24 : entity work.BIN_OP_EQ_uint6_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24_left,
BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24_right,
BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa : entity work.BIN_OP_EQ_uint6_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa_left,
BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa_right,
BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4 : entity work.BIN_OP_EQ_uint6_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_left,
BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_right,
BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_left,
BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_right,
BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_return_output);

-- reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd : 0 clocks latency
reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond,
reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue,
reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse,
reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond,
data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue,
data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse,
data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond,
bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output);

-- o_MUX_rmii_eth_mac_h_l167_c3_e0cd : 0 clocks latency
o_MUX_rmii_eth_mac_h_l167_c3_e0cd : entity work.MUX_uint1_t_rmii_tx_mac_t_rmii_tx_mac_t_0CLK_de264c78 port map (
o_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond,
o_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue,
o_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse,
o_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output);

-- state_MUX_rmii_eth_mac_h_l167_c3_e0cd : 0 clocks latency
state_MUX_rmii_eth_mac_h_l167_c3_e0cd : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond,
state_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue,
state_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse,
state_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output);

-- state_MUX_rmii_eth_mac_h_l169_c5_1b5c : 0 clocks latency
state_MUX_rmii_eth_mac_h_l169_c5_1b5c : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l169_c5_1b5c_cond,
state_MUX_rmii_eth_mac_h_l169_c5_1b5c_iftrue,
state_MUX_rmii_eth_mac_h_l169_c5_1b5c_iffalse,
state_MUX_rmii_eth_mac_h_l169_c5_1b5c_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_left,
BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_right,
BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l173_c8_948e : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l173_c8_948e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_cond,
data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue,
data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse,
data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_cond,
bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_return_output);

-- o_MUX_rmii_eth_mac_h_l173_c8_948e : 0 clocks latency
o_MUX_rmii_eth_mac_h_l173_c8_948e : entity work.MUX_uint1_t_rmii_tx_mac_t_rmii_tx_mac_t_0CLK_de264c78 port map (
o_MUX_rmii_eth_mac_h_l173_c8_948e_cond,
o_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue,
o_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse,
o_MUX_rmii_eth_mac_h_l173_c8_948e_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_return_output);

-- state_MUX_rmii_eth_mac_h_l173_c8_948e : 0 clocks latency
state_MUX_rmii_eth_mac_h_l173_c8_948e : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l173_c8_948e_cond,
state_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue,
state_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse,
state_MUX_rmii_eth_mac_h_l173_c8_948e_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_cond,
bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_return_output);

-- state_MUX_rmii_eth_mac_h_l176_c5_752f : 0 clocks latency
state_MUX_rmii_eth_mac_h_l176_c5_752f : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l176_c5_752f_cond,
state_MUX_rmii_eth_mac_h_l176_c5_752f_iftrue,
state_MUX_rmii_eth_mac_h_l176_c5_752f_iffalse,
state_MUX_rmii_eth_mac_h_l176_c5_752f_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_left,
BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_right,
BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l184_c8_da19 : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l184_c8_da19 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_cond,
data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue,
data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse,
data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_cond,
bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19 : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_return_output);

-- o_MUX_rmii_eth_mac_h_l184_c8_da19 : 0 clocks latency
o_MUX_rmii_eth_mac_h_l184_c8_da19 : entity work.MUX_uint1_t_rmii_tx_mac_t_rmii_tx_mac_t_0CLK_de264c78 port map (
o_MUX_rmii_eth_mac_h_l184_c8_da19_cond,
o_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue,
o_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse,
o_MUX_rmii_eth_mac_h_l184_c8_da19_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19 : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_return_output);

-- state_MUX_rmii_eth_mac_h_l184_c8_da19 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l184_c8_da19 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l184_c8_da19_cond,
state_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue,
state_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse,
state_MUX_rmii_eth_mac_h_l184_c8_da19_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_left,
BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_right,
BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l194_c8_575b : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l194_c8_575b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_cond,
data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue,
data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse,
data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_cond,
bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_return_output);

-- o_MUX_rmii_eth_mac_h_l194_c8_575b : 0 clocks latency
o_MUX_rmii_eth_mac_h_l194_c8_575b : entity work.MUX_uint1_t_rmii_tx_mac_t_rmii_tx_mac_t_0CLK_de264c78 port map (
o_MUX_rmii_eth_mac_h_l194_c8_575b_cond,
o_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue,
o_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse,
o_MUX_rmii_eth_mac_h_l194_c8_575b_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_return_output);

-- state_MUX_rmii_eth_mac_h_l194_c8_575b : 0 clocks latency
state_MUX_rmii_eth_mac_h_l194_c8_575b : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l194_c8_575b_cond,
state_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue,
state_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse,
state_MUX_rmii_eth_mac_h_l194_c8_575b_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_left,
BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_right,
BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54 : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_cond,
data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue,
data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse,
data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_cond,
bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output);

-- o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54 : 0 clocks latency
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_cond,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54 : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output);

-- state_MUX_rmii_eth_mac_h_l202_c5_5b54 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l202_c5_5b54 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l202_c5_5b54_cond,
state_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue,
state_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse,
state_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l203_c7_efba : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l203_c7_efba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_cond,
data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue,
data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse,
data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_cond,
bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_return_output);

-- o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba : 0 clocks latency
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_cond,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_return_output);

-- state_MUX_rmii_eth_mac_h_l203_c7_efba : 0 clocks latency
state_MUX_rmii_eth_mac_h_l203_c7_efba : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l203_c7_efba_cond,
state_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue,
state_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse,
state_MUX_rmii_eth_mac_h_l203_c7_efba_return_output);

-- CONST_SR_2_rmii_eth_mac_h_l218_c18_1de3 : 0 clocks latency
CONST_SR_2_rmii_eth_mac_h_l218_c18_1de3 : entity work.CONST_SR_2_uint8_t_0CLK_de264c78 port map (
CONST_SR_2_rmii_eth_mac_h_l218_c18_1de3_x,
CONST_SR_2_rmii_eth_mac_h_l218_c18_1de3_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_left,
BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_right,
BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_cond,
bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420 : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_return_output);

-- o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420 : 0 clocks latency
o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_cond,
o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue,
o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse,
o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_return_output);

-- o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420 : 0 clocks latency
o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_cond,
o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue,
o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse,
o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_return_output);

-- state_MUX_rmii_eth_mac_h_l221_c8_2420 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l221_c8_2420 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l221_c8_2420_cond,
state_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue,
state_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse,
state_MUX_rmii_eth_mac_h_l221_c8_2420_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_cond,
bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484 : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_return_output);

-- state_MUX_rmii_eth_mac_h_l226_c5_e484 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l226_c5_e484 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l226_c5_e484_cond,
state_MUX_rmii_eth_mac_h_l226_c5_e484_iftrue,
state_MUX_rmii_eth_mac_h_l226_c5_e484_iffalse,
state_MUX_rmii_eth_mac_h_l226_c5_e484_return_output);

-- CONST_SR_2_rmii_eth_mac_h_l233_c23_fafe : 0 clocks latency
CONST_SR_2_rmii_eth_mac_h_l233_c23_fafe : entity work.CONST_SR_2_uint32_t_0CLK_de264c78 port map (
CONST_SR_2_rmii_eth_mac_h_l233_c23_fafe_x,
CONST_SR_2_rmii_eth_mac_h_l233_c23_fafe_return_output);

-- crc_MUX_rmii_eth_mac_h_l250_c3_7dab : 0 clocks latency
crc_MUX_rmii_eth_mac_h_l250_c3_7dab : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_MUX_rmii_eth_mac_h_l250_c3_7dab_cond,
crc_MUX_rmii_eth_mac_h_l250_c3_7dab_iftrue,
crc_MUX_rmii_eth_mac_h_l250_c3_7dab_iffalse,
crc_MUX_rmii_eth_mac_h_l250_c3_7dab_return_output);

-- CONST_SR_4_rmii_eth_mac_h_l251_c12_fe65 : 0 clocks latency
CONST_SR_4_rmii_eth_mac_h_l251_c12_fe65 : entity work.CONST_SR_4_uint32_t_0CLK_de264c78 port map (
CONST_SR_4_rmii_eth_mac_h_l251_c12_fe65_x,
CONST_SR_4_rmii_eth_mac_h_l251_c12_fe65_return_output);

-- CONST_SR_0_rmii_eth_mac_h_l251_c42_9293 : 0 clocks latency
CONST_SR_0_rmii_eth_mac_h_l251_c42_9293 : entity work.CONST_SR_0_uint8_t_0CLK_de264c78 port map (
CONST_SR_0_rmii_eth_mac_h_l251_c42_9293_x,
CONST_SR_0_rmii_eth_mac_h_l251_c42_9293_return_output);

-- BIN_OP_XOR_rmii_eth_mac_h_l251_c35_bc1d : 0 clocks latency
BIN_OP_XOR_rmii_eth_mac_h_l251_c35_bc1d : entity work.BIN_OP_XOR_uint32_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_rmii_eth_mac_h_l251_c35_bc1d_left,
BIN_OP_XOR_rmii_eth_mac_h_l251_c35_bc1d_right,
BIN_OP_XOR_rmii_eth_mac_h_l251_c35_bc1d_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l251_c35_4698 : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l251_c35_4698 : entity work.BIN_OP_AND_uint32_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l251_c35_4698_left,
BIN_OP_AND_rmii_eth_mac_h_l251_c35_4698_right,
BIN_OP_AND_rmii_eth_mac_h_l251_c35_4698_return_output);

-- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404 : 0 clocks latency
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404 : entity work.VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_0CLK_8bf83e3e port map (
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_0,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_1,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_2,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_3,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_4,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_5,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_6,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_7,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_8,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_9,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_10,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_11,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_12,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_13,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_14,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_15,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_var_dim_0,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_return_output);

-- BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44 : 0 clocks latency
BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44 : entity work.BIN_OP_XOR_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44_left,
BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44_right,
BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44_return_output);

-- CONST_SR_4_rmii_eth_mac_h_l252_c12_d3ef : 0 clocks latency
CONST_SR_4_rmii_eth_mac_h_l252_c12_d3ef : entity work.CONST_SR_4_uint32_t_0CLK_de264c78 port map (
CONST_SR_4_rmii_eth_mac_h_l252_c12_d3ef_x,
CONST_SR_4_rmii_eth_mac_h_l252_c12_d3ef_return_output);

-- CONST_SR_4_rmii_eth_mac_h_l252_c42_e697 : 0 clocks latency
CONST_SR_4_rmii_eth_mac_h_l252_c42_e697 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_rmii_eth_mac_h_l252_c42_e697_x,
CONST_SR_4_rmii_eth_mac_h_l252_c42_e697_return_output);

-- BIN_OP_XOR_rmii_eth_mac_h_l252_c35_8e1d : 0 clocks latency
BIN_OP_XOR_rmii_eth_mac_h_l252_c35_8e1d : entity work.BIN_OP_XOR_uint32_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_rmii_eth_mac_h_l252_c35_8e1d_left,
BIN_OP_XOR_rmii_eth_mac_h_l252_c35_8e1d_right,
BIN_OP_XOR_rmii_eth_mac_h_l252_c35_8e1d_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l252_c35_681c : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l252_c35_681c : entity work.BIN_OP_AND_uint32_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l252_c35_681c_left,
BIN_OP_AND_rmii_eth_mac_h_l252_c35_681c_right,
BIN_OP_AND_rmii_eth_mac_h_l252_c35_681c_return_output);

-- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718 : 0 clocks latency
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718 : entity work.VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_0CLK_8bf83e3e port map (
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_0,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_1,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_2,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_3,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_4,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_5,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_6,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_7,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_8,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_9,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_10,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_11,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_12,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_13,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_14,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_15,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_var_dim_0,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_return_output);

-- BIN_OP_XOR_rmii_eth_mac_h_l252_c12_9470 : 0 clocks latency
BIN_OP_XOR_rmii_eth_mac_h_l252_c12_9470 : entity work.BIN_OP_XOR_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_XOR_rmii_eth_mac_h_l252_c12_9470_left,
BIN_OP_XOR_rmii_eth_mac_h_l252_c12_9470_right,
BIN_OP_XOR_rmii_eth_mac_h_l252_c12_9470_return_output);

-- crc_MUX_rmii_eth_mac_h_l254_c3_a0a9 : 0 clocks latency
crc_MUX_rmii_eth_mac_h_l254_c3_a0a9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_cond,
crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_iftrue,
crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_iffalse,
crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l258_c28_ceea : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l258_c28_ceea : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l258_c28_ceea_left,
BIN_OP_AND_rmii_eth_mac_h_l258_c28_ceea_right,
BIN_OP_AND_rmii_eth_mac_h_l258_c28_ceea_return_output);

-- BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2 : 0 clocks latency
BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2 : entity work.BIN_OP_PLUS_uint6_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2_left,
BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2_right,
BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2_return_output);



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
 BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_return_output,
 reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output,
 data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output,
 o_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output,
 state_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output,
 state_MUX_rmii_eth_mac_h_l169_c5_1b5c_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_return_output,
 data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_return_output,
 o_MUX_rmii_eth_mac_h_l173_c8_948e_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_return_output,
 state_MUX_rmii_eth_mac_h_l173_c8_948e_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_return_output,
 state_MUX_rmii_eth_mac_h_l176_c5_752f_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_return_output,
 data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_return_output,
 o_MUX_rmii_eth_mac_h_l184_c8_da19_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_return_output,
 state_MUX_rmii_eth_mac_h_l184_c8_da19_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_return_output,
 data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_return_output,
 o_MUX_rmii_eth_mac_h_l194_c8_575b_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_return_output,
 state_MUX_rmii_eth_mac_h_l194_c8_575b_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_return_output,
 data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output,
 o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output,
 state_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output,
 data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_return_output,
 o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_return_output,
 state_MUX_rmii_eth_mac_h_l203_c7_efba_return_output,
 CONST_SR_2_rmii_eth_mac_h_l218_c18_1de3_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_return_output,
 o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_return_output,
 o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_return_output,
 state_MUX_rmii_eth_mac_h_l221_c8_2420_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_return_output,
 state_MUX_rmii_eth_mac_h_l226_c5_e484_return_output,
 CONST_SR_2_rmii_eth_mac_h_l233_c23_fafe_return_output,
 crc_MUX_rmii_eth_mac_h_l250_c3_7dab_return_output,
 CONST_SR_4_rmii_eth_mac_h_l251_c12_fe65_return_output,
 CONST_SR_0_rmii_eth_mac_h_l251_c42_9293_return_output,
 BIN_OP_XOR_rmii_eth_mac_h_l251_c35_bc1d_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l251_c35_4698_return_output,
 VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_return_output,
 BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44_return_output,
 CONST_SR_4_rmii_eth_mac_h_l252_c12_d3ef_return_output,
 CONST_SR_4_rmii_eth_mac_h_l252_c42_e697_return_output,
 BIN_OP_XOR_rmii_eth_mac_h_l252_c35_8e1d_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l252_c35_681c_return_output,
 VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_return_output,
 BIN_OP_XOR_rmii_eth_mac_h_l252_c12_9470_return_output,
 crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l258_c28_ceea_return_output,
 BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : rmii_tx_mac_t;
 variable VAR_axis_in : axis8_t_stream_t;
 variable VAR_o : rmii_tx_mac_t;
 variable VAR_INC : unsigned(1 downto 0);
 variable VAR_preamble_ctr_end : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24_return_output : unsigned(0 downto 0);
 variable VAR_fcs_ctr_end : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa_return_output : unsigned(0 downto 0);
 variable VAR_last_bits_of_byte : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_return_output : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_data_rmii_eth_mac_h_l163_c3_151b : unsigned(1 downto 0);
 variable VAR_reset_crc : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_return_output : unsigned(0 downto 0);
 variable VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue : unsigned(0 downto 0);
 variable VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse : unsigned(0 downto 0);
 variable VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output : unsigned(0 downto 0);
 variable VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond : unsigned(0 downto 0);
 variable VAR_o_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue : rmii_tx_mac_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l167_c3_e0cd_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l173_c8_948e_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l169_c5_1b5c_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l173_c8_948e_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l169_c5_1b5c_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l169_c5_1b5c_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l169_c5_1b5c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_return_output : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_cond : unsigned(0 downto 0);
 variable VAR_o_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue : rmii_tx_mac_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb_rmii_eth_mac_h_l173_c8_948e_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l184_c8_da19_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l173_c8_948e_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l176_c5_752f_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l184_c8_da19_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l173_c8_948e_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l178_c7_df67 : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l181_c7_eeaa : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l176_c5_752f_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l176_c5_752f_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l176_c5_752f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_return_output : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l192_c5_5b5d : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_cond : unsigned(0 downto 0);
 variable VAR_o_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue : rmii_tx_mac_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd_rmii_eth_mac_h_l184_c8_da19_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l194_c8_575b_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l184_c8_da19_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l194_c8_575b_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l184_c8_da19_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_return_output : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_cond : unsigned(0 downto 0);
 variable VAR_o_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue : rmii_tx_mac_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l194_c8_575b_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse : rmii_tx_mac_t;
 variable VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb_rmii_eth_mac_h_l194_c8_575b_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l194_c8_575b_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l221_c8_2420_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l194_c8_575b_cond : unsigned(0 downto 0);
 variable VAR_uint8_1_0_rmii_eth_mac_h_l196_c28_e990_return_output : unsigned(1 downto 0);
 variable VAR_last_bits_of_last_byte : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_return_output : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l217_c7_207b : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_cond : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_return_output : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l203_c7_efba_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l202_c5_5b54_cond : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l204_c9_3d11 : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l212_c9_fb2a : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_cond : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l203_c7_efba_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_1de3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_1de3_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_return_output : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_cond : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue : unsigned(1 downto 0);
 variable VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse : unsigned(1 downto 0);
 variable VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_return_output : unsigned(1 downto 0);
 variable VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_cond : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_return_output : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l226_c5_e484_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l221_c8_2420_cond : unsigned(0 downto 0);
 variable VAR_uint32_1_0_rmii_eth_mac_h_l223_c28_2847_return_output : unsigned(1 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l228_c7_8749 : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l232_c7_a0c8 : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l226_c5_e484_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l226_c5_e484_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l226_c5_e484_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_fafe_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_fafe_x : unsigned(31 downto 0);
 variable VAR_data_n : unsigned(7 downto 0);
 variable VAR_crc_table : uint32_t_16;
 variable VAR_crc_MUX_rmii_eth_mac_h_l250_c3_7dab_iftrue : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l250_c3_7dab_iffalse : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l250_c3_7dab_return_output : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l250_c3_7dab_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_fe65_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44_left : unsigned(31 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_fe65_x : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_bc1d_left : unsigned(31 downto 0);
 variable VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_9293_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_bc1d_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_9293_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_bc1d_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_4698_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_4698_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_4698_return_output : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44_right : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_0 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_1 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_2 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_3 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_4 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_5 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_6 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_7 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_8 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_9 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_10 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_11 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_12 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_13 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_14 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_15 : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_d3ef_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_9470_left : unsigned(31 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_d3ef_x : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_8e1d_left : unsigned(31 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_e697_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_8e1d_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_e697_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_8e1d_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_681c_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_681c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_681c_return_output : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_9470_right : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_0 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_1 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_2 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_3 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_4 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_5 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_6 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_7 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_8 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_9 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_10 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_11 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_12 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_13 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_14 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_15 : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_9470_return_output : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_iftrue : unsigned(31 downto 0);
 variable VAR_crc_rmii_eth_mac_h_l255_c5_9558 : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_iffalse : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_return_output : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_ceea_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_rmii_tx_mac_t_tx_mac_input_ready_d41d_rmii_eth_mac_h_l258_c44_3549_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_ceea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_ceea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_h_l169_l258_DUPLICATE_60b1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2_return_output : unsigned(6 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l189_l209_l257_DUPLICATE_133a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_rmii_eth_mac_h_l210_l190_DUPLICATE_bd9b_return_output : unsigned(0 downto 0);
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
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24_right := to_unsigned(60, 6);
     VAR_bit_counter_rmii_eth_mac_h_l192_c5_5b5d := resize(to_unsigned(0, 1), 6);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue := VAR_bit_counter_rmii_eth_mac_h_l192_c5_5b5d;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_right := unsigned(rmii_tx_mac_state_t_to_slv(IDLE));
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_9 := unsigned'(X"bdb26158");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_9 := unsigned'(X"bdb26158");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_0 := to_unsigned(1304293916, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_0 := to_unsigned(1304293916, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_8 := unsigned'(X"a005713c");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_8 := unsigned'(X"a005713c");
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_right := unsigned(rmii_tx_mac_state_t_to_slv(SFD));
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse := to_unsigned(0, 1);
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue := to_unsigned(0, 1);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_6 := to_unsigned(1020740, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_6 := to_unsigned(1020740, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_3 := to_unsigned(1801765552, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_3 := to_unsigned(1801765552, 32);
     VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_681c_right := to_unsigned(15, 8);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_15 := unsigned'(X"f0000000");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_15 := unsigned'(X"f0000000");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_1 := to_unsigned(1342890616, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_1 := to_unsigned(1342890616, 32);
     VAR_state_MUX_rmii_eth_mac_h_l176_c5_752f_iftrue := unsigned(rmii_tx_mac_state_t_to_slv(SFD));
     VAR_state_MUX_rmii_eth_mac_h_l226_c5_e484_iftrue := unsigned(rmii_tx_mac_state_t_to_slv(IDLE));
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_11 := unsigned'(X"86dc4190");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_11 := unsigned'(X"86dc4190");
     VAR_state_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue := unsigned(rmii_tx_mac_state_t_to_slv(DATA));
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_right := unsigned(rmii_tx_mac_state_t_to_slv(FCS));
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa_right := to_unsigned(30, 5);
     VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse := to_unsigned(0, 1);
     VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse := to_unsigned(0, 1);
     VAR_bit_counter_rmii_eth_mac_h_l204_c9_3d11 := resize(to_unsigned(0, 1), 6);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue := VAR_bit_counter_rmii_eth_mac_h_l204_c9_3d11;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_right := unsigned(rmii_tx_mac_state_t_to_slv(DATA));
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_4 := to_unsigned(996258700, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_4 := to_unsigned(996258700, 32);
     VAR_crc_rmii_eth_mac_h_l255_c5_9558 := resize(to_unsigned(0, 1), 32);
     VAR_crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_iftrue := VAR_crc_rmii_eth_mac_h_l255_c5_9558;
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_14 := unsigned'(X"edb71064");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_14 := unsigned'(X"edb71064");
     VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2_right := to_unsigned(2, 2);
     VAR_bit_counter_rmii_eth_mac_h_l228_c7_8749 := resize(to_unsigned(0, 1), 6);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_iftrue := VAR_bit_counter_rmii_eth_mac_h_l228_c7_8749;
     VAR_bit_counter_rmii_eth_mac_h_l212_c9_fb2a := resize(to_unsigned(0, 1), 6);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse := VAR_bit_counter_rmii_eth_mac_h_l212_c9_fb2a;
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_10 := unsigned'(X"9b6b51f4");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_10 := unsigned'(X"9b6b51f4");
     VAR_state_MUX_rmii_eth_mac_h_l169_c5_1b5c_iftrue := unsigned(rmii_tx_mac_state_t_to_slv(PREAMBLE));
     VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue := to_unsigned(1, 1);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_2 := to_unsigned(1993593556, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_2 := to_unsigned(1993593556, 32);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_right := to_unsigned(6, 3);
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_4698_right := to_unsigned(15, 8);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_7 := to_unsigned(498631456, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_7 := to_unsigned(498631456, 32);
     VAR_o_tx_mac_output_data_rmii_eth_mac_h_l163_c3_151b := resize(to_unsigned(0, 1), 2);
     VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse := VAR_o_tx_mac_output_data_rmii_eth_mac_h_l163_c3_151b;
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_5 := to_unsigned(651600872, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_5 := to_unsigned(651600872, 32);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_right := unsigned(rmii_tx_mac_state_t_to_slv(PREAMBLE));
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_13 := unsigned'(X"cb6e20c8");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_13 := unsigned'(X"cb6e20c8");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_12 := unsigned'(X"d6d930ac");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_12 := unsigned'(X"d6d930ac");
     VAR_bit_counter_rmii_eth_mac_h_l178_c7_df67 := resize(to_unsigned(0, 1), 6);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_iftrue := VAR_bit_counter_rmii_eth_mac_h_l178_c7_df67;
     VAR_state_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue := unsigned(rmii_tx_mac_state_t_to_slv(FCS));
     -- o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb[rmii_eth_mac_h_l173_c8_948e] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb_rmii_eth_mac_h_l173_c8_948e_return_output := CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb(
     to_unsigned(0, 1),
     to_unsigned(1, 2),
     to_unsigned(1, 1));

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724[rmii_eth_mac_h_l167_c3_e0cd] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l167_c3_e0cd_return_output := CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724(
     VAR_o_tx_mac_output_data_rmii_eth_mac_h_l163_c3_151b,
     to_unsigned(0, 1),
     to_unsigned(0, 1));

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd[rmii_eth_mac_h_l184_c8_da19] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd_rmii_eth_mac_h_l184_c8_da19_return_output := CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd(
     to_unsigned(1, 1),
     to_unsigned(3, 2),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_o_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd_rmii_eth_mac_h_l184_c8_da19_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb_rmii_eth_mac_h_l173_c8_948e_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l167_c3_e0cd_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;
     -- Mux in inputs
     VAR_axis_in := axis_in;

     -- Submodule level 0
     VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_9293_x := axis_in_data_reg;
     VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_e697_x := axis_in_data_reg;
     VAR_crc_MUX_rmii_eth_mac_h_l250_c3_7dab_cond := axis_in_data_reg_valid;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24_left := bit_counter;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa_left := bit_counter;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_left := bit_counter;
     VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2_left := bit_counter;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue := bit_counter;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse := bit_counter;
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_bc1d_left := crc;
     VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_fe65_x := crc;
     VAR_crc_MUX_rmii_eth_mac_h_l250_c3_7dab_iffalse := crc;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue := crc;
     VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_fafe_x := crc_shift_reg;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue := crc_shift_reg;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue := crc_shift_reg;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue := crc_shift_reg;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse := crc_shift_reg;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_iftrue := crc_shift_reg;
     VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_1de3_x := data_reg;
     VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue := data_reg;
     VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue := data_reg;
     VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse := data_reg;
     VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue := data_reg;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_right := last_byte_reg;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue := last_byte_reg;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue := last_byte_reg;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse := last_byte_reg;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse := last_byte_reg;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue := last_byte_reg;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_left := state;
     VAR_state_MUX_rmii_eth_mac_h_l169_c5_1b5c_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l176_c5_752f_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l226_c5_e484_iffalse := state;
     -- BIN_OP_EQ[rmii_eth_mac_h_l194_c11_0f63] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_left;
     BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_return_output := BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_return_output;

     -- CONST_SR_4[rmii_eth_mac_h_l251_c12_fe65] LATENCY=0
     -- Inputs
     CONST_SR_4_rmii_eth_mac_h_l251_c12_fe65_x <= VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_fe65_x;
     -- Outputs
     VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_fe65_return_output := CONST_SR_4_rmii_eth_mac_h_l251_c12_fe65_return_output;

     -- CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l189_l209_l257_DUPLICATE_133a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l189_l209_l257_DUPLICATE_133a_return_output := VAR_axis_in.data.tdata(0);

     -- BIN_OP_EQ[rmii_eth_mac_h_l158_c31_8c24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24_left;
     BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24_return_output := BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l173_c11_7083] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_left;
     BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_return_output := BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_return_output;

     -- CONST_SR_4[rmii_eth_mac_h_l252_c42_e697] LATENCY=0
     -- Inputs
     CONST_SR_4_rmii_eth_mac_h_l252_c42_e697_x <= VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_e697_x;
     -- Outputs
     VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_e697_return_output := CONST_SR_4_rmii_eth_mac_h_l252_c42_e697_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l159_c26_33fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa_left;
     BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa_return_output := BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa_return_output;

     -- uint8_1_0[rmii_eth_mac_h_l196_c28_e990] LATENCY=0
     VAR_uint8_1_0_rmii_eth_mac_h_l196_c28_e990_return_output := uint8_1_0(
     data_reg);

     -- BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2_left <= VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2_left;
     BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2_right <= VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2_return_output := BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2_return_output;

     -- uint32_1_0[rmii_eth_mac_h_l223_c28_2847] LATENCY=0
     VAR_uint32_1_0_rmii_eth_mac_h_l223_c28_2847_return_output := uint32_1_0(
     crc_shift_reg);

     -- CONST_SR_2[rmii_eth_mac_h_l233_c23_fafe] LATENCY=0
     -- Inputs
     CONST_SR_2_rmii_eth_mac_h_l233_c23_fafe_x <= VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_fafe_x;
     -- Outputs
     VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_fafe_return_output := CONST_SR_2_rmii_eth_mac_h_l233_c23_fafe_return_output;

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_rmii_eth_mac_h_l210_l190_DUPLICATE_bd9b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_rmii_eth_mac_h_l210_l190_DUPLICATE_bd9b_return_output := VAR_axis_in.data.tlast;

     -- CONST_SR_2[rmii_eth_mac_h_l218_c18_1de3] LATENCY=0
     -- Inputs
     CONST_SR_2_rmii_eth_mac_h_l218_c18_1de3_x <= VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_1de3_x;
     -- Outputs
     VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_1de3_return_output := CONST_SR_2_rmii_eth_mac_h_l218_c18_1de3_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l167_c6_6409] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_left;
     BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_return_output := BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_return_output;

     -- CONST_SR_0[rmii_eth_mac_h_l251_c42_9293] LATENCY=0
     -- Inputs
     CONST_SR_0_rmii_eth_mac_h_l251_c42_9293_x <= VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_9293_x;
     -- Outputs
     VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_9293_return_output := CONST_SR_0_rmii_eth_mac_h_l251_c42_9293_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l184_c11_99c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_left;
     BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_return_output := BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l160_c32_1dc4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_left;
     BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_return_output := BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_return_output;

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_h_l169_l258_DUPLICATE_60b1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_h_l169_l258_DUPLICATE_60b1_return_output := VAR_axis_in.valid;

     -- BIN_OP_EQ[rmii_eth_mac_h_l221_c11_55ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_left;
     BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_return_output := BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_return_output;

     -- Submodule level 1
     VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l176_c5_752f_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8c24_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l226_c5_e484_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_33fa_return_output;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_left := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_return_output;
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l202_c5_5b54_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_1dc4_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_return_output;
     VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_6409_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l173_c8_948e_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l173_c8_948e_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_7083_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l184_c8_da19_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l184_c8_da19_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_99c9_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l194_c8_575b_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l194_c8_575b_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_0f63_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_return_output;
     VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_return_output;
     VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l221_c8_2420_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_55ef_return_output;
     VAR_bit_counter_rmii_eth_mac_h_l181_c7_eeaa := resize(VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2_return_output, 6);
     VAR_bit_counter_rmii_eth_mac_h_l217_c7_207b := resize(VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2_return_output, 6);
     VAR_bit_counter_rmii_eth_mac_h_l232_c7_a0c8 := resize(VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l217_l232_l181_DUPLICATE_3da2_return_output, 6);
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_rmii_eth_mac_h_l210_l190_DUPLICATE_bd9b_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_rmii_eth_mac_h_l210_l190_DUPLICATE_bd9b_return_output;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_ceea_left := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_h_l169_l258_DUPLICATE_60b1_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l169_c5_1b5c_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_h_l169_l258_DUPLICATE_60b1_return_output;
     REG_VAR_axis_in_data_reg := VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l189_l209_l257_DUPLICATE_133a_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue := VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l189_l209_l257_DUPLICATE_133a_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse := VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l189_l209_l257_DUPLICATE_133a_return_output;
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_bc1d_right := VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_9293_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse := VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_1de3_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_iffalse := VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_fafe_return_output;
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44_left := VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_fe65_return_output;
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_8e1d_right := VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_e697_return_output;
     VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue := VAR_uint32_1_0_rmii_eth_mac_h_l223_c28_2847_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_iffalse := VAR_bit_counter_rmii_eth_mac_h_l181_c7_eeaa;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse := VAR_bit_counter_rmii_eth_mac_h_l217_c7_207b;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_iffalse := VAR_bit_counter_rmii_eth_mac_h_l232_c7_a0c8;
     -- state_MUX[rmii_eth_mac_h_l169_c5_1b5c] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l169_c5_1b5c_cond <= VAR_state_MUX_rmii_eth_mac_h_l169_c5_1b5c_cond;
     state_MUX_rmii_eth_mac_h_l169_c5_1b5c_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l169_c5_1b5c_iftrue;
     state_MUX_rmii_eth_mac_h_l169_c5_1b5c_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l169_c5_1b5c_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l169_c5_1b5c_return_output := state_MUX_rmii_eth_mac_h_l169_c5_1b5c_return_output;

     -- BIN_OP_AND[rmii_eth_mac_h_l201_c38_891e] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_left;
     BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_return_output := BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l176_c5_752f] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_cond;
     bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_return_output := bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_return_output;

     -- state_MUX[rmii_eth_mac_h_l226_c5_e484] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l226_c5_e484_cond <= VAR_state_MUX_rmii_eth_mac_h_l226_c5_e484_cond;
     state_MUX_rmii_eth_mac_h_l226_c5_e484_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l226_c5_e484_iftrue;
     state_MUX_rmii_eth_mac_h_l226_c5_e484_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l226_c5_e484_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l226_c5_e484_return_output := state_MUX_rmii_eth_mac_h_l226_c5_e484_return_output;

     -- reset_crc_MUX[rmii_eth_mac_h_l167_c3_e0cd] LATENCY=0
     -- Inputs
     reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond <= VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond;
     reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue <= VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue;
     reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse <= VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse;
     -- Outputs
     VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output := reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output;

     -- o_tx_mac_output_valid_MUX[rmii_eth_mac_h_l221_c8_2420] LATENCY=0
     -- Inputs
     o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_cond <= VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_cond;
     o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue <= VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue;
     o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse <= VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse;
     -- Outputs
     VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_return_output := o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_return_output;

     -- state_MUX[rmii_eth_mac_h_l176_c5_752f] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l176_c5_752f_cond <= VAR_state_MUX_rmii_eth_mac_h_l176_c5_752f_cond;
     state_MUX_rmii_eth_mac_h_l176_c5_752f_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l176_c5_752f_iftrue;
     state_MUX_rmii_eth_mac_h_l176_c5_752f_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l176_c5_752f_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l176_c5_752f_return_output := state_MUX_rmii_eth_mac_h_l176_c5_752f_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l226_c5_e484] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_cond;
     bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_return_output := bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_return_output;

     -- o_tx_mac_output_data_MUX[rmii_eth_mac_h_l221_c8_2420] LATENCY=0
     -- Inputs
     o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_cond <= VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_cond;
     o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue <= VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue;
     o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse <= VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse;
     -- Outputs
     VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_return_output := o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_return_output;

     -- crc_shift_reg_MUX[rmii_eth_mac_h_l226_c5_e484] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_return_output;

     -- BIN_OP_XOR[rmii_eth_mac_h_l251_c35_bc1d] LATENCY=0
     -- Inputs
     BIN_OP_XOR_rmii_eth_mac_h_l251_c35_bc1d_left <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_bc1d_left;
     BIN_OP_XOR_rmii_eth_mac_h_l251_c35_bc1d_right <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_bc1d_right;
     -- Outputs
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_bc1d_return_output := BIN_OP_XOR_rmii_eth_mac_h_l251_c35_bc1d_return_output;

     -- Submodule level 2
     VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_return_output;
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l203_c7_efba_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_891e_return_output;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_4698_left := VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_bc1d_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_752f_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_e484_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_e484_return_output;
     VAR_crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_cond := VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue := VAR_state_MUX_rmii_eth_mac_h_l169_c5_1b5c_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue := VAR_state_MUX_rmii_eth_mac_h_l176_c5_752f_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue := VAR_state_MUX_rmii_eth_mac_h_l226_c5_e484_return_output;
     -- last_byte_reg_MUX[rmii_eth_mac_h_l203_c7_efba] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_return_output;

     -- state_MUX[rmii_eth_mac_h_l221_c8_2420] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l221_c8_2420_cond <= VAR_state_MUX_rmii_eth_mac_h_l221_c8_2420_cond;
     state_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue;
     state_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l221_c8_2420_return_output := state_MUX_rmii_eth_mac_h_l221_c8_2420_return_output;

     -- data_reg_MUX[rmii_eth_mac_h_l203_c7_efba] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_cond;
     data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_return_output := data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_return_output;

     -- BIN_OP_AND[rmii_eth_mac_h_l251_c35_4698] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l251_c35_4698_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_4698_left;
     BIN_OP_AND_rmii_eth_mac_h_l251_c35_4698_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_4698_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_4698_return_output := BIN_OP_AND_rmii_eth_mac_h_l251_c35_4698_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l221_c8_2420] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_cond;
     bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_return_output := bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_return_output;

     -- crc_shift_reg_MUX[rmii_eth_mac_h_l221_c8_2420] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_return_output;

     -- state_MUX[rmii_eth_mac_h_l203_c7_efba] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l203_c7_efba_cond <= VAR_state_MUX_rmii_eth_mac_h_l203_c7_efba_cond;
     state_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue;
     state_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l203_c7_efba_return_output := state_MUX_rmii_eth_mac_h_l203_c7_efba_return_output;

     -- o_tx_mac_input_ready_MUX[rmii_eth_mac_h_l203_c7_efba] LATENCY=0
     -- Inputs
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_cond <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_cond;
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue;
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse;
     -- Outputs
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_return_output := o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_return_output;

     -- o_FALSE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb[rmii_eth_mac_h_l194_c8_575b] LATENCY=0
     VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb_rmii_eth_mac_h_l194_c8_575b_return_output := CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb(
     to_unsigned(0, 1),
     VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_2420_return_output,
     VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_2420_return_output);

     -- bit_counter_MUX[rmii_eth_mac_h_l203_c7_efba] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_cond;
     bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_return_output := bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_return_output;

     -- Submodule level 3
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_var_dim_0 := resize(VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_4698_return_output, 4);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_efba_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_2420_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_2420_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue := VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_efba_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_efba_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse := VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb_rmii_eth_mac_h_l194_c8_575b_return_output;
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue := VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_efba_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue := VAR_state_MUX_rmii_eth_mac_h_l203_c7_efba_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse := VAR_state_MUX_rmii_eth_mac_h_l221_c8_2420_return_output;
     -- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60[rmii_eth_mac_h_l251_c24_8404] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_0 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_0;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_1 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_1;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_2 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_2;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_3 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_3;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_4 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_4;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_5 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_5;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_6 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_6;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_7 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_7;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_8 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_8;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_9 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_9;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_10 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_10;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_11 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_11;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_12 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_12;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_13 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_13;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_14 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_14;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_15 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_ref_toks_15;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_var_dim_0 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_return_output := VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_return_output;

     -- o_tx_mac_input_ready_MUX[rmii_eth_mac_h_l202_c5_5b54] LATENCY=0
     -- Inputs
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_cond <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_cond;
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue;
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse;
     -- Outputs
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output := o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output;

     -- crc_shift_reg_MUX[rmii_eth_mac_h_l194_c8_575b] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_return_output;

     -- data_reg_MUX[rmii_eth_mac_h_l202_c5_5b54] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_cond;
     data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output := data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output;

     -- last_byte_reg_MUX[rmii_eth_mac_h_l202_c5_5b54] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output;

     -- state_MUX[rmii_eth_mac_h_l202_c5_5b54] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l202_c5_5b54_cond <= VAR_state_MUX_rmii_eth_mac_h_l202_c5_5b54_cond;
     state_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue;
     state_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output := state_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l202_c5_5b54] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_cond;
     bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output := bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output;

     -- Submodule level 4
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44_right := VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_8404_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_575b_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue := VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue := VAR_state_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output;
     -- crc_shift_reg_MUX[rmii_eth_mac_h_l184_c8_da19] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_return_output;

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724[rmii_eth_mac_h_l194_c8_575b] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l194_c8_575b_return_output := CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724(
     VAR_uint8_1_0_rmii_eth_mac_h_l196_c28_e990_return_output,
     to_unsigned(1, 1),
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_5b54_return_output);

     -- last_byte_reg_MUX[rmii_eth_mac_h_l194_c8_575b] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_return_output;

     -- data_reg_MUX[rmii_eth_mac_h_l194_c8_575b] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_cond;
     data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_return_output := data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_return_output;

     -- state_MUX[rmii_eth_mac_h_l194_c8_575b] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l194_c8_575b_cond <= VAR_state_MUX_rmii_eth_mac_h_l194_c8_575b_cond;
     state_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue;
     state_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l194_c8_575b_return_output := state_MUX_rmii_eth_mac_h_l194_c8_575b_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l194_c8_575b] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_cond;
     bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_return_output := bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_return_output;

     -- BIN_OP_XOR[rmii_eth_mac_h_l251_c12_fa44] LATENCY=0
     -- Inputs
     BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44_left <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44_left;
     BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44_right <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44_right;
     -- Outputs
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44_return_output := BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44_return_output;

     -- Submodule level 5
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_8e1d_left := VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44_return_output;
     VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_d3ef_x := VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_fa44_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_575b_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_da19_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse := VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_575b_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_575b_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l194_c8_575b_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse := VAR_state_MUX_rmii_eth_mac_h_l194_c8_575b_return_output;
     -- last_byte_reg_MUX[rmii_eth_mac_h_l184_c8_da19] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_return_output;

     -- crc_shift_reg_MUX[rmii_eth_mac_h_l173_c8_948e] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_return_output;

     -- CONST_SR_4[rmii_eth_mac_h_l252_c12_d3ef] LATENCY=0
     -- Inputs
     CONST_SR_4_rmii_eth_mac_h_l252_c12_d3ef_x <= VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_d3ef_x;
     -- Outputs
     VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_d3ef_return_output := CONST_SR_4_rmii_eth_mac_h_l252_c12_d3ef_return_output;

     -- o_MUX[rmii_eth_mac_h_l194_c8_575b] LATENCY=0
     -- Inputs
     o_MUX_rmii_eth_mac_h_l194_c8_575b_cond <= VAR_o_MUX_rmii_eth_mac_h_l194_c8_575b_cond;
     o_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue <= VAR_o_MUX_rmii_eth_mac_h_l194_c8_575b_iftrue;
     o_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse <= VAR_o_MUX_rmii_eth_mac_h_l194_c8_575b_iffalse;
     -- Outputs
     VAR_o_MUX_rmii_eth_mac_h_l194_c8_575b_return_output := o_MUX_rmii_eth_mac_h_l194_c8_575b_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l184_c8_da19] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_cond;
     bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_return_output := bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_return_output;

     -- BIN_OP_XOR[rmii_eth_mac_h_l252_c35_8e1d] LATENCY=0
     -- Inputs
     BIN_OP_XOR_rmii_eth_mac_h_l252_c35_8e1d_left <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_8e1d_left;
     BIN_OP_XOR_rmii_eth_mac_h_l252_c35_8e1d_right <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_8e1d_right;
     -- Outputs
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_8e1d_return_output := BIN_OP_XOR_rmii_eth_mac_h_l252_c35_8e1d_return_output;

     -- data_reg_MUX[rmii_eth_mac_h_l184_c8_da19] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_cond;
     data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_return_output := data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_return_output;

     -- state_MUX[rmii_eth_mac_h_l184_c8_da19] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l184_c8_da19_cond <= VAR_state_MUX_rmii_eth_mac_h_l184_c8_da19_cond;
     state_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue;
     state_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l184_c8_da19_return_output := state_MUX_rmii_eth_mac_h_l184_c8_da19_return_output;

     -- Submodule level 6
     VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_681c_left := VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_8e1d_return_output;
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_9470_left := VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_d3ef_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_da19_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_948e_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse := VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_da19_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_da19_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse := VAR_o_MUX_rmii_eth_mac_h_l194_c8_575b_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse := VAR_state_MUX_rmii_eth_mac_h_l184_c8_da19_return_output;
     -- crc_shift_reg_MUX[rmii_eth_mac_h_l167_c3_e0cd] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l173_c8_948e] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_cond;
     bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_return_output := bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_return_output;

     -- last_byte_reg_MUX[rmii_eth_mac_h_l173_c8_948e] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_return_output;

     -- o_MUX[rmii_eth_mac_h_l184_c8_da19] LATENCY=0
     -- Inputs
     o_MUX_rmii_eth_mac_h_l184_c8_da19_cond <= VAR_o_MUX_rmii_eth_mac_h_l184_c8_da19_cond;
     o_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue <= VAR_o_MUX_rmii_eth_mac_h_l184_c8_da19_iftrue;
     o_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse <= VAR_o_MUX_rmii_eth_mac_h_l184_c8_da19_iffalse;
     -- Outputs
     VAR_o_MUX_rmii_eth_mac_h_l184_c8_da19_return_output := o_MUX_rmii_eth_mac_h_l184_c8_da19_return_output;

     -- BIN_OP_AND[rmii_eth_mac_h_l252_c35_681c] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l252_c35_681c_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_681c_left;
     BIN_OP_AND_rmii_eth_mac_h_l252_c35_681c_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_681c_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_681c_return_output := BIN_OP_AND_rmii_eth_mac_h_l252_c35_681c_return_output;

     -- state_MUX[rmii_eth_mac_h_l173_c8_948e] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l173_c8_948e_cond <= VAR_state_MUX_rmii_eth_mac_h_l173_c8_948e_cond;
     state_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue;
     state_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l173_c8_948e_return_output := state_MUX_rmii_eth_mac_h_l173_c8_948e_return_output;

     -- data_reg_MUX[rmii_eth_mac_h_l173_c8_948e] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_cond;
     data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_return_output := data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_return_output;

     -- Submodule level 7
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_var_dim_0 := resize(VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_681c_return_output, 4);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_948e_return_output;
     REG_VAR_crc_shift_reg := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse := VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_948e_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_948e_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse := VAR_o_MUX_rmii_eth_mac_h_l184_c8_da19_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse := VAR_state_MUX_rmii_eth_mac_h_l173_c8_948e_return_output;
     -- o_MUX[rmii_eth_mac_h_l173_c8_948e] LATENCY=0
     -- Inputs
     o_MUX_rmii_eth_mac_h_l173_c8_948e_cond <= VAR_o_MUX_rmii_eth_mac_h_l173_c8_948e_cond;
     o_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue <= VAR_o_MUX_rmii_eth_mac_h_l173_c8_948e_iftrue;
     o_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse <= VAR_o_MUX_rmii_eth_mac_h_l173_c8_948e_iffalse;
     -- Outputs
     VAR_o_MUX_rmii_eth_mac_h_l173_c8_948e_return_output := o_MUX_rmii_eth_mac_h_l173_c8_948e_return_output;

     -- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60[rmii_eth_mac_h_l252_c24_5718] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_0 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_0;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_1 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_1;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_2 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_2;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_3 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_3;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_4 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_4;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_5 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_5;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_6 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_6;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_7 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_7;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_8 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_8;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_9 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_9;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_10 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_10;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_11 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_11;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_12 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_12;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_13 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_13;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_14 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_14;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_15 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_ref_toks_15;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_var_dim_0 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_return_output := VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_return_output;

     -- state_MUX[rmii_eth_mac_h_l167_c3_e0cd] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond <= VAR_state_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond;
     state_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue;
     state_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output := state_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output;

     -- last_byte_reg_MUX[rmii_eth_mac_h_l167_c3_e0cd] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l167_c3_e0cd] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond;
     bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output := bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output;

     -- data_reg_MUX[rmii_eth_mac_h_l167_c3_e0cd] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond;
     data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output := data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output;

     -- Submodule level 8
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_9470_right := VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_5718_return_output;
     REG_VAR_bit_counter := VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output;
     REG_VAR_data_reg := VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output;
     REG_VAR_last_byte_reg := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse := VAR_o_MUX_rmii_eth_mac_h_l173_c8_948e_return_output;
     REG_VAR_state := VAR_state_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output;
     -- o_MUX[rmii_eth_mac_h_l167_c3_e0cd] LATENCY=0
     -- Inputs
     o_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond <= VAR_o_MUX_rmii_eth_mac_h_l167_c3_e0cd_cond;
     o_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue <= VAR_o_MUX_rmii_eth_mac_h_l167_c3_e0cd_iftrue;
     o_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse <= VAR_o_MUX_rmii_eth_mac_h_l167_c3_e0cd_iffalse;
     -- Outputs
     VAR_o_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output := o_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output;

     -- BIN_OP_XOR[rmii_eth_mac_h_l252_c12_9470] LATENCY=0
     -- Inputs
     BIN_OP_XOR_rmii_eth_mac_h_l252_c12_9470_left <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_9470_left;
     BIN_OP_XOR_rmii_eth_mac_h_l252_c12_9470_right <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_9470_right;
     -- Outputs
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_9470_return_output := BIN_OP_XOR_rmii_eth_mac_h_l252_c12_9470_return_output;

     -- Submodule level 9
     VAR_crc_MUX_rmii_eth_mac_h_l250_c3_7dab_iftrue := VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_9470_return_output;
     VAR_return_output := VAR_o_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output;
     -- crc_MUX[rmii_eth_mac_h_l250_c3_7dab] LATENCY=0
     -- Inputs
     crc_MUX_rmii_eth_mac_h_l250_c3_7dab_cond <= VAR_crc_MUX_rmii_eth_mac_h_l250_c3_7dab_cond;
     crc_MUX_rmii_eth_mac_h_l250_c3_7dab_iftrue <= VAR_crc_MUX_rmii_eth_mac_h_l250_c3_7dab_iftrue;
     crc_MUX_rmii_eth_mac_h_l250_c3_7dab_iffalse <= VAR_crc_MUX_rmii_eth_mac_h_l250_c3_7dab_iffalse;
     -- Outputs
     VAR_crc_MUX_rmii_eth_mac_h_l250_c3_7dab_return_output := crc_MUX_rmii_eth_mac_h_l250_c3_7dab_return_output;

     -- CONST_REF_RD_uint1_t_rmii_tx_mac_t_tx_mac_input_ready_d41d[rmii_eth_mac_h_l258_c44_3549] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_rmii_tx_mac_t_tx_mac_input_ready_d41d_rmii_eth_mac_h_l258_c44_3549_return_output := VAR_o_MUX_rmii_eth_mac_h_l167_c3_e0cd_return_output.tx_mac_input_ready;

     -- Submodule level 10
     VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_ceea_right := VAR_CONST_REF_RD_uint1_t_rmii_tx_mac_t_tx_mac_input_ready_d41d_rmii_eth_mac_h_l258_c44_3549_return_output;
     VAR_crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_iffalse := VAR_crc_MUX_rmii_eth_mac_h_l250_c3_7dab_return_output;
     -- crc_MUX[rmii_eth_mac_h_l254_c3_a0a9] LATENCY=0
     -- Inputs
     crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_cond <= VAR_crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_cond;
     crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_iftrue <= VAR_crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_iftrue;
     crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_iffalse <= VAR_crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_iffalse;
     -- Outputs
     VAR_crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_return_output := crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_return_output;

     -- BIN_OP_AND[rmii_eth_mac_h_l258_c28_ceea] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l258_c28_ceea_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_ceea_left;
     BIN_OP_AND_rmii_eth_mac_h_l258_c28_ceea_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_ceea_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_ceea_return_output := BIN_OP_AND_rmii_eth_mac_h_l258_c28_ceea_return_output;

     -- Submodule level 11
     REG_VAR_axis_in_data_reg_valid := VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_ceea_return_output;
     REG_VAR_crc := VAR_crc_MUX_rmii_eth_mac_h_l254_c3_a0a9_return_output;
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
