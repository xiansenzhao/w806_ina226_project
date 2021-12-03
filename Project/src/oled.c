#include "oled.h"
#include "oledfont.h"  	 
#include "iic.h"

#define OLED_CMD 0x00
#define OLED_DATA 0x40

//开启OLED显示    
void OLED_Display_On(void)
{
	uint8_t buf[1];
	
	buf[0] = 0x8D;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1); //设置页地址（0~7）
	buf[0] = 0x14;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列低地址
	buf[0] = 0xAF;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列高地址   
}
//关闭OLED显示     
void OLED_Display_Off(void)
{
	uint8_t buf[1];
	
	buf[0] = 0x8D;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1); //设置页地址（0~7）
	buf[0] = 0x10;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列低地址
	buf[0] = 0xAE;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列高地址	
}	

void OLED_On(void)  
{  
	uint8_t i,n;	
	uint8_t buf[1];	    
	for(i=0;i<8;i++)  
	{  		
		buf[0] = 0xb0+i;
		HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1); //设置页地址（0~7）
		buf[0] = 0x00;
		HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列低地址
		buf[0] = 0x10;
		HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列高地址   
		
		for(n=0;n<128;n++)
		{
			buf[0] = 1;
			HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_DATA, buf, 1);	//设置显示位置—列高地址 
		}
	} //更新显示
}

//清屏函数,清完屏,整个屏幕是黑色的!和没点亮一样!!!	  
void OLED_Clear(void)  
{  
	uint8_t i,n;		    
	uint8_t buf[1];
	for(i=0;i<8;i++)  
	{  
		buf[0] = 0xb0+i;
		HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1); //设置页地址（0~7）
		buf[0] = 0x00;
		HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列低地址
		buf[0] = 0x10;
		HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列高地址   
		
		for(n=0;n<128;n++)
		{
			buf[0] = 0x00;
			HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_DATA, buf, 1);	//设置显示位置—列高地址 
		}
	}
}

void OLED_Set_Pos(unsigned char x, unsigned char y) 
{
	uint8_t buf[1];
	
	buf[0] = 0xb0+y;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1); //设置页地址（0~7）
	buf[0] = ((x&0xf0)>>4)|0x10;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列低地址
	buf[0] = (x&0x0f);
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, buf, 1);	//设置显示位置—列高地址   
} 

//在指定位置显示一个字符,包括部分字符
//x:0~127
//y:0~31
//mode:0,反白显示;1,正常显示				 
//size:选择字体 16/12 
void OLED_ShowChar(uint8_t x,uint8_t y,uint8_t chr,uint8_t Char_Size)
{      	
	unsigned char c=0,i=0;	
		c=chr-' ';//得到偏移后的值			
		if(x>Max_Column-1){x=0;y=y+2;}
		if(Char_Size == 16)
			{
			OLED_Set_Pos(x,y);	
			for(i=0;i<8;i++)
			HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_DATA, &F8X16[c*16+i], 1);	
			OLED_Set_Pos(x,y+1);
			for(i=0;i<8;i++)
			HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_DATA, &F8X16[c*16+i+8], 1);	
			}
			else {	
				OLED_Set_Pos(x,y);
				for(i=0;i<6;i++)
				HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_DATA, &F6x8[c][i], 1);	//设置显示位置—列高地址
				
			}
}

//显示一个字符号串
void OLED_ShowString(uint8_t x,uint8_t y,uint8_t *chr,uint8_t Char_Size)
{
	unsigned char j=0;
	while (chr[j]!='\0')
	{		OLED_ShowChar(x,y,chr[j],Char_Size);
			x+=8;
		if(x>120){x=0;y+=2;}
			j++;
	}
}

//m^n函数
uint32_t oled_pow(uint8_t m,uint8_t n)
{
	uint32_t result=1;	 
	while(n--)result*=m;    
	return result;
}	
			  
//显示2个数字
//x,y :起点坐标	 
//len :数字的位数
//size:字体大小
//mode:模式	0,填充模式;1,叠加模式
//num:数值(0~4294967295);	 		  
void OLED_ShowNum(uint8_t x,uint8_t y,uint32_t num,uint8_t len,uint8_t size2)
{         	
	uint8_t t,temp;
	uint8_t enshow=0;						   
	for(t=0;t<len;t++)
	{
		temp=(num/oled_pow(10,len-t-1))%10;
		if(enshow==0&&t<(len-1))
		{
			if(temp==0)
			{
				OLED_ShowChar(x+(size2/2)*t,y,' ',size2);
				continue;
			}else enshow=1; 
		 	 
		}
	 	OLED_ShowChar(x+(size2/2)*t,y,temp+'0',size2); 
	}
} 

/***********功能描述：显示显示BMP图片128×32起始点坐标(x,y),x的范围0～127，y为页的范围0～3*****************/
void OLED_DrawPIC(uint8_t x0, uint8_t y0,uint8_t x1, uint8_t y1,uint8_t pic_num)
{ 	
 uint32_t j=0;
 uint8_t x,y;
  
	if(1 != pic_num)
	{
		printf("there is no num  pic \r\n");
		return ;
	}   
  if(y1%8==0) y=y1/8;      
  else y=y1/8+1;
	for(y=y0;y<y1;y++)
	{
		OLED_Set_Pos(x0,y);
    for(x=x0;x<x1;x++)
	    {  
			if(1 == pic_num)
				HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_DATA, &PIC1[j++], 1);  
	    }
	}
} 


//显示汉字
void OLED_ShowCHinese(uint8_t x,uint8_t y,uint8_t no)
{      			    
	uint8_t t,adder=0;
	OLED_Set_Pos(x,y);	
    for(t=0;t<16;t++)
	{
		HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_DATA, &Hzk[2*no][t], 1);	
		adder+=1;
	}	
		OLED_Set_Pos(x,y+1);	
    for(t=0;t<16;t++)
	{	
		HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_DATA, &Hzk[2*no+1][t], 1);	
		adder+=1;
	}					
}

//初始化SSD1306					    
void OLED_Init(void)
{ 	
	
	I2C_Init(OLED_NUM);
	uint8_t buf;// = {0xAE,0X40,0XB0,0xC8,0x81,0xff,0xa1,0xa6,0xa8,0x1f,0xd3,0x00,0xd5,0xf0,0xd9,0x22,0xda,0x02,0xdb,0x49,0x8d,0x14,0xaf};
	HAL_Delay(100);
	//addr common  data
	buf = 0xAE;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);//关闭显示
	buf = 0x40;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
	buf = 0xb0;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
	buf = 0xc8;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);//---set low column address
	buf = 0x81;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
	buf = 0xff;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
	buf = 0xa1;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);//-not offset
	buf = 0xa6;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
	buf = 0xa8;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);//设置驱动路数
	buf = 0x1f;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
	buf = 0xd3;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
	buf = 0x00;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
	buf = 0xd5;	
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
	buf = 0xf0;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
	buf = 0xd9;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
	buf = 0x22;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
	buf = 0xda;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
	buf = 0x02;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
	buf = 0x8d;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
	buf = 0x14;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
	buf = 0xdb;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);
	buf = 0x49;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);	
	buf = 0xaf;
	HAL_I2C_Write(&hi2c[OLED_NUM], OLED_ADDR, OLED_CMD, &buf, 1);	
	
	OLED_Clear();
}  
