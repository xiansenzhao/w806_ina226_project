#include "spi.h"


SPI_HandleTypeDef hspi;


void SPI_Init(void)
{
	hspi.Instance = SPI;
	hspi.Init.Mode = SPI_MODE_MASTER;
	hspi.Init.CLKPolarity = SPI_POLARITY_LOW;
	hspi.Init.CLKPhase = SPI_PHASE_1EDGE;
	hspi.Init.NSS = SPI_NSS_SOFT;
	hspi.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_8;
	hspi.Init.FirstByte = SPI_LITTLEENDIAN;
	
	if (HAL_SPI_Init(&hspi) != HAL_OK)
	{
		printf("SPI INIT err...\r\n");
	}
}



/*SPI EXAMPLE 
 * 
	#define data_len (20*1024)
	uint8_t tx_data[data_len] = {0};
	uint8_t rx_data[data_len] = {0};
	SPI_Init();
	while(1)
	{
		__HAL_SPI_SET_CS_LOW(&hspi);
		HAL_SPI_Transmit(&hspi, tx_data, 10, 1000);
		HAL_SPI_Receive(&hspi, rx_data, data_len, 1000);
		HAL_SPI_TransmitReceive(&hspi, tx_data, rx_data, data_len, 1000);
	}

*/