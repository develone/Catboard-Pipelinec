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
-- BIN_OP_EQ[rmii_eth_mac_h_l43_c22_65f5]
signal BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_left : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l44_c53_5a3d]
signal BIN_OP_EQ_rmii_eth_mac_h_l44_c53_5a3d_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l44_c53_5a3d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l44_c53_5a3d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l44_c28_5bd6]
signal BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_left : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_right : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l45_c48_8494]
signal BIN_OP_EQ_rmii_eth_mac_h_l45_c48_8494_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l45_c48_8494_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l45_c48_8494_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[rmii_eth_mac_h_l45_c23_91ff]
signal BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff_left : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff_right : unsigned(0 downto 0);
signal BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l48_c6_af7f]
signal BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_return_output : unsigned(0 downto 0);

-- err_MUX[rmii_eth_mac_h_l48_c3_8539]
signal err_MUX_rmii_eth_mac_h_l48_c3_8539_cond : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l48_c3_8539_return_output : unsigned(0 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l48_c3_8539]
signal byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_return_output : unsigned(1 downto 0);

-- valid_MUX[rmii_eth_mac_h_l48_c3_8539]
signal valid_MUX_rmii_eth_mac_h_l48_c3_8539_cond : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l48_c3_8539_return_output : unsigned(0 downto 0);

-- last_MUX[rmii_eth_mac_h_l48_c3_8539]
signal last_MUX_rmii_eth_mac_h_l48_c3_8539_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l48_c3_8539_return_output : unsigned(0 downto 0);

-- fcs_reg_MUX[rmii_eth_mac_h_l48_c3_8539]
signal fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_cond : unsigned(0 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_return_output : unsigned(31 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l48_c3_8539]
signal bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_return_output : unsigned(2 downto 0);

-- state_MUX[rmii_eth_mac_h_l48_c3_8539]
signal state_MUX_rmii_eth_mac_h_l48_c3_8539_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l48_c3_8539_return_output : unsigned(1 downto 0);

-- data_out_reg_MUX[rmii_eth_mac_h_l48_c3_8539]
signal data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_cond : unsigned(0 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_return_output : unsigned(7 downto 0);

-- err_MUX[rmii_eth_mac_h_l54_c5_465c]
signal err_MUX_rmii_eth_mac_h_l54_c5_465c_cond : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l54_c5_465c_iftrue : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l54_c5_465c_iffalse : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l54_c5_465c_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l54_c5_465c]
signal state_MUX_rmii_eth_mac_h_l54_c5_465c_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l54_c5_465c_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l54_c5_465c_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l54_c5_465c_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l59_c11_3c2b]
signal BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_return_output : unsigned(0 downto 0);

-- err_MUX[rmii_eth_mac_h_l59_c8_be03]
signal err_MUX_rmii_eth_mac_h_l59_c8_be03_cond : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l59_c8_be03_return_output : unsigned(0 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l59_c8_be03]
signal byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_return_output : unsigned(1 downto 0);

-- valid_MUX[rmii_eth_mac_h_l59_c8_be03]
signal valid_MUX_rmii_eth_mac_h_l59_c8_be03_cond : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l59_c8_be03_return_output : unsigned(0 downto 0);

-- last_MUX[rmii_eth_mac_h_l59_c8_be03]
signal last_MUX_rmii_eth_mac_h_l59_c8_be03_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l59_c8_be03_return_output : unsigned(0 downto 0);

-- fcs_reg_MUX[rmii_eth_mac_h_l59_c8_be03]
signal fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_cond : unsigned(0 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_return_output : unsigned(31 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l59_c8_be03]
signal bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_return_output : unsigned(2 downto 0);

-- state_MUX[rmii_eth_mac_h_l59_c8_be03]
signal state_MUX_rmii_eth_mac_h_l59_c8_be03_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l59_c8_be03_return_output : unsigned(1 downto 0);

-- data_out_reg_MUX[rmii_eth_mac_h_l59_c8_be03]
signal data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_cond : unsigned(0 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_return_output : unsigned(7 downto 0);

-- err_MUX[rmii_eth_mac_h_l60_c5_b797]
signal err_MUX_rmii_eth_mac_h_l60_c5_b797_cond : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l60_c5_b797_iftrue : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l60_c5_b797_iffalse : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l60_c5_b797_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l60_c5_b797]
signal state_MUX_rmii_eth_mac_h_l60_c5_b797_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l60_c5_b797_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l60_c5_b797_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l60_c5_b797_return_output : unsigned(1 downto 0);

-- err_MUX[rmii_eth_mac_h_l63_c10_929c]
signal err_MUX_rmii_eth_mac_h_l63_c10_929c_cond : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l63_c10_929c_iftrue : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l63_c10_929c_iffalse : unsigned(0 downto 0);
signal err_MUX_rmii_eth_mac_h_l63_c10_929c_return_output : unsigned(0 downto 0);

-- state_MUX[rmii_eth_mac_h_l63_c10_929c]
signal state_MUX_rmii_eth_mac_h_l63_c10_929c_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l63_c10_929c_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l63_c10_929c_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l63_c10_929c_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l71_c11_47da]
signal BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_return_output : unsigned(0 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l71_c8_03a4]
signal byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output : unsigned(1 downto 0);

-- valid_MUX[rmii_eth_mac_h_l71_c8_03a4]
signal valid_MUX_rmii_eth_mac_h_l71_c8_03a4_cond : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output : unsigned(0 downto 0);

-- last_MUX[rmii_eth_mac_h_l71_c8_03a4]
signal last_MUX_rmii_eth_mac_h_l71_c8_03a4_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output : unsigned(0 downto 0);

-- fcs_reg_MUX[rmii_eth_mac_h_l71_c8_03a4]
signal fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_cond : unsigned(0 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output : unsigned(31 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l71_c8_03a4]
signal bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output : unsigned(2 downto 0);

-- state_MUX[rmii_eth_mac_h_l71_c8_03a4]
signal state_MUX_rmii_eth_mac_h_l71_c8_03a4_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output : unsigned(1 downto 0);

-- data_out_reg_MUX[rmii_eth_mac_h_l71_c8_03a4]
signal data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_cond : unsigned(0 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output : unsigned(7 downto 0);

-- valid_MUX[rmii_eth_mac_h_l72_c5_5d9d]
signal valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse : unsigned(0 downto 0);
signal valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output : unsigned(0 downto 0);

-- last_MUX[rmii_eth_mac_h_l72_c5_5d9d]
signal last_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l72_c5_5d9d]
signal bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output : unsigned(2 downto 0);

-- state_MUX[rmii_eth_mac_h_l72_c5_5d9d]
signal state_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output : unsigned(1 downto 0);

-- data_out_reg_MUX[rmii_eth_mac_h_l72_c5_5d9d]
signal data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond : unsigned(0 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output : unsigned(7 downto 0);

-- last_MUX[rmii_eth_mac_h_l75_c7_fe0e]
signal last_MUX_rmii_eth_mac_h_l75_c7_fe0e_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l75_c7_fe0e_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l75_c7_fe0e_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l75_c7_fe0e_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l75_c7_fe0e]
signal bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_return_output : unsigned(2 downto 0);

-- state_MUX[rmii_eth_mac_h_l75_c7_fe0e]
signal state_MUX_rmii_eth_mac_h_l75_c7_fe0e_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l75_c7_fe0e_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l75_c7_fe0e_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l75_c7_fe0e_return_output : unsigned(1 downto 0);

-- UNARY_OP_NOT[rmii_eth_mac_h_l82_c13_c799]
signal UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_c799_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_c799_return_output : unsigned(0 downto 0);

-- last_MUX[rmii_eth_mac_h_l82_c9_b835]
signal last_MUX_rmii_eth_mac_h_l82_c9_b835_cond : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l82_c9_b835_iftrue : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l82_c9_b835_iffalse : unsigned(0 downto 0);
signal last_MUX_rmii_eth_mac_h_l82_c9_b835_return_output : unsigned(0 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l82_c9_b835]
signal bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_return_output : unsigned(2 downto 0);

-- state_MUX[rmii_eth_mac_h_l82_c9_b835]
signal state_MUX_rmii_eth_mac_h_l82_c9_b835_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l82_c9_b835_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l82_c9_b835_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l82_c9_b835_return_output : unsigned(1 downto 0);

-- BIN_OP_PLUS[rmii_eth_mac_h_l89_c9_a97e]
signal BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_a97e_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_a97e_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_a97e_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l93_c11_5647]
signal BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_return_output : unsigned(0 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l93_c8_045f]
signal byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_return_output : unsigned(1 downto 0);

-- fcs_reg_MUX[rmii_eth_mac_h_l93_c8_045f]
signal fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_cond : unsigned(0 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse : unsigned(31 downto 0);
signal fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_return_output : unsigned(31 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l93_c8_045f]
signal bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_return_output : unsigned(2 downto 0);

-- state_MUX[rmii_eth_mac_h_l93_c8_045f]
signal state_MUX_rmii_eth_mac_h_l93_c8_045f_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l93_c8_045f_return_output : unsigned(1 downto 0);

-- data_out_reg_MUX[rmii_eth_mac_h_l93_c8_045f]
signal data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_cond : unsigned(0 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse : unsigned(7 downto 0);
signal data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_return_output : unsigned(7 downto 0);

-- CONST_SR_2[rmii_eth_mac_h_l96_c44_8279]
signal CONST_SR_2_rmii_eth_mac_h_l96_c44_8279_x : unsigned(31 downto 0);
signal CONST_SR_2_rmii_eth_mac_h_l96_c44_8279_return_output : unsigned(31 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l98_c5_378d]
signal byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_return_output : unsigned(1 downto 0);

-- bit_counter_MUX[rmii_eth_mac_h_l98_c5_378d]
signal bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_cond : unsigned(0 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iftrue : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iffalse : unsigned(2 downto 0);
signal bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_return_output : unsigned(2 downto 0);

-- state_MUX[rmii_eth_mac_h_l98_c5_378d]
signal state_MUX_rmii_eth_mac_h_l98_c5_378d_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l98_c5_378d_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l98_c5_378d_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l98_c5_378d_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[rmii_eth_mac_h_l99_c10_341d]
signal BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d_left : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d_return_output : unsigned(0 downto 0);

-- byte_counter_MUX[rmii_eth_mac_h_l99_c7_577b]
signal byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_cond : unsigned(0 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_iftrue : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_iffalse : unsigned(1 downto 0);
signal byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_return_output : unsigned(1 downto 0);

-- state_MUX[rmii_eth_mac_h_l99_c7_577b]
signal state_MUX_rmii_eth_mac_h_l99_c7_577b_cond : unsigned(0 downto 0);
signal state_MUX_rmii_eth_mac_h_l99_c7_577b_iftrue : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l99_c7_577b_iffalse : unsigned(1 downto 0);
signal state_MUX_rmii_eth_mac_h_l99_c7_577b_return_output : unsigned(1 downto 0);

-- BIN_OP_PLUS[rmii_eth_mac_h_l103_c9_214a]
signal BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_214a_left : unsigned(1 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_214a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_214a_return_output : unsigned(2 downto 0);

-- BIN_OP_PLUS[rmii_eth_mac_h_l108_c7_f1a0]
signal BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_f1a0_left : unsigned(2 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_f1a0_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_f1a0_return_output : unsigned(3 downto 0);

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
-- BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5 : entity work.BIN_OP_EQ_uint3_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_left,
BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_right,
BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l44_c53_5a3d : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l44_c53_5a3d : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l44_c53_5a3d_left,
BIN_OP_EQ_rmii_eth_mac_h_l44_c53_5a3d_right,
BIN_OP_EQ_rmii_eth_mac_h_l44_c53_5a3d_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6 : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_left,
BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_right,
BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l45_c48_8494 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l45_c48_8494 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l45_c48_8494_left,
BIN_OP_EQ_rmii_eth_mac_h_l45_c48_8494_right,
BIN_OP_EQ_rmii_eth_mac_h_l45_c48_8494_return_output);

-- BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff : 0 clocks latency
BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff_left,
BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff_right,
BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_left,
BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_right,
BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_return_output);

-- err_MUX_rmii_eth_mac_h_l48_c3_8539 : 0 clocks latency
err_MUX_rmii_eth_mac_h_l48_c3_8539 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
err_MUX_rmii_eth_mac_h_l48_c3_8539_cond,
err_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue,
err_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse,
err_MUX_rmii_eth_mac_h_l48_c3_8539_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539 : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_cond,
byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_return_output);

-- valid_MUX_rmii_eth_mac_h_l48_c3_8539 : 0 clocks latency
valid_MUX_rmii_eth_mac_h_l48_c3_8539 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
valid_MUX_rmii_eth_mac_h_l48_c3_8539_cond,
valid_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue,
valid_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse,
valid_MUX_rmii_eth_mac_h_l48_c3_8539_return_output);

-- last_MUX_rmii_eth_mac_h_l48_c3_8539 : 0 clocks latency
last_MUX_rmii_eth_mac_h_l48_c3_8539 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l48_c3_8539_cond,
last_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue,
last_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse,
last_MUX_rmii_eth_mac_h_l48_c3_8539_return_output);

-- fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539 : 0 clocks latency
fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_cond,
fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue,
fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse,
fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_cond,
bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_return_output);

-- state_MUX_rmii_eth_mac_h_l48_c3_8539 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l48_c3_8539 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l48_c3_8539_cond,
state_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue,
state_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse,
state_MUX_rmii_eth_mac_h_l48_c3_8539_return_output);

-- data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539 : 0 clocks latency
data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_cond,
data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue,
data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse,
data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_return_output);

-- err_MUX_rmii_eth_mac_h_l54_c5_465c : 0 clocks latency
err_MUX_rmii_eth_mac_h_l54_c5_465c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
err_MUX_rmii_eth_mac_h_l54_c5_465c_cond,
err_MUX_rmii_eth_mac_h_l54_c5_465c_iftrue,
err_MUX_rmii_eth_mac_h_l54_c5_465c_iffalse,
err_MUX_rmii_eth_mac_h_l54_c5_465c_return_output);

-- state_MUX_rmii_eth_mac_h_l54_c5_465c : 0 clocks latency
state_MUX_rmii_eth_mac_h_l54_c5_465c : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l54_c5_465c_cond,
state_MUX_rmii_eth_mac_h_l54_c5_465c_iftrue,
state_MUX_rmii_eth_mac_h_l54_c5_465c_iffalse,
state_MUX_rmii_eth_mac_h_l54_c5_465c_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_left,
BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_right,
BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_return_output);

-- err_MUX_rmii_eth_mac_h_l59_c8_be03 : 0 clocks latency
err_MUX_rmii_eth_mac_h_l59_c8_be03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
err_MUX_rmii_eth_mac_h_l59_c8_be03_cond,
err_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue,
err_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse,
err_MUX_rmii_eth_mac_h_l59_c8_be03_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03 : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_cond,
byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_return_output);

-- valid_MUX_rmii_eth_mac_h_l59_c8_be03 : 0 clocks latency
valid_MUX_rmii_eth_mac_h_l59_c8_be03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
valid_MUX_rmii_eth_mac_h_l59_c8_be03_cond,
valid_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue,
valid_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse,
valid_MUX_rmii_eth_mac_h_l59_c8_be03_return_output);

-- last_MUX_rmii_eth_mac_h_l59_c8_be03 : 0 clocks latency
last_MUX_rmii_eth_mac_h_l59_c8_be03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l59_c8_be03_cond,
last_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue,
last_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse,
last_MUX_rmii_eth_mac_h_l59_c8_be03_return_output);

-- fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03 : 0 clocks latency
fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_cond,
fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue,
fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse,
fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_cond,
bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_return_output);

-- state_MUX_rmii_eth_mac_h_l59_c8_be03 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l59_c8_be03 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l59_c8_be03_cond,
state_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue,
state_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse,
state_MUX_rmii_eth_mac_h_l59_c8_be03_return_output);

-- data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03 : 0 clocks latency
data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_cond,
data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue,
data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse,
data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_return_output);

-- err_MUX_rmii_eth_mac_h_l60_c5_b797 : 0 clocks latency
err_MUX_rmii_eth_mac_h_l60_c5_b797 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
err_MUX_rmii_eth_mac_h_l60_c5_b797_cond,
err_MUX_rmii_eth_mac_h_l60_c5_b797_iftrue,
err_MUX_rmii_eth_mac_h_l60_c5_b797_iffalse,
err_MUX_rmii_eth_mac_h_l60_c5_b797_return_output);

-- state_MUX_rmii_eth_mac_h_l60_c5_b797 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l60_c5_b797 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l60_c5_b797_cond,
state_MUX_rmii_eth_mac_h_l60_c5_b797_iftrue,
state_MUX_rmii_eth_mac_h_l60_c5_b797_iffalse,
state_MUX_rmii_eth_mac_h_l60_c5_b797_return_output);

-- err_MUX_rmii_eth_mac_h_l63_c10_929c : 0 clocks latency
err_MUX_rmii_eth_mac_h_l63_c10_929c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
err_MUX_rmii_eth_mac_h_l63_c10_929c_cond,
err_MUX_rmii_eth_mac_h_l63_c10_929c_iftrue,
err_MUX_rmii_eth_mac_h_l63_c10_929c_iffalse,
err_MUX_rmii_eth_mac_h_l63_c10_929c_return_output);

-- state_MUX_rmii_eth_mac_h_l63_c10_929c : 0 clocks latency
state_MUX_rmii_eth_mac_h_l63_c10_929c : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l63_c10_929c_cond,
state_MUX_rmii_eth_mac_h_l63_c10_929c_iftrue,
state_MUX_rmii_eth_mac_h_l63_c10_929c_iffalse,
state_MUX_rmii_eth_mac_h_l63_c10_929c_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_left,
BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_right,
BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4 : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_cond,
byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output);

-- valid_MUX_rmii_eth_mac_h_l71_c8_03a4 : 0 clocks latency
valid_MUX_rmii_eth_mac_h_l71_c8_03a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
valid_MUX_rmii_eth_mac_h_l71_c8_03a4_cond,
valid_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue,
valid_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse,
valid_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output);

-- last_MUX_rmii_eth_mac_h_l71_c8_03a4 : 0 clocks latency
last_MUX_rmii_eth_mac_h_l71_c8_03a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l71_c8_03a4_cond,
last_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue,
last_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse,
last_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output);

-- fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4 : 0 clocks latency
fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_cond,
fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue,
fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse,
fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_cond,
bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output);

-- state_MUX_rmii_eth_mac_h_l71_c8_03a4 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l71_c8_03a4 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l71_c8_03a4_cond,
state_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue,
state_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse,
state_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output);

-- data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4 : 0 clocks latency
data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_cond,
data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue,
data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse,
data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output);

-- valid_MUX_rmii_eth_mac_h_l72_c5_5d9d : 0 clocks latency
valid_MUX_rmii_eth_mac_h_l72_c5_5d9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond,
valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue,
valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse,
valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output);

-- last_MUX_rmii_eth_mac_h_l72_c5_5d9d : 0 clocks latency
last_MUX_rmii_eth_mac_h_l72_c5_5d9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond,
last_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue,
last_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse,
last_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond,
bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output);

-- state_MUX_rmii_eth_mac_h_l72_c5_5d9d : 0 clocks latency
state_MUX_rmii_eth_mac_h_l72_c5_5d9d : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond,
state_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue,
state_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse,
state_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output);

-- data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d : 0 clocks latency
data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond,
data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue,
data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse,
data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output);

-- last_MUX_rmii_eth_mac_h_l75_c7_fe0e : 0 clocks latency
last_MUX_rmii_eth_mac_h_l75_c7_fe0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l75_c7_fe0e_cond,
last_MUX_rmii_eth_mac_h_l75_c7_fe0e_iftrue,
last_MUX_rmii_eth_mac_h_l75_c7_fe0e_iffalse,
last_MUX_rmii_eth_mac_h_l75_c7_fe0e_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_cond,
bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_return_output);

-- state_MUX_rmii_eth_mac_h_l75_c7_fe0e : 0 clocks latency
state_MUX_rmii_eth_mac_h_l75_c7_fe0e : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l75_c7_fe0e_cond,
state_MUX_rmii_eth_mac_h_l75_c7_fe0e_iftrue,
state_MUX_rmii_eth_mac_h_l75_c7_fe0e_iffalse,
state_MUX_rmii_eth_mac_h_l75_c7_fe0e_return_output);

-- UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_c799 : 0 clocks latency
UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_c799 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_c799_expr,
UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_c799_return_output);

-- last_MUX_rmii_eth_mac_h_l82_c9_b835 : 0 clocks latency
last_MUX_rmii_eth_mac_h_l82_c9_b835 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
last_MUX_rmii_eth_mac_h_l82_c9_b835_cond,
last_MUX_rmii_eth_mac_h_l82_c9_b835_iftrue,
last_MUX_rmii_eth_mac_h_l82_c9_b835_iffalse,
last_MUX_rmii_eth_mac_h_l82_c9_b835_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835 : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835 : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_cond,
bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_return_output);

-- state_MUX_rmii_eth_mac_h_l82_c9_b835 : 0 clocks latency
state_MUX_rmii_eth_mac_h_l82_c9_b835 : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l82_c9_b835_cond,
state_MUX_rmii_eth_mac_h_l82_c9_b835_iftrue,
state_MUX_rmii_eth_mac_h_l82_c9_b835_iffalse,
state_MUX_rmii_eth_mac_h_l82_c9_b835_return_output);

-- BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_a97e : 0 clocks latency
BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_a97e : entity work.BIN_OP_PLUS_uint3_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_a97e_left,
BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_a97e_right,
BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_a97e_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647 : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647 : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_left,
BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_right,
BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_cond,
byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_return_output);

-- fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f : 0 clocks latency
fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_cond,
fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue,
fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse,
fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_cond,
bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_return_output);

-- state_MUX_rmii_eth_mac_h_l93_c8_045f : 0 clocks latency
state_MUX_rmii_eth_mac_h_l93_c8_045f : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l93_c8_045f_cond,
state_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue,
state_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse,
state_MUX_rmii_eth_mac_h_l93_c8_045f_return_output);

-- data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f : 0 clocks latency
data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_cond,
data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue,
data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse,
data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_return_output);

-- CONST_SR_2_rmii_eth_mac_h_l96_c44_8279 : 0 clocks latency
CONST_SR_2_rmii_eth_mac_h_l96_c44_8279 : entity work.CONST_SR_2_uint32_t_0CLK_de264c78 port map (
CONST_SR_2_rmii_eth_mac_h_l96_c44_8279_x,
CONST_SR_2_rmii_eth_mac_h_l96_c44_8279_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_cond,
byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_return_output);

-- bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d : 0 clocks latency
bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d : entity work.MUX_uint1_t_uint3_t_uint3_t_0CLK_de264c78 port map (
bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_cond,
bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iftrue,
bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iffalse,
bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_return_output);

-- state_MUX_rmii_eth_mac_h_l98_c5_378d : 0 clocks latency
state_MUX_rmii_eth_mac_h_l98_c5_378d : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l98_c5_378d_cond,
state_MUX_rmii_eth_mac_h_l98_c5_378d_iftrue,
state_MUX_rmii_eth_mac_h_l98_c5_378d_iffalse,
state_MUX_rmii_eth_mac_h_l98_c5_378d_return_output);

-- BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d : 0 clocks latency
BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d : entity work.BIN_OP_EQ_uint2_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d_left,
BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d_right,
BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d_return_output);

-- byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b : 0 clocks latency
byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_cond,
byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_iftrue,
byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_iffalse,
byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_return_output);

-- state_MUX_rmii_eth_mac_h_l99_c7_577b : 0 clocks latency
state_MUX_rmii_eth_mac_h_l99_c7_577b : entity work.MUX_uint1_t_rmii_rx_mac_state_t_rmii_rx_mac_state_t_0CLK_de264c78 port map (
state_MUX_rmii_eth_mac_h_l99_c7_577b_cond,
state_MUX_rmii_eth_mac_h_l99_c7_577b_iftrue,
state_MUX_rmii_eth_mac_h_l99_c7_577b_iffalse,
state_MUX_rmii_eth_mac_h_l99_c7_577b_return_output);

-- BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_214a : 0 clocks latency
BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_214a : entity work.BIN_OP_PLUS_uint2_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_214a_left,
BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_214a_right,
BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_214a_return_output);

-- BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_f1a0 : 0 clocks latency
BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_f1a0 : entity work.BIN_OP_PLUS_uint3_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_f1a0_left,
BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_f1a0_right,
BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_f1a0_return_output);



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
 BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l44_c53_5a3d_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l45_c48_8494_return_output,
 BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_return_output,
 err_MUX_rmii_eth_mac_h_l48_c3_8539_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_return_output,
 valid_MUX_rmii_eth_mac_h_l48_c3_8539_return_output,
 last_MUX_rmii_eth_mac_h_l48_c3_8539_return_output,
 fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_return_output,
 state_MUX_rmii_eth_mac_h_l48_c3_8539_return_output,
 data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_return_output,
 err_MUX_rmii_eth_mac_h_l54_c5_465c_return_output,
 state_MUX_rmii_eth_mac_h_l54_c5_465c_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_return_output,
 err_MUX_rmii_eth_mac_h_l59_c8_be03_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_return_output,
 valid_MUX_rmii_eth_mac_h_l59_c8_be03_return_output,
 last_MUX_rmii_eth_mac_h_l59_c8_be03_return_output,
 fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_return_output,
 state_MUX_rmii_eth_mac_h_l59_c8_be03_return_output,
 data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_return_output,
 err_MUX_rmii_eth_mac_h_l60_c5_b797_return_output,
 state_MUX_rmii_eth_mac_h_l60_c5_b797_return_output,
 err_MUX_rmii_eth_mac_h_l63_c10_929c_return_output,
 state_MUX_rmii_eth_mac_h_l63_c10_929c_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output,
 valid_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output,
 last_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output,
 fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output,
 state_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output,
 data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output,
 valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output,
 last_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output,
 state_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output,
 data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output,
 last_MUX_rmii_eth_mac_h_l75_c7_fe0e_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_return_output,
 state_MUX_rmii_eth_mac_h_l75_c7_fe0e_return_output,
 UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_c799_return_output,
 last_MUX_rmii_eth_mac_h_l82_c9_b835_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_return_output,
 state_MUX_rmii_eth_mac_h_l82_c9_b835_return_output,
 BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_a97e_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_return_output,
 fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_return_output,
 state_MUX_rmii_eth_mac_h_l93_c8_045f_return_output,
 data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_return_output,
 CONST_SR_2_rmii_eth_mac_h_l96_c44_8279_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_return_output,
 bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_return_output,
 state_MUX_rmii_eth_mac_h_l98_c5_378d_return_output,
 BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d_return_output,
 byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_return_output,
 state_MUX_rmii_eth_mac_h_l99_c7_577b_return_output,
 BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_214a_return_output,
 BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_f1a0_return_output)
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
 variable VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_5db7_return_output : unsigned(1 downto 0);
 variable VAR_data_in_valid_delayed : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_1ce0_return_output : unsigned(0 downto 0);
 variable VAR_o : rmii_rx_mac_t;
 variable VAR_bit_end : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_return_output : unsigned(0 downto 0);
 variable VAR_preamble_bits : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_5a3d_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_5a3d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_5a3d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_return_output : unsigned(0 downto 0);
 variable VAR_sfd_bits : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_8494_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_8494_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_8494_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l54_c5_465c_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l59_c8_be03_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l48_c3_8539_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l48_c3_8539_cond : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_cond : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l59_c8_be03_return_output : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l48_c3_8539_return_output : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l48_c3_8539_cond : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l59_c8_be03_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l48_c3_8539_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l48_c3_8539_cond : unsigned(0 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue : unsigned(31 downto 0);
 variable VAR_fcs_reg_rmii_eth_mac_h_l53_c5_5b0e : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_return_output : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_return_output : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l52_c5_b08f : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l54_c5_465c_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l59_c8_be03_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l48_c3_8539_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l48_c3_8539_cond : unsigned(0 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue : unsigned(7 downto 0);
 variable VAR_data_out_reg_rmii_eth_mac_h_l51_c5_a280 : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_return_output : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_return_output : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_cond : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l54_c5_465c_iftrue : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l54_c5_465c_iffalse : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l54_c5_465c_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l54_c5_465c_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l54_c5_465c_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l54_c5_465c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l60_c5_b797_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l59_c8_be03_cond : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_cond : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l59_c8_be03_cond : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l59_c8_be03_cond : unsigned(0 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l60_c5_b797_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l59_c8_be03_cond : unsigned(0 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_cond : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l60_c5_b797_iftrue : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l60_c5_b797_iffalse : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l63_c10_929c_return_output : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l60_c5_b797_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l60_c5_b797_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l60_c5_b797_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l63_c10_929c_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l60_c5_b797_cond : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l63_c10_929c_iftrue : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l63_c10_929c_iffalse : unsigned(0 downto 0);
 variable VAR_err_MUX_rmii_eth_mac_h_l63_c10_929c_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l63_c10_929c_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l63_c10_929c_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l63_c10_929c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_return_output : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_cond : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l71_c8_03a4_cond : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l71_c8_03a4_cond : unsigned(0 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_return_output : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l93_c8_045f_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l71_c8_03a4_cond : unsigned(0 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_return_output : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_cond : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse : unsigned(0 downto 0);
 variable VAR_valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l75_c7_fe0e_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l75_c7_fe0e_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond : unsigned(0 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond : unsigned(0 downto 0);
 variable VAR_uint8_7_2_rmii_eth_mac_h_l73_c50_8108_return_output : unsigned(5 downto 0);
 variable VAR_uint2_uint6_rmii_eth_mac_h_l73_c22_d163_return_output : unsigned(7 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l75_c7_fe0e_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l82_c9_b835_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l75_c7_fe0e_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l75_c7_fe0e_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l89_c9_5b45 : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l75_c7_fe0e_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l82_c9_b835_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l75_c7_fe0e_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l75_c7_fe0e_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l76_c9_2de6 : unsigned(2 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_c799_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_c799_return_output : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l82_c9_b835_iftrue : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l82_c9_b835_iffalse : unsigned(0 downto 0);
 variable VAR_last_MUX_rmii_eth_mac_h_l82_c9_b835_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l84_c11_ef04 : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l82_c9_b835_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l82_c9_b835_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l82_c9_b835_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_a97e_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_a97e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_a97e_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_return_output : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_cond : unsigned(0 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse : unsigned(31 downto 0);
 variable VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_return_output : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l98_c5_378d_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l93_c8_045f_cond : unsigned(0 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue : unsigned(7 downto 0);
 variable VAR_data_out_reg_rmii_eth_mac_h_l97_c5_d0f4 : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse : unsigned(7 downto 0);
 variable VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_8279_return_output : unsigned(31 downto 0);
 variable VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_8279_x : unsigned(31 downto 0);
 variable VAR_uint2_uint30_rmii_eth_mac_h_l96_c15_c654_return_output : unsigned(31 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_return_output : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_cond : unsigned(0 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iftrue : unsigned(2 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l105_c7_8f8c : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iffalse : unsigned(2 downto 0);
 variable VAR_bit_counter_rmii_eth_mac_h_l108_c7_7450 : unsigned(2 downto 0);
 variable VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l98_c5_378d_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l99_c7_577b_return_output : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l98_c5_378d_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l98_c5_378d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d_return_output : unsigned(0 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_iftrue : unsigned(1 downto 0);
 variable VAR_byte_counter_rmii_eth_mac_h_l101_c9_368b : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_iffalse : unsigned(1 downto 0);
 variable VAR_byte_counter_rmii_eth_mac_h_l103_c9_3468 : unsigned(1 downto 0);
 variable VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_cond : unsigned(0 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l99_c7_577b_iftrue : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l99_c7_577b_iffalse : unsigned(1 downto 0);
 variable VAR_state_MUX_rmii_eth_mac_h_l99_c7_577b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_214a_left : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_214a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_214a_return_output : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_f1a0_left : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_f1a0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_f1a0_return_output : unsigned(3 downto 0);
 variable VAR_ARRAY_SHIFT_UP_i : unsigned(31 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_0_CONST_REF_RD_uint2_t_uint2_t_20_18_d41d_rmii_eth_mac_h_l113_c140_5037_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_1_CONST_REF_RD_uint2_t_uint2_t_20_17_d41d_rmii_eth_mac_h_l113_c140_5037_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_2_CONST_REF_RD_uint2_t_uint2_t_20_16_d41d_rmii_eth_mac_h_l113_c140_5037_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_3_CONST_REF_RD_uint2_t_uint2_t_20_15_d41d_rmii_eth_mac_h_l113_c140_5037_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_4_CONST_REF_RD_uint2_t_uint2_t_20_14_d41d_rmii_eth_mac_h_l113_c140_5037_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_5_CONST_REF_RD_uint2_t_uint2_t_20_13_d41d_rmii_eth_mac_h_l113_c140_5037_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_6_CONST_REF_RD_uint2_t_uint2_t_20_12_d41d_rmii_eth_mac_h_l113_c140_5037_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_7_CONST_REF_RD_uint2_t_uint2_t_20_11_d41d_rmii_eth_mac_h_l113_c140_5037_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_8_CONST_REF_RD_uint2_t_uint2_t_20_10_d41d_rmii_eth_mac_h_l113_c140_5037_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_9_CONST_REF_RD_uint2_t_uint2_t_20_9_d41d_rmii_eth_mac_h_l113_c140_5037_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_10_CONST_REF_RD_uint2_t_uint2_t_20_8_d41d_rmii_eth_mac_h_l113_c140_5037_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_11_CONST_REF_RD_uint2_t_uint2_t_20_7_d41d_rmii_eth_mac_h_l113_c140_5037_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_12_CONST_REF_RD_uint2_t_uint2_t_20_6_d41d_rmii_eth_mac_h_l113_c140_5037_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_13_CONST_REF_RD_uint2_t_uint2_t_20_5_d41d_rmii_eth_mac_h_l113_c140_5037_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_14_CONST_REF_RD_uint2_t_uint2_t_20_4_d41d_rmii_eth_mac_h_l113_c140_5037_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_15_CONST_REF_RD_uint2_t_uint2_t_20_3_d41d_rmii_eth_mac_h_l113_c140_5037_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_16_CONST_REF_RD_uint2_t_uint2_t_20_2_d41d_rmii_eth_mac_h_l113_c140_5037_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_17_CONST_REF_RD_uint2_t_uint2_t_20_1_d41d_rmii_eth_mac_h_l113_c140_5037_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_18_CONST_REF_RD_uint2_t_uint2_t_20_0_d41d_rmii_eth_mac_h_l113_c140_5037_return_output : unsigned(1 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_0_CONST_REF_RD_uint1_t_uint1_t_20_18_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_1_CONST_REF_RD_uint1_t_uint1_t_20_17_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_2_CONST_REF_RD_uint1_t_uint1_t_20_16_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_3_CONST_REF_RD_uint1_t_uint1_t_20_15_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_4_CONST_REF_RD_uint1_t_uint1_t_20_14_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_5_CONST_REF_RD_uint1_t_uint1_t_20_13_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_6_CONST_REF_RD_uint1_t_uint1_t_20_12_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_7_CONST_REF_RD_uint1_t_uint1_t_20_11_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_8_CONST_REF_RD_uint1_t_uint1_t_20_10_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_9_CONST_REF_RD_uint1_t_uint1_t_20_9_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_10_CONST_REF_RD_uint1_t_uint1_t_20_8_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_11_CONST_REF_RD_uint1_t_uint1_t_20_7_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_12_CONST_REF_RD_uint1_t_uint1_t_20_6_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_13_CONST_REF_RD_uint1_t_uint1_t_20_5_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_14_CONST_REF_RD_uint1_t_uint1_t_20_4_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_15_CONST_REF_RD_uint1_t_uint1_t_20_3_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_16_CONST_REF_RD_uint1_t_uint1_t_20_2_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_17_CONST_REF_RD_uint1_t_uint1_t_20_1_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output : unsigned(0 downto 0);
 variable VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_18_CONST_REF_RD_uint1_t_uint1_t_20_0_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4_rmii_eth_mac_h_l123_c10_635e_return_output : rmii_rx_mac_t;
 variable VAR_data_in_regs_CONST_REF_RD_uint2_t_20_uint2_t_20_a609_rmii_eth_mac_h_l17_c15_26d8_return_output : uint2_t_20;
 variable VAR_data_in_valid_regs_CONST_REF_RD_uint1_t_20_uint1_t_20_a609_rmii_eth_mac_h_l17_c15_26d8_return_output : uint1_t_20;
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
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_right := unsigned(rmii_rx_mac_state_t_to_slv(DATA));
     VAR_bit_counter_rmii_eth_mac_h_l76_c9_2de6 := resize(to_unsigned(0, 1), 3);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_iffalse := VAR_bit_counter_rmii_eth_mac_h_l76_c9_2de6;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_right := unsigned(rmii_rx_mac_state_t_to_slv(FCS));
     VAR_bit_counter_rmii_eth_mac_h_l105_c7_8f8c := resize(to_unsigned(0, 1), 3);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iftrue := VAR_bit_counter_rmii_eth_mac_h_l105_c7_8f8c;
     VAR_data_out_reg_rmii_eth_mac_h_l51_c5_a280 := resize(to_unsigned(0, 1), 8);
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue := VAR_data_out_reg_rmii_eth_mac_h_l51_c5_a280;
     VAR_err_MUX_rmii_eth_mac_h_l63_c10_929c_iftrue := to_unsigned(0, 1);
     VAR_err_MUX_rmii_eth_mac_h_l60_c5_b797_iftrue := to_unsigned(0, 1);
     VAR_err_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse := to_unsigned(0, 1);
     VAR_err_MUX_rmii_eth_mac_h_l54_c5_465c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_a97e_right := to_unsigned(2, 2);
     VAR_state_MUX_rmii_eth_mac_h_l63_c10_929c_iffalse := unsigned(rmii_rx_mac_state_t_to_slv(IDLE));
     VAR_err_MUX_rmii_eth_mac_h_l54_c5_465c_iftrue := to_unsigned(0, 1);
     VAR_last_MUX_rmii_eth_mac_h_l82_c9_b835_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_214a_right := to_unsigned(1, 1);
     VAR_valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse := to_unsigned(0, 1);
     VAR_valid_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue := to_unsigned(0, 1);
     VAR_valid_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_f1a0_right := to_unsigned(2, 2);
     VAR_state_MUX_rmii_eth_mac_h_l54_c5_465c_iftrue := unsigned(rmii_rx_mac_state_t_to_slv(PREAMBLE));
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_5a3d_right := to_unsigned(1, 2);
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_8494_right := to_unsigned(3, 2);
     VAR_state_MUX_rmii_eth_mac_h_l82_c9_b835_iftrue := unsigned(rmii_rx_mac_state_t_to_slv(FCS));
     VAR_bit_counter_rmii_eth_mac_h_l84_c11_ef04 := resize(to_unsigned(0, 1), 3);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_iftrue := VAR_bit_counter_rmii_eth_mac_h_l84_c11_ef04;
     VAR_bit_counter_rmii_eth_mac_h_l52_c5_b08f := resize(to_unsigned(0, 1), 3);
     VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue := VAR_bit_counter_rmii_eth_mac_h_l52_c5_b08f;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_right := to_unsigned(6, 3);
     VAR_state_MUX_rmii_eth_mac_h_l63_c10_929c_iftrue := unsigned(rmii_rx_mac_state_t_to_slv(DATA));
     VAR_state_MUX_rmii_eth_mac_h_l60_c5_b797_iftrue := unsigned(rmii_rx_mac_state_t_to_slv(PREAMBLE));
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_right := unsigned(rmii_rx_mac_state_t_to_slv(PREAMBLE));
     VAR_byte_counter_rmii_eth_mac_h_l101_c9_368b := resize(to_unsigned(0, 1), 2);
     VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_iftrue := VAR_byte_counter_rmii_eth_mac_h_l101_c9_368b;
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue := to_unsigned(0, 1);
     VAR_last_MUX_rmii_eth_mac_h_l75_c7_fe0e_iffalse := to_unsigned(0, 1);
     VAR_last_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse := to_unsigned(0, 1);
     VAR_last_MUX_rmii_eth_mac_h_l82_c9_b835_iffalse := to_unsigned(0, 1);
     VAR_last_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse := to_unsigned(0, 1);
     VAR_last_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue := to_unsigned(0, 1);
     VAR_fcs_reg_rmii_eth_mac_h_l53_c5_5b0e := resize(to_unsigned(0, 1), 32);
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue := VAR_fcs_reg_rmii_eth_mac_h_l53_c5_5b0e;
     VAR_data_out_reg_rmii_eth_mac_h_l97_c5_d0f4 := resize(to_unsigned(0, 1), 8);
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue := VAR_data_out_reg_rmii_eth_mac_h_l97_c5_d0f4;
     VAR_last_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue := to_unsigned(0, 1);
     VAR_err_MUX_rmii_eth_mac_h_l63_c10_929c_iffalse := to_unsigned(1, 1);
     VAR_state_MUX_rmii_eth_mac_h_l99_c7_577b_iftrue := unsigned(rmii_rx_mac_state_t_to_slv(IDLE));
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_right := unsigned(rmii_rx_mac_state_t_to_slv(IDLE));

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
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_left := bit_counter;
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_f1a0_left := bit_counter;
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_a97e_left := bit_counter;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue := bit_counter;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse := bit_counter;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse := bit_counter;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d_left := byte_counter;
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_214a_left := byte_counter;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue := byte_counter;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue := byte_counter;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue := byte_counter;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse := byte_counter;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iffalse := byte_counter;
     VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_c799_expr := VAR_data_in_valid;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue := data_out_reg;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse := data_out_reg;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse := data_out_reg;
     VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_8279_x := fcs_reg;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue := fcs_reg;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue := fcs_reg;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse := fcs_reg;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_left := state;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_left := state;
     VAR_state_MUX_rmii_eth_mac_h_l54_c5_465c_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l75_c7_fe0e_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l82_c9_b835_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l98_c5_378d_iffalse := state;
     VAR_state_MUX_rmii_eth_mac_h_l99_c7_577b_iffalse := state;
     -- FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_4_CONST_REF_RD_uint1_t_uint1_t_20_14_d41d[rmii_eth_mac_h_l114_c146_9ab5] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_4_CONST_REF_RD_uint1_t_uint1_t_20_14_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output := data_in_valid_regs(14);

     -- FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_15_CONST_REF_RD_uint1_t_uint1_t_20_3_d41d[rmii_eth_mac_h_l114_c146_9ab5] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_15_CONST_REF_RD_uint1_t_uint1_t_20_3_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output := data_in_valid_regs(3);

     -- BIN_OP_PLUS[rmii_eth_mac_h_l108_c7_f1a0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_f1a0_left <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_f1a0_left;
     BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_f1a0_right <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_f1a0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_f1a0_return_output := BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_f1a0_return_output;

     -- FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_7_CONST_REF_RD_uint1_t_uint1_t_20_11_d41d[rmii_eth_mac_h_l114_c146_9ab5] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_7_CONST_REF_RD_uint1_t_uint1_t_20_11_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output := data_in_valid_regs(11);

     -- FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_10_CONST_REF_RD_uint1_t_uint1_t_20_8_d41d[rmii_eth_mac_h_l114_c146_9ab5] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_10_CONST_REF_RD_uint1_t_uint1_t_20_8_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output := data_in_valid_regs(8);

     -- FOR_rmii_eth_mac_h_l113_c30_445a_ITER_12_CONST_REF_RD_uint2_t_uint2_t_20_6_d41d[rmii_eth_mac_h_l113_c140_5037] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_12_CONST_REF_RD_uint2_t_uint2_t_20_6_d41d_rmii_eth_mac_h_l113_c140_5037_return_output := data_in_regs(6);

     -- BIN_OP_EQ[rmii_eth_mac_h_l48_c6_af7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_left;
     BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_return_output := BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l99_c10_341d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d_left;
     BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d_return_output := BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l59_c11_3c2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_left;
     BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_return_output := BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_return_output;

     -- FOR_rmii_eth_mac_h_l113_c30_445a_ITER_14_CONST_REF_RD_uint2_t_uint2_t_20_4_d41d[rmii_eth_mac_h_l113_c140_5037] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_14_CONST_REF_RD_uint2_t_uint2_t_20_4_d41d_rmii_eth_mac_h_l113_c140_5037_return_output := data_in_regs(4);

     -- BIN_OP_EQ[rmii_eth_mac_h_l93_c11_5647] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_left;
     BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_return_output := BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_return_output;

     -- FOR_rmii_eth_mac_h_l113_c30_445a_ITER_1_CONST_REF_RD_uint2_t_uint2_t_20_17_d41d[rmii_eth_mac_h_l113_c140_5037] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_1_CONST_REF_RD_uint2_t_uint2_t_20_17_d41d_rmii_eth_mac_h_l113_c140_5037_return_output := data_in_regs(17);

     -- FOR_rmii_eth_mac_h_l113_c30_445a_ITER_2_CONST_REF_RD_uint2_t_uint2_t_20_16_d41d[rmii_eth_mac_h_l113_c140_5037] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_2_CONST_REF_RD_uint2_t_uint2_t_20_16_d41d_rmii_eth_mac_h_l113_c140_5037_return_output := data_in_regs(16);

     -- FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_14_CONST_REF_RD_uint1_t_uint1_t_20_4_d41d[rmii_eth_mac_h_l114_c146_9ab5] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_14_CONST_REF_RD_uint1_t_uint1_t_20_4_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output := data_in_valid_regs(4);

     -- FOR_rmii_eth_mac_h_l113_c30_445a_ITER_17_CONST_REF_RD_uint2_t_uint2_t_20_1_d41d[rmii_eth_mac_h_l113_c140_5037] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_17_CONST_REF_RD_uint2_t_uint2_t_20_1_d41d_rmii_eth_mac_h_l113_c140_5037_return_output := data_in_regs(1);

     -- FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_5_CONST_REF_RD_uint1_t_uint1_t_20_13_d41d[rmii_eth_mac_h_l114_c146_9ab5] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_5_CONST_REF_RD_uint1_t_uint1_t_20_13_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output := data_in_valid_regs(13);

     -- FOR_rmii_eth_mac_h_l113_c30_445a_ITER_6_CONST_REF_RD_uint2_t_uint2_t_20_12_d41d[rmii_eth_mac_h_l113_c140_5037] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_6_CONST_REF_RD_uint2_t_uint2_t_20_12_d41d_rmii_eth_mac_h_l113_c140_5037_return_output := data_in_regs(12);

     -- FOR_rmii_eth_mac_h_l113_c30_445a_ITER_10_CONST_REF_RD_uint2_t_uint2_t_20_8_d41d[rmii_eth_mac_h_l113_c140_5037] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_10_CONST_REF_RD_uint2_t_uint2_t_20_8_d41d_rmii_eth_mac_h_l113_c140_5037_return_output := data_in_regs(8);

     -- FOR_rmii_eth_mac_h_l113_c30_445a_ITER_18_CONST_REF_RD_uint2_t_uint2_t_20_0_d41d[rmii_eth_mac_h_l113_c140_5037] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_18_CONST_REF_RD_uint2_t_uint2_t_20_0_d41d_rmii_eth_mac_h_l113_c140_5037_return_output := data_in_regs(0);

     -- FOR_rmii_eth_mac_h_l113_c30_445a_ITER_16_CONST_REF_RD_uint2_t_uint2_t_20_2_d41d[rmii_eth_mac_h_l113_c140_5037] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_16_CONST_REF_RD_uint2_t_uint2_t_20_2_d41d_rmii_eth_mac_h_l113_c140_5037_return_output := data_in_regs(2);

     -- FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_1_CONST_REF_RD_uint1_t_uint1_t_20_17_d41d[rmii_eth_mac_h_l114_c146_9ab5] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_1_CONST_REF_RD_uint1_t_uint1_t_20_17_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output := data_in_valid_regs(17);

     -- FOR_rmii_eth_mac_h_l113_c30_445a_ITER_4_CONST_REF_RD_uint2_t_uint2_t_20_14_d41d[rmii_eth_mac_h_l113_c140_5037] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_4_CONST_REF_RD_uint2_t_uint2_t_20_14_d41d_rmii_eth_mac_h_l113_c140_5037_return_output := data_in_regs(14);

     -- FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_8_CONST_REF_RD_uint1_t_uint1_t_20_10_d41d[rmii_eth_mac_h_l114_c146_9ab5] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_8_CONST_REF_RD_uint1_t_uint1_t_20_10_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output := data_in_valid_regs(10);

     -- FOR_rmii_eth_mac_h_l113_c30_445a_ITER_8_CONST_REF_RD_uint2_t_uint2_t_20_10_d41d[rmii_eth_mac_h_l113_c140_5037] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_8_CONST_REF_RD_uint2_t_uint2_t_20_10_d41d_rmii_eth_mac_h_l113_c140_5037_return_output := data_in_regs(10);

     -- FOR_rmii_eth_mac_h_l113_c30_445a_ITER_7_CONST_REF_RD_uint2_t_uint2_t_20_11_d41d[rmii_eth_mac_h_l113_c140_5037] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_7_CONST_REF_RD_uint2_t_uint2_t_20_11_d41d_rmii_eth_mac_h_l113_c140_5037_return_output := data_in_regs(11);

     -- BIN_OP_PLUS[rmii_eth_mac_h_l89_c9_a97e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_a97e_left <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_a97e_left;
     BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_a97e_right <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_a97e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_a97e_return_output := BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_a97e_return_output;

     -- FOR_rmii_eth_mac_h_l113_c30_445a_ITER_5_CONST_REF_RD_uint2_t_uint2_t_20_13_d41d[rmii_eth_mac_h_l113_c140_5037] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_5_CONST_REF_RD_uint2_t_uint2_t_20_13_d41d_rmii_eth_mac_h_l113_c140_5037_return_output := data_in_regs(13);

     -- FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_3_CONST_REF_RD_uint1_t_uint1_t_20_15_d41d[rmii_eth_mac_h_l114_c146_9ab5] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_3_CONST_REF_RD_uint1_t_uint1_t_20_15_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output := data_in_valid_regs(15);

     -- CONST_REF_RD_uint2_t_uint2_t_20_19_d41d[rmii_eth_mac_h_l34_c29_5db7] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_5db7_return_output := data_in_regs(19);

     -- FOR_rmii_eth_mac_h_l113_c30_445a_ITER_15_CONST_REF_RD_uint2_t_uint2_t_20_3_d41d[rmii_eth_mac_h_l113_c140_5037] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_15_CONST_REF_RD_uint2_t_uint2_t_20_3_d41d_rmii_eth_mac_h_l113_c140_5037_return_output := data_in_regs(3);

     -- FOR_rmii_eth_mac_h_l113_c30_445a_ITER_9_CONST_REF_RD_uint2_t_uint2_t_20_9_d41d[rmii_eth_mac_h_l113_c140_5037] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_9_CONST_REF_RD_uint2_t_uint2_t_20_9_d41d_rmii_eth_mac_h_l113_c140_5037_return_output := data_in_regs(9);

     -- FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_2_CONST_REF_RD_uint1_t_uint1_t_20_16_d41d[rmii_eth_mac_h_l114_c146_9ab5] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_2_CONST_REF_RD_uint1_t_uint1_t_20_16_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output := data_in_valid_regs(16);

     -- FOR_rmii_eth_mac_h_l113_c30_445a_ITER_11_CONST_REF_RD_uint2_t_uint2_t_20_7_d41d[rmii_eth_mac_h_l113_c140_5037] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_11_CONST_REF_RD_uint2_t_uint2_t_20_7_d41d_rmii_eth_mac_h_l113_c140_5037_return_output := data_in_regs(7);

     -- BIN_OP_PLUS[rmii_eth_mac_h_l103_c9_214a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_214a_left <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_214a_left;
     BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_214a_right <= VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_214a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_214a_return_output := BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_214a_return_output;

     -- CONST_REF_RD_uint1_t_uint1_t_20_19_d41d[rmii_eth_mac_h_l35_c35_1ce0] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_1ce0_return_output := data_in_valid_regs(19);

     -- BIN_OP_EQ[rmii_eth_mac_h_l71_c11_47da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_left;
     BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_return_output := BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_return_output;

     -- FOR_rmii_eth_mac_h_l113_c30_445a_ITER_3_CONST_REF_RD_uint2_t_uint2_t_20_15_d41d[rmii_eth_mac_h_l113_c140_5037] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_3_CONST_REF_RD_uint2_t_uint2_t_20_15_d41d_rmii_eth_mac_h_l113_c140_5037_return_output := data_in_regs(15);

     -- FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_11_CONST_REF_RD_uint1_t_uint1_t_20_7_d41d[rmii_eth_mac_h_l114_c146_9ab5] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_11_CONST_REF_RD_uint1_t_uint1_t_20_7_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output := data_in_valid_regs(7);

     -- uint8_7_2[rmii_eth_mac_h_l73_c50_8108] LATENCY=0
     VAR_uint8_7_2_rmii_eth_mac_h_l73_c50_8108_return_output := uint8_7_2(
     data_out_reg);

     -- FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_9_CONST_REF_RD_uint1_t_uint1_t_20_9_d41d[rmii_eth_mac_h_l114_c146_9ab5] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_9_CONST_REF_RD_uint1_t_uint1_t_20_9_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output := data_in_valid_regs(9);

     -- CONST_SR_2[rmii_eth_mac_h_l96_c44_8279] LATENCY=0
     -- Inputs
     CONST_SR_2_rmii_eth_mac_h_l96_c44_8279_x <= VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_8279_x;
     -- Outputs
     VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_8279_return_output := CONST_SR_2_rmii_eth_mac_h_l96_c44_8279_return_output;

     -- FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_0_CONST_REF_RD_uint1_t_uint1_t_20_18_d41d[rmii_eth_mac_h_l114_c146_9ab5] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_0_CONST_REF_RD_uint1_t_uint1_t_20_18_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output := data_in_valid_regs(18);

     -- BIN_OP_EQ[rmii_eth_mac_h_l43_c22_65f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_left;
     BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_return_output := BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_return_output;

     -- FOR_rmii_eth_mac_h_l113_c30_445a_ITER_13_CONST_REF_RD_uint2_t_uint2_t_20_5_d41d[rmii_eth_mac_h_l113_c140_5037] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_13_CONST_REF_RD_uint2_t_uint2_t_20_5_d41d_rmii_eth_mac_h_l113_c140_5037_return_output := data_in_regs(5);

     -- FOR_rmii_eth_mac_h_l113_c30_445a_ITER_0_CONST_REF_RD_uint2_t_uint2_t_20_18_d41d[rmii_eth_mac_h_l113_c140_5037] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_0_CONST_REF_RD_uint2_t_uint2_t_20_18_d41d_rmii_eth_mac_h_l113_c140_5037_return_output := data_in_regs(18);

     -- FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_16_CONST_REF_RD_uint1_t_uint1_t_20_2_d41d[rmii_eth_mac_h_l114_c146_9ab5] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_16_CONST_REF_RD_uint1_t_uint1_t_20_2_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output := data_in_valid_regs(2);

     -- UNARY_OP_NOT[rmii_eth_mac_h_l82_c13_c799] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_c799_expr <= VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_c799_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_c799_return_output := UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_c799_return_output;

     -- FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_12_CONST_REF_RD_uint1_t_uint1_t_20_6_d41d[rmii_eth_mac_h_l114_c146_9ab5] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_12_CONST_REF_RD_uint1_t_uint1_t_20_6_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output := data_in_valid_regs(6);

     -- FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_6_CONST_REF_RD_uint1_t_uint1_t_20_12_d41d[rmii_eth_mac_h_l114_c146_9ab5] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_6_CONST_REF_RD_uint1_t_uint1_t_20_12_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output := data_in_valid_regs(12);

     -- FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_18_CONST_REF_RD_uint1_t_uint1_t_20_0_d41d[rmii_eth_mac_h_l114_c146_9ab5] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_18_CONST_REF_RD_uint1_t_uint1_t_20_0_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output := data_in_valid_regs(0);

     -- FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_17_CONST_REF_RD_uint1_t_uint1_t_20_1_d41d[rmii_eth_mac_h_l114_c146_9ab5] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_17_CONST_REF_RD_uint1_t_uint1_t_20_1_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output := data_in_valid_regs(1);

     -- FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_13_CONST_REF_RD_uint1_t_uint1_t_20_5_d41d[rmii_eth_mac_h_l114_c146_9ab5] LATENCY=0
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_13_CONST_REF_RD_uint1_t_uint1_t_20_5_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output := data_in_valid_regs(5);

     -- Submodule level 1
     VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l75_c7_fe0e_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l75_c7_fe0e_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l98_c5_378d_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue := VAR_BIN_OP_EQ_rmii_eth_mac_h_l43_c22_65f5_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l48_c3_8539_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l48_c3_8539_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l48_c3_8539_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_8539_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l48_c6_af7f_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l59_c8_be03_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l59_c8_be03_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l59_c8_be03_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l59_c8_be03_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l59_c11_3c2b_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l71_c8_03a4_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l71_c8_03a4_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l71_c8_03a4_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l71_c11_47da_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l93_c8_045f_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l93_c11_5647_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l99_c7_577b_cond := VAR_BIN_OP_EQ_rmii_eth_mac_h_l99_c10_341d_return_output;
     VAR_byte_counter_rmii_eth_mac_h_l103_c9_3468 := resize(VAR_BIN_OP_PLUS_rmii_eth_mac_h_l103_c9_214a_return_output, 2);
     VAR_bit_counter_rmii_eth_mac_h_l108_c7_7450 := resize(VAR_BIN_OP_PLUS_rmii_eth_mac_h_l108_c7_f1a0_return_output, 3);
     VAR_bit_counter_rmii_eth_mac_h_l89_c9_5b45 := resize(VAR_BIN_OP_PLUS_rmii_eth_mac_h_l89_c9_a97e_return_output, 3);
     VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_left := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_1ce0_return_output;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff_left := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_1ce0_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_1ce0_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_1ce0_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_1ce0_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_1ce0_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond := VAR_CONST_REF_RD_uint1_t_uint1_t_20_19_d41d_rmii_eth_mac_h_l35_c35_1ce0_return_output;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_5a3d_left := VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_5db7_return_output;
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_8494_left := VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_5db7_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_cond := VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_c799_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l82_c9_b835_cond := VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_c799_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l82_c9_b835_cond := VAR_UNARY_OP_NOT_rmii_eth_mac_h_l82_c13_c799_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iffalse := VAR_bit_counter_rmii_eth_mac_h_l108_c7_7450;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_iffalse := VAR_bit_counter_rmii_eth_mac_h_l89_c9_5b45;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_iffalse := VAR_byte_counter_rmii_eth_mac_h_l103_c9_3468;
     -- byte_counter_MUX[rmii_eth_mac_h_l99_c7_577b] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_cond;
     byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_return_output := byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_return_output;

     -- state_MUX[rmii_eth_mac_h_l82_c9_b835] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l82_c9_b835_cond <= VAR_state_MUX_rmii_eth_mac_h_l82_c9_b835_cond;
     state_MUX_rmii_eth_mac_h_l82_c9_b835_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l82_c9_b835_iftrue;
     state_MUX_rmii_eth_mac_h_l82_c9_b835_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l82_c9_b835_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l82_c9_b835_return_output := state_MUX_rmii_eth_mac_h_l82_c9_b835_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l82_c9_b835] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_cond;
     bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_return_output := bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_return_output;

     -- uint2_uint6[rmii_eth_mac_h_l73_c22_d163] LATENCY=0
     VAR_uint2_uint6_rmii_eth_mac_h_l73_c22_d163_return_output := uint2_uint6(
     VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_5db7_return_output,
     VAR_uint8_7_2_rmii_eth_mac_h_l73_c50_8108_return_output);

     -- bit_counter_MUX[rmii_eth_mac_h_l98_c5_378d] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_cond;
     bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_return_output := bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_return_output;

     -- data_out_reg_MUX[rmii_eth_mac_h_l93_c8_045f] LATENCY=0
     -- Inputs
     data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_cond <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_cond;
     data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue;
     data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse;
     -- Outputs
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_return_output := data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_return_output;

     -- state_MUX[rmii_eth_mac_h_l99_c7_577b] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l99_c7_577b_cond <= VAR_state_MUX_rmii_eth_mac_h_l99_c7_577b_cond;
     state_MUX_rmii_eth_mac_h_l99_c7_577b_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l99_c7_577b_iftrue;
     state_MUX_rmii_eth_mac_h_l99_c7_577b_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l99_c7_577b_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l99_c7_577b_return_output := state_MUX_rmii_eth_mac_h_l99_c7_577b_return_output;

     -- BIN_OP_EQ[rmii_eth_mac_h_l45_c48_8494] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l45_c48_8494_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_8494_left;
     BIN_OP_EQ_rmii_eth_mac_h_l45_c48_8494_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_8494_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_8494_return_output := BIN_OP_EQ_rmii_eth_mac_h_l45_c48_8494_return_output;

     -- last_MUX[rmii_eth_mac_h_l82_c9_b835] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l82_c9_b835_cond <= VAR_last_MUX_rmii_eth_mac_h_l82_c9_b835_cond;
     last_MUX_rmii_eth_mac_h_l82_c9_b835_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l82_c9_b835_iftrue;
     last_MUX_rmii_eth_mac_h_l82_c9_b835_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l82_c9_b835_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l82_c9_b835_return_output := last_MUX_rmii_eth_mac_h_l82_c9_b835_return_output;

     -- uint2_uint30[rmii_eth_mac_h_l96_c15_c654] LATENCY=0
     VAR_uint2_uint30_rmii_eth_mac_h_l96_c15_c654_return_output := uint2_uint30(
     VAR_CONST_REF_RD_uint2_t_uint2_t_20_19_d41d_rmii_eth_mac_h_l34_c29_5db7_return_output,
     resize(VAR_CONST_SR_2_rmii_eth_mac_h_l96_c44_8279_return_output, 30));

     -- BIN_OP_EQ[rmii_eth_mac_h_l44_c53_5a3d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_rmii_eth_mac_h_l44_c53_5a3d_left <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_5a3d_left;
     BIN_OP_EQ_rmii_eth_mac_h_l44_c53_5a3d_right <= VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_5a3d_right;
     -- Outputs
     VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_5a3d_return_output := BIN_OP_EQ_rmii_eth_mac_h_l44_c53_5a3d_return_output;

     -- valid_MUX[rmii_eth_mac_h_l72_c5_5d9d] LATENCY=0
     -- Inputs
     valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond <= VAR_valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond;
     valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue <= VAR_valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue;
     valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse <= VAR_valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse;
     -- Outputs
     VAR_valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output := valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output;

     -- data_in_regs_CONST_REF_RD_uint2_t_20_uint2_t_20_a609[rmii_eth_mac_h_l17_c15_26d8] LATENCY=0
     VAR_data_in_regs_CONST_REF_RD_uint2_t_20_uint2_t_20_a609_rmii_eth_mac_h_l17_c15_26d8_return_output := CONST_REF_RD_uint2_t_20_uint2_t_20_a609(
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_0_CONST_REF_RD_uint2_t_uint2_t_20_18_d41d_rmii_eth_mac_h_l113_c140_5037_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_1_CONST_REF_RD_uint2_t_uint2_t_20_17_d41d_rmii_eth_mac_h_l113_c140_5037_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_2_CONST_REF_RD_uint2_t_uint2_t_20_16_d41d_rmii_eth_mac_h_l113_c140_5037_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_3_CONST_REF_RD_uint2_t_uint2_t_20_15_d41d_rmii_eth_mac_h_l113_c140_5037_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_4_CONST_REF_RD_uint2_t_uint2_t_20_14_d41d_rmii_eth_mac_h_l113_c140_5037_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_5_CONST_REF_RD_uint2_t_uint2_t_20_13_d41d_rmii_eth_mac_h_l113_c140_5037_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_6_CONST_REF_RD_uint2_t_uint2_t_20_12_d41d_rmii_eth_mac_h_l113_c140_5037_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_7_CONST_REF_RD_uint2_t_uint2_t_20_11_d41d_rmii_eth_mac_h_l113_c140_5037_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_8_CONST_REF_RD_uint2_t_uint2_t_20_10_d41d_rmii_eth_mac_h_l113_c140_5037_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_9_CONST_REF_RD_uint2_t_uint2_t_20_9_d41d_rmii_eth_mac_h_l113_c140_5037_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_10_CONST_REF_RD_uint2_t_uint2_t_20_8_d41d_rmii_eth_mac_h_l113_c140_5037_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_11_CONST_REF_RD_uint2_t_uint2_t_20_7_d41d_rmii_eth_mac_h_l113_c140_5037_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_12_CONST_REF_RD_uint2_t_uint2_t_20_6_d41d_rmii_eth_mac_h_l113_c140_5037_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_13_CONST_REF_RD_uint2_t_uint2_t_20_5_d41d_rmii_eth_mac_h_l113_c140_5037_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_14_CONST_REF_RD_uint2_t_uint2_t_20_4_d41d_rmii_eth_mac_h_l113_c140_5037_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_15_CONST_REF_RD_uint2_t_uint2_t_20_3_d41d_rmii_eth_mac_h_l113_c140_5037_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_16_CONST_REF_RD_uint2_t_uint2_t_20_2_d41d_rmii_eth_mac_h_l113_c140_5037_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_17_CONST_REF_RD_uint2_t_uint2_t_20_1_d41d_rmii_eth_mac_h_l113_c140_5037_return_output,
     VAR_FOR_rmii_eth_mac_h_l113_c30_445a_ITER_18_CONST_REF_RD_uint2_t_uint2_t_20_0_d41d_rmii_eth_mac_h_l113_c140_5037_return_output,
     VAR_data_in);

     -- data_in_valid_regs_CONST_REF_RD_uint1_t_20_uint1_t_20_a609[rmii_eth_mac_h_l17_c15_26d8] LATENCY=0
     VAR_data_in_valid_regs_CONST_REF_RD_uint1_t_20_uint1_t_20_a609_rmii_eth_mac_h_l17_c15_26d8_return_output := CONST_REF_RD_uint1_t_20_uint1_t_20_a609(
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_0_CONST_REF_RD_uint1_t_uint1_t_20_18_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_1_CONST_REF_RD_uint1_t_uint1_t_20_17_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_2_CONST_REF_RD_uint1_t_uint1_t_20_16_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_3_CONST_REF_RD_uint1_t_uint1_t_20_15_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_4_CONST_REF_RD_uint1_t_uint1_t_20_14_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_5_CONST_REF_RD_uint1_t_uint1_t_20_13_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_6_CONST_REF_RD_uint1_t_uint1_t_20_12_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_7_CONST_REF_RD_uint1_t_uint1_t_20_11_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_8_CONST_REF_RD_uint1_t_uint1_t_20_10_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_9_CONST_REF_RD_uint1_t_uint1_t_20_9_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_10_CONST_REF_RD_uint1_t_uint1_t_20_8_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_11_CONST_REF_RD_uint1_t_uint1_t_20_7_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_12_CONST_REF_RD_uint1_t_uint1_t_20_6_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_13_CONST_REF_RD_uint1_t_uint1_t_20_5_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_14_CONST_REF_RD_uint1_t_uint1_t_20_4_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_15_CONST_REF_RD_uint1_t_uint1_t_20_3_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_16_CONST_REF_RD_uint1_t_uint1_t_20_2_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_17_CONST_REF_RD_uint1_t_uint1_t_20_1_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output,
     VAR_FOR_rmii_eth_mac_h_l114_c30_ee11_ITER_18_CONST_REF_RD_uint1_t_uint1_t_20_0_d41d_rmii_eth_mac_h_l114_c146_9ab5_return_output,
     VAR_data_in_valid);

     -- Submodule level 2
     VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_right := VAR_BIN_OP_EQ_rmii_eth_mac_h_l44_c53_5a3d_return_output;
     VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff_right := VAR_BIN_OP_EQ_rmii_eth_mac_h_l45_c48_8494_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l82_c9_b835_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l98_c5_378d_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iftrue := VAR_byte_counter_MUX_rmii_eth_mac_h_l99_c7_577b_return_output;
     REG_VAR_data_in_regs := VAR_data_in_regs_CONST_REF_RD_uint2_t_20_uint2_t_20_a609_rmii_eth_mac_h_l17_c15_26d8_return_output;
     REG_VAR_data_in_valid_regs := VAR_data_in_valid_regs_CONST_REF_RD_uint1_t_20_uint1_t_20_a609_rmii_eth_mac_h_l17_c15_26d8_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse := VAR_data_out_reg_MUX_rmii_eth_mac_h_l93_c8_045f_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l75_c7_fe0e_iftrue := VAR_last_MUX_rmii_eth_mac_h_l82_c9_b835_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l75_c7_fe0e_iftrue := VAR_state_MUX_rmii_eth_mac_h_l82_c9_b835_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l98_c5_378d_iftrue := VAR_state_MUX_rmii_eth_mac_h_l99_c7_577b_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue := VAR_uint2_uint30_rmii_eth_mac_h_l96_c15_c654_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue := VAR_uint2_uint6_rmii_eth_mac_h_l73_c22_d163_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue := VAR_valid_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output;
     -- fcs_reg_MUX[rmii_eth_mac_h_l93_c8_045f] LATENCY=0
     -- Inputs
     fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_cond <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_cond;
     fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue;
     fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse;
     -- Outputs
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_return_output := fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l93_c8_045f] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_cond;
     bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_return_output := bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_return_output;

     -- BIN_OP_AND[rmii_eth_mac_h_l44_c28_5bd6] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_left;
     BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_return_output := BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_return_output;

     -- byte_counter_MUX[rmii_eth_mac_h_l98_c5_378d] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_cond;
     byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_return_output := byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_return_output;

     -- valid_MUX[rmii_eth_mac_h_l71_c8_03a4] LATENCY=0
     -- Inputs
     valid_MUX_rmii_eth_mac_h_l71_c8_03a4_cond <= VAR_valid_MUX_rmii_eth_mac_h_l71_c8_03a4_cond;
     valid_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue <= VAR_valid_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue;
     valid_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse <= VAR_valid_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse;
     -- Outputs
     VAR_valid_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output := valid_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output;

     -- last_MUX[rmii_eth_mac_h_l75_c7_fe0e] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l75_c7_fe0e_cond <= VAR_last_MUX_rmii_eth_mac_h_l75_c7_fe0e_cond;
     last_MUX_rmii_eth_mac_h_l75_c7_fe0e_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l75_c7_fe0e_iftrue;
     last_MUX_rmii_eth_mac_h_l75_c7_fe0e_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l75_c7_fe0e_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l75_c7_fe0e_return_output := last_MUX_rmii_eth_mac_h_l75_c7_fe0e_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l75_c7_fe0e] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_cond;
     bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_return_output := bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_return_output;

     -- state_MUX[rmii_eth_mac_h_l75_c7_fe0e] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l75_c7_fe0e_cond <= VAR_state_MUX_rmii_eth_mac_h_l75_c7_fe0e_cond;
     state_MUX_rmii_eth_mac_h_l75_c7_fe0e_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l75_c7_fe0e_iftrue;
     state_MUX_rmii_eth_mac_h_l75_c7_fe0e_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l75_c7_fe0e_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l75_c7_fe0e_return_output := state_MUX_rmii_eth_mac_h_l75_c7_fe0e_return_output;

     -- BIN_OP_AND[rmii_eth_mac_h_l45_c23_91ff] LATENCY=0
     -- Inputs
     BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff_left <= VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff_left;
     BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff_right <= VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff_right;
     -- Outputs
     VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff_return_output := BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff_return_output;

     -- data_out_reg_MUX[rmii_eth_mac_h_l72_c5_5d9d] LATENCY=0
     -- Inputs
     data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond;
     data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue;
     data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse;
     -- Outputs
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output := data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output;

     -- state_MUX[rmii_eth_mac_h_l98_c5_378d] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l98_c5_378d_cond <= VAR_state_MUX_rmii_eth_mac_h_l98_c5_378d_cond;
     state_MUX_rmii_eth_mac_h_l98_c5_378d_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l98_c5_378d_iftrue;
     state_MUX_rmii_eth_mac_h_l98_c5_378d_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l98_c5_378d_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l98_c5_378d_return_output := state_MUX_rmii_eth_mac_h_l98_c5_378d_return_output;

     -- Submodule level 3
     VAR_err_MUX_rmii_eth_mac_h_l54_c5_465c_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l60_c5_b797_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l54_c5_465c_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l60_c5_b797_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l44_c28_5bd6_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l63_c10_929c_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l63_c10_929c_cond := VAR_BIN_OP_AND_rmii_eth_mac_h_l45_c23_91ff_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l75_c7_fe0e_return_output;
     VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l93_c8_045f_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue := VAR_byte_counter_MUX_rmii_eth_mac_h_l98_c5_378d_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue := VAR_data_out_reg_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse := VAR_fcs_reg_MUX_rmii_eth_mac_h_l93_c8_045f_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue := VAR_last_MUX_rmii_eth_mac_h_l75_c7_fe0e_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue := VAR_state_MUX_rmii_eth_mac_h_l75_c7_fe0e_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue := VAR_state_MUX_rmii_eth_mac_h_l98_c5_378d_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse := VAR_valid_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output;
     -- state_MUX[rmii_eth_mac_h_l93_c8_045f] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l93_c8_045f_cond <= VAR_state_MUX_rmii_eth_mac_h_l93_c8_045f_cond;
     state_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue;
     state_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l93_c8_045f_return_output := state_MUX_rmii_eth_mac_h_l93_c8_045f_return_output;

     -- err_MUX[rmii_eth_mac_h_l54_c5_465c] LATENCY=0
     -- Inputs
     err_MUX_rmii_eth_mac_h_l54_c5_465c_cond <= VAR_err_MUX_rmii_eth_mac_h_l54_c5_465c_cond;
     err_MUX_rmii_eth_mac_h_l54_c5_465c_iftrue <= VAR_err_MUX_rmii_eth_mac_h_l54_c5_465c_iftrue;
     err_MUX_rmii_eth_mac_h_l54_c5_465c_iffalse <= VAR_err_MUX_rmii_eth_mac_h_l54_c5_465c_iffalse;
     -- Outputs
     VAR_err_MUX_rmii_eth_mac_h_l54_c5_465c_return_output := err_MUX_rmii_eth_mac_h_l54_c5_465c_return_output;

     -- state_MUX[rmii_eth_mac_h_l54_c5_465c] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l54_c5_465c_cond <= VAR_state_MUX_rmii_eth_mac_h_l54_c5_465c_cond;
     state_MUX_rmii_eth_mac_h_l54_c5_465c_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l54_c5_465c_iftrue;
     state_MUX_rmii_eth_mac_h_l54_c5_465c_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l54_c5_465c_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l54_c5_465c_return_output := state_MUX_rmii_eth_mac_h_l54_c5_465c_return_output;

     -- valid_MUX[rmii_eth_mac_h_l59_c8_be03] LATENCY=0
     -- Inputs
     valid_MUX_rmii_eth_mac_h_l59_c8_be03_cond <= VAR_valid_MUX_rmii_eth_mac_h_l59_c8_be03_cond;
     valid_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue <= VAR_valid_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue;
     valid_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse <= VAR_valid_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse;
     -- Outputs
     VAR_valid_MUX_rmii_eth_mac_h_l59_c8_be03_return_output := valid_MUX_rmii_eth_mac_h_l59_c8_be03_return_output;

     -- state_MUX[rmii_eth_mac_h_l63_c10_929c] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l63_c10_929c_cond <= VAR_state_MUX_rmii_eth_mac_h_l63_c10_929c_cond;
     state_MUX_rmii_eth_mac_h_l63_c10_929c_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l63_c10_929c_iftrue;
     state_MUX_rmii_eth_mac_h_l63_c10_929c_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l63_c10_929c_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l63_c10_929c_return_output := state_MUX_rmii_eth_mac_h_l63_c10_929c_return_output;

     -- last_MUX[rmii_eth_mac_h_l72_c5_5d9d] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond <= VAR_last_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond;
     last_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue;
     last_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output := last_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output;

     -- state_MUX[rmii_eth_mac_h_l72_c5_5d9d] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond <= VAR_state_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond;
     state_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue;
     state_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output := state_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l72_c5_5d9d] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_cond;
     bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output := bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output;

     -- err_MUX[rmii_eth_mac_h_l63_c10_929c] LATENCY=0
     -- Inputs
     err_MUX_rmii_eth_mac_h_l63_c10_929c_cond <= VAR_err_MUX_rmii_eth_mac_h_l63_c10_929c_cond;
     err_MUX_rmii_eth_mac_h_l63_c10_929c_iftrue <= VAR_err_MUX_rmii_eth_mac_h_l63_c10_929c_iftrue;
     err_MUX_rmii_eth_mac_h_l63_c10_929c_iffalse <= VAR_err_MUX_rmii_eth_mac_h_l63_c10_929c_iffalse;
     -- Outputs
     VAR_err_MUX_rmii_eth_mac_h_l63_c10_929c_return_output := err_MUX_rmii_eth_mac_h_l63_c10_929c_return_output;

     -- byte_counter_MUX[rmii_eth_mac_h_l93_c8_045f] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_cond;
     byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_return_output := byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_return_output;

     -- fcs_reg_MUX[rmii_eth_mac_h_l71_c8_03a4] LATENCY=0
     -- Inputs
     fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_cond <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_cond;
     fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue;
     fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse;
     -- Outputs
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output := fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output;

     -- data_out_reg_MUX[rmii_eth_mac_h_l71_c8_03a4] LATENCY=0
     -- Inputs
     data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_cond <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_cond;
     data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue;
     data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse;
     -- Outputs
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output := data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output;

     -- Submodule level 4
     VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue := VAR_bit_counter_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse := VAR_byte_counter_MUX_rmii_eth_mac_h_l93_c8_045f_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse := VAR_data_out_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue := VAR_err_MUX_rmii_eth_mac_h_l54_c5_465c_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l60_c5_b797_iffalse := VAR_err_MUX_rmii_eth_mac_h_l63_c10_929c_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse := VAR_fcs_reg_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue := VAR_last_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue := VAR_state_MUX_rmii_eth_mac_h_l54_c5_465c_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l60_c5_b797_iffalse := VAR_state_MUX_rmii_eth_mac_h_l63_c10_929c_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue := VAR_state_MUX_rmii_eth_mac_h_l72_c5_5d9d_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse := VAR_state_MUX_rmii_eth_mac_h_l93_c8_045f_return_output;
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse := VAR_valid_MUX_rmii_eth_mac_h_l59_c8_be03_return_output;
     -- byte_counter_MUX[rmii_eth_mac_h_l71_c8_03a4] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_cond;
     byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output := byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l71_c8_03a4] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_cond;
     bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output := bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output;

     -- err_MUX[rmii_eth_mac_h_l60_c5_b797] LATENCY=0
     -- Inputs
     err_MUX_rmii_eth_mac_h_l60_c5_b797_cond <= VAR_err_MUX_rmii_eth_mac_h_l60_c5_b797_cond;
     err_MUX_rmii_eth_mac_h_l60_c5_b797_iftrue <= VAR_err_MUX_rmii_eth_mac_h_l60_c5_b797_iftrue;
     err_MUX_rmii_eth_mac_h_l60_c5_b797_iffalse <= VAR_err_MUX_rmii_eth_mac_h_l60_c5_b797_iffalse;
     -- Outputs
     VAR_err_MUX_rmii_eth_mac_h_l60_c5_b797_return_output := err_MUX_rmii_eth_mac_h_l60_c5_b797_return_output;

     -- state_MUX[rmii_eth_mac_h_l71_c8_03a4] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l71_c8_03a4_cond <= VAR_state_MUX_rmii_eth_mac_h_l71_c8_03a4_cond;
     state_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue;
     state_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output := state_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output;

     -- last_MUX[rmii_eth_mac_h_l71_c8_03a4] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l71_c8_03a4_cond <= VAR_last_MUX_rmii_eth_mac_h_l71_c8_03a4_cond;
     last_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l71_c8_03a4_iftrue;
     last_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l71_c8_03a4_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output := last_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output;

     -- valid_MUX[rmii_eth_mac_h_l48_c3_8539] LATENCY=0
     -- Inputs
     valid_MUX_rmii_eth_mac_h_l48_c3_8539_cond <= VAR_valid_MUX_rmii_eth_mac_h_l48_c3_8539_cond;
     valid_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue <= VAR_valid_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue;
     valid_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse <= VAR_valid_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse;
     -- Outputs
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_8539_return_output := valid_MUX_rmii_eth_mac_h_l48_c3_8539_return_output;

     -- data_out_reg_MUX[rmii_eth_mac_h_l59_c8_be03] LATENCY=0
     -- Inputs
     data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_cond <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_cond;
     data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue;
     data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse;
     -- Outputs
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_return_output := data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_return_output;

     -- state_MUX[rmii_eth_mac_h_l60_c5_b797] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l60_c5_b797_cond <= VAR_state_MUX_rmii_eth_mac_h_l60_c5_b797_cond;
     state_MUX_rmii_eth_mac_h_l60_c5_b797_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l60_c5_b797_iftrue;
     state_MUX_rmii_eth_mac_h_l60_c5_b797_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l60_c5_b797_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l60_c5_b797_return_output := state_MUX_rmii_eth_mac_h_l60_c5_b797_return_output;

     -- fcs_reg_MUX[rmii_eth_mac_h_l59_c8_be03] LATENCY=0
     -- Inputs
     fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_cond <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_cond;
     fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue;
     fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse;
     -- Outputs
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_return_output := fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_return_output;

     -- Submodule level 5
     VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse := VAR_byte_counter_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output;
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse := VAR_data_out_reg_MUX_rmii_eth_mac_h_l59_c8_be03_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue := VAR_err_MUX_rmii_eth_mac_h_l60_c5_b797_return_output;
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse := VAR_fcs_reg_MUX_rmii_eth_mac_h_l59_c8_be03_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse := VAR_last_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue := VAR_state_MUX_rmii_eth_mac_h_l60_c5_b797_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse := VAR_state_MUX_rmii_eth_mac_h_l71_c8_03a4_return_output;
     -- state_MUX[rmii_eth_mac_h_l59_c8_be03] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l59_c8_be03_cond <= VAR_state_MUX_rmii_eth_mac_h_l59_c8_be03_cond;
     state_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue;
     state_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l59_c8_be03_return_output := state_MUX_rmii_eth_mac_h_l59_c8_be03_return_output;

     -- data_out_reg_MUX[rmii_eth_mac_h_l48_c3_8539] LATENCY=0
     -- Inputs
     data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_cond <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_cond;
     data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue;
     data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse <= VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse;
     -- Outputs
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_return_output := data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_return_output;

     -- last_MUX[rmii_eth_mac_h_l59_c8_be03] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l59_c8_be03_cond <= VAR_last_MUX_rmii_eth_mac_h_l59_c8_be03_cond;
     last_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue;
     last_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l59_c8_be03_return_output := last_MUX_rmii_eth_mac_h_l59_c8_be03_return_output;

     -- fcs_reg_MUX[rmii_eth_mac_h_l48_c3_8539] LATENCY=0
     -- Inputs
     fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_cond <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_cond;
     fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue;
     fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse <= VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse;
     -- Outputs
     VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_return_output := fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_return_output;

     -- err_MUX[rmii_eth_mac_h_l59_c8_be03] LATENCY=0
     -- Inputs
     err_MUX_rmii_eth_mac_h_l59_c8_be03_cond <= VAR_err_MUX_rmii_eth_mac_h_l59_c8_be03_cond;
     err_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue <= VAR_err_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue;
     err_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse <= VAR_err_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse;
     -- Outputs
     VAR_err_MUX_rmii_eth_mac_h_l59_c8_be03_return_output := err_MUX_rmii_eth_mac_h_l59_c8_be03_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l59_c8_be03] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_cond;
     bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_return_output := bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_return_output;

     -- byte_counter_MUX[rmii_eth_mac_h_l59_c8_be03] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_cond;
     byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_return_output := byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_return_output;

     -- Submodule level 6
     VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse := VAR_bit_counter_MUX_rmii_eth_mac_h_l59_c8_be03_return_output;
     VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse := VAR_byte_counter_MUX_rmii_eth_mac_h_l59_c8_be03_return_output;
     REG_VAR_data_out_reg := VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_return_output;
     VAR_err_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse := VAR_err_MUX_rmii_eth_mac_h_l59_c8_be03_return_output;
     REG_VAR_fcs_reg := VAR_fcs_reg_MUX_rmii_eth_mac_h_l48_c3_8539_return_output;
     VAR_last_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse := VAR_last_MUX_rmii_eth_mac_h_l59_c8_be03_return_output;
     VAR_state_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse := VAR_state_MUX_rmii_eth_mac_h_l59_c8_be03_return_output;
     -- last_MUX[rmii_eth_mac_h_l48_c3_8539] LATENCY=0
     -- Inputs
     last_MUX_rmii_eth_mac_h_l48_c3_8539_cond <= VAR_last_MUX_rmii_eth_mac_h_l48_c3_8539_cond;
     last_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue <= VAR_last_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue;
     last_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse <= VAR_last_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse;
     -- Outputs
     VAR_last_MUX_rmii_eth_mac_h_l48_c3_8539_return_output := last_MUX_rmii_eth_mac_h_l48_c3_8539_return_output;

     -- state_MUX[rmii_eth_mac_h_l48_c3_8539] LATENCY=0
     -- Inputs
     state_MUX_rmii_eth_mac_h_l48_c3_8539_cond <= VAR_state_MUX_rmii_eth_mac_h_l48_c3_8539_cond;
     state_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue <= VAR_state_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue;
     state_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse <= VAR_state_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse;
     -- Outputs
     VAR_state_MUX_rmii_eth_mac_h_l48_c3_8539_return_output := state_MUX_rmii_eth_mac_h_l48_c3_8539_return_output;

     -- byte_counter_MUX[rmii_eth_mac_h_l48_c3_8539] LATENCY=0
     -- Inputs
     byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_cond <= VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_cond;
     byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue <= VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue;
     byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse <= VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse;
     -- Outputs
     VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_return_output := byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_return_output;

     -- bit_counter_MUX[rmii_eth_mac_h_l48_c3_8539] LATENCY=0
     -- Inputs
     bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_cond <= VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_cond;
     bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue <= VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue;
     bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse <= VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse;
     -- Outputs
     VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_return_output := bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_return_output;

     -- err_MUX[rmii_eth_mac_h_l48_c3_8539] LATENCY=0
     -- Inputs
     err_MUX_rmii_eth_mac_h_l48_c3_8539_cond <= VAR_err_MUX_rmii_eth_mac_h_l48_c3_8539_cond;
     err_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue <= VAR_err_MUX_rmii_eth_mac_h_l48_c3_8539_iftrue;
     err_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse <= VAR_err_MUX_rmii_eth_mac_h_l48_c3_8539_iffalse;
     -- Outputs
     VAR_err_MUX_rmii_eth_mac_h_l48_c3_8539_return_output := err_MUX_rmii_eth_mac_h_l48_c3_8539_return_output;

     -- Submodule level 7
     REG_VAR_bit_counter := VAR_bit_counter_MUX_rmii_eth_mac_h_l48_c3_8539_return_output;
     REG_VAR_byte_counter := VAR_byte_counter_MUX_rmii_eth_mac_h_l48_c3_8539_return_output;
     REG_VAR_state := VAR_state_MUX_rmii_eth_mac_h_l48_c3_8539_return_output;
     -- CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4[rmii_eth_mac_h_l123_c10_635e] LATENCY=0
     VAR_CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4_rmii_eth_mac_h_l123_c10_635e_return_output := CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4(
     VAR_data_out_reg_MUX_rmii_eth_mac_h_l48_c3_8539_return_output,
     VAR_last_MUX_rmii_eth_mac_h_l48_c3_8539_return_output,
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_8539_return_output,
     VAR_valid_MUX_rmii_eth_mac_h_l48_c3_8539_return_output,
     VAR_err_MUX_rmii_eth_mac_h_l48_c3_8539_return_output);

     -- Submodule level 8
     VAR_return_output := VAR_CONST_REF_RD_rmii_rx_mac_t_rmii_rx_mac_t_48d4_rmii_eth_mac_h_l123_c10_635e_return_output;
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
