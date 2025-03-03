#pragma once
#include "uintN_t.h"
#define no_skid_rmii_eth_mac_tx_fifo_FIFO_RATIO 1
typedef struct no_skid_rmii_eth_mac_tx_fifo_FIFO_write_t
{
uint1_t ready;
}no_skid_rmii_eth_mac_tx_fifo_FIFO_write_t;
typedef struct no_skid_rmii_eth_mac_tx_fifo_FIFO_read_t
{
axis8_t data[1];
uint1_t valid;
}no_skid_rmii_eth_mac_tx_fifo_FIFO_read_t;

// Clock cross write
no_skid_rmii_eth_mac_tx_fifo_FIFO_write_t no_skid_rmii_eth_mac_tx_fifo_FIFO_WRITE_1(axis8_t write_data[1], uint1_t write_enable)
{
  // TODO
}

// Clock cross read
no_skid_rmii_eth_mac_tx_fifo_FIFO_read_t no_skid_rmii_eth_mac_tx_fifo_FIFO_READ_1(uint1_t read_enable)
{
  // TODO
}
