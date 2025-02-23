module top(
//  input clk_100p0,
  // RGB LED
  output ICE_39,
  output ICE_40,
  output ICE_41,
  // UART
  output ICE_25,
  input ICE_27
);
wire pll_clk;
pll pll_inst(
  .clock_in(clk_100p0),
  .clock_out(pll_clk),
  .locked()
);
  pipelinec_top pipelinec_inst(
 .pll_clk_val_input(pll_clk),
    //.clk_100p0(pll_clk),
    // RGB LED
    .ice_39_return_output(ICE_39),
    .ice_40_return_output(ICE_40),
    .ice_41_return_output(ICE_41),
    // UART
    .ice_25_return_output(ICE_25),
    .ice_27_val_input(ICE_27)
  );

endmodule
