#ifndef __PWM_H__
#define __PWM_H__

#include "wm_hal.h"

//PWM
/*
// PWM_Channel
#define PWM_CHANNEL_0	0x00
#define PWM_CHANNEL_1	0x01
#define PWM_CHANNEL_2	0x02
#define PWM_CHANNEL_3	0x03
#define PWM_CHANNEL_4	0x04
#define PWM_CHANNEL_ALL	0x01F
*/
extern PWM_HandleTypeDef hpwm[5];
void PWM_Init(uint32_t PWM_CHANNEL);


#endif