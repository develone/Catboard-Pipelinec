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
-- Submodules: 3
entity work_serialize_0CLK_ec30ae69 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 in_data : in work_outputs_t;
 in_data_valid : in unsigned(0 downto 0);
 out_data_ready : in unsigned(0 downto 0);
 return_output : out work_serialize_t);
end work_serialize_0CLK_ec30ae69;
architecture arch of work_serialize_0CLK_ec30ae69 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Each function instance gets signals
-- work_outputs_t_to_bytes[ethernet_top_c_l78_c1432_e723]
signal work_outputs_t_to_bytes_ethernet_top_c_l78_c1432_e723_x : work_outputs_t;
signal work_outputs_t_to_bytes_ethernet_top_c_l78_c1432_e723_return_output : uint8_t_array_4_t;

-- work_serialize_serializer_in_to_out[ethernet_top_c_l78_c1535_45b0]
signal work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_CLOCK_ENABLE : unsigned(0 downto 0);
signal work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_in_data : uint8_t_4;
signal work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_in_data_valid : unsigned(0 downto 0);
signal work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_out_data_ready : unsigned(0 downto 0);
signal work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_return_output : work_serialize_serializer_in_to_out_t;

function CONST_REF_RD_work_serialize_t_work_serialize_t_d720( ref_toks_0 : uint8_t_1;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return work_serialize_t is
 
  variable base : work_serialize_t; 
  variable return_output : work_serialize_t;
begin
      base.out_data := ref_toks_0;
      base.valid := ref_toks_1;
      base.last := ref_toks_2;
      base.in_data_ready := ref_toks_3;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- work_outputs_t_to_bytes_ethernet_top_c_l78_c1432_e723 : 0 clocks latency
work_outputs_t_to_bytes_ethernet_top_c_l78_c1432_e723 : entity work.work_outputs_t_to_bytes_0CLK_82755757 port map (
work_outputs_t_to_bytes_ethernet_top_c_l78_c1432_e723_x,
work_outputs_t_to_bytes_ethernet_top_c_l78_c1432_e723_return_output);

-- work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0 : 0 clocks latency
work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0 : entity work.work_serialize_serializer_in_to_out_0CLK_d2b41046 port map (
clk,
work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_CLOCK_ENABLE,
work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_in_data,
work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_in_data_valid,
work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_out_data_ready,
work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_return_output);



-- Resolve what clock enable to use for user logic
clk_en_internal <= CLOCK_ENABLE(0);
-- Combinatorial process for pipeline stages
process (
CLOCK_ENABLE,
clk_en_internal,
 -- Inputs
 in_data,
 in_data_valid,
 out_data_ready,
 -- All submodule outputs
 work_outputs_t_to_bytes_ethernet_top_c_l78_c1432_e723_return_output,
 work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : work_serialize_t;
 variable VAR_in_data : work_outputs_t;
 variable VAR_in_data_valid : unsigned(0 downto 0);
 variable VAR_out_data_ready : unsigned(0 downto 0);
 variable VAR_input_bytes : uint8_t_array_4_t;
 variable VAR_work_outputs_t_to_bytes_ethernet_top_c_l78_c1432_e723_x : work_outputs_t;
 variable VAR_work_outputs_t_to_bytes_ethernet_top_c_l78_c1432_e723_return_output : uint8_t_array_4_t;
 variable VAR_o : work_serialize_t;
 variable VAR_to_bytes : work_serialize_serializer_in_to_out_t;
 variable VAR_work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_in_data : uint8_t_4;
 variable VAR_work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_in_data_valid : unsigned(0 downto 0);
 variable VAR_work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_out_data_ready : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_4_uint8_t_array_4_t_data_d41d_ethernet_top_c_l78_c1571_f905_return_output : uint8_t_4;
 variable VAR_work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_return_output : work_serialize_serializer_in_to_out_t;
 variable VAR_CONST_REF_RD_uint8_t_1_work_serialize_serializer_in_to_out_t_out_data_d41d_ethernet_top_c_l78_c1634_7b44_return_output : uint8_t_1;
 variable VAR_CONST_REF_RD_uint1_t_work_serialize_serializer_in_to_out_t_out_data_valid_d41d_ethernet_top_c_l78_c1663_d047_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_work_serialize_serializer_in_to_out_t_out_last_d41d_ethernet_top_c_l78_c1697_08bd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_work_serialize_serializer_in_to_out_t_in_data_ready_d41d_ethernet_top_c_l78_c1734_1745_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_work_serialize_t_work_serialize_t_d720_ethernet_top_c_l78_c1765_635c_return_output : work_serialize_t;
begin

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;
     -- Mux in inputs
     VAR_in_data := in_data;
     VAR_in_data_valid := in_data_valid;
     VAR_out_data_ready := out_data_ready;

     -- Submodule level 0
     VAR_work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_work_outputs_t_to_bytes_ethernet_top_c_l78_c1432_e723_x := VAR_in_data;
     VAR_work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_in_data_valid := VAR_in_data_valid;
     VAR_work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_out_data_ready := VAR_out_data_ready;
     -- work_outputs_t_to_bytes[ethernet_top_c_l78_c1432_e723] LATENCY=0
     -- Inputs
     work_outputs_t_to_bytes_ethernet_top_c_l78_c1432_e723_x <= VAR_work_outputs_t_to_bytes_ethernet_top_c_l78_c1432_e723_x;
     -- Outputs
     VAR_work_outputs_t_to_bytes_ethernet_top_c_l78_c1432_e723_return_output := work_outputs_t_to_bytes_ethernet_top_c_l78_c1432_e723_return_output;

     -- Submodule level 1
     -- CONST_REF_RD_uint8_t_4_uint8_t_array_4_t_data_d41d[ethernet_top_c_l78_c1571_f905] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_4_uint8_t_array_4_t_data_d41d_ethernet_top_c_l78_c1571_f905_return_output := VAR_work_outputs_t_to_bytes_ethernet_top_c_l78_c1432_e723_return_output.data;

     -- Submodule level 2
     VAR_work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_in_data := VAR_CONST_REF_RD_uint8_t_4_uint8_t_array_4_t_data_d41d_ethernet_top_c_l78_c1571_f905_return_output;
     -- work_serialize_serializer_in_to_out[ethernet_top_c_l78_c1535_45b0] LATENCY=0
     -- Clock enable
     work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_CLOCK_ENABLE <= VAR_work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_CLOCK_ENABLE;
     -- Inputs
     work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_in_data <= VAR_work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_in_data;
     work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_in_data_valid <= VAR_work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_in_data_valid;
     work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_out_data_ready <= VAR_work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_out_data_ready;
     -- Outputs
     VAR_work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_return_output := work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_return_output;

     -- Submodule level 3
     -- CONST_REF_RD_uint1_t_work_serialize_serializer_in_to_out_t_out_data_valid_d41d[ethernet_top_c_l78_c1663_d047] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_work_serialize_serializer_in_to_out_t_out_data_valid_d41d_ethernet_top_c_l78_c1663_d047_return_output := VAR_work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_return_output.out_data_valid;

     -- CONST_REF_RD_uint1_t_work_serialize_serializer_in_to_out_t_in_data_ready_d41d[ethernet_top_c_l78_c1734_1745] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_work_serialize_serializer_in_to_out_t_in_data_ready_d41d_ethernet_top_c_l78_c1734_1745_return_output := VAR_work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_return_output.in_data_ready;

     -- CONST_REF_RD_uint1_t_work_serialize_serializer_in_to_out_t_out_last_d41d[ethernet_top_c_l78_c1697_08bd] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_work_serialize_serializer_in_to_out_t_out_last_d41d_ethernet_top_c_l78_c1697_08bd_return_output := VAR_work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_return_output.out_last;

     -- CONST_REF_RD_uint8_t_1_work_serialize_serializer_in_to_out_t_out_data_d41d[ethernet_top_c_l78_c1634_7b44] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_1_work_serialize_serializer_in_to_out_t_out_data_d41d_ethernet_top_c_l78_c1634_7b44_return_output := VAR_work_serialize_serializer_in_to_out_ethernet_top_c_l78_c1535_45b0_return_output.out_data;

     -- Submodule level 4
     -- CONST_REF_RD_work_serialize_t_work_serialize_t_d720[ethernet_top_c_l78_c1765_635c] LATENCY=0
     VAR_CONST_REF_RD_work_serialize_t_work_serialize_t_d720_ethernet_top_c_l78_c1765_635c_return_output := CONST_REF_RD_work_serialize_t_work_serialize_t_d720(
     VAR_CONST_REF_RD_uint8_t_1_work_serialize_serializer_in_to_out_t_out_data_d41d_ethernet_top_c_l78_c1634_7b44_return_output,
     VAR_CONST_REF_RD_uint1_t_work_serialize_serializer_in_to_out_t_out_data_valid_d41d_ethernet_top_c_l78_c1663_d047_return_output,
     VAR_CONST_REF_RD_uint1_t_work_serialize_serializer_in_to_out_t_out_last_d41d_ethernet_top_c_l78_c1697_08bd_return_output,
     VAR_CONST_REF_RD_uint1_t_work_serialize_serializer_in_to_out_t_in_data_ready_d41d_ethernet_top_c_l78_c1734_1745_return_output);

     -- Submodule level 5
     VAR_return_output := VAR_CONST_REF_RD_work_serialize_t_work_serialize_t_d720_ethernet_top_c_l78_c1765_635c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
