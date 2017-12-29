/**
*******************************************
* @file     main.c
* @author   nhantt
* @version  V1.0.0
* @date     25-March-2017
* @brief    This file brief for save memory used build with SDCC
*********************************************
*/

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "main.h"
#include "stm8s_gpio.h"
#include "stm8s_clk.h"
#include "stm8s_conf.h"
#include "stm8s_spi.h"
#include <string.h>
#include "stm8s_i2c.h"
#include "lcd5110.h"

void clock_setup(void)
{
   CLK_DeInit();
   CLK_HSECmd(DISABLE);
   CLK_LSICmd(DISABLE);
   CLK_HSICmd(ENABLE);
   while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
   CLK_ClockSwitchCmd(ENABLE);
   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
   CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);
   CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
}
// SPI Interrupt routine.
// INTERRUPT_HANDLER(SPI_IRQHandler, 10){
//   if(SPI_SR & SPI_SR_RXNE){ // RX not empty - send next byte
//     spi_send_next();
//   }
// }



// void IWDG_Config(void)
// {
//   /* IWDG timeout equal to 500 ms (the timeout may varies due to LSI frequency dispersion) */
//   /* Enable write access to IWDG_PR and IWDG_RLR registers */
//   IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
//   /* IWDG counter clock: LSI 128KHz/256 */
//   IWDG_SetPrescaler(IWDG_Prescaler_256);
//   //Set counter reload value to obtain 0.5s IWDG TimeOut.
//   //Counter Reload Value = 0.5s/IWDG counter clock period
//   //                       = 0.5s*LsiFreq/(256) 
//   IWDG_SetReload(250);
//   /* Reload IWDG counter */
//   IWDG_ReloadCounter();
//   /* Enable IWDG (the LSI oscillator will be enabled by hardware) */
//   IWDG_Enable();
// }

void main() 
{
  uint16_t i;
  clock_setup();
  // SPI_setup(); 
  // TIMER_Init();
  //IWDG_Config();
  //enableInterrupts();
  //TIMER_InitTime(&tick);
  GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
  GPIO_Init(GPIOC, GPIO_PIN_5|GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST);
  GPIO_Init(GPIOD, GPIO_PIN_1|GPIO_PIN_2|GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
  GPIO_WriteLow(GPIOB, GPIO_PIN_5);
  LcdInit();
  LcdContrast(0x3E);
  LcdClear();
  LcdGotoXYFont(1,1);
  LcdStr(FONT_2X, (uint8_t *)"nhantt");
  LcdGotoXYFont(1,4);
  LcdStr(FONT_1X, (uint8_t *)"01268090091");
  LcdUpdate();
  while(1) 
  {

  }
}
