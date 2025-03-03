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
entity tx_main_0CLK_42dce602 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 global_to_module : in tx_main_global_to_module_t;
 module_to_global : out tx_main_module_to_global_t);
end tx_main_0CLK_42dce602;
architecture arch of tx_main_0CLK_42dce602 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Each function instance gets signals
-- BIN_OP_AND[ethernet_top_c_l172_c17_2ea8]
signal BIN_OP_AND_ethernet_top_c_l172_c17_2ea8_left : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l172_c17_2ea8_right : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l172_c17_2ea8_return_output : unsigned(0 downto 0);

-- eth_8_tx[ethernet_top_c_l176_c23_cc67]
signal eth_8_tx_ethernet_top_c_l176_c23_cc67_CLOCK_ENABLE : unsigned(0 downto 0);
signal eth_8_tx_ethernet_top_c_l176_c23_cc67_frame : eth8_frame_t_stream_t;
signal eth_8_tx_ethernet_top_c_l176_c23_cc67_mac_axis_ready : unsigned(0 downto 0);
signal eth_8_tx_ethernet_top_c_l176_c23_cc67_return_output : eth_8_tx_t;

-- BIN_OP_AND[ethernet_top_c_l180_c29_3168]
signal BIN_OP_AND_ethernet_top_c_l180_c29_3168_left : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l180_c29_3168_right : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l180_c29_3168_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[ethernet_top_c_l189_c37_5c09]
signal BIN_OP_AND_ethernet_top_c_l189_c37_5c09_left : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l189_c37_5c09_right : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l189_c37_5c09_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_eth8_frame_t_stream_t_eth8_frame_t_stream_t_906d( ref_toks_0 : eth8_frame_t_stream_t;
 ref_toks_1 : eth_header_t;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : axis8_t;
 ref_toks_5 : unsigned) return eth8_frame_t_stream_t is
 
  variable base : eth8_frame_t_stream_t; 
  variable return_output : eth8_frame_t_stream_t;
begin
      base := ref_toks_0;
      base.data.header := ref_toks_1;
      base.data.header.dst_mac := ref_toks_2;
      base.data.header.src_mac := ref_toks_3;
      base.data.payload := ref_toks_4;
      base.valid := ref_toks_5;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_ab7f( ref_toks_0 : axis8_t) return unsigned is
 
  variable base : eth8_frame_t_stream_t; 
  variable return_output : unsigned(0 downto 0);
begin
      base.data.payload := ref_toks_0;

      return_output := base.data.payload.tlast;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_ethernet_top_c_l172_c17_2ea8 : 0 clocks latency
BIN_OP_AND_ethernet_top_c_l172_c17_2ea8 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_ethernet_top_c_l172_c17_2ea8_left,
BIN_OP_AND_ethernet_top_c_l172_c17_2ea8_right,
BIN_OP_AND_ethernet_top_c_l172_c17_2ea8_return_output);

-- eth_8_tx_ethernet_top_c_l176_c23_cc67 : 0 clocks latency
eth_8_tx_ethernet_top_c_l176_c23_cc67 : entity work.eth_8_tx_0CLK_418a2715 port map (
clk,
eth_8_tx_ethernet_top_c_l176_c23_cc67_CLOCK_ENABLE,
eth_8_tx_ethernet_top_c_l176_c23_cc67_frame,
eth_8_tx_ethernet_top_c_l176_c23_cc67_mac_axis_ready,
eth_8_tx_ethernet_top_c_l176_c23_cc67_return_output);

-- BIN_OP_AND_ethernet_top_c_l180_c29_3168 : 0 clocks latency
BIN_OP_AND_ethernet_top_c_l180_c29_3168 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_ethernet_top_c_l180_c29_3168_left,
BIN_OP_AND_ethernet_top_c_l180_c29_3168_right,
BIN_OP_AND_ethernet_top_c_l180_c29_3168_return_output);

-- BIN_OP_AND_ethernet_top_c_l189_c37_5c09 : 0 clocks latency
BIN_OP_AND_ethernet_top_c_l189_c37_5c09 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_ethernet_top_c_l189_c37_5c09_left,
BIN_OP_AND_ethernet_top_c_l189_c37_5c09_right,
BIN_OP_AND_ethernet_top_c_l189_c37_5c09_return_output);



-- Resolve what clock enable to use for user logic
clk_en_internal <= CLOCK_ENABLE(0);
-- Combinatorial process for pipeline stages
process (
CLOCK_ENABLE,
clk_en_internal,
 -- Clock cross input
 global_to_module,
 -- All submodule outputs
 BIN_OP_AND_ethernet_top_c_l172_c17_2ea8_return_output,
 eth_8_tx_ethernet_top_c_l176_c23_cc67_return_output,
 BIN_OP_AND_ethernet_top_c_l180_c29_3168_return_output,
 BIN_OP_AND_ethernet_top_c_l189_c37_5c09_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_loopback_headers_fifo_out : eth_header_t_stream_t;
 variable VAR_FPGA_MAC_BYTES : uint8_t_6;
 variable VAR_loopback_payload_fifo_out : axis8_t_stream_t;
 variable VAR_eth_tx_mac_input_ready : unsigned(0 downto 0);
 variable VAR_eth_tx_mac_axis_in : axis8_t_stream_t;
 variable VAR_loopback_payload_fifo_out_ready : unsigned(0 downto 0);
 variable VAR_loopback_headers_fifo_out_ready : unsigned(0 downto 0);
 variable VAR_frame : eth8_frame_t_stream_t;
 variable VAR_CONST_REF_RD_eth_header_t_eth_header_t_stream_t_data_d41d_ethernet_top_c_l151_c23_b496_return_output : eth_header_t;
 variable VAR_CONST_REF_RD_uint48_t_eth8_frame_t_stream_t_data_header_src_mac_8ae6_ethernet_top_c_l152_c31_21b0_return_output : unsigned(47 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e_ethernet_top_c_l153_c47_abe1_return_output : uint8_t_6;
 variable VAR_uint8_array6_be_ethernet_top_c_l153_c31_d206_return_output : unsigned(47 downto 0);
 variable VAR_CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d_ethernet_top_c_l171_c24_3167_return_output : axis8_t;
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_ethernet_top_c_l172_c17_e9fb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l172_c17_2ea8_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eth_header_t_stream_t_valid_d41d_ethernet_top_c_l172_c51_41a5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l172_c17_2ea8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l172_c17_2ea8_return_output : unsigned(0 downto 0);
 variable VAR_eth_tx : eth_8_tx_t;
 variable VAR_eth_8_tx_ethernet_top_c_l176_c23_cc67_frame : eth8_frame_t_stream_t;
 variable VAR_eth_8_tx_ethernet_top_c_l176_c23_cc67_mac_axis_ready : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_eth8_frame_t_stream_t_eth8_frame_t_stream_t_906d_ethernet_top_c_l176_c32_4eb8_return_output : eth8_frame_t_stream_t;
 variable VAR_eth_8_tx_ethernet_top_c_l176_c23_cc67_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eth_8_tx_ethernet_top_c_l176_c23_cc67_return_output : eth_8_tx_t;
 variable VAR_CONST_REF_RD_axis8_t_stream_t_eth_8_tx_t_mac_axis_d41d_ethernet_top_c_l177_c24_3810_return_output : axis8_t_stream_t;
 variable VAR_valid_and_ready : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l180_c29_3168_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eth_8_tx_t_frame_ready_d41d_ethernet_top_c_l180_c43_0c23_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l180_c29_3168_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l180_c29_3168_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_ab7f_ethernet_top_c_l189_c37_49ca_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l189_c37_5c09_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l189_c37_5c09_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l189_c37_5c09_return_output : unsigned(0 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     -- CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e[ethernet_top_c_l153_c47_abe1] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e_ethernet_top_c_l153_c47_abe1_return_output := CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e(
     to_unsigned(160, 8),
     to_unsigned(177, 8),
     to_unsigned(194, 8),
     to_unsigned(211, 8),
     to_unsigned(228, 8),
     to_unsigned(245, 8));

     -- Submodule level 1
     -- uint8_array6_be[ethernet_top_c_l153_c31_d206] LATENCY=0
     VAR_uint8_array6_be_ethernet_top_c_l153_c31_d206_return_output := uint8_array6_be(
     VAR_CONST_REF_RD_uint8_t_6_uint8_t_6_ca5e_ethernet_top_c_l153_c47_abe1_return_output);

     -- Submodule level 2
 -- Reads from global variables
     VAR_loopback_headers_fifo_out := global_to_module.loopback_headers_fifo_out;
     VAR_loopback_payload_fifo_out := global_to_module.loopback_payload_fifo_out;
     VAR_eth_tx_mac_input_ready := global_to_module.eth_tx_mac_input_ready;
     -- Submodule level 0
     VAR_eth_8_tx_ethernet_top_c_l176_c23_cc67_mac_axis_ready := VAR_eth_tx_mac_input_ready;
     -- CONST_REF_RD_uint1_t_eth_header_t_stream_t_valid_d41d[ethernet_top_c_l172_c51_41a5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth_header_t_stream_t_valid_d41d_ethernet_top_c_l172_c51_41a5_return_output := VAR_loopback_headers_fifo_out.valid;

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d[ethernet_top_c_l172_c17_e9fb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_ethernet_top_c_l172_c17_e9fb_return_output := VAR_loopback_payload_fifo_out.valid;

     -- CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d[ethernet_top_c_l171_c24_3167] LATENCY=0
     VAR_CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d_ethernet_top_c_l171_c24_3167_return_output := VAR_loopback_payload_fifo_out.data;

     -- CONST_REF_RD_eth_header_t_eth_header_t_stream_t_data_d41d[ethernet_top_c_l151_c23_b496] LATENCY=0
     VAR_CONST_REF_RD_eth_header_t_eth_header_t_stream_t_data_d41d_ethernet_top_c_l151_c23_b496_return_output := VAR_loopback_headers_fifo_out.data;

     -- Submodule level 1
     VAR_BIN_OP_AND_ethernet_top_c_l172_c17_2ea8_left := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_ethernet_top_c_l172_c17_e9fb_return_output;
     VAR_BIN_OP_AND_ethernet_top_c_l172_c17_2ea8_right := VAR_CONST_REF_RD_uint1_t_eth_header_t_stream_t_valid_d41d_ethernet_top_c_l172_c51_41a5_return_output;
     -- CONST_REF_RD_uint48_t_eth8_frame_t_stream_t_data_header_src_mac_8ae6[ethernet_top_c_l152_c31_21b0] LATENCY=0
     VAR_CONST_REF_RD_uint48_t_eth8_frame_t_stream_t_data_header_src_mac_8ae6_ethernet_top_c_l152_c31_21b0_return_output := CONST_REF_RD_uint48_t_eth8_frame_t_stream_t_data_header_src_mac_8ae6(
     VAR_CONST_REF_RD_eth_header_t_eth_header_t_stream_t_data_d41d_ethernet_top_c_l151_c23_b496_return_output);

     -- CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_ab7f[ethernet_top_c_l189_c37_49ca] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_ab7f_ethernet_top_c_l189_c37_49ca_return_output := CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_ab7f(
     VAR_CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d_ethernet_top_c_l171_c24_3167_return_output);

     -- Submodule level 2
     VAR_BIN_OP_AND_ethernet_top_c_l189_c37_5c09_left := VAR_CONST_REF_RD_uint1_t_eth8_frame_t_stream_t_data_payload_tlast_ab7f_ethernet_top_c_l189_c37_49ca_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;

     -- Submodule level 0
     VAR_eth_8_tx_ethernet_top_c_l176_c23_cc67_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     -- BIN_OP_AND[ethernet_top_c_l172_c17_2ea8] LATENCY=0
     -- Inputs
     BIN_OP_AND_ethernet_top_c_l172_c17_2ea8_left <= VAR_BIN_OP_AND_ethernet_top_c_l172_c17_2ea8_left;
     BIN_OP_AND_ethernet_top_c_l172_c17_2ea8_right <= VAR_BIN_OP_AND_ethernet_top_c_l172_c17_2ea8_right;
     -- Outputs
     VAR_BIN_OP_AND_ethernet_top_c_l172_c17_2ea8_return_output := BIN_OP_AND_ethernet_top_c_l172_c17_2ea8_return_output;

     -- Submodule level 1
     VAR_BIN_OP_AND_ethernet_top_c_l180_c29_3168_left := VAR_BIN_OP_AND_ethernet_top_c_l172_c17_2ea8_return_output;
     -- CONST_REF_RD_eth8_frame_t_stream_t_eth8_frame_t_stream_t_906d[ethernet_top_c_l176_c32_4eb8] LATENCY=0
     VAR_CONST_REF_RD_eth8_frame_t_stream_t_eth8_frame_t_stream_t_906d_ethernet_top_c_l176_c32_4eb8_return_output := CONST_REF_RD_eth8_frame_t_stream_t_eth8_frame_t_stream_t_906d(
     eth8_frame_t_stream_t_NULL,
     VAR_CONST_REF_RD_eth_header_t_eth_header_t_stream_t_data_d41d_ethernet_top_c_l151_c23_b496_return_output,
     VAR_CONST_REF_RD_uint48_t_eth8_frame_t_stream_t_data_header_src_mac_8ae6_ethernet_top_c_l152_c31_21b0_return_output,
     VAR_uint8_array6_be_ethernet_top_c_l153_c31_d206_return_output,
     VAR_CONST_REF_RD_axis8_t_axis8_t_stream_t_data_d41d_ethernet_top_c_l171_c24_3167_return_output,
     VAR_BIN_OP_AND_ethernet_top_c_l172_c17_2ea8_return_output);

     -- Submodule level 2
     VAR_eth_8_tx_ethernet_top_c_l176_c23_cc67_frame := VAR_CONST_REF_RD_eth8_frame_t_stream_t_eth8_frame_t_stream_t_906d_ethernet_top_c_l176_c32_4eb8_return_output;
     -- eth_8_tx[ethernet_top_c_l176_c23_cc67] LATENCY=0
     -- Clock enable
     eth_8_tx_ethernet_top_c_l176_c23_cc67_CLOCK_ENABLE <= VAR_eth_8_tx_ethernet_top_c_l176_c23_cc67_CLOCK_ENABLE;
     -- Inputs
     eth_8_tx_ethernet_top_c_l176_c23_cc67_frame <= VAR_eth_8_tx_ethernet_top_c_l176_c23_cc67_frame;
     eth_8_tx_ethernet_top_c_l176_c23_cc67_mac_axis_ready <= VAR_eth_8_tx_ethernet_top_c_l176_c23_cc67_mac_axis_ready;
     -- Outputs
     VAR_eth_8_tx_ethernet_top_c_l176_c23_cc67_return_output := eth_8_tx_ethernet_top_c_l176_c23_cc67_return_output;

     -- Submodule level 3
     -- CONST_REF_RD_axis8_t_stream_t_eth_8_tx_t_mac_axis_d41d[ethernet_top_c_l177_c24_3810] LATENCY=0
     VAR_CONST_REF_RD_axis8_t_stream_t_eth_8_tx_t_mac_axis_d41d_ethernet_top_c_l177_c24_3810_return_output := VAR_eth_8_tx_ethernet_top_c_l176_c23_cc67_return_output.mac_axis;

     -- CONST_REF_RD_uint1_t_eth_8_tx_t_frame_ready_d41d[ethernet_top_c_l180_c43_0c23] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth_8_tx_t_frame_ready_d41d_ethernet_top_c_l180_c43_0c23_return_output := VAR_eth_8_tx_ethernet_top_c_l176_c23_cc67_return_output.frame_ready;

     -- Submodule level 4
     VAR_eth_tx_mac_axis_in := VAR_CONST_REF_RD_axis8_t_stream_t_eth_8_tx_t_mac_axis_d41d_ethernet_top_c_l177_c24_3810_return_output;
     VAR_BIN_OP_AND_ethernet_top_c_l180_c29_3168_right := VAR_CONST_REF_RD_uint1_t_eth_8_tx_t_frame_ready_d41d_ethernet_top_c_l180_c43_0c23_return_output;
     -- BIN_OP_AND[ethernet_top_c_l180_c29_3168] LATENCY=0
     -- Inputs
     BIN_OP_AND_ethernet_top_c_l180_c29_3168_left <= VAR_BIN_OP_AND_ethernet_top_c_l180_c29_3168_left;
     BIN_OP_AND_ethernet_top_c_l180_c29_3168_right <= VAR_BIN_OP_AND_ethernet_top_c_l180_c29_3168_right;
     -- Outputs
     VAR_BIN_OP_AND_ethernet_top_c_l180_c29_3168_return_output := BIN_OP_AND_ethernet_top_c_l180_c29_3168_return_output;

     -- Submodule level 5
     VAR_BIN_OP_AND_ethernet_top_c_l189_c37_5c09_right := VAR_BIN_OP_AND_ethernet_top_c_l180_c29_3168_return_output;
     VAR_loopback_payload_fifo_out_ready := VAR_BIN_OP_AND_ethernet_top_c_l180_c29_3168_return_output;
     -- BIN_OP_AND[ethernet_top_c_l189_c37_5c09] LATENCY=0
     -- Inputs
     BIN_OP_AND_ethernet_top_c_l189_c37_5c09_left <= VAR_BIN_OP_AND_ethernet_top_c_l189_c37_5c09_left;
     BIN_OP_AND_ethernet_top_c_l189_c37_5c09_right <= VAR_BIN_OP_AND_ethernet_top_c_l189_c37_5c09_right;
     -- Outputs
     VAR_BIN_OP_AND_ethernet_top_c_l189_c37_5c09_return_output := BIN_OP_AND_ethernet_top_c_l189_c37_5c09_return_output;

     -- Submodule level 6
     VAR_loopback_headers_fifo_out_ready := VAR_BIN_OP_AND_ethernet_top_c_l189_c37_5c09_return_output;
   end if;
 end loop;

-- Global wires driven various places in pipeline
if clk_en_internal='1' then
  module_to_global.eth_tx_mac_axis_in <= VAR_eth_tx_mac_axis_in;
else
  module_to_global.eth_tx_mac_axis_in <= axis8_t_stream_t_NULL;
end if;
if clk_en_internal='1' then
  module_to_global.loopback_payload_fifo_out_ready <= VAR_loopback_payload_fifo_out_ready;
else
  module_to_global.loopback_payload_fifo_out_ready <= to_unsigned(0, 1);
end if;
if clk_en_internal='1' then
  module_to_global.loopback_headers_fifo_out_ready <= VAR_loopback_headers_fifo_out_ready;
else
  module_to_global.loopback_headers_fifo_out_ready <= to_unsigned(0, 1);
end if;
end process;

end arch;
