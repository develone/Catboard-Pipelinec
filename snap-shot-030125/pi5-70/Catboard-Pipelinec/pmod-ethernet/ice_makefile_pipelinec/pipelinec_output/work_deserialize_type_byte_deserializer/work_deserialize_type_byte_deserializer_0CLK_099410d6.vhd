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
-- Submodules: 4
entity work_deserialize_type_byte_deserializer_0CLK_099410d6 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 in_data : in uint8_t_1;
 in_data_valid : in unsigned(0 downto 0);
 out_data_ready : in unsigned(0 downto 0);
 return_output : out work_deserialize_type_byte_deserializer_t);
end work_deserialize_type_byte_deserializer_0CLK_099410d6;
architecture arch of work_deserialize_type_byte_deserializer_0CLK_099410d6 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Each function instance gets signals
-- work_deserialize_type_byte_deserializer_deserializer_in_to_out[ethernet_top_c_l77_c1802_576e]
signal work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_CLOCK_ENABLE : unsigned(0 downto 0);
signal work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_in_data : uint8_t_1;
signal work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_in_data_valid : unsigned(0 downto 0);
signal work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_out_data_ready : unsigned(0 downto 0);
signal work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_return_output : work_deserialize_type_byte_deserializer_deserializer_in_to_out_t;

-- bytes_to_work_inputs_t[ethernet_top_c_l77_c1991_0c7b]
signal bytes_to_work_inputs_t_ethernet_top_c_l77_c1991_0c7b_bytes : uint8_t_8;
signal bytes_to_work_inputs_t_ethernet_top_c_l77_c1991_0c7b_return_output : work_inputs_t;

function CONST_REF_RD_uint8_t_array_8_t_uint8_t_array_8_t_c961( ref_toks_0 : uint8_t_8) return uint8_t_array_8_t is
 
  variable base : uint8_t_array_8_t; 
  variable return_output : uint8_t_array_8_t;
begin
      base.data := ref_toks_0;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_work_deserialize_type_byte_deserializer_t_work_deserialize_type_byte_deserializer_t_b100( ref_toks_0 : work_inputs_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return work_deserialize_type_byte_deserializer_t is
 
  variable base : work_deserialize_type_byte_deserializer_t; 
  variable return_output : work_deserialize_type_byte_deserializer_t;
begin
      base.data := ref_toks_0;
      base.valid := ref_toks_1;
      base.in_data_ready := ref_toks_2;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e : 0 clocks latency
work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e : entity work.work_deserialize_type_byte_deserializer_deserializer_in_to_out_0CLK_d2b41046 port map (
clk,
work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_CLOCK_ENABLE,
work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_in_data,
work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_in_data_valid,
work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_out_data_ready,
work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_return_output);

-- bytes_to_work_inputs_t_ethernet_top_c_l77_c1991_0c7b : 0 clocks latency
bytes_to_work_inputs_t_ethernet_top_c_l77_c1991_0c7b : entity work.bytes_to_work_inputs_t_0CLK_5670a028 port map (
bytes_to_work_inputs_t_ethernet_top_c_l77_c1991_0c7b_bytes,
bytes_to_work_inputs_t_ethernet_top_c_l77_c1991_0c7b_return_output);



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
 work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_return_output,
 bytes_to_work_inputs_t_ethernet_top_c_l77_c1991_0c7b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : work_deserialize_type_byte_deserializer_t;
 variable VAR_in_data : uint8_t_1;
 variable VAR_in_data_valid : unsigned(0 downto 0);
 variable VAR_out_data_ready : unsigned(0 downto 0);
 variable VAR_o : work_deserialize_type_byte_deserializer_t;
 variable VAR_to_type_bytes : work_deserialize_type_byte_deserializer_deserializer_in_to_out_t;
 variable VAR_work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_in_data : uint8_t_1;
 variable VAR_work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_in_data_valid : unsigned(0 downto 0);
 variable VAR_work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_out_data_ready : unsigned(0 downto 0);
 variable VAR_work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_return_output : work_deserialize_type_byte_deserializer_deserializer_in_to_out_t;
 variable VAR_output_bytes : uint8_t_array_8_t;
 variable VAR_CONST_REF_RD_uint8_t_8_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_out_data_d41d_ethernet_top_c_l77_c1958_dbe7_return_output : uint8_t_8;
 variable VAR_bytes_to_work_inputs_t_ethernet_top_c_l77_c1991_0c7b_bytes : uint8_t_8;
 variable VAR_CONST_REF_RD_uint8_t_array_8_t_uint8_t_array_8_t_c961_ethernet_top_c_l77_c2014_0e4d_return_output : uint8_t_array_8_t;
 variable VAR_bytes_to_work_inputs_t_ethernet_top_c_l77_c1991_0c7b_return_output : work_inputs_t;
 variable VAR_CONST_REF_RD_uint1_t_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_out_data_valid_d41d_ethernet_top_c_l77_c2039_aa11_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_in_data_ready_d41d_ethernet_top_c_l77_c2087_37f9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_work_deserialize_type_byte_deserializer_t_work_deserialize_type_byte_deserializer_t_b100_ethernet_top_c_l77_c2123_2932_return_output : work_deserialize_type_byte_deserializer_t;
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
     VAR_work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_in_data := VAR_in_data;
     VAR_work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_in_data_valid := VAR_in_data_valid;
     VAR_work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_out_data_ready := VAR_out_data_ready;
     -- work_deserialize_type_byte_deserializer_deserializer_in_to_out[ethernet_top_c_l77_c1802_576e] LATENCY=0
     -- Clock enable
     work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_CLOCK_ENABLE <= VAR_work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_CLOCK_ENABLE;
     -- Inputs
     work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_in_data <= VAR_work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_in_data;
     work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_in_data_valid <= VAR_work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_in_data_valid;
     work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_out_data_ready <= VAR_work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_out_data_ready;
     -- Outputs
     VAR_work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_return_output := work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_return_output;

     -- Submodule level 1
     -- CONST_REF_RD_uint1_t_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_in_data_ready_d41d[ethernet_top_c_l77_c2087_37f9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_in_data_ready_d41d_ethernet_top_c_l77_c2087_37f9_return_output := VAR_work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_return_output.in_data_ready;

     -- CONST_REF_RD_uint8_t_8_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_out_data_d41d[ethernet_top_c_l77_c1958_dbe7] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_8_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_out_data_d41d_ethernet_top_c_l77_c1958_dbe7_return_output := VAR_work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_return_output.out_data;

     -- CONST_REF_RD_uint1_t_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_out_data_valid_d41d[ethernet_top_c_l77_c2039_aa11] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_out_data_valid_d41d_ethernet_top_c_l77_c2039_aa11_return_output := VAR_work_deserialize_type_byte_deserializer_deserializer_in_to_out_ethernet_top_c_l77_c1802_576e_return_output.out_data_valid;

     -- Submodule level 2
     -- CONST_REF_RD_uint8_t_array_8_t_uint8_t_array_8_t_c961[ethernet_top_c_l77_c2014_0e4d] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_array_8_t_uint8_t_array_8_t_c961_ethernet_top_c_l77_c2014_0e4d_return_output := CONST_REF_RD_uint8_t_array_8_t_uint8_t_array_8_t_c961(
     VAR_CONST_REF_RD_uint8_t_8_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_out_data_d41d_ethernet_top_c_l77_c1958_dbe7_return_output);

     -- Submodule level 3
     VAR_bytes_to_work_inputs_t_ethernet_top_c_l77_c1991_0c7b_bytes := VAR_CONST_REF_RD_uint8_t_array_8_t_uint8_t_array_8_t_c961_ethernet_top_c_l77_c2014_0e4d_return_output.data;
     -- bytes_to_work_inputs_t[ethernet_top_c_l77_c1991_0c7b] LATENCY=0
     -- Inputs
     bytes_to_work_inputs_t_ethernet_top_c_l77_c1991_0c7b_bytes <= VAR_bytes_to_work_inputs_t_ethernet_top_c_l77_c1991_0c7b_bytes;
     -- Outputs
     VAR_bytes_to_work_inputs_t_ethernet_top_c_l77_c1991_0c7b_return_output := bytes_to_work_inputs_t_ethernet_top_c_l77_c1991_0c7b_return_output;

     -- Submodule level 4
     -- CONST_REF_RD_work_deserialize_type_byte_deserializer_t_work_deserialize_type_byte_deserializer_t_b100[ethernet_top_c_l77_c2123_2932] LATENCY=0
     VAR_CONST_REF_RD_work_deserialize_type_byte_deserializer_t_work_deserialize_type_byte_deserializer_t_b100_ethernet_top_c_l77_c2123_2932_return_output := CONST_REF_RD_work_deserialize_type_byte_deserializer_t_work_deserialize_type_byte_deserializer_t_b100(
     VAR_bytes_to_work_inputs_t_ethernet_top_c_l77_c1991_0c7b_return_output,
     VAR_CONST_REF_RD_uint1_t_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_out_data_valid_d41d_ethernet_top_c_l77_c2039_aa11_return_output,
     VAR_CONST_REF_RD_uint1_t_work_deserialize_type_byte_deserializer_deserializer_in_to_out_t_in_data_ready_d41d_ethernet_top_c_l77_c2087_37f9_return_output);

     -- Submodule level 5
     VAR_return_output := VAR_CONST_REF_RD_work_deserialize_type_byte_deserializer_t_work_deserialize_type_byte_deserializer_t_b100_ethernet_top_c_l77_c2123_2932_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
