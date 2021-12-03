
#include "wm_hal.h"

__attribute__((isr)) void CORET_IRQHandler(void)
{
	uint32_t temp;
	
	temp = (*(volatile unsigned int *) (0xE000E010));
	HAL_IncTick();
}

__attribute__((isr)) void GPIOA_IRQHandler(void)
{
 	//HAL_GPIO_EXTI_IRQHandler(GPIOA, GPIO_PIN_0);
}

__attribute__((isr)) void GPIOB_IRQHandler(void)
{
	HAL_GPIO_EXTI_IRQHandler(GPIOB, GPIO_PIN_18);
	HAL_GPIO_EXTI_IRQHandler(GPIOB, GPIO_PIN_26);
}


extern TIM_HandleTypeDef htim[6];

__attribute__((isr)) void TIM0_5_IRQHandler(void)
{
	HAL_TIM_IRQHandler(&htim[0]);
	HAL_TIM_IRQHandler(&htim[1]);
}

extern ADC_HandleTypeDef hadc[6];

__attribute__((isr)) void ADC_IRQHandler(void)
{
 	HAL_ADC_IRQHandler(&hadc[1]);
	HAL_ADC_IRQHandler(&hadc[5]);
}