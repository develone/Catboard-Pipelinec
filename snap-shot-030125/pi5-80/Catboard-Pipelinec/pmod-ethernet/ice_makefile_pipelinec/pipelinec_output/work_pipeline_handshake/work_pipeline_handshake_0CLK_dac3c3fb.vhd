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
use work.global_wires_pkg.all;
-- Submodules: 9
entity work_pipeline_handshake_0CLK_dac3c3fb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 global_to_module : in work_pipeline_handshake_global_to_module_t;
 module_to_global : out work_pipeline_handshake_module_to_global_t);
end work_pipeline_handshake_0CLK_dac3c3fb;
architecture arch of work_pipeline_handshake_0CLK_dac3c3fb is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal fifo_count : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_fifo_count : unsigned(15 downto 0);

-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Each function instance gets signals
-- BIN_OP_LT[ethernet_top_c_l72_c87_a1d5]
signal BIN_OP_LT_ethernet_top_c_l72_c87_a1d5_left : unsigned(15 downto 0);
signal BIN_OP_LT_ethernet_top_c_l72_c87_a1d5_right : unsigned(2 downto 0);
signal BIN_OP_LT_ethernet_top_c_l72_c87_a1d5_return_output : unsigned(0 downto 0);

-- work_pipeline_FIFO[ethernet_top_c_l72_c443_a043]
signal work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_CLOCK_ENABLE : unsigned(0 downto 0);
signal work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_ready_for_data_out : unsigned(0 downto 0);
signal work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_data_in : work_outputs_t;
signal work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_data_in_valid : unsigned(0 downto 0);
signal work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_return_output : work_pipeline_FIFO_t;

-- fifo_count_MUX[ethernet_top_c_l72_c592_beb2]
signal fifo_count_MUX_ethernet_top_c_l72_c592_beb2_cond : unsigned(0 downto 0);
signal fifo_count_MUX_ethernet_top_c_l72_c592_beb2_iftrue : unsigned(15 downto 0);
signal fifo_count_MUX_ethernet_top_c_l72_c592_beb2_iffalse : unsigned(15 downto 0);
signal fifo_count_MUX_ethernet_top_c_l72_c592_beb2_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[ethernet_top_c_l72_c645_d94a]
signal BIN_OP_PLUS_ethernet_top_c_l72_c645_d94a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_ethernet_top_c_l72_c645_d94a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_ethernet_top_c_l72_c645_d94a_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[ethernet_top_c_l72_c667_9b42]
signal BIN_OP_AND_ethernet_top_c_l72_c667_9b42_left : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l72_c667_9b42_right : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l72_c667_9b42_return_output : unsigned(0 downto 0);

-- fifo_count_MUX[ethernet_top_c_l72_c664_be27]
signal fifo_count_MUX_ethernet_top_c_l72_c664_be27_cond : unsigned(0 downto 0);
signal fifo_count_MUX_ethernet_top_c_l72_c664_be27_iftrue : unsigned(15 downto 0);
signal fifo_count_MUX_ethernet_top_c_l72_c664_be27_iffalse : unsigned(15 downto 0);
signal fifo_count_MUX_ethernet_top_c_l72_c664_be27_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[ethernet_top_c_l72_c719_5455]
signal BIN_OP_MINUS_ethernet_top_c_l72_c719_5455_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_ethernet_top_c_l72_c719_5455_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_ethernet_top_c_l72_c719_5455_return_output : unsigned(15 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6
signal BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6_return_output : unsigned(0 downto 0);

function CONST_REF_RD_work_outputs_t_stream_t_work_outputs_t_stream_t_1095( ref_toks_0 : unsigned;
 ref_toks_1 : work_outputs_t) return work_outputs_t_stream_t is
 
  variable base : work_outputs_t_stream_t; 
  variable return_output : work_outputs_t_stream_t;
begin
      base.valid := ref_toks_0;
      base.data := ref_toks_1;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_LT_ethernet_top_c_l72_c87_a1d5 : 0 clocks latency
BIN_OP_LT_ethernet_top_c_l72_c87_a1d5 : entity work.BIN_OP_LT_uint16_t_uint3_t_0CLK_5af1a430 port map (
BIN_OP_LT_ethernet_top_c_l72_c87_a1d5_left,
BIN_OP_LT_ethernet_top_c_l72_c87_a1d5_right,
BIN_OP_LT_ethernet_top_c_l72_c87_a1d5_return_output);

-- work_pipeline_FIFO_ethernet_top_c_l72_c443_a043 : 0 clocks latency
work_pipeline_FIFO_ethernet_top_c_l72_c443_a043 : entity work.work_pipeline_FIFO_0CLK_b45f1687 port map (
clk,
work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_CLOCK_ENABLE,
work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_ready_for_data_out,
work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_data_in,
work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_data_in_valid,
work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_return_output);

-- fifo_count_MUX_ethernet_top_c_l72_c592_beb2 : 0 clocks latency
fifo_count_MUX_ethernet_top_c_l72_c592_beb2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fifo_count_MUX_ethernet_top_c_l72_c592_beb2_cond,
fifo_count_MUX_ethernet_top_c_l72_c592_beb2_iftrue,
fifo_count_MUX_ethernet_top_c_l72_c592_beb2_iffalse,
fifo_count_MUX_ethernet_top_c_l72_c592_beb2_return_output);

-- BIN_OP_PLUS_ethernet_top_c_l72_c645_d94a : 0 clocks latency
BIN_OP_PLUS_ethernet_top_c_l72_c645_d94a : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_ethernet_top_c_l72_c645_d94a_left,
BIN_OP_PLUS_ethernet_top_c_l72_c645_d94a_right,
BIN_OP_PLUS_ethernet_top_c_l72_c645_d94a_return_output);

-- BIN_OP_AND_ethernet_top_c_l72_c667_9b42 : 0 clocks latency
BIN_OP_AND_ethernet_top_c_l72_c667_9b42 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_ethernet_top_c_l72_c667_9b42_left,
BIN_OP_AND_ethernet_top_c_l72_c667_9b42_right,
BIN_OP_AND_ethernet_top_c_l72_c667_9b42_return_output);

-- fifo_count_MUX_ethernet_top_c_l72_c664_be27 : 0 clocks latency
fifo_count_MUX_ethernet_top_c_l72_c664_be27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
fifo_count_MUX_ethernet_top_c_l72_c664_be27_cond,
fifo_count_MUX_ethernet_top_c_l72_c664_be27_iftrue,
fifo_count_MUX_ethernet_top_c_l72_c664_be27_iffalse,
fifo_count_MUX_ethernet_top_c_l72_c664_be27_return_output);

-- BIN_OP_MINUS_ethernet_top_c_l72_c719_5455 : 0 clocks latency
BIN_OP_MINUS_ethernet_top_c_l72_c719_5455 : entity work.BIN_OP_MINUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_ethernet_top_c_l72_c719_5455_left,
BIN_OP_MINUS_ethernet_top_c_l72_c719_5455_right,
BIN_OP_MINUS_ethernet_top_c_l72_c719_5455_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6 : 0 clocks latency
BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6_left,
BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6_right,
BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6_return_output);



-- Resolve what clock enable to use for user logic
clk_en_internal <= CLOCK_ENABLE(0);
-- Combinatorial process for pipeline stages
process (
CLOCK_ENABLE,
clk_en_internal,
 -- Registers
 fifo_count,
 -- Clock cross input
 global_to_module,
 -- All submodule outputs
 BIN_OP_LT_ethernet_top_c_l72_c87_a1d5_return_output,
 work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_return_output,
 fifo_count_MUX_ethernet_top_c_l72_c592_beb2_return_output,
 BIN_OP_PLUS_ethernet_top_c_l72_c645_d94a_return_output,
 BIN_OP_AND_ethernet_top_c_l72_c667_9b42_return_output,
 fifo_count_MUX_ethernet_top_c_l72_c664_be27_return_output,
 BIN_OP_MINUS_ethernet_top_c_l72_c719_5455_return_output,
 BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_work_pipeline_in_ready : unsigned(0 downto 0);
 variable VAR_work_pipeline_no_handshake_in_valid : unsigned(0 downto 0);
 variable VAR_work_pipeline_in : work_inputs_t_stream_t;
 variable VAR_work_pipeline_no_handshake_in : work_inputs_t;
 variable VAR_work_pipeline_no_handshake_out_valid : unsigned(0 downto 0);
 variable VAR_work_pipeline_no_handshake_out : work_outputs_t;
 variable VAR_work_pipeline_out_ready : unsigned(0 downto 0);
 variable VAR_work_pipeline_out : work_outputs_t_stream_t;
 variable VAR_BIN_OP_LT_ethernet_top_c_l72_c87_a1d5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_ethernet_top_c_l72_c87_a1d5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_LT_ethernet_top_c_l72_c87_a1d5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_work_inputs_t_work_inputs_t_stream_t_data_d41d_ethernet_top_c_l72_c223_b10b_return_output : work_inputs_t;
 variable VAR_fifo_wr_en : unsigned(0 downto 0);
 variable VAR_fifo_wr_data : work_outputs_t;
 variable VAR_fifo_rd_en : unsigned(0 downto 0);
 variable VAR_fifo_o : work_pipeline_FIFO_t;
 variable VAR_work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_ready_for_data_out : unsigned(0 downto 0);
 variable VAR_work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_data_in : work_outputs_t;
 variable VAR_work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_data_in_valid : unsigned(0 downto 0);
 variable VAR_work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_return_output : work_pipeline_FIFO_t;
 variable VAR_CONST_REF_RD_uint1_t_work_pipeline_FIFO_t_data_out_valid_d41d_ethernet_top_c_l72_c527_be3b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_work_outputs_t_work_pipeline_FIFO_t_data_out_d41d_ethernet_top_c_l72_c575_645f_return_output : work_outputs_t;
 variable VAR_fifo_count_MUX_ethernet_top_c_l72_c592_beb2_iftrue : unsigned(15 downto 0);
 variable VAR_fifo_count_ethernet_top_c_l72_c645_1b9d : unsigned(15 downto 0);
 variable VAR_fifo_count_MUX_ethernet_top_c_l72_c592_beb2_iffalse : unsigned(15 downto 0);
 variable VAR_fifo_count_MUX_ethernet_top_c_l72_c592_beb2_return_output : unsigned(15 downto 0);
 variable VAR_fifo_count_MUX_ethernet_top_c_l72_c592_beb2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_ethernet_top_c_l72_c645_d94a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_ethernet_top_c_l72_c645_d94a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_ethernet_top_c_l72_c645_d94a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l72_c667_9b42_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l72_c667_9b42_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l72_c667_9b42_return_output : unsigned(0 downto 0);
 variable VAR_fifo_count_MUX_ethernet_top_c_l72_c664_be27_iftrue : unsigned(15 downto 0);
 variable VAR_fifo_count_MUX_ethernet_top_c_l72_c664_be27_iffalse : unsigned(15 downto 0);
 variable VAR_fifo_count_MUX_ethernet_top_c_l72_c664_be27_return_output : unsigned(15 downto 0);
 variable VAR_fifo_count_MUX_ethernet_top_c_l72_c664_be27_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_ethernet_top_c_l72_c719_5455_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_ethernet_top_c_l72_c719_5455_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_ethernet_top_c_l72_c719_5455_return_output : unsigned(15 downto 0);
 variable VAR_work_pipeline_out_CONST_REF_RD_work_outputs_t_stream_t_work_outputs_t_stream_t_1095_ethernet_top_c_l72_c6_e88f_return_output : work_outputs_t_stream_t;
 variable VAR_CONST_REF_RD_uint1_t_work_inputs_t_stream_t_valid_d41d_ethernet_top_c_l72_DUPLICATE_0a38_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_fifo_count : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_fifo_count := fifo_count;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_ethernet_top_c_l72_c645_d94a_right := to_unsigned(1, 1);
     VAR_BIN_OP_MINUS_ethernet_top_c_l72_c719_5455_right := to_unsigned(1, 1);
     VAR_BIN_OP_LT_ethernet_top_c_l72_c87_a1d5_right := to_unsigned(4, 3);
 -- Reads from global variables
     VAR_work_pipeline_in := global_to_module.work_pipeline_in;
     VAR_work_pipeline_no_handshake_out_valid := global_to_module.work_pipeline_no_handshake_out_valid;
     VAR_work_pipeline_no_handshake_out := global_to_module.work_pipeline_no_handshake_out;
     VAR_work_pipeline_out_ready := global_to_module.work_pipeline_out_ready;
     -- Submodule level 0
     VAR_work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_ready_for_data_out := VAR_work_pipeline_out_ready;
     VAR_BIN_OP_AND_ethernet_top_c_l72_c667_9b42_right := VAR_work_pipeline_out_ready;
     VAR_work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_data_in := VAR_work_pipeline_no_handshake_out;
     VAR_work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_data_in_valid := VAR_work_pipeline_no_handshake_out_valid;
     -- CONST_REF_RD_work_inputs_t_work_inputs_t_stream_t_data_d41d[ethernet_top_c_l72_c223_b10b] LATENCY=0
     VAR_CONST_REF_RD_work_inputs_t_work_inputs_t_stream_t_data_d41d_ethernet_top_c_l72_c223_b10b_return_output := VAR_work_pipeline_in.data;

     -- CONST_REF_RD_uint1_t_work_inputs_t_stream_t_valid_d41d_ethernet_top_c_l72_DUPLICATE_0a38 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_work_inputs_t_stream_t_valid_d41d_ethernet_top_c_l72_DUPLICATE_0a38_return_output := VAR_work_pipeline_in.valid;

     -- Submodule level 1
     VAR_work_pipeline_no_handshake_in := VAR_CONST_REF_RD_work_inputs_t_work_inputs_t_stream_t_data_d41d_ethernet_top_c_l72_c223_b10b_return_output;
     VAR_BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6_left := VAR_CONST_REF_RD_uint1_t_work_inputs_t_stream_t_valid_d41d_ethernet_top_c_l72_DUPLICATE_0a38_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;

     -- Submodule level 0
     VAR_work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_LT_ethernet_top_c_l72_c87_a1d5_left := fifo_count;
     VAR_BIN_OP_PLUS_ethernet_top_c_l72_c645_d94a_left := fifo_count;
     VAR_fifo_count_MUX_ethernet_top_c_l72_c592_beb2_iffalse := fifo_count;
     -- work_pipeline_FIFO[ethernet_top_c_l72_c443_a043] LATENCY=0
     -- Clock enable
     work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_CLOCK_ENABLE <= VAR_work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_CLOCK_ENABLE;
     -- Inputs
     work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_ready_for_data_out <= VAR_work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_ready_for_data_out;
     work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_data_in <= VAR_work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_data_in;
     work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_data_in_valid <= VAR_work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_data_in_valid;
     -- Outputs
     VAR_work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_return_output := work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_return_output;

     -- BIN_OP_LT[ethernet_top_c_l72_c87_a1d5] LATENCY=0
     -- Inputs
     BIN_OP_LT_ethernet_top_c_l72_c87_a1d5_left <= VAR_BIN_OP_LT_ethernet_top_c_l72_c87_a1d5_left;
     BIN_OP_LT_ethernet_top_c_l72_c87_a1d5_right <= VAR_BIN_OP_LT_ethernet_top_c_l72_c87_a1d5_right;
     -- Outputs
     VAR_BIN_OP_LT_ethernet_top_c_l72_c87_a1d5_return_output := BIN_OP_LT_ethernet_top_c_l72_c87_a1d5_return_output;

     -- BIN_OP_PLUS[ethernet_top_c_l72_c645_d94a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_ethernet_top_c_l72_c645_d94a_left <= VAR_BIN_OP_PLUS_ethernet_top_c_l72_c645_d94a_left;
     BIN_OP_PLUS_ethernet_top_c_l72_c645_d94a_right <= VAR_BIN_OP_PLUS_ethernet_top_c_l72_c645_d94a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_ethernet_top_c_l72_c645_d94a_return_output := BIN_OP_PLUS_ethernet_top_c_l72_c645_d94a_return_output;

     -- Submodule level 1
     VAR_BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6_right := VAR_BIN_OP_LT_ethernet_top_c_l72_c87_a1d5_return_output;
     VAR_work_pipeline_in_ready := VAR_BIN_OP_LT_ethernet_top_c_l72_c87_a1d5_return_output;
     VAR_fifo_count_ethernet_top_c_l72_c645_1b9d := resize(VAR_BIN_OP_PLUS_ethernet_top_c_l72_c645_d94a_return_output, 16);
     VAR_fifo_count_MUX_ethernet_top_c_l72_c592_beb2_iftrue := VAR_fifo_count_ethernet_top_c_l72_c645_1b9d;
     -- BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6_left;
     BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6_return_output := BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6_return_output;

     -- CONST_REF_RD_work_outputs_t_work_pipeline_FIFO_t_data_out_d41d[ethernet_top_c_l72_c575_645f] LATENCY=0
     VAR_CONST_REF_RD_work_outputs_t_work_pipeline_FIFO_t_data_out_d41d_ethernet_top_c_l72_c575_645f_return_output := VAR_work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_return_output.data_out;

     -- CONST_REF_RD_uint1_t_work_pipeline_FIFO_t_data_out_valid_d41d[ethernet_top_c_l72_c527_be3b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_work_pipeline_FIFO_t_data_out_valid_d41d_ethernet_top_c_l72_c527_be3b_return_output := VAR_work_pipeline_FIFO_ethernet_top_c_l72_c443_a043_return_output.data_out_valid;

     -- Submodule level 2
     VAR_fifo_count_MUX_ethernet_top_c_l72_c592_beb2_cond := VAR_BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6_return_output;
     VAR_work_pipeline_no_handshake_in_valid := VAR_BIN_OP_AND_uint1_t_uint1_t_ethernet_top_c_l72_DUPLICATE_fda6_return_output;
     VAR_BIN_OP_AND_ethernet_top_c_l72_c667_9b42_left := VAR_CONST_REF_RD_uint1_t_work_pipeline_FIFO_t_data_out_valid_d41d_ethernet_top_c_l72_c527_be3b_return_output;
     -- work_pipeline_out_CONST_REF_RD_work_outputs_t_stream_t_work_outputs_t_stream_t_1095[ethernet_top_c_l72_c6_e88f] LATENCY=0
     VAR_work_pipeline_out_CONST_REF_RD_work_outputs_t_stream_t_work_outputs_t_stream_t_1095_ethernet_top_c_l72_c6_e88f_return_output := CONST_REF_RD_work_outputs_t_stream_t_work_outputs_t_stream_t_1095(
     VAR_CONST_REF_RD_uint1_t_work_pipeline_FIFO_t_data_out_valid_d41d_ethernet_top_c_l72_c527_be3b_return_output,
     VAR_CONST_REF_RD_work_outputs_t_work_pipeline_FIFO_t_data_out_d41d_ethernet_top_c_l72_c575_645f_return_output);

     -- BIN_OP_AND[ethernet_top_c_l72_c667_9b42] LATENCY=0
     -- Inputs
     BIN_OP_AND_ethernet_top_c_l72_c667_9b42_left <= VAR_BIN_OP_AND_ethernet_top_c_l72_c667_9b42_left;
     BIN_OP_AND_ethernet_top_c_l72_c667_9b42_right <= VAR_BIN_OP_AND_ethernet_top_c_l72_c667_9b42_right;
     -- Outputs
     VAR_BIN_OP_AND_ethernet_top_c_l72_c667_9b42_return_output := BIN_OP_AND_ethernet_top_c_l72_c667_9b42_return_output;

     -- fifo_count_MUX[ethernet_top_c_l72_c592_beb2] LATENCY=0
     -- Inputs
     fifo_count_MUX_ethernet_top_c_l72_c592_beb2_cond <= VAR_fifo_count_MUX_ethernet_top_c_l72_c592_beb2_cond;
     fifo_count_MUX_ethernet_top_c_l72_c592_beb2_iftrue <= VAR_fifo_count_MUX_ethernet_top_c_l72_c592_beb2_iftrue;
     fifo_count_MUX_ethernet_top_c_l72_c592_beb2_iffalse <= VAR_fifo_count_MUX_ethernet_top_c_l72_c592_beb2_iffalse;
     -- Outputs
     VAR_fifo_count_MUX_ethernet_top_c_l72_c592_beb2_return_output := fifo_count_MUX_ethernet_top_c_l72_c592_beb2_return_output;

     -- Submodule level 3
     VAR_fifo_count_MUX_ethernet_top_c_l72_c664_be27_cond := VAR_BIN_OP_AND_ethernet_top_c_l72_c667_9b42_return_output;
     VAR_BIN_OP_MINUS_ethernet_top_c_l72_c719_5455_left := VAR_fifo_count_MUX_ethernet_top_c_l72_c592_beb2_return_output;
     VAR_fifo_count_MUX_ethernet_top_c_l72_c664_be27_iffalse := VAR_fifo_count_MUX_ethernet_top_c_l72_c592_beb2_return_output;
     VAR_work_pipeline_out := VAR_work_pipeline_out_CONST_REF_RD_work_outputs_t_stream_t_work_outputs_t_stream_t_1095_ethernet_top_c_l72_c6_e88f_return_output;
     -- BIN_OP_MINUS[ethernet_top_c_l72_c719_5455] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_ethernet_top_c_l72_c719_5455_left <= VAR_BIN_OP_MINUS_ethernet_top_c_l72_c719_5455_left;
     BIN_OP_MINUS_ethernet_top_c_l72_c719_5455_right <= VAR_BIN_OP_MINUS_ethernet_top_c_l72_c719_5455_right;
     -- Outputs
     VAR_BIN_OP_MINUS_ethernet_top_c_l72_c719_5455_return_output := BIN_OP_MINUS_ethernet_top_c_l72_c719_5455_return_output;

     -- Submodule level 4
     VAR_fifo_count_MUX_ethernet_top_c_l72_c664_be27_iftrue := VAR_BIN_OP_MINUS_ethernet_top_c_l72_c719_5455_return_output;
     -- fifo_count_MUX[ethernet_top_c_l72_c664_be27] LATENCY=0
     -- Inputs
     fifo_count_MUX_ethernet_top_c_l72_c664_be27_cond <= VAR_fifo_count_MUX_ethernet_top_c_l72_c664_be27_cond;
     fifo_count_MUX_ethernet_top_c_l72_c664_be27_iftrue <= VAR_fifo_count_MUX_ethernet_top_c_l72_c664_be27_iftrue;
     fifo_count_MUX_ethernet_top_c_l72_c664_be27_iffalse <= VAR_fifo_count_MUX_ethernet_top_c_l72_c664_be27_iffalse;
     -- Outputs
     VAR_fifo_count_MUX_ethernet_top_c_l72_c664_be27_return_output := fifo_count_MUX_ethernet_top_c_l72_c664_be27_return_output;

     -- Submodule level 5
     REG_VAR_fifo_count := VAR_fifo_count_MUX_ethernet_top_c_l72_c664_be27_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_fifo_count <= REG_VAR_fifo_count;
-- Global wires driven various places in pipeline
if clk_en_internal='1' then
  module_to_global.work_pipeline_in_ready <= VAR_work_pipeline_in_ready;
else
  module_to_global.work_pipeline_in_ready <= to_unsigned(0, 1);
end if;
if clk_en_internal='1' then
  module_to_global.work_pipeline_no_handshake_in_valid <= VAR_work_pipeline_no_handshake_in_valid;
else
  module_to_global.work_pipeline_no_handshake_in_valid <= to_unsigned(0, 1);
end if;
if clk_en_internal='1' then
  module_to_global.work_pipeline_no_handshake_in <= VAR_work_pipeline_no_handshake_in;
else
  module_to_global.work_pipeline_no_handshake_in <= work_inputs_t_NULL;
end if;
if clk_en_internal='1' then
  module_to_global.work_pipeline_out <= VAR_work_pipeline_out;
else
  module_to_global.work_pipeline_out <= work_outputs_t_stream_t_NULL;
end if;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if clk_en_internal='1' then
     fifo_count <= REG_COMB_fifo_count;
 end if;
 end if;
end process;

end arch;
