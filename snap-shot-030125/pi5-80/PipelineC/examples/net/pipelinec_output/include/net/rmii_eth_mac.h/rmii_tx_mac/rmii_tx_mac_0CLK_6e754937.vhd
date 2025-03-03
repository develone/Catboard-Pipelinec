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
-- BIN_OP_EQ[rmii_eth_mac_h_l158_c31_8b5e]
signal BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e_left : unsigned(5 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l159_c26_52ca]
signal BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca_left : unsigned(5 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca_right : unsigned(4 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l160_c32_22f4]
signal BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_left : unsigned(5 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l167_c6_e479]
signal BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_return_output : unsigned(0 downto 0);

-- o_MUX[rmii_eth_mac_h_l167_c3_e2d6]
signal o_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond : unsigned(0 downto 0);
signal o_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output : rmii_tx_mac_t;

-- crc_shift_reg_MUX[rmii_eth_mac_h_l167_c3_e2d6]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output : unsigned(31 downto 0);

-- state_MUX[rmii_eth_mac_h_l167_c3_e2d6]
signal state_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output : unsigned(2 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l167_c3_e2d6]
signal bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output : unsigned(5 downto 0);

-- reset_crc_MUX[rmii_eth_mac_h_l167_c3_e2d6]
signal reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond : unsigned(0 downto 0);
signal reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue : unsigned(0 downto 0);
signal reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse : unsigned(0 downto 0);
signal reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output : unsigned(0 downto 0);

-- last_byte_reg_MUX[rmii_eth_mac_h_l167_c3_e2d6]
signal last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output : unsigned(0 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l167_c3_e2d6]
signal data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output : unsigned(7 downto 0);

-- state_MUX[rmii_eth_mac_h_l169_c5_8a9a]
signal state_MUX_rmii_eth_mac_h_l169_c5_8a9a_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l169_c5_8a9a_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l169_c5_8a9a_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l169_c5_8a9a_return_output : unsigned(2 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l173_c11_f855]
signal BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_return_output : unsigned(0 downto 0);

-- o_MUX[rmii_eth_mac_h_l173_c8_8db8]
signal o_MUX_rmii_eth_mac_h_l173_c8_8db8_cond : unsigned(0 downto 0);
signal o_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output : rmii_tx_mac_t;

-- crc_shift_reg_MUX[rmii_eth_mac_h_l173_c8_8db8]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output : unsigned(31 downto 0);

-- state_MUX[rmii_eth_mac_h_l173_c8_8db8]
signal state_MUX_rmii_eth_mac_h_l173_c8_8db8_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output : unsigned(2 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l173_c8_8db8]
signal bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output : unsigned(5 downto 0);

-- last_byte_reg_MUX[rmii_eth_mac_h_l173_c8_8db8]
signal last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output : unsigned(0 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l173_c8_8db8]
signal data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output : unsigned(7 downto 0);

-- state_MUX[rmii_eth_mac_h_l176_c5_7f61]
signal state_MUX_rmii_eth_mac_h_l176_c5_7f61_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l176_c5_7f61_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l176_c5_7f61_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l176_c5_7f61_return_output : unsigned(2 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l176_c5_7f61]
signal bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_return_output : unsigned(5 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l184_c11_f463]
signal BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_return_output : unsigned(0 downto 0);

-- o_MUX[rmii_eth_mac_h_l184_c8_f0ca]
signal o_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond : unsigned(0 downto 0);
signal o_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output : rmii_tx_mac_t;

-- state_MUX[rmii_eth_mac_h_l184_c8_f0ca]
signal state_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output : unsigned(2 downto 0);

-- crc_shift_reg_MUX[rmii_eth_mac_h_l184_c8_f0ca]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output : unsigned(31 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l184_c8_f0ca]
signal bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output : unsigned(5 downto 0);

-- last_byte_reg_MUX[rmii_eth_mac_h_l184_c8_f0ca]
signal last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output : unsigned(0 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l184_c8_f0ca]
signal data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l194_c11_145e]
signal BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_return_output : unsigned(0 downto 0);

-- o_MUX[rmii_eth_mac_h_l194_c8_b281]
signal o_MUX_rmii_eth_mac_h_l194_c8_b281_cond : unsigned(0 downto 0);
signal o_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse : rmii_tx_mac_t;
signal o_MUX_rmii_eth_mac_h_l194_c8_b281_return_output : rmii_tx_mac_t;

-- crc_shift_reg_MUX[rmii_eth_mac_h_l194_c8_b281]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_return_output : unsigned(31 downto 0);

-- state_MUX[rmii_eth_mac_h_l194_c8_b281]
signal state_MUX_rmii_eth_mac_h_l194_c8_b281_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l194_c8_b281_return_output : unsigned(2 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l194_c8_b281]
signal bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_return_output : unsigned(5 downto 0);

-- last_byte_reg_MUX[rmii_eth_mac_h_l194_c8_b281]
signal last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_return_output : unsigned(0 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l194_c8_b281]
signal data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l201_c38_69a2]
signal BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_left : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_right : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_return_output : unsigned(0 downto 0);

-- o_tx_mac_input_ready_MUX[rmii_eth_mac_h_l202_c5_afbc]
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_cond : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l202_c5_afbc]
signal state_MUX_rmii_eth_mac_h_l202_c5_afbc_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output : unsigned(2 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l202_c5_afbc]
signal bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output : unsigned(5 downto 0);

-- last_byte_reg_MUX[rmii_eth_mac_h_l202_c5_afbc]
signal last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output : unsigned(0 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l202_c5_afbc]
signal data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output : unsigned(7 downto 0);

-- o_tx_mac_input_ready_MUX[rmii_eth_mac_h_l203_c7_c2b2]
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse : unsigned(0 downto 0);
signal o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l203_c7_c2b2]
signal state_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output : unsigned(2 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l203_c7_c2b2]
signal bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output : unsigned(5 downto 0);

-- last_byte_reg_MUX[rmii_eth_mac_h_l203_c7_c2b2]
signal last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse : unsigned(0 downto 0);
signal last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output : unsigned(0 downto 0);

-- data_reg_MUX[rmii_eth_mac_h_l203_c7_c2b2]
signal data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond : unsigned(0 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse : unsigned(7 downto 0);
signal data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output : unsigned(7 downto 0);

-- CONST_SR_2[rmii_eth_mac_h_l218_c18_7f6e]
signal CONST_SR_2_rmii_eth_mac_h_l218_c18_7f6e_x : unsigned(7 downto 0);
signal CONST_SR_2_rmii_eth_mac_h_l218_c18_7f6e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l221_c11_9632]
signal BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_return_output : unsigned(0 downto 0);

-- o_tx_mac_output_valid_MUX[rmii_eth_mac_h_l221_c8_34c7]
signal o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_cond : unsigned(0 downto 0);
signal o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue : unsigned(0 downto 0);
signal o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse : unsigned(0 downto 0);
signal o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output : unsigned(0 downto 0);

-- o_tx_mac_output_data_MUX[rmii_eth_mac_h_l221_c8_34c7]
signal o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_cond : unsigned(0 downto 0);
signal o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue : unsigned(1 downto 0);
signal o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse : unsigned(1 downto 0);
signal o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output : unsigned(1 downto 0);

-- crc_shift_reg_MUX[rmii_eth_mac_h_l221_c8_34c7]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output : unsigned(31 downto 0);

-- state_MUX[rmii_eth_mac_h_l221_c8_34c7]
signal state_MUX_rmii_eth_mac_h_l221_c8_34c7_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output : unsigned(2 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l221_c8_34c7]
signal bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output : unsigned(5 downto 0);

-- state_MUX[rmii_eth_mac_h_l226_c5_5276]
signal state_MUX_rmii_eth_mac_h_l226_c5_5276_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l226_c5_5276_iftrue : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l226_c5_5276_iffalse : unsigned(2 downto 0);
signal state_MUX_rmii_eth_mac_h_l226_c5_5276_return_output : unsigned(2 downto 0);

-- crc_shift_reg_MUX[rmii_eth_mac_h_l226_c5_5276]
signal crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_cond : unsigned(0 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_iftrue : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_iffalse : unsigned(31 downto 0);
signal crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_return_output : unsigned(31 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l226_c5_5276]
signal bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_iftrue : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_iffalse : unsigned(5 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_return_output : unsigned(5 downto 0);

-- CONST_SR_2[rmii_eth_mac_h_l233_c23_4388]
signal CONST_SR_2_rmii_eth_mac_h_l233_c23_4388_x : unsigned(31 downto 0);
signal CONST_SR_2_rmii_eth_mac_h_l233_c23_4388_return_output : unsigned(31 downto 0);

-- crc_MUX[rmii_eth_mac_h_l250_c3_5c7a]
signal crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_cond : unsigned(0 downto 0);
signal crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_iftrue : unsigned(31 downto 0);
signal crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_iffalse : unsigned(31 downto 0);
signal crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_return_output : unsigned(31 downto 0);

-- CONST_SR_4[rmii_eth_mac_h_l251_c12_a9e0]
signal CONST_SR_4_rmii_eth_mac_h_l251_c12_a9e0_x : unsigned(31 downto 0);
signal CONST_SR_4_rmii_eth_mac_h_l251_c12_a9e0_return_output : unsigned(31 downto 0);

-- CONST_SR_0[rmii_eth_mac_h_l251_c42_f2d6]
signal CONST_SR_0_rmii_eth_mac_h_l251_c42_f2d6_x : unsigned(7 downto 0);
signal CONST_SR_0_rmii_eth_mac_h_l251_c42_f2d6_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[rmii_eth_mac_h_l251_c35_a0bc]
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c35_a0bc_left : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c35_a0bc_right : unsigned(7 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c35_a0bc_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l251_c35_47ac]
signal BIN_OP_AND_rmii_eth_mac_h_l251_c35_47ac_left : unsigned(31 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l251_c35_47ac_right : unsigned(7 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l251_c35_47ac_return_output : unsigned(31 downto 0);

-- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60[rmii_eth_mac_h_l251_c24_e1eb]
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_0 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_1 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_2 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_3 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_4 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_5 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_6 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_7 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_8 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_9 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_10 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_11 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_12 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_13 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_14 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_15 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_return_output : unsigned(31 downto 0);

-- BIN_OP_XOR[rmii_eth_mac_h_l251_c12_ecc4]
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4_left : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4_right : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4_return_output : unsigned(31 downto 0);

-- CONST_SR_4[rmii_eth_mac_h_l252_c12_8804]
signal CONST_SR_4_rmii_eth_mac_h_l252_c12_8804_x : unsigned(31 downto 0);
signal CONST_SR_4_rmii_eth_mac_h_l252_c12_8804_return_output : unsigned(31 downto 0);

-- CONST_SR_4[rmii_eth_mac_h_l252_c42_c088]
signal CONST_SR_4_rmii_eth_mac_h_l252_c42_c088_x : unsigned(7 downto 0);
signal CONST_SR_4_rmii_eth_mac_h_l252_c42_c088_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[rmii_eth_mac_h_l252_c35_3db8]
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c35_3db8_left : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c35_3db8_right : unsigned(7 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c35_3db8_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l252_c35_048a]
signal BIN_OP_AND_rmii_eth_mac_h_l252_c35_048a_left : unsigned(31 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l252_c35_048a_right : unsigned(7 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l252_c35_048a_return_output : unsigned(31 downto 0);

-- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60[rmii_eth_mac_h_l252_c24_ccfd]
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_0 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_1 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_2 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_3 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_4 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_5 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_6 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_7 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_8 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_9 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_10 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_11 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_12 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_13 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_14 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_15 : unsigned(31 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_return_output : unsigned(31 downto 0);

-- BIN_OP_XOR[rmii_eth_mac_h_l252_c12_ebd9]
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c12_ebd9_left : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c12_ebd9_right : unsigned(31 downto 0);
signal BIN_OP_XOR_rmii_eth_mac_h_l252_c12_ebd9_return_output : unsigned(31 downto 0);

-- crc_MUX[rmii_eth_mac_h_l254_c3_57a4]
signal crc_MUX_rmii_eth_mac_h_l254_c3_57a4_cond : unsigned(0 downto 0);
signal crc_MUX_rmii_eth_mac_h_l254_c3_57a4_iftrue : unsigned(31 downto 0);
signal crc_MUX_rmii_eth_mac_h_l254_c3_57a4_iffalse : unsigned(31 downto 0);
signal crc_MUX_rmii_eth_mac_h_l254_c3_57a4_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l258_c28_e631]
signal BIN_OP_AND_rmii_eth_mac_h_l258_c28_e631_left : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l258_c28_e631_right : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l258_c28_e631_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4
signal BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4_left : unsigned(5 downto 0);
signal BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4_return_output : unsigned(6 downto 0);

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

function CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_0870( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return rmii_tx_mac_t is
 
  variable base : rmii_tx_mac_t; 
  variable return_output : rmii_tx_mac_t;
begin
      base.tx_mac_input_ready := ref_toks_0;
      base.tx_mac_output_valid := ref_toks_1;
      base.tx_mac_output_data := ref_toks_2;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e : entity work.BIN_OP_EQ_uint6_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e_left,
BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e_right,
BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca : entity work.BIN_OP_EQ_uint6_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca_left,
BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca_right,
BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4 : entity work.BIN_OP_EQ_uint6_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_left,
BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_right,
BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_left,
BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_right,
BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_return_output);

-- o_MUX_rmii_eth_mac_h_l167_c3_e2d6 : 0 clocks latency
o_MUX_rmii_eth_mac_h_l167_c3_e2d6 : entity work.MUX_uint1_t_rmii_tx_mac_t_rmii_tx_mac_t_0CLK_de264c78 port map (
o_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond,
o_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue,
o_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse,
o_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6 : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output);

-- state_MUX_rmii_eth_mac_h_l167_c3_e2d6 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l167_c3_e2d6 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond,
state_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue,
state_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse,
state_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond,
bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output);

-- reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6 : 0 clocks latency
reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond,
reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue,
reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse,
reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6 : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6 : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond,
data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue,
data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse,
data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output);

-- state_MUX_rmii_eth_mac_h_l169_c5_8a9a : 0 clocks latency
state_MUX_rmii_eth_mac_h_l169_c5_8a9a : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l169_c5_8a9a_cond,
state_MUX_rmii_eth_mac_h_l169_c5_8a9a_iftrue,
state_MUX_rmii_eth_mac_h_l169_c5_8a9a_iffalse,
state_MUX_rmii_eth_mac_h_l169_c5_8a9a_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_left,
BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_right,
BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_return_output);

-- o_MUX_rmii_eth_mac_h_l173_c8_8db8 : 0 clocks latency
o_MUX_rmii_eth_mac_h_l173_c8_8db8 : entity work.MUX_uint1_t_rmii_tx_mac_t_rmii_tx_mac_t_0CLK_de264c78 port map (
o_MUX_rmii_eth_mac_h_l173_c8_8db8_cond,
o_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue,
o_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse,
o_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8 : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output);

-- state_MUX_rmii_eth_mac_h_l173_c8_8db8 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l173_c8_8db8 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l173_c8_8db8_cond,
state_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue,
state_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse,
state_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_cond,
bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8 : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8 : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_cond,
data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue,
data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse,
data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output);

-- state_MUX_rmii_eth_mac_h_l176_c5_7f61 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l176_c5_7f61 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l176_c5_7f61_cond,
state_MUX_rmii_eth_mac_h_l176_c5_7f61_iftrue,
state_MUX_rmii_eth_mac_h_l176_c5_7f61_iffalse,
state_MUX_rmii_eth_mac_h_l176_c5_7f61_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_cond,
bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_left,
BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_right,
BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_return_output);

-- o_MUX_rmii_eth_mac_h_l184_c8_f0ca : 0 clocks latency
o_MUX_rmii_eth_mac_h_l184_c8_f0ca : entity work.MUX_uint1_t_rmii_tx_mac_t_rmii_tx_mac_t_0CLK_de264c78 port map (
o_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond,
o_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue,
o_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse,
o_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output);

-- state_MUX_rmii_eth_mac_h_l184_c8_f0ca : 0 clocks latency
state_MUX_rmii_eth_mac_h_l184_c8_f0ca : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond,
state_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue,
state_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse,
state_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond,
bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond,
data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue,
data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse,
data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_left,
BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_right,
BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_return_output);

-- o_MUX_rmii_eth_mac_h_l194_c8_b281 : 0 clocks latency
o_MUX_rmii_eth_mac_h_l194_c8_b281 : entity work.MUX_uint1_t_rmii_tx_mac_t_rmii_tx_mac_t_0CLK_de264c78 port map (
o_MUX_rmii_eth_mac_h_l194_c8_b281_cond,
o_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue,
o_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse,
o_MUX_rmii_eth_mac_h_l194_c8_b281_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281 : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_return_output);

-- state_MUX_rmii_eth_mac_h_l194_c8_b281 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l194_c8_b281 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l194_c8_b281_cond,
state_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue,
state_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse,
state_MUX_rmii_eth_mac_h_l194_c8_b281_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_cond,
bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281 : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l194_c8_b281 : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l194_c8_b281 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_cond,
data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue,
data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse,
data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2 : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_left,
BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_right,
BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_return_output);

-- o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc : 0 clocks latency
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_cond,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output);

-- state_MUX_rmii_eth_mac_h_l202_c5_afbc : 0 clocks latency
state_MUX_rmii_eth_mac_h_l202_c5_afbc : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l202_c5_afbc_cond,
state_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue,
state_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse,
state_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_cond,
bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_cond,
data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue,
data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse,
data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output);

-- o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2 : 0 clocks latency
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse,
o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output);

-- state_MUX_rmii_eth_mac_h_l203_c7_c2b2 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l203_c7_c2b2 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond,
state_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue,
state_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse,
state_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond,
bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output);

-- last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2 : 0 clocks latency
last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond,
last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue,
last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse,
last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output);

-- data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2 : 0 clocks latency
data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond,
data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue,
data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse,
data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output);

-- CONST_SR_2_rmii_eth_mac_h_l218_c18_7f6e : 0 clocks latency
CONST_SR_2_rmii_eth_mac_h_l218_c18_7f6e : entity work.CONST_SR_2_uint8_t_0CLK_de264c78 port map (
CONST_SR_2_rmii_eth_mac_h_l218_c18_7f6e_x,
CONST_SR_2_rmii_eth_mac_h_l218_c18_7f6e_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_left,
BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_right,
BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_return_output);

-- o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7 : 0 clocks latency
o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_cond,
o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue,
o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse,
o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output);

-- o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7 : 0 clocks latency
o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_cond,
o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue,
o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse,
o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7 : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output);

-- state_MUX_rmii_eth_mac_h_l221_c8_34c7 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l221_c8_34c7 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l221_c8_34c7_cond,
state_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue,
state_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse,
state_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_cond,
bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output);

-- state_MUX_rmii_eth_mac_h_l226_c5_5276 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l226_c5_5276 : entity work.MUX_uint1_t_rmii_tx_mac_state_t_rmii_tx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l226_c5_5276_cond,
state_MUX_rmii_eth_mac_h_l226_c5_5276_iftrue,
state_MUX_rmii_eth_mac_h_l226_c5_5276_iffalse,
state_MUX_rmii_eth_mac_h_l226_c5_5276_return_output);

-- crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276 : 0 clocks latency
crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_cond,
crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_iftrue,
crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_iffalse,
crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276 : entity work.MUX_uint1_t_uint6_t_uint6_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_cond,
bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_return_output);

-- CONST_SR_2_rmii_eth_mac_h_l233_c23_4388 : 0 clocks latency
CONST_SR_2_rmii_eth_mac_h_l233_c23_4388 : entity work.CONST_SR_2_uint32_t_0CLK_de264c78 port map (
CONST_SR_2_rmii_eth_mac_h_l233_c23_4388_x,
CONST_SR_2_rmii_eth_mac_h_l233_c23_4388_return_output);

-- crc_MUX_rmii_eth_mac_h_l250_c3_5c7a : 0 clocks latency
crc_MUX_rmii_eth_mac_h_l250_c3_5c7a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_cond,
crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_iftrue,
crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_iffalse,
crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_return_output);

-- CONST_SR_4_rmii_eth_mac_h_l251_c12_a9e0 : 0 clocks latency
CONST_SR_4_rmii_eth_mac_h_l251_c12_a9e0 : entity work.CONST_SR_4_uint32_t_0CLK_de264c78 port map (
CONST_SR_4_rmii_eth_mac_h_l251_c12_a9e0_x,
CONST_SR_4_rmii_eth_mac_h_l251_c12_a9e0_return_output);

-- CONST_SR_0_rmii_eth_mac_h_l251_c42_f2d6 : 0 clocks latency
CONST_SR_0_rmii_eth_mac_h_l251_c42_f2d6 : entity work.CONST_SR_0_uint8_t_0CLK_de264c78 port map (
CONST_SR_0_rmii_eth_mac_h_l251_c42_f2d6_x,
CONST_SR_0_rmii_eth_mac_h_l251_c42_f2d6_return_output);

-- BIN_OP_XOR_rmii_eth_mac_h_l251_c35_a0bc : 0 clocks latency
BIN_OP_XOR_rmii_eth_mac_h_l251_c35_a0bc : entity work.BIN_OP_XOR_uint32_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_rmii_eth_mac_h_l251_c35_a0bc_left,
BIN_OP_XOR_rmii_eth_mac_h_l251_c35_a0bc_right,
BIN_OP_XOR_rmii_eth_mac_h_l251_c35_a0bc_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l251_c35_47ac : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l251_c35_47ac : entity work.BIN_OP_AND_uint32_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l251_c35_47ac_left,
BIN_OP_AND_rmii_eth_mac_h_l251_c35_47ac_right,
BIN_OP_AND_rmii_eth_mac_h_l251_c35_47ac_return_output);

-- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb : 0 clocks latency
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb : entity work.VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_0CLK_8bf83e3e port map (
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_0,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_1,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_2,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_3,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_4,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_5,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_6,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_7,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_8,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_9,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_10,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_11,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_12,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_13,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_14,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_15,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_var_dim_0,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_return_output);

-- BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4 : 0 clocks latency
BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4 : entity work.BIN_OP_XOR_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4_left,
BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4_right,
BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4_return_output);

-- CONST_SR_4_rmii_eth_mac_h_l252_c12_8804 : 0 clocks latency
CONST_SR_4_rmii_eth_mac_h_l252_c12_8804 : entity work.CONST_SR_4_uint32_t_0CLK_de264c78 port map (
CONST_SR_4_rmii_eth_mac_h_l252_c12_8804_x,
CONST_SR_4_rmii_eth_mac_h_l252_c12_8804_return_output);

-- CONST_SR_4_rmii_eth_mac_h_l252_c42_c088 : 0 clocks latency
CONST_SR_4_rmii_eth_mac_h_l252_c42_c088 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_rmii_eth_mac_h_l252_c42_c088_x,
CONST_SR_4_rmii_eth_mac_h_l252_c42_c088_return_output);

-- BIN_OP_XOR_rmii_eth_mac_h_l252_c35_3db8 : 0 clocks latency
BIN_OP_XOR_rmii_eth_mac_h_l252_c35_3db8 : entity work.BIN_OP_XOR_uint32_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_rmii_eth_mac_h_l252_c35_3db8_left,
BIN_OP_XOR_rmii_eth_mac_h_l252_c35_3db8_right,
BIN_OP_XOR_rmii_eth_mac_h_l252_c35_3db8_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l252_c35_048a : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l252_c35_048a : entity work.BIN_OP_AND_uint32_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l252_c35_048a_left,
BIN_OP_AND_rmii_eth_mac_h_l252_c35_048a_right,
BIN_OP_AND_rmii_eth_mac_h_l252_c35_048a_return_output);

-- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd : 0 clocks latency
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd : entity work.VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_0CLK_8bf83e3e port map (
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_0,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_1,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_2,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_3,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_4,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_5,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_6,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_7,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_8,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_9,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_10,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_11,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_12,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_13,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_14,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_15,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_var_dim_0,
VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_return_output);

-- BIN_OP_XOR_rmii_eth_mac_h_l252_c12_ebd9 : 0 clocks latency
BIN_OP_XOR_rmii_eth_mac_h_l252_c12_ebd9 : entity work.BIN_OP_XOR_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_XOR_rmii_eth_mac_h_l252_c12_ebd9_left,
BIN_OP_XOR_rmii_eth_mac_h_l252_c12_ebd9_right,
BIN_OP_XOR_rmii_eth_mac_h_l252_c12_ebd9_return_output);

-- crc_MUX_rmii_eth_mac_h_l254_c3_57a4 : 0 clocks latency
crc_MUX_rmii_eth_mac_h_l254_c3_57a4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
crc_MUX_rmii_eth_mac_h_l254_c3_57a4_cond,
crc_MUX_rmii_eth_mac_h_l254_c3_57a4_iftrue,
crc_MUX_rmii_eth_mac_h_l254_c3_57a4_iffalse,
crc_MUX_rmii_eth_mac_h_l254_c3_57a4_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l258_c28_e631 : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l258_c28_e631 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l258_c28_e631_left,
BIN_OP_AND_rmii_eth_mac_h_l258_c28_e631_right,
BIN_OP_AND_rmii_eth_mac_h_l258_c28_e631_return_output);

-- BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4 : 0 clocks latency
BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4 : entity work.BIN_OP_PLUS_uint6_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4_left,
BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4_right,
BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4_return_output);



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
 BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_return_output,
 o_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output,
 state_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output,
 reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output,
 data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output,
 state_MUX_rmii_eth_mac_h_l169_c5_8a9a_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_return_output,
 o_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output,
 state_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output,
 data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output,
 state_MUX_rmii_eth_mac_h_l176_c5_7f61_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_return_output,
 o_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output,
 state_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output,
 data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_return_output,
 o_MUX_rmii_eth_mac_h_l194_c8_b281_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_return_output,
 state_MUX_rmii_eth_mac_h_l194_c8_b281_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_return_output,
 data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_return_output,
 o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output,
 state_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output,
 data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output,
 o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output,
 state_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output,
 last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output,
 data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output,
 CONST_SR_2_rmii_eth_mac_h_l218_c18_7f6e_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_return_output,
 o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output,
 o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output,
 state_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output,
 state_MUX_rmii_eth_mac_h_l226_c5_5276_return_output,
 crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_return_output,
 CONST_SR_2_rmii_eth_mac_h_l233_c23_4388_return_output,
 crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_return_output,
 CONST_SR_4_rmii_eth_mac_h_l251_c12_a9e0_return_output,
 CONST_SR_0_rmii_eth_mac_h_l251_c42_f2d6_return_output,
 BIN_OP_XOR_rmii_eth_mac_h_l251_c35_a0bc_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l251_c35_47ac_return_output,
 VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_return_output,
 BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4_return_output,
 CONST_SR_4_rmii_eth_mac_h_l252_c12_8804_return_output,
 CONST_SR_4_rmii_eth_mac_h_l252_c42_c088_return_output,
 BIN_OP_XOR_rmii_eth_mac_h_l252_c35_3db8_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l252_c35_048a_return_output,
 VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_return_output,
 BIN_OP_XOR_rmii_eth_mac_h_l252_c12_ebd9_return_output,
 crc_MUX_rmii_eth_mac_h_l254_c3_57a4_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l258_c28_e631_return_output,
 BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : rmii_tx_mac_t;
 variable VAR_axis_in : axis8_t_stream_t;
 variable VAR_o : rmii_tx_mac_t;
 variable VAR_INC : unsigned(1 downto 0);
 variable VAR_preamble_ctr_end : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e_return_output : unsigned(0 downto 0);
 variable VAR_fcs_ctr_end : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca_return_output : unsigned(0 downto 0);
 variable VAR_last_bits_of_byte : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_return_output : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_data_rmii_eth_mac_h_l163_c3_5e9c : unsigned(1 downto 0);
 variable VAR_reset_crc : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_return_output : unsigned(0 downto 0);
 variable VAR_o_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue : rmii_tx_mac_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l167_c3_e2d6_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l169_c5_8a9a_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond : unsigned(0 downto 0);
 variable VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue : unsigned(0 downto 0);
 variable VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse : unsigned(0 downto 0);
 variable VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output : unsigned(0 downto 0);
 variable VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l169_c5_8a9a_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l169_c5_8a9a_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l169_c5_8a9a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_return_output : unsigned(0 downto 0);
 variable VAR_o_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue : rmii_tx_mac_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb_rmii_eth_mac_h_l173_c8_8db8_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l173_c8_8db8_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l176_c5_7f61_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l173_c8_8db8_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_cond : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l176_c5_7f61_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l176_c5_7f61_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l176_c5_7f61_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l178_c7_b330 : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l181_c7_0c3e : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_return_output : unsigned(0 downto 0);
 variable VAR_o_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue : rmii_tx_mac_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd_rmii_eth_mac_h_l184_c8_f0ca_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l194_c8_b281_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l194_c8_b281_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l192_c5_adf7 : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_return_output : unsigned(0 downto 0);
 variable VAR_o_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue : rmii_tx_mac_t;
 variable VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l194_c8_b281_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse : rmii_tx_mac_t;
 variable VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_0870_rmii_eth_mac_h_l194_c8_b281_return_output : rmii_tx_mac_t;
 variable VAR_o_MUX_rmii_eth_mac_h_l194_c8_b281_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l194_c8_b281_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_cond : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_cond : unsigned(0 downto 0);
 variable VAR_uint8_1_0_rmii_eth_mac_h_l196_c28_8773_return_output : unsigned(1 downto 0);
 variable VAR_last_bits_of_last_byte : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_return_output : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l202_c5_afbc_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l217_c7_c47d : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_cond : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_cond : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse : unsigned(0 downto 0);
 variable VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l204_c9_bf11 : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l212_c9_4fd0 : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse : unsigned(0 downto 0);
 variable VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond : unsigned(0 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse : unsigned(7 downto 0);
 variable VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_7f6e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_7f6e_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_return_output : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_cond : unsigned(0 downto 0);
 variable VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue : unsigned(1 downto 0);
 variable VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse : unsigned(1 downto 0);
 variable VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output : unsigned(1 downto 0);
 variable VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_return_output : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l226_c5_5276_return_output : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l221_c8_34c7_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_return_output : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_cond : unsigned(0 downto 0);
 variable VAR_uint32_1_0_rmii_eth_mac_h_l223_c28_f8a1_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l226_c5_5276_iftrue : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l226_c5_5276_iffalse : unsigned(2 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l226_c5_5276_cond : unsigned(0 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_iftrue : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_iffalse : unsigned(31 downto 0);
 variable VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_iftrue : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l228_c7_128f : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_iffalse : unsigned(5 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l232_c7_1f5e : unsigned(5 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_4388_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_4388_x : unsigned(31 downto 0);
 variable VAR_data_n : unsigned(7 downto 0);
 variable VAR_crc_table : uint32_t_16;
 variable VAR_crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_iftrue : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_iffalse : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_return_output : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_a9e0_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4_left : unsigned(31 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_a9e0_x : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_a0bc_left : unsigned(31 downto 0);
 variable VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_f2d6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_a0bc_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_f2d6_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_a0bc_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_47ac_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_47ac_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_47ac_return_output : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4_right : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_0 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_1 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_2 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_3 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_4 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_5 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_6 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_7 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_8 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_9 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_10 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_11 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_12 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_13 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_14 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_15 : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_8804_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_ebd9_left : unsigned(31 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_8804_x : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_3db8_left : unsigned(31 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_c088_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_3db8_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_c088_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_3db8_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_048a_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_048a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_048a_return_output : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_ebd9_right : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_0 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_1 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_2 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_3 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_4 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_5 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_6 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_7 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_8 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_9 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_10 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_11 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_12 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_13 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_14 : unsigned(31 downto 0);
 variable VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_15 : unsigned(31 downto 0);
 variable VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_ebd9_return_output : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l254_c3_57a4_iftrue : unsigned(31 downto 0);
 variable VAR_crc_rmii_eth_mac_h_l255_c5_fbd3 : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l254_c3_57a4_iffalse : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l254_c3_57a4_return_output : unsigned(31 downto 0);
 variable VAR_crc_MUX_rmii_eth_mac_h_l254_c3_57a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_e631_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_rmii_tx_mac_t_tx_mac_input_ready_d41d_rmii_eth_mac_h_l258_c44_421d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_e631_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_e631_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_h_l258_l169_DUPLICATE_f09b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4_left : unsigned(5 downto 0);
 variable VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4_return_output : unsigned(6 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l189_l257_l209_DUPLICATE_91d2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_rmii_eth_mac_h_l190_l210_DUPLICATE_ee23_return_output : unsigned(0 downto 0);
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
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e_right := to_unsigned(60, 6);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_1 := to_unsigned(1342890616, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_1 := to_unsigned(1342890616, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_8 := unsigned'(X"a005713c");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_8 := unsigned'(X"a005713c");
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_right := to_unsigned(6, 3);
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue := to_unsigned(0, 1);
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse := to_unsigned(0, 1);
     VAR_state_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue := unsigned(rmii_tx_mac_state_t_to_slv(FCS));
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse := to_unsigned(1, 1);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_2 := to_unsigned(1993593556, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_2 := to_unsigned(1993593556, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_0 := to_unsigned(1304293916, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_0 := to_unsigned(1304293916, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_6 := to_unsigned(1020740, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_6 := to_unsigned(1020740, 32);
     VAR_o_tx_mac_output_data_rmii_eth_mac_h_l163_c3_5e9c := resize(to_unsigned(0, 1), 2);
     VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse := VAR_o_tx_mac_output_data_rmii_eth_mac_h_l163_c3_5e9c;
     VAR_bit_counter_rmii_eth_mac_h_l192_c5_adf7 := resize(to_unsigned(0, 1), 6);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue := VAR_bit_counter_rmii_eth_mac_h_l192_c5_adf7;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_right := unsigned(rmii_tx_mac_state_t_to_slv(IDLE));
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_4 := to_unsigned(996258700, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_4 := to_unsigned(996258700, 32);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_right := unsigned(rmii_tx_mac_state_t_to_slv(FCS));
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_5 := to_unsigned(651600872, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_5 := to_unsigned(651600872, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_11 := unsigned'(X"86dc4190");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_11 := unsigned'(X"86dc4190");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_13 := unsigned'(X"cb6e20c8");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_13 := unsigned'(X"cb6e20c8");
     VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_47ac_right := to_unsigned(15, 8);
     VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse := to_unsigned(0, 1);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_12 := unsigned'(X"d6d930ac");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_12 := unsigned'(X"d6d930ac");
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_right := unsigned(rmii_tx_mac_state_t_to_slv(DATA));
     VAR_state_MUX_rmii_eth_mac_h_l169_c5_8a9a_iftrue := unsigned(rmii_tx_mac_state_t_to_slv(PREAMBLE));
     VAR_state_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue := unsigned(rmii_tx_mac_state_t_to_slv(DATA));
     VAR_state_MUX_rmii_eth_mac_h_l176_c5_7f61_iftrue := unsigned(rmii_tx_mac_state_t_to_slv(SFD));
     VAR_bit_counter_rmii_eth_mac_h_l204_c9_bf11 := resize(to_unsigned(0, 1), 6);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue := VAR_bit_counter_rmii_eth_mac_h_l204_c9_bf11;
     VAR_bit_counter_rmii_eth_mac_h_l178_c7_b330 := resize(to_unsigned(0, 1), 6);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_iftrue := VAR_bit_counter_rmii_eth_mac_h_l178_c7_b330;
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_9 := unsigned'(X"bdb26158");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_9 := unsigned'(X"bdb26158");
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_right := unsigned(rmii_tx_mac_state_t_to_slv(PREAMBLE));
     VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_048a_right := to_unsigned(15, 8);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_15 := unsigned'(X"f0000000");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_15 := unsigned'(X"f0000000");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_3 := to_unsigned(1801765552, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_3 := to_unsigned(1801765552, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_14 := unsigned'(X"edb71064");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_14 := unsigned'(X"edb71064");
     VAR_bit_counter_rmii_eth_mac_h_l228_c7_128f := resize(to_unsigned(0, 1), 6);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_iftrue := VAR_bit_counter_rmii_eth_mac_h_l228_c7_128f;
     VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca_right := to_unsigned(30, 5);
     VAR_crc_rmii_eth_mac_h_l255_c5_fbd3 := resize(to_unsigned(0, 1), 32);
     VAR_crc_MUX_rmii_eth_mac_h_l254_c3_57a4_iftrue := VAR_crc_rmii_eth_mac_h_l255_c5_fbd3;
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_10 := unsigned'(X"9b6b51f4");
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_10 := unsigned'(X"9b6b51f4");
     VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4_right := to_unsigned(2, 2);
     VAR_state_MUX_rmii_eth_mac_h_l226_c5_5276_iftrue := unsigned(rmii_tx_mac_state_t_to_slv(IDLE));
     VAR_bit_counter_rmii_eth_mac_h_l212_c9_4fd0 := resize(to_unsigned(0, 1), 6);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse := VAR_bit_counter_rmii_eth_mac_h_l212_c9_4fd0;
     VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_right := unsigned(rmii_tx_mac_state_t_to_slv(SFD));
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_7 := to_unsigned(498631456, 32);
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_7 := to_unsigned(498631456, 32);
     -- o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724[rmii_eth_mac_h_l167_c3_e2d6] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l167_c3_e2d6_return_output := CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724(
     VAR_o_tx_mac_output_data_rmii_eth_mac_h_l163_c3_5e9c,
     to_unsigned(0, 1),
     to_unsigned(0, 1));

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb[rmii_eth_mac_h_l173_c8_8db8] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb_rmii_eth_mac_h_l173_c8_8db8_return_output := CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb(
     to_unsigned(0, 1),
     to_unsigned(1, 2),
     to_unsigned(1, 1));

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd[rmii_eth_mac_h_l184_c8_f0ca] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd_rmii_eth_mac_h_l184_c8_f0ca_return_output := CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd(
     to_unsigned(1, 1),
     to_unsigned(3, 2),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_o_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l167_c3_e2d6_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_b5cd_rmii_eth_mac_h_l184_c8_f0ca_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_6bcb_rmii_eth_mac_h_l173_c8_8db8_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;
     -- Mux in inputs
     VAR_axis_in := axis_in;

     -- Submodule level 0
     VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_f2d6_x := axis_in_data_reg;
     VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_c088_x := axis_in_data_reg;
     VAR_crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_cond := axis_in_data_reg_valid;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e_left := bit_counter;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca_left := bit_counter;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_left := bit_counter;
     VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4_left := bit_counter;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue := bit_counter;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse := bit_counter;
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_a0bc_left := crc;
     VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_a9e0_x := crc;
     VAR_crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_iffalse := crc;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue := crc;
     VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_4388_x := crc_shift_reg;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue := crc_shift_reg;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue := crc_shift_reg;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue := crc_shift_reg;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse := crc_shift_reg;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_iftrue := crc_shift_reg;
     VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_7f6e_x := data_reg;
     VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue := data_reg;
     VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue := data_reg;
     VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse := data_reg;
     VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue := data_reg;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_right := last_byte_reg;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue := last_byte_reg;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue := last_byte_reg;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse := last_byte_reg;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse := last_byte_reg;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue := last_byte_reg;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_left := state;
     VAR_state_MUX_rmii_eth_mac_h_l169_c5_8a9a_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l176_c5_7f61_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l226_c5_5276_iffalse := state;
     -- BIN_OP_EQ[rmii_eth_mac_h_l160_c32_22f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_left;
     BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_return_output := BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l194_c11_145e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_left;
     BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_return_output := BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_return_output;

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_h_l258_l169_DUPLICATE_f09b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_h_l258_l169_DUPLICATE_f09b_return_output := VAR_axis_in.valid;

     -- BIN_OP_EQ[rmii_eth_mac_h_l184_c11_f463] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_left;
     BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_return_output := BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_return_output;

     -- CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l189_l257_l209_DUPLICATE_91d2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l189_l257_l209_DUPLICATE_91d2_return_output := VAR_axis_in.data.tdata(0);

     -- BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4_left <= VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4_left;
     BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4_right <= VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4_return_output := BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4_return_output;

     -- CONST_SR_2[rmii_eth_mac_h_l218_c18_7f6e] LATENCY=0
     -- Inputs
     CONST_SR_2_rmii_eth_mac_h_l218_c18_7f6e_x <= VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_7f6e_x;
     -- Outputs
     VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_7f6e_return_output := CONST_SR_2_rmii_eth_mac_h_l218_c18_7f6e_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l173_c11_f855] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_left;
     BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_return_output := BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l221_c11_9632] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_left;
     BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_return_output := BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_return_output;

     -- uint32_1_0[rmii_eth_mac_h_l223_c28_f8a1] LATENCY=0
     VAR_uint32_1_0_rmii_eth_mac_h_l223_c28_f8a1_return_output := uint32_1_0(
     crc_shift_reg);

     -- CONST_SR_4[rmii_eth_mac_h_l251_c12_a9e0] LATENCY=0
     -- Inputs
     CONST_SR_4_rmii_eth_mac_h_l251_c12_a9e0_x <= VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_a9e0_x;
     -- Outputs
     VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_a9e0_return_output := CONST_SR_4_rmii_eth_mac_h_l251_c12_a9e0_return_output;

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_rmii_eth_mac_h_l190_l210_DUPLICATE_ee23 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_rmii_eth_mac_h_l190_l210_DUPLICATE_ee23_return_output := VAR_axis_in.data.tlast;

     -- BIN_OP_EQ[rmii_eth_mac_h_l158_c31_8b5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e_left;
     BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e_return_output := BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e_return_output;

     -- CONST_SR_2[rmii_eth_mac_h_l233_c23_4388] LATENCY=0
     -- Inputs
     CONST_SR_2_rmii_eth_mac_h_l233_c23_4388_x <= VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_4388_x;
     -- Outputs
     VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_4388_return_output := CONST_SR_2_rmii_eth_mac_h_l233_c23_4388_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l167_c6_e479] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_left;
     BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_return_output := BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_return_output;

     -- uint8_1_0[rmii_eth_mac_h_l196_c28_8773] LATENCY=0
     VAR_uint8_1_0_rmii_eth_mac_h_l196_c28_8773_return_output := uint8_1_0(
     data_reg);

     -- CONST_SR_4[rmii_eth_mac_h_l252_c42_c088] LATENCY=0
     -- Inputs
     CONST_SR_4_rmii_eth_mac_h_l252_c42_c088_x <= VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_c088_x;
     -- Outputs
     VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_c088_return_output := CONST_SR_4_rmii_eth_mac_h_l252_c42_c088_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l159_c26_52ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca_left;
     BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca_return_output := BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca_return_output;

     -- CONST_SR_0[rmii_eth_mac_h_l251_c42_f2d6] LATENCY=0
     -- Inputs
     CONST_SR_0_rmii_eth_mac_h_l251_c42_f2d6_x <= VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_f2d6_x;
     -- Outputs
     VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_f2d6_return_output := CONST_SR_0_rmii_eth_mac_h_l251_c42_f2d6_return_output;

     -- Submodule level 1
     VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l176_c5_7f61_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l158_c31_8b5e_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l226_c5_5276_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l159_c26_52ca_return_output;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_left := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_return_output;
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l202_c5_afbc_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l160_c32_22f4_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_return_output;
     VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l167_c6_e479_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l173_c8_8db8_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l173_c8_8db8_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l173_c11_f855_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l184_c11_f463_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l194_c8_b281_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l194_c8_b281_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l194_c11_145e_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_return_output;
     VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_return_output;
     VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l221_c8_34c7_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l221_c11_9632_return_output;
     VAR_bit_counter_rmii_eth_mac_h_l181_c7_0c3e := resize(VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4_return_output, 6);
     VAR_bit_counter_rmii_eth_mac_h_l217_c7_c47d := resize(VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4_return_output, 6);
     VAR_bit_counter_rmii_eth_mac_h_l232_c7_1f5e := resize(VAR_BIN_OP_PLUS_uint6_t_uint2_t_rmii_eth_mac_h_l232_l217_l181_DUPLICATE_76a4_return_output, 6);
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_rmii_eth_mac_h_l190_l210_DUPLICATE_ee23_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_data_tlast_d41d_rmii_eth_mac_h_l190_l210_DUPLICATE_ee23_return_output;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_e631_left := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_h_l258_l169_DUPLICATE_f09b_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l169_c5_8a9a_cond := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_rmii_eth_mac_h_l258_l169_DUPLICATE_f09b_return_output;
     REG_VAR_axis_in_data_reg := VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l189_l257_l209_DUPLICATE_91d2_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue := VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l189_l257_l209_DUPLICATE_91d2_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse := VAR_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_rmii_eth_mac_h_l189_l257_l209_DUPLICATE_91d2_return_output;
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_a0bc_right := VAR_CONST_SR_0_rmii_eth_mac_h_l251_c42_f2d6_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse := VAR_CONST_SR_2_rmii_eth_mac_h_l218_c18_7f6e_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_iffalse := VAR_CONST_SR_2_rmii_eth_mac_h_l233_c23_4388_return_output;
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4_left := VAR_CONST_SR_4_rmii_eth_mac_h_l251_c12_a9e0_return_output;
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_3db8_right := VAR_CONST_SR_4_rmii_eth_mac_h_l252_c42_c088_return_output;
     VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue := VAR_uint32_1_0_rmii_eth_mac_h_l223_c28_f8a1_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_iffalse := VAR_bit_counter_rmii_eth_mac_h_l181_c7_0c3e;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse := VAR_bit_counter_rmii_eth_mac_h_l217_c7_c47d;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_iffalse := VAR_bit_counter_rmii_eth_mac_h_l232_c7_1f5e;
     -- state_MUX[rmii_eth_mac_h_l169_c5_8a9a] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l169_c5_8a9a_cond <= VAR_state_MUX_rmii_eth_mac_h_l169_c5_8a9a_cond;
     state_MUX_rmii_eth_mac_h_l169_c5_8a9a_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l169_c5_8a9a_iftrue;
     state_MUX_rmii_eth_mac_h_l169_c5_8a9a_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l169_c5_8a9a_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l169_c5_8a9a_return_output := state_MUX_rmii_eth_mac_h_l169_c5_8a9a_return_output;

     -- o_tx_mac_output_valid_MUX[rmii_eth_mac_h_l221_c8_34c7] LATENCY=0
     -- Inputs
     o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_cond <= VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_cond;
     o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue <= VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue;
     o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse <= VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse;
     -- Outputs
     VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output := o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output;

     -- o_tx_mac_output_data_MUX[rmii_eth_mac_h_l221_c8_34c7] LATENCY=0
     -- Inputs
     o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_cond <= VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_cond;
     o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue <= VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue;
     o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse <= VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse;
     -- Outputs
     VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output := o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output;

     -- crc_shift_reg_MUX[rmii_eth_mac_h_l226_c5_5276] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_return_output;

     -- reset_crc_MUX[rmii_eth_mac_h_l167_c3_e2d6] LATENCY=0
     -- Inputs
     reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond <= VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond;
     reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue <= VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue;
     reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse <= VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse;
     -- Outputs
     VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output := reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output;

     -- state_MUX[rmii_eth_mac_h_l226_c5_5276] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l226_c5_5276_cond <= VAR_state_MUX_rmii_eth_mac_h_l226_c5_5276_cond;
     state_MUX_rmii_eth_mac_h_l226_c5_5276_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l226_c5_5276_iftrue;
     state_MUX_rmii_eth_mac_h_l226_c5_5276_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l226_c5_5276_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l226_c5_5276_return_output := state_MUX_rmii_eth_mac_h_l226_c5_5276_return_output;

     -- BIN_OP_AND[rmii_eth_mac_h_l201_c38_69a2] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_left;
     BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_return_output := BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l226_c5_5276] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_cond;
     bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_return_output := bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_return_output;

     -- BIN_OP_XOR[rmii_eth_mac_h_l251_c35_a0bc] LATENCY=0
     -- Inputs
     BIN_OP_XOR_rmii_eth_mac_h_l251_c35_a0bc_left <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_a0bc_left;
     BIN_OP_XOR_rmii_eth_mac_h_l251_c35_a0bc_right <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_a0bc_right;
     -- Outputs
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_a0bc_return_output := BIN_OP_XOR_rmii_eth_mac_h_l251_c35_a0bc_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l176_c5_7f61] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_cond;
     bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_return_output := bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_return_output;

     -- state_MUX[rmii_eth_mac_h_l176_c5_7f61] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l176_c5_7f61_cond <= VAR_state_MUX_rmii_eth_mac_h_l176_c5_7f61_cond;
     state_MUX_rmii_eth_mac_h_l176_c5_7f61_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l176_c5_7f61_iftrue;
     state_MUX_rmii_eth_mac_h_l176_c5_7f61_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l176_c5_7f61_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l176_c5_7f61_return_output := state_MUX_rmii_eth_mac_h_l176_c5_7f61_return_output;

     -- Submodule level 2
     VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_return_output;
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l201_c38_69a2_return_output;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_47ac_left := VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c35_a0bc_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l176_c5_7f61_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l226_c5_5276_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l226_c5_5276_return_output;
     VAR_crc_MUX_rmii_eth_mac_h_l254_c3_57a4_cond := VAR_reset_crc_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue := VAR_state_MUX_rmii_eth_mac_h_l169_c5_8a9a_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue := VAR_state_MUX_rmii_eth_mac_h_l176_c5_7f61_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue := VAR_state_MUX_rmii_eth_mac_h_l226_c5_5276_return_output;
     -- BIN_OP_AND[rmii_eth_mac_h_l251_c35_47ac] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l251_c35_47ac_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_47ac_left;
     BIN_OP_AND_rmii_eth_mac_h_l251_c35_47ac_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_47ac_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_47ac_return_output := BIN_OP_AND_rmii_eth_mac_h_l251_c35_47ac_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l221_c8_34c7] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_cond;
     bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output := bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output;

     -- o_tx_mac_input_ready_MUX[rmii_eth_mac_h_l203_c7_c2b2] LATENCY=0
     -- Inputs
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond;
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue;
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse;
     -- Outputs
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output := o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output;

     -- crc_shift_reg_MUX[rmii_eth_mac_h_l221_c8_34c7] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output;

     -- state_MUX[rmii_eth_mac_h_l221_c8_34c7] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l221_c8_34c7_cond <= VAR_state_MUX_rmii_eth_mac_h_l221_c8_34c7_cond;
     state_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l221_c8_34c7_iftrue;
     state_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l221_c8_34c7_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output := state_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l203_c7_c2b2] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond;
     bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output := bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output;

     -- last_byte_reg_MUX[rmii_eth_mac_h_l203_c7_c2b2] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output;

     -- data_reg_MUX[rmii_eth_mac_h_l203_c7_c2b2] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond;
     data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output := data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output;

     -- o_FALSE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_0870[rmii_eth_mac_h_l194_c8_b281] LATENCY=0
     VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_0870_rmii_eth_mac_h_l194_c8_b281_return_output := CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_0870(
     to_unsigned(0, 1),
     VAR_o_tx_mac_output_valid_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output,
     VAR_o_tx_mac_output_data_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output);

     -- state_MUX[rmii_eth_mac_h_l203_c7_c2b2] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond <= VAR_state_MUX_rmii_eth_mac_h_l203_c7_c2b2_cond;
     state_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l203_c7_c2b2_iftrue;
     state_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l203_c7_c2b2_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output := state_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output;

     -- Submodule level 3
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_var_dim_0 := resize(VAR_BIN_OP_AND_rmii_eth_mac_h_l251_c35_47ac_return_output, 4);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue := VAR_data_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse := VAR_o_FALSE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_0870_rmii_eth_mac_h_l194_c8_b281_return_output;
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue := VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue := VAR_state_MUX_rmii_eth_mac_h_l203_c7_c2b2_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse := VAR_state_MUX_rmii_eth_mac_h_l221_c8_34c7_return_output;
     -- state_MUX[rmii_eth_mac_h_l202_c5_afbc] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l202_c5_afbc_cond <= VAR_state_MUX_rmii_eth_mac_h_l202_c5_afbc_cond;
     state_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue;
     state_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output := state_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output;

     -- crc_shift_reg_MUX[rmii_eth_mac_h_l194_c8_b281] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_return_output;

     -- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60[rmii_eth_mac_h_l251_c24_e1eb] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_0 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_0;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_1 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_1;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_2 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_2;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_3 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_3;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_4 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_4;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_5 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_5;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_6 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_6;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_7 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_7;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_8 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_8;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_9 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_9;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_10 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_10;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_11 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_11;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_12 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_12;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_13 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_13;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_14 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_14;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_15 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_ref_toks_15;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_var_dim_0 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_return_output := VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_return_output;

     -- data_reg_MUX[rmii_eth_mac_h_l202_c5_afbc] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_cond;
     data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output := data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l202_c5_afbc] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_cond;
     bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output := bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output;

     -- o_tx_mac_input_ready_MUX[rmii_eth_mac_h_l202_c5_afbc] LATENCY=0
     -- Inputs
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_cond <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_cond;
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue;
     o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse <= VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse;
     -- Outputs
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output := o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output;

     -- last_byte_reg_MUX[rmii_eth_mac_h_l202_c5_afbc] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output;

     -- Submodule level 4
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4_right := VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l251_c24_e1eb_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l194_c8_b281_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue := VAR_data_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue := VAR_state_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output;
     -- last_byte_reg_MUX[rmii_eth_mac_h_l194_c8_b281] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_return_output;

     -- crc_shift_reg_MUX[rmii_eth_mac_h_l184_c8_f0ca] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output;

     -- o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724[rmii_eth_mac_h_l194_c8_b281] LATENCY=0
     VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l194_c8_b281_return_output := CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724(
     VAR_uint8_1_0_rmii_eth_mac_h_l196_c28_8773_return_output,
     to_unsigned(1, 1),
     VAR_o_tx_mac_input_ready_MUX_rmii_eth_mac_h_l202_c5_afbc_return_output);

     -- data_reg_MUX[rmii_eth_mac_h_l194_c8_b281] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_cond;
     data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_return_output := data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l194_c8_b281] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_cond;
     bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_return_output := bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_return_output;

     -- state_MUX[rmii_eth_mac_h_l194_c8_b281] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l194_c8_b281_cond <= VAR_state_MUX_rmii_eth_mac_h_l194_c8_b281_cond;
     state_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue;
     state_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l194_c8_b281_return_output := state_MUX_rmii_eth_mac_h_l194_c8_b281_return_output;

     -- BIN_OP_XOR[rmii_eth_mac_h_l251_c12_ecc4] LATENCY=0
     -- Inputs
     BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4_left <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4_left;
     BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4_right <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4_right;
     -- Outputs
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4_return_output := BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4_return_output;

     -- Submodule level 5
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_3db8_left := VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4_return_output;
     VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_8804_x := VAR_BIN_OP_XOR_rmii_eth_mac_h_l251_c12_ecc4_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l194_c8_b281_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse := VAR_data_reg_MUX_rmii_eth_mac_h_l194_c8_b281_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l194_c8_b281_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue := VAR_o_TRUE_INPUT_MUX_CONST_REF_RD_rmii_tx_mac_t_rmii_tx_mac_t_5724_rmii_eth_mac_h_l194_c8_b281_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse := VAR_state_MUX_rmii_eth_mac_h_l194_c8_b281_return_output;
     -- o_MUX[rmii_eth_mac_h_l194_c8_b281] LATENCY=0
     -- Inputs
     o_MUX_rmii_eth_mac_h_l194_c8_b281_cond <= VAR_o_MUX_rmii_eth_mac_h_l194_c8_b281_cond;
     o_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue <= VAR_o_MUX_rmii_eth_mac_h_l194_c8_b281_iftrue;
     o_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse <= VAR_o_MUX_rmii_eth_mac_h_l194_c8_b281_iffalse;
     -- Outputs
     VAR_o_MUX_rmii_eth_mac_h_l194_c8_b281_return_output := o_MUX_rmii_eth_mac_h_l194_c8_b281_return_output;

     -- state_MUX[rmii_eth_mac_h_l184_c8_f0ca] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond <= VAR_state_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond;
     state_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue;
     state_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output := state_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output;

     -- crc_shift_reg_MUX[rmii_eth_mac_h_l173_c8_8db8] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output;

     -- data_reg_MUX[rmii_eth_mac_h_l184_c8_f0ca] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond;
     data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output := data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output;

     -- BIN_OP_XOR[rmii_eth_mac_h_l252_c35_3db8] LATENCY=0
     -- Inputs
     BIN_OP_XOR_rmii_eth_mac_h_l252_c35_3db8_left <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_3db8_left;
     BIN_OP_XOR_rmii_eth_mac_h_l252_c35_3db8_right <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_3db8_right;
     -- Outputs
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_3db8_return_output := BIN_OP_XOR_rmii_eth_mac_h_l252_c35_3db8_return_output;

     -- CONST_SR_4[rmii_eth_mac_h_l252_c12_8804] LATENCY=0
     -- Inputs
     CONST_SR_4_rmii_eth_mac_h_l252_c12_8804_x <= VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_8804_x;
     -- Outputs
     VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_8804_return_output := CONST_SR_4_rmii_eth_mac_h_l252_c12_8804_return_output;

     -- last_byte_reg_MUX[rmii_eth_mac_h_l184_c8_f0ca] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l184_c8_f0ca] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond;
     bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output := bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output;

     -- Submodule level 6
     VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_048a_left := VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c35_3db8_return_output;
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_ebd9_left := VAR_CONST_SR_4_rmii_eth_mac_h_l252_c12_8804_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output;
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse := VAR_data_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse := VAR_o_MUX_rmii_eth_mac_h_l194_c8_b281_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse := VAR_state_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output;
     -- crc_shift_reg_MUX[rmii_eth_mac_h_l167_c3_e2d6] LATENCY=0
     -- Inputs
     crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond;
     crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue;
     crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse <= VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse;
     -- Outputs
     VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output := crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output;

     -- state_MUX[rmii_eth_mac_h_l173_c8_8db8] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l173_c8_8db8_cond <= VAR_state_MUX_rmii_eth_mac_h_l173_c8_8db8_cond;
     state_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue;
     state_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output := state_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output;

     -- last_byte_reg_MUX[rmii_eth_mac_h_l173_c8_8db8] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output;

     -- o_MUX[rmii_eth_mac_h_l184_c8_f0ca] LATENCY=0
     -- Inputs
     o_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond <= VAR_o_MUX_rmii_eth_mac_h_l184_c8_f0ca_cond;
     o_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue <= VAR_o_MUX_rmii_eth_mac_h_l184_c8_f0ca_iftrue;
     o_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse <= VAR_o_MUX_rmii_eth_mac_h_l184_c8_f0ca_iffalse;
     -- Outputs
     VAR_o_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output := o_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output;

     -- BIN_OP_AND[rmii_eth_mac_h_l252_c35_048a] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l252_c35_048a_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_048a_left;
     BIN_OP_AND_rmii_eth_mac_h_l252_c35_048a_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_048a_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_048a_return_output := BIN_OP_AND_rmii_eth_mac_h_l252_c35_048a_return_output;

     -- data_reg_MUX[rmii_eth_mac_h_l173_c8_8db8] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_cond;
     data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output := data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l173_c8_8db8] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_cond;
     bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output := bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output;

     -- Submodule level 7
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_var_dim_0 := resize(VAR_BIN_OP_AND_rmii_eth_mac_h_l252_c35_048a_return_output, 4);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output;
     REG_VAR_crc_shift_reg := VAR_crc_shift_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output;
     VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse := VAR_data_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output;
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse := VAR_o_MUX_rmii_eth_mac_h_l184_c8_f0ca_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse := VAR_state_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output;
     -- state_MUX[rmii_eth_mac_h_l167_c3_e2d6] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond <= VAR_state_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond;
     state_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue;
     state_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output := state_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output;

     -- last_byte_reg_MUX[rmii_eth_mac_h_l167_c3_e2d6] LATENCY=0
     -- Inputs
     last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond;
     last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue;
     last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse <= VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse;
     -- Outputs
     VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output := last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output;

     -- o_MUX[rmii_eth_mac_h_l173_c8_8db8] LATENCY=0
     -- Inputs
     o_MUX_rmii_eth_mac_h_l173_c8_8db8_cond <= VAR_o_MUX_rmii_eth_mac_h_l173_c8_8db8_cond;
     o_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue <= VAR_o_MUX_rmii_eth_mac_h_l173_c8_8db8_iftrue;
     o_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse <= VAR_o_MUX_rmii_eth_mac_h_l173_c8_8db8_iffalse;
     -- Outputs
     VAR_o_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output := o_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l167_c3_e2d6] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond;
     bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output := bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output;

     -- VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60[rmii_eth_mac_h_l252_c24_ccfd] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_0 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_0;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_1 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_1;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_2 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_2;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_3 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_3;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_4 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_4;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_5 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_5;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_6 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_6;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_7 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_7;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_8 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_8;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_9 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_9;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_10 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_10;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_11 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_11;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_12 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_12;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_13 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_13;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_14 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_14;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_15 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_ref_toks_15;
     VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_var_dim_0 <= VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_return_output := VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_return_output;

     -- data_reg_MUX[rmii_eth_mac_h_l167_c3_e2d6] LATENCY=0
     -- Inputs
     data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond <= VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond;
     data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue <= VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue;
     data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse <= VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse;
     -- Outputs
     VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output := data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output;

     -- Submodule level 8
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_ebd9_right := VAR_VAR_REF_RD_uint32_t_uint32_t_16_VAR_7a60_rmii_eth_mac_h_l252_c24_ccfd_return_output;
     REG_VAR_bit_counter := VAR_bit_counter_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output;
     REG_VAR_data_reg := VAR_data_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output;
     REG_VAR_last_byte_reg := VAR_last_byte_reg_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output;
     VAR_o_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse := VAR_o_MUX_rmii_eth_mac_h_l173_c8_8db8_return_output;
     REG_VAR_state := VAR_state_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output;
     -- BIN_OP_XOR[rmii_eth_mac_h_l252_c12_ebd9] LATENCY=0
     -- Inputs
     BIN_OP_XOR_rmii_eth_mac_h_l252_c12_ebd9_left <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_ebd9_left;
     BIN_OP_XOR_rmii_eth_mac_h_l252_c12_ebd9_right <= VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_ebd9_right;
     -- Outputs
     VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_ebd9_return_output := BIN_OP_XOR_rmii_eth_mac_h_l252_c12_ebd9_return_output;

     -- o_MUX[rmii_eth_mac_h_l167_c3_e2d6] LATENCY=0
     -- Inputs
     o_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond <= VAR_o_MUX_rmii_eth_mac_h_l167_c3_e2d6_cond;
     o_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue <= VAR_o_MUX_rmii_eth_mac_h_l167_c3_e2d6_iftrue;
     o_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse <= VAR_o_MUX_rmii_eth_mac_h_l167_c3_e2d6_iffalse;
     -- Outputs
     VAR_o_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output := o_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output;

     -- Submodule level 9
     VAR_crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_iftrue := VAR_BIN_OP_XOR_rmii_eth_mac_h_l252_c12_ebd9_return_output;
     VAR_return_output := VAR_o_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output;
     -- crc_MUX[rmii_eth_mac_h_l250_c3_5c7a] LATENCY=0
     -- Inputs
     crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_cond <= VAR_crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_cond;
     crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_iftrue <= VAR_crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_iftrue;
     crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_iffalse <= VAR_crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_iffalse;
     -- Outputs
     VAR_crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_return_output := crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_return_output;

     -- CONST_REF_RD_uint1_t_rmii_tx_mac_t_tx_mac_input_ready_d41d[rmii_eth_mac_h_l258_c44_421d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_rmii_tx_mac_t_tx_mac_input_ready_d41d_rmii_eth_mac_h_l258_c44_421d_return_output := VAR_o_MUX_rmii_eth_mac_h_l167_c3_e2d6_return_output.tx_mac_input_ready;

     -- Submodule level 10
     VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_e631_right := VAR_CONST_REF_RD_uint1_t_rmii_tx_mac_t_tx_mac_input_ready_d41d_rmii_eth_mac_h_l258_c44_421d_return_output;
     VAR_crc_MUX_rmii_eth_mac_h_l254_c3_57a4_iffalse := VAR_crc_MUX_rmii_eth_mac_h_l250_c3_5c7a_return_output;
     -- BIN_OP_AND[rmii_eth_mac_h_l258_c28_e631] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l258_c28_e631_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_e631_left;
     BIN_OP_AND_rmii_eth_mac_h_l258_c28_e631_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_e631_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_e631_return_output := BIN_OP_AND_rmii_eth_mac_h_l258_c28_e631_return_output;

     -- crc_MUX[rmii_eth_mac_h_l254_c3_57a4] LATENCY=0
     -- Inputs
     crc_MUX_rmii_eth_mac_h_l254_c3_57a4_cond <= VAR_crc_MUX_rmii_eth_mac_h_l254_c3_57a4_cond;
     crc_MUX_rmii_eth_mac_h_l254_c3_57a4_iftrue <= VAR_crc_MUX_rmii_eth_mac_h_l254_c3_57a4_iftrue;
     crc_MUX_rmii_eth_mac_h_l254_c3_57a4_iffalse <= VAR_crc_MUX_rmii_eth_mac_h_l254_c3_57a4_iffalse;
     -- Outputs
     VAR_crc_MUX_rmii_eth_mac_h_l254_c3_57a4_return_output := crc_MUX_rmii_eth_mac_h_l254_c3_57a4_return_output;

     -- Submodule level 11
     REG_VAR_axis_in_data_reg_valid := VAR_BIN_OP_AND_rmii_eth_mac_h_l258_c28_e631_return_output;
     REG_VAR_crc := VAR_crc_MUX_rmii_eth_mac_h_l254_c3_57a4_return_output;
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
