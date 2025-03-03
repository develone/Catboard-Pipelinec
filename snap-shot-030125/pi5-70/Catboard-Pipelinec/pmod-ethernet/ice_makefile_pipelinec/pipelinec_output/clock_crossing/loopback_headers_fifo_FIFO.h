#pragma once
#include "uintN_t.h"
#define loopback_headers_fifo_FIFO_RATIO 1
typedef struct loopback_headers_fifo_FIFO_write_t
{
uint1_t ready;
}loopback_headers_fifo_FIFO_write_t;
typedef struct loopback_headers_fifo_FIFO_read_t
{
eth_header_t data[1];
uint1_t valid;
}loopback_headers_fifo_FIFO_read_t;

// Clock cross write
loopback_headers_fifo_FIFO_write_t loopback_headers_fifo_FIFO_WRITE_1(eth_header_t write_data[1], uint1_t write_enable)
{
  // TODO
}

// Clock cross read
loopback_headers_fifo_FIFO_read_t loopback_headers_fifo_FIFO_READ_1(uint1_t read_enable)
{
  // TODO
}
