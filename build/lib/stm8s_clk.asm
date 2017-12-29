;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module stm8s_clk
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CLKPrescTable
	.globl _HSIDivFactor
	.globl _CLK_DeInit
	.globl _CLK_FastHaltWakeUpCmd
	.globl _CLK_HSECmd
	.globl _CLK_HSICmd
	.globl _CLK_LSICmd
	.globl _CLK_CCOCmd
	.globl _CLK_ClockSwitchCmd
	.globl _CLK_SlowActiveHaltWakeUpCmd
	.globl _CLK_PeripheralClockConfig
	.globl _CLK_ClockSwitchConfig
	.globl _CLK_HSIPrescalerConfig
	.globl _CLK_CCOConfig
	.globl _CLK_ITConfig
	.globl _CLK_SYSCLKConfig
	.globl _CLK_SWIMConfig
	.globl _CLK_ClockSecuritySystemEnable
	.globl _CLK_GetSYSCLKSource
	.globl _CLK_GetClockFreq
	.globl _CLK_AdjustHSICalibrationValue
	.globl _CLK_SYSCLKEmergencyClear
	.globl _CLK_GetFlagStatus
	.globl _CLK_GetITStatus
	.globl _CLK_ClearITPendingBit
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	lib/stm8s_clk.c: 72: void CLK_DeInit(void)
;	-----------------------------------------
;	 function CLK_DeInit
;	-----------------------------------------
_CLK_DeInit:
;	lib/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
	mov	0x50c0+0, #0x01
;	lib/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
	mov	0x50c1+0, #0x00
;	lib/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
	mov	0x50c4+0, #0xe1
;	lib/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
	mov	0x50c5+0, #0x00
;	lib/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
	mov	0x50c6+0, #0x18
;	lib/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
	mov	0x50c7+0, #0xff
;	lib/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
	mov	0x50ca+0, #0xff
;	lib/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
	mov	0x50c8+0, #0x00
;	lib/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
	mov	0x50c9+0, #0x00
;	lib/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
00101$:
	ldw	x, #0x50c9
	ld	a, (x)
	srl	a
	jrc	00101$
;	lib/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
	mov	0x50c9+0, #0x00
;	lib/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
	mov	0x50cc+0, #0x00
;	lib/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
	mov	0x50cd+0, #0x00
	ret
;	lib/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function CLK_FastHaltWakeUpCmd
;	-----------------------------------------
_CLK_FastHaltWakeUpCmd:
;	lib/stm8s_clk.c: 102: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_clk.c: 105: CLK->ICKR |= CLK_ICKR_FHWU;
	ldw	x, #0x50c0
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
	ret
00102$:
;	lib/stm8s_clk.c: 110: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
	ldw	x, #0x50c0
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
	ret
;	lib/stm8s_clk.c: 119: void CLK_HSECmd(FunctionalState NewState)
;	-----------------------------------------
;	 function CLK_HSECmd
;	-----------------------------------------
_CLK_HSECmd:
;	lib/stm8s_clk.c: 122: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_clk.c: 125: CLK->ECKR |= CLK_ECKR_HSEEN;
	bset	0x50c1, #0
	ret
00102$:
;	lib/stm8s_clk.c: 130: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
	bres	0x50c1, #0
	ret
;	lib/stm8s_clk.c: 139: void CLK_HSICmd(FunctionalState NewState)
;	-----------------------------------------
;	 function CLK_HSICmd
;	-----------------------------------------
_CLK_HSICmd:
;	lib/stm8s_clk.c: 142: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_clk.c: 145: CLK->ICKR |= CLK_ICKR_HSIEN;
	bset	0x50c0, #0
	ret
00102$:
;	lib/stm8s_clk.c: 150: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
	bres	0x50c0, #0
	ret
;	lib/stm8s_clk.c: 160: void CLK_LSICmd(FunctionalState NewState)
;	-----------------------------------------
;	 function CLK_LSICmd
;	-----------------------------------------
_CLK_LSICmd:
;	lib/stm8s_clk.c: 163: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_clk.c: 166: CLK->ICKR |= CLK_ICKR_LSIEN;
	ldw	x, #0x50c0
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
	ret
00102$:
;	lib/stm8s_clk.c: 171: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
	ldw	x, #0x50c0
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
	ret
;	lib/stm8s_clk.c: 181: void CLK_CCOCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function CLK_CCOCmd
;	-----------------------------------------
_CLK_CCOCmd:
;	lib/stm8s_clk.c: 184: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_clk.c: 187: CLK->CCOR |= CLK_CCOR_CCOEN;
	bset	0x50c9, #0
	ret
00102$:
;	lib/stm8s_clk.c: 192: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
	bres	0x50c9, #0
	ret
;	lib/stm8s_clk.c: 203: void CLK_ClockSwitchCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function CLK_ClockSwitchCmd
;	-----------------------------------------
_CLK_ClockSwitchCmd:
;	lib/stm8s_clk.c: 206: if (NewState != DISABLE )
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_clk.c: 209: CLK->SWCR |= CLK_SWCR_SWEN;
	ldw	x, #0x50c5
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
	ret
00102$:
;	lib/stm8s_clk.c: 214: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
	ldw	x, #0x50c5
	ld	a, (x)
	and	a, #0xfd
	ld	(x), a
	ret
;	lib/stm8s_clk.c: 226: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
;	-----------------------------------------
;	 function CLK_SlowActiveHaltWakeUpCmd
;	-----------------------------------------
_CLK_SlowActiveHaltWakeUpCmd:
;	lib/stm8s_clk.c: 229: if (NewState != DISABLE)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_clk.c: 232: CLK->ICKR |= CLK_ICKR_SWUAH;
	ldw	x, #0x50c0
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
	ret
00102$:
;	lib/stm8s_clk.c: 237: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
	ldw	x, #0x50c0
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
	ret
;	lib/stm8s_clk.c: 249: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
;	-----------------------------------------
;	 function CLK_PeripheralClockConfig
;	-----------------------------------------
_CLK_PeripheralClockConfig:
	pushw	x
;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
	ld	a, (0x05, sp)
	and	a, #0x0f
	push	a
	ld	a, #0x01
	ld	(0x02, sp), a
	pop	a
	tnz	a
	jreq	00125$
00124$:
	sll	(0x01, sp)
	dec	a
	jrne	00124$
00125$:
;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
	ld	a, (0x01, sp)
	cpl	a
	ld	(0x02, sp), a
;	lib/stm8s_clk.c: 252: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
	ld	a, (0x05, sp)
	bcp	a, #0x10
	jrne	00108$
;	lib/stm8s_clk.c: 254: if (NewState != DISABLE)
	tnz	(0x06, sp)
	jreq	00102$
;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
	ldw	x, #0x50c7
	ld	a, (x)
	or	a, (0x01, sp)
	ldw	x, #0x50c7
	ld	(x), a
	jra	00110$
00102$:
;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
	ldw	x, #0x50c7
	ld	a, (x)
	and	a, (0x02, sp)
	ldw	x, #0x50c7
	ld	(x), a
	jra	00110$
00108$:
;	lib/stm8s_clk.c: 267: if (NewState != DISABLE)
	tnz	(0x06, sp)
	jreq	00105$
;	lib/stm8s_clk.c: 270: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
	ldw	x, #0x50ca
	ld	a, (x)
	or	a, (0x01, sp)
	ldw	x, #0x50ca
	ld	(x), a
	jra	00110$
00105$:
;	lib/stm8s_clk.c: 275: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
	ldw	x, #0x50ca
	ld	a, (x)
	and	a, (0x02, sp)
	ldw	x, #0x50ca
	ld	(x), a
00110$:
	popw	x
	ret
;	lib/stm8s_clk.c: 292: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
;	-----------------------------------------
;	 function CLK_ClockSwitchConfig
;	-----------------------------------------
_CLK_ClockSwitchConfig:
	pushw	x
;	lib/stm8s_clk.c: 299: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
	ldw	x, #0x50c3
	ld	a, (x)
	ld	(0x01, sp), a
;	lib/stm8s_clk.c: 302: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
	ld	a, (0x05, sp)
	cp	a, #0x01
	jrne	00122$
;	lib/stm8s_clk.c: 305: CLK->SWCR |= CLK_SWCR_SWEN;
	ldw	x, #0x50c5
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	lib/stm8s_clk.c: 308: if (ITState != DISABLE)
	tnz	(0x07, sp)
	jreq	00102$
;	lib/stm8s_clk.c: 310: CLK->SWCR |= CLK_SWCR_SWIEN;
	ldw	x, #0x50c5
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
	jra	00103$
00102$:
;	lib/stm8s_clk.c: 314: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
	ldw	x, #0x50c5
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
00103$:
;	lib/stm8s_clk.c: 318: CLK->SWR = (uint8_t)CLK_NewClock;
	ldw	x, #0x50c4
	ld	a, (0x06, sp)
	ld	(x), a
;	lib/stm8s_clk.c: 321: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
	ldw	x, #0xffff
00105$:
	ldw	y, #0x50c5
	ld	a, (y)
	srl	a
	jrnc	00107$
	tnzw	x
	jreq	00107$
;	lib/stm8s_clk.c: 323: DownCounter--;
	decw	x
	jra	00105$
00107$:
;	lib/stm8s_clk.c: 326: if(DownCounter != 0)
	tnzw	x
	jreq	00109$
;	lib/stm8s_clk.c: 328: Swif = SUCCESS;
	ld	a, #0x01
	ld	(0x02, sp), a
	jra	00123$
00109$:
;	lib/stm8s_clk.c: 332: Swif = ERROR;
	clr	(0x02, sp)
	jra	00123$
00122$:
;	lib/stm8s_clk.c: 338: if (ITState != DISABLE)
	tnz	(0x07, sp)
	jreq	00112$
;	lib/stm8s_clk.c: 340: CLK->SWCR |= CLK_SWCR_SWIEN;
	ldw	x, #0x50c5
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
	jra	00113$
00112$:
;	lib/stm8s_clk.c: 344: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
	ldw	x, #0x50c5
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
00113$:
;	lib/stm8s_clk.c: 348: CLK->SWR = (uint8_t)CLK_NewClock;
	ldw	x, #0x50c4
	ld	a, (0x06, sp)
	ld	(x), a
;	lib/stm8s_clk.c: 351: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
	ldw	x, #0xffff
00115$:
	ldw	y, #0x50c5
	ld	a, (y)
	bcp	a, #0x08
	jreq	00117$
	tnzw	x
	jreq	00117$
;	lib/stm8s_clk.c: 353: DownCounter--;
	decw	x
	jra	00115$
00117$:
;	lib/stm8s_clk.c: 356: if(DownCounter != 0)
	tnzw	x
	jreq	00119$
;	lib/stm8s_clk.c: 359: CLK->SWCR |= CLK_SWCR_SWEN;
	ldw	x, #0x50c5
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	lib/stm8s_clk.c: 360: Swif = SUCCESS;
	ld	a, #0x01
	ld	(0x02, sp), a
	jra	00123$
00119$:
;	lib/stm8s_clk.c: 364: Swif = ERROR;
	clr	(0x02, sp)
00123$:
;	lib/stm8s_clk.c: 367: if(Swif != ERROR)
	tnz	(0x02, sp)
	jreq	00136$
;	lib/stm8s_clk.c: 370: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
	tnz	(0x08, sp)
	jrne	00132$
	ld	a, (0x01, sp)
	cp	a, #0xe1
	jrne	00132$
;	lib/stm8s_clk.c: 372: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
	bres	0x50c0, #0
	jra	00136$
00132$:
;	lib/stm8s_clk.c: 374: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
	tnz	(0x08, sp)
	jrne	00128$
	ld	a, (0x01, sp)
	cp	a, #0xd2
	jrne	00128$
;	lib/stm8s_clk.c: 376: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
	ldw	x, #0x50c0
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
	jra	00136$
00128$:
;	lib/stm8s_clk.c: 378: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
	tnz	(0x08, sp)
	jrne	00136$
	ld	a, (0x01, sp)
	cp	a, #0xb4
	jrne	00136$
;	lib/stm8s_clk.c: 380: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
	bres	0x50c1, #0
00136$:
;	lib/stm8s_clk.c: 383: return(Swif);
	ld	a, (0x02, sp)
	popw	x
	ret
;	lib/stm8s_clk.c: 392: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
;	-----------------------------------------
;	 function CLK_HSIPrescalerConfig
;	-----------------------------------------
_CLK_HSIPrescalerConfig:
;	lib/stm8s_clk.c: 396: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
	ldw	x, #0x50c6
	ld	a, (x)
	and	a, #0xe7
	ld	(x), a
;	lib/stm8s_clk.c: 399: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
	ldw	x, #0x50c6
	ld	a, (x)
	or	a, (0x03, sp)
	ldw	x, #0x50c6
	ld	(x), a
	ret
;	lib/stm8s_clk.c: 411: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
;	-----------------------------------------
;	 function CLK_CCOConfig
;	-----------------------------------------
_CLK_CCOConfig:
;	lib/stm8s_clk.c: 415: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
	ldw	x, #0x50c9
	ld	a, (x)
	and	a, #0xe1
	ld	(x), a
;	lib/stm8s_clk.c: 418: CLK->CCOR |= (uint8_t)CLK_CCO;
	ldw	x, #0x50c9
	ld	a, (x)
	or	a, (0x03, sp)
	ldw	x, #0x50c9
	ld	(x), a
;	lib/stm8s_clk.c: 421: CLK->CCOR |= CLK_CCOR_CCOEN;
	bset	0x50c9, #0
	ret
;	lib/stm8s_clk.c: 432: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
;	-----------------------------------------
;	 function CLK_ITConfig
;	-----------------------------------------
_CLK_ITConfig:
	push	a
;	lib/stm8s_clk.c: 436: switch (CLK_IT)
	ld	a, (0x04, sp)
	cp	a, #0x0c
	jrne	00135$
	ld	a, #0x01
	ld	(0x01, sp), a
	jra	00136$
00135$:
	clr	(0x01, sp)
00136$:
	ld	a, (0x04, sp)
	cp	a, #0x1c
	jrne	00138$
	ld	a, #0x01
	.byte 0x21
00138$:
	clr	a
00139$:
;	lib/stm8s_clk.c: 434: if (NewState != DISABLE)
	tnz	(0x05, sp)
	jreq	00110$
;	lib/stm8s_clk.c: 436: switch (CLK_IT)
	tnz	(0x01, sp)
	jrne	00102$
	tnz	a
	jreq	00112$
;	lib/stm8s_clk.c: 439: CLK->SWCR |= CLK_SWCR_SWIEN;
	ldw	x, #0x50c5
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	lib/stm8s_clk.c: 440: break;
	jra	00112$
;	lib/stm8s_clk.c: 441: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
00102$:
;	lib/stm8s_clk.c: 442: CLK->CSSR |= CLK_CSSR_CSSDIE;
	ldw	x, #0x50c8
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	lib/stm8s_clk.c: 443: break;
	jra	00112$
;	lib/stm8s_clk.c: 446: }
00110$:
;	lib/stm8s_clk.c: 450: switch (CLK_IT)
	tnz	(0x01, sp)
	jrne	00106$
	tnz	a
	jreq	00112$
;	lib/stm8s_clk.c: 453: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
	ldw	x, #0x50c5
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
;	lib/stm8s_clk.c: 454: break;
	jra	00112$
;	lib/stm8s_clk.c: 455: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
00106$:
;	lib/stm8s_clk.c: 456: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
	ldw	x, #0x50c8
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
;	lib/stm8s_clk.c: 460: }
00112$:
	pop	a
	ret
;	lib/stm8s_clk.c: 469: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
;	-----------------------------------------
;	 function CLK_SYSCLKConfig
;	-----------------------------------------
_CLK_SYSCLKConfig:
	pushw	x
;	lib/stm8s_clk.c: 472: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
	tnz	(0x05, sp)
	jrmi	00102$
;	lib/stm8s_clk.c: 474: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
	ldw	x, #0x50c6
	ld	a, (x)
	and	a, #0xe7
	ld	(x), a
;	lib/stm8s_clk.c: 475: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
	ldw	x, #0x50c6
	ld	a, (x)
	ld	(0x01, sp), a
	ld	a, (0x05, sp)
	and	a, #0x18
	or	a, (0x01, sp)
	ldw	x, #0x50c6
	ld	(x), a
	jra	00104$
00102$:
;	lib/stm8s_clk.c: 479: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
	ldw	x, #0x50c6
	ld	a, (x)
	and	a, #0xf8
	ld	(x), a
;	lib/stm8s_clk.c: 480: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
	ldw	x, #0x50c6
	ld	a, (x)
	ld	(0x02, sp), a
	ld	a, (0x05, sp)
	and	a, #0x07
	or	a, (0x02, sp)
	ldw	x, #0x50c6
	ld	(x), a
00104$:
	popw	x
	ret
;	lib/stm8s_clk.c: 490: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
;	-----------------------------------------
;	 function CLK_SWIMConfig
;	-----------------------------------------
_CLK_SWIMConfig:
;	lib/stm8s_clk.c: 493: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
	tnz	(0x03, sp)
	jreq	00102$
;	lib/stm8s_clk.c: 496: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
	bset	0x50cd, #0
	ret
00102$:
;	lib/stm8s_clk.c: 501: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
	bres	0x50cd, #0
	ret
;	lib/stm8s_clk.c: 512: void CLK_ClockSecuritySystemEnable(void)
;	-----------------------------------------
;	 function CLK_ClockSecuritySystemEnable
;	-----------------------------------------
_CLK_ClockSecuritySystemEnable:
;	lib/stm8s_clk.c: 515: CLK->CSSR |= CLK_CSSR_CSSEN;
	bset	0x50c8, #0
	ret
;	lib/stm8s_clk.c: 524: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
;	-----------------------------------------
;	 function CLK_GetSYSCLKSource
;	-----------------------------------------
_CLK_GetSYSCLKSource:
;	lib/stm8s_clk.c: 526: return((CLK_Source_TypeDef)CLK->CMSR);
	ldw	x, #0x50c3
	ld	a, (x)
	ret
;	lib/stm8s_clk.c: 534: uint32_t CLK_GetClockFreq(void)
;	-----------------------------------------
;	 function CLK_GetClockFreq
;	-----------------------------------------
_CLK_GetClockFreq:
	sub	sp, #7
;	lib/stm8s_clk.c: 541: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
	ldw	x, #0x50c3
	ld	a, (x)
	ld	(0x05, sp), a
;	lib/stm8s_clk.c: 543: if (clocksource == CLK_SOURCE_HSI)
	ld	a, (0x05, sp)
	cp	a, #0xe1
	jrne	00105$
;	lib/stm8s_clk.c: 545: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
	ldw	x, #0x50c6
	ld	a, (x)
	and	a, #0x18
;	lib/stm8s_clk.c: 546: tmp = (uint8_t)(tmp >> 3);
	srl	a
	srl	a
	srl	a
;	lib/stm8s_clk.c: 547: presc = HSIDivFactor[tmp];
	ldw	x, #_HSIDivFactor+0
	ldw	(0x06, sp), x
	clrw	x
	ld	xl, a
	addw	x, (0x06, sp)
	ld	a, (x)
;	lib/stm8s_clk.c: 548: clockfrequency = HSI_VALUE / presc;
	clrw	x
	ld	xl, a
	clrw	y
	pushw	x
	pushw	y
	push	#0x00
	push	#0x24
	push	#0xf4
	push	#0x00
	call	__divulong
	addw	sp, #8
	ldw	(0x03, sp), x
	jra	00106$
00105$:
;	lib/stm8s_clk.c: 550: else if ( clocksource == CLK_SOURCE_LSI)
	ld	a, (0x05, sp)
	cp	a, #0xd2
	jrne	00102$
;	lib/stm8s_clk.c: 552: clockfrequency = LSI_VALUE;
	ldw	x, #0xf400
	ldw	(0x03, sp), x
	ldw	y, #0x0001
	jra	00106$
00102$:
;	lib/stm8s_clk.c: 556: clockfrequency = HSE_VALUE;
	ldw	x, #0x2400
	ldw	(0x03, sp), x
	ldw	y, #0x00f4
00106$:
;	lib/stm8s_clk.c: 559: return((uint32_t)clockfrequency);
	ldw	x, (0x03, sp)
	addw	sp, #7
	ret
;	lib/stm8s_clk.c: 569: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
;	-----------------------------------------
;	 function CLK_AdjustHSICalibrationValue
;	-----------------------------------------
_CLK_AdjustHSICalibrationValue:
;	lib/stm8s_clk.c: 573: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
	ldw	x, #0x50cc
	ld	a, (x)
	and	a, #0xf8
	or	a, (0x03, sp)
	ldw	x, #0x50cc
	ld	(x), a
	ret
;	lib/stm8s_clk.c: 585: void CLK_SYSCLKEmergencyClear(void)
;	-----------------------------------------
;	 function CLK_SYSCLKEmergencyClear
;	-----------------------------------------
_CLK_SYSCLKEmergencyClear:
;	lib/stm8s_clk.c: 587: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
	bres	0x50c5, #0
	ret
;	lib/stm8s_clk.c: 597: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
;	-----------------------------------------
;	 function CLK_GetFlagStatus
;	-----------------------------------------
_CLK_GetFlagStatus:
	push	a
;	lib/stm8s_clk.c: 604: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
	clr	a
	ld	xl, a
	ld	a, (0x04, sp)
	ld	xh, a
;	lib/stm8s_clk.c: 607: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
	cpw	x, #0x0100
	jrne	00111$
;	lib/stm8s_clk.c: 609: tmpreg = CLK->ICKR;
	ldw	x, #0x50c0
	ld	a, (x)
	jra	00112$
00111$:
;	lib/stm8s_clk.c: 611: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
	cpw	x, #0x0200
	jrne	00108$
;	lib/stm8s_clk.c: 613: tmpreg = CLK->ECKR;
	ldw	x, #0x50c1
	ld	a, (x)
	jra	00112$
00108$:
;	lib/stm8s_clk.c: 615: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
	cpw	x, #0x0300
	jrne	00105$
;	lib/stm8s_clk.c: 617: tmpreg = CLK->SWCR;
	ldw	x, #0x50c5
	ld	a, (x)
	jra	00112$
00105$:
;	lib/stm8s_clk.c: 619: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
	cpw	x, #0x0400
	jrne	00102$
;	lib/stm8s_clk.c: 621: tmpreg = CLK->CSSR;
	ldw	x, #0x50c8
	ld	a, (x)
	jra	00112$
00102$:
;	lib/stm8s_clk.c: 625: tmpreg = CLK->CCOR;
	ldw	x, #0x50c9
	ld	a, (x)
00112$:
;	lib/stm8s_clk.c: 628: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
	push	a
	ld	a, (0x06, sp)
	ld	(0x02, sp), a
	pop	a
	and	a, (0x01, sp)
	tnz	a
	jreq	00114$
;	lib/stm8s_clk.c: 630: bitstatus = SET;
	ld	a, #0x01
;	lib/stm8s_clk.c: 634: bitstatus = RESET;
	.byte 0x21
00114$:
	clr	a
00115$:
;	lib/stm8s_clk.c: 638: return((FlagStatus)bitstatus);
	addw	sp, #1
	ret
;	lib/stm8s_clk.c: 647: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
;	-----------------------------------------
;	 function CLK_GetITStatus
;	-----------------------------------------
_CLK_GetITStatus:
;	lib/stm8s_clk.c: 651: if (CLK_IT == CLK_IT_SWIF)
	ld	a, (0x03, sp)
	cp	a, #0x1c
	jrne	00108$
;	lib/stm8s_clk.c: 654: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
	ldw	x, #0x50c5
	ld	a, (x)
	and	a, (0x03, sp)
	cp	a, #0x0c
	jrne	00102$
;	lib/stm8s_clk.c: 656: bitstatus = SET;
	ld	a, #0x01
	ret
00102$:
;	lib/stm8s_clk.c: 660: bitstatus = RESET;
	clr	a
	ret
00108$:
;	lib/stm8s_clk.c: 666: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
	ldw	x, #0x50c8
	ld	a, (x)
	and	a, (0x03, sp)
	cp	a, #0x0c
	jrne	00105$
;	lib/stm8s_clk.c: 668: bitstatus = SET;
	ld	a, #0x01
	ret
00105$:
;	lib/stm8s_clk.c: 672: bitstatus = RESET;
	clr	a
;	lib/stm8s_clk.c: 677: return bitstatus;
	ret
;	lib/stm8s_clk.c: 686: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
;	-----------------------------------------
;	 function CLK_ClearITPendingBit
;	-----------------------------------------
_CLK_ClearITPendingBit:
;	lib/stm8s_clk.c: 689: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
	ld	a, (0x03, sp)
	cp	a, #0x0c
	jrne	00102$
;	lib/stm8s_clk.c: 692: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
	ldw	x, #0x50c8
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
	ret
00102$:
;	lib/stm8s_clk.c: 697: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
	ldw	x, #0x50c5
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
	ret
	.area CODE
_HSIDivFactor:
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
_CLKPrescTable:
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x28	; 40
	.area INITIALIZER
	.area CABS (ABS)
