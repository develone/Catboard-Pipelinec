
#include "uintN_t.h"
#include "intN_t.h"
//#include "bit_manip.h"
uint1_t BIN_OP_LT_uint6_t_uint6_t(uint6_t left, uint6_t right)
{

    // Bottom without any extra bits    
    uint6_t left_bot = left;
    uint6_t right_bot = right;
    uint1_t rv;

    // Subtractor based compare
    int7_t sub = (int7_t)left_bot - right_bot;
    uint1_t lt_zero = sub(6,6);
    rv = lt_zero;

  return rv;  
}