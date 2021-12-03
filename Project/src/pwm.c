#include "pwm.h"

PWM_HandleTypeDef hpwm[5] = {0};


/*
 * 
 * PWM EXAMPLE 
	//PWM
	//PWM_Init(PWM_CHANNEL_0);
	//HAL_PWM_Start(&hpwm[PWM_CHANNEL_0], PWM_CHANNEL_0);
	 * 
	HAL_PWM_Duty_Set(&hpwm[PWM_CHANNEL_0], PWM_CHANNEL_0, i);
* 
* 
*/


/* 输出波形的频率： f = 40MHz / Prescaler / (Period + 1)；
 * 输出波形的占空比： 
 *     沿对齐模式（递减）：(Pulse + 1) / (Period + 1)
 *                         Pulse >= Period：PWM输出一直为高电平
 *                         Pulse < Period ：PWM输出高电平宽度为(Pulse + 1)，低电平宽度为(Period - Pulse)
 *                         Pulse = 0      ：PWM输出高电平宽度为(1)，低电平宽度为(Period)
 * 
 *    中间对齐模式       ：(2 * Pulse + 1) / (2 * (Period + 1))
 *                         Pulse > Period ：PWM输出一直为高电平
 *                         Pulse <= Period：PWM输出高电平宽度为(2 * Pulse + 1)，低电平宽度为(2 * (Period - Pulse) + 1)
 *                         Pulse = 0      ：PWM输出高电平宽度为(1)，低电平宽度为(2 * Period + 1)
 */
void PWM_Init(uint32_t PWM_CHANNEL)
{
	/*
	// PWM_Channel
	#define PWM_CHANNEL_0	0x00
	#define PWM_CHANNEL_1	0x01
	#define PWM_CHANNEL_2	0x02
	#define PWM_CHANNEL_3	0x03
	#define PWM_CHANNEL_4	0x04
	#define PWM_CHANNEL_ALL	0x01F
	*/
	
	if(PWM_CHANNEL < 0 || PWM_CHANNEL > 0x04)
	{
		printf("pwm init PWM_CHANNEL err, The number of channels is not between 0 and 4 \r\n");
		return;
	}
	
	/*
	uint32_t num = 0;
	switch(PWM_CHANNEL)
	{
		case 0x00: num = 0;break;
		case 0x01: num = 1;break;
		case 0x02: num = 2;break;
		case 0x03: num = 3;break;
		case 0x04: num = 4;break;
	}
	*/ 
	//printf("pwm_num: %d \r\n",num);
	

	//PWM时钟固定为40MHZ
	//默认是输出100KHz、占空比20%的波形
	//输出频率 khz = 40000kHZ/4(分频系数)/(Period+1)
	hpwm[PWM_CHANNEL].Instance = PWM;
	hpwm[PWM_CHANNEL].Init.AutoReloadPreload = PWM_AUTORELOAD_PRELOAD_ENABLE;
	hpwm[PWM_CHANNEL].Init.CounterMode = PWM_COUNTERMODE_EDGEALIGNED_DOWN;
	hpwm[PWM_CHANNEL].Init.Prescaler = 4;	//时钟分频系数  
	hpwm[PWM_CHANNEL].Init.Period = 99;	// 40M / 4 / 100K - 1   /周期
	hpwm[PWM_CHANNEL].Init.Pulse = 19;	// 20% DUTY   //设置占空比的，
	hpwm[PWM_CHANNEL].Init.OutMode = PWM_OUT_MODE_INDEPENDENT;
	hpwm[PWM_CHANNEL].Channel = PWM_CHANNEL;
	
	HAL_PWM_Init(&hpwm[PWM_CHANNEL]);
}
