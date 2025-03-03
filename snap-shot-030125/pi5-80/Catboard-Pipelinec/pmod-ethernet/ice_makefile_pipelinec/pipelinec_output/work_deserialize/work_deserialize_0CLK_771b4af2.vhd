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
entity work_deserialize_0CLK_771b4af2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 packet : in axis8_t_stream_t;
 output_ready : in unsigned(0 downto 0);
 return_output : out work_deserialize_t);
end work_deserialize_0CLK_771b4af2;
architecture arch of work_deserialize_0CLK_771b4af2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- Type holding all locally declared (feedback) wires of the func 
type feedback_vars_t is record
  -- Feedback vars
 ready_for_limter_out : unsigned(0 downto 0);
end record;
-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Feedback vars in the func
signal feedback_vars : feedback_vars_t;
-- Each function instance gets signals
-- axis8_max_len_limiter[ethernet_top_c_l77_c36_f29e]
signal axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_CLOCK_ENABLE : unsigned(0 downto 0);
signal axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_max_byte_len : unsigned(15 downto 0);
signal axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_in_stream : axis8_t_stream_t;
signal axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_ready_for_out_stream : unsigned(0 downto 0);
signal axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_return_output : axis8_max_len_limiter_t;

-- work_deserialize_type_byte_deserializer[ethernet_top_c_l77_c377_4d23]
signal work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_CLOCK_ENABLE : unsigned(0 downto 0);
signal work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_in_data : uint8_t_1;
signal work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_in_data_valid : unsigned(0 downto 0);
signal work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_out_data_ready : unsigned(0 downto 0);
signal work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_return_output : work_deserialize_type_byte_deserializer_t;

function CONST_REF_RD_uint8_t_1_uint8_t_1_4e8d( ref_toks_0 : unsigned) return uint8_t_1 is
 
  variable base : uint8_t_1; 
  variable return_output : uint8_t_1;
begin
      base(0) := ref_toks_0;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_work_deserialize_t_work_deserialize_t_f29f( ref_toks_0 : unsigned;
 ref_toks_1 : work_inputs_t;
 ref_toks_2 : unsigned) return work_deserialize_t is
 
  variable base : work_deserialize_t; 
  variable return_output : work_deserialize_t;
begin
      base.packet_ready := ref_toks_0;
      base.data := ref_toks_1;
      base.valid := ref_toks_2;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e : 0 clocks latency
axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e : entity work.axis8_max_len_limiter_0CLK_4c1c43f4 port map (
clk,
axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_CLOCK_ENABLE,
axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_max_byte_len,
axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_in_stream,
axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_ready_for_out_stream,
axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_return_output);

-- work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23 : 0 clocks latency
work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23 : entity work.work_deserialize_type_byte_deserializer_0CLK_099410d6 port map (
clk,
work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_CLOCK_ENABLE,
work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_in_data,
work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_in_data_valid,
work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_out_data_ready,
work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_return_output);



-- Resolve what clock enable to use for user logic
clk_en_internal <= CLOCK_ENABLE(0);
-- Combinatorial process for pipeline stages
process (
CLOCK_ENABLE,
clk_en_internal,
 -- Inputs
 packet,
 output_ready,
 -- Feedback vars
 feedback_vars,
 -- All submodule outputs
 axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_return_output,
 work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : work_deserialize_t;
 variable VAR_packet : axis8_t_stream_t;
 variable VAR_output_ready : unsigned(0 downto 0);
 variable VAR_o : work_deserialize_t;
 variable VAR_ready_for_limter_out : unsigned(0 downto 0);
 variable VAR_limiter : axis8_max_len_limiter_t;
 variable VAR_axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_max_byte_len : unsigned(15 downto 0);
 variable VAR_axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_in_stream : axis8_t_stream_t;
 variable VAR_axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_ready_for_out_stream : unsigned(0 downto 0);
 variable VAR_axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_return_output : axis8_max_len_limiter_t;
 variable VAR_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_ready_for_in_stream_d41d_ethernet_top_c_l77_c131_e14d_return_output : unsigned(0 downto 0);
 variable VAR_limited_packet : axis8_t_stream_t;
 variable VAR_CONST_REF_RD_axis8_t_stream_t_axis8_max_len_limiter_t_out_stream_d41d_ethernet_top_c_l77_c194_1d9b_return_output : axis8_t_stream_t;
 variable VAR_input_data : uint8_t_1;
 variable VAR_i : unsigned(31 downto 0);
 variable VAR_FOR_ethernet_top_c_l77_c253_247e_ITER_0_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_ethernet_top_c_l77_c293_e6dc_return_output : unsigned(7 downto 0);
 variable VAR_to_type : work_deserialize_type_byte_deserializer_t;
 variable VAR_work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_in_data : uint8_t_1;
 variable VAR_work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_in_data_valid : unsigned(0 downto 0);
 variable VAR_work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_out_data_ready : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_1_uint8_t_1_4e8d_ethernet_top_c_l77_c417_45c4_return_output : uint8_t_1;
 variable VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_ethernet_top_c_l77_c429_8744_return_output : unsigned(0 downto 0);
 variable VAR_work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_return_output : work_deserialize_type_byte_deserializer_t;
 variable VAR_CONST_REF_RD_work_inputs_t_work_deserialize_type_byte_deserializer_t_data_d41d_ethernet_top_c_l77_c475_ba39_return_output : work_inputs_t;
 variable VAR_CONST_REF_RD_uint1_t_work_deserialize_type_byte_deserializer_t_valid_d41d_ethernet_top_c_l77_c499_e15d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_work_deserialize_type_byte_deserializer_t_in_data_ready_d41d_ethernet_top_c_l77_c537_1b8b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_work_deserialize_t_work_deserialize_t_f29f_ethernet_top_c_l77_c567_5493_return_output : work_deserialize_t;
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_max_byte_len := resize(to_unsigned(8, 4), 16);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE(0) := clk_en_internal;
     -- Mux in inputs
     VAR_packet := packet;
     VAR_output_ready := output_ready;

     -- Submodule level 0
     VAR_axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_out_data_ready := VAR_output_ready;
     VAR_axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_in_stream := VAR_packet;
     VAR_axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_ready_for_out_stream := feedback_vars.ready_for_limter_out;
     -- axis8_max_len_limiter[ethernet_top_c_l77_c36_f29e] LATENCY=0
     -- Clock enable
     axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_CLOCK_ENABLE <= VAR_axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_CLOCK_ENABLE;
     -- Inputs
     axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_max_byte_len <= VAR_axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_max_byte_len;
     axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_in_stream <= VAR_axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_in_stream;
     axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_ready_for_out_stream <= VAR_axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_ready_for_out_stream;
     -- Outputs
     VAR_axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_return_output := axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_return_output;

     -- Submodule level 1
     -- CONST_REF_RD_axis8_t_stream_t_axis8_max_len_limiter_t_out_stream_d41d[ethernet_top_c_l77_c194_1d9b] LATENCY=0
     VAR_CONST_REF_RD_axis8_t_stream_t_axis8_max_len_limiter_t_out_stream_d41d_ethernet_top_c_l77_c194_1d9b_return_output := VAR_axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_return_output.out_stream;

     -- CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_ready_for_in_stream_d41d[ethernet_top_c_l77_c131_e14d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_ready_for_in_stream_d41d_ethernet_top_c_l77_c131_e14d_return_output := VAR_axis8_max_len_limiter_ethernet_top_c_l77_c36_f29e_return_output.ready_for_in_stream;

     -- Submodule level 2
     -- FOR_ethernet_top_c_l77_c253_247e_ITER_0_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d[ethernet_top_c_l77_c293_e6dc] LATENCY=0
     VAR_FOR_ethernet_top_c_l77_c253_247e_ITER_0_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_ethernet_top_c_l77_c293_e6dc_return_output := VAR_CONST_REF_RD_axis8_t_stream_t_axis8_max_len_limiter_t_out_stream_d41d_ethernet_top_c_l77_c194_1d9b_return_output.data.tdata(0);

     -- CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d[ethernet_top_c_l77_c429_8744] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_ethernet_top_c_l77_c429_8744_return_output := VAR_CONST_REF_RD_axis8_t_stream_t_axis8_max_len_limiter_t_out_stream_d41d_ethernet_top_c_l77_c194_1d9b_return_output.valid;

     -- Submodule level 3
     VAR_work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_in_data_valid := VAR_CONST_REF_RD_uint1_t_axis8_t_stream_t_valid_d41d_ethernet_top_c_l77_c429_8744_return_output;
     -- CONST_REF_RD_uint8_t_1_uint8_t_1_4e8d[ethernet_top_c_l77_c417_45c4] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_1_uint8_t_1_4e8d_ethernet_top_c_l77_c417_45c4_return_output := CONST_REF_RD_uint8_t_1_uint8_t_1_4e8d(
     VAR_FOR_ethernet_top_c_l77_c253_247e_ITER_0_CONST_REF_RD_uint8_t_axis8_t_stream_t_data_tdata_0_d41d_ethernet_top_c_l77_c293_e6dc_return_output);

     -- Submodule level 4
     VAR_work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_in_data := VAR_CONST_REF_RD_uint8_t_1_uint8_t_1_4e8d_ethernet_top_c_l77_c417_45c4_return_output;
     -- work_deserialize_type_byte_deserializer[ethernet_top_c_l77_c377_4d23] LATENCY=0
     -- Clock enable
     work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_CLOCK_ENABLE <= VAR_work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_CLOCK_ENABLE;
     -- Inputs
     work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_in_data <= VAR_work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_in_data;
     work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_in_data_valid <= VAR_work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_in_data_valid;
     work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_out_data_ready <= VAR_work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_out_data_ready;
     -- Outputs
     VAR_work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_return_output := work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_work_inputs_t_work_deserialize_type_byte_deserializer_t_data_d41d[ethernet_top_c_l77_c475_ba39] LATENCY=0
     VAR_CONST_REF_RD_work_inputs_t_work_deserialize_type_byte_deserializer_t_data_d41d_ethernet_top_c_l77_c475_ba39_return_output := VAR_work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_return_output.data;

     -- CONST_REF_RD_uint1_t_work_deserialize_type_byte_deserializer_t_valid_d41d[ethernet_top_c_l77_c499_e15d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_work_deserialize_type_byte_deserializer_t_valid_d41d_ethernet_top_c_l77_c499_e15d_return_output := VAR_work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_return_output.valid;

     -- CONST_REF_RD_uint1_t_work_deserialize_type_byte_deserializer_t_in_data_ready_d41d[ethernet_top_c_l77_c537_1b8b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_work_deserialize_type_byte_deserializer_t_in_data_ready_d41d_ethernet_top_c_l77_c537_1b8b_return_output := VAR_work_deserialize_type_byte_deserializer_ethernet_top_c_l77_c377_4d23_return_output.in_data_ready;

     -- Submodule level 6
     feedback_vars.ready_for_limter_out <= VAR_CONST_REF_RD_uint1_t_work_deserialize_type_byte_deserializer_t_in_data_ready_d41d_ethernet_top_c_l77_c537_1b8b_return_output;
     -- CONST_REF_RD_work_deserialize_t_work_deserialize_t_f29f[ethernet_top_c_l77_c567_5493] LATENCY=0
     VAR_CONST_REF_RD_work_deserialize_t_work_deserialize_t_f29f_ethernet_top_c_l77_c567_5493_return_output := CONST_REF_RD_work_deserialize_t_work_deserialize_t_f29f(
     VAR_CONST_REF_RD_uint1_t_axis8_max_len_limiter_t_ready_for_in_stream_d41d_ethernet_top_c_l77_c131_e14d_return_output,
     VAR_CONST_REF_RD_work_inputs_t_work_deserialize_type_byte_deserializer_t_data_d41d_ethernet_top_c_l77_c475_ba39_return_output,
     VAR_CONST_REF_RD_uint1_t_work_deserialize_type_byte_deserializer_t_valid_d41d_ethernet_top_c_l77_c499_e15d_return_output);

     -- Submodule level 7
     VAR_return_output := VAR_CONST_REF_RD_work_deserialize_t_work_deserialize_t_f29f_ethernet_top_c_l77_c567_5493_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
