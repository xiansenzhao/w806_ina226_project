#ifndef __IIC_H__
#define __IIC_H__

#include "wm_hal.h"


//IIC
#define OLED_NUM 	0
#define INA226_NUM 	1

//addr
//#define INA226_ADDR	0x80
//#define OLED_ADDR	0x78

extern I2C_HandleTypeDef hi2c[2];

void I2C_Init(uint32_t);

#endif