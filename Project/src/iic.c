#include "iic.h"

I2C_HandleTypeDef hi2c[2];

void I2C_Init(uint32_t num)
{
	if(num == OLED_NUM)
	{
		printf("OLED GPIO INIT\r\n");
		hi2c[num].SCL_Port = GPIOA;
		hi2c[num].SCL_Pin = GPIO_PIN_1;
		hi2c[num].SDA_Port = GPIOA;
		hi2c[num].SDA_Pin = GPIO_PIN_4;
	}else if(num == INA226_NUM)
	{
		printf("INA226 GPIO INIT\r\n");
		hi2c[num].SCL_Port = GPIOB;
		hi2c[num].SCL_Pin = GPIO_PIN_14;
		hi2c[num].SDA_Port = GPIOB;
		hi2c[num].SDA_Pin = GPIO_PIN_15;
	}

	HAL_I2C_Init(&hi2c[num]);
}