#ifndef __OLED_H
#define __OLED_H	

#include "wm_hal.h"

#define Max_Column	128
#define Max_Row		32

#define OLED_ADDR	0x78

#define Brightness 200 //0~255设置亮度

void OLED_Init(void);
void OLED_ShowCHinese(uint8_t x,uint8_t y,uint8_t no);
void OLED_ShowNum(uint8_t x,uint8_t y,uint32_t num,uint8_t len,uint8_t size2);
void OLED_ShowString(uint8_t x,uint8_t y,uint8_t *chr,uint8_t Char_Size);
void OLED_Clear(void);
void OLED_Display_Off(void);
void OLED_Display_On(void);
void OLED_DrawPIC(uint8_t x0, uint8_t y0,uint8_t x1, uint8_t y1,uint8_t pic_num);
#endif