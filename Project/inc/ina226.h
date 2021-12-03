#ifndef __INA226_H
#define __INA226_H

#include "wm_hal.h"

#define INA226_READ_ADDR                  0x81	 //A1=GND，A2=GND // R=1, W=0
#define INA226_WRITE_ADDR                 0x80

#define Config_Reg                 0x00
#define Shunt_V_Reg                0x01		//分流电压
#define Bus_V_Reg                  0x02		//总线电压
#define Power_Reg                  0x03		//电源功率  //不准
#define Current_Reg                0x04		//电流
#define Calib_Reg                  0x05		//校准，设定满量程范围以及电流和功率测数的
#define Mask_En_Reg                0x06		//屏蔽 使能 警报配置和转换准备就绪
#define Alert_Reg                  0x07		//包含与所选警报功能相比较的限定值
#define Man_ID_Reg                 0xFE  //0x5449
#define ID_Reg                     0xFF  //0x2260


//定义配置数据

/*
 * Maximum Expected Current = INA226_VAL_LSB/1000*32767/0.025
 * CURRENT_LSB = (Maximum Expected Current(ma))/(2^15)
 * CAL = 0.00512*1000/(CURRENT_LSB(ma)*R_SHUNT(Ω))
 * */
#define		Maximum_Expected_Current	10*1000 //最大电流10 A
#define 	R_SHUNT			0.1f
#define 	INA226_VAL_LSB	2.5f	//分流电压 LSB 2.5uV   INA226_VAL_LSB/1000*0x7fff / 0.025Ω = 电流测量电阻的最大电流，不是电源电流(MA)  
#define     Voltage_LSB		1.25f   //总线电压 LSB 1.25mV
#define     CURRENT_LSB 	0.1f	//电流LSB 近似才用0.1mA   CURRENT_LSB = (Maximum Expected Current(ma))/(2^15)   ---Maximum Expected Current
#define     POWER_LSB       (25*CURRENT_LSB)
#define     CAL             2048 //1024//0X0A00	// CAL = 0.00512*1000/(CURRENT_LSB(ma)*R_SHUNT(Ω))  ---R_SHUNT = 0.025欧姆  //电流寄存器的值


//运行时间
typedef struct
{
	uint64_t All_Sec;
	uint8_t Hour;
	uint8_t Min;
	uint8_t Sec;
	
}TIME_DATA;

//数据结构体
typedef struct
{
	float Bus_V;		//总线电压mv
	float Shunt_V;	//分流电压mv
	float Current;	//mA
	float Power;		//功率 w
	uint32_t Ina226_id;
	TIME_DATA Time;
	float Power_All;	//功率 w
	float mAh;
	float Wh;
	
}INA226_VALUE;




void Get_INA226_All_Value(INA226_VALUE *ina226_value);


uint16_t INA226_Read2Byte(uint8_t dev_addr, uint8_t reg_addr);
uint8_t INA226_Write2Byte(uint8_t dev_addr, uint8_t reg_addr,uint16_t reg_data);
void INA226_Init(void);

uint32_t INA226_Get_ID(uint8_t dev_addr);			//获取 id
uint16_t INA226_GetVoltage( uint8_t dev_addr);		//获取总线电压装载值
uint16_t INA226_GetShunt_Current(uint8_t dev_addr);	//获取分流电流装载值
uint16_t INA226_GetShuntVoltage(uint8_t dev_addr);	//分流电压装载值
uint16_t INA226_GET_CAL_REG(uint8_t dev_addr);		//获取校准值

float Get_Power();//W		//获取功率装载值，不使用
float Get_Shunt_voltage();//uV		//获取分流电压
float Get_Voltage();//mV		//获取电压
float Get_Shunt_Current();//mA		//获取电流


#endif
