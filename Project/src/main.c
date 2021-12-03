#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "wm_hal.h"
#include <sys.h>
#include "time.h"

//add by zxx
#include "adc.h"
#include "pwm.h"
#include "timer.h"
#include "gpio.h"
#include "oled.h"
#include "iic.h"
#include "ina226.h"
#include "spi.h"
//add end


//ADC
#define VOL_LSB 	68.5/1000000
#define VCMIN		1.311
#define GAIN_PGA	1


/*******0X50000~0X100000共704K可以用****
 * *****************************0x80FFFFF
 *            USER PARAM
 * ****************************0x80XXXXX
 *            RUN IMAGE
 * ****************************0x8010400
 *            RUN IMAGE HEADER
 * ****************************0x8010000
 *            SECBOOT IMAGE
 * ****************************0x8002400
 *            SECBOOT IMAGE HEAER
 * ****************************0x8002000
 *            CHIP DATA
 * ****************************0x8000000*/
//FLASH
#define LEN 5000
#define Fash_Addr 0x80000



void Get_INA226_Value(INA226_VALUE *ina226_value);
void OLED_Show(INA226_VALUE *ina226_value);
void Write_Flash(INA226_VALUE *ina226_value);
void Read_Flash(INA226_VALUE *ina226_value);


INA226_VALUE INA226_Value;

bool Show_Flage = 1;

int main(void)
{
	
	
	SystemClock_Config(CPU_CLK_240M);
	printf("enter main\r\n");
	HAL_Init();
	
	Read_Flash(&INA226_Value);
	HAL_Delay(100);
	//B26  18 按键输入
	GPIO_Init();
	
	//OLED init A1-SCL A4-SDA
	OLED_Init();

	//电压采集初始化
	//INA226 init B14-SCL B15-SDA
	INA226_Init();
	
	//ADC  A2 输入电压的采集
	//A2  是通道4 
	ADC_Init(ADC_4,1000);
	ADC_Init(ADC_VOL,1000);
	ADC_Init(ADC_TEMP,1000);
	
	//定时器
	TIM_Init_Us(TIM0,100000);
	//在wm_it.c文件中，需要修改对应的参数
	HAL_TIM_Base_Start_IT(&htim[TIM0]);
	
	//定时器
	//TIM_Init_Us(TIM1,1000000);
	//在wm_it.c文件中，需要修改对应的参数
	//HAL_TIM_Base_Start_IT(&htim[TIM1]);
	
	
	//PWM
	//PWM_Init(PWM_CHANNEL_0);
	//HAL_PWM_Start(&hpwm[PWM_CHANNEL_0], PWM_CHANNEL_0);
	
	Delay_Us(240,10);
	
	//OLED_DrawPIC(0,0,127,3,1);
	//HAL_Delay(1500);
	OLED_Clear();
	
	while(1)
	{
		//uint32_t start = HAL_GetTick();
		
		Get_INA226_All_Value(&INA226_Value);
		//uint32_t end = HAL_GetTick();
		//printf("run time: %d ms \r\n",end-start);
		//printf("%f %f  %f  %f  \r\n",INA226_value.Bus_V*1.25,INA226_value.Shunt_V*2.5*0.001,INA226_value.Current*0.02,INA226_value.Power*0.02*25);
		//printf("%f %f  %f  %f  %f  %f mAh  %f mW\r\n",INA226_Value.Bus_V, INA226_Value.Shunt_V, INA226_Value.Current, INA226_Value.Power,INA226_Value.Power_All,INA226_Value.mAh,INA226_Value.Wh);
		
		
		
		if(1 == Show_Flage)
		{
			Write_Flash(&INA226_Value);
			OLED_Show(&INA226_Value);
			Show_Flage = 0;
			//printf("%f %f  %f  %f  %f  %f mAh  %f mW\r\n",INA226_Value.Bus_V, INA226_Value.Shunt_V, INA226_Value.Current, INA226_Value.Power,INA226_Value.Power_All,INA226_Value.mAh,INA226_Value.Wh);
		
		}
		
		if(1 == key_flag)
		{
			INA226_Value.Time.All_Sec = 0;
			INA226_Value.Time.Hour = 0;
			INA226_Value.Time.Min = 0;
			INA226_Value.Time.Sec = 0;
			INA226_Value.Power_All = 0;
			INA226_Value.mAh = 0;
			key_flag = 0;
		}else if(2 == key_flag)
		{
			key_flag = 0;
		}
		
		//ADC采样时间为53MS
		HAL_Delay(54);
		
		//uint32_t end = HAL_GetTick();
		//printf("run time: %d ms \r\n",end-start);
	}
	
}

void Write_Flash(INA226_VALUE *ina226_value)
{
	uint16_t state;
	state = HAL_FLASH_Write(Fash_Addr, (uint8_t *)&ina226_value->Time.All_Sec, sizeof(ina226_value->Time.All_Sec)/sizeof(uint8_t));
	if(state == HAL_ERROR)
	{
		printf("write FLASH er...\r\n");
	}
	/*
	state = HAL_FLASH_Write(Fash_Addr+10, (uint8_t *)&ina226_value->Power_All, sizeof(ina226_value->Power_All)/sizeof(uint8_t));
	if(state == HAL_ERROR)
	{
		printf("write FLASH er...\r\n");
	}
	*/ 
	state = HAL_FLASH_Write(Fash_Addr+20, (uint8_t *)&ina226_value->mAh, sizeof(ina226_value->mAh)/sizeof(uint8_t));
	if(state == HAL_ERROR)
	{
		printf("write FLASH er...\r\n");
	}
}


void Read_Flash(INA226_VALUE *ina226_value)
{
	uint16_t state;
	state = HAL_FLASH_Read(Fash_Addr, (uint8_t *)&ina226_value->Time.All_Sec, sizeof(ina226_value->Time.All_Sec)/sizeof(uint8_t));
	if(state == HAL_ERROR)
	{
		printf("write FLASH er...\r\n");
	}
	/*
	state = HAL_FLASH_Read(Fash_Addr+10, (uint8_t *)&ina226_value->Power_All, sizeof(ina226_value->Power_All)/sizeof(uint8_t));
	if(state == HAL_ERROR)
	{
		printf("write FLASH er...\r\n");
	}
	*/
	state = HAL_FLASH_Read(Fash_Addr+20, (uint8_t *)&ina226_value->mAh, sizeof(ina226_value->mAh)/sizeof(uint8_t));
	if(state == HAL_ERROR)
	{
		printf("write FLASH er...\r\n");
	}
}

void OLED_Show(INA226_VALUE *ina226_value)
{
	uint8_t string[40] = {0};
	num2char(string,ina226_value->Bus_V/1000,2,3,"V");
	OLED_ShowString(0,0,string,16);
	
	num2char(string,ina226_value->Current/1000,1,3,"A");
	//printf(" string:  %s %d  %d ",string,ina226_value->Current,ina226_value->Current/1000);
	OLED_ShowString(68,0,string,16);
	
	num2char(string,ina226_value->Power,2,3,"W");
	OLED_ShowString(0,2,string,12);
	
	
	time2string(string,INA226_Value.Time.Hour, INA226_Value.Time.Min, INA226_Value.Time.Sec);
	OLED_ShowString(0,3,string,12);
	
	
	num2char(string,ina226_value->mAh,4,0,"mAh");
	//printf("%s ",string);
	OLED_ShowString(60,2,string,12);
	
}






//可以理解成定时器服务函数
void HAL_TIM_Callback(TIM_HandleTypeDef *htim)
{

	//static int8_t adc_num = 1;
	//static bool adc_flage = 1;
	static uint8_t time_num = 0;
	
	if (htim->Instance == TIM1)
	{
		/*
		if(adc_num > 70 ||adc_num <= 0)
			adc_flage = !adc_flage;
		if(0 == adc_flage)	
			adc_num++;
		else
			adc_num--;
		HAL_PWM_Duty_Set(&hpwm[PWM_CHANNEL_0], PWM_CHANNEL_0, adc_num);
		*/
	}
	else if (htim->Instance == TIM0)
	{	
		time_num++;
		if(INA226_Value.Current > 1)
		{//计算时间
			
			if(time_num >= 10)
			{
				
				INA226_Value.Time.All_Sec++;
				INA226_Value.Time.Hour = INA226_Value.Time.All_Sec/(60*60);
				INA226_Value.Time.Min = (INA226_Value.Time.All_Sec%(60*60))/60;
				INA226_Value.Time.Sec = (INA226_Value.Time.All_Sec%(60*60))%60;
				time_num = 0;
			}
		
			//INA226_Value.Power_All += INA226_Value.Power;
			
			INA226_Value.mAh = INA226_Value.Current/ (3600*10) + INA226_Value.mAh;
			
			INA226_Value.Wh += (INA226_Value.Current / 1000) * (INA226_Value.Bus_V / 1000) / (3600*10);
		}
		else
		{
			if(time_num >= 10)
				time_num = 0;
		}
		
		if(0 == time_num )
			Show_Flage = 1;
		
	}

	
}




void assert_failed(uint8_t *file, uint32_t line)
{
	printf("Wrong parameters value: file %s on line %d\r\n", file, line);
}