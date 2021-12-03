#include "adc.h"
 


void Error_Handler_Adc(void)
{
	while (1)
	{
		printf("Error_Handler adc\r\n");
	}
}


void ADC_Init(uint32_t adc_num, uint32_t freq)
{
	/* 
		//ADC_CHANNEL_0 : PA1
		//ADC_CHANNEL_1 : PA4
		//ADC_CHANNEL_2 : PA3
		//ADC_CHANNEL_3 : PA2
		//ADC_CHANNEL_0_1 : PA1 and PA4
		//ADC_CHANNEL_2_3 : PA3 and PA2
						 
	#define ADC_CHANNEL_0		ADC_ANA_CR_CH_0
	#define ADC_CHANNEL_1		ADC_ANA_CR_CH_1
	#define ADC_CHANNEL_2		ADC_ANA_CR_CH_2
	#define ADC_CHANNEL_3		ADC_ANA_CR_CH_3
	#define ADC_CHANNEL_0_1		ADC_ANA_CR_CH_8
	#define ADC_CHANNEL_2_3		ADC_ANA_CR_CH_9
	#define ADC_CHANNEL_VOL		ADC_ANA_CR_CH_VOL
	#define ADC_CHANNEL_TEMP	ADC_ANA_CR_CH_TEMP
	#define ADC_CHANNEL_OFFSET	ADC_ANA_CR_CH_OFFSET
*/

	uint32_t ADC_CHANNEL;
	 /* 307hz ~ 2khz */
	switch(adc_num)
	{
		case 0: ADC_CHANNEL = ADC_CHANNEL_0; break; 	//PA1
		case 1: ADC_CHANNEL = ADC_CHANNEL_1; break;		//PA4
		case 2: ADC_CHANNEL = ADC_CHANNEL_2; break;		//PA3
		case 3: ADC_CHANNEL = ADC_CHANNEL_3; break;		//PA2
		case 4: ADC_CHANNEL = ADC_CHANNEL_TEMP; break;
		case 5: ADC_CHANNEL = ADC_CHANNEL_VOL; break;
		default : printf("adc init ADC_CHANNEL err, The number of channels is not between 0 and 3 \r\n");return; break;
	}
	
	hadc[adc_num].Instance = ADC;
	hadc[adc_num].Init.channel = ADC_CHANNEL;
	hadc[adc_num].Init.freq = freq;
	
	if (HAL_ADC_Init(&hadc[adc_num]) != HAL_OK)
	{
		Error_Handler_Adc();
	}
}

void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)
{
	
}

