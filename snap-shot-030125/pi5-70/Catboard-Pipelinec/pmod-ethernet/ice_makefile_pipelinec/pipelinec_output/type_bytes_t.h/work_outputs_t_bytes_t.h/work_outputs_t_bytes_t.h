#pragma once
#include "int8_t_bytes_t.h"
#include "uint8_t_array_N_t.h"
#define work_outputs_t_bytes_t uint8_t_array_4_t
#define work_outputs_t_SIZE 4
#define work_outputs_t_size_t uint3_t

#pragma FUNC_WIRES work_outputs_t_to_bytes
work_outputs_t_bytes_t work_outputs_t_to_bytes(work_outputs_t x)
{
work_outputs_t_bytes_t rv;
uint3_t pos = 0;
uint3_t field_pos = 0;
// result
uint2_t result_dim_0;
for(result_dim_0=0;result_dim_0<2;result_dim_0=result_dim_0+1){
uint2_t result_dim_1;
for(result_dim_1=0;result_dim_1<2;result_dim_1=result_dim_1+1){
 int8_t_bytes_t result_elem_bytes = int8_t_to_bytes(x.result[result_dim_0][result_dim_1]);
 for(field_pos=0;field_pos<sizeof(int8_t);field_pos = field_pos + 1)
  {
    rv.data[pos] = result_elem_bytes.data[field_pos];
    pos = pos + 1;
  }
}
}

    return rv;
}

#define WORK_OUTPUTS_T_TO_BYTES(dst_byte_array, work_outputs_t_x)\
work_outputs_t_bytes_t work_outputs_t_to_bytes_WIRE = work_outputs_t_to_bytes(work_outputs_t_x);\
uint32_t work_outputs_t_to_bytes_i;\
for(work_outputs_t_to_bytes_i=0;work_outputs_t_to_bytes_i<work_outputs_t_SIZE;work_outputs_t_to_bytes_i+=1)\
{\
  dst_byte_array[work_outputs_t_to_bytes_i] = work_outputs_t_to_bytes_WIRE.data[work_outputs_t_to_bytes_i];\
}

#pragma FUNC_WIRES bytes_to_work_outputs_t
work_outputs_t bytes_to_work_outputs_t(uint8_t bytes[work_outputs_t_SIZE])
{
work_outputs_t rv;
uint3_t pos = 0;
uint3_t field_pos = 0;
// result
uint2_t result_dim_0;
for(result_dim_0=0;result_dim_0<2;result_dim_0=result_dim_0+1){
uint2_t result_dim_1;
for(result_dim_1=0;result_dim_1<2;result_dim_1=result_dim_1+1){
 int8_t_bytes_t result_elem_bytes;
 for(field_pos=0;field_pos<sizeof(int8_t);field_pos = field_pos + 1)
  {
    result_elem_bytes.data[field_pos] = bytes[pos];
    pos = pos + 1;
  }
 rv.result[result_dim_0][result_dim_1] = bytes_to_int8_t(result_elem_bytes);
}
}

    return rv;
}