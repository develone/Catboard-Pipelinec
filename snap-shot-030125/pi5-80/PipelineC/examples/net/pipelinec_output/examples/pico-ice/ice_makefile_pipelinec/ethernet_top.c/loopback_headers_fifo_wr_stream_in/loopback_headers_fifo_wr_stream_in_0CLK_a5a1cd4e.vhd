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
-- Submodules: 2
entity loopback_headers_fifo_wr_stream_in_0CLK_a5a1cd4e is
port(
 CLOCK_ENABLE : in unsigned(0 downto 0);
 global_to_module : in loopback_headers_fifo_wr_stream_in_global_to_module_t;
 module_to_global : out loopback_headers_fifo_wr_stream_in_module_to_global_t);
end loopback_headers_fifo_wr_stream_in_0CLK_a5a1cd4e;
architecture arch of loopback_headers_fifo_wr_stream_in_0CLK_a5a1cd4e is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Each function instance gets signals
function CONST_REF_RD_eth_header_t_1_eth_header_t_1_4e8d( ref_toks_0 : eth_header_t) return eth_header_t_1 is
 
  variable base : eth_header_t_1; 
  variable return_output : eth_header_t_1;
begin
      base(0) := ref_toks_0;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 


-- Resolve what clock enable to use for user logic
clk_en_internal <= CLOCK_ENABLE(0);
-- Combinatorial process for pipeline stages
process (
CLOCK_ENABLE,
clk_en_internal,
 -- Clock cross input
 global_to_module)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_loopback_headers_fifo_in : eth_header_t_stream_t;
 variable VAR_loopback_headers_fifo_in_ready : unsigned(0 downto 0);
 variable VAR_din : eth_header_t_1;
 variable VAR_CONST_REF_RD_eth_header_t_eth_header_t_stream_t_data_d41d_ethernet_top_c_l88_c69_228c_return_output : eth_header_t;
 variable VAR_wr : loopback_headers_fifo_FIFO_write_t;
 variable VAR_loopback_headers_fifo_FIFO_WRITE_1_ethernet_top_c_l88_c142_a0ae_write_data : eth_header_t_1;
 variable VAR_loopback_headers_fifo_FIFO_WRITE_1_ethernet_top_c_l88_c142_a0ae_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_eth_header_t_1_eth_header_t_1_4e8d_ethernet_top_c_l88_c177_8653_return_output : eth_header_t_1;
 variable VAR_CONST_REF_RD_uint1_t_eth_header_t_stream_t_valid_d41d_ethernet_top_c_l88_c182_ced7_return_output : unsigned(0 downto 0);
 variable VAR_loopback_headers_fifo_FIFO_WRITE_1_ethernet_top_c_l88_c142_a0ae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_loopback_headers_fifo_FIFO_WRITE_1_ethernet_top_c_l88_c142_a0ae_return_output : loopback_headers_fifo_FIFO_write_t;
 variable VAR_CONST_REF_RD_uint1_t_loopback_headers_fifo_FIFO_write_t_ready_d41d_ethernet_top_c_l88_c248_4705_return_output : unsigned(0 downto 0);
begin
 -- Reads from global variables
     VAR_loopback_headers_fifo_in := global_to_module.loopback_headers_fifo_in;
     -- Submodule level 0
     -- CONST_REF_RD_eth_header_t_eth_header_t_stream_t_data_d41d[ethernet_top_c_l88_c69_228c] LATENCY=0
     VAR_CONST_REF_RD_eth_header_t_eth_header_t_stream_t_data_d41d_ethernet_top_c_l88_c69_228c_return_output := VAR_loopback_headers_fifo_in.data;

     -- CONST_REF_RD_uint1_t_eth_header_t_stream_t_valid_d41d[ethernet_top_c_l88_c182_ced7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_eth_header_t_stream_t_valid_d41d_ethernet_top_c_l88_c182_ced7_return_output := VAR_loopback_headers_fifo_in.valid;

     -- Submodule level 1
     VAR_loopback_headers_fifo_FIFO_WRITE_1_ethernet_top_c_l88_c142_a0ae_write_enable := VAR_CONST_REF_RD_uint1_t_eth_header_t_stream_t_valid_d41d_ethernet_top_c_l88_c182_ced7_return_output;
     -- CONST_REF_RD_eth_header_t_1_eth_header_t_1_4e8d[ethernet_top_c_l88_c177_8653] LATENCY=0
     VAR_CONST_REF_RD_eth_header_t_1_eth_header_t_1_4e8d_ethernet_top_c_l88_c177_8653_return_output := CONST_REF_RD_eth_header_t_1_eth_header_t_1_4e8d(
     VAR_CONST_REF_RD_eth_header_t_eth_header_t_stream_t_data_d41d_ethernet_top_c_l88_c69_228c_return_output);

     -- Submodule level 2
     VAR_loopback_headers_fifo_FIFO_WRITE_1_ethernet_top_c_l88_c142_a0ae_write_data := VAR_CONST_REF_RD_eth_header_t_1_eth_header_t_1_4e8d_ethernet_top_c_l88_c177_8653_return_output;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;

     -- Submodule level 0
     VAR_loopback_headers_fifo_FIFO_WRITE_1_ethernet_top_c_l88_c142_a0ae_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     -- loopback_headers_fifo_FIFO_WRITE_1[ethernet_top_c_l88_c142_a0ae] LATENCY=0
     -- Clock enable
     module_to_global.loopback_headers_fifo_FIFO_WRITE_1_CLOCK_ENABLE <= VAR_loopback_headers_fifo_FIFO_WRITE_1_ethernet_top_c_l88_c142_a0ae_CLOCK_ENABLE;
     -- Inputs
     module_to_global.loopback_headers_fifo_FIFO_WRITE_1_write_data <= VAR_loopback_headers_fifo_FIFO_WRITE_1_ethernet_top_c_l88_c142_a0ae_write_data;
     module_to_global.loopback_headers_fifo_FIFO_WRITE_1_write_enable <= VAR_loopback_headers_fifo_FIFO_WRITE_1_ethernet_top_c_l88_c142_a0ae_write_enable;
     -- Outputs
     VAR_loopback_headers_fifo_FIFO_WRITE_1_ethernet_top_c_l88_c142_a0ae_return_output := global_to_module.loopback_headers_fifo_FIFO_WRITE_1_return_output;

     -- Submodule level 1
     -- CONST_REF_RD_uint1_t_loopback_headers_fifo_FIFO_write_t_ready_d41d[ethernet_top_c_l88_c248_4705] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_loopback_headers_fifo_FIFO_write_t_ready_d41d_ethernet_top_c_l88_c248_4705_return_output := VAR_loopback_headers_fifo_FIFO_WRITE_1_ethernet_top_c_l88_c142_a0ae_return_output.ready;

     -- Submodule level 2
     VAR_loopback_headers_fifo_in_ready := VAR_CONST_REF_RD_uint1_t_loopback_headers_fifo_FIFO_write_t_ready_d41d_ethernet_top_c_l88_c248_4705_return_output;
   end if;
 end loop;

-- Global wires driven various places in pipeline
if clk_en_internal='1' then
  module_to_global.loopback_headers_fifo_in_ready <= VAR_loopback_headers_fifo_in_ready;
else
  module_to_global.loopback_headers_fifo_in_ready <= to_unsigned(0, 1);
end if;
end process;

end arch;
