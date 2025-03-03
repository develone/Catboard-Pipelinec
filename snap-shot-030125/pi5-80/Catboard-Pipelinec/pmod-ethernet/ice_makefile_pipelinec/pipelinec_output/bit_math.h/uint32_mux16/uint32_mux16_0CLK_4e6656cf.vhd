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
-- Submodules: 19
entity uint32_mux16_0CLK_4e6656cf is
port(
 sel : in unsigned(3 downto 0);
 in0 : in unsigned(31 downto 0);
 in1 : in unsigned(31 downto 0);
 in2 : in unsigned(31 downto 0);
 in3 : in unsigned(31 downto 0);
 in4 : in unsigned(31 downto 0);
 in5 : in unsigned(31 downto 0);
 in6 : in unsigned(31 downto 0);
 in7 : in unsigned(31 downto 0);
 in8 : in unsigned(31 downto 0);
 in9 : in unsigned(31 downto 0);
 in10 : in unsigned(31 downto 0);
 in11 : in unsigned(31 downto 0);
 in12 : in unsigned(31 downto 0);
 in13 : in unsigned(31 downto 0);
 in14 : in unsigned(31 downto 0);
 in15 : in unsigned(31 downto 0);
 return_output : out unsigned(31 downto 0));
end uint32_mux16_0CLK_4e6656cf;
architecture arch of uint32_mux16_0CLK_4e6656cf is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant ADDED_PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- layer0_node0_MUX[bit_math_h_l18_c3_ff8f]
signal layer0_node0_MUX_bit_math_h_l18_c3_ff8f_cond : unsigned(0 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_ff8f_iftrue : unsigned(31 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_ff8f_iffalse : unsigned(31 downto 0);
signal layer0_node0_MUX_bit_math_h_l18_c3_ff8f_return_output : unsigned(31 downto 0);

-- layer0_node1_MUX[bit_math_h_l29_c3_76e0]
signal layer0_node1_MUX_bit_math_h_l29_c3_76e0_cond : unsigned(0 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_76e0_iftrue : unsigned(31 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_76e0_iffalse : unsigned(31 downto 0);
signal layer0_node1_MUX_bit_math_h_l29_c3_76e0_return_output : unsigned(31 downto 0);

-- layer0_node2_MUX[bit_math_h_l40_c3_4a91]
signal layer0_node2_MUX_bit_math_h_l40_c3_4a91_cond : unsigned(0 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_4a91_iftrue : unsigned(31 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_4a91_iffalse : unsigned(31 downto 0);
signal layer0_node2_MUX_bit_math_h_l40_c3_4a91_return_output : unsigned(31 downto 0);

-- layer0_node3_MUX[bit_math_h_l51_c3_e52a]
signal layer0_node3_MUX_bit_math_h_l51_c3_e52a_cond : unsigned(0 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_e52a_iftrue : unsigned(31 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_e52a_iffalse : unsigned(31 downto 0);
signal layer0_node3_MUX_bit_math_h_l51_c3_e52a_return_output : unsigned(31 downto 0);

-- layer0_node4_MUX[bit_math_h_l62_c3_a6ce]
signal layer0_node4_MUX_bit_math_h_l62_c3_a6ce_cond : unsigned(0 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_a6ce_iftrue : unsigned(31 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_a6ce_iffalse : unsigned(31 downto 0);
signal layer0_node4_MUX_bit_math_h_l62_c3_a6ce_return_output : unsigned(31 downto 0);

-- layer0_node5_MUX[bit_math_h_l73_c3_9e23]
signal layer0_node5_MUX_bit_math_h_l73_c3_9e23_cond : unsigned(0 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_9e23_iftrue : unsigned(31 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_9e23_iffalse : unsigned(31 downto 0);
signal layer0_node5_MUX_bit_math_h_l73_c3_9e23_return_output : unsigned(31 downto 0);

-- layer0_node6_MUX[bit_math_h_l84_c3_12e2]
signal layer0_node6_MUX_bit_math_h_l84_c3_12e2_cond : unsigned(0 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_12e2_iftrue : unsigned(31 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_12e2_iffalse : unsigned(31 downto 0);
signal layer0_node6_MUX_bit_math_h_l84_c3_12e2_return_output : unsigned(31 downto 0);

-- layer0_node7_MUX[bit_math_h_l95_c3_d3d9]
signal layer0_node7_MUX_bit_math_h_l95_c3_d3d9_cond : unsigned(0 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_d3d9_iftrue : unsigned(31 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_d3d9_iffalse : unsigned(31 downto 0);
signal layer0_node7_MUX_bit_math_h_l95_c3_d3d9_return_output : unsigned(31 downto 0);

-- layer1_node0_MUX[bit_math_h_l112_c3_8b77]
signal layer1_node0_MUX_bit_math_h_l112_c3_8b77_cond : unsigned(0 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_8b77_iftrue : unsigned(31 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_8b77_iffalse : unsigned(31 downto 0);
signal layer1_node0_MUX_bit_math_h_l112_c3_8b77_return_output : unsigned(31 downto 0);

-- layer1_node1_MUX[bit_math_h_l123_c3_2d99]
signal layer1_node1_MUX_bit_math_h_l123_c3_2d99_cond : unsigned(0 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_2d99_iftrue : unsigned(31 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_2d99_iffalse : unsigned(31 downto 0);
signal layer1_node1_MUX_bit_math_h_l123_c3_2d99_return_output : unsigned(31 downto 0);

-- layer1_node2_MUX[bit_math_h_l134_c3_bddd]
signal layer1_node2_MUX_bit_math_h_l134_c3_bddd_cond : unsigned(0 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_bddd_iftrue : unsigned(31 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_bddd_iffalse : unsigned(31 downto 0);
signal layer1_node2_MUX_bit_math_h_l134_c3_bddd_return_output : unsigned(31 downto 0);

-- layer1_node3_MUX[bit_math_h_l145_c3_f09d]
signal layer1_node3_MUX_bit_math_h_l145_c3_f09d_cond : unsigned(0 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_f09d_iftrue : unsigned(31 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_f09d_iffalse : unsigned(31 downto 0);
signal layer1_node3_MUX_bit_math_h_l145_c3_f09d_return_output : unsigned(31 downto 0);

-- layer2_node0_MUX[bit_math_h_l162_c3_b2bd]
signal layer2_node0_MUX_bit_math_h_l162_c3_b2bd_cond : unsigned(0 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_b2bd_iftrue : unsigned(31 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_b2bd_iffalse : unsigned(31 downto 0);
signal layer2_node0_MUX_bit_math_h_l162_c3_b2bd_return_output : unsigned(31 downto 0);

-- layer2_node1_MUX[bit_math_h_l173_c3_8ebf]
signal layer2_node1_MUX_bit_math_h_l173_c3_8ebf_cond : unsigned(0 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_8ebf_iftrue : unsigned(31 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_8ebf_iffalse : unsigned(31 downto 0);
signal layer2_node1_MUX_bit_math_h_l173_c3_8ebf_return_output : unsigned(31 downto 0);

-- layer3_node0_MUX[bit_math_h_l190_c3_f8f5]
signal layer3_node0_MUX_bit_math_h_l190_c3_f8f5_cond : unsigned(0 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_f8f5_iftrue : unsigned(31 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_f8f5_iffalse : unsigned(31 downto 0);
signal layer3_node0_MUX_bit_math_h_l190_c3_f8f5_return_output : unsigned(31 downto 0);

function uint4_0_0( x : unsigned) return unsigned is
--variable x : unsigned(3 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
return return_output;
end function;

function uint4_1_1( x : unsigned) return unsigned is
--variable x : unsigned(3 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(1- i);
      end loop;
return return_output;
end function;

function uint4_2_2( x : unsigned) return unsigned is
--variable x : unsigned(3 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(2- i);
      end loop;
return return_output;
end function;

function uint4_3_3( x : unsigned) return unsigned is
--variable x : unsigned(3 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(3- i);
      end loop;
return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- layer0_node0_MUX_bit_math_h_l18_c3_ff8f : 0 clocks latency
layer0_node0_MUX_bit_math_h_l18_c3_ff8f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer0_node0_MUX_bit_math_h_l18_c3_ff8f_cond,
layer0_node0_MUX_bit_math_h_l18_c3_ff8f_iftrue,
layer0_node0_MUX_bit_math_h_l18_c3_ff8f_iffalse,
layer0_node0_MUX_bit_math_h_l18_c3_ff8f_return_output);

-- layer0_node1_MUX_bit_math_h_l29_c3_76e0 : 0 clocks latency
layer0_node1_MUX_bit_math_h_l29_c3_76e0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer0_node1_MUX_bit_math_h_l29_c3_76e0_cond,
layer0_node1_MUX_bit_math_h_l29_c3_76e0_iftrue,
layer0_node1_MUX_bit_math_h_l29_c3_76e0_iffalse,
layer0_node1_MUX_bit_math_h_l29_c3_76e0_return_output);

-- layer0_node2_MUX_bit_math_h_l40_c3_4a91 : 0 clocks latency
layer0_node2_MUX_bit_math_h_l40_c3_4a91 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer0_node2_MUX_bit_math_h_l40_c3_4a91_cond,
layer0_node2_MUX_bit_math_h_l40_c3_4a91_iftrue,
layer0_node2_MUX_bit_math_h_l40_c3_4a91_iffalse,
layer0_node2_MUX_bit_math_h_l40_c3_4a91_return_output);

-- layer0_node3_MUX_bit_math_h_l51_c3_e52a : 0 clocks latency
layer0_node3_MUX_bit_math_h_l51_c3_e52a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer0_node3_MUX_bit_math_h_l51_c3_e52a_cond,
layer0_node3_MUX_bit_math_h_l51_c3_e52a_iftrue,
layer0_node3_MUX_bit_math_h_l51_c3_e52a_iffalse,
layer0_node3_MUX_bit_math_h_l51_c3_e52a_return_output);

-- layer0_node4_MUX_bit_math_h_l62_c3_a6ce : 0 clocks latency
layer0_node4_MUX_bit_math_h_l62_c3_a6ce : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer0_node4_MUX_bit_math_h_l62_c3_a6ce_cond,
layer0_node4_MUX_bit_math_h_l62_c3_a6ce_iftrue,
layer0_node4_MUX_bit_math_h_l62_c3_a6ce_iffalse,
layer0_node4_MUX_bit_math_h_l62_c3_a6ce_return_output);

-- layer0_node5_MUX_bit_math_h_l73_c3_9e23 : 0 clocks latency
layer0_node5_MUX_bit_math_h_l73_c3_9e23 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer0_node5_MUX_bit_math_h_l73_c3_9e23_cond,
layer0_node5_MUX_bit_math_h_l73_c3_9e23_iftrue,
layer0_node5_MUX_bit_math_h_l73_c3_9e23_iffalse,
layer0_node5_MUX_bit_math_h_l73_c3_9e23_return_output);

-- layer0_node6_MUX_bit_math_h_l84_c3_12e2 : 0 clocks latency
layer0_node6_MUX_bit_math_h_l84_c3_12e2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer0_node6_MUX_bit_math_h_l84_c3_12e2_cond,
layer0_node6_MUX_bit_math_h_l84_c3_12e2_iftrue,
layer0_node6_MUX_bit_math_h_l84_c3_12e2_iffalse,
layer0_node6_MUX_bit_math_h_l84_c3_12e2_return_output);

-- layer0_node7_MUX_bit_math_h_l95_c3_d3d9 : 0 clocks latency
layer0_node7_MUX_bit_math_h_l95_c3_d3d9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer0_node7_MUX_bit_math_h_l95_c3_d3d9_cond,
layer0_node7_MUX_bit_math_h_l95_c3_d3d9_iftrue,
layer0_node7_MUX_bit_math_h_l95_c3_d3d9_iffalse,
layer0_node7_MUX_bit_math_h_l95_c3_d3d9_return_output);

-- layer1_node0_MUX_bit_math_h_l112_c3_8b77 : 0 clocks latency
layer1_node0_MUX_bit_math_h_l112_c3_8b77 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer1_node0_MUX_bit_math_h_l112_c3_8b77_cond,
layer1_node0_MUX_bit_math_h_l112_c3_8b77_iftrue,
layer1_node0_MUX_bit_math_h_l112_c3_8b77_iffalse,
layer1_node0_MUX_bit_math_h_l112_c3_8b77_return_output);

-- layer1_node1_MUX_bit_math_h_l123_c3_2d99 : 0 clocks latency
layer1_node1_MUX_bit_math_h_l123_c3_2d99 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer1_node1_MUX_bit_math_h_l123_c3_2d99_cond,
layer1_node1_MUX_bit_math_h_l123_c3_2d99_iftrue,
layer1_node1_MUX_bit_math_h_l123_c3_2d99_iffalse,
layer1_node1_MUX_bit_math_h_l123_c3_2d99_return_output);

-- layer1_node2_MUX_bit_math_h_l134_c3_bddd : 0 clocks latency
layer1_node2_MUX_bit_math_h_l134_c3_bddd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer1_node2_MUX_bit_math_h_l134_c3_bddd_cond,
layer1_node2_MUX_bit_math_h_l134_c3_bddd_iftrue,
layer1_node2_MUX_bit_math_h_l134_c3_bddd_iffalse,
layer1_node2_MUX_bit_math_h_l134_c3_bddd_return_output);

-- layer1_node3_MUX_bit_math_h_l145_c3_f09d : 0 clocks latency
layer1_node3_MUX_bit_math_h_l145_c3_f09d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer1_node3_MUX_bit_math_h_l145_c3_f09d_cond,
layer1_node3_MUX_bit_math_h_l145_c3_f09d_iftrue,
layer1_node3_MUX_bit_math_h_l145_c3_f09d_iffalse,
layer1_node3_MUX_bit_math_h_l145_c3_f09d_return_output);

-- layer2_node0_MUX_bit_math_h_l162_c3_b2bd : 0 clocks latency
layer2_node0_MUX_bit_math_h_l162_c3_b2bd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer2_node0_MUX_bit_math_h_l162_c3_b2bd_cond,
layer2_node0_MUX_bit_math_h_l162_c3_b2bd_iftrue,
layer2_node0_MUX_bit_math_h_l162_c3_b2bd_iffalse,
layer2_node0_MUX_bit_math_h_l162_c3_b2bd_return_output);

-- layer2_node1_MUX_bit_math_h_l173_c3_8ebf : 0 clocks latency
layer2_node1_MUX_bit_math_h_l173_c3_8ebf : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer2_node1_MUX_bit_math_h_l173_c3_8ebf_cond,
layer2_node1_MUX_bit_math_h_l173_c3_8ebf_iftrue,
layer2_node1_MUX_bit_math_h_l173_c3_8ebf_iffalse,
layer2_node1_MUX_bit_math_h_l173_c3_8ebf_return_output);

-- layer3_node0_MUX_bit_math_h_l190_c3_f8f5 : 0 clocks latency
layer3_node0_MUX_bit_math_h_l190_c3_f8f5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
layer3_node0_MUX_bit_math_h_l190_c3_f8f5_cond,
layer3_node0_MUX_bit_math_h_l190_c3_f8f5_iftrue,
layer3_node0_MUX_bit_math_h_l190_c3_f8f5_iffalse,
layer3_node0_MUX_bit_math_h_l190_c3_f8f5_return_output);



-- Combinatorial process for pipeline stages
process (
 -- Inputs
 sel,
 in0,
 in1,
 in2,
 in3,
 in4,
 in5,
 in6,
 in7,
 in8,
 in9,
 in10,
 in11,
 in12,
 in13,
 in14,
 in15,
 -- All submodule outputs
 layer0_node0_MUX_bit_math_h_l18_c3_ff8f_return_output,
 layer0_node1_MUX_bit_math_h_l29_c3_76e0_return_output,
 layer0_node2_MUX_bit_math_h_l40_c3_4a91_return_output,
 layer0_node3_MUX_bit_math_h_l51_c3_e52a_return_output,
 layer0_node4_MUX_bit_math_h_l62_c3_a6ce_return_output,
 layer0_node5_MUX_bit_math_h_l73_c3_9e23_return_output,
 layer0_node6_MUX_bit_math_h_l84_c3_12e2_return_output,
 layer0_node7_MUX_bit_math_h_l95_c3_d3d9_return_output,
 layer1_node0_MUX_bit_math_h_l112_c3_8b77_return_output,
 layer1_node1_MUX_bit_math_h_l123_c3_2d99_return_output,
 layer1_node2_MUX_bit_math_h_l134_c3_bddd_return_output,
 layer1_node3_MUX_bit_math_h_l145_c3_f09d_return_output,
 layer2_node0_MUX_bit_math_h_l162_c3_b2bd_return_output,
 layer2_node1_MUX_bit_math_h_l173_c3_8ebf_return_output,
 layer3_node0_MUX_bit_math_h_l190_c3_f8f5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(31 downto 0);
 variable VAR_sel : unsigned(3 downto 0);
 variable VAR_in0 : unsigned(31 downto 0);
 variable VAR_in1 : unsigned(31 downto 0);
 variable VAR_in2 : unsigned(31 downto 0);
 variable VAR_in3 : unsigned(31 downto 0);
 variable VAR_in4 : unsigned(31 downto 0);
 variable VAR_in5 : unsigned(31 downto 0);
 variable VAR_in6 : unsigned(31 downto 0);
 variable VAR_in7 : unsigned(31 downto 0);
 variable VAR_in8 : unsigned(31 downto 0);
 variable VAR_in9 : unsigned(31 downto 0);
 variable VAR_in10 : unsigned(31 downto 0);
 variable VAR_in11 : unsigned(31 downto 0);
 variable VAR_in12 : unsigned(31 downto 0);
 variable VAR_in13 : unsigned(31 downto 0);
 variable VAR_in14 : unsigned(31 downto 0);
 variable VAR_in15 : unsigned(31 downto 0);
 variable VAR_sel0 : unsigned(0 downto 0);
 variable VAR_uint4_0_0_bit_math_h_l14_c10_1f3c_return_output : unsigned(0 downto 0);
 variable VAR_layer0_node0 : unsigned(31 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_ff8f_iftrue : unsigned(31 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_ff8f_iffalse : unsigned(31 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_ff8f_return_output : unsigned(31 downto 0);
 variable VAR_layer0_node0_MUX_bit_math_h_l18_c3_ff8f_cond : unsigned(0 downto 0);
 variable VAR_layer0_node1 : unsigned(31 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_76e0_iftrue : unsigned(31 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_76e0_iffalse : unsigned(31 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_76e0_return_output : unsigned(31 downto 0);
 variable VAR_layer0_node1_MUX_bit_math_h_l29_c3_76e0_cond : unsigned(0 downto 0);
 variable VAR_layer0_node2 : unsigned(31 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_4a91_iftrue : unsigned(31 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_4a91_iffalse : unsigned(31 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_4a91_return_output : unsigned(31 downto 0);
 variable VAR_layer0_node2_MUX_bit_math_h_l40_c3_4a91_cond : unsigned(0 downto 0);
 variable VAR_layer0_node3 : unsigned(31 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_e52a_iftrue : unsigned(31 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_e52a_iffalse : unsigned(31 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_e52a_return_output : unsigned(31 downto 0);
 variable VAR_layer0_node3_MUX_bit_math_h_l51_c3_e52a_cond : unsigned(0 downto 0);
 variable VAR_layer0_node4 : unsigned(31 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_a6ce_iftrue : unsigned(31 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_a6ce_iffalse : unsigned(31 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_a6ce_return_output : unsigned(31 downto 0);
 variable VAR_layer0_node4_MUX_bit_math_h_l62_c3_a6ce_cond : unsigned(0 downto 0);
 variable VAR_layer0_node5 : unsigned(31 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e23_iftrue : unsigned(31 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e23_iffalse : unsigned(31 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e23_return_output : unsigned(31 downto 0);
 variable VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e23_cond : unsigned(0 downto 0);
 variable VAR_layer0_node6 : unsigned(31 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_12e2_iftrue : unsigned(31 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_12e2_iffalse : unsigned(31 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_12e2_return_output : unsigned(31 downto 0);
 variable VAR_layer0_node6_MUX_bit_math_h_l84_c3_12e2_cond : unsigned(0 downto 0);
 variable VAR_layer0_node7 : unsigned(31 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_d3d9_iftrue : unsigned(31 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_d3d9_iffalse : unsigned(31 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_d3d9_return_output : unsigned(31 downto 0);
 variable VAR_layer0_node7_MUX_bit_math_h_l95_c3_d3d9_cond : unsigned(0 downto 0);
 variable VAR_sel1 : unsigned(0 downto 0);
 variable VAR_uint4_1_1_bit_math_h_l108_c10_53ea_return_output : unsigned(0 downto 0);
 variable VAR_layer1_node0 : unsigned(31 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_8b77_iftrue : unsigned(31 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_8b77_iffalse : unsigned(31 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_8b77_return_output : unsigned(31 downto 0);
 variable VAR_layer1_node0_MUX_bit_math_h_l112_c3_8b77_cond : unsigned(0 downto 0);
 variable VAR_layer1_node1 : unsigned(31 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_2d99_iftrue : unsigned(31 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_2d99_iffalse : unsigned(31 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_2d99_return_output : unsigned(31 downto 0);
 variable VAR_layer1_node1_MUX_bit_math_h_l123_c3_2d99_cond : unsigned(0 downto 0);
 variable VAR_layer1_node2 : unsigned(31 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_bddd_iftrue : unsigned(31 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_bddd_iffalse : unsigned(31 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_bddd_return_output : unsigned(31 downto 0);
 variable VAR_layer1_node2_MUX_bit_math_h_l134_c3_bddd_cond : unsigned(0 downto 0);
 variable VAR_layer1_node3 : unsigned(31 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_f09d_iftrue : unsigned(31 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_f09d_iffalse : unsigned(31 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_f09d_return_output : unsigned(31 downto 0);
 variable VAR_layer1_node3_MUX_bit_math_h_l145_c3_f09d_cond : unsigned(0 downto 0);
 variable VAR_sel2 : unsigned(0 downto 0);
 variable VAR_uint4_2_2_bit_math_h_l158_c10_e1cf_return_output : unsigned(0 downto 0);
 variable VAR_layer2_node0 : unsigned(31 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_b2bd_iftrue : unsigned(31 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_b2bd_iffalse : unsigned(31 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_b2bd_return_output : unsigned(31 downto 0);
 variable VAR_layer2_node0_MUX_bit_math_h_l162_c3_b2bd_cond : unsigned(0 downto 0);
 variable VAR_layer2_node1 : unsigned(31 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_8ebf_iftrue : unsigned(31 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_8ebf_iffalse : unsigned(31 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_8ebf_return_output : unsigned(31 downto 0);
 variable VAR_layer2_node1_MUX_bit_math_h_l173_c3_8ebf_cond : unsigned(0 downto 0);
 variable VAR_sel3 : unsigned(0 downto 0);
 variable VAR_uint4_3_3_bit_math_h_l186_c10_f8c0_return_output : unsigned(0 downto 0);
 variable VAR_layer3_node0 : unsigned(31 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_f8f5_iftrue : unsigned(31 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_f8f5_iffalse : unsigned(31 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_f8f5_return_output : unsigned(31 downto 0);
 variable VAR_layer3_node0_MUX_bit_math_h_l190_c3_f8f5_cond : unsigned(0 downto 0);
begin

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to ADDED_PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in inputs
     VAR_sel := sel;
     VAR_in0 := in0;
     VAR_in1 := in1;
     VAR_in2 := in2;
     VAR_in3 := in3;
     VAR_in4 := in4;
     VAR_in5 := in5;
     VAR_in6 := in6;
     VAR_in7 := in7;
     VAR_in8 := in8;
     VAR_in9 := in9;
     VAR_in10 := in10;
     VAR_in11 := in11;
     VAR_in12 := in12;
     VAR_in13 := in13;
     VAR_in14 := in14;
     VAR_in15 := in15;

     -- Submodule level 0
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_ff8f_iffalse := VAR_in0;
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_ff8f_iftrue := VAR_in1;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e23_iffalse := VAR_in10;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e23_iftrue := VAR_in11;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_12e2_iffalse := VAR_in12;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_12e2_iftrue := VAR_in13;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_d3d9_iffalse := VAR_in14;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_d3d9_iftrue := VAR_in15;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_76e0_iffalse := VAR_in2;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_76e0_iftrue := VAR_in3;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_4a91_iffalse := VAR_in4;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_4a91_iftrue := VAR_in5;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_e52a_iffalse := VAR_in6;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_e52a_iftrue := VAR_in7;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_a6ce_iffalse := VAR_in8;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_a6ce_iftrue := VAR_in9;
     -- uint4_0_0[bit_math_h_l14_c10_1f3c] LATENCY=0
     VAR_uint4_0_0_bit_math_h_l14_c10_1f3c_return_output := uint4_0_0(
     VAR_sel);

     -- uint4_3_3[bit_math_h_l186_c10_f8c0] LATENCY=0
     VAR_uint4_3_3_bit_math_h_l186_c10_f8c0_return_output := uint4_3_3(
     VAR_sel);

     -- uint4_2_2[bit_math_h_l158_c10_e1cf] LATENCY=0
     VAR_uint4_2_2_bit_math_h_l158_c10_e1cf_return_output := uint4_2_2(
     VAR_sel);

     -- uint4_1_1[bit_math_h_l108_c10_53ea] LATENCY=0
     VAR_uint4_1_1_bit_math_h_l108_c10_53ea_return_output := uint4_1_1(
     VAR_sel);

     -- Submodule level 1
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_ff8f_cond := VAR_uint4_0_0_bit_math_h_l14_c10_1f3c_return_output;
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_76e0_cond := VAR_uint4_0_0_bit_math_h_l14_c10_1f3c_return_output;
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_4a91_cond := VAR_uint4_0_0_bit_math_h_l14_c10_1f3c_return_output;
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_e52a_cond := VAR_uint4_0_0_bit_math_h_l14_c10_1f3c_return_output;
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_a6ce_cond := VAR_uint4_0_0_bit_math_h_l14_c10_1f3c_return_output;
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e23_cond := VAR_uint4_0_0_bit_math_h_l14_c10_1f3c_return_output;
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_12e2_cond := VAR_uint4_0_0_bit_math_h_l14_c10_1f3c_return_output;
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_d3d9_cond := VAR_uint4_0_0_bit_math_h_l14_c10_1f3c_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_8b77_cond := VAR_uint4_1_1_bit_math_h_l108_c10_53ea_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_2d99_cond := VAR_uint4_1_1_bit_math_h_l108_c10_53ea_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_bddd_cond := VAR_uint4_1_1_bit_math_h_l108_c10_53ea_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_f09d_cond := VAR_uint4_1_1_bit_math_h_l108_c10_53ea_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_b2bd_cond := VAR_uint4_2_2_bit_math_h_l158_c10_e1cf_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_8ebf_cond := VAR_uint4_2_2_bit_math_h_l158_c10_e1cf_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_f8f5_cond := VAR_uint4_3_3_bit_math_h_l186_c10_f8c0_return_output;
     -- layer0_node5_MUX[bit_math_h_l73_c3_9e23] LATENCY=0
     -- Inputs
     layer0_node5_MUX_bit_math_h_l73_c3_9e23_cond <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e23_cond;
     layer0_node5_MUX_bit_math_h_l73_c3_9e23_iftrue <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e23_iftrue;
     layer0_node5_MUX_bit_math_h_l73_c3_9e23_iffalse <= VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e23_iffalse;
     -- Outputs
     VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e23_return_output := layer0_node5_MUX_bit_math_h_l73_c3_9e23_return_output;

     -- layer0_node6_MUX[bit_math_h_l84_c3_12e2] LATENCY=0
     -- Inputs
     layer0_node6_MUX_bit_math_h_l84_c3_12e2_cond <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_12e2_cond;
     layer0_node6_MUX_bit_math_h_l84_c3_12e2_iftrue <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_12e2_iftrue;
     layer0_node6_MUX_bit_math_h_l84_c3_12e2_iffalse <= VAR_layer0_node6_MUX_bit_math_h_l84_c3_12e2_iffalse;
     -- Outputs
     VAR_layer0_node6_MUX_bit_math_h_l84_c3_12e2_return_output := layer0_node6_MUX_bit_math_h_l84_c3_12e2_return_output;

     -- layer0_node0_MUX[bit_math_h_l18_c3_ff8f] LATENCY=0
     -- Inputs
     layer0_node0_MUX_bit_math_h_l18_c3_ff8f_cond <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_ff8f_cond;
     layer0_node0_MUX_bit_math_h_l18_c3_ff8f_iftrue <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_ff8f_iftrue;
     layer0_node0_MUX_bit_math_h_l18_c3_ff8f_iffalse <= VAR_layer0_node0_MUX_bit_math_h_l18_c3_ff8f_iffalse;
     -- Outputs
     VAR_layer0_node0_MUX_bit_math_h_l18_c3_ff8f_return_output := layer0_node0_MUX_bit_math_h_l18_c3_ff8f_return_output;

     -- layer0_node3_MUX[bit_math_h_l51_c3_e52a] LATENCY=0
     -- Inputs
     layer0_node3_MUX_bit_math_h_l51_c3_e52a_cond <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_e52a_cond;
     layer0_node3_MUX_bit_math_h_l51_c3_e52a_iftrue <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_e52a_iftrue;
     layer0_node3_MUX_bit_math_h_l51_c3_e52a_iffalse <= VAR_layer0_node3_MUX_bit_math_h_l51_c3_e52a_iffalse;
     -- Outputs
     VAR_layer0_node3_MUX_bit_math_h_l51_c3_e52a_return_output := layer0_node3_MUX_bit_math_h_l51_c3_e52a_return_output;

     -- layer0_node4_MUX[bit_math_h_l62_c3_a6ce] LATENCY=0
     -- Inputs
     layer0_node4_MUX_bit_math_h_l62_c3_a6ce_cond <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_a6ce_cond;
     layer0_node4_MUX_bit_math_h_l62_c3_a6ce_iftrue <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_a6ce_iftrue;
     layer0_node4_MUX_bit_math_h_l62_c3_a6ce_iffalse <= VAR_layer0_node4_MUX_bit_math_h_l62_c3_a6ce_iffalse;
     -- Outputs
     VAR_layer0_node4_MUX_bit_math_h_l62_c3_a6ce_return_output := layer0_node4_MUX_bit_math_h_l62_c3_a6ce_return_output;

     -- layer0_node2_MUX[bit_math_h_l40_c3_4a91] LATENCY=0
     -- Inputs
     layer0_node2_MUX_bit_math_h_l40_c3_4a91_cond <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_4a91_cond;
     layer0_node2_MUX_bit_math_h_l40_c3_4a91_iftrue <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_4a91_iftrue;
     layer0_node2_MUX_bit_math_h_l40_c3_4a91_iffalse <= VAR_layer0_node2_MUX_bit_math_h_l40_c3_4a91_iffalse;
     -- Outputs
     VAR_layer0_node2_MUX_bit_math_h_l40_c3_4a91_return_output := layer0_node2_MUX_bit_math_h_l40_c3_4a91_return_output;

     -- layer0_node7_MUX[bit_math_h_l95_c3_d3d9] LATENCY=0
     -- Inputs
     layer0_node7_MUX_bit_math_h_l95_c3_d3d9_cond <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_d3d9_cond;
     layer0_node7_MUX_bit_math_h_l95_c3_d3d9_iftrue <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_d3d9_iftrue;
     layer0_node7_MUX_bit_math_h_l95_c3_d3d9_iffalse <= VAR_layer0_node7_MUX_bit_math_h_l95_c3_d3d9_iffalse;
     -- Outputs
     VAR_layer0_node7_MUX_bit_math_h_l95_c3_d3d9_return_output := layer0_node7_MUX_bit_math_h_l95_c3_d3d9_return_output;

     -- layer0_node1_MUX[bit_math_h_l29_c3_76e0] LATENCY=0
     -- Inputs
     layer0_node1_MUX_bit_math_h_l29_c3_76e0_cond <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_76e0_cond;
     layer0_node1_MUX_bit_math_h_l29_c3_76e0_iftrue <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_76e0_iftrue;
     layer0_node1_MUX_bit_math_h_l29_c3_76e0_iffalse <= VAR_layer0_node1_MUX_bit_math_h_l29_c3_76e0_iffalse;
     -- Outputs
     VAR_layer0_node1_MUX_bit_math_h_l29_c3_76e0_return_output := layer0_node1_MUX_bit_math_h_l29_c3_76e0_return_output;

     -- Submodule level 2
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_8b77_iffalse := VAR_layer0_node0_MUX_bit_math_h_l18_c3_ff8f_return_output;
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_8b77_iftrue := VAR_layer0_node1_MUX_bit_math_h_l29_c3_76e0_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_2d99_iffalse := VAR_layer0_node2_MUX_bit_math_h_l40_c3_4a91_return_output;
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_2d99_iftrue := VAR_layer0_node3_MUX_bit_math_h_l51_c3_e52a_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_bddd_iffalse := VAR_layer0_node4_MUX_bit_math_h_l62_c3_a6ce_return_output;
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_bddd_iftrue := VAR_layer0_node5_MUX_bit_math_h_l73_c3_9e23_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_f09d_iffalse := VAR_layer0_node6_MUX_bit_math_h_l84_c3_12e2_return_output;
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_f09d_iftrue := VAR_layer0_node7_MUX_bit_math_h_l95_c3_d3d9_return_output;
     -- layer1_node2_MUX[bit_math_h_l134_c3_bddd] LATENCY=0
     -- Inputs
     layer1_node2_MUX_bit_math_h_l134_c3_bddd_cond <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_bddd_cond;
     layer1_node2_MUX_bit_math_h_l134_c3_bddd_iftrue <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_bddd_iftrue;
     layer1_node2_MUX_bit_math_h_l134_c3_bddd_iffalse <= VAR_layer1_node2_MUX_bit_math_h_l134_c3_bddd_iffalse;
     -- Outputs
     VAR_layer1_node2_MUX_bit_math_h_l134_c3_bddd_return_output := layer1_node2_MUX_bit_math_h_l134_c3_bddd_return_output;

     -- layer1_node3_MUX[bit_math_h_l145_c3_f09d] LATENCY=0
     -- Inputs
     layer1_node3_MUX_bit_math_h_l145_c3_f09d_cond <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_f09d_cond;
     layer1_node3_MUX_bit_math_h_l145_c3_f09d_iftrue <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_f09d_iftrue;
     layer1_node3_MUX_bit_math_h_l145_c3_f09d_iffalse <= VAR_layer1_node3_MUX_bit_math_h_l145_c3_f09d_iffalse;
     -- Outputs
     VAR_layer1_node3_MUX_bit_math_h_l145_c3_f09d_return_output := layer1_node3_MUX_bit_math_h_l145_c3_f09d_return_output;

     -- layer1_node0_MUX[bit_math_h_l112_c3_8b77] LATENCY=0
     -- Inputs
     layer1_node0_MUX_bit_math_h_l112_c3_8b77_cond <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_8b77_cond;
     layer1_node0_MUX_bit_math_h_l112_c3_8b77_iftrue <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_8b77_iftrue;
     layer1_node0_MUX_bit_math_h_l112_c3_8b77_iffalse <= VAR_layer1_node0_MUX_bit_math_h_l112_c3_8b77_iffalse;
     -- Outputs
     VAR_layer1_node0_MUX_bit_math_h_l112_c3_8b77_return_output := layer1_node0_MUX_bit_math_h_l112_c3_8b77_return_output;

     -- layer1_node1_MUX[bit_math_h_l123_c3_2d99] LATENCY=0
     -- Inputs
     layer1_node1_MUX_bit_math_h_l123_c3_2d99_cond <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_2d99_cond;
     layer1_node1_MUX_bit_math_h_l123_c3_2d99_iftrue <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_2d99_iftrue;
     layer1_node1_MUX_bit_math_h_l123_c3_2d99_iffalse <= VAR_layer1_node1_MUX_bit_math_h_l123_c3_2d99_iffalse;
     -- Outputs
     VAR_layer1_node1_MUX_bit_math_h_l123_c3_2d99_return_output := layer1_node1_MUX_bit_math_h_l123_c3_2d99_return_output;

     -- Submodule level 3
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_b2bd_iffalse := VAR_layer1_node0_MUX_bit_math_h_l112_c3_8b77_return_output;
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_b2bd_iftrue := VAR_layer1_node1_MUX_bit_math_h_l123_c3_2d99_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_8ebf_iffalse := VAR_layer1_node2_MUX_bit_math_h_l134_c3_bddd_return_output;
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_8ebf_iftrue := VAR_layer1_node3_MUX_bit_math_h_l145_c3_f09d_return_output;
     -- layer2_node1_MUX[bit_math_h_l173_c3_8ebf] LATENCY=0
     -- Inputs
     layer2_node1_MUX_bit_math_h_l173_c3_8ebf_cond <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_8ebf_cond;
     layer2_node1_MUX_bit_math_h_l173_c3_8ebf_iftrue <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_8ebf_iftrue;
     layer2_node1_MUX_bit_math_h_l173_c3_8ebf_iffalse <= VAR_layer2_node1_MUX_bit_math_h_l173_c3_8ebf_iffalse;
     -- Outputs
     VAR_layer2_node1_MUX_bit_math_h_l173_c3_8ebf_return_output := layer2_node1_MUX_bit_math_h_l173_c3_8ebf_return_output;

     -- layer2_node0_MUX[bit_math_h_l162_c3_b2bd] LATENCY=0
     -- Inputs
     layer2_node0_MUX_bit_math_h_l162_c3_b2bd_cond <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_b2bd_cond;
     layer2_node0_MUX_bit_math_h_l162_c3_b2bd_iftrue <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_b2bd_iftrue;
     layer2_node0_MUX_bit_math_h_l162_c3_b2bd_iffalse <= VAR_layer2_node0_MUX_bit_math_h_l162_c3_b2bd_iffalse;
     -- Outputs
     VAR_layer2_node0_MUX_bit_math_h_l162_c3_b2bd_return_output := layer2_node0_MUX_bit_math_h_l162_c3_b2bd_return_output;

     -- Submodule level 4
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_f8f5_iffalse := VAR_layer2_node0_MUX_bit_math_h_l162_c3_b2bd_return_output;
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_f8f5_iftrue := VAR_layer2_node1_MUX_bit_math_h_l173_c3_8ebf_return_output;
     -- layer3_node0_MUX[bit_math_h_l190_c3_f8f5] LATENCY=0
     -- Inputs
     layer3_node0_MUX_bit_math_h_l190_c3_f8f5_cond <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_f8f5_cond;
     layer3_node0_MUX_bit_math_h_l190_c3_f8f5_iftrue <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_f8f5_iftrue;
     layer3_node0_MUX_bit_math_h_l190_c3_f8f5_iffalse <= VAR_layer3_node0_MUX_bit_math_h_l190_c3_f8f5_iffalse;
     -- Outputs
     VAR_layer3_node0_MUX_bit_math_h_l190_c3_f8f5_return_output := layer3_node0_MUX_bit_math_h_l190_c3_f8f5_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_layer3_node0_MUX_bit_math_h_l190_c3_f8f5_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
