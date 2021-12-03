#ifndef __TIME_H__
#define __TIME_H__

#include "wm_hal.h"



//TIME
#define TIM_0	0
#define TIM_1	1
#define TIM_2	2
#define TIM_3	3
#define TIM_4   4
#define TIM_5	5

extern TIM_HandleTypeDef htim[6];

void TIM_Init_Ms(uint32_t TIM_NUM,uint32_t time);
void TIM_Init_Us(uint32_t TIM_NUM,uint32_t time);
//void HAL_TIM_Callback(TIM_HandleTypeDef *htim);


#endif