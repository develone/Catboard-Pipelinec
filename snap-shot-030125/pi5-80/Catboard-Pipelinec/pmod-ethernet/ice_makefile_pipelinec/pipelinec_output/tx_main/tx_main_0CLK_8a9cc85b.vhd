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
entity tx_main_0CLK_8a9cc85b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 global_to_module : in tx_main_global_to_module_t;
 module_to_global : out tx_main_module_to_global_t);
end tx_main_0CLK_8a9cc85b;
architecture arch of tx_main_0CLK_8a9cc85b is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- Type holding all locally declared (feedback) wires of the func 
type feedback_vars_t is record
  -- Feedback vars
 ser_output_ready : unsigned(0 downto 0);
end record;
-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Feedback vars in the func
signal feedback_vars : feedback_vars_t;
-- Each function instance gets signals
-- work_serialize[ethernet_top_c_l159_c26_c09c]
signal work_serialize_ethernet_top_c_l159_c26_c09c_CLOCK_ENABLE : unsigned(0 downto 0);
signal work_serialize_ethernet_top_c_l159_c26_c09c_in_data : work_outputs_t;
signal work_serialize_ethernet_top_c_l159_c26_c09c_in_data_valid : unsigned(0 downto 0);
signal work_serialize_ethernet_top_c_l159_c26_c09c_out_data_ready : unsigned(0 downto 0);
signal work_serialize_ethernet_top_c_l159_c26_c09c_return_output : work_serialize_t;

-- BIN_OP_AND[ethernet_top_c_l168_c17_a58c]
signal BIN_OP_AND_ethernet_top_c_l168_c17_a58c_left : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l168_c17_a58c_right : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l168_c17_a58c_return_output : unsigned(0 downto 0);

-- eth_8_tx[ethernet_top_c_l176_c23_622c]
signal eth_8_tx_ethernet_top_c_l176_c23_622c_CLOCK_ENABLE : unsigned(0 downto 0);
signal eth_8_tx_ethernet_top_c_l176_c23_622c_frame : eth8_frame_t_stream_t;
signal eth_8_tx_ethernet_top_c_l176_c23_622c_mac_axis_ready : unsigned(0 downto 0);
signal eth_8_tx_ethernet_top_c_l176_c23_622c_return_output : eth_8_tx_t;

-- BIN_OP_AND[ethernet_top_c_l180_c29_c18b]
signal BIN_OP_AND_ethernet_top_c_l180_c29_c18b_left : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l180_c29_c18b_right : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l180_c29_c18b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[ethernet_top_c_l189_c37_97f1]
signal BIN_OP_AND_ethernet_top_c_l189_c37_97f1_left : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l189_c37_97f1_right : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l189_c37_97f1_return_output : unsigned(0 downto 0);

function CONST_REF_RD_uint48_t_eth8_frame_t_stream_t_data_header_src_mac_8ae6( ref_toks_0 : eth_header_t) return unsigned is
 
  variable base : eth8_frame_t_stream_t; 
  variable return_output : unsigned(47 downto 0);
begin
      base.data.header := ref_toks_0;

      return_output := base.data.header.src_mac;
      return return_output; 
end function;

function CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned) return uint8_t_6 is
 
  variable base : uint8_t_6; 
  variable return_output : uint8_t_6;
begin
      base(0) := ref_toks_0;
      base(1) := ref_toks_1;
      base(2) := ref_toks_2;
      base(3) := ref_toks_3;
      base(4) := ref_toks_4;
      base(5) := ref_toks_5;

      return_output := base;
      return return_output; 
end function;

function uint8_array6_be( x : uint8_t_6) return unsigned is

  --variable x : uint8_t_6;
  variable return_output : unsigned(47 downto 0);

begin
return_output := x(0)&x(1)&x(2)&x(3)&x(4)&x(5);
return return_output;
end function;

function CONST_REF_RD_eth8_frame_t_stream_t_eth8_frame_t_stream_t_40cc( ref_toks_0 : eth8_frame_t_stream_t;
 ref_toks_1 : eth_header_t;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : uint8_t_1;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return eth8_frame_t_stream_t is
 
  variable base : eth8_frame_t_stream_t; 
  variable return_output : eth8_frame_t_stream_t;
begin
      base := ref_toks_0;
      base.data.header := ref_toks_1;
      base.data.header.dst_mac := ref_toks_2;
      base.data.header.src_mac := ref_toks_3;
      base.data.payload.tdata := ref_toks_4;
      base.data.payload.tlast := ref_toks_5;
      base.valid := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- work_serialize_ethernet_top_c_l159_c26_c09c : 0 clocks latency
work_serialize_ethernet_top_c_l159_c26_c09c : entity work.work_serialize_0CLK_ec30ae69 port map (
clk,
work_serialize_ethernet_top_c_l159_c26_c09c_CLOCK_ENABLE,
work_serialize_ethernet_top_c_l159_c26_c09c_in_data,
work_serialize_ethernet_top_c_l159_c26_c09c_in_data_valid,
work_serialize_ethernet_top_c_l159_c26_c09c_out_data_ready,
work_serialize_ethernet_top_c_l159_c26_c09c_return_output);

-- BIN_OP_AND_ethernet_top_c_l168_c17_a58c : 0 clocks latency
BIN_OP_AND_ethernet_top_c_l168_c17_a58c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_ethernet_top_c_l168_c17_a58c_left,
BIN_OP_AND_ethernet_top_c_l168_c17_a58c_right,
BIN_OP_AND_ethernet_top_c_l168_c17_a58c_return_output);

-- eth_8_tx_ethernet_top_c_l176_c23_622c : 0 clocks latency
eth_8_tx_ethernet_top_c_l176_c23_622c : entity work.eth_8_tx_0CLK_418a2715 port map (
clk,
eth_8_tx_ethernet_top_c_l176_c23_622c_CLOCK_ENABLE,
eth_8_tx_ethernet_top_c_l176_c23_622c_frame,
eth_8_tx_ethernet_top_c_l176_c23_622c_mac_axis_ready,
eth_8_tx_ethernet_top_c_l176_c23_622c_return_output);

-- BIN_OP_AND_ethernet_top_c_l180_c29_c18b : 0 clocks latency
BIN_OP_AND_ethernet_top_c_l180_c29_c18b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_ethernet_top_c_l180_c29_c18b_left,
BIN_OP_AND_ethernet_top_c_l180_c29_c18b_right,
BIN_OP_AND_ethernet_top_c_l180_c29_c18b_return_output);

-- BIN_OP_AND_ethernet_top_c_l189_c37_97f1 : 0 clocks latency
BIN_OP_AND_ethernet_top_c_l189_c37_97f1 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_ethernet_top_c_l189_c37_97f1_left,
BIN_OP_AND_ethernet_top_c_l189_c37_97f1_right,
BIN_OP_AND_ethernet_top_c_l189_c37_97f1_return_output);



-- Resolve what clock enable to use for user logic
clk_en_internal <= CLOCK_ENABLE(0);
-- Combinatorial process for pipeline stages
process (
CLOCK_ENABLE,
clk_en_internal,
 -- Feedback vars
 feedback_vars,
 -- Clock cross input
 global_to_module,
 -- All submodule outputs
 work_serialize_ethernet_top_c_l159_c26_c09c_return_output,
 BIN_OP_AND_ethernet_top_c_l168_c17_a58c_return_output,
 eth_8_tx_ethernet_top_c_l176_c23_622c_return_output,
 BIN_OP_AND_ethernet_top_c_l180_c29_c18b_return_output,
 BIN_OP_AND_ethernet_top_c_l189_c37_97f1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_loopback_headers_fifo_out : eth_header_t_stream_t;
 variable VAR_FPGA_MAC_BYTES : uint8_t_6;
 variable VAR_work_pipeline_out : work_outputs_t_stream_t;
 variable VAR_work_pipeline_out_ready : unsigned(0 downto 0);
 variable VAR_eth_tx_mac_input_ready : unsigned(0 downto 0);
 variable VAR_eth_tx_mac_axis_in : axis8_t_stream_t;
 variable VAR_loopback_headers_fifo_out_ready : unsigned(0 downto 0);
 variable VAR_frame : eth8_frame_t_stream_t;
 variable VAR_CONST_REF_RD_eth_header_t_eth_header_t_stream_t_data_d41d_ethernet_top_c_l151_c23_a2b5_return_output : eth_header_t;
 variable VAR_CONST_REF_RD_uint48_t_eth8_frame_t_stream_t_data_header_src_mac_8ae6_ethernet_top_c_l152_c31_efef_return_output : unsigned(47 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e_ethernet_top_c_l153_c47_f8ee_return_output : uint8_t_6;
 variable VAR_uint8_array6_be_ethernet_top_c_l153_c31_9762_return_output : unsigned(47 downto 0);
 variable VAR_ser_output_ready : unsigned(0 downto 0);
 variable VAR_ser : work_serialize_t;
 variable VAR_work_serialize_ethernet_top_c_l159_c26_c09c_in_data : work_outputs_t;
 variable VAR_work_serialize_ethernet_top_c_l159_c26_c09c_in_data_valid : unsigned(0 downto 0);
 variable VAR_work_serialize_ethernet_top_c_l159_c26_c09c_out_data_ready : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_work_outputs_t_work_outputs_t_stream_t_data_d41d_ethernet_top_c_l160_c5_f84e_return_output : work_outputs_t;
 variable VAR_CONST_REF_RD_uint1_t_work_outputs_t_stream_t_valid_d41d_ethernet_top_c_l161_c5_052b_return_output : unsigned(0 downto 0);
 variable VAR_work_serialize_ethernet_top_c_l159_c26_c09c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_work_serialize_ethernet_top_c_l159_c26_c09c_return_output : work_serialize_t;
 variable VAR_CONST_REF_RD_uint1_t_work_serialize_t_in_data_ready_d41d_ethernet_top_c_l165_c29_f46a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_1_work_serialize_t_out_data_d41d_ethernet_top_c_l166_c30_6a39_return_output : uint8_t_1;
 variable VAR_CONST_REF_RD_uint1_t_work_serialize_t_last_d41d_ethernet_top_c_l167_c30_4985_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_work_serialize_t_valid_d41d_ethernet_top_c_l168_c17_dd9f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l168_c17_a58c_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eth_header_t_stream_t_valid_d41d_ethernet_top_c_l168_c29_cf77_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l168_c17_a58c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l168_c17_a58c_return_output : unsigned(0 downto 0);
 variable VAR_eth_tx : eth_8_tx_t;
 variable VAR_eth_8_tx_ethernet_top_c_l176_c23_622c_frame : eth8_frame_t_stream_t;
 variable VAR_eth_8_tx_ethernet_top_c_l176_c23_622c_mac_axis_ready : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_eth8_frame_t_stream_t_eth8_frame_t_stream_t_40cc_ethernet_top_c_l176_c32_5f6b_return_output : eth8_frame_t_stream_t;
 variable VAR_eth_8_tx_ethernet_top_c_l176_c23_622c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eth_8_tx_ethernet_top_c_l176_c23_622c_return_output : eth_8_tx_t;
 variable VAR_CONST_REF_RD_axis8_t_stream_t_eth_8_tx_t_mac_axis_d41d_ethernet_top_c_l177_c24_c3c4_return_output : axis8_t_stream_t;
 variable VAR_valid_and_ready : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l180_c29_c18b_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eth_8_tx_t_frame_ready_d41d_ethernet_top_c_l180_c43_d53f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l180_c29_c18b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l180_c29_c18b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l189_c37_97f1_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l189_c37_97f1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l189_c37_97f1_return_output : unsigned(0 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     -- CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e[ethernet_top_c_l153_c47_f8ee] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e_ethernet_top_c_l153_c47_f8ee_return_output := CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e(
     to_unsigned(160, 8),
     to_unsigned(177, 8),
     to_unsigned(194, 8),
     to_unsigned(211, 8),
     to_unsigned(228, 8),
     to_unsigned(245, 8));

     -- Submodule level 1
     -- uint8_array6_be[ethernet_top_c_l153_c31_9762] LATENCY=0
     VAR_uint8_array6_be_ethernet_top_c_l153_c31_9762_return_output := uint8_array6_be(
     VAR_CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e_ethernet_top_c_l153_c47_f8ee_return_output);

     -- Submodule level 2
 -- Reads from global variables
     VAR_loopback_headers_fifo_out := global_to_module.loopback_headers_fifo_out;
     VAR_work_pipeline_out := global_to_module.work_pipeline_out;
     VAR_eth_tx_mac_input_ready := global_to_module.eth_tx_mac_input_ready;
     -- Submodule level 0
     VAR_eth_8_tx_ethernet_top_c_l176_c23_622c_mac_axis_ready := VAR_eth_tx_mac_input_ready;
     -- CONST_REF_RD_work_outputs_t_work_outputs_t_stream_t_data_d41d[ethernet_top_c_l160_c5_f84e] LATENCY=0
     VAR_CONST_REF_RD_work_outputs_t_work_outputs_t_stream_t_data_d41d_ethernet_top_c_l160_c5_f84e_return_output := VAR_work_pipeline_out.data;

     -- CONST_REF_RD_eth_header_t_eth_header_t_stream_t_data_d41d[ethernet_top_c_l151_c23_a2b5] LATENCY=0
     VAR_CONST_REF_RD_eth_header_t_eth_header_t_stream_t_data_d41d_ethernet_top_c_l151_c23_a2b5_return_output := VAR_loopback_headers_fifo_out.data;

     -- CONST_REF_RD_uint1_t_eth_header_t_stream_t_valid_d41d[ethernet_top_c_l168_c29_cf77] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth_header_t_stream_t_valid_d41d_ethernet_top_c_l168_c29_cf77_return_output := VAR_loopback_headers_fifo_out.valid;

     -- CONST_REF_RD_uint1_t_work_outputs_t_stream_t_valid_d41d[ethernet_top_c_l161_c5_052b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_work_outputs_t_stream_t_valid_d41d_ethernet_top_c_l161_c5_052b_return_output := VAR_work_pipeline_out.valid;

     -- Submodule level 1
     VAR_work_serialize_ethernet_top_c_l159_c26_c09c_in_data := VAR_CONST_REF_RD_work_outputs_t_work_outputs_t_stream_t_data_d41d_ethernet_top_c_l160_c5_f84e_return_output;
     VAR_work_serialize_ethernet_top_c_l159_c26_c09c_in_data_valid := VAR_CONST_REF_RD_uint1_t_work_outputs_t_stream_t_valid_d41d_ethernet_top_c_l161_c5_052b_return_output;
     VAR_BIN_OP_AND_ethernet_top_c_l168_c17_a58c_right := VAR_CONST_REF_RD_uint1_t_eth_header_t_stream_t_valid_d41d_ethernet_top_c_l168_c29_cf77_return_output;
     -- CONST_REF_RD_uint48_t_eth8_frame_t_stream_t_data_header_src_mac_8ae6[ethernet_top_c_l152_c31_efef] LATENCY=0
     VAR_CONST_REF_RD_uint48_t_eth8_frame_t_stream_t_data_header_src_mac_8ae6_ethernet_top_c_l152_c31_efef_return_output := CONST_REF_RD_uint48_t_eth8_frame_t_stream_t_data_header_src_mac_8ae6(
     VAR_CONST_REF_RD_eth_header_t_eth_header_t_stream_t_data_d41d_ethernet_top_c_l151_c23_a2b5_return_output);

     -- Submodule level 2

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;

     -- Submodule level 0
     VAR_eth_8_tx_ethernet_top_c_l176_c23_622c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_work_serialize_ethernet_top_c_l159_c26_c09c_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_work_serialize_ethernet_top_c_l159_c26_c09c_out_data_ready := feedback_vars.ser_output_ready;
     -- work_serialize[ethernet_top_c_l159_c26_c09c] LATENCY=0
     -- Clock enable
     work_serialize_ethernet_top_c_l159_c26_c09c_CLOCK_ENABLE <= VAR_work_serialize_ethernet_top_c_l159_c26_c09c_CLOCK_ENABLE;
     -- Inputs
     work_serialize_ethernet_top_c_l159_c26_c09c_in_data <= VAR_work_serialize_ethernet_top_c_l159_c26_c09c_in_data;
     work_serialize_ethernet_top_c_l159_c26_c09c_in_data_valid <= VAR_work_serialize_ethernet_top_c_l159_c26_c09c_in_data_valid;
     work_serialize_ethernet_top_c_l159_c26_c09c_out_data_ready <= VAR_work_serialize_ethernet_top_c_l159_c26_c09c_out_data_ready;
     -- Outputs
     VAR_work_serialize_ethernet_top_c_l159_c26_c09c_return_output := work_serialize_ethernet_top_c_l159_c26_c09c_return_output;

     -- Submodule level 1
     -- CONST_REF_RD_uint1_t_work_serialize_t_valid_d41d[ethernet_top_c_l168_c17_dd9f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_work_serialize_t_valid_d41d_ethernet_top_c_l168_c17_dd9f_return_output := VAR_work_serialize_ethernet_top_c_l159_c26_c09c_return_output.valid;

     -- CONST_REF_RD_uint1_t_work_serialize_t_in_data_ready_d41d[ethernet_top_c_l165_c29_f46a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_work_serialize_t_in_data_ready_d41d_ethernet_top_c_l165_c29_f46a_return_output := VAR_work_serialize_ethernet_top_c_l159_c26_c09c_return_output.in_data_ready;

     -- CONST_REF_RD_uint1_t_work_serialize_t_last_d41d[ethernet_top_c_l167_c30_4985] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_work_serialize_t_last_d41d_ethernet_top_c_l167_c30_4985_return_output := VAR_work_serialize_ethernet_top_c_l159_c26_c09c_return_output.last;

     -- CONST_REF_RD_uint8_t_1_work_serialize_t_out_data_d41d[ethernet_top_c_l166_c30_6a39] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_1_work_serialize_t_out_data_d41d_ethernet_top_c_l166_c30_6a39_return_output := VAR_work_serialize_ethernet_top_c_l159_c26_c09c_return_output.out_data;

     -- Submodule level 2
     VAR_work_pipeline_out_ready := VAR_CONST_REF_RD_uint1_t_work_serialize_t_in_data_ready_d41d_ethernet_top_c_l165_c29_f46a_return_output;
     VAR_BIN_OP_AND_ethernet_top_c_l189_c37_97f1_left := VAR_CONST_REF_RD_uint1_t_work_serialize_t_last_d41d_ethernet_top_c_l167_c30_4985_return_output;
     VAR_BIN_OP_AND_ethernet_top_c_l168_c17_a58c_left := VAR_CONST_REF_RD_uint1_t_work_serialize_t_valid_d41d_ethernet_top_c_l168_c17_dd9f_return_output;
     -- BIN_OP_AND[ethernet_top_c_l168_c17_a58c] LATENCY=0
     -- Inputs
     BIN_OP_AND_ethernet_top_c_l168_c17_a58c_left <= VAR_BIN_OP_AND_ethernet_top_c_l168_c17_a58c_left;
     BIN_OP_AND_ethernet_top_c_l168_c17_a58c_right <= VAR_BIN_OP_AND_ethernet_top_c_l168_c17_a58c_right;
     -- Outputs
     VAR_BIN_OP_AND_ethernet_top_c_l168_c17_a58c_return_output := BIN_OP_AND_ethernet_top_c_l168_c17_a58c_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_ethernet_top_c_l180_c29_c18b_left := VAR_BIN_OP_AND_ethernet_top_c_l168_c17_a58c_return_output;
     -- CONST_REF_RD_eth8_frame_t_stream_t_eth8_frame_t_stream_t_40cc[ethernet_top_c_l176_c32_5f6b] LATENCY=0
     VAR_CONST_REF_RD_eth8_frame_t_stream_t_eth8_frame_t_stream_t_40cc_ethernet_top_c_l176_c32_5f6b_return_output := CONST_REF_RD_eth8_frame_t_stream_t_eth8_frame_t_stream_t_40cc(
     eth8_frame_t_stream_t_NULL,
     VAR_CONST_REF_RD_eth_header_t_eth_header_t_stream_t_data_d41d_ethernet_top_c_l151_c23_a2b5_return_output,
     VAR_CONST_REF_RD_uint48_t_eth8_frame_t_stream_t_data_header_src_mac_8ae6_ethernet_top_c_l152_c31_efef_return_output,
     VAR_uint8_array6_be_ethernet_top_c_l153_c31_9762_return_output,
     VAR_CONST_REF_RD_uint8_t_1_work_serialize_t_out_data_d41d_ethernet_top_c_l166_c30_6a39_return_output,
     VAR_CONST_REF_RD_uint1_t_work_serialize_t_last_d41d_ethernet_top_c_l167_c30_4985_return_output,
     VAR_BIN_OP_AND_ethernet_top_c_l168_c17_a58c_return_output);

     -- Submodule level 4
     VAR_eth_8_tx_ethernet_top_c_l176_c23_622c_frame := VAR_CONST_REF_RD_eth8_frame_t_stream_t_eth8_frame_t_stream_t_40cc_ethernet_top_c_l176_c32_5f6b_return_output;
     -- eth_8_tx[ethernet_top_c_l176_c23_622c] LATENCY=0
     -- Clock enable
     eth_8_tx_ethernet_top_c_l176_c23_622c_CLOCK_ENABLE <= VAR_eth_8_tx_ethernet_top_c_l176_c23_622c_CLOCK_ENABLE;
     -- Inputs
     eth_8_tx_ethernet_top_c_l176_c23_622c_frame <= VAR_eth_8_tx_ethernet_top_c_l176_c23_622c_frame;
     eth_8_tx_ethernet_top_c_l176_c23_622c_mac_axis_ready <= VAR_eth_8_tx_ethernet_top_c_l176_c23_622c_mac_axis_ready;
     -- Outputs
     VAR_eth_8_tx_ethernet_top_c_l176_c23_622c_return_output := eth_8_tx_ethernet_top_c_l176_c23_622c_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_axis8_t_stream_t_eth_8_tx_t_mac_axis_d41d[ethernet_top_c_l177_c24_c3c4] LATENCY=0
     VAR_CONST_REF_RD_axis8_t_stream_t_eth_8_tx_t_mac_axis_d41d_ethernet_top_c_l177_c24_c3c4_return_output := VAR_eth_8_tx_ethernet_top_c_l176_c23_622c_return_output.mac_axis;

     -- CONST_REF_RD_uint1_t_eth_8_tx_t_frame_ready_d41d[ethernet_top_c_l180_c43_d53f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth_8_tx_t_frame_ready_d41d_ethernet_top_c_l180_c43_d53f_return_output := VAR_eth_8_tx_ethernet_top_c_l176_c23_622c_return_output.frame_ready;

     -- Submodule level 6
     VAR_eth_tx_mac_axis_in := VAR_CONST_REF_RD_axis8_t_stream_t_eth_8_tx_t_mac_axis_d41d_ethernet_top_c_l177_c24_c3c4_return_output;
     VAR_BIN_OP_AND_ethernet_top_c_l180_c29_c18b_right := VAR_CONST_REF_RD_uint1_t_eth_8_tx_t_frame_ready_d41d_ethernet_top_c_l180_c43_d53f_return_output;
     -- BIN_OP_AND[ethernet_top_c_l180_c29_c18b] LATENCY=0
     -- Inputs
     BIN_OP_AND_ethernet_top_c_l180_c29_c18b_left <= VAR_BIN_OP_AND_ethernet_top_c_l180_c29_c18b_left;
     BIN_OP_AND_ethernet_top_c_l180_c29_c18b_right <= VAR_BIN_OP_AND_ethernet_top_c_l180_c29_c18b_right;
     -- Outputs
     VAR_BIN_OP_AND_ethernet_top_c_l180_c29_c18b_return_output := BIN_OP_AND_ethernet_top_c_l180_c29_c18b_return_output;

     -- Submodule level 7
     VAR_BIN_OP_AND_ethernet_top_c_l189_c37_97f1_right := VAR_BIN_OP_AND_ethernet_top_c_l180_c29_c18b_return_output;
     feedback_vars.ser_output_ready <= VAR_BIN_OP_AND_ethernet_top_c_l180_c29_c18b_return_output;
     -- BIN_OP_AND[ethernet_top_c_l189_c37_97f1] LATENCY=0
     -- Inputs
     BIN_OP_AND_ethernet_top_c_l189_c37_97f1_left <= VAR_BIN_OP_AND_ethernet_top_c_l189_c37_97f1_left;
     BIN_OP_AND_ethernet_top_c_l189_c37_97f1_right <= VAR_BIN_OP_AND_ethernet_top_c_l189_c37_97f1_right;
     -- Outputs
     VAR_BIN_OP_AND_ethernet_top_c_l189_c37_97f1_return_output := BIN_OP_AND_ethernet_top_c_l189_c37_97f1_return_output;

     -- Submodule level 8
     VAR_loopback_headers_fifo_out_ready := VAR_BIN_OP_AND_ethernet_top_c_l189_c37_97f1_return_output;
   end if;
 end loop;

-- Global wires driven various places in pipeline
if clk_en_internal='1' then
  module_to_global.work_pipeline_out_ready <= VAR_work_pipeline_out_ready;
else
  module_to_global.work_pipeline_out_ready <= to_unsigned(0, 1);
end if;
if clk_en_internal='1' then
  module_to_global.eth_tx_mac_axis_in <= VAR_eth_tx_mac_axis_in;
else
  module_to_global.eth_tx_mac_axis_in <= axis8_t_stream_t_NULL;
end if;
if clk_en_internal='1' then
  module_to_global.loopback_headers_fifo_out_ready <= VAR_loopback_headers_fifo_out_ready;
else
  module_to_global.loopback_headers_fifo_out_ready <= to_unsigned(0, 1);
end if;
end process;

end arch;
