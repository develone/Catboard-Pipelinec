#include "uintN_t.h"
// See pico-ice-sdk/rtl/pico_ice.pcf
#pragma PART "ICE40HX8K-CT256"

// Get clock rate constant PLL_CLK_MHZ from header written by make flow
#include "pll_clk_mhz.h"
// By default PipelineC names clock ports with the rate included
// ex. clk_12p0
// Override this behavior by creating an input with a constant name
// and telling the tool that input signal is a clock of specific rate
#include "compiler.h"
DECL_INPUT(uint1_t, pll_clk)
CLK_MHZ(pll_clk, PLL_CLK_MHZ)

// Configure IO direction for each pin used
// UART
#define ICE_25_OUT
#define ICE_27_IN
// PMOD0A for VGA pmod demo
#define ICE_45_OUT
#define ICE_47_OUT
#define ICE_2_OUT
#define ICE_4_OUT
// PMOD0B for VGA pmod demo
#define ICE_44_OUT
#define ICE_46_OUT
#define ICE_48_OUT
#define ICE_3_OUT
// PMOD1A for VGA pmod demo
#define ICE_31_OUT
#define ICE_34_OUT
#define ICE_38_OUT
#define ICE_43_OUT
// PMOD1B for VGA pmod demo
//#define ICE_28_OUT // unused for VGA pmod
//#define ICE_32_OUT // unused for VGA pmod
#define ICE_36_OUT
#define ICE_42_OUT
#include "board/pico_ice.h"

// Configure UART module
#define UART_TX_OUT_WIRE ice_25
#define UART_RX_IN_WIRE ice_27
#define UART_CLK_MHZ PLL_CLK_MHZ
#define UART_BAUD 115200
#include "uart/uart_mac.c"

// Configure VGA module to use PMOD0 and PMOD1
// rgb is 8b internally, 4b on pmod
// PMOD0 = VGA PMOD J1
// PMOD1 = VGA PMOD J2
#define VGA_R0_WIRE pmod_0a_o1 // J1-1 = 0A IO 1
#define VGA_R1_WIRE pmod_0a_o2 // J1-2 = 0A IO 2
#define VGA_R2_WIRE pmod_0a_o3 // J1-3 = 0A IO 3
#define VGA_R3_WIRE pmod_0a_o4 // J1-4 = 0A IO 4
//
#define VGA_G0_WIRE pmod_1a_o1 // J2-1 = 1A IO 1
#define VGA_G1_WIRE pmod_1a_o2 // J2-2 = 1A IO 2
#define VGA_G2_WIRE pmod_1a_o3 // J2-3 = 1A IO 3
#define VGA_G3_WIRE pmod_1a_o4 // J2-4 = 1A IO 4
//
#define VGA_B0_WIRE pmod_0b_o1 // J1-7 = 0B IO 1
#define VGA_B1_WIRE pmod_0b_o2 // J1-8 = 0B IO 2
#define VGA_B2_WIRE pmod_0b_o3 // J1-9 = 0B IO 3
#define VGA_B3_WIRE pmod_0b_o4 // J1-10 = 0B IO 4
//
#define VGA_HS_WIRE pmod_1b_o1 // J2-7 = 1B IO 1
#define VGA_VS_WIRE pmod_1b_o2 // J2-8 = 1B IO 2
#include "vga/vga_wires_4b.c"

// Configure the VGA timing to use
// 640x480 is a 25MHz pixel clock
#define FRAME_WIDTH 640
#define FRAME_HEIGHT 480
#include "vga/vga_timing.h"

