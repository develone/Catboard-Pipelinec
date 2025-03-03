#pragma once
#define int8_t_SIZE 1

void int8_t_to_bytes(int8_t* x, uint8_t* bytes)
{
bytes[0] = (uint8_t)(*x>>0);

}

void bytes_to_int8_t(uint8_t* bytes, int8_t* x)
{
*x = 0;
*x |= (((int8_t)bytes[0])<<0);

}
