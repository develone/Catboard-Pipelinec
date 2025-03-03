#pragma once
#include "type_bytes_t.h/int8_t_bytes_t.h/int8_t_bytes.h"
#define work_outputs_t_SIZE 4

void work_outputs_t_to_bytes(work_outputs_t* x, uint8_t* bytes)
{
size_t pos = 0;
// result
size_t result_dim_0;
for(result_dim_0=0;result_dim_0<2;result_dim_0=result_dim_0+1){
size_t result_dim_1;
for(result_dim_1=0;result_dim_1<2;result_dim_1=result_dim_1+1){
 int8_t_to_bytes(&(x->result[result_dim_0][result_dim_1]), &(bytes[pos]));
 pos = pos + 1; // not sizeof()
}
}

}

void bytes_to_work_outputs_t(uint8_t* bytes, work_outputs_t* x)
{
size_t pos = 0;
// result
size_t result_dim_0;
for(result_dim_0=0;result_dim_0<2;result_dim_0=result_dim_0+1){
size_t result_dim_1;
for(result_dim_1=0;result_dim_1<2;result_dim_1=result_dim_1+1){
 bytes_to_int8_t(&(bytes[pos]), &(x->result[result_dim_0][result_dim_1]));
 pos = pos + 1; // not sizeof()
}
}

}
