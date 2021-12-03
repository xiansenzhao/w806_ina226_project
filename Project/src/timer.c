#include "timer.h"


/*TIME WXAMPLE
 * 
 * 	//定时器
	TIM_Init_Us(TIM1,1000000);
	//在wm_it.c文件中，需要修改对应的参数
	HAL_TIM_Base_Start_IT(&htim[TIM1]);
 * 
 * */




TIM_HandleTypeDef htim[6] = {0};


void Error_Handler_Time(void)
{
	while (1)
	{
		printf("Error_Handler Time\r\n");
	}
}



void TIM_Init_Ms(uint32_t TIM_NUM,uint32_t time)
{
	htim[TIM_NUM].Instance = TIM_NUM;
	htim[TIM_NUM].Init.Unit = TIM_UNIT_MS;
	htim[TIM_NUM].Init.Period = time;  //定时时间
	htim[TIM_NUM].Init.AutoReload = TIM_AUTORELOAD_PRELOAD_ENABLE;
	if (HAL_TIM_Base_Init(&htim[TIM_NUM]) != HAL_OK)
	{
		Error_Handler_Time();
	}
}


void TIM_Init_Us(uint32_t TIM_NUM,uint32_t time)
{
	htim[TIM_NUM].Instance = TIM_NUM;
	htim[TIM_NUM].Init.Unit = TIM_UNIT_US;
	htim[TIM_NUM].Init.Period = time;  //定时时间
	htim[TIM_NUM].Init.AutoReload = TIM_AUTORELOAD_PRELOAD_ENABLE;
	if (HAL_TIM_Base_Init(&htim[TIM_NUM]) != HAL_OK)
	{
		Error_Handler_Time();
	}
}

