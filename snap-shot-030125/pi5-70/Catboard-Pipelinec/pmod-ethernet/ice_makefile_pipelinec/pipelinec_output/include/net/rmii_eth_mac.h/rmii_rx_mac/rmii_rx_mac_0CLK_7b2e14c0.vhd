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
-- Submodules: 71
entity rmii_rx_mac_0CLK_7b2e14c0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 data_in : in unsigned(1 downto 0);
 data_in_valid : in unsigned(0 downto 0);
 return_output : out rmii_rx_mac_t);
end rmii_rx_mac_0CLK_7b2e14c0;
architecture arch of rmii_rx_mac_0CLK_7b2e14c0 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal data_in_regs : uint2_t_20 := (others => to_unsigned(0, 2));
signal data_in_valid_regs : uint1_t_20 := (others => to_unsigned(0, 1));
signal data_out_reg : unsigned(7 downto 0) := to_unsigned(0, 8);
signal state : unsigned(1 downto 0) := unsigned(rmii_rx_mac_state_t_to_slv(rmii_rx_mac_state_t'left));
signal bit_counter : unsigned(2 downto 0) := to_unsigned(0, 3);
signal byte_counter : unsigned(1 downto 0) := to_unsigned(0, 2);
signal fcs_reg : unsigned(31 downto 0) := to_unsigned(0, 32);
signal REG_COMB_data_in_regs : uint2_t_20;
signal REG_COMB_data_in_valid_regs : uint1_t_20;
signal REG_COMB_data_out_reg : unsigned(7 downto 0);
signal REG_COMB_state : unsigned(1 downto 0);
signal REG_COMB_bit_counter : unsigned(2 downto 0);
signal REG_COMB_byte_counter : unsigned(1 downto 0);
signal REG_COMB_fcs_reg : unsigned(31 downto 0);

-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Each function instance gets signals
-- BIN_OP_EQ[rmii_eth_mac_h_l43_c22_2bbe]
signal BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l44_c53_b061]
signal BIN_OP_EQ_rmii_eth_mac_h_l44_c53_b061_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l44_c53_b061_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l44_c53_b061_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l44_c28_71a7]
signal BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_left : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_right : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l45_c48_d07e]
signal BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d07e_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d07e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d07e_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l45_c23_261d]
signal BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d_left : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d_right : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l48_c6_53ce]
signal BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l48_c3_bef6]
signal bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output : unsigned(2 downto 0);

-- data_out_reg_MUX[rmii_eth_mac_h_l48_c3_bef6]
signal data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_cond : unsigned(0 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output : unsigned(7 downto 0);

-- last_MUX[rmii_eth_mac_h_l48_c3_bef6]
signal last_MUX_rmii_eth_mac_h_l48_c3_bef6_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output : unsigned(0 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l48_c3_bef6]
signal byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output : unsigned(1 downto 0);

-- fcs_reg_MUX[rmii_eth_mac_h_l48_c3_bef6]
signal fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_cond : unsigned(0 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output : unsigned(31 downto 0);

-- err_MUX[rmii_eth_mac_h_l48_c3_bef6]
signal err_MUX_rmii_eth_mac_h_l48_c3_bef6_cond : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output : unsigned(0 downto 0);

-- valid_MUX[rmii_eth_mac_h_l48_c3_bef6]
signal valid_MUX_rmii_eth_mac_h_l48_c3_bef6_cond : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l48_c3_bef6]
signal state_MUX_rmii_eth_mac_h_l48_c3_bef6_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output : unsigned(1 downto 0);

-- err_MUX[rmii_eth_mac_h_l54_c5_0acc]
signal err_MUX_rmii_eth_mac_h_l54_c5_0acc_cond : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l54_c5_0acc_iftrue : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l54_c5_0acc_iffalse : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l54_c5_0acc_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l54_c5_0acc]
signal state_MUX_rmii_eth_mac_h_l54_c5_0acc_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l54_c5_0acc_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l54_c5_0acc_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l54_c5_0acc_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l59_c11_4058]
signal BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l59_c8_8d8d]
signal bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output : unsigned(2 downto 0);

-- data_out_reg_MUX[rmii_eth_mac_h_l59_c8_8d8d]
signal data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond : unsigned(0 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output : unsigned(7 downto 0);

-- last_MUX[rmii_eth_mac_h_l59_c8_8d8d]
signal last_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output : unsigned(0 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l59_c8_8d8d]
signal byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output : unsigned(1 downto 0);

-- fcs_reg_MUX[rmii_eth_mac_h_l59_c8_8d8d]
signal fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond : unsigned(0 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output : unsigned(31 downto 0);

-- err_MUX[rmii_eth_mac_h_l59_c8_8d8d]
signal err_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output : unsigned(0 downto 0);

-- valid_MUX[rmii_eth_mac_h_l59_c8_8d8d]
signal valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l59_c8_8d8d]
signal state_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output : unsigned(1 downto 0);

-- err_MUX[rmii_eth_mac_h_l60_c5_084e]
signal err_MUX_rmii_eth_mac_h_l60_c5_084e_cond : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l60_c5_084e_iftrue : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l60_c5_084e_iffalse : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l60_c5_084e_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l60_c5_084e]
signal state_MUX_rmii_eth_mac_h_l60_c5_084e_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l60_c5_084e_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l60_c5_084e_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l60_c5_084e_return_output : unsigned(1 downto 0);

-- err_MUX[rmii_eth_mac_h_l63_c10_f9cc]
signal err_MUX_rmii_eth_mac_h_l63_c10_f9cc_cond : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l63_c10_f9cc_iftrue : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l63_c10_f9cc_iffalse : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l63_c10_f9cc_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l63_c10_f9cc]
signal state_MUX_rmii_eth_mac_h_l63_c10_f9cc_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l63_c10_f9cc_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l63_c10_f9cc_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l63_c10_f9cc_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l71_c11_c8a1]
signal BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l71_c8_0252]
signal bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_return_output : unsigned(2 downto 0);

-- data_out_reg_MUX[rmii_eth_mac_h_l71_c8_0252]
signal data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_cond : unsigned(0 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_return_output : unsigned(7 downto 0);

-- last_MUX[rmii_eth_mac_h_l71_c8_0252]
signal last_MUX_rmii_eth_mac_h_l71_c8_0252_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l71_c8_0252_return_output : unsigned(0 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l71_c8_0252]
signal byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_return_output : unsigned(1 downto 0);

-- fcs_reg_MUX[rmii_eth_mac_h_l71_c8_0252]
signal fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_cond : unsigned(0 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_return_output : unsigned(31 downto 0);

-- valid_MUX[rmii_eth_mac_h_l71_c8_0252]
signal valid_MUX_rmii_eth_mac_h_l71_c8_0252_cond : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l71_c8_0252_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l71_c8_0252]
signal state_MUX_rmii_eth_mac_h_l71_c8_0252_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l71_c8_0252_return_output : unsigned(1 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l72_c5_e1c4]
signal bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output : unsigned(2 downto 0);

-- data_out_reg_MUX[rmii_eth_mac_h_l72_c5_e1c4]
signal data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond : unsigned(0 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output : unsigned(7 downto 0);

-- last_MUX[rmii_eth_mac_h_l72_c5_e1c4]
signal last_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output : unsigned(0 downto 0);

-- valid_MUX[rmii_eth_mac_h_l72_c5_e1c4]
signal valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l72_c5_e1c4]
signal state_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output : unsigned(1 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l75_c7_ec8b]
signal bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_return_output : unsigned(2 downto 0);

-- last_MUX[rmii_eth_mac_h_l75_c7_ec8b]
signal last_MUX_rmii_eth_mac_h_l75_c7_ec8b_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l75_c7_ec8b_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l75_c7_ec8b_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l75_c7_ec8b_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l75_c7_ec8b]
signal state_MUX_rmii_eth_mac_h_l75_c7_ec8b_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l75_c7_ec8b_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l75_c7_ec8b_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l75_c7_ec8b_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[rmii_eth_mac_h_l82_c13_1f5b]
signal UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_1f5b_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_1f5b_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l82_c9_e0b8]
signal bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_return_output : unsigned(2 downto 0);

-- last_MUX[rmii_eth_mac_h_l82_c9_e0b8]
signal last_MUX_rmii_eth_mac_h_l82_c9_e0b8_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l82_c9_e0b8_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l82_c9_e0b8_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l82_c9_e0b8_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l82_c9_e0b8]
signal state_MUX_rmii_eth_mac_h_l82_c9_e0b8_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l82_c9_e0b8_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l82_c9_e0b8_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l82_c9_e0b8_return_output : unsigned(1 downto 0);

-- BIN_OP_PLUS[rmii_eth_mac_h_l89_c9_c61a]
signal BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_c61a_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_c61a_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_c61a_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l93_c11_b351]
signal BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l93_c8_956c]
signal bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_return_output : unsigned(2 downto 0);

-- data_out_reg_MUX[rmii_eth_mac_h_l93_c8_956c]
signal data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_cond : unsigned(0 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_return_output : unsigned(7 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l93_c8_956c]
signal byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_return_output : unsigned(1 downto 0);

-- fcs_reg_MUX[rmii_eth_mac_h_l93_c8_956c]
signal fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_cond : unsigned(0 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_return_output : unsigned(31 downto 0);

-- state_MUX[rmii_eth_mac_h_l93_c8_956c]
signal state_MUX_rmii_eth_mac_h_l93_c8_956c_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l93_c8_956c_return_output : unsigned(1 downto 0);

-- CONST_SR_2[rmii_eth_mac_h_l96_c44_c4e5]
signal CONST_SR_2_rmii_eth_mac_h_l96_c44_c4e5_x : unsigned(31 downto 0);
signal CONST_SR_2_rmii_eth_mac_h_l96_c44_c4e5_return_output : unsigned(31 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l98_c5_6205]
signal bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_return_output : unsigned(2 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l98_c5_6205]
signal byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_return_output : unsigned(1 downto 0);

-- state_MUX[rmii_eth_mac_h_l98_c5_6205]
signal state_MUX_rmii_eth_mac_h_l98_c5_6205_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l98_c5_6205_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l98_c5_6205_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l98_c5_6205_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l99_c10_3355]
signal BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355_return_output : unsigned(0 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l99_c7_d6a9]
signal byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_return_output : unsigned(1 downto 0);

-- state_MUX[rmii_eth_mac_h_l99_c7_d6a9]
signal state_MUX_rmii_eth_mac_h_l99_c7_d6a9_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l99_c7_d6a9_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l99_c7_d6a9_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l99_c7_d6a9_return_output : unsigned(1 downto 0);

-- BIN_OP_PLUS[rmii_eth_mac_h_l103_c9_29fd]
signal BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_29fd_left : unsigned(1 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_29fd_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_29fd_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[rmii_eth_mac_h_l108_c7_5e4c]
signal BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5e4c_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5e4c_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5e4c_return_output : unsigned(3 downto 0);

function uint8_7_2( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(5 downto 0);
begin
return_output := unsigned(std_logic_vector(x(7 downto 2)));
return return_output;
end function;

function uint2_uint6( x : unsigned;
 y : unsigned) return unsigned is

  --variable x : unsigned(1 downto 0);
  --variable y : unsigned(5 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    return_output := unsigned(std_logic_vector(x)) & unsigned(std_logic_vector(y));
    return return_output;

end function;

function uint2_uint30( x : unsigned;
 y : unsigned) return unsigned is

  --variable x : unsigned(1 downto 0);
  --variable y : unsigned(29 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

    return_output := unsigned(std_logic_vector(x)) & unsigned(std_logic_vector(y));
    return return_output;

end function;

function CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return rmii_rx_mac_t is
 
  variable base : rmii_rx_mac_t; 
  variable return_output : rmii_rx_mac_t;
begin
      base.rx_mac_axis_out.data.tdata(0) := ref_toks_0;
      base.rx_mac_axis_out.data.tlast := ref_toks_1;
      base.rx_mac_axis_out.data.tkeep(0) := ref_toks_2;
      base.rx_mac_axis_out.valid := ref_toks_3;
      base.rx_mac_error := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_uint2_t_20_uint2_t_20_a609( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned;
 ref_toks_13 : unsigned;
 ref_toks_14 : unsigned;
 ref_toks_15 : unsigned;
 ref_toks_16 : unsigned;
 ref_toks_17 : unsigned;
 ref_toks_18 : unsigned;
 ref_toks_19 : unsigned) return uint2_t_20 is
 
  variable base : uint2_t_20; 
  variable return_output : uint2_t_20;
begin
      base(19) := ref_toks_0;
      base(18) := ref_toks_1;
      base(17) := ref_toks_2;
      base(16) := ref_toks_3;
      base(15) := ref_toks_4;
      base(14) := ref_toks_5;
      base(13) := ref_toks_6;
      base(12) := ref_toks_7;
      base(11) := ref_toks_8;
      base(10) := ref_toks_9;
      base(9) := ref_toks_10;
      base(8) := ref_toks_11;
      base(7) := ref_toks_12;
      base(6) := ref_toks_13;
      base(5) := ref_toks_14;
      base(4) := ref_toks_15;
      base(3) := ref_toks_16;
      base(2) := ref_toks_17;
      base(1) := ref_toks_18;
      base(0) := ref_toks_19;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_uint1_t_20_uint1_t_20_a609( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned;
 ref_toks_13 : unsigned;
 ref_toks_14 : unsigned;
 ref_toks_15 : unsigned;
 ref_toks_16 : unsigned;
 ref_toks_17 : unsigned;
 ref_toks_18 : unsigned;
 ref_toks_19 : unsigned) return uint1_t_20 is
 
  variable base : uint1_t_20; 
  variable return_output : uint1_t_20;
begin
      base(19) := ref_toks_0;
      base(18) := ref_toks_1;
      base(17) := ref_toks_2;
      base(16) := ref_toks_3;
      base(15) := ref_toks_4;
      base(14) := ref_toks_5;
      base(13) := ref_toks_6;
      base(12) := ref_toks_7;
      base(11) := ref_toks_8;
      base(10) := ref_toks_9;
      base(9) := ref_toks_10;
      base(8) := ref_toks_11;
      base(7) := ref_toks_12;
      base(6) := ref_toks_13;
      base(5) := ref_toks_14;
      base(4) := ref_toks_15;
      base(3) := ref_toks_16;
      base(2) := ref_toks_17;
      base(1) := ref_toks_18;
      base(0) := ref_toks_19;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_left,
BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_right,
BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l44_c53_b061 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l44_c53_b061 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l44_c53_b061_left,
BIN_OP_EQ_rmii_eth_mac_h_l44_c53_b061_right,
BIN_OP_EQ_rmii_eth_mac_h_l44_c53_b061_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7 : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_left,
BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_right,
BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d07e : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d07e : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d07e_left,
BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d07e_right,
BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d07e_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d_left,
BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d_right,
BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_left,
BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_right,
BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_cond,
bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output);

-- data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6 : 0 clocks latency
data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_cond,
data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue,
data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse,
data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output);

-- last_MUX_rmii_eth_mac_h_l48_c3_bef6 : 0 clocks latency
last_MUX_rmii_eth_mac_h_l48_c3_bef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l48_c3_bef6_cond,
last_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue,
last_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse,
last_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6 : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_cond,
byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output);

-- fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6 : 0 clocks latency
fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_cond,
fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue,
fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse,
fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output);

-- err_MUX_rmii_eth_mac_h_l48_c3_bef6 : 0 clocks latency
err_MUX_rmii_eth_mac_h_l48_c3_bef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
err_MUX_rmii_eth_mac_h_l48_c3_bef6_cond,
err_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue,
err_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse,
err_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output);

-- valid_MUX_rmii_eth_mac_h_l48_c3_bef6 : 0 clocks latency
valid_MUX_rmii_eth_mac_h_l48_c3_bef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
valid_MUX_rmii_eth_mac_h_l48_c3_bef6_cond,
valid_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue,
valid_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse,
valid_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output);

-- state_MUX_rmii_eth_mac_h_l48_c3_bef6 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l48_c3_bef6 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l48_c3_bef6_cond,
state_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue,
state_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse,
state_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output);

-- err_MUX_rmii_eth_mac_h_l54_c5_0acc : 0 clocks latency
err_MUX_rmii_eth_mac_h_l54_c5_0acc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
err_MUX_rmii_eth_mac_h_l54_c5_0acc_cond,
err_MUX_rmii_eth_mac_h_l54_c5_0acc_iftrue,
err_MUX_rmii_eth_mac_h_l54_c5_0acc_iffalse,
err_MUX_rmii_eth_mac_h_l54_c5_0acc_return_output);

-- state_MUX_rmii_eth_mac_h_l54_c5_0acc : 0 clocks latency
state_MUX_rmii_eth_mac_h_l54_c5_0acc : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l54_c5_0acc_cond,
state_MUX_rmii_eth_mac_h_l54_c5_0acc_iftrue,
state_MUX_rmii_eth_mac_h_l54_c5_0acc_iffalse,
state_MUX_rmii_eth_mac_h_l54_c5_0acc_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_left,
BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_right,
BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond,
bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output);

-- data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d : 0 clocks latency
data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond,
data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue,
data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse,
data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output);

-- last_MUX_rmii_eth_mac_h_l59_c8_8d8d : 0 clocks latency
last_MUX_rmii_eth_mac_h_l59_c8_8d8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond,
last_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue,
last_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse,
last_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond,
byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output);

-- fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d : 0 clocks latency
fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond,
fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue,
fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse,
fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output);

-- err_MUX_rmii_eth_mac_h_l59_c8_8d8d : 0 clocks latency
err_MUX_rmii_eth_mac_h_l59_c8_8d8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
err_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond,
err_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue,
err_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse,
err_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output);

-- valid_MUX_rmii_eth_mac_h_l59_c8_8d8d : 0 clocks latency
valid_MUX_rmii_eth_mac_h_l59_c8_8d8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond,
valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue,
valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse,
valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output);

-- state_MUX_rmii_eth_mac_h_l59_c8_8d8d : 0 clocks latency
state_MUX_rmii_eth_mac_h_l59_c8_8d8d : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond,
state_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue,
state_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse,
state_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output);

-- err_MUX_rmii_eth_mac_h_l60_c5_084e : 0 clocks latency
err_MUX_rmii_eth_mac_h_l60_c5_084e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
err_MUX_rmii_eth_mac_h_l60_c5_084e_cond,
err_MUX_rmii_eth_mac_h_l60_c5_084e_iftrue,
err_MUX_rmii_eth_mac_h_l60_c5_084e_iffalse,
err_MUX_rmii_eth_mac_h_l60_c5_084e_return_output);

-- state_MUX_rmii_eth_mac_h_l60_c5_084e : 0 clocks latency
state_MUX_rmii_eth_mac_h_l60_c5_084e : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l60_c5_084e_cond,
state_MUX_rmii_eth_mac_h_l60_c5_084e_iftrue,
state_MUX_rmii_eth_mac_h_l60_c5_084e_iffalse,
state_MUX_rmii_eth_mac_h_l60_c5_084e_return_output);

-- err_MUX_rmii_eth_mac_h_l63_c10_f9cc : 0 clocks latency
err_MUX_rmii_eth_mac_h_l63_c10_f9cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
err_MUX_rmii_eth_mac_h_l63_c10_f9cc_cond,
err_MUX_rmii_eth_mac_h_l63_c10_f9cc_iftrue,
err_MUX_rmii_eth_mac_h_l63_c10_f9cc_iffalse,
err_MUX_rmii_eth_mac_h_l63_c10_f9cc_return_output);

-- state_MUX_rmii_eth_mac_h_l63_c10_f9cc : 0 clocks latency
state_MUX_rmii_eth_mac_h_l63_c10_f9cc : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l63_c10_f9cc_cond,
state_MUX_rmii_eth_mac_h_l63_c10_f9cc_iftrue,
state_MUX_rmii_eth_mac_h_l63_c10_f9cc_iffalse,
state_MUX_rmii_eth_mac_h_l63_c10_f9cc_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_left,
BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_right,
BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_cond,
bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_return_output);

-- data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252 : 0 clocks latency
data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_cond,
data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue,
data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse,
data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_return_output);

-- last_MUX_rmii_eth_mac_h_l71_c8_0252 : 0 clocks latency
last_MUX_rmii_eth_mac_h_l71_c8_0252 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l71_c8_0252_cond,
last_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue,
last_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse,
last_MUX_rmii_eth_mac_h_l71_c8_0252_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252 : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_cond,
byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_return_output);

-- fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252 : 0 clocks latency
fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_cond,
fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue,
fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse,
fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_return_output);

-- valid_MUX_rmii_eth_mac_h_l71_c8_0252 : 0 clocks latency
valid_MUX_rmii_eth_mac_h_l71_c8_0252 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
valid_MUX_rmii_eth_mac_h_l71_c8_0252_cond,
valid_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue,
valid_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse,
valid_MUX_rmii_eth_mac_h_l71_c8_0252_return_output);

-- state_MUX_rmii_eth_mac_h_l71_c8_0252 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l71_c8_0252 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l71_c8_0252_cond,
state_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue,
state_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse,
state_MUX_rmii_eth_mac_h_l71_c8_0252_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond,
bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output);

-- data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4 : 0 clocks latency
data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond,
data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue,
data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse,
data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output);

-- last_MUX_rmii_eth_mac_h_l72_c5_e1c4 : 0 clocks latency
last_MUX_rmii_eth_mac_h_l72_c5_e1c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond,
last_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue,
last_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse,
last_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output);

-- valid_MUX_rmii_eth_mac_h_l72_c5_e1c4 : 0 clocks latency
valid_MUX_rmii_eth_mac_h_l72_c5_e1c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond,
valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue,
valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse,
valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output);

-- state_MUX_rmii_eth_mac_h_l72_c5_e1c4 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l72_c5_e1c4 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond,
state_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue,
state_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse,
state_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_cond,
bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_return_output);

-- last_MUX_rmii_eth_mac_h_l75_c7_ec8b : 0 clocks latency
last_MUX_rmii_eth_mac_h_l75_c7_ec8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l75_c7_ec8b_cond,
last_MUX_rmii_eth_mac_h_l75_c7_ec8b_iftrue,
last_MUX_rmii_eth_mac_h_l75_c7_ec8b_iffalse,
last_MUX_rmii_eth_mac_h_l75_c7_ec8b_return_output);

-- state_MUX_rmii_eth_mac_h_l75_c7_ec8b : 0 clocks latency
state_MUX_rmii_eth_mac_h_l75_c7_ec8b : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l75_c7_ec8b_cond,
state_MUX_rmii_eth_mac_h_l75_c7_ec8b_iftrue,
state_MUX_rmii_eth_mac_h_l75_c7_ec8b_iffalse,
state_MUX_rmii_eth_mac_h_l75_c7_ec8b_return_output);

-- UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_1f5b : 0 clocks latency
UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_1f5b : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_1f5b_expr,
UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_1f5b_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_cond,
bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_return_output);

-- last_MUX_rmii_eth_mac_h_l82_c9_e0b8 : 0 clocks latency
last_MUX_rmii_eth_mac_h_l82_c9_e0b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l82_c9_e0b8_cond,
last_MUX_rmii_eth_mac_h_l82_c9_e0b8_iftrue,
last_MUX_rmii_eth_mac_h_l82_c9_e0b8_iffalse,
last_MUX_rmii_eth_mac_h_l82_c9_e0b8_return_output);

-- state_MUX_rmii_eth_mac_h_l82_c9_e0b8 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l82_c9_e0b8 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l82_c9_e0b8_cond,
state_MUX_rmii_eth_mac_h_l82_c9_e0b8_iftrue,
state_MUX_rmii_eth_mac_h_l82_c9_e0b8_iffalse,
state_MUX_rmii_eth_mac_h_l82_c9_e0b8_return_output);

-- BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_c61a : 0 clocks latency
BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_c61a : entity work.BIN_OP_PLUS_uint3_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_c61a_left,
BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_c61a_right,
BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_c61a_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_left,
BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_right,
BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_cond,
bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_return_output);

-- data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c : 0 clocks latency
data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_cond,
data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue,
data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse,
data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_cond,
byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_return_output);

-- fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c : 0 clocks latency
fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_cond,
fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue,
fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse,
fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_return_output);

-- state_MUX_rmii_eth_mac_h_l93_c8_956c : 0 clocks latency
state_MUX_rmii_eth_mac_h_l93_c8_956c : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l93_c8_956c_cond,
state_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue,
state_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse,
state_MUX_rmii_eth_mac_h_l93_c8_956c_return_output);

-- CONST_SR_2_rmii_eth_mac_h_l96_c44_c4e5 : 0 clocks latency
CONST_SR_2_rmii_eth_mac_h_l96_c44_c4e5 : entity work.CONST_SR_2_uint32_t_0CLK_de264c78 port map (
CONST_SR_2_rmii_eth_mac_h_l96_c44_c4e5_x,
CONST_SR_2_rmii_eth_mac_h_l96_c44_c4e5_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_cond,
bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205 : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_cond,
byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_return_output);

-- state_MUX_rmii_eth_mac_h_l98_c5_6205 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l98_c5_6205 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l98_c5_6205_cond,
state_MUX_rmii_eth_mac_h_l98_c5_6205_iftrue,
state_MUX_rmii_eth_mac_h_l98_c5_6205_iffalse,
state_MUX_rmii_eth_mac_h_l98_c5_6205_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355_left,
BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355_right,
BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9 : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_cond,
byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_return_output);

-- state_MUX_rmii_eth_mac_h_l99_c7_d6a9 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l99_c7_d6a9 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l99_c7_d6a9_cond,
state_MUX_rmii_eth_mac_h_l99_c7_d6a9_iftrue,
state_MUX_rmii_eth_mac_h_l99_c7_d6a9_iffalse,
state_MUX_rmii_eth_mac_h_l99_c7_d6a9_return_output);

-- BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_29fd : 0 clocks latency
BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_29fd : entity work.BIN_OP_PLUS_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_29fd_left,
BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_29fd_right,
BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_29fd_return_output);

-- BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5e4c : 0 clocks latency
BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5e4c : entity work.BIN_OP_PLUS_uint3_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5e4c_left,
BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5e4c_right,
BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5e4c_return_output);



-- Resolve what clock enable to use for user logic
clk_en_internal <= CLOCK_ENABLE(0);
-- Combinatorial process for pipeline stages
process (
CLOCK_ENABLE,
clk_en_internal,
 -- Inputs
 data_in,
 data_in_valid,
 -- Registers
 data_in_regs,
 data_in_valid_regs,
 data_out_reg,
 state,
 bit_counter,
 byte_counter,
 fcs_reg,
 -- All submodule outputs
 BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l44_c53_b061_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d07e_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output,
 data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output,
 last_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output,
 fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output,
 err_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output,
 valid_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output,
 state_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output,
 err_MUX_rmii_eth_mac_h_l54_c5_0acc_return_output,
 state_MUX_rmii_eth_mac_h_l54_c5_0acc_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output,
 data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output,
 last_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output,
 fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output,
 err_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output,
 valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output,
 state_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output,
 err_MUX_rmii_eth_mac_h_l60_c5_084e_return_output,
 state_MUX_rmii_eth_mac_h_l60_c5_084e_return_output,
 err_MUX_rmii_eth_mac_h_l63_c10_f9cc_return_output,
 state_MUX_rmii_eth_mac_h_l63_c10_f9cc_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_return_output,
 data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_return_output,
 last_MUX_rmii_eth_mac_h_l71_c8_0252_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_return_output,
 fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_return_output,
 valid_MUX_rmii_eth_mac_h_l71_c8_0252_return_output,
 state_MUX_rmii_eth_mac_h_l71_c8_0252_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output,
 data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output,
 last_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output,
 valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output,
 state_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_return_output,
 last_MUX_rmii_eth_mac_h_l75_c7_ec8b_return_output,
 state_MUX_rmii_eth_mac_h_l75_c7_ec8b_return_output,
 UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_1f5b_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_return_output,
 last_MUX_rmii_eth_mac_h_l82_c9_e0b8_return_output,
 state_MUX_rmii_eth_mac_h_l82_c9_e0b8_return_output,
 BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_c61a_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_return_output,
 data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_return_output,
 fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_return_output,
 state_MUX_rmii_eth_mac_h_l93_c8_956c_return_output,
 CONST_SR_2_rmii_eth_mac_h_l96_c44_c4e5_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_return_output,
 state_MUX_rmii_eth_mac_h_l98_c5_6205_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_return_output,
 state_MUX_rmii_eth_mac_h_l99_c7_d6a9_return_output,
 BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_29fd_return_output,
 BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5e4c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : rmii_rx_mac_t;
 variable VAR_data_in : unsigned(1 downto 0);
 variable VAR_data_in_valid : unsigned(0 downto 0);
 variable VAR_last : unsigned(0 downto 0);
 variable VAR_valid : unsigned(0 downto 0);
 variable VAR_err : unsigned(0 downto 0);
 variable VAR_data_in_delayed : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_a5fb_return_output : unsigned(1 downto 0);
 variable VAR_data_in_valid_delayed : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_ae6f_return_output : unsigned(0 downto 0);
 variable VAR_o : rmii_rx_mac_t;
 variable VAR_bit_end : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_return_output : unsigned(0 downto 0);
 variable VAR_preamble_bits : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_b061_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_b061_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_b061_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_return_output : unsigned(0 downto 0);
 variable VAR_sfd_bits : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d07e_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d07e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d07e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_return_output : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l52_c5_6785 : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_cond : unsigned(0 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue : unsigned(7 downto 0);
 variable VAR_data_out_reg_rmii_eth_mac_h_l51_c5_fec9 : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_cond : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l48_c3_bef6_cond : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_cond : unsigned(0 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue : unsigned(31 downto 0);
 variable VAR_fcs_reg_rmii_eth_mac_h_l53_c5_5742 : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_cond : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l54_c5_0acc_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l48_c3_bef6_cond : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l48_c3_bef6_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l54_c5_0acc_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l48_c3_bef6_cond : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l54_c5_0acc_iftrue : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l54_c5_0acc_iffalse : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l54_c5_0acc_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l54_c5_0acc_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l54_c5_0acc_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l54_c5_0acc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_return_output : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond : unsigned(0 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_return_output : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l71_c8_0252_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond : unsigned(0 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_return_output : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l60_c5_084e_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l71_c8_0252_return_output : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l60_c5_084e_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l71_c8_0252_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l60_c5_084e_iftrue : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l60_c5_084e_iffalse : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l63_c10_f9cc_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l60_c5_084e_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l60_c5_084e_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l60_c5_084e_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l63_c10_f9cc_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l60_c5_084e_cond : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l63_c10_f9cc_iftrue : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l63_c10_f9cc_iffalse : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l63_c10_f9cc_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l63_c10_f9cc_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l63_c10_f9cc_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l63_c10_f9cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_return_output : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_cond : unsigned(0 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_return_output : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_cond : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l71_c8_0252_cond : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_cond : unsigned(0 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_return_output : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_cond : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l71_c8_0252_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l93_c8_956c_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l71_c8_0252_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond : unsigned(0 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l75_c7_ec8b_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l75_c7_ec8b_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond : unsigned(0 downto 0);
 variable VAR_uint8_7_2_rmii_eth_mac_h_l73_c50_f907_return_output : unsigned(5 downto 0);
 variable VAR_uint2_uint6_rmii_eth_mac_h_l73_c22_2bdf_return_output : unsigned(7 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l89_c9_8404 : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_cond : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l75_c7_ec8b_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l82_c9_e0b8_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l75_c7_ec8b_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l75_c7_ec8b_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l75_c7_ec8b_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l82_c9_e0b8_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l75_c7_ec8b_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l75_c7_ec8b_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l76_c9_a713 : unsigned(2 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_1f5b_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_1f5b_return_output : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l84_c11_5946 : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_cond : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l82_c9_e0b8_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l82_c9_e0b8_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l82_c9_e0b8_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l82_c9_e0b8_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l82_c9_e0b8_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l82_c9_e0b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_c61a_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_c61a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_c61a_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_return_output : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_cond : unsigned(0 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue : unsigned(7 downto 0);
 variable VAR_data_out_reg_rmii_eth_mac_h_l97_c5_6df4 : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_cond : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_cond : unsigned(0 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l98_c5_6205_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l93_c8_956c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_c4e5_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_c4e5_x : unsigned(31 downto 0);
 variable VAR_uint2_uint30_rmii_eth_mac_h_l96_c15_6b11_return_output : unsigned(31 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l105_c7_798b : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l108_c7_edce : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_cond : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l98_c5_6205_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l99_c7_d6a9_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l98_c5_6205_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l98_c5_6205_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355_return_output : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_rmii_eth_mac_h_l101_c9_24ff : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_rmii_eth_mac_h_l103_c9_86e9 : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l99_c7_d6a9_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l99_c7_d6a9_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l99_c7_d6a9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_29fd_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_29fd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_29fd_return_output : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5e4c_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5e4c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5e4c_return_output : unsigned(3 downto 0);
 variable VAR_ARRAY_SHIFT_UP_i : unsigned(31 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_0_CONST_REF_RD_uint2_t_uint2_t_20_18_d41d_rmii_eth_mac_h_l113_c140_6793_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_1_CONST_REF_RD_uint2_t_uint2_t_20_17_d41d_rmii_eth_mac_h_l113_c140_6793_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_2_CONST_REF_RD_uint2_t_uint2_t_20_16_d41d_rmii_eth_mac_h_l113_c140_6793_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_3_CONST_REF_RD_uint2_t_uint2_t_20_15_d41d_rmii_eth_mac_h_l113_c140_6793_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_4_CONST_REF_RD_uint2_t_uint2_t_20_14_d41d_rmii_eth_mac_h_l113_c140_6793_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_5_CONST_REF_RD_uint2_t_uint2_t_20_13_d41d_rmii_eth_mac_h_l113_c140_6793_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_6_CONST_REF_RD_uint2_t_uint2_t_20_12_d41d_rmii_eth_mac_h_l113_c140_6793_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_7_CONST_REF_RD_uint2_t_uint2_t_20_11_d41d_rmii_eth_mac_h_l113_c140_6793_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_8_CONST_REF_RD_uint2_t_uint2_t_20_10_d41d_rmii_eth_mac_h_l113_c140_6793_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_9_CONST_REF_RD_uint2_t_uint2_t_20_9_d41d_rmii_eth_mac_h_l113_c140_6793_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_10_CONST_REF_RD_uint2_t_uint2_t_20_8_d41d_rmii_eth_mac_h_l113_c140_6793_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_11_CONST_REF_RD_uint2_t_uint2_t_20_7_d41d_rmii_eth_mac_h_l113_c140_6793_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_12_CONST_REF_RD_uint2_t_uint2_t_20_6_d41d_rmii_eth_mac_h_l113_c140_6793_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_13_CONST_REF_RD_uint2_t_uint2_t_20_5_d41d_rmii_eth_mac_h_l113_c140_6793_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_14_CONST_REF_RD_uint2_t_uint2_t_20_4_d41d_rmii_eth_mac_h_l113_c140_6793_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_15_CONST_REF_RD_uint2_t_uint2_t_20_3_d41d_rmii_eth_mac_h_l113_c140_6793_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_16_CONST_REF_RD_uint2_t_uint2_t_20_2_d41d_rmii_eth_mac_h_l113_c140_6793_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_17_CONST_REF_RD_uint2_t_uint2_t_20_1_d41d_rmii_eth_mac_h_l113_c140_6793_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_18_CONST_REF_RD_uint2_t_uint2_t_20_0_d41d_rmii_eth_mac_h_l113_c140_6793_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_0_CONST_REF_RD_uint1_t_uint1_t_20_18_d41d_rmii_eth_mac_h_l114_c146_af49_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_1_CONST_REF_RD_uint1_t_uint1_t_20_17_d41d_rmii_eth_mac_h_l114_c146_af49_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_2_CONST_REF_RD_uint1_t_uint1_t_20_16_d41d_rmii_eth_mac_h_l114_c146_af49_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_3_CONST_REF_RD_uint1_t_uint1_t_20_15_d41d_rmii_eth_mac_h_l114_c146_af49_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_4_CONST_REF_RD_uint1_t_uint1_t_20_14_d41d_rmii_eth_mac_h_l114_c146_af49_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_5_CONST_REF_RD_uint1_t_uint1_t_20_13_d41d_rmii_eth_mac_h_l114_c146_af49_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_6_CONST_REF_RD_uint1_t_uint1_t_20_12_d41d_rmii_eth_mac_h_l114_c146_af49_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_7_CONST_REF_RD_uint1_t_uint1_t_20_11_d41d_rmii_eth_mac_h_l114_c146_af49_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_8_CONST_REF_RD_uint1_t_uint1_t_20_10_d41d_rmii_eth_mac_h_l114_c146_af49_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_9_CONST_REF_RD_uint1_t_uint1_t_20_9_d41d_rmii_eth_mac_h_l114_c146_af49_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_10_CONST_REF_RD_uint1_t_uint1_t_20_8_d41d_rmii_eth_mac_h_l114_c146_af49_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_11_CONST_REF_RD_uint1_t_uint1_t_20_7_d41d_rmii_eth_mac_h_l114_c146_af49_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_12_CONST_REF_RD_uint1_t_uint1_t_20_6_d41d_rmii_eth_mac_h_l114_c146_af49_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_13_CONST_REF_RD_uint1_t_uint1_t_20_5_d41d_rmii_eth_mac_h_l114_c146_af49_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_14_CONST_REF_RD_uint1_t_uint1_t_20_4_d41d_rmii_eth_mac_h_l114_c146_af49_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_15_CONST_REF_RD_uint1_t_uint1_t_20_3_d41d_rmii_eth_mac_h_l114_c146_af49_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_16_CONST_REF_RD_uint1_t_uint1_t_20_2_d41d_rmii_eth_mac_h_l114_c146_af49_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_17_CONST_REF_RD_uint1_t_uint1_t_20_1_d41d_rmii_eth_mac_h_l114_c146_af49_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_18_CONST_REF_RD_uint1_t_uint1_t_20_0_d41d_rmii_eth_mac_h_l114_c146_af49_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4_rmii_eth_mac_h_l123_c10_1eba_return_output : rmii_rx_mac_t;
 variable VAR_data_in_regs_CONST_REF_RD_uint2_t_20_uint2_t_20_a609_rmii_eth_mac_h_l17_c15_4f49_return_output : uint2_t_20;
 variable VAR_data_in_valid_regs_CONST_REF_RD_uint1_t_20_uint1_t_20_a609_rmii_eth_mac_h_l17_c15_4f49_return_output : uint1_t_20;
 -- State registers comb logic variables
variable REG_VAR_data_in_regs : uint2_t_20;
variable REG_VAR_data_in_valid_regs : uint1_t_20;
variable REG_VAR_data_out_reg : unsigned(7 downto 0);
variable REG_VAR_state : unsigned(1 downto 0);
variable REG_VAR_bit_counter : unsigned(2 downto 0);
variable REG_VAR_byte_counter : unsigned(1 downto 0);
variable REG_VAR_fcs_reg : unsigned(31 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_data_in_regs := data_in_regs;
  REG_VAR_data_in_valid_regs := data_in_valid_regs;
  REG_VAR_data_out_reg := data_out_reg;
  REG_VAR_state := state;
  REG_VAR_bit_counter := bit_counter;
  REG_VAR_byte_counter := byte_counter;
  REG_VAR_fcs_reg := fcs_reg;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_err_MUX_rmii_eth_mac_h_l63_c10_f9cc_iffalse := to_unsigned(1, 1);
     VAR_last_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse := to_unsigned(0, 1);
     VAR_last_MUX_rmii_eth_mac_h_l75_c7_ec8b_iffalse := to_unsigned(0, 1);
     VAR_last_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse := to_unsigned(0, 1);
     VAR_last_MUX_rmii_eth_mac_h_l82_c9_e0b8_iffalse := to_unsigned(0, 1);
     VAR_last_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue := to_unsigned(0, 1);
     VAR_last_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue := to_unsigned(0, 1);
     VAR_state_MUX_rmii_eth_mac_h_l63_c10_f9cc_iftrue := unsigned(rmii_rx_mac_state_t_to_slv(DATA));
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5e4c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_right := unsigned(rmii_rx_mac_state_t_to_slv(DATA));
     VAR_err_MUX_rmii_eth_mac_h_l54_c5_0acc_iftrue := to_unsigned(0, 1);
     VAR_bit_counter_rmii_eth_mac_h_l84_c11_5946 := resize(to_unsigned(0, 1), 3);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_iftrue := VAR_bit_counter_rmii_eth_mac_h_l84_c11_5946;
     VAR_err_MUX_rmii_eth_mac_h_l60_c5_084e_iftrue := to_unsigned(0, 1);
     VAR_err_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse := to_unsigned(0, 1);
     VAR_err_MUX_rmii_eth_mac_h_l54_c5_0acc_iffalse := to_unsigned(0, 1);
     VAR_err_MUX_rmii_eth_mac_h_l63_c10_f9cc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_c61a_right := to_unsigned(2, 2);
     VAR_state_MUX_rmii_eth_mac_h_l54_c5_0acc_iftrue := unsigned(rmii_rx_mac_state_t_to_slv(PREAMBLE));
     VAR_state_MUX_rmii_eth_mac_h_l63_c10_f9cc_iffalse := unsigned(rmii_rx_mac_state_t_to_slv(IDLE));
     VAR_bit_counter_rmii_eth_mac_h_l105_c7_798b := resize(to_unsigned(0, 1), 3);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iftrue := VAR_bit_counter_rmii_eth_mac_h_l105_c7_798b;
     VAR_state_MUX_rmii_eth_mac_h_l82_c9_e0b8_iftrue := unsigned(rmii_rx_mac_state_t_to_slv(FCS));
     VAR_state_MUX_rmii_eth_mac_h_l99_c7_d6a9_iftrue := unsigned(rmii_rx_mac_state_t_to_slv(IDLE));
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_right := unsigned(rmii_rx_mac_state_t_to_slv(PREAMBLE));
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_right := unsigned(rmii_rx_mac_state_t_to_slv(FCS));
     VAR_last_MUX_rmii_eth_mac_h_l82_c9_e0b8_iftrue := to_unsigned(1, 1);
     VAR_bit_counter_rmii_eth_mac_h_l76_c9_a713 := resize(to_unsigned(0, 1), 3);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_iffalse := VAR_bit_counter_rmii_eth_mac_h_l76_c9_a713;
     VAR_byte_counter_rmii_eth_mac_h_l101_c9_24ff := resize(to_unsigned(0, 1), 2);
     VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_iftrue := VAR_byte_counter_rmii_eth_mac_h_l101_c9_24ff;
     VAR_bit_counter_rmii_eth_mac_h_l52_c5_6785 := resize(to_unsigned(0, 1), 3);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue := VAR_bit_counter_rmii_eth_mac_h_l52_c5_6785;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d07e_right := to_unsigned(3, 2);
     VAR_valid_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse := to_unsigned(0, 1);
     VAR_valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse := to_unsigned(0, 1);
     VAR_valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue := to_unsigned(0, 1);
     VAR_state_MUX_rmii_eth_mac_h_l60_c5_084e_iftrue := unsigned(rmii_rx_mac_state_t_to_slv(PREAMBLE));
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_right := to_unsigned(6, 3);
     VAR_fcs_reg_rmii_eth_mac_h_l53_c5_5742 := resize(to_unsigned(0, 1), 32);
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue := VAR_fcs_reg_rmii_eth_mac_h_l53_c5_5742;
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue := to_unsigned(0, 1);
     VAR_data_out_reg_rmii_eth_mac_h_l51_c5_fec9 := resize(to_unsigned(0, 1), 8);
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue := VAR_data_out_reg_rmii_eth_mac_h_l51_c5_fec9;
     VAR_data_out_reg_rmii_eth_mac_h_l97_c5_6df4 := resize(to_unsigned(0, 1), 8);
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue := VAR_data_out_reg_rmii_eth_mac_h_l97_c5_6df4;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_b061_right := to_unsigned(1, 2);
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_29fd_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_right := unsigned(rmii_rx_mac_state_t_to_slv(IDLE));

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;
     -- Mux in inputs
     VAR_data_in := data_in;
     VAR_data_in_valid := data_in_valid;

     -- Submodule level 0
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_left := bit_counter;
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5e4c_left := bit_counter;
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_c61a_left := bit_counter;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue := bit_counter;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse := bit_counter;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse := bit_counter;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355_left := byte_counter;
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_29fd_left := byte_counter;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue := byte_counter;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue := byte_counter;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue := byte_counter;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse := byte_counter;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iffalse := byte_counter;
     VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_1f5b_expr := VAR_data_in_valid;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue := data_out_reg;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse := data_out_reg;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse := data_out_reg;
     VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_c4e5_x := fcs_reg;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue := fcs_reg;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue := fcs_reg;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse := fcs_reg;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_left := state;
     VAR_state_MUX_rmii_eth_mac_h_l54_c5_0acc_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l75_c7_ec8b_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l82_c9_e0b8_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l98_c5_6205_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l99_c7_d6a9_iffalse := state;
     -- FOR_rmii_eth_mac_h_l114_c30_e428_ITER_15_CONST_REF_RD_uint1_t_uint1_t_20_3_d41d[rmii_eth_mac_h_l114_c146_af49] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_15_CONST_REF_RD_uint1_t_uint1_t_20_3_d41d_rmii_eth_mac_h_l114_c146_af49_return_output := data_in_valid_regs(3);

     -- FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_3_CONST_REF_RD_uint2_t_uint2_t_20_15_d41d[rmii_eth_mac_h_l113_c140_6793] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_3_CONST_REF_RD_uint2_t_uint2_t_20_15_d41d_rmii_eth_mac_h_l113_c140_6793_return_output := data_in_regs(15);

     -- FOR_rmii_eth_mac_h_l114_c30_e428_ITER_14_CONST_REF_RD_uint1_t_uint1_t_20_4_d41d[rmii_eth_mac_h_l114_c146_af49] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_14_CONST_REF_RD_uint1_t_uint1_t_20_4_d41d_rmii_eth_mac_h_l114_c146_af49_return_output := data_in_valid_regs(4);

     -- FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_0_CONST_REF_RD_uint2_t_uint2_t_20_18_d41d[rmii_eth_mac_h_l113_c140_6793] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_0_CONST_REF_RD_uint2_t_uint2_t_20_18_d41d_rmii_eth_mac_h_l113_c140_6793_return_output := data_in_regs(18);

     -- FOR_rmii_eth_mac_h_l114_c30_e428_ITER_0_CONST_REF_RD_uint1_t_uint1_t_20_18_d41d[rmii_eth_mac_h_l114_c146_af49] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_0_CONST_REF_RD_uint1_t_uint1_t_20_18_d41d_rmii_eth_mac_h_l114_c146_af49_return_output := data_in_valid_regs(18);

     -- FOR_rmii_eth_mac_h_l114_c30_e428_ITER_17_CONST_REF_RD_uint1_t_uint1_t_20_1_d41d[rmii_eth_mac_h_l114_c146_af49] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_17_CONST_REF_RD_uint1_t_uint1_t_20_1_d41d_rmii_eth_mac_h_l114_c146_af49_return_output := data_in_valid_regs(1);

     -- FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_9_CONST_REF_RD_uint2_t_uint2_t_20_9_d41d[rmii_eth_mac_h_l113_c140_6793] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_9_CONST_REF_RD_uint2_t_uint2_t_20_9_d41d_rmii_eth_mac_h_l113_c140_6793_return_output := data_in_regs(9);

     -- FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_1_CONST_REF_RD_uint2_t_uint2_t_20_17_d41d[rmii_eth_mac_h_l113_c140_6793] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_1_CONST_REF_RD_uint2_t_uint2_t_20_17_d41d_rmii_eth_mac_h_l113_c140_6793_return_output := data_in_regs(17);

     -- FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_12_CONST_REF_RD_uint2_t_uint2_t_20_6_d41d[rmii_eth_mac_h_l113_c140_6793] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_12_CONST_REF_RD_uint2_t_uint2_t_20_6_d41d_rmii_eth_mac_h_l113_c140_6793_return_output := data_in_regs(6);

     -- FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_11_CONST_REF_RD_uint2_t_uint2_t_20_7_d41d[rmii_eth_mac_h_l113_c140_6793] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_11_CONST_REF_RD_uint2_t_uint2_t_20_7_d41d_rmii_eth_mac_h_l113_c140_6793_return_output := data_in_regs(7);

     -- BIN_OP_PLUS[rmii_eth_mac_h_l108_c7_5e4c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5e4c_left <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5e4c_left;
     BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5e4c_right <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5e4c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5e4c_return_output := BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5e4c_return_output;

     -- FOR_rmii_eth_mac_h_l114_c30_e428_ITER_8_CONST_REF_RD_uint1_t_uint1_t_20_10_d41d[rmii_eth_mac_h_l114_c146_af49] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_8_CONST_REF_RD_uint1_t_uint1_t_20_10_d41d_rmii_eth_mac_h_l114_c146_af49_return_output := data_in_valid_regs(10);

     -- CONST_REF_RD_uint1_t_uint1_t_20_19_d41d[rmii_eth_mac_h_l35_c35_ae6f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_ae6f_return_output := data_in_valid_regs(19);

     -- FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_8_CONST_REF_RD_uint2_t_uint2_t_20_10_d41d[rmii_eth_mac_h_l113_c140_6793] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_8_CONST_REF_RD_uint2_t_uint2_t_20_10_d41d_rmii_eth_mac_h_l113_c140_6793_return_output := data_in_regs(10);

     -- FOR_rmii_eth_mac_h_l114_c30_e428_ITER_10_CONST_REF_RD_uint1_t_uint1_t_20_8_d41d[rmii_eth_mac_h_l114_c146_af49] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_10_CONST_REF_RD_uint1_t_uint1_t_20_8_d41d_rmii_eth_mac_h_l114_c146_af49_return_output := data_in_valid_regs(8);

     -- FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_14_CONST_REF_RD_uint2_t_uint2_t_20_4_d41d[rmii_eth_mac_h_l113_c140_6793] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_14_CONST_REF_RD_uint2_t_uint2_t_20_4_d41d_rmii_eth_mac_h_l113_c140_6793_return_output := data_in_regs(4);

     -- FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_2_CONST_REF_RD_uint2_t_uint2_t_20_16_d41d[rmii_eth_mac_h_l113_c140_6793] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_2_CONST_REF_RD_uint2_t_uint2_t_20_16_d41d_rmii_eth_mac_h_l113_c140_6793_return_output := data_in_regs(16);

     -- BIN_OP_EQ[rmii_eth_mac_h_l43_c22_2bbe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_left;
     BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_return_output := BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_return_output;

     -- FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_7_CONST_REF_RD_uint2_t_uint2_t_20_11_d41d[rmii_eth_mac_h_l113_c140_6793] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_7_CONST_REF_RD_uint2_t_uint2_t_20_11_d41d_rmii_eth_mac_h_l113_c140_6793_return_output := data_in_regs(11);

     -- uint8_7_2[rmii_eth_mac_h_l73_c50_f907] LATENCY=0
     VAR_uint8_7_2_rmii_eth_mac_h_l73_c50_f907_return_output := uint8_7_2(
     data_out_reg);

     -- FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_5_CONST_REF_RD_uint2_t_uint2_t_20_13_d41d[rmii_eth_mac_h_l113_c140_6793] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_5_CONST_REF_RD_uint2_t_uint2_t_20_13_d41d_rmii_eth_mac_h_l113_c140_6793_return_output := data_in_regs(13);

     -- FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_17_CONST_REF_RD_uint2_t_uint2_t_20_1_d41d[rmii_eth_mac_h_l113_c140_6793] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_17_CONST_REF_RD_uint2_t_uint2_t_20_1_d41d_rmii_eth_mac_h_l113_c140_6793_return_output := data_in_regs(1);

     -- FOR_rmii_eth_mac_h_l114_c30_e428_ITER_11_CONST_REF_RD_uint1_t_uint1_t_20_7_d41d[rmii_eth_mac_h_l114_c146_af49] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_11_CONST_REF_RD_uint1_t_uint1_t_20_7_d41d_rmii_eth_mac_h_l114_c146_af49_return_output := data_in_valid_regs(7);

     -- UNARY_OP_NOT[rmii_eth_mac_h_l82_c13_1f5b] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_1f5b_expr <= VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_1f5b_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_1f5b_return_output := UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_1f5b_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l71_c11_c8a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_left;
     BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_return_output := BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_return_output;

     -- FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_16_CONST_REF_RD_uint2_t_uint2_t_20_2_d41d[rmii_eth_mac_h_l113_c140_6793] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_16_CONST_REF_RD_uint2_t_uint2_t_20_2_d41d_rmii_eth_mac_h_l113_c140_6793_return_output := data_in_regs(2);

     -- BIN_OP_EQ[rmii_eth_mac_h_l99_c10_3355] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355_left;
     BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355_return_output := BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355_return_output;

     -- FOR_rmii_eth_mac_h_l114_c30_e428_ITER_1_CONST_REF_RD_uint1_t_uint1_t_20_17_d41d[rmii_eth_mac_h_l114_c146_af49] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_1_CONST_REF_RD_uint1_t_uint1_t_20_17_d41d_rmii_eth_mac_h_l114_c146_af49_return_output := data_in_valid_regs(17);

     -- FOR_rmii_eth_mac_h_l114_c30_e428_ITER_5_CONST_REF_RD_uint1_t_uint1_t_20_13_d41d[rmii_eth_mac_h_l114_c146_af49] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_5_CONST_REF_RD_uint1_t_uint1_t_20_13_d41d_rmii_eth_mac_h_l114_c146_af49_return_output := data_in_valid_regs(13);

     -- FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_10_CONST_REF_RD_uint2_t_uint2_t_20_8_d41d[rmii_eth_mac_h_l113_c140_6793] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_10_CONST_REF_RD_uint2_t_uint2_t_20_8_d41d_rmii_eth_mac_h_l113_c140_6793_return_output := data_in_regs(8);

     -- FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_6_CONST_REF_RD_uint2_t_uint2_t_20_12_d41d[rmii_eth_mac_h_l113_c140_6793] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_6_CONST_REF_RD_uint2_t_uint2_t_20_12_d41d_rmii_eth_mac_h_l113_c140_6793_return_output := data_in_regs(12);

     -- FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_4_CONST_REF_RD_uint2_t_uint2_t_20_14_d41d[rmii_eth_mac_h_l113_c140_6793] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_4_CONST_REF_RD_uint2_t_uint2_t_20_14_d41d_rmii_eth_mac_h_l113_c140_6793_return_output := data_in_regs(14);

     -- FOR_rmii_eth_mac_h_l114_c30_e428_ITER_2_CONST_REF_RD_uint1_t_uint1_t_20_16_d41d[rmii_eth_mac_h_l114_c146_af49] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_2_CONST_REF_RD_uint1_t_uint1_t_20_16_d41d_rmii_eth_mac_h_l114_c146_af49_return_output := data_in_valid_regs(16);

     -- CONST_REF_RD_uint2_t_uint2_t_20_19_d41d[rmii_eth_mac_h_l34_c29_a5fb] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_a5fb_return_output := data_in_regs(19);

     -- FOR_rmii_eth_mac_h_l114_c30_e428_ITER_6_CONST_REF_RD_uint1_t_uint1_t_20_12_d41d[rmii_eth_mac_h_l114_c146_af49] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_6_CONST_REF_RD_uint1_t_uint1_t_20_12_d41d_rmii_eth_mac_h_l114_c146_af49_return_output := data_in_valid_regs(12);

     -- FOR_rmii_eth_mac_h_l114_c30_e428_ITER_7_CONST_REF_RD_uint1_t_uint1_t_20_11_d41d[rmii_eth_mac_h_l114_c146_af49] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_7_CONST_REF_RD_uint1_t_uint1_t_20_11_d41d_rmii_eth_mac_h_l114_c146_af49_return_output := data_in_valid_regs(11);

     -- FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_18_CONST_REF_RD_uint2_t_uint2_t_20_0_d41d[rmii_eth_mac_h_l113_c140_6793] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_18_CONST_REF_RD_uint2_t_uint2_t_20_0_d41d_rmii_eth_mac_h_l113_c140_6793_return_output := data_in_regs(0);

     -- FOR_rmii_eth_mac_h_l114_c30_e428_ITER_16_CONST_REF_RD_uint1_t_uint1_t_20_2_d41d[rmii_eth_mac_h_l114_c146_af49] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_16_CONST_REF_RD_uint1_t_uint1_t_20_2_d41d_rmii_eth_mac_h_l114_c146_af49_return_output := data_in_valid_regs(2);

     -- CONST_SR_2[rmii_eth_mac_h_l96_c44_c4e5] LATENCY=0
     -- Inputs
     CONST_SR_2_rmii_eth_mac_h_l96_c44_c4e5_x <= VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_c4e5_x;
     -- Outputs
     VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_c4e5_return_output := CONST_SR_2_rmii_eth_mac_h_l96_c44_c4e5_return_output;

     -- FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_15_CONST_REF_RD_uint2_t_uint2_t_20_3_d41d[rmii_eth_mac_h_l113_c140_6793] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_15_CONST_REF_RD_uint2_t_uint2_t_20_3_d41d_rmii_eth_mac_h_l113_c140_6793_return_output := data_in_regs(3);

     -- FOR_rmii_eth_mac_h_l114_c30_e428_ITER_13_CONST_REF_RD_uint1_t_uint1_t_20_5_d41d[rmii_eth_mac_h_l114_c146_af49] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_13_CONST_REF_RD_uint1_t_uint1_t_20_5_d41d_rmii_eth_mac_h_l114_c146_af49_return_output := data_in_valid_regs(5);

     -- FOR_rmii_eth_mac_h_l114_c30_e428_ITER_4_CONST_REF_RD_uint1_t_uint1_t_20_14_d41d[rmii_eth_mac_h_l114_c146_af49] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_4_CONST_REF_RD_uint1_t_uint1_t_20_14_d41d_rmii_eth_mac_h_l114_c146_af49_return_output := data_in_valid_regs(14);

     -- FOR_rmii_eth_mac_h_l114_c30_e428_ITER_9_CONST_REF_RD_uint1_t_uint1_t_20_9_d41d[rmii_eth_mac_h_l114_c146_af49] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_9_CONST_REF_RD_uint1_t_uint1_t_20_9_d41d_rmii_eth_mac_h_l114_c146_af49_return_output := data_in_valid_regs(9);

     -- FOR_rmii_eth_mac_h_l114_c30_e428_ITER_12_CONST_REF_RD_uint1_t_uint1_t_20_6_d41d[rmii_eth_mac_h_l114_c146_af49] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_12_CONST_REF_RD_uint1_t_uint1_t_20_6_d41d_rmii_eth_mac_h_l114_c146_af49_return_output := data_in_valid_regs(6);

     -- FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_13_CONST_REF_RD_uint2_t_uint2_t_20_5_d41d[rmii_eth_mac_h_l113_c140_6793] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_13_CONST_REF_RD_uint2_t_uint2_t_20_5_d41d_rmii_eth_mac_h_l113_c140_6793_return_output := data_in_regs(5);

     -- FOR_rmii_eth_mac_h_l114_c30_e428_ITER_18_CONST_REF_RD_uint1_t_uint1_t_20_0_d41d[rmii_eth_mac_h_l114_c146_af49] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_18_CONST_REF_RD_uint1_t_uint1_t_20_0_d41d_rmii_eth_mac_h_l114_c146_af49_return_output := data_in_valid_regs(0);

     -- BIN_OP_EQ[rmii_eth_mac_h_l93_c11_b351] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_left;
     BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_return_output := BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l59_c11_4058] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_left;
     BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_return_output := BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_return_output;

     -- BIN_OP_PLUS[rmii_eth_mac_h_l103_c9_29fd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_29fd_left <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_29fd_left;
     BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_29fd_right <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_29fd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_29fd_return_output := BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_29fd_return_output;

     -- FOR_rmii_eth_mac_h_l114_c30_e428_ITER_3_CONST_REF_RD_uint1_t_uint1_t_20_15_d41d[rmii_eth_mac_h_l114_c146_af49] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_3_CONST_REF_RD_uint1_t_uint1_t_20_15_d41d_rmii_eth_mac_h_l114_c146_af49_return_output := data_in_valid_regs(15);

     -- BIN_OP_PLUS[rmii_eth_mac_h_l89_c9_c61a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_c61a_left <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_c61a_left;
     BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_c61a_right <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_c61a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_c61a_return_output := BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_c61a_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l48_c6_53ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_left;
     BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_return_output := BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_return_output;

     -- Submodule level 1
     VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l75_c7_ec8b_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l75_c7_ec8b_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l98_c5_6205_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_2bbe_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l48_c3_bef6_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l48_c3_bef6_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l48_c3_bef6_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_bef6_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_53ce_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_4058_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l71_c8_0252_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l71_c8_0252_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l71_c8_0252_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_c8a1_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l93_c8_956c_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_b351_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l99_c7_d6a9_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_3355_return_output;
     VAR_byte_counter_rmii_eth_mac_h_l103_c9_86e9 := resize(VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_29fd_return_output, 2);
     VAR_bit_counter_rmii_eth_mac_h_l108_c7_edce := resize(VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5e4c_return_output, 3);
     VAR_bit_counter_rmii_eth_mac_h_l89_c9_8404 := resize(VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_c61a_return_output, 3);
     VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_left := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_ae6f_return_output;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d_left := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_ae6f_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_ae6f_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_ae6f_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_ae6f_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_ae6f_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_ae6f_return_output;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_b061_left := VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_a5fb_return_output;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d07e_left := VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_a5fb_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_cond := VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_1f5b_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l82_c9_e0b8_cond := VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_1f5b_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l82_c9_e0b8_cond := VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_1f5b_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iffalse := VAR_bit_counter_rmii_eth_mac_h_l108_c7_edce;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_iffalse := VAR_bit_counter_rmii_eth_mac_h_l89_c9_8404;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_iffalse := VAR_byte_counter_rmii_eth_mac_h_l103_c9_86e9;
     -- BIN_OP_EQ[rmii_eth_mac_h_l44_c53_b061] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l44_c53_b061_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_b061_left;
     BIN_OP_EQ_rmii_eth_mac_h_l44_c53_b061_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_b061_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_b061_return_output := BIN_OP_EQ_rmii_eth_mac_h_l44_c53_b061_return_output;

     -- uint2_uint6[rmii_eth_mac_h_l73_c22_2bdf] LATENCY=0
     VAR_uint2_uint6_rmii_eth_mac_h_l73_c22_2bdf_return_output := uint2_uint6(
     VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_a5fb_return_output,
     VAR_uint8_7_2_rmii_eth_mac_h_l73_c50_f907_return_output);

     -- uint2_uint30[rmii_eth_mac_h_l96_c15_6b11] LATENCY=0
     VAR_uint2_uint30_rmii_eth_mac_h_l96_c15_6b11_return_output := uint2_uint30(
     VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_a5fb_return_output,
     resize(VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_c4e5_return_output, 30));

     -- BIN_OP_EQ[rmii_eth_mac_h_l45_c48_d07e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d07e_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d07e_left;
     BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d07e_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d07e_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d07e_return_output := BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d07e_return_output;

     -- data_in_valid_regs_CONST_REF_RD_uint1_t_20_uint1_t_20_a609[rmii_eth_mac_h_l17_c15_4f49] LATENCY=0
     VAR_data_in_valid_regs_CONST_REF_RD_uint1_t_20_uint1_t_20_a609_rmii_eth_mac_h_l17_c15_4f49_return_output := CONST_REF_RD_uint1_t_20_uint1_t_20_a609(
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_0_CONST_REF_RD_uint1_t_uint1_t_20_18_d41d_rmii_eth_mac_h_l114_c146_af49_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_1_CONST_REF_RD_uint1_t_uint1_t_20_17_d41d_rmii_eth_mac_h_l114_c146_af49_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_2_CONST_REF_RD_uint1_t_uint1_t_20_16_d41d_rmii_eth_mac_h_l114_c146_af49_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_3_CONST_REF_RD_uint1_t_uint1_t_20_15_d41d_rmii_eth_mac_h_l114_c146_af49_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_4_CONST_REF_RD_uint1_t_uint1_t_20_14_d41d_rmii_eth_mac_h_l114_c146_af49_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_5_CONST_REF_RD_uint1_t_uint1_t_20_13_d41d_rmii_eth_mac_h_l114_c146_af49_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_6_CONST_REF_RD_uint1_t_uint1_t_20_12_d41d_rmii_eth_mac_h_l114_c146_af49_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_7_CONST_REF_RD_uint1_t_uint1_t_20_11_d41d_rmii_eth_mac_h_l114_c146_af49_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_8_CONST_REF_RD_uint1_t_uint1_t_20_10_d41d_rmii_eth_mac_h_l114_c146_af49_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_9_CONST_REF_RD_uint1_t_uint1_t_20_9_d41d_rmii_eth_mac_h_l114_c146_af49_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_10_CONST_REF_RD_uint1_t_uint1_t_20_8_d41d_rmii_eth_mac_h_l114_c146_af49_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_11_CONST_REF_RD_uint1_t_uint1_t_20_7_d41d_rmii_eth_mac_h_l114_c146_af49_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_12_CONST_REF_RD_uint1_t_uint1_t_20_6_d41d_rmii_eth_mac_h_l114_c146_af49_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_13_CONST_REF_RD_uint1_t_uint1_t_20_5_d41d_rmii_eth_mac_h_l114_c146_af49_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_14_CONST_REF_RD_uint1_t_uint1_t_20_4_d41d_rmii_eth_mac_h_l114_c146_af49_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_15_CONST_REF_RD_uint1_t_uint1_t_20_3_d41d_rmii_eth_mac_h_l114_c146_af49_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_16_CONST_REF_RD_uint1_t_uint1_t_20_2_d41d_rmii_eth_mac_h_l114_c146_af49_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_17_CONST_REF_RD_uint1_t_uint1_t_20_1_d41d_rmii_eth_mac_h_l114_c146_af49_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_e428_ITER_18_CONST_REF_RD_uint1_t_uint1_t_20_0_d41d_rmii_eth_mac_h_l114_c146_af49_return_output,
     VAR_data_in_valid);

     -- bit_counter_MUX[rmii_eth_mac_h_l98_c5_6205] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_cond;
     bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_return_output := bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_return_output;

     -- state_MUX[rmii_eth_mac_h_l99_c7_d6a9] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l99_c7_d6a9_cond <= VAR_state_MUX_rmii_eth_mac_h_l99_c7_d6a9_cond;
     state_MUX_rmii_eth_mac_h_l99_c7_d6a9_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l99_c7_d6a9_iftrue;
     state_MUX_rmii_eth_mac_h_l99_c7_d6a9_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l99_c7_d6a9_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l99_c7_d6a9_return_output := state_MUX_rmii_eth_mac_h_l99_c7_d6a9_return_output;

     -- data_in_regs_CONST_REF_RD_uint2_t_20_uint2_t_20_a609[rmii_eth_mac_h_l17_c15_4f49] LATENCY=0
     VAR_data_in_regs_CONST_REF_RD_uint2_t_20_uint2_t_20_a609_rmii_eth_mac_h_l17_c15_4f49_return_output := CONST_REF_RD_uint2_t_20_uint2_t_20_a609(
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_0_CONST_REF_RD_uint2_t_uint2_t_20_18_d41d_rmii_eth_mac_h_l113_c140_6793_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_1_CONST_REF_RD_uint2_t_uint2_t_20_17_d41d_rmii_eth_mac_h_l113_c140_6793_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_2_CONST_REF_RD_uint2_t_uint2_t_20_16_d41d_rmii_eth_mac_h_l113_c140_6793_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_3_CONST_REF_RD_uint2_t_uint2_t_20_15_d41d_rmii_eth_mac_h_l113_c140_6793_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_4_CONST_REF_RD_uint2_t_uint2_t_20_14_d41d_rmii_eth_mac_h_l113_c140_6793_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_5_CONST_REF_RD_uint2_t_uint2_t_20_13_d41d_rmii_eth_mac_h_l113_c140_6793_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_6_CONST_REF_RD_uint2_t_uint2_t_20_12_d41d_rmii_eth_mac_h_l113_c140_6793_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_7_CONST_REF_RD_uint2_t_uint2_t_20_11_d41d_rmii_eth_mac_h_l113_c140_6793_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_8_CONST_REF_RD_uint2_t_uint2_t_20_10_d41d_rmii_eth_mac_h_l113_c140_6793_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_9_CONST_REF_RD_uint2_t_uint2_t_20_9_d41d_rmii_eth_mac_h_l113_c140_6793_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_10_CONST_REF_RD_uint2_t_uint2_t_20_8_d41d_rmii_eth_mac_h_l113_c140_6793_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_11_CONST_REF_RD_uint2_t_uint2_t_20_7_d41d_rmii_eth_mac_h_l113_c140_6793_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_12_CONST_REF_RD_uint2_t_uint2_t_20_6_d41d_rmii_eth_mac_h_l113_c140_6793_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_13_CONST_REF_RD_uint2_t_uint2_t_20_5_d41d_rmii_eth_mac_h_l113_c140_6793_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_14_CONST_REF_RD_uint2_t_uint2_t_20_4_d41d_rmii_eth_mac_h_l113_c140_6793_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_15_CONST_REF_RD_uint2_t_uint2_t_20_3_d41d_rmii_eth_mac_h_l113_c140_6793_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_16_CONST_REF_RD_uint2_t_uint2_t_20_2_d41d_rmii_eth_mac_h_l113_c140_6793_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_17_CONST_REF_RD_uint2_t_uint2_t_20_1_d41d_rmii_eth_mac_h_l113_c140_6793_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_e7b5_ITER_18_CONST_REF_RD_uint2_t_uint2_t_20_0_d41d_rmii_eth_mac_h_l113_c140_6793_return_output,
     VAR_data_in);

     -- valid_MUX[rmii_eth_mac_h_l72_c5_e1c4] LATENCY=0
     -- Inputs
     valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond <= VAR_valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond;
     valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue <= VAR_valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue;
     valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse <= VAR_valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse;
     -- Outputs
     VAR_valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output := valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l82_c9_e0b8] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_cond;
     bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_return_output := bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_return_output;

     -- data_out_reg_MUX[rmii_eth_mac_h_l93_c8_956c] LATENCY=0
     -- Inputs
     data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_cond <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_cond;
     data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue;
     data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse;
     -- Outputs
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_return_output := data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_return_output;

     -- state_MUX[rmii_eth_mac_h_l82_c9_e0b8] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l82_c9_e0b8_cond <= VAR_state_MUX_rmii_eth_mac_h_l82_c9_e0b8_cond;
     state_MUX_rmii_eth_mac_h_l82_c9_e0b8_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l82_c9_e0b8_iftrue;
     state_MUX_rmii_eth_mac_h_l82_c9_e0b8_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l82_c9_e0b8_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l82_c9_e0b8_return_output := state_MUX_rmii_eth_mac_h_l82_c9_e0b8_return_output;

     -- byte_counter_MUX[rmii_eth_mac_h_l99_c7_d6a9] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_cond;
     byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_return_output := byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_return_output;

     -- last_MUX[rmii_eth_mac_h_l82_c9_e0b8] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l82_c9_e0b8_cond <= VAR_last_MUX_rmii_eth_mac_h_l82_c9_e0b8_cond;
     last_MUX_rmii_eth_mac_h_l82_c9_e0b8_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l82_c9_e0b8_iftrue;
     last_MUX_rmii_eth_mac_h_l82_c9_e0b8_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l82_c9_e0b8_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l82_c9_e0b8_return_output := last_MUX_rmii_eth_mac_h_l82_c9_e0b8_return_output;

     -- Submodule level 2
     VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_right := VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_b061_return_output;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d_right := VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_d07e_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_e0b8_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_6205_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iftrue := VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_d6a9_return_output;
     REG_VAR_data_in_regs := VAR_data_in_regs_CONST_REF_RD_uint2_t_20_uint2_t_20_a609_rmii_eth_mac_h_l17_c15_4f49_return_output;
     REG_VAR_data_in_valid_regs := VAR_data_in_valid_regs_CONST_REF_RD_uint1_t_20_uint1_t_20_a609_rmii_eth_mac_h_l17_c15_4f49_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse := VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_956c_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l75_c7_ec8b_iftrue := VAR_last_MUX_rmii_eth_mac_h_l82_c9_e0b8_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l75_c7_ec8b_iftrue := VAR_state_MUX_rmii_eth_mac_h_l82_c9_e0b8_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l98_c5_6205_iftrue := VAR_state_MUX_rmii_eth_mac_h_l99_c7_d6a9_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue := VAR_uint2_uint30_rmii_eth_mac_h_l96_c15_6b11_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue := VAR_uint2_uint6_rmii_eth_mac_h_l73_c22_2bdf_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue := VAR_valid_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output;
     -- last_MUX[rmii_eth_mac_h_l75_c7_ec8b] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l75_c7_ec8b_cond <= VAR_last_MUX_rmii_eth_mac_h_l75_c7_ec8b_cond;
     last_MUX_rmii_eth_mac_h_l75_c7_ec8b_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l75_c7_ec8b_iftrue;
     last_MUX_rmii_eth_mac_h_l75_c7_ec8b_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l75_c7_ec8b_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l75_c7_ec8b_return_output := last_MUX_rmii_eth_mac_h_l75_c7_ec8b_return_output;

     -- valid_MUX[rmii_eth_mac_h_l71_c8_0252] LATENCY=0
     -- Inputs
     valid_MUX_rmii_eth_mac_h_l71_c8_0252_cond <= VAR_valid_MUX_rmii_eth_mac_h_l71_c8_0252_cond;
     valid_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue <= VAR_valid_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue;
     valid_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse <= VAR_valid_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse;
     -- Outputs
     VAR_valid_MUX_rmii_eth_mac_h_l71_c8_0252_return_output := valid_MUX_rmii_eth_mac_h_l71_c8_0252_return_output;

     -- state_MUX[rmii_eth_mac_h_l98_c5_6205] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l98_c5_6205_cond <= VAR_state_MUX_rmii_eth_mac_h_l98_c5_6205_cond;
     state_MUX_rmii_eth_mac_h_l98_c5_6205_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l98_c5_6205_iftrue;
     state_MUX_rmii_eth_mac_h_l98_c5_6205_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l98_c5_6205_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l98_c5_6205_return_output := state_MUX_rmii_eth_mac_h_l98_c5_6205_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l75_c7_ec8b] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_cond;
     bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_return_output := bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_return_output;

     -- byte_counter_MUX[rmii_eth_mac_h_l98_c5_6205] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_cond;
     byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_return_output := byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_return_output;

     -- state_MUX[rmii_eth_mac_h_l75_c7_ec8b] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l75_c7_ec8b_cond <= VAR_state_MUX_rmii_eth_mac_h_l75_c7_ec8b_cond;
     state_MUX_rmii_eth_mac_h_l75_c7_ec8b_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l75_c7_ec8b_iftrue;
     state_MUX_rmii_eth_mac_h_l75_c7_ec8b_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l75_c7_ec8b_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l75_c7_ec8b_return_output := state_MUX_rmii_eth_mac_h_l75_c7_ec8b_return_output;

     -- data_out_reg_MUX[rmii_eth_mac_h_l72_c5_e1c4] LATENCY=0
     -- Inputs
     data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond;
     data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue;
     data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse;
     -- Outputs
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output := data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l93_c8_956c] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_cond;
     bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_return_output := bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_return_output;

     -- BIN_OP_AND[rmii_eth_mac_h_l45_c23_261d] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d_left;
     BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d_return_output := BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d_return_output;

     -- fcs_reg_MUX[rmii_eth_mac_h_l93_c8_956c] LATENCY=0
     -- Inputs
     fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_cond <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_cond;
     fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue;
     fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse;
     -- Outputs
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_return_output := fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_return_output;

     -- BIN_OP_AND[rmii_eth_mac_h_l44_c28_71a7] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_left;
     BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_return_output := BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_return_output;

     -- Submodule level 3
     VAR_err_MUX_rmii_eth_mac_h_l54_c5_0acc_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l60_c5_084e_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l54_c5_0acc_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l60_c5_084e_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_71a7_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l63_c10_f9cc_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l63_c10_f9cc_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_261d_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_ec8b_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_956c_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue := VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_6205_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue := VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse := VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_956c_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue := VAR_last_MUX_rmii_eth_mac_h_l75_c7_ec8b_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue := VAR_state_MUX_rmii_eth_mac_h_l75_c7_ec8b_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue := VAR_state_MUX_rmii_eth_mac_h_l98_c5_6205_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse := VAR_valid_MUX_rmii_eth_mac_h_l71_c8_0252_return_output;
     -- last_MUX[rmii_eth_mac_h_l72_c5_e1c4] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond <= VAR_last_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond;
     last_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue;
     last_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output := last_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output;

     -- data_out_reg_MUX[rmii_eth_mac_h_l71_c8_0252] LATENCY=0
     -- Inputs
     data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_cond <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_cond;
     data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue;
     data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse;
     -- Outputs
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_return_output := data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_return_output;

     -- state_MUX[rmii_eth_mac_h_l54_c5_0acc] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l54_c5_0acc_cond <= VAR_state_MUX_rmii_eth_mac_h_l54_c5_0acc_cond;
     state_MUX_rmii_eth_mac_h_l54_c5_0acc_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l54_c5_0acc_iftrue;
     state_MUX_rmii_eth_mac_h_l54_c5_0acc_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l54_c5_0acc_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l54_c5_0acc_return_output := state_MUX_rmii_eth_mac_h_l54_c5_0acc_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l72_c5_e1c4] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond;
     bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output := bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output;

     -- valid_MUX[rmii_eth_mac_h_l59_c8_8d8d] LATENCY=0
     -- Inputs
     valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond <= VAR_valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond;
     valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue <= VAR_valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue;
     valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse <= VAR_valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse;
     -- Outputs
     VAR_valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output := valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output;

     -- state_MUX[rmii_eth_mac_h_l63_c10_f9cc] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l63_c10_f9cc_cond <= VAR_state_MUX_rmii_eth_mac_h_l63_c10_f9cc_cond;
     state_MUX_rmii_eth_mac_h_l63_c10_f9cc_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l63_c10_f9cc_iftrue;
     state_MUX_rmii_eth_mac_h_l63_c10_f9cc_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l63_c10_f9cc_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l63_c10_f9cc_return_output := state_MUX_rmii_eth_mac_h_l63_c10_f9cc_return_output;

     -- fcs_reg_MUX[rmii_eth_mac_h_l71_c8_0252] LATENCY=0
     -- Inputs
     fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_cond <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_cond;
     fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue;
     fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse;
     -- Outputs
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_return_output := fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_return_output;

     -- state_MUX[rmii_eth_mac_h_l93_c8_956c] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l93_c8_956c_cond <= VAR_state_MUX_rmii_eth_mac_h_l93_c8_956c_cond;
     state_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue;
     state_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l93_c8_956c_return_output := state_MUX_rmii_eth_mac_h_l93_c8_956c_return_output;

     -- err_MUX[rmii_eth_mac_h_l63_c10_f9cc] LATENCY=0
     -- Inputs
     err_MUX_rmii_eth_mac_h_l63_c10_f9cc_cond <= VAR_err_MUX_rmii_eth_mac_h_l63_c10_f9cc_cond;
     err_MUX_rmii_eth_mac_h_l63_c10_f9cc_iftrue <= VAR_err_MUX_rmii_eth_mac_h_l63_c10_f9cc_iftrue;
     err_MUX_rmii_eth_mac_h_l63_c10_f9cc_iffalse <= VAR_err_MUX_rmii_eth_mac_h_l63_c10_f9cc_iffalse;
     -- Outputs
     VAR_err_MUX_rmii_eth_mac_h_l63_c10_f9cc_return_output := err_MUX_rmii_eth_mac_h_l63_c10_f9cc_return_output;

     -- state_MUX[rmii_eth_mac_h_l72_c5_e1c4] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond <= VAR_state_MUX_rmii_eth_mac_h_l72_c5_e1c4_cond;
     state_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l72_c5_e1c4_iftrue;
     state_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l72_c5_e1c4_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output := state_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output;

     -- err_MUX[rmii_eth_mac_h_l54_c5_0acc] LATENCY=0
     -- Inputs
     err_MUX_rmii_eth_mac_h_l54_c5_0acc_cond <= VAR_err_MUX_rmii_eth_mac_h_l54_c5_0acc_cond;
     err_MUX_rmii_eth_mac_h_l54_c5_0acc_iftrue <= VAR_err_MUX_rmii_eth_mac_h_l54_c5_0acc_iftrue;
     err_MUX_rmii_eth_mac_h_l54_c5_0acc_iffalse <= VAR_err_MUX_rmii_eth_mac_h_l54_c5_0acc_iffalse;
     -- Outputs
     VAR_err_MUX_rmii_eth_mac_h_l54_c5_0acc_return_output := err_MUX_rmii_eth_mac_h_l54_c5_0acc_return_output;

     -- byte_counter_MUX[rmii_eth_mac_h_l93_c8_956c] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_cond;
     byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_return_output := byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_return_output;

     -- Submodule level 4
     VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse := VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_956c_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse := VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_0252_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue := VAR_err_MUX_rmii_eth_mac_h_l54_c5_0acc_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l60_c5_084e_iffalse := VAR_err_MUX_rmii_eth_mac_h_l63_c10_f9cc_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse := VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_0252_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue := VAR_last_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue := VAR_state_MUX_rmii_eth_mac_h_l54_c5_0acc_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l60_c5_084e_iffalse := VAR_state_MUX_rmii_eth_mac_h_l63_c10_f9cc_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue := VAR_state_MUX_rmii_eth_mac_h_l72_c5_e1c4_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse := VAR_state_MUX_rmii_eth_mac_h_l93_c8_956c_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse := VAR_valid_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output;
     -- valid_MUX[rmii_eth_mac_h_l48_c3_bef6] LATENCY=0
     -- Inputs
     valid_MUX_rmii_eth_mac_h_l48_c3_bef6_cond <= VAR_valid_MUX_rmii_eth_mac_h_l48_c3_bef6_cond;
     valid_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue <= VAR_valid_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue;
     valid_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse <= VAR_valid_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse;
     -- Outputs
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output := valid_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l71_c8_0252] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_cond;
     bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_return_output := bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_return_output;

     -- err_MUX[rmii_eth_mac_h_l60_c5_084e] LATENCY=0
     -- Inputs
     err_MUX_rmii_eth_mac_h_l60_c5_084e_cond <= VAR_err_MUX_rmii_eth_mac_h_l60_c5_084e_cond;
     err_MUX_rmii_eth_mac_h_l60_c5_084e_iftrue <= VAR_err_MUX_rmii_eth_mac_h_l60_c5_084e_iftrue;
     err_MUX_rmii_eth_mac_h_l60_c5_084e_iffalse <= VAR_err_MUX_rmii_eth_mac_h_l60_c5_084e_iffalse;
     -- Outputs
     VAR_err_MUX_rmii_eth_mac_h_l60_c5_084e_return_output := err_MUX_rmii_eth_mac_h_l60_c5_084e_return_output;

     -- fcs_reg_MUX[rmii_eth_mac_h_l59_c8_8d8d] LATENCY=0
     -- Inputs
     fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond;
     fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue;
     fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse;
     -- Outputs
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output := fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output;

     -- state_MUX[rmii_eth_mac_h_l60_c5_084e] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l60_c5_084e_cond <= VAR_state_MUX_rmii_eth_mac_h_l60_c5_084e_cond;
     state_MUX_rmii_eth_mac_h_l60_c5_084e_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l60_c5_084e_iftrue;
     state_MUX_rmii_eth_mac_h_l60_c5_084e_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l60_c5_084e_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l60_c5_084e_return_output := state_MUX_rmii_eth_mac_h_l60_c5_084e_return_output;

     -- byte_counter_MUX[rmii_eth_mac_h_l71_c8_0252] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_cond;
     byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_return_output := byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_return_output;

     -- last_MUX[rmii_eth_mac_h_l71_c8_0252] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l71_c8_0252_cond <= VAR_last_MUX_rmii_eth_mac_h_l71_c8_0252_cond;
     last_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue;
     last_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l71_c8_0252_return_output := last_MUX_rmii_eth_mac_h_l71_c8_0252_return_output;

     -- state_MUX[rmii_eth_mac_h_l71_c8_0252] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l71_c8_0252_cond <= VAR_state_MUX_rmii_eth_mac_h_l71_c8_0252_cond;
     state_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l71_c8_0252_iftrue;
     state_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l71_c8_0252_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l71_c8_0252_return_output := state_MUX_rmii_eth_mac_h_l71_c8_0252_return_output;

     -- data_out_reg_MUX[rmii_eth_mac_h_l59_c8_8d8d] LATENCY=0
     -- Inputs
     data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond;
     data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue;
     data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse;
     -- Outputs
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output := data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output;

     -- Submodule level 5
     VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_0252_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse := VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_0252_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse := VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue := VAR_err_MUX_rmii_eth_mac_h_l60_c5_084e_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse := VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse := VAR_last_MUX_rmii_eth_mac_h_l71_c8_0252_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue := VAR_state_MUX_rmii_eth_mac_h_l60_c5_084e_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse := VAR_state_MUX_rmii_eth_mac_h_l71_c8_0252_return_output;
     -- fcs_reg_MUX[rmii_eth_mac_h_l48_c3_bef6] LATENCY=0
     -- Inputs
     fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_cond <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_cond;
     fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue;
     fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse;
     -- Outputs
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output := fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l59_c8_8d8d] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond;
     bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output := bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output;

     -- byte_counter_MUX[rmii_eth_mac_h_l59_c8_8d8d] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond;
     byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output := byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output;

     -- last_MUX[rmii_eth_mac_h_l59_c8_8d8d] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond <= VAR_last_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond;
     last_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue;
     last_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output := last_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output;

     -- state_MUX[rmii_eth_mac_h_l59_c8_8d8d] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond <= VAR_state_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond;
     state_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue;
     state_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output := state_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output;

     -- err_MUX[rmii_eth_mac_h_l59_c8_8d8d] LATENCY=0
     -- Inputs
     err_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond <= VAR_err_MUX_rmii_eth_mac_h_l59_c8_8d8d_cond;
     err_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue <= VAR_err_MUX_rmii_eth_mac_h_l59_c8_8d8d_iftrue;
     err_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse <= VAR_err_MUX_rmii_eth_mac_h_l59_c8_8d8d_iffalse;
     -- Outputs
     VAR_err_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output := err_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output;

     -- data_out_reg_MUX[rmii_eth_mac_h_l48_c3_bef6] LATENCY=0
     -- Inputs
     data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_cond <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_cond;
     data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue;
     data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse;
     -- Outputs
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output := data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output;

     -- Submodule level 6
     VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse := VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output;
     REG_VAR_data_out_reg := VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse := VAR_err_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output;
     REG_VAR_fcs_reg := VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse := VAR_last_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse := VAR_state_MUX_rmii_eth_mac_h_l59_c8_8d8d_return_output;
     -- byte_counter_MUX[rmii_eth_mac_h_l48_c3_bef6] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_cond;
     byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output := byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l48_c3_bef6] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_cond;
     bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output := bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output;

     -- last_MUX[rmii_eth_mac_h_l48_c3_bef6] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l48_c3_bef6_cond <= VAR_last_MUX_rmii_eth_mac_h_l48_c3_bef6_cond;
     last_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue;
     last_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output := last_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output;

     -- state_MUX[rmii_eth_mac_h_l48_c3_bef6] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l48_c3_bef6_cond <= VAR_state_MUX_rmii_eth_mac_h_l48_c3_bef6_cond;
     state_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue;
     state_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output := state_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output;

     -- err_MUX[rmii_eth_mac_h_l48_c3_bef6] LATENCY=0
     -- Inputs
     err_MUX_rmii_eth_mac_h_l48_c3_bef6_cond <= VAR_err_MUX_rmii_eth_mac_h_l48_c3_bef6_cond;
     err_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue <= VAR_err_MUX_rmii_eth_mac_h_l48_c3_bef6_iftrue;
     err_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse <= VAR_err_MUX_rmii_eth_mac_h_l48_c3_bef6_iffalse;
     -- Outputs
     VAR_err_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output := err_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output;

     -- Submodule level 7
     REG_VAR_bit_counter := VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output;
     REG_VAR_byte_counter := VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output;
     REG_VAR_state := VAR_state_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output;
     -- CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4[rmii_eth_mac_h_l123_c10_1eba] LATENCY=0
     VAR_CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4_rmii_eth_mac_h_l123_c10_1eba_return_output := CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4(
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output,
     VAR_last_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output,
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output,
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output,
     VAR_err_MUX_rmii_eth_mac_h_l48_c3_bef6_return_output);

     -- Submodule level 8
     VAR_return_output := VAR_CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4_rmii_eth_mac_h_l123_c10_1eba_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_data_in_regs <= REG_VAR_data_in_regs;
REG_COMB_data_in_valid_regs <= REG_VAR_data_in_valid_regs;
REG_COMB_data_out_reg <= REG_VAR_data_out_reg;
REG_COMB_state <= REG_VAR_state;
REG_COMB_bit_counter <= REG_VAR_bit_counter;
REG_COMB_byte_counter <= REG_VAR_byte_counter;
REG_COMB_fcs_reg <= REG_VAR_fcs_reg;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if clk_en_internal='1' then
     data_in_regs <= REG_COMB_data_in_regs;
     data_in_valid_regs <= REG_COMB_data_in_valid_regs;
     data_out_reg <= REG_COMB_data_out_reg;
     state <= REG_COMB_state;
     bit_counter <= REG_COMB_bit_counter;
     byte_counter <= REG_COMB_byte_counter;
     fcs_reg <= REG_COMB_fcs_reg;
 end if;
 end if;
end process;

end arch;
