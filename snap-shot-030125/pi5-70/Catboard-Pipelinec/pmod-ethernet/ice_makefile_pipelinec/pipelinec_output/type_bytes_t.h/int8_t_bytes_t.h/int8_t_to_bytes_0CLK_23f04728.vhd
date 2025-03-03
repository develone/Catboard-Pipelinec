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
-- Submodules: 2
entity int8_t_to_bytes_0CLK_23f04728 is
port(
 x : in signed(7 downto 0);
 return_output : out uint8_t_array_1_t);
end int8_t_to_bytes_0CLK_23f04728;
architecture arch of int8_t_to_bytes_0CLK_23f04728 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
function int8_7_0( x : signed) return unsigned is
--variable x : signed(7 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(7 downto 0)));
return return_output;
end function;

function CONST_REF_RD_uint8_t_array_1_t_uint8_t_array_1_t_5b41( ref_toks_0 : unsigned) return uint8_t_array_1_t is
 
  variable base : uint8_t_array_1_t; 
  variable return_output : uint8_t_array_1_t;
begin
      base.data(0) := ref_toks_0;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 


-- Combinatorial process for pipeline stages
process (
 -- Inputs
 x)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : uint8_t_array_1_t;
 variable VAR_x : signed(7 downto 0);
 variable VAR_rv : uint8_t_array_1_t;
 variable VAR_int8_7_0_int8_t_bytes_t_h_l11_c14_5823_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_array_1_t_uint8_t_array_1_t_5b41_int8_t_bytes_t_h_l13_c12_cb2d_return_output : uint8_t_array_1_t;
begin

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_x := x;

     -- Submodule level 0
     -- int8_7_0[int8_t_bytes_t_h_l11_c14_5823] LATENCY=0
     VAR_int8_7_0_int8_t_bytes_t_h_l11_c14_5823_return_output := int8_7_0(
     VAR_x);

     -- Submodule level 1
     -- CONST_REF_RD_uint8_t_array_1_t_uint8_t_array_1_t_5b41[int8_t_bytes_t_h_l13_c12_cb2d] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_array_1_t_uint8_t_array_1_t_5b41_int8_t_bytes_t_h_l13_c12_cb2d_return_output := CONST_REF_RD_uint8_t_array_1_t_uint8_t_array_1_t_5b41(
     VAR_int8_7_0_int8_t_bytes_t_h_l11_c14_5823_return_output);

     -- Submodule level 2
     VAR_return_output := VAR_CONST_REF_RD_uint8_t_array_1_t_uint8_t_array_1_t_5b41_int8_t_bytes_t_h_l13_c12_cb2d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
