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
-- BIN_OP_EQ[rmii_eth_mac_h_l43_c22_9364]
signal BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l44_c53_0781]
signal BIN_OP_EQ_rmii_eth_mac_h_l44_c53_0781_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l44_c53_0781_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l44_c53_0781_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l44_c28_c953]
signal BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_left : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_right : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l45_c48_9375]
signal BIN_OP_EQ_rmii_eth_mac_h_l45_c48_9375_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l45_c48_9375_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l45_c48_9375_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l45_c23_d908]
signal BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908_left : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908_right : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l48_c6_ecb1]
signal BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_return_output : unsigned(0 downto 0);

-- err_MUX[rmii_eth_mac_h_l48_c3_3300]
signal err_MUX_rmii_eth_mac_h_l48_c3_3300_cond : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l48_c3_3300_return_output : unsigned(0 downto 0);

-- last_MUX[rmii_eth_mac_h_l48_c3_3300]
signal last_MUX_rmii_eth_mac_h_l48_c3_3300_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l48_c3_3300_return_output : unsigned(0 downto 0);

-- valid_MUX[rmii_eth_mac_h_l48_c3_3300]
signal valid_MUX_rmii_eth_mac_h_l48_c3_3300_cond : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l48_c3_3300_return_output : unsigned(0 downto 0);

-- fcs_reg_MUX[rmii_eth_mac_h_l48_c3_3300]
signal fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_cond : unsigned(0 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_return_output : unsigned(31 downto 0);

-- state_MUX[rmii_eth_mac_h_l48_c3_3300]
signal state_MUX_rmii_eth_mac_h_l48_c3_3300_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l48_c3_3300_return_output : unsigned(1 downto 0);

-- data_out_reg_MUX[rmii_eth_mac_h_l48_c3_3300]
signal data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_cond : unsigned(0 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_return_output : unsigned(7 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l48_c3_3300]
signal bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_return_output : unsigned(2 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l48_c3_3300]
signal byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_return_output : unsigned(1 downto 0);

-- err_MUX[rmii_eth_mac_h_l54_c5_d6c9]
signal err_MUX_rmii_eth_mac_h_l54_c5_d6c9_cond : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l54_c5_d6c9_iftrue : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l54_c5_d6c9_iffalse : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l54_c5_d6c9_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l54_c5_d6c9]
signal state_MUX_rmii_eth_mac_h_l54_c5_d6c9_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l54_c5_d6c9_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l54_c5_d6c9_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l54_c5_d6c9_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l59_c11_295d]
signal BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_return_output : unsigned(0 downto 0);

-- err_MUX[rmii_eth_mac_h_l59_c8_625a]
signal err_MUX_rmii_eth_mac_h_l59_c8_625a_cond : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l59_c8_625a_return_output : unsigned(0 downto 0);

-- last_MUX[rmii_eth_mac_h_l59_c8_625a]
signal last_MUX_rmii_eth_mac_h_l59_c8_625a_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l59_c8_625a_return_output : unsigned(0 downto 0);

-- valid_MUX[rmii_eth_mac_h_l59_c8_625a]
signal valid_MUX_rmii_eth_mac_h_l59_c8_625a_cond : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l59_c8_625a_return_output : unsigned(0 downto 0);

-- fcs_reg_MUX[rmii_eth_mac_h_l59_c8_625a]
signal fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_cond : unsigned(0 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_return_output : unsigned(31 downto 0);

-- state_MUX[rmii_eth_mac_h_l59_c8_625a]
signal state_MUX_rmii_eth_mac_h_l59_c8_625a_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l59_c8_625a_return_output : unsigned(1 downto 0);

-- data_out_reg_MUX[rmii_eth_mac_h_l59_c8_625a]
signal data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_cond : unsigned(0 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_return_output : unsigned(7 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l59_c8_625a]
signal bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_return_output : unsigned(2 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l59_c8_625a]
signal byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_return_output : unsigned(1 downto 0);

-- err_MUX[rmii_eth_mac_h_l60_c5_7fb4]
signal err_MUX_rmii_eth_mac_h_l60_c5_7fb4_cond : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l60_c5_7fb4_iftrue : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l60_c5_7fb4_iffalse : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l60_c5_7fb4_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l60_c5_7fb4]
signal state_MUX_rmii_eth_mac_h_l60_c5_7fb4_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l60_c5_7fb4_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l60_c5_7fb4_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l60_c5_7fb4_return_output : unsigned(1 downto 0);

-- err_MUX[rmii_eth_mac_h_l63_c10_e506]
signal err_MUX_rmii_eth_mac_h_l63_c10_e506_cond : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l63_c10_e506_iftrue : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l63_c10_e506_iffalse : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l63_c10_e506_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l63_c10_e506]
signal state_MUX_rmii_eth_mac_h_l63_c10_e506_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l63_c10_e506_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l63_c10_e506_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l63_c10_e506_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l71_c11_be8d]
signal BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_return_output : unsigned(0 downto 0);

-- last_MUX[rmii_eth_mac_h_l71_c8_3480]
signal last_MUX_rmii_eth_mac_h_l71_c8_3480_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l71_c8_3480_return_output : unsigned(0 downto 0);

-- valid_MUX[rmii_eth_mac_h_l71_c8_3480]
signal valid_MUX_rmii_eth_mac_h_l71_c8_3480_cond : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l71_c8_3480_return_output : unsigned(0 downto 0);

-- fcs_reg_MUX[rmii_eth_mac_h_l71_c8_3480]
signal fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_cond : unsigned(0 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_return_output : unsigned(31 downto 0);

-- state_MUX[rmii_eth_mac_h_l71_c8_3480]
signal state_MUX_rmii_eth_mac_h_l71_c8_3480_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l71_c8_3480_return_output : unsigned(1 downto 0);

-- data_out_reg_MUX[rmii_eth_mac_h_l71_c8_3480]
signal data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_cond : unsigned(0 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_return_output : unsigned(7 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l71_c8_3480]
signal bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_return_output : unsigned(2 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l71_c8_3480]
signal byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_return_output : unsigned(1 downto 0);

-- last_MUX[rmii_eth_mac_h_l72_c5_578f]
signal last_MUX_rmii_eth_mac_h_l72_c5_578f_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l72_c5_578f_return_output : unsigned(0 downto 0);

-- valid_MUX[rmii_eth_mac_h_l72_c5_578f]
signal valid_MUX_rmii_eth_mac_h_l72_c5_578f_cond : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l72_c5_578f_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l72_c5_578f]
signal state_MUX_rmii_eth_mac_h_l72_c5_578f_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l72_c5_578f_return_output : unsigned(1 downto 0);

-- data_out_reg_MUX[rmii_eth_mac_h_l72_c5_578f]
signal data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_cond : unsigned(0 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_return_output : unsigned(7 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l72_c5_578f]
signal bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_return_output : unsigned(2 downto 0);

-- last_MUX[rmii_eth_mac_h_l75_c7_81cd]
signal last_MUX_rmii_eth_mac_h_l75_c7_81cd_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l75_c7_81cd_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l75_c7_81cd_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l75_c7_81cd_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l75_c7_81cd]
signal state_MUX_rmii_eth_mac_h_l75_c7_81cd_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l75_c7_81cd_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l75_c7_81cd_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l75_c7_81cd_return_output : unsigned(1 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l75_c7_81cd]
signal bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_return_output : unsigned(2 downto 0);

-- UNARY_OP_NOT[rmii_eth_mac_h_l82_c13_4123]
signal UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_4123_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_4123_return_output : unsigned(0 downto 0);

-- last_MUX[rmii_eth_mac_h_l82_c9_1581]
signal last_MUX_rmii_eth_mac_h_l82_c9_1581_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l82_c9_1581_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l82_c9_1581_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l82_c9_1581_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l82_c9_1581]
signal state_MUX_rmii_eth_mac_h_l82_c9_1581_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l82_c9_1581_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l82_c9_1581_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l82_c9_1581_return_output : unsigned(1 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l82_c9_1581]
signal bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[rmii_eth_mac_h_l89_c9_1093]
signal BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_1093_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_1093_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_1093_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l93_c11_1431]
signal BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_return_output : unsigned(0 downto 0);

-- fcs_reg_MUX[rmii_eth_mac_h_l93_c8_01d9]
signal fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_cond : unsigned(0 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output : unsigned(31 downto 0);

-- state_MUX[rmii_eth_mac_h_l93_c8_01d9]
signal state_MUX_rmii_eth_mac_h_l93_c8_01d9_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output : unsigned(1 downto 0);

-- data_out_reg_MUX[rmii_eth_mac_h_l93_c8_01d9]
signal data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_cond : unsigned(0 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output : unsigned(7 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l93_c8_01d9]
signal bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output : unsigned(2 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l93_c8_01d9]
signal byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output : unsigned(1 downto 0);

-- CONST_SR_2[rmii_eth_mac_h_l96_c44_c9bb]
signal CONST_SR_2_rmii_eth_mac_h_l96_c44_c9bb_x : unsigned(31 downto 0);
signal CONST_SR_2_rmii_eth_mac_h_l96_c44_c9bb_return_output : unsigned(31 downto 0);

-- state_MUX[rmii_eth_mac_h_l98_c5_b939]
signal state_MUX_rmii_eth_mac_h_l98_c5_b939_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l98_c5_b939_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l98_c5_b939_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l98_c5_b939_return_output : unsigned(1 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l98_c5_b939]
signal bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_return_output : unsigned(2 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l98_c5_b939]
signal byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l99_c10_89b1]
signal BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l99_c7_ca27]
signal state_MUX_rmii_eth_mac_h_l99_c7_ca27_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l99_c7_ca27_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l99_c7_ca27_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l99_c7_ca27_return_output : unsigned(1 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l99_c7_ca27]
signal byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_return_output : unsigned(1 downto 0);

-- BIN_OP_PLUS[rmii_eth_mac_h_l103_c9_4515]
signal BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_4515_left : unsigned(1 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_4515_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_4515_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[rmii_eth_mac_h_l108_c7_5a10]
signal BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5a10_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5a10_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5a10_return_output : unsigned(3 downto 0);

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
-- BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_left,
BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_right,
BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l44_c53_0781 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l44_c53_0781 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l44_c53_0781_left,
BIN_OP_EQ_rmii_eth_mac_h_l44_c53_0781_right,
BIN_OP_EQ_rmii_eth_mac_h_l44_c53_0781_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953 : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_left,
BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_right,
BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l45_c48_9375 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l45_c48_9375 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l45_c48_9375_left,
BIN_OP_EQ_rmii_eth_mac_h_l45_c48_9375_right,
BIN_OP_EQ_rmii_eth_mac_h_l45_c48_9375_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908 : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908_left,
BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908_right,
BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_left,
BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_right,
BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_return_output);

-- err_MUX_rmii_eth_mac_h_l48_c3_3300 : 0 clocks latency
err_MUX_rmii_eth_mac_h_l48_c3_3300 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
err_MUX_rmii_eth_mac_h_l48_c3_3300_cond,
err_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue,
err_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse,
err_MUX_rmii_eth_mac_h_l48_c3_3300_return_output);

-- last_MUX_rmii_eth_mac_h_l48_c3_3300 : 0 clocks latency
last_MUX_rmii_eth_mac_h_l48_c3_3300 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l48_c3_3300_cond,
last_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue,
last_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse,
last_MUX_rmii_eth_mac_h_l48_c3_3300_return_output);

-- valid_MUX_rmii_eth_mac_h_l48_c3_3300 : 0 clocks latency
valid_MUX_rmii_eth_mac_h_l48_c3_3300 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
valid_MUX_rmii_eth_mac_h_l48_c3_3300_cond,
valid_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue,
valid_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse,
valid_MUX_rmii_eth_mac_h_l48_c3_3300_return_output);

-- fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300 : 0 clocks latency
fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_cond,
fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue,
fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse,
fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_return_output);

-- state_MUX_rmii_eth_mac_h_l48_c3_3300 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l48_c3_3300 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l48_c3_3300_cond,
state_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue,
state_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse,
state_MUX_rmii_eth_mac_h_l48_c3_3300_return_output);

-- data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300 : 0 clocks latency
data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_cond,
data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue,
data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse,
data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_cond,
bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300 : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_cond,
byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_return_output);

-- err_MUX_rmii_eth_mac_h_l54_c5_d6c9 : 0 clocks latency
err_MUX_rmii_eth_mac_h_l54_c5_d6c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
err_MUX_rmii_eth_mac_h_l54_c5_d6c9_cond,
err_MUX_rmii_eth_mac_h_l54_c5_d6c9_iftrue,
err_MUX_rmii_eth_mac_h_l54_c5_d6c9_iffalse,
err_MUX_rmii_eth_mac_h_l54_c5_d6c9_return_output);

-- state_MUX_rmii_eth_mac_h_l54_c5_d6c9 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l54_c5_d6c9 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l54_c5_d6c9_cond,
state_MUX_rmii_eth_mac_h_l54_c5_d6c9_iftrue,
state_MUX_rmii_eth_mac_h_l54_c5_d6c9_iffalse,
state_MUX_rmii_eth_mac_h_l54_c5_d6c9_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_left,
BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_right,
BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_return_output);

-- err_MUX_rmii_eth_mac_h_l59_c8_625a : 0 clocks latency
err_MUX_rmii_eth_mac_h_l59_c8_625a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
err_MUX_rmii_eth_mac_h_l59_c8_625a_cond,
err_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue,
err_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse,
err_MUX_rmii_eth_mac_h_l59_c8_625a_return_output);

-- last_MUX_rmii_eth_mac_h_l59_c8_625a : 0 clocks latency
last_MUX_rmii_eth_mac_h_l59_c8_625a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l59_c8_625a_cond,
last_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue,
last_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse,
last_MUX_rmii_eth_mac_h_l59_c8_625a_return_output);

-- valid_MUX_rmii_eth_mac_h_l59_c8_625a : 0 clocks latency
valid_MUX_rmii_eth_mac_h_l59_c8_625a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
valid_MUX_rmii_eth_mac_h_l59_c8_625a_cond,
valid_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue,
valid_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse,
valid_MUX_rmii_eth_mac_h_l59_c8_625a_return_output);

-- fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a : 0 clocks latency
fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_cond,
fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue,
fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse,
fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_return_output);

-- state_MUX_rmii_eth_mac_h_l59_c8_625a : 0 clocks latency
state_MUX_rmii_eth_mac_h_l59_c8_625a : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l59_c8_625a_cond,
state_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue,
state_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse,
state_MUX_rmii_eth_mac_h_l59_c8_625a_return_output);

-- data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a : 0 clocks latency
data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_cond,
data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue,
data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse,
data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_cond,
bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_cond,
byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_return_output);

-- err_MUX_rmii_eth_mac_h_l60_c5_7fb4 : 0 clocks latency
err_MUX_rmii_eth_mac_h_l60_c5_7fb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
err_MUX_rmii_eth_mac_h_l60_c5_7fb4_cond,
err_MUX_rmii_eth_mac_h_l60_c5_7fb4_iftrue,
err_MUX_rmii_eth_mac_h_l60_c5_7fb4_iffalse,
err_MUX_rmii_eth_mac_h_l60_c5_7fb4_return_output);

-- state_MUX_rmii_eth_mac_h_l60_c5_7fb4 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l60_c5_7fb4 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l60_c5_7fb4_cond,
state_MUX_rmii_eth_mac_h_l60_c5_7fb4_iftrue,
state_MUX_rmii_eth_mac_h_l60_c5_7fb4_iffalse,
state_MUX_rmii_eth_mac_h_l60_c5_7fb4_return_output);

-- err_MUX_rmii_eth_mac_h_l63_c10_e506 : 0 clocks latency
err_MUX_rmii_eth_mac_h_l63_c10_e506 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
err_MUX_rmii_eth_mac_h_l63_c10_e506_cond,
err_MUX_rmii_eth_mac_h_l63_c10_e506_iftrue,
err_MUX_rmii_eth_mac_h_l63_c10_e506_iffalse,
err_MUX_rmii_eth_mac_h_l63_c10_e506_return_output);

-- state_MUX_rmii_eth_mac_h_l63_c10_e506 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l63_c10_e506 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l63_c10_e506_cond,
state_MUX_rmii_eth_mac_h_l63_c10_e506_iftrue,
state_MUX_rmii_eth_mac_h_l63_c10_e506_iffalse,
state_MUX_rmii_eth_mac_h_l63_c10_e506_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_left,
BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_right,
BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_return_output);

-- last_MUX_rmii_eth_mac_h_l71_c8_3480 : 0 clocks latency
last_MUX_rmii_eth_mac_h_l71_c8_3480 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l71_c8_3480_cond,
last_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue,
last_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse,
last_MUX_rmii_eth_mac_h_l71_c8_3480_return_output);

-- valid_MUX_rmii_eth_mac_h_l71_c8_3480 : 0 clocks latency
valid_MUX_rmii_eth_mac_h_l71_c8_3480 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
valid_MUX_rmii_eth_mac_h_l71_c8_3480_cond,
valid_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue,
valid_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse,
valid_MUX_rmii_eth_mac_h_l71_c8_3480_return_output);

-- fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480 : 0 clocks latency
fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_cond,
fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue,
fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse,
fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_return_output);

-- state_MUX_rmii_eth_mac_h_l71_c8_3480 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l71_c8_3480 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l71_c8_3480_cond,
state_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue,
state_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse,
state_MUX_rmii_eth_mac_h_l71_c8_3480_return_output);

-- data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480 : 0 clocks latency
data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_cond,
data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue,
data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse,
data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_cond,
bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480 : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_cond,
byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_return_output);

-- last_MUX_rmii_eth_mac_h_l72_c5_578f : 0 clocks latency
last_MUX_rmii_eth_mac_h_l72_c5_578f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l72_c5_578f_cond,
last_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue,
last_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse,
last_MUX_rmii_eth_mac_h_l72_c5_578f_return_output);

-- valid_MUX_rmii_eth_mac_h_l72_c5_578f : 0 clocks latency
valid_MUX_rmii_eth_mac_h_l72_c5_578f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
valid_MUX_rmii_eth_mac_h_l72_c5_578f_cond,
valid_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue,
valid_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse,
valid_MUX_rmii_eth_mac_h_l72_c5_578f_return_output);

-- state_MUX_rmii_eth_mac_h_l72_c5_578f : 0 clocks latency
state_MUX_rmii_eth_mac_h_l72_c5_578f : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l72_c5_578f_cond,
state_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue,
state_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse,
state_MUX_rmii_eth_mac_h_l72_c5_578f_return_output);

-- data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f : 0 clocks latency
data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_cond,
data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue,
data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse,
data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_cond,
bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_return_output);

-- last_MUX_rmii_eth_mac_h_l75_c7_81cd : 0 clocks latency
last_MUX_rmii_eth_mac_h_l75_c7_81cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l75_c7_81cd_cond,
last_MUX_rmii_eth_mac_h_l75_c7_81cd_iftrue,
last_MUX_rmii_eth_mac_h_l75_c7_81cd_iffalse,
last_MUX_rmii_eth_mac_h_l75_c7_81cd_return_output);

-- state_MUX_rmii_eth_mac_h_l75_c7_81cd : 0 clocks latency
state_MUX_rmii_eth_mac_h_l75_c7_81cd : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l75_c7_81cd_cond,
state_MUX_rmii_eth_mac_h_l75_c7_81cd_iftrue,
state_MUX_rmii_eth_mac_h_l75_c7_81cd_iffalse,
state_MUX_rmii_eth_mac_h_l75_c7_81cd_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_cond,
bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_return_output);

-- UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_4123 : 0 clocks latency
UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_4123 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_4123_expr,
UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_4123_return_output);

-- last_MUX_rmii_eth_mac_h_l82_c9_1581 : 0 clocks latency
last_MUX_rmii_eth_mac_h_l82_c9_1581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l82_c9_1581_cond,
last_MUX_rmii_eth_mac_h_l82_c9_1581_iftrue,
last_MUX_rmii_eth_mac_h_l82_c9_1581_iffalse,
last_MUX_rmii_eth_mac_h_l82_c9_1581_return_output);

-- state_MUX_rmii_eth_mac_h_l82_c9_1581 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l82_c9_1581 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l82_c9_1581_cond,
state_MUX_rmii_eth_mac_h_l82_c9_1581_iftrue,
state_MUX_rmii_eth_mac_h_l82_c9_1581_iffalse,
state_MUX_rmii_eth_mac_h_l82_c9_1581_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_cond,
bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_return_output);

-- BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_1093 : 0 clocks latency
BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_1093 : entity work.BIN_OP_PLUS_uint3_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_1093_left,
BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_1093_right,
BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_1093_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_left,
BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_right,
BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_return_output);

-- fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9 : 0 clocks latency
fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_cond,
fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue,
fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse,
fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output);

-- state_MUX_rmii_eth_mac_h_l93_c8_01d9 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l93_c8_01d9 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l93_c8_01d9_cond,
state_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue,
state_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse,
state_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output);

-- data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9 : 0 clocks latency
data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_cond,
data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue,
data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse,
data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_cond,
bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9 : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_cond,
byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output);

-- CONST_SR_2_rmii_eth_mac_h_l96_c44_c9bb : 0 clocks latency
CONST_SR_2_rmii_eth_mac_h_l96_c44_c9bb : entity work.CONST_SR_2_uint32_t_0CLK_de264c78 port map (
CONST_SR_2_rmii_eth_mac_h_l96_c44_c9bb_x,
CONST_SR_2_rmii_eth_mac_h_l96_c44_c9bb_return_output);

-- state_MUX_rmii_eth_mac_h_l98_c5_b939 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l98_c5_b939 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l98_c5_b939_cond,
state_MUX_rmii_eth_mac_h_l98_c5_b939_iftrue,
state_MUX_rmii_eth_mac_h_l98_c5_b939_iffalse,
state_MUX_rmii_eth_mac_h_l98_c5_b939_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_cond,
bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939 : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_cond,
byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1_left,
BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1_right,
BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1_return_output);

-- state_MUX_rmii_eth_mac_h_l99_c7_ca27 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l99_c7_ca27 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l99_c7_ca27_cond,
state_MUX_rmii_eth_mac_h_l99_c7_ca27_iftrue,
state_MUX_rmii_eth_mac_h_l99_c7_ca27_iffalse,
state_MUX_rmii_eth_mac_h_l99_c7_ca27_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27 : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_cond,
byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_return_output);

-- BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_4515 : 0 clocks latency
BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_4515 : entity work.BIN_OP_PLUS_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_4515_left,
BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_4515_right,
BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_4515_return_output);

-- BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5a10 : 0 clocks latency
BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5a10 : entity work.BIN_OP_PLUS_uint3_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5a10_left,
BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5a10_right,
BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5a10_return_output);



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
 BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l44_c53_0781_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l45_c48_9375_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_return_output,
 err_MUX_rmii_eth_mac_h_l48_c3_3300_return_output,
 last_MUX_rmii_eth_mac_h_l48_c3_3300_return_output,
 valid_MUX_rmii_eth_mac_h_l48_c3_3300_return_output,
 fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_return_output,
 state_MUX_rmii_eth_mac_h_l48_c3_3300_return_output,
 data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_return_output,
 err_MUX_rmii_eth_mac_h_l54_c5_d6c9_return_output,
 state_MUX_rmii_eth_mac_h_l54_c5_d6c9_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_return_output,
 err_MUX_rmii_eth_mac_h_l59_c8_625a_return_output,
 last_MUX_rmii_eth_mac_h_l59_c8_625a_return_output,
 valid_MUX_rmii_eth_mac_h_l59_c8_625a_return_output,
 fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_return_output,
 state_MUX_rmii_eth_mac_h_l59_c8_625a_return_output,
 data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_return_output,
 err_MUX_rmii_eth_mac_h_l60_c5_7fb4_return_output,
 state_MUX_rmii_eth_mac_h_l60_c5_7fb4_return_output,
 err_MUX_rmii_eth_mac_h_l63_c10_e506_return_output,
 state_MUX_rmii_eth_mac_h_l63_c10_e506_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_return_output,
 last_MUX_rmii_eth_mac_h_l71_c8_3480_return_output,
 valid_MUX_rmii_eth_mac_h_l71_c8_3480_return_output,
 fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_return_output,
 state_MUX_rmii_eth_mac_h_l71_c8_3480_return_output,
 data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_return_output,
 last_MUX_rmii_eth_mac_h_l72_c5_578f_return_output,
 valid_MUX_rmii_eth_mac_h_l72_c5_578f_return_output,
 state_MUX_rmii_eth_mac_h_l72_c5_578f_return_output,
 data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_return_output,
 last_MUX_rmii_eth_mac_h_l75_c7_81cd_return_output,
 state_MUX_rmii_eth_mac_h_l75_c7_81cd_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_return_output,
 UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_4123_return_output,
 last_MUX_rmii_eth_mac_h_l82_c9_1581_return_output,
 state_MUX_rmii_eth_mac_h_l82_c9_1581_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_return_output,
 BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_1093_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_return_output,
 fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output,
 state_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output,
 data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output,
 CONST_SR_2_rmii_eth_mac_h_l96_c44_c9bb_return_output,
 state_MUX_rmii_eth_mac_h_l98_c5_b939_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1_return_output,
 state_MUX_rmii_eth_mac_h_l99_c7_ca27_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_return_output,
 BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_4515_return_output,
 BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5a10_return_output)
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
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_2ed8_return_output : unsigned(1 downto 0);
 variable VAR_data_in_valid_delayed : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_f56e_return_output : unsigned(0 downto 0);
 variable VAR_o : rmii_rx_mac_t;
 variable VAR_bit_end : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_return_output : unsigned(0 downto 0);
 variable VAR_preamble_bits : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_0781_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_0781_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_0781_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_return_output : unsigned(0 downto 0);
 variable VAR_sfd_bits : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_9375_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_9375_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_9375_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l54_c5_d6c9_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l59_c8_625a_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l48_c3_3300_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l48_c3_3300_cond : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l59_c8_625a_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l48_c3_3300_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l48_c3_3300_cond : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l59_c8_625a_return_output : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l48_c3_3300_return_output : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l48_c3_3300_cond : unsigned(0 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue : unsigned(31 downto 0);
 variable VAR_fcs_reg_rmii_eth_mac_h_l53_c5_17cc : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_return_output : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_return_output : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l54_c5_d6c9_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l59_c8_625a_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l48_c3_3300_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l48_c3_3300_cond : unsigned(0 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue : unsigned(7 downto 0);
 variable VAR_data_out_reg_rmii_eth_mac_h_l51_c5_cbb6 : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_return_output : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_return_output : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l52_c5_2ae4 : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_cond : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_cond : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l54_c5_d6c9_iftrue : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l54_c5_d6c9_iffalse : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l54_c5_d6c9_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l54_c5_d6c9_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l54_c5_d6c9_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l54_c5_d6c9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l60_c5_7fb4_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l59_c8_625a_cond : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l71_c8_3480_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l59_c8_625a_cond : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l71_c8_3480_return_output : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l59_c8_625a_cond : unsigned(0 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_return_output : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l60_c5_7fb4_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l71_c8_3480_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l59_c8_625a_cond : unsigned(0 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_return_output : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_cond : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_cond : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l60_c5_7fb4_iftrue : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l60_c5_7fb4_iffalse : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l63_c10_e506_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l60_c5_7fb4_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l60_c5_7fb4_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l60_c5_7fb4_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l63_c10_e506_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l60_c5_7fb4_cond : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l63_c10_e506_iftrue : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l63_c10_e506_iffalse : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l63_c10_e506_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l63_c10_e506_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l63_c10_e506_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l63_c10_e506_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l72_c5_578f_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l71_c8_3480_cond : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l72_c5_578f_return_output : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l71_c8_3480_cond : unsigned(0 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l72_c5_578f_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l71_c8_3480_cond : unsigned(0 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_return_output : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_cond : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_cond : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l75_c7_81cd_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l72_c5_578f_cond : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l72_c5_578f_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l75_c7_81cd_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l72_c5_578f_cond : unsigned(0 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_cond : unsigned(0 downto 0);
 variable VAR_uint8_7_2_rmii_eth_mac_h_l73_c50_b05a_return_output : unsigned(5 downto 0);
 variable VAR_uint2_uint6_rmii_eth_mac_h_l73_c22_325f_return_output : unsigned(7 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l75_c7_81cd_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l82_c9_1581_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l75_c7_81cd_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l75_c7_81cd_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l75_c7_81cd_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l82_c9_1581_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l75_c7_81cd_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l75_c7_81cd_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l89_c9_698a : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l76_c9_7063 : unsigned(2 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_4123_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_4123_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l82_c9_1581_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l82_c9_1581_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l82_c9_1581_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l82_c9_1581_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l82_c9_1581_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l82_c9_1581_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l84_c11_90e6 : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_1093_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_1093_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_1093_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_return_output : unsigned(0 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l98_c5_b939_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l93_c8_01d9_cond : unsigned(0 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue : unsigned(7 downto 0);
 variable VAR_data_out_reg_rmii_eth_mac_h_l97_c5_0dfd : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_cond : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_c9bb_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_c9bb_x : unsigned(31 downto 0);
 variable VAR_uint2_uint30_rmii_eth_mac_h_l96_c15_5f91_return_output : unsigned(31 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l98_c5_b939_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l99_c7_ca27_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l98_c5_b939_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l98_c5_b939_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l105_c7_4eb3 : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l108_c7_97ab : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_cond : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1_return_output : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l99_c7_ca27_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l99_c7_ca27_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l99_c7_ca27_cond : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_rmii_eth_mac_h_l101_c9_d7c4 : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_rmii_eth_mac_h_l103_c9_9d2f : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_4515_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_4515_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_4515_return_output : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5a10_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5a10_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5a10_return_output : unsigned(3 downto 0);
 variable VAR_ARRAY_SHIFT_UP_i : unsigned(31 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_0_CONST_REF_RD_uint2_t_uint2_t_20_18_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_1_CONST_REF_RD_uint2_t_uint2_t_20_17_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_2_CONST_REF_RD_uint2_t_uint2_t_20_16_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_3_CONST_REF_RD_uint2_t_uint2_t_20_15_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_4_CONST_REF_RD_uint2_t_uint2_t_20_14_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_5_CONST_REF_RD_uint2_t_uint2_t_20_13_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_6_CONST_REF_RD_uint2_t_uint2_t_20_12_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_7_CONST_REF_RD_uint2_t_uint2_t_20_11_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_8_CONST_REF_RD_uint2_t_uint2_t_20_10_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_9_CONST_REF_RD_uint2_t_uint2_t_20_9_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_10_CONST_REF_RD_uint2_t_uint2_t_20_8_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_11_CONST_REF_RD_uint2_t_uint2_t_20_7_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_12_CONST_REF_RD_uint2_t_uint2_t_20_6_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_13_CONST_REF_RD_uint2_t_uint2_t_20_5_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_14_CONST_REF_RD_uint2_t_uint2_t_20_4_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_15_CONST_REF_RD_uint2_t_uint2_t_20_3_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_16_CONST_REF_RD_uint2_t_uint2_t_20_2_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_17_CONST_REF_RD_uint2_t_uint2_t_20_1_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_18_CONST_REF_RD_uint2_t_uint2_t_20_0_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_0_CONST_REF_RD_uint1_t_uint1_t_20_18_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_1_CONST_REF_RD_uint1_t_uint1_t_20_17_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_2_CONST_REF_RD_uint1_t_uint1_t_20_16_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_3_CONST_REF_RD_uint1_t_uint1_t_20_15_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_4_CONST_REF_RD_uint1_t_uint1_t_20_14_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_5_CONST_REF_RD_uint1_t_uint1_t_20_13_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_6_CONST_REF_RD_uint1_t_uint1_t_20_12_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_7_CONST_REF_RD_uint1_t_uint1_t_20_11_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_8_CONST_REF_RD_uint1_t_uint1_t_20_10_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_9_CONST_REF_RD_uint1_t_uint1_t_20_9_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_10_CONST_REF_RD_uint1_t_uint1_t_20_8_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_11_CONST_REF_RD_uint1_t_uint1_t_20_7_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_12_CONST_REF_RD_uint1_t_uint1_t_20_6_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_13_CONST_REF_RD_uint1_t_uint1_t_20_5_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_14_CONST_REF_RD_uint1_t_uint1_t_20_4_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_15_CONST_REF_RD_uint1_t_uint1_t_20_3_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_16_CONST_REF_RD_uint1_t_uint1_t_20_2_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_17_CONST_REF_RD_uint1_t_uint1_t_20_1_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_18_CONST_REF_RD_uint1_t_uint1_t_20_0_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4_rmii_eth_mac_h_l123_c10_70c5_return_output : rmii_rx_mac_t;
 variable VAR_data_in_regs_CONST_REF_RD_uint2_t_20_uint2_t_20_a609_rmii_eth_mac_h_l17_c15_9549_return_output : uint2_t_20;
 variable VAR_data_in_valid_regs_CONST_REF_RD_uint1_t_20_uint1_t_20_a609_rmii_eth_mac_h_l17_c15_9549_return_output : uint1_t_20;
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
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_right := unsigned(rmii_rx_mac_state_t_to_slv(DATA));
     VAR_state_MUX_rmii_eth_mac_h_l63_c10_e506_iftrue := unsigned(rmii_rx_mac_state_t_to_slv(DATA));
     VAR_state_MUX_rmii_eth_mac_h_l82_c9_1581_iftrue := unsigned(rmii_rx_mac_state_t_to_slv(FCS));
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5a10_right := to_unsigned(2, 2);
     VAR_valid_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse := to_unsigned(0, 1);
     VAR_valid_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue := to_unsigned(0, 1);
     VAR_valid_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse := to_unsigned(0, 1);
     VAR_fcs_reg_rmii_eth_mac_h_l53_c5_17cc := resize(to_unsigned(0, 1), 32);
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue := VAR_fcs_reg_rmii_eth_mac_h_l53_c5_17cc;
     VAR_err_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse := to_unsigned(0, 1);
     VAR_err_MUX_rmii_eth_mac_h_l60_c5_7fb4_iftrue := to_unsigned(0, 1);
     VAR_err_MUX_rmii_eth_mac_h_l54_c5_d6c9_iffalse := to_unsigned(0, 1);
     VAR_err_MUX_rmii_eth_mac_h_l63_c10_e506_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_right := unsigned(rmii_rx_mac_state_t_to_slv(IDLE));
     VAR_bit_counter_rmii_eth_mac_h_l76_c9_7063 := resize(to_unsigned(0, 1), 3);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_iffalse := VAR_bit_counter_rmii_eth_mac_h_l76_c9_7063;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_right := unsigned(rmii_rx_mac_state_t_to_slv(FCS));
     VAR_state_MUX_rmii_eth_mac_h_l99_c7_ca27_iftrue := unsigned(rmii_rx_mac_state_t_to_slv(IDLE));
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue := to_unsigned(0, 1);
     VAR_last_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue := to_unsigned(0, 1);
     VAR_last_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse := to_unsigned(0, 1);
     VAR_last_MUX_rmii_eth_mac_h_l75_c7_81cd_iffalse := to_unsigned(0, 1);
     VAR_last_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse := to_unsigned(0, 1);
     VAR_last_MUX_rmii_eth_mac_h_l82_c9_1581_iffalse := to_unsigned(0, 1);
     VAR_err_MUX_rmii_eth_mac_h_l54_c5_d6c9_iftrue := to_unsigned(0, 1);
     VAR_byte_counter_rmii_eth_mac_h_l101_c9_d7c4 := resize(to_unsigned(0, 1), 2);
     VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_iftrue := VAR_byte_counter_rmii_eth_mac_h_l101_c9_d7c4;
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_1093_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_right := unsigned(rmii_rx_mac_state_t_to_slv(PREAMBLE));
     VAR_last_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue := to_unsigned(0, 1);
     VAR_data_out_reg_rmii_eth_mac_h_l97_c5_0dfd := resize(to_unsigned(0, 1), 8);
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue := VAR_data_out_reg_rmii_eth_mac_h_l97_c5_0dfd;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_0781_right := to_unsigned(1, 2);
     VAR_bit_counter_rmii_eth_mac_h_l105_c7_4eb3 := resize(to_unsigned(0, 1), 3);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iftrue := VAR_bit_counter_rmii_eth_mac_h_l105_c7_4eb3;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_9375_right := to_unsigned(3, 2);
     VAR_data_out_reg_rmii_eth_mac_h_l51_c5_cbb6 := resize(to_unsigned(0, 1), 8);
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue := VAR_data_out_reg_rmii_eth_mac_h_l51_c5_cbb6;
     VAR_state_MUX_rmii_eth_mac_h_l60_c5_7fb4_iftrue := unsigned(rmii_rx_mac_state_t_to_slv(PREAMBLE));
     VAR_bit_counter_rmii_eth_mac_h_l52_c5_2ae4 := resize(to_unsigned(0, 1), 3);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue := VAR_bit_counter_rmii_eth_mac_h_l52_c5_2ae4;
     VAR_state_MUX_rmii_eth_mac_h_l63_c10_e506_iffalse := unsigned(rmii_rx_mac_state_t_to_slv(IDLE));
     VAR_bit_counter_rmii_eth_mac_h_l84_c11_90e6 := resize(to_unsigned(0, 1), 3);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_iftrue := VAR_bit_counter_rmii_eth_mac_h_l84_c11_90e6;
     VAR_state_MUX_rmii_eth_mac_h_l54_c5_d6c9_iftrue := unsigned(rmii_rx_mac_state_t_to_slv(PREAMBLE));
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_4515_right := to_unsigned(1, 1);
     VAR_last_MUX_rmii_eth_mac_h_l82_c9_1581_iftrue := to_unsigned(1, 1);
     VAR_err_MUX_rmii_eth_mac_h_l63_c10_e506_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_right := to_unsigned(6, 3);

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
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_left := bit_counter;
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5a10_left := bit_counter;
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_1093_left := bit_counter;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue := bit_counter;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse := bit_counter;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse := bit_counter;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1_left := byte_counter;
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_4515_left := byte_counter;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue := byte_counter;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue := byte_counter;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue := byte_counter;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse := byte_counter;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iffalse := byte_counter;
     VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_4123_expr := VAR_data_in_valid;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue := data_out_reg;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse := data_out_reg;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse := data_out_reg;
     VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_c9bb_x := fcs_reg;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue := fcs_reg;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue := fcs_reg;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse := fcs_reg;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_left := state;
     VAR_state_MUX_rmii_eth_mac_h_l54_c5_d6c9_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l75_c7_81cd_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l82_c9_1581_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l98_c5_b939_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l99_c7_ca27_iffalse := state;
     -- FOR_rmii_eth_mac_h_l114_c30_4652_ITER_18_CONST_REF_RD_uint1_t_uint1_t_20_0_d41d[rmii_eth_mac_h_l114_c146_ee20] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_18_CONST_REF_RD_uint1_t_uint1_t_20_0_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output := data_in_valid_regs(0);

     -- BIN_OP_EQ[rmii_eth_mac_h_l43_c22_9364] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_left;
     BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_return_output := BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_return_output;

     -- FOR_rmii_eth_mac_h_l113_c30_8707_ITER_7_CONST_REF_RD_uint2_t_uint2_t_20_11_d41d[rmii_eth_mac_h_l113_c140_abe6] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_7_CONST_REF_RD_uint2_t_uint2_t_20_11_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output := data_in_regs(11);

     -- FOR_rmii_eth_mac_h_l114_c30_4652_ITER_1_CONST_REF_RD_uint1_t_uint1_t_20_17_d41d[rmii_eth_mac_h_l114_c146_ee20] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_1_CONST_REF_RD_uint1_t_uint1_t_20_17_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output := data_in_valid_regs(17);

     -- FOR_rmii_eth_mac_h_l114_c30_4652_ITER_10_CONST_REF_RD_uint1_t_uint1_t_20_8_d41d[rmii_eth_mac_h_l114_c146_ee20] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_10_CONST_REF_RD_uint1_t_uint1_t_20_8_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output := data_in_valid_regs(8);

     -- BIN_OP_PLUS[rmii_eth_mac_h_l108_c7_5a10] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5a10_left <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5a10_left;
     BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5a10_right <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5a10_right;
     -- Outputs
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5a10_return_output := BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5a10_return_output;

     -- FOR_rmii_eth_mac_h_l113_c30_8707_ITER_11_CONST_REF_RD_uint2_t_uint2_t_20_7_d41d[rmii_eth_mac_h_l113_c140_abe6] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_11_CONST_REF_RD_uint2_t_uint2_t_20_7_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output := data_in_regs(7);

     -- FOR_rmii_eth_mac_h_l113_c30_8707_ITER_6_CONST_REF_RD_uint2_t_uint2_t_20_12_d41d[rmii_eth_mac_h_l113_c140_abe6] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_6_CONST_REF_RD_uint2_t_uint2_t_20_12_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output := data_in_regs(12);

     -- BIN_OP_PLUS[rmii_eth_mac_h_l89_c9_1093] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_1093_left <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_1093_left;
     BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_1093_right <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_1093_right;
     -- Outputs
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_1093_return_output := BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_1093_return_output;

     -- FOR_rmii_eth_mac_h_l114_c30_4652_ITER_7_CONST_REF_RD_uint1_t_uint1_t_20_11_d41d[rmii_eth_mac_h_l114_c146_ee20] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_7_CONST_REF_RD_uint1_t_uint1_t_20_11_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output := data_in_valid_regs(11);

     -- FOR_rmii_eth_mac_h_l113_c30_8707_ITER_2_CONST_REF_RD_uint2_t_uint2_t_20_16_d41d[rmii_eth_mac_h_l113_c140_abe6] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_2_CONST_REF_RD_uint2_t_uint2_t_20_16_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output := data_in_regs(16);

     -- BIN_OP_EQ[rmii_eth_mac_h_l48_c6_ecb1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_left;
     BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_return_output := BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_return_output;

     -- FOR_rmii_eth_mac_h_l113_c30_8707_ITER_14_CONST_REF_RD_uint2_t_uint2_t_20_4_d41d[rmii_eth_mac_h_l113_c140_abe6] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_14_CONST_REF_RD_uint2_t_uint2_t_20_4_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output := data_in_regs(4);

     -- FOR_rmii_eth_mac_h_l114_c30_4652_ITER_5_CONST_REF_RD_uint1_t_uint1_t_20_13_d41d[rmii_eth_mac_h_l114_c146_ee20] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_5_CONST_REF_RD_uint1_t_uint1_t_20_13_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output := data_in_valid_regs(13);

     -- BIN_OP_EQ[rmii_eth_mac_h_l71_c11_be8d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_left;
     BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_return_output := BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_return_output;

     -- FOR_rmii_eth_mac_h_l114_c30_4652_ITER_6_CONST_REF_RD_uint1_t_uint1_t_20_12_d41d[rmii_eth_mac_h_l114_c146_ee20] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_6_CONST_REF_RD_uint1_t_uint1_t_20_12_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output := data_in_valid_regs(12);

     -- BIN_OP_PLUS[rmii_eth_mac_h_l103_c9_4515] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_4515_left <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_4515_left;
     BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_4515_right <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_4515_right;
     -- Outputs
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_4515_return_output := BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_4515_return_output;

     -- FOR_rmii_eth_mac_h_l114_c30_4652_ITER_2_CONST_REF_RD_uint1_t_uint1_t_20_16_d41d[rmii_eth_mac_h_l114_c146_ee20] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_2_CONST_REF_RD_uint1_t_uint1_t_20_16_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output := data_in_valid_regs(16);

     -- FOR_rmii_eth_mac_h_l114_c30_4652_ITER_15_CONST_REF_RD_uint1_t_uint1_t_20_3_d41d[rmii_eth_mac_h_l114_c146_ee20] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_15_CONST_REF_RD_uint1_t_uint1_t_20_3_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output := data_in_valid_regs(3);

     -- FOR_rmii_eth_mac_h_l113_c30_8707_ITER_13_CONST_REF_RD_uint2_t_uint2_t_20_5_d41d[rmii_eth_mac_h_l113_c140_abe6] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_13_CONST_REF_RD_uint2_t_uint2_t_20_5_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output := data_in_regs(5);

     -- FOR_rmii_eth_mac_h_l113_c30_8707_ITER_0_CONST_REF_RD_uint2_t_uint2_t_20_18_d41d[rmii_eth_mac_h_l113_c140_abe6] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_0_CONST_REF_RD_uint2_t_uint2_t_20_18_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output := data_in_regs(18);

     -- FOR_rmii_eth_mac_h_l113_c30_8707_ITER_8_CONST_REF_RD_uint2_t_uint2_t_20_10_d41d[rmii_eth_mac_h_l113_c140_abe6] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_8_CONST_REF_RD_uint2_t_uint2_t_20_10_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output := data_in_regs(10);

     -- FOR_rmii_eth_mac_h_l113_c30_8707_ITER_16_CONST_REF_RD_uint2_t_uint2_t_20_2_d41d[rmii_eth_mac_h_l113_c140_abe6] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_16_CONST_REF_RD_uint2_t_uint2_t_20_2_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output := data_in_regs(2);

     -- FOR_rmii_eth_mac_h_l113_c30_8707_ITER_4_CONST_REF_RD_uint2_t_uint2_t_20_14_d41d[rmii_eth_mac_h_l113_c140_abe6] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_4_CONST_REF_RD_uint2_t_uint2_t_20_14_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output := data_in_regs(14);

     -- uint8_7_2[rmii_eth_mac_h_l73_c50_b05a] LATENCY=0
     VAR_uint8_7_2_rmii_eth_mac_h_l73_c50_b05a_return_output := uint8_7_2(
     data_out_reg);

     -- FOR_rmii_eth_mac_h_l114_c30_4652_ITER_0_CONST_REF_RD_uint1_t_uint1_t_20_18_d41d[rmii_eth_mac_h_l114_c146_ee20] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_0_CONST_REF_RD_uint1_t_uint1_t_20_18_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output := data_in_valid_regs(18);

     -- FOR_rmii_eth_mac_h_l114_c30_4652_ITER_8_CONST_REF_RD_uint1_t_uint1_t_20_10_d41d[rmii_eth_mac_h_l114_c146_ee20] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_8_CONST_REF_RD_uint1_t_uint1_t_20_10_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output := data_in_valid_regs(10);

     -- CONST_SR_2[rmii_eth_mac_h_l96_c44_c9bb] LATENCY=0
     -- Inputs
     CONST_SR_2_rmii_eth_mac_h_l96_c44_c9bb_x <= VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_c9bb_x;
     -- Outputs
     VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_c9bb_return_output := CONST_SR_2_rmii_eth_mac_h_l96_c44_c9bb_return_output;

     -- FOR_rmii_eth_mac_h_l114_c30_4652_ITER_16_CONST_REF_RD_uint1_t_uint1_t_20_2_d41d[rmii_eth_mac_h_l114_c146_ee20] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_16_CONST_REF_RD_uint1_t_uint1_t_20_2_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output := data_in_valid_regs(2);

     -- FOR_rmii_eth_mac_h_l113_c30_8707_ITER_18_CONST_REF_RD_uint2_t_uint2_t_20_0_d41d[rmii_eth_mac_h_l113_c140_abe6] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_18_CONST_REF_RD_uint2_t_uint2_t_20_0_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output := data_in_regs(0);

     -- FOR_rmii_eth_mac_h_l113_c30_8707_ITER_10_CONST_REF_RD_uint2_t_uint2_t_20_8_d41d[rmii_eth_mac_h_l113_c140_abe6] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_10_CONST_REF_RD_uint2_t_uint2_t_20_8_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output := data_in_regs(8);

     -- FOR_rmii_eth_mac_h_l114_c30_4652_ITER_4_CONST_REF_RD_uint1_t_uint1_t_20_14_d41d[rmii_eth_mac_h_l114_c146_ee20] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_4_CONST_REF_RD_uint1_t_uint1_t_20_14_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output := data_in_valid_regs(14);

     -- FOR_rmii_eth_mac_h_l114_c30_4652_ITER_3_CONST_REF_RD_uint1_t_uint1_t_20_15_d41d[rmii_eth_mac_h_l114_c146_ee20] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_3_CONST_REF_RD_uint1_t_uint1_t_20_15_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output := data_in_valid_regs(15);

     -- CONST_REF_RD_uint2_t_uint2_t_20_19_d41d[rmii_eth_mac_h_l34_c29_2ed8] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_2ed8_return_output := data_in_regs(19);

     -- CONST_REF_RD_uint1_t_uint1_t_20_19_d41d[rmii_eth_mac_h_l35_c35_f56e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_f56e_return_output := data_in_valid_regs(19);

     -- FOR_rmii_eth_mac_h_l113_c30_8707_ITER_12_CONST_REF_RD_uint2_t_uint2_t_20_6_d41d[rmii_eth_mac_h_l113_c140_abe6] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_12_CONST_REF_RD_uint2_t_uint2_t_20_6_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output := data_in_regs(6);

     -- FOR_rmii_eth_mac_h_l114_c30_4652_ITER_11_CONST_REF_RD_uint1_t_uint1_t_20_7_d41d[rmii_eth_mac_h_l114_c146_ee20] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_11_CONST_REF_RD_uint1_t_uint1_t_20_7_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output := data_in_valid_regs(7);

     -- BIN_OP_EQ[rmii_eth_mac_h_l93_c11_1431] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_left;
     BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_return_output := BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_return_output;

     -- FOR_rmii_eth_mac_h_l113_c30_8707_ITER_5_CONST_REF_RD_uint2_t_uint2_t_20_13_d41d[rmii_eth_mac_h_l113_c140_abe6] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_5_CONST_REF_RD_uint2_t_uint2_t_20_13_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output := data_in_regs(13);

     -- UNARY_OP_NOT[rmii_eth_mac_h_l82_c13_4123] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_4123_expr <= VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_4123_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_4123_return_output := UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_4123_return_output;

     -- FOR_rmii_eth_mac_h_l113_c30_8707_ITER_1_CONST_REF_RD_uint2_t_uint2_t_20_17_d41d[rmii_eth_mac_h_l113_c140_abe6] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_1_CONST_REF_RD_uint2_t_uint2_t_20_17_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output := data_in_regs(17);

     -- BIN_OP_EQ[rmii_eth_mac_h_l59_c11_295d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_left;
     BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_return_output := BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_return_output;

     -- FOR_rmii_eth_mac_h_l114_c30_4652_ITER_14_CONST_REF_RD_uint1_t_uint1_t_20_4_d41d[rmii_eth_mac_h_l114_c146_ee20] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_14_CONST_REF_RD_uint1_t_uint1_t_20_4_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output := data_in_valid_regs(4);

     -- FOR_rmii_eth_mac_h_l113_c30_8707_ITER_9_CONST_REF_RD_uint2_t_uint2_t_20_9_d41d[rmii_eth_mac_h_l113_c140_abe6] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_9_CONST_REF_RD_uint2_t_uint2_t_20_9_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output := data_in_regs(9);

     -- FOR_rmii_eth_mac_h_l113_c30_8707_ITER_15_CONST_REF_RD_uint2_t_uint2_t_20_3_d41d[rmii_eth_mac_h_l113_c140_abe6] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_15_CONST_REF_RD_uint2_t_uint2_t_20_3_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output := data_in_regs(3);

     -- FOR_rmii_eth_mac_h_l113_c30_8707_ITER_17_CONST_REF_RD_uint2_t_uint2_t_20_1_d41d[rmii_eth_mac_h_l113_c140_abe6] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_17_CONST_REF_RD_uint2_t_uint2_t_20_1_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output := data_in_regs(1);

     -- FOR_rmii_eth_mac_h_l113_c30_8707_ITER_3_CONST_REF_RD_uint2_t_uint2_t_20_15_d41d[rmii_eth_mac_h_l113_c140_abe6] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_3_CONST_REF_RD_uint2_t_uint2_t_20_15_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output := data_in_regs(15);

     -- FOR_rmii_eth_mac_h_l114_c30_4652_ITER_13_CONST_REF_RD_uint1_t_uint1_t_20_5_d41d[rmii_eth_mac_h_l114_c146_ee20] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_13_CONST_REF_RD_uint1_t_uint1_t_20_5_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output := data_in_valid_regs(5);

     -- BIN_OP_EQ[rmii_eth_mac_h_l99_c10_89b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1_left;
     BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1_return_output := BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1_return_output;

     -- FOR_rmii_eth_mac_h_l114_c30_4652_ITER_17_CONST_REF_RD_uint1_t_uint1_t_20_1_d41d[rmii_eth_mac_h_l114_c146_ee20] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_17_CONST_REF_RD_uint1_t_uint1_t_20_1_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output := data_in_valid_regs(1);

     -- FOR_rmii_eth_mac_h_l114_c30_4652_ITER_12_CONST_REF_RD_uint1_t_uint1_t_20_6_d41d[rmii_eth_mac_h_l114_c146_ee20] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_12_CONST_REF_RD_uint1_t_uint1_t_20_6_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output := data_in_valid_regs(6);

     -- FOR_rmii_eth_mac_h_l114_c30_4652_ITER_9_CONST_REF_RD_uint1_t_uint1_t_20_9_d41d[rmii_eth_mac_h_l114_c146_ee20] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_9_CONST_REF_RD_uint1_t_uint1_t_20_9_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output := data_in_valid_regs(9);

     -- Submodule level 1
     VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l75_c7_81cd_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l75_c7_81cd_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l98_c5_b939_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_9364_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l48_c3_3300_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l48_c3_3300_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l48_c3_3300_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_3300_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_ecb1_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l59_c8_625a_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l59_c8_625a_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l59_c8_625a_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l59_c8_625a_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_295d_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l71_c8_3480_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l71_c8_3480_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l71_c8_3480_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_be8d_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l93_c8_01d9_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_1431_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l99_c7_ca27_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_89b1_return_output;
     VAR_byte_counter_rmii_eth_mac_h_l103_c9_9d2f := resize(VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_4515_return_output, 2);
     VAR_bit_counter_rmii_eth_mac_h_l108_c7_97ab := resize(VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_5a10_return_output, 3);
     VAR_bit_counter_rmii_eth_mac_h_l89_c9_698a := resize(VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_1093_return_output, 3);
     VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_left := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_f56e_return_output;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908_left := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_f56e_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_cond := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_f56e_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_cond := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_f56e_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l72_c5_578f_cond := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_f56e_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l72_c5_578f_cond := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_f56e_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l72_c5_578f_cond := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_f56e_return_output;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_0781_left := VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_2ed8_return_output;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_9375_left := VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_2ed8_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_cond := VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_4123_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l82_c9_1581_cond := VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_4123_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l82_c9_1581_cond := VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_4123_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iffalse := VAR_bit_counter_rmii_eth_mac_h_l108_c7_97ab;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_iffalse := VAR_bit_counter_rmii_eth_mac_h_l89_c9_698a;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_iffalse := VAR_byte_counter_rmii_eth_mac_h_l103_c9_9d2f;
     -- last_MUX[rmii_eth_mac_h_l82_c9_1581] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l82_c9_1581_cond <= VAR_last_MUX_rmii_eth_mac_h_l82_c9_1581_cond;
     last_MUX_rmii_eth_mac_h_l82_c9_1581_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l82_c9_1581_iftrue;
     last_MUX_rmii_eth_mac_h_l82_c9_1581_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l82_c9_1581_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l82_c9_1581_return_output := last_MUX_rmii_eth_mac_h_l82_c9_1581_return_output;

     -- data_in_valid_regs_CONST_REF_RD_uint1_t_20_uint1_t_20_a609[rmii_eth_mac_h_l17_c15_9549] LATENCY=0
     VAR_data_in_valid_regs_CONST_REF_RD_uint1_t_20_uint1_t_20_a609_rmii_eth_mac_h_l17_c15_9549_return_output := CONST_REF_RD_uint1_t_20_uint1_t_20_a609(
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_0_CONST_REF_RD_uint1_t_uint1_t_20_18_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_1_CONST_REF_RD_uint1_t_uint1_t_20_17_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_2_CONST_REF_RD_uint1_t_uint1_t_20_16_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_3_CONST_REF_RD_uint1_t_uint1_t_20_15_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_4_CONST_REF_RD_uint1_t_uint1_t_20_14_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_5_CONST_REF_RD_uint1_t_uint1_t_20_13_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_6_CONST_REF_RD_uint1_t_uint1_t_20_12_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_7_CONST_REF_RD_uint1_t_uint1_t_20_11_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_8_CONST_REF_RD_uint1_t_uint1_t_20_10_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_9_CONST_REF_RD_uint1_t_uint1_t_20_9_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_10_CONST_REF_RD_uint1_t_uint1_t_20_8_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_11_CONST_REF_RD_uint1_t_uint1_t_20_7_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_12_CONST_REF_RD_uint1_t_uint1_t_20_6_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_13_CONST_REF_RD_uint1_t_uint1_t_20_5_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_14_CONST_REF_RD_uint1_t_uint1_t_20_4_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_15_CONST_REF_RD_uint1_t_uint1_t_20_3_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_16_CONST_REF_RD_uint1_t_uint1_t_20_2_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_17_CONST_REF_RD_uint1_t_uint1_t_20_1_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_4652_ITER_18_CONST_REF_RD_uint1_t_uint1_t_20_0_d41d_rmii_eth_mac_h_l114_c146_ee20_return_output,
     VAR_data_in_valid);

     -- bit_counter_MUX[rmii_eth_mac_h_l98_c5_b939] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_cond;
     bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_return_output := bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_return_output;

     -- byte_counter_MUX[rmii_eth_mac_h_l99_c7_ca27] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_cond;
     byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_return_output := byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_return_output;

     -- data_out_reg_MUX[rmii_eth_mac_h_l93_c8_01d9] LATENCY=0
     -- Inputs
     data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_cond <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_cond;
     data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue;
     data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse;
     -- Outputs
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output := data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output;

     -- valid_MUX[rmii_eth_mac_h_l72_c5_578f] LATENCY=0
     -- Inputs
     valid_MUX_rmii_eth_mac_h_l72_c5_578f_cond <= VAR_valid_MUX_rmii_eth_mac_h_l72_c5_578f_cond;
     valid_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue <= VAR_valid_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue;
     valid_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse <= VAR_valid_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse;
     -- Outputs
     VAR_valid_MUX_rmii_eth_mac_h_l72_c5_578f_return_output := valid_MUX_rmii_eth_mac_h_l72_c5_578f_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l45_c48_9375] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l45_c48_9375_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_9375_left;
     BIN_OP_EQ_rmii_eth_mac_h_l45_c48_9375_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_9375_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_9375_return_output := BIN_OP_EQ_rmii_eth_mac_h_l45_c48_9375_return_output;

     -- uint2_uint30[rmii_eth_mac_h_l96_c15_5f91] LATENCY=0
     VAR_uint2_uint30_rmii_eth_mac_h_l96_c15_5f91_return_output := uint2_uint30(
     VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_2ed8_return_output,
     resize(VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_c9bb_return_output, 30));

     -- uint2_uint6[rmii_eth_mac_h_l73_c22_325f] LATENCY=0
     VAR_uint2_uint6_rmii_eth_mac_h_l73_c22_325f_return_output := uint2_uint6(
     VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_2ed8_return_output,
     VAR_uint8_7_2_rmii_eth_mac_h_l73_c50_b05a_return_output);

     -- BIN_OP_EQ[rmii_eth_mac_h_l44_c53_0781] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l44_c53_0781_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_0781_left;
     BIN_OP_EQ_rmii_eth_mac_h_l44_c53_0781_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_0781_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_0781_return_output := BIN_OP_EQ_rmii_eth_mac_h_l44_c53_0781_return_output;

     -- state_MUX[rmii_eth_mac_h_l82_c9_1581] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l82_c9_1581_cond <= VAR_state_MUX_rmii_eth_mac_h_l82_c9_1581_cond;
     state_MUX_rmii_eth_mac_h_l82_c9_1581_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l82_c9_1581_iftrue;
     state_MUX_rmii_eth_mac_h_l82_c9_1581_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l82_c9_1581_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l82_c9_1581_return_output := state_MUX_rmii_eth_mac_h_l82_c9_1581_return_output;

     -- state_MUX[rmii_eth_mac_h_l99_c7_ca27] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l99_c7_ca27_cond <= VAR_state_MUX_rmii_eth_mac_h_l99_c7_ca27_cond;
     state_MUX_rmii_eth_mac_h_l99_c7_ca27_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l99_c7_ca27_iftrue;
     state_MUX_rmii_eth_mac_h_l99_c7_ca27_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l99_c7_ca27_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l99_c7_ca27_return_output := state_MUX_rmii_eth_mac_h_l99_c7_ca27_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l82_c9_1581] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_cond;
     bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_return_output := bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_return_output;

     -- data_in_regs_CONST_REF_RD_uint2_t_20_uint2_t_20_a609[rmii_eth_mac_h_l17_c15_9549] LATENCY=0
     VAR_data_in_regs_CONST_REF_RD_uint2_t_20_uint2_t_20_a609_rmii_eth_mac_h_l17_c15_9549_return_output := CONST_REF_RD_uint2_t_20_uint2_t_20_a609(
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_0_CONST_REF_RD_uint2_t_uint2_t_20_18_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_1_CONST_REF_RD_uint2_t_uint2_t_20_17_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_2_CONST_REF_RD_uint2_t_uint2_t_20_16_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_3_CONST_REF_RD_uint2_t_uint2_t_20_15_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_4_CONST_REF_RD_uint2_t_uint2_t_20_14_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_5_CONST_REF_RD_uint2_t_uint2_t_20_13_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_6_CONST_REF_RD_uint2_t_uint2_t_20_12_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_7_CONST_REF_RD_uint2_t_uint2_t_20_11_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_8_CONST_REF_RD_uint2_t_uint2_t_20_10_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_9_CONST_REF_RD_uint2_t_uint2_t_20_9_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_10_CONST_REF_RD_uint2_t_uint2_t_20_8_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_11_CONST_REF_RD_uint2_t_uint2_t_20_7_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_12_CONST_REF_RD_uint2_t_uint2_t_20_6_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_13_CONST_REF_RD_uint2_t_uint2_t_20_5_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_14_CONST_REF_RD_uint2_t_uint2_t_20_4_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_15_CONST_REF_RD_uint2_t_uint2_t_20_3_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_16_CONST_REF_RD_uint2_t_uint2_t_20_2_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_17_CONST_REF_RD_uint2_t_uint2_t_20_1_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_8707_ITER_18_CONST_REF_RD_uint2_t_uint2_t_20_0_d41d_rmii_eth_mac_h_l113_c140_abe6_return_output,
     VAR_data_in);

     -- Submodule level 2
     VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_right := VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_0781_return_output;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908_right := VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_9375_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_1581_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_b939_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iftrue := VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_ca27_return_output;
     REG_VAR_data_in_regs := VAR_data_in_regs_CONST_REF_RD_uint2_t_20_uint2_t_20_a609_rmii_eth_mac_h_l17_c15_9549_return_output;
     REG_VAR_data_in_valid_regs := VAR_data_in_valid_regs_CONST_REF_RD_uint1_t_20_uint1_t_20_a609_rmii_eth_mac_h_l17_c15_9549_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse := VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l75_c7_81cd_iftrue := VAR_last_MUX_rmii_eth_mac_h_l82_c9_1581_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l75_c7_81cd_iftrue := VAR_state_MUX_rmii_eth_mac_h_l82_c9_1581_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l98_c5_b939_iftrue := VAR_state_MUX_rmii_eth_mac_h_l99_c7_ca27_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue := VAR_uint2_uint30_rmii_eth_mac_h_l96_c15_5f91_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue := VAR_uint2_uint6_rmii_eth_mac_h_l73_c22_325f_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue := VAR_valid_MUX_rmii_eth_mac_h_l72_c5_578f_return_output;
     -- BIN_OP_AND[rmii_eth_mac_h_l44_c28_c953] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_left;
     BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_return_output := BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l93_c8_01d9] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_cond;
     bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output := bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output;

     -- valid_MUX[rmii_eth_mac_h_l71_c8_3480] LATENCY=0
     -- Inputs
     valid_MUX_rmii_eth_mac_h_l71_c8_3480_cond <= VAR_valid_MUX_rmii_eth_mac_h_l71_c8_3480_cond;
     valid_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue <= VAR_valid_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue;
     valid_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse <= VAR_valid_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse;
     -- Outputs
     VAR_valid_MUX_rmii_eth_mac_h_l71_c8_3480_return_output := valid_MUX_rmii_eth_mac_h_l71_c8_3480_return_output;

     -- data_out_reg_MUX[rmii_eth_mac_h_l72_c5_578f] LATENCY=0
     -- Inputs
     data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_cond <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_cond;
     data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue;
     data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse;
     -- Outputs
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_return_output := data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_return_output;

     -- state_MUX[rmii_eth_mac_h_l75_c7_81cd] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l75_c7_81cd_cond <= VAR_state_MUX_rmii_eth_mac_h_l75_c7_81cd_cond;
     state_MUX_rmii_eth_mac_h_l75_c7_81cd_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l75_c7_81cd_iftrue;
     state_MUX_rmii_eth_mac_h_l75_c7_81cd_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l75_c7_81cd_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l75_c7_81cd_return_output := state_MUX_rmii_eth_mac_h_l75_c7_81cd_return_output;

     -- state_MUX[rmii_eth_mac_h_l98_c5_b939] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l98_c5_b939_cond <= VAR_state_MUX_rmii_eth_mac_h_l98_c5_b939_cond;
     state_MUX_rmii_eth_mac_h_l98_c5_b939_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l98_c5_b939_iftrue;
     state_MUX_rmii_eth_mac_h_l98_c5_b939_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l98_c5_b939_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l98_c5_b939_return_output := state_MUX_rmii_eth_mac_h_l98_c5_b939_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l75_c7_81cd] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_cond;
     bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_return_output := bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_return_output;

     -- last_MUX[rmii_eth_mac_h_l75_c7_81cd] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l75_c7_81cd_cond <= VAR_last_MUX_rmii_eth_mac_h_l75_c7_81cd_cond;
     last_MUX_rmii_eth_mac_h_l75_c7_81cd_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l75_c7_81cd_iftrue;
     last_MUX_rmii_eth_mac_h_l75_c7_81cd_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l75_c7_81cd_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l75_c7_81cd_return_output := last_MUX_rmii_eth_mac_h_l75_c7_81cd_return_output;

     -- fcs_reg_MUX[rmii_eth_mac_h_l93_c8_01d9] LATENCY=0
     -- Inputs
     fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_cond <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_cond;
     fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue;
     fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse;
     -- Outputs
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output := fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output;

     -- byte_counter_MUX[rmii_eth_mac_h_l98_c5_b939] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_cond;
     byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_return_output := byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_return_output;

     -- BIN_OP_AND[rmii_eth_mac_h_l45_c23_d908] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908_left;
     BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908_return_output := BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908_return_output;

     -- Submodule level 3
     VAR_err_MUX_rmii_eth_mac_h_l54_c5_d6c9_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l60_c5_7fb4_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l54_c5_d6c9_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l60_c5_7fb4_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_c953_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l63_c10_e506_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l63_c10_e506_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_d908_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_81cd_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue := VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_b939_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue := VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_578f_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse := VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue := VAR_last_MUX_rmii_eth_mac_h_l75_c7_81cd_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue := VAR_state_MUX_rmii_eth_mac_h_l75_c7_81cd_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue := VAR_state_MUX_rmii_eth_mac_h_l98_c5_b939_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse := VAR_valid_MUX_rmii_eth_mac_h_l71_c8_3480_return_output;
     -- err_MUX[rmii_eth_mac_h_l54_c5_d6c9] LATENCY=0
     -- Inputs
     err_MUX_rmii_eth_mac_h_l54_c5_d6c9_cond <= VAR_err_MUX_rmii_eth_mac_h_l54_c5_d6c9_cond;
     err_MUX_rmii_eth_mac_h_l54_c5_d6c9_iftrue <= VAR_err_MUX_rmii_eth_mac_h_l54_c5_d6c9_iftrue;
     err_MUX_rmii_eth_mac_h_l54_c5_d6c9_iffalse <= VAR_err_MUX_rmii_eth_mac_h_l54_c5_d6c9_iffalse;
     -- Outputs
     VAR_err_MUX_rmii_eth_mac_h_l54_c5_d6c9_return_output := err_MUX_rmii_eth_mac_h_l54_c5_d6c9_return_output;

     -- state_MUX[rmii_eth_mac_h_l54_c5_d6c9] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l54_c5_d6c9_cond <= VAR_state_MUX_rmii_eth_mac_h_l54_c5_d6c9_cond;
     state_MUX_rmii_eth_mac_h_l54_c5_d6c9_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l54_c5_d6c9_iftrue;
     state_MUX_rmii_eth_mac_h_l54_c5_d6c9_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l54_c5_d6c9_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l54_c5_d6c9_return_output := state_MUX_rmii_eth_mac_h_l54_c5_d6c9_return_output;

     -- state_MUX[rmii_eth_mac_h_l72_c5_578f] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l72_c5_578f_cond <= VAR_state_MUX_rmii_eth_mac_h_l72_c5_578f_cond;
     state_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue;
     state_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l72_c5_578f_return_output := state_MUX_rmii_eth_mac_h_l72_c5_578f_return_output;

     -- err_MUX[rmii_eth_mac_h_l63_c10_e506] LATENCY=0
     -- Inputs
     err_MUX_rmii_eth_mac_h_l63_c10_e506_cond <= VAR_err_MUX_rmii_eth_mac_h_l63_c10_e506_cond;
     err_MUX_rmii_eth_mac_h_l63_c10_e506_iftrue <= VAR_err_MUX_rmii_eth_mac_h_l63_c10_e506_iftrue;
     err_MUX_rmii_eth_mac_h_l63_c10_e506_iffalse <= VAR_err_MUX_rmii_eth_mac_h_l63_c10_e506_iffalse;
     -- Outputs
     VAR_err_MUX_rmii_eth_mac_h_l63_c10_e506_return_output := err_MUX_rmii_eth_mac_h_l63_c10_e506_return_output;

     -- data_out_reg_MUX[rmii_eth_mac_h_l71_c8_3480] LATENCY=0
     -- Inputs
     data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_cond <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_cond;
     data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue;
     data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse;
     -- Outputs
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_return_output := data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_return_output;

     -- last_MUX[rmii_eth_mac_h_l72_c5_578f] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l72_c5_578f_cond <= VAR_last_MUX_rmii_eth_mac_h_l72_c5_578f_cond;
     last_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue;
     last_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l72_c5_578f_return_output := last_MUX_rmii_eth_mac_h_l72_c5_578f_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l72_c5_578f] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_cond;
     bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_return_output := bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_return_output;

     -- state_MUX[rmii_eth_mac_h_l63_c10_e506] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l63_c10_e506_cond <= VAR_state_MUX_rmii_eth_mac_h_l63_c10_e506_cond;
     state_MUX_rmii_eth_mac_h_l63_c10_e506_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l63_c10_e506_iftrue;
     state_MUX_rmii_eth_mac_h_l63_c10_e506_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l63_c10_e506_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l63_c10_e506_return_output := state_MUX_rmii_eth_mac_h_l63_c10_e506_return_output;

     -- valid_MUX[rmii_eth_mac_h_l59_c8_625a] LATENCY=0
     -- Inputs
     valid_MUX_rmii_eth_mac_h_l59_c8_625a_cond <= VAR_valid_MUX_rmii_eth_mac_h_l59_c8_625a_cond;
     valid_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue <= VAR_valid_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue;
     valid_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse <= VAR_valid_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse;
     -- Outputs
     VAR_valid_MUX_rmii_eth_mac_h_l59_c8_625a_return_output := valid_MUX_rmii_eth_mac_h_l59_c8_625a_return_output;

     -- fcs_reg_MUX[rmii_eth_mac_h_l71_c8_3480] LATENCY=0
     -- Inputs
     fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_cond <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_cond;
     fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue;
     fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse;
     -- Outputs
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_return_output := fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_return_output;

     -- byte_counter_MUX[rmii_eth_mac_h_l93_c8_01d9] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_cond;
     byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output := byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output;

     -- state_MUX[rmii_eth_mac_h_l93_c8_01d9] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l93_c8_01d9_cond <= VAR_state_MUX_rmii_eth_mac_h_l93_c8_01d9_cond;
     state_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l93_c8_01d9_iftrue;
     state_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l93_c8_01d9_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output := state_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output;

     -- Submodule level 4
     VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_578f_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse := VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse := VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_3480_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue := VAR_err_MUX_rmii_eth_mac_h_l54_c5_d6c9_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l60_c5_7fb4_iffalse := VAR_err_MUX_rmii_eth_mac_h_l63_c10_e506_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse := VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_3480_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue := VAR_last_MUX_rmii_eth_mac_h_l72_c5_578f_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue := VAR_state_MUX_rmii_eth_mac_h_l54_c5_d6c9_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l60_c5_7fb4_iffalse := VAR_state_MUX_rmii_eth_mac_h_l63_c10_e506_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue := VAR_state_MUX_rmii_eth_mac_h_l72_c5_578f_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse := VAR_state_MUX_rmii_eth_mac_h_l93_c8_01d9_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse := VAR_valid_MUX_rmii_eth_mac_h_l59_c8_625a_return_output;
     -- err_MUX[rmii_eth_mac_h_l60_c5_7fb4] LATENCY=0
     -- Inputs
     err_MUX_rmii_eth_mac_h_l60_c5_7fb4_cond <= VAR_err_MUX_rmii_eth_mac_h_l60_c5_7fb4_cond;
     err_MUX_rmii_eth_mac_h_l60_c5_7fb4_iftrue <= VAR_err_MUX_rmii_eth_mac_h_l60_c5_7fb4_iftrue;
     err_MUX_rmii_eth_mac_h_l60_c5_7fb4_iffalse <= VAR_err_MUX_rmii_eth_mac_h_l60_c5_7fb4_iffalse;
     -- Outputs
     VAR_err_MUX_rmii_eth_mac_h_l60_c5_7fb4_return_output := err_MUX_rmii_eth_mac_h_l60_c5_7fb4_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l71_c8_3480] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_cond;
     bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_return_output := bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_return_output;

     -- byte_counter_MUX[rmii_eth_mac_h_l71_c8_3480] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_cond;
     byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_return_output := byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_return_output;

     -- state_MUX[rmii_eth_mac_h_l71_c8_3480] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l71_c8_3480_cond <= VAR_state_MUX_rmii_eth_mac_h_l71_c8_3480_cond;
     state_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue;
     state_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l71_c8_3480_return_output := state_MUX_rmii_eth_mac_h_l71_c8_3480_return_output;

     -- last_MUX[rmii_eth_mac_h_l71_c8_3480] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l71_c8_3480_cond <= VAR_last_MUX_rmii_eth_mac_h_l71_c8_3480_cond;
     last_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l71_c8_3480_iftrue;
     last_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l71_c8_3480_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l71_c8_3480_return_output := last_MUX_rmii_eth_mac_h_l71_c8_3480_return_output;

     -- valid_MUX[rmii_eth_mac_h_l48_c3_3300] LATENCY=0
     -- Inputs
     valid_MUX_rmii_eth_mac_h_l48_c3_3300_cond <= VAR_valid_MUX_rmii_eth_mac_h_l48_c3_3300_cond;
     valid_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue <= VAR_valid_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue;
     valid_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse <= VAR_valid_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse;
     -- Outputs
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_3300_return_output := valid_MUX_rmii_eth_mac_h_l48_c3_3300_return_output;

     -- state_MUX[rmii_eth_mac_h_l60_c5_7fb4] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l60_c5_7fb4_cond <= VAR_state_MUX_rmii_eth_mac_h_l60_c5_7fb4_cond;
     state_MUX_rmii_eth_mac_h_l60_c5_7fb4_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l60_c5_7fb4_iftrue;
     state_MUX_rmii_eth_mac_h_l60_c5_7fb4_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l60_c5_7fb4_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l60_c5_7fb4_return_output := state_MUX_rmii_eth_mac_h_l60_c5_7fb4_return_output;

     -- data_out_reg_MUX[rmii_eth_mac_h_l59_c8_625a] LATENCY=0
     -- Inputs
     data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_cond <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_cond;
     data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue;
     data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse;
     -- Outputs
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_return_output := data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_return_output;

     -- fcs_reg_MUX[rmii_eth_mac_h_l59_c8_625a] LATENCY=0
     -- Inputs
     fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_cond <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_cond;
     fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue;
     fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse;
     -- Outputs
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_return_output := fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_return_output;

     -- Submodule level 5
     VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_3480_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse := VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_3480_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse := VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_625a_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue := VAR_err_MUX_rmii_eth_mac_h_l60_c5_7fb4_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse := VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_625a_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse := VAR_last_MUX_rmii_eth_mac_h_l71_c8_3480_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue := VAR_state_MUX_rmii_eth_mac_h_l60_c5_7fb4_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse := VAR_state_MUX_rmii_eth_mac_h_l71_c8_3480_return_output;
     -- byte_counter_MUX[rmii_eth_mac_h_l59_c8_625a] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_cond;
     byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_return_output := byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_return_output;

     -- err_MUX[rmii_eth_mac_h_l59_c8_625a] LATENCY=0
     -- Inputs
     err_MUX_rmii_eth_mac_h_l59_c8_625a_cond <= VAR_err_MUX_rmii_eth_mac_h_l59_c8_625a_cond;
     err_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue <= VAR_err_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue;
     err_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse <= VAR_err_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse;
     -- Outputs
     VAR_err_MUX_rmii_eth_mac_h_l59_c8_625a_return_output := err_MUX_rmii_eth_mac_h_l59_c8_625a_return_output;

     -- fcs_reg_MUX[rmii_eth_mac_h_l48_c3_3300] LATENCY=0
     -- Inputs
     fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_cond <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_cond;
     fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue;
     fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse;
     -- Outputs
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_return_output := fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_return_output;

     -- state_MUX[rmii_eth_mac_h_l59_c8_625a] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l59_c8_625a_cond <= VAR_state_MUX_rmii_eth_mac_h_l59_c8_625a_cond;
     state_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue;
     state_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l59_c8_625a_return_output := state_MUX_rmii_eth_mac_h_l59_c8_625a_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l59_c8_625a] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_cond;
     bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_return_output := bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_return_output;

     -- data_out_reg_MUX[rmii_eth_mac_h_l48_c3_3300] LATENCY=0
     -- Inputs
     data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_cond <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_cond;
     data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue;
     data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse;
     -- Outputs
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_return_output := data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_return_output;

     -- last_MUX[rmii_eth_mac_h_l59_c8_625a] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l59_c8_625a_cond <= VAR_last_MUX_rmii_eth_mac_h_l59_c8_625a_cond;
     last_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l59_c8_625a_iftrue;
     last_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l59_c8_625a_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l59_c8_625a_return_output := last_MUX_rmii_eth_mac_h_l59_c8_625a_return_output;

     -- Submodule level 6
     VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_625a_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse := VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_625a_return_output;
     REG_VAR_data_out_reg := VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse := VAR_err_MUX_rmii_eth_mac_h_l59_c8_625a_return_output;
     REG_VAR_fcs_reg := VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_3300_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse := VAR_last_MUX_rmii_eth_mac_h_l59_c8_625a_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse := VAR_state_MUX_rmii_eth_mac_h_l59_c8_625a_return_output;
     -- last_MUX[rmii_eth_mac_h_l48_c3_3300] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l48_c3_3300_cond <= VAR_last_MUX_rmii_eth_mac_h_l48_c3_3300_cond;
     last_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue;
     last_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l48_c3_3300_return_output := last_MUX_rmii_eth_mac_h_l48_c3_3300_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l48_c3_3300] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_cond;
     bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_return_output := bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_return_output;

     -- byte_counter_MUX[rmii_eth_mac_h_l48_c3_3300] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_cond;
     byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_return_output := byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_return_output;

     -- state_MUX[rmii_eth_mac_h_l48_c3_3300] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l48_c3_3300_cond <= VAR_state_MUX_rmii_eth_mac_h_l48_c3_3300_cond;
     state_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue;
     state_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l48_c3_3300_return_output := state_MUX_rmii_eth_mac_h_l48_c3_3300_return_output;

     -- err_MUX[rmii_eth_mac_h_l48_c3_3300] LATENCY=0
     -- Inputs
     err_MUX_rmii_eth_mac_h_l48_c3_3300_cond <= VAR_err_MUX_rmii_eth_mac_h_l48_c3_3300_cond;
     err_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue <= VAR_err_MUX_rmii_eth_mac_h_l48_c3_3300_iftrue;
     err_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse <= VAR_err_MUX_rmii_eth_mac_h_l48_c3_3300_iffalse;
     -- Outputs
     VAR_err_MUX_rmii_eth_mac_h_l48_c3_3300_return_output := err_MUX_rmii_eth_mac_h_l48_c3_3300_return_output;

     -- Submodule level 7
     REG_VAR_bit_counter := VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_3300_return_output;
     REG_VAR_byte_counter := VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_3300_return_output;
     REG_VAR_state := VAR_state_MUX_rmii_eth_mac_h_l48_c3_3300_return_output;
     -- CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4[rmii_eth_mac_h_l123_c10_70c5] LATENCY=0
     VAR_CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4_rmii_eth_mac_h_l123_c10_70c5_return_output := CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4(
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_3300_return_output,
     VAR_last_MUX_rmii_eth_mac_h_l48_c3_3300_return_output,
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_3300_return_output,
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_3300_return_output,
     VAR_err_MUX_rmii_eth_mac_h_l48_c3_3300_return_output);

     -- Submodule level 8
     VAR_return_output := VAR_CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4_rmii_eth_mac_h_l123_c10_70c5_return_output;
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
