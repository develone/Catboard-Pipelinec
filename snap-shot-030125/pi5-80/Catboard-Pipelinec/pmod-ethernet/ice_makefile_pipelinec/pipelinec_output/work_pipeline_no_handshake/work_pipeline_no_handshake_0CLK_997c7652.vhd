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
-- Submodules: 3
entity work_pipeline_no_handshake_0CLK_997c7652 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 global_to_module : in work_pipeline_no_handshake_global_to_module_t;
 module_to_global : out work_pipeline_no_handshake_module_to_global_t);
end work_pipeline_no_handshake_0CLK_997c7652;
architecture arch of work_pipeline_no_handshake_0CLK_997c7652 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Each function instance gets signals
-- work_pipeline_no_handshake_in_reg_func[ethernet_top_c_l72_c78_030a]
signal work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_CLOCK_ENABLE : unsigned(0 downto 0);
signal work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_data : work_inputs_t;
signal work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_id : unsigned(7 downto 0);
signal work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_valid : unsigned(0 downto 0);
signal work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_return_output : work_pipeline_no_handshake_in_reg_t;

-- work[ethernet_top_c_l72_c241_88f6]
signal work_ethernet_top_c_l72_c241_88f6_inputs : work_inputs_t;
signal work_ethernet_top_c_l72_c241_88f6_return_output : work_outputs_t;

-- work_pipeline_no_handshake_out_reg_func[ethernet_top_c_l72_c296_a732]
signal work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_CLOCK_ENABLE : unsigned(0 downto 0);
signal work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_data : work_outputs_t;
signal work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_id : unsigned(7 downto 0);
signal work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_valid : unsigned(0 downto 0);
signal work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_return_output : work_pipeline_no_handshake_out_reg_t;


begin

-- SUBMODULE INSTANCES 
-- work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a : 0 clocks latency
work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a : entity work.work_pipeline_no_handshake_in_reg_func_0CLK_b45f1687 port map (
clk,
work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_CLOCK_ENABLE,
work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_data,
work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_id,
work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_valid,
work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_return_output);

-- work_ethernet_top_c_l72_c241_88f6 : 0 clocks latency
work_ethernet_top_c_l72_c241_88f6 : entity work.work_0CLK_83e31706 port map (
work_ethernet_top_c_l72_c241_88f6_inputs,
work_ethernet_top_c_l72_c241_88f6_return_output);

-- work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732 : 0 clocks latency
work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732 : entity work.work_pipeline_no_handshake_out_reg_func_0CLK_b45f1687 port map (
clk,
work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_CLOCK_ENABLE,
work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_data,
work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_id,
work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_valid,
work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_return_output);



-- Resolve what clock enable to use for user logic
clk_en_internal <= CLOCK_ENABLE(0);
-- Combinatorial process for pipeline stages
process (
CLOCK_ENABLE,
clk_en_internal,
 -- Clock cross input
 global_to_module,
 -- All submodule outputs
 work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_return_output,
 work_ethernet_top_c_l72_c241_88f6_return_output,
 work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_work_pipeline_no_handshake_in : work_inputs_t;
 variable VAR_work_pipeline_no_handshake_in_id : unsigned(7 downto 0);
 variable VAR_work_pipeline_no_handshake_in_valid : unsigned(0 downto 0);
 variable VAR_work_pipeline_no_handshake_out : work_outputs_t;
 variable VAR_work_pipeline_no_handshake_out_id : unsigned(7 downto 0);
 variable VAR_work_pipeline_no_handshake_out_valid : unsigned(0 downto 0);
 variable VAR_i : work_pipeline_no_handshake_in_reg_t;
 variable VAR_work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_data : work_inputs_t;
 variable VAR_work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_id : unsigned(7 downto 0);
 variable VAR_work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_valid : unsigned(0 downto 0);
 variable VAR_work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_return_output : work_pipeline_no_handshake_in_reg_t;
 variable VAR_d : work_outputs_t;
 variable VAR_work_ethernet_top_c_l72_c241_88f6_inputs : work_inputs_t;
 variable VAR_CONST_REF_RD_work_inputs_t_work_pipeline_no_handshake_in_reg_t_data_d41d_ethernet_top_c_l72_c246_9cab_return_output : work_inputs_t;
 variable VAR_work_ethernet_top_c_l72_c241_88f6_return_output : work_outputs_t;
 variable VAR_o : work_pipeline_no_handshake_out_reg_t;
 variable VAR_work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_data : work_outputs_t;
 variable VAR_work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_id : unsigned(7 downto 0);
 variable VAR_work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_valid : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_work_pipeline_no_handshake_in_reg_t_id_d41d_ethernet_top_c_l72_c340_3080_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_work_pipeline_no_handshake_in_reg_t_valid_d41d_ethernet_top_c_l72_c346_d787_return_output : unsigned(0 downto 0);
 variable VAR_work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_return_output : work_pipeline_no_handshake_out_reg_t;
 variable VAR_CONST_REF_RD_work_outputs_t_work_pipeline_no_handshake_out_reg_t_data_d41d_ethernet_top_c_l72_c390_7593_return_output : work_outputs_t;
 variable VAR_CONST_REF_RD_uint8_t_work_pipeline_no_handshake_out_reg_t_id_d41d_ethernet_top_c_l72_c434_476d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_work_pipeline_no_handshake_out_reg_t_valid_d41d_ethernet_top_c_l72_c479_cde9_return_output : unsigned(0 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_id := to_unsigned(0, 8);
 -- Reads from global variables
     VAR_work_pipeline_no_handshake_in := global_to_module.work_pipeline_no_handshake_in;
     VAR_work_pipeline_no_handshake_in_valid := global_to_module.work_pipeline_no_handshake_in_valid;
     -- Submodule level 0
     VAR_work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_data := VAR_work_pipeline_no_handshake_in;
     VAR_work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_valid := VAR_work_pipeline_no_handshake_in_valid;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;

     -- Submodule level 0
     VAR_work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     -- work_pipeline_no_handshake_in_reg_func[ethernet_top_c_l72_c78_030a] LATENCY=0
     -- Clock enable
     work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_CLOCK_ENABLE <= VAR_work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_CLOCK_ENABLE;
     -- Inputs
     work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_data <= VAR_work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_data;
     work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_id <= VAR_work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_id;
     work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_valid <= VAR_work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_valid;
     -- Outputs
     VAR_work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_return_output := work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_return_output;

     -- Submodule level 1
     -- CONST_REF_RD_work_inputs_t_work_pipeline_no_handshake_in_reg_t_data_d41d[ethernet_top_c_l72_c246_9cab] LATENCY=0
     VAR_CONST_REF_RD_work_inputs_t_work_pipeline_no_handshake_in_reg_t_data_d41d_ethernet_top_c_l72_c246_9cab_return_output := VAR_work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_return_output.data;

     -- CONST_REF_RD_uint1_t_work_pipeline_no_handshake_in_reg_t_valid_d41d[ethernet_top_c_l72_c346_d787] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_work_pipeline_no_handshake_in_reg_t_valid_d41d_ethernet_top_c_l72_c346_d787_return_output := VAR_work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_return_output.valid;

     -- CONST_REF_RD_uint8_t_work_pipeline_no_handshake_in_reg_t_id_d41d[ethernet_top_c_l72_c340_3080] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_work_pipeline_no_handshake_in_reg_t_id_d41d_ethernet_top_c_l72_c340_3080_return_output := VAR_work_pipeline_no_handshake_in_reg_func_ethernet_top_c_l72_c78_030a_return_output.id;

     -- Submodule level 2
     VAR_work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_valid := VAR_CONST_REF_RD_uint1_t_work_pipeline_no_handshake_in_reg_t_valid_d41d_ethernet_top_c_l72_c346_d787_return_output;
     VAR_work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_id := VAR_CONST_REF_RD_uint8_t_work_pipeline_no_handshake_in_reg_t_id_d41d_ethernet_top_c_l72_c340_3080_return_output;
     VAR_work_ethernet_top_c_l72_c241_88f6_inputs := VAR_CONST_REF_RD_work_inputs_t_work_pipeline_no_handshake_in_reg_t_data_d41d_ethernet_top_c_l72_c246_9cab_return_output;
     -- work[ethernet_top_c_l72_c241_88f6] LATENCY=0
     -- Inputs
     work_ethernet_top_c_l72_c241_88f6_inputs <= VAR_work_ethernet_top_c_l72_c241_88f6_inputs;
     -- Outputs
     VAR_work_ethernet_top_c_l72_c241_88f6_return_output := work_ethernet_top_c_l72_c241_88f6_return_output;

     -- Submodule level 3
     VAR_work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_data := VAR_work_ethernet_top_c_l72_c241_88f6_return_output;
     -- work_pipeline_no_handshake_out_reg_func[ethernet_top_c_l72_c296_a732] LATENCY=0
     -- Clock enable
     work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_CLOCK_ENABLE <= VAR_work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_CLOCK_ENABLE;
     -- Inputs
     work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_data <= VAR_work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_data;
     work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_id <= VAR_work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_id;
     work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_valid <= VAR_work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_valid;
     -- Outputs
     VAR_work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_return_output := work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_return_output;

     -- Submodule level 4
     -- CONST_REF_RD_uint8_t_work_pipeline_no_handshake_out_reg_t_id_d41d[ethernet_top_c_l72_c434_476d] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_work_pipeline_no_handshake_out_reg_t_id_d41d_ethernet_top_c_l72_c434_476d_return_output := VAR_work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_return_output.id;

     -- CONST_REF_RD_work_outputs_t_work_pipeline_no_handshake_out_reg_t_data_d41d[ethernet_top_c_l72_c390_7593] LATENCY=0
     VAR_CONST_REF_RD_work_outputs_t_work_pipeline_no_handshake_out_reg_t_data_d41d_ethernet_top_c_l72_c390_7593_return_output := VAR_work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_return_output.data;

     -- CONST_REF_RD_uint1_t_work_pipeline_no_handshake_out_reg_t_valid_d41d[ethernet_top_c_l72_c479_cde9] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_work_pipeline_no_handshake_out_reg_t_valid_d41d_ethernet_top_c_l72_c479_cde9_return_output := VAR_work_pipeline_no_handshake_out_reg_func_ethernet_top_c_l72_c296_a732_return_output.valid;

     -- Submodule level 5
     VAR_work_pipeline_no_handshake_out_valid := VAR_CONST_REF_RD_uint1_t_work_pipeline_no_handshake_out_reg_t_valid_d41d_ethernet_top_c_l72_c479_cde9_return_output;
     VAR_work_pipeline_no_handshake_out_id := VAR_CONST_REF_RD_uint8_t_work_pipeline_no_handshake_out_reg_t_id_d41d_ethernet_top_c_l72_c434_476d_return_output;
     VAR_work_pipeline_no_handshake_out := VAR_CONST_REF_RD_work_outputs_t_work_pipeline_no_handshake_out_reg_t_data_d41d_ethernet_top_c_l72_c390_7593_return_output;
   end if;
 end loop;

-- Global wires driven various places in pipeline
if clk_en_internal='1' then
  module_to_global.work_pipeline_no_handshake_out <= VAR_work_pipeline_no_handshake_out;
else
  module_to_global.work_pipeline_no_handshake_out <= work_outputs_t_NULL;
end if;
if clk_en_internal='1' then
  module_to_global.work_pipeline_no_handshake_out_valid <= VAR_work_pipeline_no_handshake_out_valid;
else
  module_to_global.work_pipeline_no_handshake_out_valid <= to_unsigned(0, 1);
end if;
end process;

end arch;
