library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.c_structs_pkg.all;
use work.global_wires_pkg.all;

  entity pipelinec_top is
port(
-- All clocks
clk_12p0 : in std_logic;

-- IO for each main func
ice_39_return_output : out unsigned(0 downto 0);
ice_40_return_output : out unsigned(0 downto 0);
ice_41_return_output : out unsigned(0 downto 0);
ice_25_return_output : out unsigned(0 downto 0);
ice_27_val_input : in unsigned(0 downto 0)
  );
end pipelinec_top;
architecture arch of pipelinec_top is

attribute syn_keep : boolean;
attribute keep : string;
attribute dont_touch : string;


-- Global/clock crossing wires from modules to global area
signal module_to_global : module_to_global_t;
-- Global/clock crossing wires from the global area to modules
signal global_to_module : global_to_module_t;

begin

-- Instantiate each main
-- main functions are always clock enabled, always running
ice_39_0CLK_de264c78 : entity work.ice_39_0CLK_de264c78 port map (
global_to_module.ice_39,
ice_39_return_output);

ice_40_0CLK_de264c78 : entity work.ice_40_0CLK_de264c78 port map (
global_to_module.ice_40,
ice_40_return_output);

ice_41_0CLK_de264c78 : entity work.ice_41_0CLK_de264c78 port map (
global_to_module.ice_41,
ice_41_return_output);

led_r_connect_0CLK_de264c78 : entity work.led_r_connect_0CLK_de264c78 port map (
clk_12p0,
to_unsigned(1,1),
global_to_module.led_r_connect,
module_to_global.led_r_connect);

led_g_connect_0CLK_de264c78 : entity work.led_g_connect_0CLK_de264c78 port map (
clk_12p0,
to_unsigned(1,1),
global_to_module.led_g_connect,
module_to_global.led_g_connect);

led_b_connect_0CLK_de264c78 : entity work.led_b_connect_0CLK_de264c78 port map (
clk_12p0,
to_unsigned(1,1),
global_to_module.led_b_connect,
module_to_global.led_b_connect);

ice_25_0CLK_de264c78 : entity work.ice_25_0CLK_de264c78 port map (
global_to_module.ice_25,
ice_25_return_output);

ice_27_0CLK_de264c78 : entity work.ice_27_0CLK_de264c78 port map (
module_to_global.ice_27,
ice_27_val_input);

uart_tx_connect_0CLK_de264c78 : entity work.uart_tx_connect_0CLK_de264c78 port map (
clk_12p0,
to_unsigned(1,1),
global_to_module.uart_tx_connect,
module_to_global.uart_tx_connect);

uart_rx_connect_0CLK_de264c78 : entity work.uart_rx_connect_0CLK_de264c78 port map (
clk_12p0,
to_unsigned(1,1),
global_to_module.uart_rx_connect,
module_to_global.uart_rx_connect);

blinky_main_0CLK_23f04728 : entity work.blinky_main_0CLK_23f04728 port map (
clk_12p0,
to_unsigned(1,1),
module_to_global.blinky_main);

uart_main_0CLK_de264c78 : entity work.uart_main_0CLK_de264c78 port map (
global_to_module.uart_main,
module_to_global.uart_main);


-- Directly connected global register read wires
global_to_module.led_r_connect.led_r <= module_to_global.blinky_main.led_r;

global_to_module.led_b_connect.led_b <= module_to_global.blinky_main.led_b;

global_to_module.uart_rx_connect.ice_27 <= module_to_global.ice_27.ice_27;

global_to_module.ice_39.ice_39 <= module_to_global.led_g_connect.ice_39;

global_to_module.ice_25.ice_25 <= module_to_global.uart_tx_connect.ice_25;

global_to_module.uart_tx_connect.uart_tx <= module_to_global.uart_main.uart_tx;

global_to_module.ice_41.ice_41 <= module_to_global.led_r_connect.ice_41;

global_to_module.ice_40.ice_40 <= module_to_global.led_b_connect.ice_40;

global_to_module.uart_main.uart_rx <= module_to_global.uart_rx_connect.uart_rx;

global_to_module.led_g_connect.led_g <= module_to_global.blinky_main.led_g;


end arch;
