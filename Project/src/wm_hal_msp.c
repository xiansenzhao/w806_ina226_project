#include "wm_hal.h"

void HAL_MspInit(void)
{

}

void HAL_PWM_MspInit(PWM_HandleTypeDef *hpwm)
{
	__HAL_RCC_PWM_CLK_ENABLE();
	__HAL_AFIO_REMAP_PWM0(GPIOB, GPIO_PIN_0);
	//__HAL_AFIO_REMAP_PWM1(GPIOB, GPIO_PIN_1);
	//__HAL_AFIO_REMAP_PWM2(GPIOB, GPIO_PIN_2);
	//__HAL_AFIO_REMAP_PWM3(GPIOB, GPIO_PIN_3);
}

void HAL_PWM_MspDeInit(PWM_HandleTypeDef *hpwm)
{
	__HAL_RCC_PWM_CLK_DISABLE();
	HAL_GPIO_DeInit(GPIOB, GPIO_PIN_0);
	//HAL_GPIO_DeInit(GPIOB, GPIO_PIN_1);
	//HAL_GPIO_DeInit(GPIOB, GPIO_PIN_2);
	//HAL_GPIO_DeInit(GPIOB, GPIO_PIN_3);
}

void HAL_TIM_Base_MspInit(TIM_HandleTypeDef* htim_base)
{
	__HAL_RCC_TIM_CLK_ENABLE();
	HAL_NVIC_SetPriority(TIM_IRQn, 0);
	HAL_NVIC_EnableIRQ(TIM_IRQn);
}

void HAL_TIM_Base_MspDeInit(TIM_HandleTypeDef* htim_base)
{
	// 由于所有的TIM共用一个时钟和中断，所以如果只用了一路TIM，在DeInit时可以关闭时钟和中断，但如果使用了多路TIM，在某一路DeInit时，如果
	// 关闭时钟和中断，会影响其他在运行的TIM
//	__HAL_RCC_TIM_CLK_DISABLE();
//	HAL_NVIC_DisableIRQ(TIM_IRQn);
}

void HAL_SPI_MspInit(SPI_HandleTypeDef* hspi)
{
	__HAL_RCC_SPI_CLK_ENABLE();
	__HAL_AFIO_REMAP_SPI_CS(GPIOB, GPIO_PIN_4);
	__HAL_AFIO_REMAP_SPI_CLK(GPIOB, GPIO_PIN_2);
	__HAL_AFIO_REMAP_SPI_MISO(GPIOB, GPIO_PIN_3);
	__HAL_AFIO_REMAP_SPI_MOSI(GPIOB, GPIO_PIN_5);
}

void HAL_SPI_MspDeInit(SPI_HandleTypeDef* hspi)
{
	__HAL_RCC_SPI_CLK_DISABLE();
	HAL_GPIO_DeInit(GPIOB, GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5);
}


void HAL_ADC_MspInit(ADC_HandleTypeDef* hadc)
{
	if (hadc->Instance == ADC)
	{
		__HAL_RCC_ADC_CLK_ENABLE();
		__HAL_RCC_GPIO_CLK_ENABLE();
		
		//ADC_CHANNEL_0 : PA1
		//ADC_CHANNEL_1 : PA4
		//ADC_CHANNEL_2 : PA3
		//ADC_CHANNEL_3 : PA2
		//ADC_CHANNEL_0_1 : PA1 and PA4
		//ADC_CHANNEL_2_3 : PA3 and PA2
		if (hadc->Init.channel == ADC_CHANNEL_0)
		{
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_1);
		}
		else if (hadc->Init.channel == ADC_CHANNEL_1)
		{
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_4);
		}
		else if (hadc->Init.channel == ADC_CHANNEL_2)
		{
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_3);
		}
		else if (hadc->Init.channel == ADC_CHANNEL_3)
		{
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_2);
		}
		else if (hadc->Init.channel == ADC_CHANNEL_0_1)
		{
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_1);
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_4);
		}
		else if (hadc->Init.channel == ADC_CHANNEL_2_3)
		{
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_3);
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_2);
		}
		
		// 如果用到中断方式需要使能中断
		HAL_NVIC_SetPriority(ADC_IRQn, 0);
		HAL_NVIC_EnableIRQ(ADC_IRQn);
	}
}


void HAL_ADC_MspDeInit(ADC_HandleTypeDef* hadc)
{
	__HAL_RCC_ADC_CLK_DISABLE();
	HAL_GPIO_DeInit(GPIOA, GPIO_PIN_2);
	HAL_NVIC_DisableIRQ(ADC_IRQn);
}