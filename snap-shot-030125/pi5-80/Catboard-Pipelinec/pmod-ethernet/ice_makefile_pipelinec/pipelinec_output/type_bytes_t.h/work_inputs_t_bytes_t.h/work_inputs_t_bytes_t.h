#pragma once
#include "int8_t_bytes_t.h"
#include "uint8_t_array_N_t.h"
#define work_inputs_t_bytes_t uint8_t_array_8_t
#define work_inputs_t_SIZE 8
#define work_inputs_t_size_t uint4_t

#pragma FUNC_WIRES work_inputs_t_to_bytes
work_inputs_t_bytes_t work_inputs_t_to_bytes(work_inputs_t x)
{
work_inputs_t_bytes_t rv;
uint4_t pos = 0;
uint4_t field_pos = 0;
// matrix0
uint2_t matrix0_dim_0;
for(matrix0_dim_0=0;matrix0_dim_0<2;matrix0_dim_0=matrix0_dim_0+1){
uint2_t matrix0_dim_1;
for(matrix0_dim_1=0;matrix0_dim_1<2;matrix0_dim_1=matrix0_dim_1+1){
 int8_t_bytes_t matrix0_elem_bytes = int8_t_to_bytes(x.matrix0[matrix0_dim_0][matrix0_dim_1]);
 for(field_pos=0;field_pos<sizeof(int8_t);field_pos = field_pos + 1)
  {
    rv.data[pos] = matrix0_elem_bytes.data[field_pos];
    pos = pos + 1;
  }
}
}
// matrix1
uint2_t matrix1_dim_0;
for(matrix1_dim_0=0;matrix1_dim_0<2;matrix1_dim_0=matrix1_dim_0+1){
uint2_t matrix1_dim_1;
for(matrix1_dim_1=0;matrix1_dim_1<2;matrix1_dim_1=matrix1_dim_1+1){
 int8_t_bytes_t matrix1_elem_bytes = int8_t_to_bytes(x.matrix1[matrix1_dim_0][matrix1_dim_1]);
 for(field_pos=0;field_pos<sizeof(int8_t);field_pos = field_pos + 1)
  {
    rv.data[pos] = matrix1_elem_bytes.data[field_pos];
    pos = pos + 1;
  }
}
}

    return rv;
}

#define WORK_INPUTS_T_TO_BYTES(dst_byte_array, work_inputs_t_x)\
work_inputs_t_bytes_t work_inputs_t_to_bytes_WIRE = work_inputs_t_to_bytes(work_inputs_t_x);\
uint32_t work_inputs_t_to_bytes_i;\
for(work_inputs_t_to_bytes_i=0;work_inputs_t_to_bytes_i<work_inputs_t_SIZE;work_inputs_t_to_bytes_i+=1)\
{\
  dst_byte_array[work_inputs_t_to_bytes_i] = work_inputs_t_to_bytes_WIRE.data[work_inputs_t_to_bytes_i];\
}

#pragma FUNC_WIRES bytes_to_work_inputs_t
work_inputs_t bytes_to_work_inputs_t(uint8_t bytes[work_inputs_t_SIZE])
{
work_inputs_t rv;
uint4_t pos = 0;
uint4_t field_pos = 0;
// matrix0
uint2_t matrix0_dim_0;
for(matrix0_dim_0=0;matrix0_dim_0<2;matrix0_dim_0=matrix0_dim_0+1){
uint2_t matrix0_dim_1;
for(matrix0_dim_1=0;matrix0_dim_1<2;matrix0_dim_1=matrix0_dim_1+1){
 int8_t_bytes_t matrix0_elem_bytes;
 for(field_pos=0;field_pos<sizeof(int8_t);field_pos = field_pos + 1)
  {
    matrix0_elem_bytes.data[field_pos] = bytes[pos];
    pos = pos + 1;
  }
 rv.matrix0[matrix0_dim_0][matrix0_dim_1] = bytes_to_int8_t(matrix0_elem_bytes);
}
}
// matrix1
uint2_t matrix1_dim_0;
for(matrix1_dim_0=0;matrix1_dim_0<2;matrix1_dim_0=matrix1_dim_0+1){
uint2_t matrix1_dim_1;
for(matrix1_dim_1=0;matrix1_dim_1<2;matrix1_dim_1=matrix1_dim_1+1){
 int8_t_bytes_t matrix1_elem_bytes;
 for(field_pos=0;field_pos<sizeof(int8_t);field_pos = field_pos + 1)
  {
    matrix1_elem_bytes.data[field_pos] = bytes[pos];
    pos = pos + 1;
  }
 rv.matrix1[matrix1_dim_0][matrix1_dim_1] = bytes_to_int8_t(matrix1_elem_bytes);
}
}

    return rv;
}