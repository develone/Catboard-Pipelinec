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
-- Submodules: 10
entity rx_main_0CLK_f91aa930 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 global_to_module : in rx_main_global_to_module_t;
 module_to_global : out rx_main_module_to_global_t);
end rx_main_0CLK_f91aa930;
architecture arch of rx_main_0CLK_f91aa930 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Each function instance gets signals
-- BIN_OP_AND[ethernet_top_c_l111_c30_0d0d]
signal BIN_OP_AND_ethernet_top_c_l111_c30_0d0d_left : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l111_c30_0d0d_right : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l111_c30_0d0d_return_output : unsigned(0 downto 0);

-- eth_8_rx[ethernet_top_c_l115_c23_a9b0]
signal eth_8_rx_ethernet_top_c_l115_c23_a9b0_CLOCK_ENABLE : unsigned(0 downto 0);
signal eth_8_rx_ethernet_top_c_l115_c23_a9b0_mac_axis : axis8_t_stream_t;
signal eth_8_rx_ethernet_top_c_l115_c23_a9b0_frame_ready : unsigned(0 downto 0);
signal eth_8_rx_ethernet_top_c_l115_c23_a9b0_return_output : eth_8_rx_t;

-- BIN_OP_EQ[ethernet_top_c_l118_c23_80f1]
signal BIN_OP_EQ_ethernet_top_c_l118_c23_80f1_left : unsigned(47 downto 0);
signal BIN_OP_EQ_ethernet_top_c_l118_c23_80f1_right : unsigned(47 downto 0);
signal BIN_OP_EQ_ethernet_top_c_l118_c23_80f1_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[ethernet_top_c_l121_c29_44c6]
signal BIN_OP_AND_ethernet_top_c_l121_c29_44c6_left : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l121_c29_44c6_right : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l121_c29_44c6_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[ethernet_top_c_l121_c29_0159]
signal BIN_OP_AND_ethernet_top_c_l121_c29_0159_left : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l121_c29_0159_right : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l121_c29_0159_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[ethernet_top_c_l142_c36_3bf1]
signal BIN_OP_AND_ethernet_top_c_l142_c36_3bf1_left : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l142_c36_3bf1_right : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l142_c36_3bf1_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_42b0( ref_toks_0 : axis8_t;
 ref_toks_1 : unsigned) return axis8_t_stream_t is
 
  variable base : axis8_t_stream_t; 
  variable return_output : axis8_t_stream_t;
begin
      base.data := ref_toks_0;
      base.valid := ref_toks_1;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_eth_header_t_stream_t_eth_header_t_stream_t_42b0( ref_toks_0 : eth_header_t;
 ref_toks_1 : unsigned) return eth_header_t_stream_t is
 
  variable base : eth_header_t_stream_t; 
  variable return_output : eth_header_t_stream_t;
begin
      base.data := ref_toks_0;
      base.valid := ref_toks_1;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_ethernet_top_c_l111_c30_0d0d : 0 clocks latency
BIN_OP_AND_ethernet_top_c_l111_c30_0d0d : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_ethernet_top_c_l111_c30_0d0d_left,
BIN_OP_AND_ethernet_top_c_l111_c30_0d0d_right,
BIN_OP_AND_ethernet_top_c_l111_c30_0d0d_return_output);

-- eth_8_rx_ethernet_top_c_l115_c23_a9b0 : 0 clocks latency
eth_8_rx_ethernet_top_c_l115_c23_a9b0 : entity work.eth_8_rx_0CLK_5110df32 port map (
clk,
eth_8_rx_ethernet_top_c_l115_c23_a9b0_CLOCK_ENABLE,
eth_8_rx_ethernet_top_c_l115_c23_a9b0_mac_axis,
eth_8_rx_ethernet_top_c_l115_c23_a9b0_frame_ready,
eth_8_rx_ethernet_top_c_l115_c23_a9b0_return_output);

-- BIN_OP_EQ_ethernet_top_c_l118_c23_80f1 : 0 clocks latency
BIN_OP_EQ_ethernet_top_c_l118_c23_80f1 : entity work.BIN_OP_EQ_uint48_t_uint48_t_0CLK_de264c78 port map (
BIN_OP_EQ_ethernet_top_c_l118_c23_80f1_left,
BIN_OP_EQ_ethernet_top_c_l118_c23_80f1_right,
BIN_OP_EQ_ethernet_top_c_l118_c23_80f1_return_output);

-- BIN_OP_AND_ethernet_top_c_l121_c29_44c6 : 0 clocks latency
BIN_OP_AND_ethernet_top_c_l121_c29_44c6 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_ethernet_top_c_l121_c29_44c6_left,
BIN_OP_AND_ethernet_top_c_l121_c29_44c6_right,
BIN_OP_AND_ethernet_top_c_l121_c29_44c6_return_output);

-- BIN_OP_AND_ethernet_top_c_l121_c29_0159 : 0 clocks latency
BIN_OP_AND_ethernet_top_c_l121_c29_0159 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_ethernet_top_c_l121_c29_0159_left,
BIN_OP_AND_ethernet_top_c_l121_c29_0159_right,
BIN_OP_AND_ethernet_top_c_l121_c29_0159_return_output);

-- BIN_OP_AND_ethernet_top_c_l142_c36_3bf1 : 0 clocks latency
BIN_OP_AND_ethernet_top_c_l142_c36_3bf1 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_ethernet_top_c_l142_c36_3bf1_left,
BIN_OP_AND_ethernet_top_c_l142_c36_3bf1_right,
BIN_OP_AND_ethernet_top_c_l142_c36_3bf1_return_output);



-- Resolve what clock enable to use for user logic
clk_en_internal <= CLOCK_ENABLE(0);
-- Combinatorial process for pipeline stages
process (
CLOCK_ENABLE,
clk_en_internal,
 -- Clock cross input
 global_to_module,
 -- All submodule outputs
 BIN_OP_AND_ethernet_top_c_l111_c30_0d0d_return_output,
 eth_8_rx_ethernet_top_c_l115_c23_a9b0_return_output,
 BIN_OP_EQ_ethernet_top_c_l118_c23_80f1_return_output,
 BIN_OP_AND_ethernet_top_c_l121_c29_44c6_return_output,
 BIN_OP_AND_ethernet_top_c_l121_c29_0159_return_output,
 BIN_OP_AND_ethernet_top_c_l142_c36_3bf1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_loopback_payload_fifo_in_ready : unsigned(0 downto 0);
 variable VAR_loopback_headers_fifo_in_ready : unsigned(0 downto 0);
 variable VAR_eth_rx_mac_axis_out : axis8_t_stream_t;
 variable VAR_FPGA_MAC_BYTES : uint8_t_6;
 variable VAR_loopback_payload_fifo_in : axis8_t_stream_t;
 variable VAR_loopback_headers_fifo_in : eth_header_t_stream_t;
 variable VAR_eth_rx_out_ready : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l111_c30_0d0d_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l111_c30_0d0d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l111_c30_0d0d_return_output : unsigned(0 downto 0);
 variable VAR_eth_rx : eth_8_rx_t;
 variable VAR_eth_8_rx_ethernet_top_c_l115_c23_a9b0_mac_axis : axis8_t_stream_t;
 variable VAR_eth_8_rx_ethernet_top_c_l115_c23_a9b0_frame_ready : unsigned(0 downto 0);
 variable VAR_eth_8_rx_ethernet_top_c_l115_c23_a9b0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eth_8_rx_ethernet_top_c_l115_c23_a9b0_return_output : eth_8_rx_t;
 variable VAR_frame : eth8_frame_t_stream_t;
 variable VAR_CONST_REF_RD_eth8_frame_t_stream_t_eth_8_rx_t_frame_d41d_ethernet_top_c_l116_c33_d367_return_output : eth8_frame_t_stream_t;
 variable VAR_mac_match : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint48_t_eth8_frame_t_stream_t_data_header_dst_mac_d41d_ethernet_top_c_l118_c23_3e35_return_output : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_ethernet_top_c_l118_c23_80f1_left : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_ethernet_top_c_l118_c23_80f1_right : unsigned(47 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e_ethernet_top_c_l118_c68_40f8_return_output : uint8_t_6;
 variable VAR_uint8_array6_be_ethernet_top_c_l118_c52_b6f4_return_output : unsigned(47 downto 0);
 variable VAR_BIN_OP_EQ_ethernet_top_c_l118_c23_80f1_return_output : unsigned(0 downto 0);
 variable VAR_valid_and_ready : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_ethernet_top_c_l121_c29_cd11_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l121_c29_44c6_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l121_c29_44c6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l121_c29_44c6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l121_c29_0159_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l121_c29_0159_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l121_c29_0159_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d_ethernet_top_c_l137_c35_39b2_return_output : axis8_t;
 variable VAR_CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d_ethernet_top_c_l141_c35_9aba_return_output : eth_header_t;
 variable VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_start_of_payload_d41d_ethernet_top_c_l142_c36_14de_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l142_c36_3bf1_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l142_c36_3bf1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l142_c36_3bf1_return_output : unsigned(0 downto 0);
 variable VAR_loopback_payload_fifo_in_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_42b0_ethernet_top_c_l101_c6_06e0_return_output : axis8_t_stream_t;
 variable VAR_loopback_headers_fifo_in_CONST_REF_RD_eth_header_t_stream_t_eth_header_t_stream_t_42b0_ethernet_top_c_l101_c6_06e0_return_output : eth_header_t_stream_t;
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     -- CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e[ethernet_top_c_l118_c68_40f8] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e_ethernet_top_c_l118_c68_40f8_return_output := CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e(
     to_unsigned(160, 8),
     to_unsigned(177, 8),
     to_unsigned(194, 8),
     to_unsigned(211, 8),
     to_unsigned(228, 8),
     to_unsigned(245, 8));

     -- Submodule level 1
     -- uint8_array6_be[ethernet_top_c_l118_c52_b6f4] LATENCY=0
     VAR_uint8_array6_be_ethernet_top_c_l118_c52_b6f4_return_output := uint8_array6_be(
     VAR_CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e_ethernet_top_c_l118_c68_40f8_return_output);

     -- Submodule level 2
     VAR_BIN_OP_EQ_ethernet_top_c_l118_c23_80f1_right := VAR_uint8_array6_be_ethernet_top_c_l118_c52_b6f4_return_output;
 -- Reads from global variables
     VAR_loopback_payload_fifo_in_ready := global_to_module.loopback_payload_fifo_in_ready;
     VAR_loopback_headers_fifo_in_ready := global_to_module.loopback_headers_fifo_in_ready;
     VAR_eth_rx_mac_axis_out := global_to_module.eth_rx_mac_axis_out;
     -- Submodule level 0
     VAR_eth_8_rx_ethernet_top_c_l115_c23_a9b0_mac_axis := VAR_eth_rx_mac_axis_out;
     VAR_BIN_OP_AND_ethernet_top_c_l111_c30_0d0d_right := VAR_loopback_headers_fifo_in_ready;
     VAR_BIN_OP_AND_ethernet_top_c_l111_c30_0d0d_left := VAR_loopback_payload_fifo_in_ready;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;

     -- Submodule level 0
     VAR_eth_8_rx_ethernet_top_c_l115_c23_a9b0_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     -- BIN_OP_AND[ethernet_top_c_l111_c30_0d0d] LATENCY=0
     -- Inputs
     BIN_OP_AND_ethernet_top_c_l111_c30_0d0d_left <= VAR_BIN_OP_AND_ethernet_top_c_l111_c30_0d0d_left;
     BIN_OP_AND_ethernet_top_c_l111_c30_0d0d_right <= VAR_BIN_OP_AND_ethernet_top_c_l111_c30_0d0d_right;
     -- Outputs
     VAR_BIN_OP_AND_ethernet_top_c_l111_c30_0d0d_return_output := BIN_OP_AND_ethernet_top_c_l111_c30_0d0d_return_output;

     -- Submodule level 1
     VAR_BIN_OP_AND_ethernet_top_c_l121_c29_44c6_right := VAR_BIN_OP_AND_ethernet_top_c_l111_c30_0d0d_return_output;
     VAR_eth_8_rx_ethernet_top_c_l115_c23_a9b0_frame_ready := VAR_BIN_OP_AND_ethernet_top_c_l111_c30_0d0d_return_output;
     -- eth_8_rx[ethernet_top_c_l115_c23_a9b0] LATENCY=0
     -- Clock enable
     eth_8_rx_ethernet_top_c_l115_c23_a9b0_CLOCK_ENABLE <= VAR_eth_8_rx_ethernet_top_c_l115_c23_a9b0_CLOCK_ENABLE;
     -- Inputs
     eth_8_rx_ethernet_top_c_l115_c23_a9b0_mac_axis <= VAR_eth_8_rx_ethernet_top_c_l115_c23_a9b0_mac_axis;
     eth_8_rx_ethernet_top_c_l115_c23_a9b0_frame_ready <= VAR_eth_8_rx_ethernet_top_c_l115_c23_a9b0_frame_ready;
     -- Outputs
     VAR_eth_8_rx_ethernet_top_c_l115_c23_a9b0_return_output := eth_8_rx_ethernet_top_c_l115_c23_a9b0_return_output;

     -- Submodule level 2
     -- CONST_REF_RD_eth8_frame_t_stream_t_eth_8_rx_t_frame_d41d[ethernet_top_c_l116_c33_d367] LATENCY=0
     VAR_CONST_REF_RD_eth8_frame_t_stream_t_eth_8_rx_t_frame_d41d_ethernet_top_c_l116_c33_d367_return_output := VAR_eth_8_rx_ethernet_top_c_l115_c23_a9b0_return_output.frame;

     -- Submodule level 3
     -- CONST_REF_RD_uint48_t_eth8_frame_t_stream_t_data_header_dst_mac_d41d[ethernet_top_c_l118_c23_3e35] LATENCY=0
     VAR_CONST_REF_RD_uint48_t_eth8_frame_t_stream_t_data_header_dst_mac_d41d_ethernet_top_c_l118_c23_3e35_return_output := VAR_CONST_REF_RD_eth8_frame_t_stream_t_eth_8_rx_t_frame_d41d_ethernet_top_c_l116_c33_d367_return_output.data.header.dst_mac;

     -- CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d[ethernet_top_c_l121_c29_cd11] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_ethernet_top_c_l121_c29_cd11_return_output := VAR_CONST_REF_RD_eth8_frame_t_stream_t_eth_8_rx_t_frame_d41d_ethernet_top_c_l116_c33_d367_return_output.valid;

     -- CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d[ethernet_top_c_l141_c35_9aba] LATENCY=0
     VAR_CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d_ethernet_top_c_l141_c35_9aba_return_output := VAR_CONST_REF_RD_eth8_frame_t_stream_t_eth_8_rx_t_frame_d41d_ethernet_top_c_l116_c33_d367_return_output.data.header;

     -- CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_start_of_payload_d41d[ethernet_top_c_l142_c36_14de] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_start_of_payload_d41d_ethernet_top_c_l142_c36_14de_return_output := VAR_CONST_REF_RD_eth8_frame_t_stream_t_eth_8_rx_t_frame_d41d_ethernet_top_c_l116_c33_d367_return_output.data.start_of_payload;

     -- CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d[ethernet_top_c_l137_c35_39b2] LATENCY=0
     VAR_CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d_ethernet_top_c_l137_c35_39b2_return_output := VAR_CONST_REF_RD_eth8_frame_t_stream_t_eth_8_rx_t_frame_d41d_ethernet_top_c_l116_c33_d367_return_output.data.payload;

     -- Submodule level 4
     VAR_BIN_OP_AND_ethernet_top_c_l142_c36_3bf1_left := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_start_of_payload_d41d_ethernet_top_c_l142_c36_14de_return_output;
     VAR_BIN_OP_AND_ethernet_top_c_l121_c29_44c6_left := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_valid_d41d_ethernet_top_c_l121_c29_cd11_return_output;
     VAR_BIN_OP_EQ_ethernet_top_c_l118_c23_80f1_left := VAR_CONST_REF_RD_uint48_t_eth8_frame_t_stream_t_data_header_dst_mac_d41d_ethernet_top_c_l118_c23_3e35_return_output;
     -- BIN_OP_EQ[ethernet_top_c_l118_c23_80f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_ethernet_top_c_l118_c23_80f1_left <= VAR_BIN_OP_EQ_ethernet_top_c_l118_c23_80f1_left;
     BIN_OP_EQ_ethernet_top_c_l118_c23_80f1_right <= VAR_BIN_OP_EQ_ethernet_top_c_l118_c23_80f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_ethernet_top_c_l118_c23_80f1_return_output := BIN_OP_EQ_ethernet_top_c_l118_c23_80f1_return_output;

     -- BIN_OP_AND[ethernet_top_c_l121_c29_44c6] LATENCY=0
     -- Inputs
     BIN_OP_AND_ethernet_top_c_l121_c29_44c6_left <= VAR_BIN_OP_AND_ethernet_top_c_l121_c29_44c6_left;
     BIN_OP_AND_ethernet_top_c_l121_c29_44c6_right <= VAR_BIN_OP_AND_ethernet_top_c_l121_c29_44c6_right;
     -- Outputs
     VAR_BIN_OP_AND_ethernet_top_c_l121_c29_44c6_return_output := BIN_OP_AND_ethernet_top_c_l121_c29_44c6_return_output;

     -- Submodule level 5
     VAR_BIN_OP_AND_ethernet_top_c_l121_c29_0159_left := VAR_BIN_OP_AND_ethernet_top_c_l121_c29_44c6_return_output;
     VAR_BIN_OP_AND_ethernet_top_c_l121_c29_0159_right := VAR_BIN_OP_EQ_ethernet_top_c_l118_c23_80f1_return_output;
     -- BIN_OP_AND[ethernet_top_c_l121_c29_0159] LATENCY=0
     -- Inputs
     BIN_OP_AND_ethernet_top_c_l121_c29_0159_left <= VAR_BIN_OP_AND_ethernet_top_c_l121_c29_0159_left;
     BIN_OP_AND_ethernet_top_c_l121_c29_0159_right <= VAR_BIN_OP_AND_ethernet_top_c_l121_c29_0159_right;
     -- Outputs
     VAR_BIN_OP_AND_ethernet_top_c_l121_c29_0159_return_output := BIN_OP_AND_ethernet_top_c_l121_c29_0159_return_output;

     -- Submodule level 6
     VAR_BIN_OP_AND_ethernet_top_c_l142_c36_3bf1_right := VAR_BIN_OP_AND_ethernet_top_c_l121_c29_0159_return_output;
     -- loopback_payload_fifo_in_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_42b0[ethernet_top_c_l101_c6_06e0] LATENCY=0
     VAR_loopback_payload_fifo_in_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_42b0_ethernet_top_c_l101_c6_06e0_return_output := CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_42b0(
     VAR_CONST_REF_RD_axis8_t_eth8_frame_t_stream_t_data_payload_d41d_ethernet_top_c_l137_c35_39b2_return_output,
     VAR_BIN_OP_AND_ethernet_top_c_l121_c29_0159_return_output);

     -- BIN_OP_AND[ethernet_top_c_l142_c36_3bf1] LATENCY=0
     -- Inputs
     BIN_OP_AND_ethernet_top_c_l142_c36_3bf1_left <= VAR_BIN_OP_AND_ethernet_top_c_l142_c36_3bf1_left;
     BIN_OP_AND_ethernet_top_c_l142_c36_3bf1_right <= VAR_BIN_OP_AND_ethernet_top_c_l142_c36_3bf1_right;
     -- Outputs
     VAR_BIN_OP_AND_ethernet_top_c_l142_c36_3bf1_return_output := BIN_OP_AND_ethernet_top_c_l142_c36_3bf1_return_output;

     -- Submodule level 7
     VAR_loopback_payload_fifo_in := VAR_loopback_payload_fifo_in_CONST_REF_RD_axis8_t_stream_t_axis8_t_stream_t_42b0_ethernet_top_c_l101_c6_06e0_return_output;
     -- loopback_headers_fifo_in_CONST_REF_RD_eth_header_t_stream_t_eth_header_t_stream_t_42b0[ethernet_top_c_l101_c6_06e0] LATENCY=0
     VAR_loopback_headers_fifo_in_CONST_REF_RD_eth_header_t_stream_t_eth_header_t_stream_t_42b0_ethernet_top_c_l101_c6_06e0_return_output := CONST_REF_RD_eth_header_t_stream_t_eth_header_t_stream_t_42b0(
     VAR_CONST_REF_RD_eth_header_t_eth8_frame_t_stream_t_data_header_d41d_ethernet_top_c_l141_c35_9aba_return_output,
     VAR_BIN_OP_AND_ethernet_top_c_l142_c36_3bf1_return_output);

     -- Submodule level 8
     VAR_loopback_headers_fifo_in := VAR_loopback_headers_fifo_in_CONST_REF_RD_eth_header_t_stream_t_eth_header_t_stream_t_42b0_ethernet_top_c_l101_c6_06e0_return_output;
   end if;
 end loop;

-- Global wires driven various places in pipeline
if clk_en_internal='1' then
  module_to_global.loopback_payload_fifo_in <= VAR_loopback_payload_fifo_in;
else
  module_to_global.loopback_payload_fifo_in <= axis8_t_stream_t_NULL;
end if;
if clk_en_internal='1' then
  module_to_global.loopback_headers_fifo_in <= VAR_loopback_headers_fifo_in;
else
  module_to_global.loopback_headers_fifo_in <= eth_header_t_stream_t_NULL;
end if;
end process;

end arch;
