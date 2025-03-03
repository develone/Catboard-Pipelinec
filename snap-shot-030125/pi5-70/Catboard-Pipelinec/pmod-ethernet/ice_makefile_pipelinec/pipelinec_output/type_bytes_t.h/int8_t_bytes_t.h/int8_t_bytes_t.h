#pragma once
#include "uint8_t_array_N_t.h"
#define int8_t_bytes_t uint8_t_array_1_t
#define int8_t_SIZE 1
#define int8_t_size_t uint1_t

#pragma FUNC_WIRES int8_t_to_bytes
int8_t_bytes_t int8_t_to_bytes(int8_t x)
{
int8_t_bytes_t rv;
rv.data[0] = int8_7_0(x);

    return rv;
}

#define INT8_T_TO_BYTES(dst_byte_array, int8_t_x)\
int8_t_bytes_t int8_t_to_bytes_WIRE = int8_t_to_bytes(int8_t_x);\
uint32_t int8_t_to_bytes_i;\
for(int8_t_to_bytes_i=0;int8_t_to_bytes_i<int8_t_SIZE;int8_t_to_bytes_i+=1)\
{\
  dst_byte_array[int8_t_to_bytes_i] = int8_t_to_bytes_WIRE.data[int8_t_to_bytes_i];\
}

#pragma FUNC_WIRES bytes_to_int8_t
int8_t bytes_to_int8_t(uint8_t bytes[int8_t_SIZE])
{
int8_t rv;
rv = 0;
rv = int8_uint8_0(rv, bytes[0]);

    return rv;
}