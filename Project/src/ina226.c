#include "ina226.h"
#include "iic.h"


uint16_t INA226_Read2Byte(uint8_t dev_addr, uint8_t reg_addr)
{
	uint8_t reg_data_8[2] = {0};
	uint16_t reg_data_16 = 0xffff;
	uint8_t state = 0;
	state = HAL_I2C_Read(&hi2c[INA226_NUM], dev_addr, reg_addr, reg_data_8, 2);
	if(state == HAL_ERROR)
	{
		printf("IIC read ERROR \r\n");
	}
	reg_data_16 = reg_data_8[0];
	reg_data_16=(reg_data_16<<8)&0xFF00;
	reg_data_16|=reg_data_8[1];
	return reg_data_16;
}

uint8_t INA226_Write2Byte(uint8_t dev_addr, uint8_t reg_addr,uint16_t reg_data)
{       
	uint8_t state = 0;
	uint8_t temp[2] = {0};
	temp[0] = (uint8_t)((reg_data&0xFF00)>>8);
	temp[1] = (uint8_t)reg_data&0x00FF;
	state = HAL_I2C_Write(&hi2c[INA226_NUM], dev_addr, reg_addr, temp, 2);	
	if(state == HAL_ERROR)
	{
		printf("IIC write ERROR \r\n");
	}

	return 1;
}



//获取id
uint32_t INA226_Get_ID(uint8_t dev_addr)
{
	uint32_t temp=0;
	temp = INA226_Read2Byte(dev_addr,ID_Reg);
	return temp;
}

//1mA/bit
uint16_t INA226_GetShunt_Current(uint8_t dev_addr)
{
	uint16_t temp = 0;	
	temp = INA226_Read2Byte(dev_addr, Current_Reg);
	if(temp&0x8000)	temp = ~(temp - 1);	
	return temp;
}

//获取校准值
uint16_t INA226_GET_CAL_REG(uint8_t dev_addr)
{	
	uint16_t temp=0;
	temp = INA226_Read2Byte(dev_addr, Calib_Reg);
	return (uint16_t)temp;
}

//1.25mV/bit
uint16_t INA226_GetVoltage(uint8_t dev_addr)
{
	uint16_t temp = 0;
	temp = INA226_Read2Byte(dev_addr, Bus_V_Reg);
	//printf("v_data:  %d  \r\n",temp);
	return (uint16_t)temp;	
}
 
//2.5uV/bit
uint16_t INA226_GetShuntVoltage(uint8_t dev_addr)
{
	int16_t temp = 0;
	temp = INA226_Read2Byte(dev_addr, Shunt_V_Reg);
	if(temp&0x8000)	temp = ~(temp - 1);	
	return (uint16_t)temp;	
}


//获取电压
float Get_Voltage()//mV
{
	float Value;
	Value = INA226_GetVoltage(INA226_READ_ADDR)*Voltage_LSB;
	return Value;
}
 
//获取分流电压
float Get_Shunt_voltage()//mV
{
	float Value;
	Value = INA226_GetShuntVoltage(INA226_READ_ADDR)*INA226_VAL_LSB*0.001;//如需矫正电流分流参数请将这里改为2.5
	return Value;
}
 
//获取电流
float Get_Shunt_Current()//mA
{	
	float Current;
	Current = INA226_GetShunt_Current(INA226_READ_ADDR)* CURRENT_LSB;
	return Current;
}

//获取功率= 总线电压 * 电流
float Get_Power()//W
{
	float mV = 0;
	float mA = 0;
	float Power = 0.0;
	mV = Get_Voltage();			//mV
	mA= Get_Shunt_Current();	//mA
	mA = (int)mA;
	Power = (mV/1000) * (mA/1000); 	//mV*mA
	return Power;
}

//获取功率,ina226内部计算，不准确，不采用
int16_t INA226_GetPower(uint8_t dev_addr)
{
	int16_t temp=0;
	temp = INA226_Read2Byte(dev_addr, Power_Reg);
	printf("This method has a large error, please use caution. Use \"Get_Power ()\"");
	return temp;
}
 
//获取功率,ina226内部计算，不准确，不采用
float Get_Power_F()//W
{
	float Power = 0.0;
	Power = (INA226_GetPower(INA226_READ_ADDR)*POWER_LSB);
	return Power;
}


void Get_INA226_All_Value(INA226_VALUE *ina226_value)
{
	ina226_value->Bus_V = Get_Voltage();  			//mv
	ina226_value->Shunt_V = Get_Shunt_voltage();	//uv
	ina226_value->Current = Get_Shunt_Current();	//ma	
	ina226_value->Power = Get_Power();				//mw
}
 
 
void INA226_Init(void)
{
	
	I2C_Init(INA226_NUM);
	INA226_Write2Byte(INA226_WRITE_ADDR, Config_Reg, 0x8000);		//重新启动
	//0b0100101001001111,204us,256次测量 204*256 = 53ms
	//0x484f设置转换时间204us,求平均值次数128，采样时间为204*128 = 26ms，
	//0x452716次平均,1.1ms,1.1ms,连续测量分流电压和总线电压
	INA226_Write2Byte(INA226_WRITE_ADDR, Config_Reg, 0b0100101001001111);		
	INA226_Write2Byte(INA226_WRITE_ADDR, Calib_Reg, CAL);		//设置分辨率
	
	/*
	I2C_Init(INA226_NUM);
	INA226_Write2Byte(Config_Reg, 0x4527);//0100_010_100_100_111 
	INA226_Write2Byte(Calib_Reg, 0x0A00);
	*/
}
