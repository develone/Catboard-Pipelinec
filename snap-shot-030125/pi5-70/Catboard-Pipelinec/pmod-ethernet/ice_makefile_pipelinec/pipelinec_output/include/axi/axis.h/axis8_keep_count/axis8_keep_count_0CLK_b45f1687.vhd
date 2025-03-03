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
-- Submodules: 0
entity axis8_keep_count_0CLK_b45f1687 is
port(
 s : in axis8_t_stream_t;
 return_output : out unsigned(0 downto 0));
end axis8_keep_count_0CLK_b45f1687;
architecture arch of axis8_keep_count_0CLK_b45f1687 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals

begin

-- SUBMODULE INSTANCES 


-- Combinatorial process for pipeline stages
process (
 -- Inputs
 s)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_s : axis8_t_stream_t;
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_axis_h_l42_c10_2afe_return_output : unsigned(0 downto 0);
begin

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_s := s;

     -- Submodule level 0
     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d[axis_h_l42_c10_2afe] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_axis_h_l42_c10_2afe_return_output := VAR_s.valid;

     -- Submodule level 1
     VAR_return_output := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_axis_h_l42_c10_2afe_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
