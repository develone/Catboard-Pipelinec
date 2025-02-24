#include "top.h"
 
// Get clock rate constant PLL_CLK_MHZ from header written by make flow
#include "pll_clk_mhz.h"
DECL_INPUT(uint1_t, pll_clk)
CLK_MHZ(pll_clk, PLL_CLK_MHZ) 
#define N 22
#define count_t uint23_t
//clk_25p0_out <= clk_25p0;
#pragma MAIN_MHZ blinky_main 12.0
MAIN_MHZ(blinky_main, PLL_CLK_MHZ)
void blinky_main(){
  static count_t counter;
  led_r = 1;
  led_g = counter >> N;
  led_b = 1;
  counter += 1;
}

#pragma MAIN_MHZ uart_main 12.0
void uart_main(){
  // Default loopback connect
  uart_tx_mac_word_in = uart_rx_mac_word_out;
  uart_rx_mac_out_ready = uart_tx_mac_in_ready;

  // Override .data to do case change demo
  char in_char = uart_rx_mac_word_out.data;
  char out_char = in_char;
  uint8_t case_diff = 'a' - 'A';
  if(in_char >= 'a' && in_char <= 'z'){
    out_char = in_char - case_diff;
  }else if(in_char >= 'A' && in_char <= 'Z'){
    out_char = in_char + case_diff;
  }
  uart_tx_mac_word_in.data = out_char;
}
