module top(
input clk_100p0,
  `include "top_pins.svh"
);
  // PLL instance to make a clock based on 12MHz input
  wire pll_clk;
  pll pll_inst(
    .clock_in(clk_100p0),
    .clock_out(pll_clk),
    .locked()
	);

  // PipelineC output HDL instance
  pipelinec_top pipelinec_inst(
    .pll_clk_val_input(pll_clk),
    // RGB LED
    .ice_39_return_output(ICE_39),
    .ice_40_return_output(ICE_40),
    .ice_41_return_output(ICE_41),
    // UART
    .ice_25_return_output(ICE_25),
    .ice_27_val_input(ICE_27),
    // PMODs for VGA demo
    // PMOD0A
    .PM2-A4_return_output(PM2-A4),
    .PM2-A3_return_output(PM2-A3),
    .PM2-A2_return_output(PM2-A2),
    .PM2-A1_return_output(PM2-A1),
    // PMOD0B
    .PM2-B4_return_output(PM2-B4),
    .PM2-B3_return_output(PM2-B3),
    .PM2-B2_return_output(PM2-B2),
    .PM2-B1_return_output(PM2-B1),
    // PMOD1A
    .PM3-A4_return_output(PM3-A4),
    .PM3-A3_return_output(PM3-A3),
    .PM3-A2_return_output(PM3-A2),
    .PM3-A1_return_output(PM3-A1),
    // PMOD1B
    // UNUSED for VGA PMOD .ice_28_return_output(PM3-B4),
    // UNUSED for VGA PMOD .ice_32_return_output(PM3-B3),
    .PM3-B2_return_output(PM3-B2),
    .PM3-B1_return_output(PM3-B1)
  );
endmodule
