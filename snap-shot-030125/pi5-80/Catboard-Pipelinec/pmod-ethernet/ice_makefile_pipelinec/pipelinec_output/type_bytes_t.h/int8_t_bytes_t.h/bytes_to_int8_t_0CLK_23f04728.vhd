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
-- Submodules: 1
entity bytes_to_int8_t_0CLK_23f04728 is
port(
 bytes : in uint8_t_1;
 return_output : out signed(7 downto 0));
end bytes_to_int8_t_0CLK_23f04728;
architecture arch of bytes_to_int8_t_0CLK_23f04728 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
function int8_uint8_0( inp : signed;
 x : unsigned) return signed is

  --variable inp : signed(7 downto 0);
  --variable x : unsigned(7 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(7 downto 0) := x;
    
    return_output := signed(intermediate(7 downto 0)) ;
    
    return return_output;

end function;


begin

-- SUBMODULE INSTANCES 


-- Combinatorial process for pipeline stages
process (
 -- Inputs
 bytes)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : signed(7 downto 0);
 variable VAR_bytes : uint8_t_1;
 variable VAR_rv : signed(7 downto 0);
 variable VAR_rv_int8_t_bytes_t_h_l28_c1_ca2e : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_1_0_d41d_int8_t_bytes_t_h_l29_c23_b0dd_return_output : unsigned(7 downto 0);
 variable VAR_int8_uint8_0_int8_t_bytes_t_h_l29_c6_93b0_return_output : signed(7 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_rv_int8_t_bytes_t_h_l28_c1_ca2e := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_bytes := bytes;

     -- Submodule level 0
     -- CONST_REF_RD_uint8_t_uint8_t_1_0_d41d[int8_t_bytes_t_h_l29_c23_b0dd] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_1_0_d41d_int8_t_bytes_t_h_l29_c23_b0dd_return_output := VAR_bytes(0);

     -- Submodule level 1
     -- int8_uint8_0[int8_t_bytes_t_h_l29_c6_93b0] LATENCY=0
     VAR_int8_uint8_0_int8_t_bytes_t_h_l29_c6_93b0_return_output := int8_uint8_0(
     VAR_rv_int8_t_bytes_t_h_l28_c1_ca2e,
     VAR_CONST_REF_RD_uint8_t_uint8_t_1_0_d41d_int8_t_bytes_t_h_l29_c23_b0dd_return_output);

     -- Submodule level 2
     VAR_return_output := VAR_int8_uint8_0_int8_t_bytes_t_h_l29_c6_93b0_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
