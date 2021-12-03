#ifndef __ADC_H__
#define __ADC_H__

#include "wm_hal.h"

//ADC
/* 
 * ADC_CHANNEL_0 	: channel 0
 * ADC_CHANNEL_1 	: channel 1
 * ADC_CHANNEL_2 	: channel 2
 * ADC_CHANNEL_3 	: channel 3
 * ADC_CHANNEL_0_1 	: channel 0 and channel 1 differential input
 * ADC_CHANNEL_2_3 	: channel 2 and channel 3 differential input */
					 
 /* 307hz ~ 2khz */
 
 
#define ADC_1		0 	//PA1
#define ADC_2		1	//PA4
#define ADC_3		2	//PA3
#define ADC_4		3	//PA2
#define ADC_TEMP	4
#define ADC_VOL		5
 
//ADC数值转电压系数 
#define ADC_Voltage_LSB  0.0013 
 
void ADC_Init(uint32_t,uint32_t);
ADC_HandleTypeDef hadc[6];




#endif