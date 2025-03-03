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
-- Submodules: 17
entity work_serialize_serializer_in_to_out_0CLK_d2b41046 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 in_data : in uint8_t_4;
 in_data_valid : in unsigned(0 downto 0);
 out_data_ready : in unsigned(0 downto 0);
 return_output : out work_serialize_serializer_in_to_out_t);
end work_serialize_serializer_in_to_out_0CLK_d2b41046;
architecture arch of work_serialize_serializer_in_to_out_0CLK_d2b41046 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal in_buffer : uint8_t_4 := (others => to_unsigned(0, 8));
signal in_buffer_valid : unsigned(0 downto 0) := to_unsigned(0, 1);
signal out_counter : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_in_buffer : uint8_t_4;
signal REG_COMB_in_buffer_valid : unsigned(0 downto 0);
signal REG_COMB_out_counter : unsigned(15 downto 0);

-- Resolved maybe from input reg clock enable
signal clk_en_internal : std_logic;
-- Each function instance gets signals
-- BIN_OP_EQ[ethernet_top_c_l78_c616_40a4]
signal BIN_OP_EQ_ethernet_top_c_l78_c616_40a4_left : unsigned(15 downto 0);
signal BIN_OP_EQ_ethernet_top_c_l78_c616_40a4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_ethernet_top_c_l78_c616_40a4_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[ethernet_top_c_l78_c682_e74d]
signal BIN_OP_AND_ethernet_top_c_l78_c682_e74d_left : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l78_c682_e74d_right : unsigned(0 downto 0);
signal BIN_OP_AND_ethernet_top_c_l78_c682_e74d_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[ethernet_top_c_l78_c732_1b95]
signal UNARY_OP_NOT_ethernet_top_c_l78_c732_1b95_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_ethernet_top_c_l78_c732_1b95_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[ethernet_top_c_l78_c732_94f4]
signal BIN_OP_OR_ethernet_top_c_l78_c732_94f4_left : unsigned(0 downto 0);
signal BIN_OP_OR_ethernet_top_c_l78_c732_94f4_right : unsigned(0 downto 0);
signal BIN_OP_OR_ethernet_top_c_l78_c732_94f4_return_output : unsigned(0 downto 0);

-- out_counter_MUX[ethernet_top_c_l78_c765_b76d]
signal out_counter_MUX_ethernet_top_c_l78_c765_b76d_cond : unsigned(0 downto 0);
signal out_counter_MUX_ethernet_top_c_l78_c765_b76d_iftrue : unsigned(15 downto 0);
signal out_counter_MUX_ethernet_top_c_l78_c765_b76d_iffalse : unsigned(15 downto 0);
signal out_counter_MUX_ethernet_top_c_l78_c765_b76d_return_output : unsigned(15 downto 0);

-- in_buffer_valid_MUX[ethernet_top_c_l78_c765_b76d]
signal in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_cond : unsigned(0 downto 0);
signal in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_iftrue : unsigned(0 downto 0);
signal in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_iffalse : unsigned(0 downto 0);
signal in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_return_output : unsigned(0 downto 0);

-- in_buffer_0_MUX[ethernet_top_c_l78_c765_b76d]
signal in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_cond : unsigned(0 downto 0);
signal in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_iftrue : unsigned(7 downto 0);
signal in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_iffalse : unsigned(7 downto 0);
signal in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_return_output : unsigned(7 downto 0);

-- in_buffer_1_MUX[ethernet_top_c_l78_c765_b76d]
signal in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_cond : unsigned(0 downto 0);
signal in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_iftrue : unsigned(7 downto 0);
signal in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_iffalse : unsigned(7 downto 0);
signal in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_return_output : unsigned(7 downto 0);

-- in_buffer_2_MUX[ethernet_top_c_l78_c765_b76d]
signal in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_cond : unsigned(0 downto 0);
signal in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_iftrue : unsigned(7 downto 0);
signal in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_iffalse : unsigned(7 downto 0);
signal in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[ethernet_top_c_l78_c974_4a0a]
signal BIN_OP_PLUS_ethernet_top_c_l78_c974_4a0a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_ethernet_top_c_l78_c974_4a0a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_ethernet_top_c_l78_c974_4a0a_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[ethernet_top_c_l78_c995_95b3]
signal BIN_OP_EQ_ethernet_top_c_l78_c995_95b3_left : unsigned(15 downto 0);
signal BIN_OP_EQ_ethernet_top_c_l78_c995_95b3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_ethernet_top_c_l78_c995_95b3_return_output : unsigned(0 downto 0);

-- in_buffer_valid_MUX[ethernet_top_c_l78_c992_9a74]
signal in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_cond : unsigned(0 downto 0);
signal in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_iftrue : unsigned(0 downto 0);
signal in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_iffalse : unsigned(0 downto 0);
signal in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_return_output : unsigned(0 downto 0);

-- out_counter_MUX[ethernet_top_c_l78_c1059_65d1]
signal out_counter_MUX_ethernet_top_c_l78_c1059_65d1_cond : unsigned(0 downto 0);
signal out_counter_MUX_ethernet_top_c_l78_c1059_65d1_iftrue : unsigned(15 downto 0);
signal out_counter_MUX_ethernet_top_c_l78_c1059_65d1_iffalse : unsigned(15 downto 0);
signal out_counter_MUX_ethernet_top_c_l78_c1059_65d1_return_output : unsigned(15 downto 0);

-- in_buffer_valid_MUX[ethernet_top_c_l78_c1059_65d1]
signal in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_cond : unsigned(0 downto 0);
signal in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_iftrue : unsigned(0 downto 0);
signal in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_iffalse : unsigned(0 downto 0);
signal in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_return_output : unsigned(0 downto 0);

-- in_buffer_MUX[ethernet_top_c_l78_c1059_65d1]
signal in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_cond : unsigned(0 downto 0);
signal in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_iftrue : uint8_t_4;
signal in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_iffalse : uint8_t_4;
signal in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_return_output : uint8_t_4;

function CONST_REF_RD_uint8_t_4_uint8_t_4_c538( ref_toks_0 : uint8_t_4;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return uint8_t_4 is
 
  variable base : uint8_t_4; 
  variable return_output : uint8_t_4;
begin
      base := ref_toks_0;
      base(0) := ref_toks_1;
      base(1) := ref_toks_2;
      base(2) := ref_toks_3;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_work_serialize_serializer_in_to_out_t_work_serialize_serializer_in_to_out_t_6ac9( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return work_serialize_serializer_in_to_out_t is
 
  variable base : work_serialize_serializer_in_to_out_t; 
  variable return_output : work_serialize_serializer_in_to_out_t;
begin
      base.out_data(0) := ref_toks_0;
      base.out_data_valid := ref_toks_1;
      base.out_last := ref_toks_2;
      base.in_data_ready := ref_toks_3;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_ethernet_top_c_l78_c616_40a4 : 0 clocks latency
BIN_OP_EQ_ethernet_top_c_l78_c616_40a4 : entity work.BIN_OP_EQ_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_ethernet_top_c_l78_c616_40a4_left,
BIN_OP_EQ_ethernet_top_c_l78_c616_40a4_right,
BIN_OP_EQ_ethernet_top_c_l78_c616_40a4_return_output);

-- BIN_OP_AND_ethernet_top_c_l78_c682_e74d : 0 clocks latency
BIN_OP_AND_ethernet_top_c_l78_c682_e74d : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_ethernet_top_c_l78_c682_e74d_left,
BIN_OP_AND_ethernet_top_c_l78_c682_e74d_right,
BIN_OP_AND_ethernet_top_c_l78_c682_e74d_return_output);

-- UNARY_OP_NOT_ethernet_top_c_l78_c732_1b95 : 0 clocks latency
UNARY_OP_NOT_ethernet_top_c_l78_c732_1b95 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_ethernet_top_c_l78_c732_1b95_expr,
UNARY_OP_NOT_ethernet_top_c_l78_c732_1b95_return_output);

-- BIN_OP_OR_ethernet_top_c_l78_c732_94f4 : 0 clocks latency
BIN_OP_OR_ethernet_top_c_l78_c732_94f4 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_ethernet_top_c_l78_c732_94f4_left,
BIN_OP_OR_ethernet_top_c_l78_c732_94f4_right,
BIN_OP_OR_ethernet_top_c_l78_c732_94f4_return_output);

-- out_counter_MUX_ethernet_top_c_l78_c765_b76d : 0 clocks latency
out_counter_MUX_ethernet_top_c_l78_c765_b76d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
out_counter_MUX_ethernet_top_c_l78_c765_b76d_cond,
out_counter_MUX_ethernet_top_c_l78_c765_b76d_iftrue,
out_counter_MUX_ethernet_top_c_l78_c765_b76d_iffalse,
out_counter_MUX_ethernet_top_c_l78_c765_b76d_return_output);

-- in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d : 0 clocks latency
in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_cond,
in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_iftrue,
in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_iffalse,
in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_return_output);

-- in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d : 0 clocks latency
in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_cond,
in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_iftrue,
in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_iffalse,
in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_return_output);

-- in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d : 0 clocks latency
in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_cond,
in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_iftrue,
in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_iffalse,
in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_return_output);

-- in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d : 0 clocks latency
in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_cond,
in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_iftrue,
in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_iffalse,
in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_return_output);

-- BIN_OP_PLUS_ethernet_top_c_l78_c974_4a0a : 0 clocks latency
BIN_OP_PLUS_ethernet_top_c_l78_c974_4a0a : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_ethernet_top_c_l78_c974_4a0a_left,
BIN_OP_PLUS_ethernet_top_c_l78_c974_4a0a_right,
BIN_OP_PLUS_ethernet_top_c_l78_c974_4a0a_return_output);

-- BIN_OP_EQ_ethernet_top_c_l78_c995_95b3 : 0 clocks latency
BIN_OP_EQ_ethernet_top_c_l78_c995_95b3 : entity work.BIN_OP_EQ_uint16_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_ethernet_top_c_l78_c995_95b3_left,
BIN_OP_EQ_ethernet_top_c_l78_c995_95b3_right,
BIN_OP_EQ_ethernet_top_c_l78_c995_95b3_return_output);

-- in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74 : 0 clocks latency
in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_cond,
in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_iftrue,
in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_iffalse,
in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_return_output);

-- out_counter_MUX_ethernet_top_c_l78_c1059_65d1 : 0 clocks latency
out_counter_MUX_ethernet_top_c_l78_c1059_65d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
out_counter_MUX_ethernet_top_c_l78_c1059_65d1_cond,
out_counter_MUX_ethernet_top_c_l78_c1059_65d1_iftrue,
out_counter_MUX_ethernet_top_c_l78_c1059_65d1_iffalse,
out_counter_MUX_ethernet_top_c_l78_c1059_65d1_return_output);

-- in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1 : 0 clocks latency
in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_cond,
in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_iftrue,
in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_iffalse,
in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_return_output);

-- in_buffer_MUX_ethernet_top_c_l78_c1059_65d1 : 0 clocks latency
in_buffer_MUX_ethernet_top_c_l78_c1059_65d1 : entity work.MUX_uint1_t_uint8_t_4_uint8_t_4_0CLK_de264c78 port map (
in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_cond,
in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_iftrue,
in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_iffalse,
in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_return_output);



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
 -- Registers
 in_buffer,
 in_buffer_valid,
 out_counter,
 -- All submodule outputs
 BIN_OP_EQ_ethernet_top_c_l78_c616_40a4_return_output,
 BIN_OP_AND_ethernet_top_c_l78_c682_e74d_return_output,
 UNARY_OP_NOT_ethernet_top_c_l78_c732_1b95_return_output,
 BIN_OP_OR_ethernet_top_c_l78_c732_94f4_return_output,
 out_counter_MUX_ethernet_top_c_l78_c765_b76d_return_output,
 in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_return_output,
 in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_return_output,
 in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_return_output,
 in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_return_output,
 BIN_OP_PLUS_ethernet_top_c_l78_c974_4a0a_return_output,
 BIN_OP_EQ_ethernet_top_c_l78_c995_95b3_return_output,
 in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_return_output,
 out_counter_MUX_ethernet_top_c_l78_c1059_65d1_return_output,
 in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_return_output,
 in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : work_serialize_serializer_in_to_out_t;
 variable VAR_in_data : uint8_t_4;
 variable VAR_in_data_valid : unsigned(0 downto 0);
 variable VAR_out_data_ready : unsigned(0 downto 0);
 variable VAR_rv : work_serialize_serializer_in_to_out_t;
 variable VAR_i : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_ethernet_top_c_l78_c616_40a4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_ethernet_top_c_l78_c616_40a4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_ethernet_top_c_l78_c616_40a4_return_output : unsigned(0 downto 0);
 variable VAR_last_outgoing : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l78_c682_e74d_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l78_c682_e74d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_ethernet_top_c_l78_c682_e74d_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_ethernet_top_c_l78_c732_1b95_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_ethernet_top_c_l78_c732_1b95_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_ethernet_top_c_l78_c732_94f4_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_ethernet_top_c_l78_c732_94f4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_ethernet_top_c_l78_c732_94f4_return_output : unsigned(0 downto 0);
 variable VAR_out_counter_MUX_ethernet_top_c_l78_c765_b76d_iftrue : unsigned(15 downto 0);
 variable VAR_out_counter_ethernet_top_c_l78_c974_6004 : unsigned(15 downto 0);
 variable VAR_out_counter_MUX_ethernet_top_c_l78_c765_b76d_iffalse : unsigned(15 downto 0);
 variable VAR_out_counter_MUX_ethernet_top_c_l78_c765_b76d_return_output : unsigned(15 downto 0);
 variable VAR_out_counter_MUX_ethernet_top_c_l78_c765_b76d_cond : unsigned(0 downto 0);
 variable VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_iftrue : unsigned(0 downto 0);
 variable VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_return_output : unsigned(0 downto 0);
 variable VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_iffalse : unsigned(0 downto 0);
 variable VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_return_output : unsigned(0 downto 0);
 variable VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_cond : unsigned(0 downto 0);
 variable VAR_in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_iftrue : unsigned(7 downto 0);
 variable VAR_in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_iffalse : unsigned(7 downto 0);
 variable VAR_in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_return_output : unsigned(7 downto 0);
 variable VAR_in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_cond : unsigned(0 downto 0);
 variable VAR_in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_iftrue : unsigned(7 downto 0);
 variable VAR_in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_iffalse : unsigned(7 downto 0);
 variable VAR_in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_return_output : unsigned(7 downto 0);
 variable VAR_in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_cond : unsigned(0 downto 0);
 variable VAR_in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_iftrue : unsigned(7 downto 0);
 variable VAR_in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_iffalse : unsigned(7 downto 0);
 variable VAR_in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_return_output : unsigned(7 downto 0);
 variable VAR_in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_cond : unsigned(0 downto 0);
 variable VAR_ARRAY_SHIFT_DOWN_i : unsigned(31 downto 0);
 variable VAR_FOR_ethernet_top_c_l78_c815_0ed0_ITER_2_CONST_REF_RD_uint8_t_uint8_t_4_3_d41d_ethernet_top_c_l78_c941_1ca8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_ethernet_top_c_l78_c974_4a0a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_ethernet_top_c_l78_c974_4a0a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_ethernet_top_c_l78_c974_4a0a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_ethernet_top_c_l78_c995_95b3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_ethernet_top_c_l78_c995_95b3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_ethernet_top_c_l78_c995_95b3_return_output : unsigned(0 downto 0);
 variable VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_iftrue : unsigned(0 downto 0);
 variable VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_iffalse : unsigned(0 downto 0);
 variable VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_cond : unsigned(0 downto 0);
 variable VAR_out_counter_MUX_ethernet_top_c_l78_c1059_65d1_iftrue : unsigned(15 downto 0);
 variable VAR_out_counter_ethernet_top_c_l78_c1136_75a9 : unsigned(15 downto 0);
 variable VAR_out_counter_MUX_ethernet_top_c_l78_c1059_65d1_iffalse : unsigned(15 downto 0);
 variable VAR_out_counter_MUX_ethernet_top_c_l78_c1059_65d1_return_output : unsigned(15 downto 0);
 variable VAR_out_counter_MUX_ethernet_top_c_l78_c1059_65d1_cond : unsigned(0 downto 0);
 variable VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_iftrue : unsigned(0 downto 0);
 variable VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_iffalse : unsigned(0 downto 0);
 variable VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_return_output : unsigned(0 downto 0);
 variable VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_cond : unsigned(0 downto 0);
 variable VAR_in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_iftrue : uint8_t_4;
 variable VAR_in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_iffalse : uint8_t_4;
 variable VAR_in_buffer_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_4_uint8_t_4_c538_ethernet_top_c_l78_c1059_65d1_return_output : uint8_t_4;
 variable VAR_in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_return_output : uint8_t_4;
 variable VAR_in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_work_serialize_serializer_in_to_out_t_work_serialize_serializer_in_to_out_t_6ac9_ethernet_top_c_l78_c1162_b606_return_output : work_serialize_serializer_in_to_out_t;
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_4_0_d41d_ethernet_top_c_l78_DUPLICATE_cbc3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_4_1_d41d_ethernet_top_c_l78_DUPLICATE_10fb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_uint8_t_4_2_d41d_ethernet_top_c_l78_DUPLICATE_95fc_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_in_buffer : uint8_t_4;
variable REG_VAR_in_buffer_valid : unsigned(0 downto 0);
variable REG_VAR_out_counter : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_in_buffer := in_buffer;
  REG_VAR_in_buffer_valid := in_buffer_valid;
  REG_VAR_out_counter := out_counter;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_out_counter_ethernet_top_c_l78_c1136_75a9 := resize(to_unsigned(0, 1), 16);
     VAR_out_counter_MUX_ethernet_top_c_l78_c1059_65d1_iftrue := VAR_out_counter_ethernet_top_c_l78_c1136_75a9;
     VAR_BIN_OP_EQ_ethernet_top_c_l78_c616_40a4_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_ethernet_top_c_l78_c974_4a0a_right := to_unsigned(1, 1);
     VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_ethernet_top_c_l78_c995_95b3_right := to_unsigned(4, 3);

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
     VAR_UNARY_OP_NOT_ethernet_top_c_l78_c732_1b95_expr := in_buffer_valid;
     VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_iffalse := in_buffer_valid;
     VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_iffalse := in_buffer_valid;
     VAR_in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_iftrue := VAR_in_data;
     VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_iftrue := VAR_in_data_valid;
     VAR_BIN_OP_EQ_ethernet_top_c_l78_c616_40a4_left := out_counter;
     VAR_BIN_OP_PLUS_ethernet_top_c_l78_c974_4a0a_left := out_counter;
     VAR_out_counter_MUX_ethernet_top_c_l78_c765_b76d_iffalse := out_counter;
     VAR_BIN_OP_AND_ethernet_top_c_l78_c682_e74d_left := VAR_out_data_ready;
     VAR_in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_cond := VAR_out_data_ready;
     VAR_in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_cond := VAR_out_data_ready;
     VAR_in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_cond := VAR_out_data_ready;
     VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_cond := VAR_out_data_ready;
     VAR_out_counter_MUX_ethernet_top_c_l78_c765_b76d_cond := VAR_out_data_ready;
     -- BIN_OP_PLUS[ethernet_top_c_l78_c974_4a0a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_ethernet_top_c_l78_c974_4a0a_left <= VAR_BIN_OP_PLUS_ethernet_top_c_l78_c974_4a0a_left;
     BIN_OP_PLUS_ethernet_top_c_l78_c974_4a0a_right <= VAR_BIN_OP_PLUS_ethernet_top_c_l78_c974_4a0a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_ethernet_top_c_l78_c974_4a0a_return_output := BIN_OP_PLUS_ethernet_top_c_l78_c974_4a0a_return_output;

     -- CONST_REF_RD_uint8_t_uint8_t_4_0_d41d_ethernet_top_c_l78_DUPLICATE_cbc3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_4_0_d41d_ethernet_top_c_l78_DUPLICATE_cbc3_return_output := in_buffer(0);

     -- BIN_OP_EQ[ethernet_top_c_l78_c616_40a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_ethernet_top_c_l78_c616_40a4_left <= VAR_BIN_OP_EQ_ethernet_top_c_l78_c616_40a4_left;
     BIN_OP_EQ_ethernet_top_c_l78_c616_40a4_right <= VAR_BIN_OP_EQ_ethernet_top_c_l78_c616_40a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_ethernet_top_c_l78_c616_40a4_return_output := BIN_OP_EQ_ethernet_top_c_l78_c616_40a4_return_output;

     -- CONST_REF_RD_uint8_t_uint8_t_4_2_d41d_ethernet_top_c_l78_DUPLICATE_95fc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_4_2_d41d_ethernet_top_c_l78_DUPLICATE_95fc_return_output := in_buffer(2);

     -- FOR_ethernet_top_c_l78_c815_0ed0_ITER_2_CONST_REF_RD_uint8_t_uint8_t_4_3_d41d[ethernet_top_c_l78_c941_1ca8] LATENCY=0
     VAR_FOR_ethernet_top_c_l78_c815_0ed0_ITER_2_CONST_REF_RD_uint8_t_uint8_t_4_3_d41d_ethernet_top_c_l78_c941_1ca8_return_output := in_buffer(3);

     -- CONST_REF_RD_uint8_t_uint8_t_4_1_d41d_ethernet_top_c_l78_DUPLICATE_10fb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_uint8_t_4_1_d41d_ethernet_top_c_l78_DUPLICATE_10fb_return_output := in_buffer(1);

     -- UNARY_OP_NOT[ethernet_top_c_l78_c732_1b95] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_ethernet_top_c_l78_c732_1b95_expr <= VAR_UNARY_OP_NOT_ethernet_top_c_l78_c732_1b95_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_ethernet_top_c_l78_c732_1b95_return_output := UNARY_OP_NOT_ethernet_top_c_l78_c732_1b95_return_output;

     -- Submodule level 1
     VAR_BIN_OP_AND_ethernet_top_c_l78_c682_e74d_right := VAR_BIN_OP_EQ_ethernet_top_c_l78_c616_40a4_return_output;
     VAR_out_counter_ethernet_top_c_l78_c974_6004 := resize(VAR_BIN_OP_PLUS_ethernet_top_c_l78_c974_4a0a_return_output, 16);
     VAR_in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_iffalse := VAR_CONST_REF_RD_uint8_t_uint8_t_4_0_d41d_ethernet_top_c_l78_DUPLICATE_cbc3_return_output;
     VAR_in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_iftrue := VAR_CONST_REF_RD_uint8_t_uint8_t_4_1_d41d_ethernet_top_c_l78_DUPLICATE_10fb_return_output;
     VAR_in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_iffalse := VAR_CONST_REF_RD_uint8_t_uint8_t_4_1_d41d_ethernet_top_c_l78_DUPLICATE_10fb_return_output;
     VAR_in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_iftrue := VAR_CONST_REF_RD_uint8_t_uint8_t_4_2_d41d_ethernet_top_c_l78_DUPLICATE_95fc_return_output;
     VAR_in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_iffalse := VAR_CONST_REF_RD_uint8_t_uint8_t_4_2_d41d_ethernet_top_c_l78_DUPLICATE_95fc_return_output;
     VAR_in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_iftrue := VAR_FOR_ethernet_top_c_l78_c815_0ed0_ITER_2_CONST_REF_RD_uint8_t_uint8_t_4_3_d41d_ethernet_top_c_l78_c941_1ca8_return_output;
     VAR_BIN_OP_OR_ethernet_top_c_l78_c732_94f4_left := VAR_UNARY_OP_NOT_ethernet_top_c_l78_c732_1b95_return_output;
     VAR_BIN_OP_EQ_ethernet_top_c_l78_c995_95b3_left := VAR_out_counter_ethernet_top_c_l78_c974_6004;
     VAR_out_counter_MUX_ethernet_top_c_l78_c765_b76d_iftrue := VAR_out_counter_ethernet_top_c_l78_c974_6004;
     -- in_buffer_2_MUX[ethernet_top_c_l78_c765_b76d] LATENCY=0
     -- Inputs
     in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_cond <= VAR_in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_cond;
     in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_iftrue <= VAR_in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_iftrue;
     in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_iffalse <= VAR_in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_iffalse;
     -- Outputs
     VAR_in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_return_output := in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_return_output;

     -- in_buffer_0_MUX[ethernet_top_c_l78_c765_b76d] LATENCY=0
     -- Inputs
     in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_cond <= VAR_in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_cond;
     in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_iftrue <= VAR_in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_iftrue;
     in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_iffalse <= VAR_in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_iffalse;
     -- Outputs
     VAR_in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_return_output := in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_return_output;

     -- out_counter_MUX[ethernet_top_c_l78_c765_b76d] LATENCY=0
     -- Inputs
     out_counter_MUX_ethernet_top_c_l78_c765_b76d_cond <= VAR_out_counter_MUX_ethernet_top_c_l78_c765_b76d_cond;
     out_counter_MUX_ethernet_top_c_l78_c765_b76d_iftrue <= VAR_out_counter_MUX_ethernet_top_c_l78_c765_b76d_iftrue;
     out_counter_MUX_ethernet_top_c_l78_c765_b76d_iffalse <= VAR_out_counter_MUX_ethernet_top_c_l78_c765_b76d_iffalse;
     -- Outputs
     VAR_out_counter_MUX_ethernet_top_c_l78_c765_b76d_return_output := out_counter_MUX_ethernet_top_c_l78_c765_b76d_return_output;

     -- BIN_OP_EQ[ethernet_top_c_l78_c995_95b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_ethernet_top_c_l78_c995_95b3_left <= VAR_BIN_OP_EQ_ethernet_top_c_l78_c995_95b3_left;
     BIN_OP_EQ_ethernet_top_c_l78_c995_95b3_right <= VAR_BIN_OP_EQ_ethernet_top_c_l78_c995_95b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_ethernet_top_c_l78_c995_95b3_return_output := BIN_OP_EQ_ethernet_top_c_l78_c995_95b3_return_output;

     -- in_buffer_1_MUX[ethernet_top_c_l78_c765_b76d] LATENCY=0
     -- Inputs
     in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_cond <= VAR_in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_cond;
     in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_iftrue <= VAR_in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_iftrue;
     in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_iffalse <= VAR_in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_iffalse;
     -- Outputs
     VAR_in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_return_output := in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_return_output;

     -- BIN_OP_AND[ethernet_top_c_l78_c682_e74d] LATENCY=0
     -- Inputs
     BIN_OP_AND_ethernet_top_c_l78_c682_e74d_left <= VAR_BIN_OP_AND_ethernet_top_c_l78_c682_e74d_left;
     BIN_OP_AND_ethernet_top_c_l78_c682_e74d_right <= VAR_BIN_OP_AND_ethernet_top_c_l78_c682_e74d_right;
     -- Outputs
     VAR_BIN_OP_AND_ethernet_top_c_l78_c682_e74d_return_output := BIN_OP_AND_ethernet_top_c_l78_c682_e74d_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_ethernet_top_c_l78_c732_94f4_right := VAR_BIN_OP_AND_ethernet_top_c_l78_c682_e74d_return_output;
     VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_cond := VAR_BIN_OP_EQ_ethernet_top_c_l78_c995_95b3_return_output;
     VAR_out_counter_MUX_ethernet_top_c_l78_c1059_65d1_iffalse := VAR_out_counter_MUX_ethernet_top_c_l78_c765_b76d_return_output;
     -- BIN_OP_OR[ethernet_top_c_l78_c732_94f4] LATENCY=0
     -- Inputs
     BIN_OP_OR_ethernet_top_c_l78_c732_94f4_left <= VAR_BIN_OP_OR_ethernet_top_c_l78_c732_94f4_left;
     BIN_OP_OR_ethernet_top_c_l78_c732_94f4_right <= VAR_BIN_OP_OR_ethernet_top_c_l78_c732_94f4_right;
     -- Outputs
     VAR_BIN_OP_OR_ethernet_top_c_l78_c732_94f4_return_output := BIN_OP_OR_ethernet_top_c_l78_c732_94f4_return_output;

     -- in_buffer_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_4_uint8_t_4_c538[ethernet_top_c_l78_c1059_65d1] LATENCY=0
     VAR_in_buffer_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_4_uint8_t_4_c538_ethernet_top_c_l78_c1059_65d1_return_output := CONST_REF_RD_uint8_t_4_uint8_t_4_c538(
     in_buffer,
     VAR_in_buffer_0_MUX_ethernet_top_c_l78_c765_b76d_return_output,
     VAR_in_buffer_1_MUX_ethernet_top_c_l78_c765_b76d_return_output,
     VAR_in_buffer_2_MUX_ethernet_top_c_l78_c765_b76d_return_output);

     -- in_buffer_valid_MUX[ethernet_top_c_l78_c992_9a74] LATENCY=0
     -- Inputs
     in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_cond <= VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_cond;
     in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_iftrue <= VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_iftrue;
     in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_iffalse <= VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_iffalse;
     -- Outputs
     VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_return_output := in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_return_output;

     -- Submodule level 3
     VAR_in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_cond := VAR_BIN_OP_OR_ethernet_top_c_l78_c732_94f4_return_output;
     VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_cond := VAR_BIN_OP_OR_ethernet_top_c_l78_c732_94f4_return_output;
     VAR_out_counter_MUX_ethernet_top_c_l78_c1059_65d1_cond := VAR_BIN_OP_OR_ethernet_top_c_l78_c732_94f4_return_output;
     VAR_in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_iffalse := VAR_in_buffer_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_4_uint8_t_4_c538_ethernet_top_c_l78_c1059_65d1_return_output;
     VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_iftrue := VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c992_9a74_return_output;
     -- in_buffer_valid_MUX[ethernet_top_c_l78_c765_b76d] LATENCY=0
     -- Inputs
     in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_cond <= VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_cond;
     in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_iftrue <= VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_iftrue;
     in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_iffalse <= VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_iffalse;
     -- Outputs
     VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_return_output := in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_return_output;

     -- out_counter_MUX[ethernet_top_c_l78_c1059_65d1] LATENCY=0
     -- Inputs
     out_counter_MUX_ethernet_top_c_l78_c1059_65d1_cond <= VAR_out_counter_MUX_ethernet_top_c_l78_c1059_65d1_cond;
     out_counter_MUX_ethernet_top_c_l78_c1059_65d1_iftrue <= VAR_out_counter_MUX_ethernet_top_c_l78_c1059_65d1_iftrue;
     out_counter_MUX_ethernet_top_c_l78_c1059_65d1_iffalse <= VAR_out_counter_MUX_ethernet_top_c_l78_c1059_65d1_iffalse;
     -- Outputs
     VAR_out_counter_MUX_ethernet_top_c_l78_c1059_65d1_return_output := out_counter_MUX_ethernet_top_c_l78_c1059_65d1_return_output;

     -- CONST_REF_RD_work_serialize_serializer_in_to_out_t_work_serialize_serializer_in_to_out_t_6ac9[ethernet_top_c_l78_c1162_b606] LATENCY=0
     VAR_CONST_REF_RD_work_serialize_serializer_in_to_out_t_work_serialize_serializer_in_to_out_t_6ac9_ethernet_top_c_l78_c1162_b606_return_output := CONST_REF_RD_work_serialize_serializer_in_to_out_t_work_serialize_serializer_in_to_out_t_6ac9(
     VAR_CONST_REF_RD_uint8_t_uint8_t_4_0_d41d_ethernet_top_c_l78_DUPLICATE_cbc3_return_output,
     in_buffer_valid,
     VAR_BIN_OP_EQ_ethernet_top_c_l78_c616_40a4_return_output,
     VAR_BIN_OP_OR_ethernet_top_c_l78_c732_94f4_return_output);

     -- in_buffer_MUX[ethernet_top_c_l78_c1059_65d1] LATENCY=0
     -- Inputs
     in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_cond <= VAR_in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_cond;
     in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_iftrue <= VAR_in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_iftrue;
     in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_iffalse <= VAR_in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_iffalse;
     -- Outputs
     VAR_in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_return_output := in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_return_output;

     -- Submodule level 4
     VAR_return_output := VAR_CONST_REF_RD_work_serialize_serializer_in_to_out_t_work_serialize_serializer_in_to_out_t_6ac9_ethernet_top_c_l78_c1162_b606_return_output;
     REG_VAR_in_buffer := VAR_in_buffer_MUX_ethernet_top_c_l78_c1059_65d1_return_output;
     VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_iffalse := VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c765_b76d_return_output;
     REG_VAR_out_counter := VAR_out_counter_MUX_ethernet_top_c_l78_c1059_65d1_return_output;
     -- in_buffer_valid_MUX[ethernet_top_c_l78_c1059_65d1] LATENCY=0
     -- Inputs
     in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_cond <= VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_cond;
     in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_iftrue <= VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_iftrue;
     in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_iffalse <= VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_iffalse;
     -- Outputs
     VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_return_output := in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_return_output;

     -- Submodule level 5
     REG_VAR_in_buffer_valid := VAR_in_buffer_valid_MUX_ethernet_top_c_l78_c1059_65d1_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_in_buffer <= REG_VAR_in_buffer;
REG_COMB_in_buffer_valid <= REG_VAR_in_buffer_valid;
REG_COMB_out_counter <= REG_VAR_out_counter;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if clk_en_internal='1' then
     in_buffer <= REG_COMB_in_buffer;
     in_buffer_valid <= REG_COMB_in_buffer_valid;
     out_counter <= REG_COMB_out_counter;
 end if;
 end if;
end process;

end arch;
