module ethernet_top(
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
    // PMOD0A
    .PM2-A4_return_output(PM2-A4),
    .PM2-A3_return_output(PM2-A3),
    .PM2-A2_val_input(PM2-A2),
    .PM2-A1_val_input(PM2-A1),
    // PMOD0B
    .PM2-B3_return_output(PM2-B3),
    .PM2-B2_val_input(PM2-B2),
    .PM2-B1_val_input(PM2-B1)
  );
endmodule
