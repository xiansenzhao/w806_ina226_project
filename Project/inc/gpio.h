#ifndef __GPIO_H__
#define __GPIO_H__

#include "wm_hal.h"


void GPIO_Init(void);
void HAL_GPIO_EXTI_Callback(GPIO_TypeDef *GPIOx, uint32_t GPIO_Pin);

extern volatile uint8_t key_flag ;

#endif