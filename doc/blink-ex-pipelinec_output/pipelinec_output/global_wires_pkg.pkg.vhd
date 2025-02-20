
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.c_structs_pkg.all; -- User types
-- Clock crossings
package global_wires_pkg is

  type ice_39_global_to_module_t is record
         ice_39 : unsigned(0 downto 0);

  end record;

  type ice_40_global_to_module_t is record
         ice_40 : unsigned(0 downto 0);

  end record;

  type ice_41_global_to_module_t is record
         ice_41 : unsigned(0 downto 0);

  end record;

  type led_r_connect_global_to_module_t is record
         led_r : unsigned(0 downto 0);

  end record;

  type led_g_connect_global_to_module_t is record
         led_g : unsigned(0 downto 0);

  end record;

  type led_b_connect_global_to_module_t is record
         led_b : unsigned(0 downto 0);

  end record;

  type ice_25_global_to_module_t is record
         ice_25 : unsigned(0 downto 0);

  end record;

  type uart_tx_connect_global_to_module_t is record
         uart_tx : unsigned(0 downto 0);

  end record;

  type uart_rx_connect_global_to_module_t is record
         ice_27 : unsigned(0 downto 0);

  end record;

  type uart_main_global_to_module_t is record
         uart_rx : unsigned(0 downto 0);

  end record;

  type led_r_connect_module_to_global_t is record
         ice_41 : unsigned(0 downto 0);

  end record;
  

  type led_g_connect_module_to_global_t is record
         ice_39 : unsigned(0 downto 0);

  end record;
  

  type led_b_connect_module_to_global_t is record
         ice_40 : unsigned(0 downto 0);

  end record;
  

  type ice_27_module_to_global_t is record
         ice_27 : unsigned(0 downto 0);

  end record;
  

  type uart_tx_connect_module_to_global_t is record
         ice_25 : unsigned(0 downto 0);

  end record;
  

  type uart_rx_connect_module_to_global_t is record
         uart_rx : unsigned(0 downto 0);

  end record;
  

  type blinky_main_module_to_global_t is record
         led_r : unsigned(0 downto 0);
     led_g : unsigned(0 downto 0);
     led_b : unsigned(0 downto 0);

  end record;
  

  type uart_main_module_to_global_t is record
         uart_tx : unsigned(0 downto 0);

  end record;
  
type global_to_module_t is record
    ice_39 : ice_39_global_to_module_t;
    ice_40 : ice_40_global_to_module_t;
    ice_41 : ice_41_global_to_module_t;
    led_r_connect : led_r_connect_global_to_module_t;
    led_g_connect : led_g_connect_global_to_module_t;
    led_b_connect : led_b_connect_global_to_module_t;
    ice_25 : ice_25_global_to_module_t;
    uart_tx_connect : uart_tx_connect_global_to_module_t;
    uart_rx_connect : uart_rx_connect_global_to_module_t;
    uart_main : uart_main_global_to_module_t;
  end record;
  
  type module_to_global_t is record
    led_r_connect : led_r_connect_module_to_global_t;
    led_g_connect : led_g_connect_module_to_global_t;
    led_b_connect : led_b_connect_module_to_global_t;
    ice_27 : ice_27_module_to_global_t;
    uart_tx_connect : uart_tx_connect_module_to_global_t;
    uart_rx_connect : uart_rx_connect_module_to_global_t;
    blinky_main : blinky_main_module_to_global_t;
    uart_main : uart_main_module_to_global_t;
  end record;
  
  
end global_wires_pkg;
