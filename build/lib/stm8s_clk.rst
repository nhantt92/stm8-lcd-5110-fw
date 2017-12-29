                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_clk
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _CLKPrescTable
                                     12 	.globl _HSIDivFactor
                                     13 	.globl _CLK_DeInit
                                     14 	.globl _CLK_FastHaltWakeUpCmd
                                     15 	.globl _CLK_HSECmd
                                     16 	.globl _CLK_HSICmd
                                     17 	.globl _CLK_LSICmd
                                     18 	.globl _CLK_CCOCmd
                                     19 	.globl _CLK_ClockSwitchCmd
                                     20 	.globl _CLK_SlowActiveHaltWakeUpCmd
                                     21 	.globl _CLK_PeripheralClockConfig
                                     22 	.globl _CLK_ClockSwitchConfig
                                     23 	.globl _CLK_HSIPrescalerConfig
                                     24 	.globl _CLK_CCOConfig
                                     25 	.globl _CLK_ITConfig
                                     26 	.globl _CLK_SYSCLKConfig
                                     27 	.globl _CLK_SWIMConfig
                                     28 	.globl _CLK_ClockSecuritySystemEnable
                                     29 	.globl _CLK_GetSYSCLKSource
                                     30 	.globl _CLK_GetClockFreq
                                     31 	.globl _CLK_AdjustHSICalibrationValue
                                     32 	.globl _CLK_SYSCLKEmergencyClear
                                     33 	.globl _CLK_GetFlagStatus
                                     34 	.globl _CLK_GetITStatus
                                     35 	.globl _CLK_ClearITPendingBit
                                     36 ;--------------------------------------------------------
                                     37 ; ram data
                                     38 ;--------------------------------------------------------
                                     39 	.area DATA
                                     40 ;--------------------------------------------------------
                                     41 ; ram data
                                     42 ;--------------------------------------------------------
                                     43 	.area INITIALIZED
                                     44 ;--------------------------------------------------------
                                     45 ; absolute external ram data
                                     46 ;--------------------------------------------------------
                                     47 	.area DABS (ABS)
                                     48 ;--------------------------------------------------------
                                     49 ; global & static initialisations
                                     50 ;--------------------------------------------------------
                                     51 	.area HOME
                                     52 	.area GSINIT
                                     53 	.area GSFINAL
                                     54 	.area GSINIT
                                     55 ;--------------------------------------------------------
                                     56 ; Home
                                     57 ;--------------------------------------------------------
                                     58 	.area HOME
                                     59 	.area HOME
                                     60 ;--------------------------------------------------------
                                     61 ; code
                                     62 ;--------------------------------------------------------
                                     63 	.area CODE
                                     64 ;	lib/stm8s_clk.c: 72: void CLK_DeInit(void)
                                     65 ;	-----------------------------------------
                                     66 ;	 function CLK_DeInit
                                     67 ;	-----------------------------------------
      009A80                         68 _CLK_DeInit:
                                     69 ;	lib/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      009A80 35 01 50 C0      [ 1]   70 	mov	0x50c0+0, #0x01
                                     71 ;	lib/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      009A84 35 00 50 C1      [ 1]   72 	mov	0x50c1+0, #0x00
                                     73 ;	lib/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      009A88 35 E1 50 C4      [ 1]   74 	mov	0x50c4+0, #0xe1
                                     75 ;	lib/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      009A8C 35 00 50 C5      [ 1]   76 	mov	0x50c5+0, #0x00
                                     77 ;	lib/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      009A90 35 18 50 C6      [ 1]   78 	mov	0x50c6+0, #0x18
                                     79 ;	lib/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      009A94 35 FF 50 C7      [ 1]   80 	mov	0x50c7+0, #0xff
                                     81 ;	lib/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      009A98 35 FF 50 CA      [ 1]   82 	mov	0x50ca+0, #0xff
                                     83 ;	lib/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      009A9C 35 00 50 C8      [ 1]   84 	mov	0x50c8+0, #0x00
                                     85 ;	lib/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      009AA0 35 00 50 C9      [ 1]   86 	mov	0x50c9+0, #0x00
                                     87 ;	lib/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      009AA4                         88 00101$:
      009AA4 AE 50 C9         [ 2]   89 	ldw	x, #0x50c9
      009AA7 F6               [ 1]   90 	ld	a, (x)
      009AA8 44               [ 1]   91 	srl	a
      009AA9 25 F9            [ 1]   92 	jrc	00101$
                                     93 ;	lib/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      009AAB 35 00 50 C9      [ 1]   94 	mov	0x50c9+0, #0x00
                                     95 ;	lib/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      009AAF 35 00 50 CC      [ 1]   96 	mov	0x50cc+0, #0x00
                                     97 ;	lib/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      009AB3 35 00 50 CD      [ 1]   98 	mov	0x50cd+0, #0x00
      009AB7 81               [ 4]   99 	ret
                                    100 ;	lib/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function CLK_FastHaltWakeUpCmd
                                    103 ;	-----------------------------------------
      009AB8                        104 _CLK_FastHaltWakeUpCmd:
                                    105 ;	lib/stm8s_clk.c: 102: if (NewState != DISABLE)
      009AB8 0D 03            [ 1]  106 	tnz	(0x03, sp)
      009ABA 27 08            [ 1]  107 	jreq	00102$
                                    108 ;	lib/stm8s_clk.c: 105: CLK->ICKR |= CLK_ICKR_FHWU;
      009ABC AE 50 C0         [ 2]  109 	ldw	x, #0x50c0
      009ABF F6               [ 1]  110 	ld	a, (x)
      009AC0 AA 04            [ 1]  111 	or	a, #0x04
      009AC2 F7               [ 1]  112 	ld	(x), a
      009AC3 81               [ 4]  113 	ret
      009AC4                        114 00102$:
                                    115 ;	lib/stm8s_clk.c: 110: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      009AC4 AE 50 C0         [ 2]  116 	ldw	x, #0x50c0
      009AC7 F6               [ 1]  117 	ld	a, (x)
      009AC8 A4 FB            [ 1]  118 	and	a, #0xfb
      009ACA F7               [ 1]  119 	ld	(x), a
      009ACB 81               [ 4]  120 	ret
                                    121 ;	lib/stm8s_clk.c: 119: void CLK_HSECmd(FunctionalState NewState)
                                    122 ;	-----------------------------------------
                                    123 ;	 function CLK_HSECmd
                                    124 ;	-----------------------------------------
      009ACC                        125 _CLK_HSECmd:
                                    126 ;	lib/stm8s_clk.c: 122: if (NewState != DISABLE)
      009ACC 0D 03            [ 1]  127 	tnz	(0x03, sp)
      009ACE 27 05            [ 1]  128 	jreq	00102$
                                    129 ;	lib/stm8s_clk.c: 125: CLK->ECKR |= CLK_ECKR_HSEEN;
      009AD0 72 10 50 C1      [ 1]  130 	bset	0x50c1, #0
      009AD4 81               [ 4]  131 	ret
      009AD5                        132 00102$:
                                    133 ;	lib/stm8s_clk.c: 130: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      009AD5 72 11 50 C1      [ 1]  134 	bres	0x50c1, #0
      009AD9 81               [ 4]  135 	ret
                                    136 ;	lib/stm8s_clk.c: 139: void CLK_HSICmd(FunctionalState NewState)
                                    137 ;	-----------------------------------------
                                    138 ;	 function CLK_HSICmd
                                    139 ;	-----------------------------------------
      009ADA                        140 _CLK_HSICmd:
                                    141 ;	lib/stm8s_clk.c: 142: if (NewState != DISABLE)
      009ADA 0D 03            [ 1]  142 	tnz	(0x03, sp)
      009ADC 27 05            [ 1]  143 	jreq	00102$
                                    144 ;	lib/stm8s_clk.c: 145: CLK->ICKR |= CLK_ICKR_HSIEN;
      009ADE 72 10 50 C0      [ 1]  145 	bset	0x50c0, #0
      009AE2 81               [ 4]  146 	ret
      009AE3                        147 00102$:
                                    148 ;	lib/stm8s_clk.c: 150: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      009AE3 72 11 50 C0      [ 1]  149 	bres	0x50c0, #0
      009AE7 81               [ 4]  150 	ret
                                    151 ;	lib/stm8s_clk.c: 160: void CLK_LSICmd(FunctionalState NewState)
                                    152 ;	-----------------------------------------
                                    153 ;	 function CLK_LSICmd
                                    154 ;	-----------------------------------------
      009AE8                        155 _CLK_LSICmd:
                                    156 ;	lib/stm8s_clk.c: 163: if (NewState != DISABLE)
      009AE8 0D 03            [ 1]  157 	tnz	(0x03, sp)
      009AEA 27 08            [ 1]  158 	jreq	00102$
                                    159 ;	lib/stm8s_clk.c: 166: CLK->ICKR |= CLK_ICKR_LSIEN;
      009AEC AE 50 C0         [ 2]  160 	ldw	x, #0x50c0
      009AEF F6               [ 1]  161 	ld	a, (x)
      009AF0 AA 08            [ 1]  162 	or	a, #0x08
      009AF2 F7               [ 1]  163 	ld	(x), a
      009AF3 81               [ 4]  164 	ret
      009AF4                        165 00102$:
                                    166 ;	lib/stm8s_clk.c: 171: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      009AF4 AE 50 C0         [ 2]  167 	ldw	x, #0x50c0
      009AF7 F6               [ 1]  168 	ld	a, (x)
      009AF8 A4 F7            [ 1]  169 	and	a, #0xf7
      009AFA F7               [ 1]  170 	ld	(x), a
      009AFB 81               [ 4]  171 	ret
                                    172 ;	lib/stm8s_clk.c: 181: void CLK_CCOCmd(FunctionalState NewState)
                                    173 ;	-----------------------------------------
                                    174 ;	 function CLK_CCOCmd
                                    175 ;	-----------------------------------------
      009AFC                        176 _CLK_CCOCmd:
                                    177 ;	lib/stm8s_clk.c: 184: if (NewState != DISABLE)
      009AFC 0D 03            [ 1]  178 	tnz	(0x03, sp)
      009AFE 27 05            [ 1]  179 	jreq	00102$
                                    180 ;	lib/stm8s_clk.c: 187: CLK->CCOR |= CLK_CCOR_CCOEN;
      009B00 72 10 50 C9      [ 1]  181 	bset	0x50c9, #0
      009B04 81               [ 4]  182 	ret
      009B05                        183 00102$:
                                    184 ;	lib/stm8s_clk.c: 192: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      009B05 72 11 50 C9      [ 1]  185 	bres	0x50c9, #0
      009B09 81               [ 4]  186 	ret
                                    187 ;	lib/stm8s_clk.c: 203: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    188 ;	-----------------------------------------
                                    189 ;	 function CLK_ClockSwitchCmd
                                    190 ;	-----------------------------------------
      009B0A                        191 _CLK_ClockSwitchCmd:
                                    192 ;	lib/stm8s_clk.c: 206: if (NewState != DISABLE )
      009B0A 0D 03            [ 1]  193 	tnz	(0x03, sp)
      009B0C 27 08            [ 1]  194 	jreq	00102$
                                    195 ;	lib/stm8s_clk.c: 209: CLK->SWCR |= CLK_SWCR_SWEN;
      009B0E AE 50 C5         [ 2]  196 	ldw	x, #0x50c5
      009B11 F6               [ 1]  197 	ld	a, (x)
      009B12 AA 02            [ 1]  198 	or	a, #0x02
      009B14 F7               [ 1]  199 	ld	(x), a
      009B15 81               [ 4]  200 	ret
      009B16                        201 00102$:
                                    202 ;	lib/stm8s_clk.c: 214: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      009B16 AE 50 C5         [ 2]  203 	ldw	x, #0x50c5
      009B19 F6               [ 1]  204 	ld	a, (x)
      009B1A A4 FD            [ 1]  205 	and	a, #0xfd
      009B1C F7               [ 1]  206 	ld	(x), a
      009B1D 81               [ 4]  207 	ret
                                    208 ;	lib/stm8s_clk.c: 226: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    209 ;	-----------------------------------------
                                    210 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    211 ;	-----------------------------------------
      009B1E                        212 _CLK_SlowActiveHaltWakeUpCmd:
                                    213 ;	lib/stm8s_clk.c: 229: if (NewState != DISABLE)
      009B1E 0D 03            [ 1]  214 	tnz	(0x03, sp)
      009B20 27 08            [ 1]  215 	jreq	00102$
                                    216 ;	lib/stm8s_clk.c: 232: CLK->ICKR |= CLK_ICKR_SWUAH;
      009B22 AE 50 C0         [ 2]  217 	ldw	x, #0x50c0
      009B25 F6               [ 1]  218 	ld	a, (x)
      009B26 AA 20            [ 1]  219 	or	a, #0x20
      009B28 F7               [ 1]  220 	ld	(x), a
      009B29 81               [ 4]  221 	ret
      009B2A                        222 00102$:
                                    223 ;	lib/stm8s_clk.c: 237: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      009B2A AE 50 C0         [ 2]  224 	ldw	x, #0x50c0
      009B2D F6               [ 1]  225 	ld	a, (x)
      009B2E A4 DF            [ 1]  226 	and	a, #0xdf
      009B30 F7               [ 1]  227 	ld	(x), a
      009B31 81               [ 4]  228 	ret
                                    229 ;	lib/stm8s_clk.c: 249: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    230 ;	-----------------------------------------
                                    231 ;	 function CLK_PeripheralClockConfig
                                    232 ;	-----------------------------------------
      009B32                        233 _CLK_PeripheralClockConfig:
      009B32 89               [ 2]  234 	pushw	x
                                    235 ;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009B33 7B 05            [ 1]  236 	ld	a, (0x05, sp)
      009B35 A4 0F            [ 1]  237 	and	a, #0x0f
      009B37 88               [ 1]  238 	push	a
      009B38 A6 01            [ 1]  239 	ld	a, #0x01
      009B3A 6B 02            [ 1]  240 	ld	(0x02, sp), a
      009B3C 84               [ 1]  241 	pop	a
      009B3D 4D               [ 1]  242 	tnz	a
      009B3E 27 05            [ 1]  243 	jreq	00125$
      009B40                        244 00124$:
      009B40 08 01            [ 1]  245 	sll	(0x01, sp)
      009B42 4A               [ 1]  246 	dec	a
      009B43 26 FB            [ 1]  247 	jrne	00124$
      009B45                        248 00125$:
                                    249 ;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      009B45 7B 01            [ 1]  250 	ld	a, (0x01, sp)
      009B47 43               [ 1]  251 	cpl	a
      009B48 6B 02            [ 1]  252 	ld	(0x02, sp), a
                                    253 ;	lib/stm8s_clk.c: 252: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      009B4A 7B 05            [ 1]  254 	ld	a, (0x05, sp)
      009B4C A5 10            [ 1]  255 	bcp	a, #0x10
      009B4E 26 1C            [ 1]  256 	jrne	00108$
                                    257 ;	lib/stm8s_clk.c: 254: if (NewState != DISABLE)
      009B50 0D 06            [ 1]  258 	tnz	(0x06, sp)
      009B52 27 0C            [ 1]  259 	jreq	00102$
                                    260 ;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009B54 AE 50 C7         [ 2]  261 	ldw	x, #0x50c7
      009B57 F6               [ 1]  262 	ld	a, (x)
      009B58 1A 01            [ 1]  263 	or	a, (0x01, sp)
      009B5A AE 50 C7         [ 2]  264 	ldw	x, #0x50c7
      009B5D F7               [ 1]  265 	ld	(x), a
      009B5E 20 26            [ 2]  266 	jra	00110$
      009B60                        267 00102$:
                                    268 ;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      009B60 AE 50 C7         [ 2]  269 	ldw	x, #0x50c7
      009B63 F6               [ 1]  270 	ld	a, (x)
      009B64 14 02            [ 1]  271 	and	a, (0x02, sp)
      009B66 AE 50 C7         [ 2]  272 	ldw	x, #0x50c7
      009B69 F7               [ 1]  273 	ld	(x), a
      009B6A 20 1A            [ 2]  274 	jra	00110$
      009B6C                        275 00108$:
                                    276 ;	lib/stm8s_clk.c: 267: if (NewState != DISABLE)
      009B6C 0D 06            [ 1]  277 	tnz	(0x06, sp)
      009B6E 27 0C            [ 1]  278 	jreq	00105$
                                    279 ;	lib/stm8s_clk.c: 270: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009B70 AE 50 CA         [ 2]  280 	ldw	x, #0x50ca
      009B73 F6               [ 1]  281 	ld	a, (x)
      009B74 1A 01            [ 1]  282 	or	a, (0x01, sp)
      009B76 AE 50 CA         [ 2]  283 	ldw	x, #0x50ca
      009B79 F7               [ 1]  284 	ld	(x), a
      009B7A 20 0A            [ 2]  285 	jra	00110$
      009B7C                        286 00105$:
                                    287 ;	lib/stm8s_clk.c: 275: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      009B7C AE 50 CA         [ 2]  288 	ldw	x, #0x50ca
      009B7F F6               [ 1]  289 	ld	a, (x)
      009B80 14 02            [ 1]  290 	and	a, (0x02, sp)
      009B82 AE 50 CA         [ 2]  291 	ldw	x, #0x50ca
      009B85 F7               [ 1]  292 	ld	(x), a
      009B86                        293 00110$:
      009B86 85               [ 2]  294 	popw	x
      009B87 81               [ 4]  295 	ret
                                    296 ;	lib/stm8s_clk.c: 292: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    297 ;	-----------------------------------------
                                    298 ;	 function CLK_ClockSwitchConfig
                                    299 ;	-----------------------------------------
      009B88                        300 _CLK_ClockSwitchConfig:
      009B88 89               [ 2]  301 	pushw	x
                                    302 ;	lib/stm8s_clk.c: 299: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      009B89 AE 50 C3         [ 2]  303 	ldw	x, #0x50c3
      009B8C F6               [ 1]  304 	ld	a, (x)
      009B8D 6B 01            [ 1]  305 	ld	(0x01, sp), a
                                    306 ;	lib/stm8s_clk.c: 302: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      009B8F 7B 05            [ 1]  307 	ld	a, (0x05, sp)
      009B91 A1 01            [ 1]  308 	cp	a, #0x01
      009B93 26 40            [ 1]  309 	jrne	00122$
                                    310 ;	lib/stm8s_clk.c: 305: CLK->SWCR |= CLK_SWCR_SWEN;
      009B95 AE 50 C5         [ 2]  311 	ldw	x, #0x50c5
      009B98 F6               [ 1]  312 	ld	a, (x)
      009B99 AA 02            [ 1]  313 	or	a, #0x02
      009B9B F7               [ 1]  314 	ld	(x), a
                                    315 ;	lib/stm8s_clk.c: 308: if (ITState != DISABLE)
      009B9C 0D 07            [ 1]  316 	tnz	(0x07, sp)
      009B9E 27 09            [ 1]  317 	jreq	00102$
                                    318 ;	lib/stm8s_clk.c: 310: CLK->SWCR |= CLK_SWCR_SWIEN;
      009BA0 AE 50 C5         [ 2]  319 	ldw	x, #0x50c5
      009BA3 F6               [ 1]  320 	ld	a, (x)
      009BA4 AA 04            [ 1]  321 	or	a, #0x04
      009BA6 F7               [ 1]  322 	ld	(x), a
      009BA7 20 07            [ 2]  323 	jra	00103$
      009BA9                        324 00102$:
                                    325 ;	lib/stm8s_clk.c: 314: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      009BA9 AE 50 C5         [ 2]  326 	ldw	x, #0x50c5
      009BAC F6               [ 1]  327 	ld	a, (x)
      009BAD A4 FB            [ 1]  328 	and	a, #0xfb
      009BAF F7               [ 1]  329 	ld	(x), a
      009BB0                        330 00103$:
                                    331 ;	lib/stm8s_clk.c: 318: CLK->SWR = (uint8_t)CLK_NewClock;
      009BB0 AE 50 C4         [ 2]  332 	ldw	x, #0x50c4
      009BB3 7B 06            [ 1]  333 	ld	a, (0x06, sp)
      009BB5 F7               [ 1]  334 	ld	(x), a
                                    335 ;	lib/stm8s_clk.c: 321: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      009BB6 AE FF FF         [ 2]  336 	ldw	x, #0xffff
      009BB9                        337 00105$:
      009BB9 90 AE 50 C5      [ 2]  338 	ldw	y, #0x50c5
      009BBD 90 F6            [ 1]  339 	ld	a, (y)
      009BBF 44               [ 1]  340 	srl	a
      009BC0 24 06            [ 1]  341 	jrnc	00107$
      009BC2 5D               [ 2]  342 	tnzw	x
      009BC3 27 03            [ 1]  343 	jreq	00107$
                                    344 ;	lib/stm8s_clk.c: 323: DownCounter--;
      009BC5 5A               [ 2]  345 	decw	x
      009BC6 20 F1            [ 2]  346 	jra	00105$
      009BC8                        347 00107$:
                                    348 ;	lib/stm8s_clk.c: 326: if(DownCounter != 0)
      009BC8 5D               [ 2]  349 	tnzw	x
      009BC9 27 06            [ 1]  350 	jreq	00109$
                                    351 ;	lib/stm8s_clk.c: 328: Swif = SUCCESS;
      009BCB A6 01            [ 1]  352 	ld	a, #0x01
      009BCD 6B 02            [ 1]  353 	ld	(0x02, sp), a
      009BCF 20 43            [ 2]  354 	jra	00123$
      009BD1                        355 00109$:
                                    356 ;	lib/stm8s_clk.c: 332: Swif = ERROR;
      009BD1 0F 02            [ 1]  357 	clr	(0x02, sp)
      009BD3 20 3F            [ 2]  358 	jra	00123$
      009BD5                        359 00122$:
                                    360 ;	lib/stm8s_clk.c: 338: if (ITState != DISABLE)
      009BD5 0D 07            [ 1]  361 	tnz	(0x07, sp)
      009BD7 27 09            [ 1]  362 	jreq	00112$
                                    363 ;	lib/stm8s_clk.c: 340: CLK->SWCR |= CLK_SWCR_SWIEN;
      009BD9 AE 50 C5         [ 2]  364 	ldw	x, #0x50c5
      009BDC F6               [ 1]  365 	ld	a, (x)
      009BDD AA 04            [ 1]  366 	or	a, #0x04
      009BDF F7               [ 1]  367 	ld	(x), a
      009BE0 20 07            [ 2]  368 	jra	00113$
      009BE2                        369 00112$:
                                    370 ;	lib/stm8s_clk.c: 344: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      009BE2 AE 50 C5         [ 2]  371 	ldw	x, #0x50c5
      009BE5 F6               [ 1]  372 	ld	a, (x)
      009BE6 A4 FB            [ 1]  373 	and	a, #0xfb
      009BE8 F7               [ 1]  374 	ld	(x), a
      009BE9                        375 00113$:
                                    376 ;	lib/stm8s_clk.c: 348: CLK->SWR = (uint8_t)CLK_NewClock;
      009BE9 AE 50 C4         [ 2]  377 	ldw	x, #0x50c4
      009BEC 7B 06            [ 1]  378 	ld	a, (0x06, sp)
      009BEE F7               [ 1]  379 	ld	(x), a
                                    380 ;	lib/stm8s_clk.c: 351: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      009BEF AE FF FF         [ 2]  381 	ldw	x, #0xffff
      009BF2                        382 00115$:
      009BF2 90 AE 50 C5      [ 2]  383 	ldw	y, #0x50c5
      009BF6 90 F6            [ 1]  384 	ld	a, (y)
      009BF8 A5 08            [ 1]  385 	bcp	a, #0x08
      009BFA 27 06            [ 1]  386 	jreq	00117$
      009BFC 5D               [ 2]  387 	tnzw	x
      009BFD 27 03            [ 1]  388 	jreq	00117$
                                    389 ;	lib/stm8s_clk.c: 353: DownCounter--;
      009BFF 5A               [ 2]  390 	decw	x
      009C00 20 F0            [ 2]  391 	jra	00115$
      009C02                        392 00117$:
                                    393 ;	lib/stm8s_clk.c: 356: if(DownCounter != 0)
      009C02 5D               [ 2]  394 	tnzw	x
      009C03 27 0D            [ 1]  395 	jreq	00119$
                                    396 ;	lib/stm8s_clk.c: 359: CLK->SWCR |= CLK_SWCR_SWEN;
      009C05 AE 50 C5         [ 2]  397 	ldw	x, #0x50c5
      009C08 F6               [ 1]  398 	ld	a, (x)
      009C09 AA 02            [ 1]  399 	or	a, #0x02
      009C0B F7               [ 1]  400 	ld	(x), a
                                    401 ;	lib/stm8s_clk.c: 360: Swif = SUCCESS;
      009C0C A6 01            [ 1]  402 	ld	a, #0x01
      009C0E 6B 02            [ 1]  403 	ld	(0x02, sp), a
      009C10 20 02            [ 2]  404 	jra	00123$
      009C12                        405 00119$:
                                    406 ;	lib/stm8s_clk.c: 364: Swif = ERROR;
      009C12 0F 02            [ 1]  407 	clr	(0x02, sp)
      009C14                        408 00123$:
                                    409 ;	lib/stm8s_clk.c: 367: if(Swif != ERROR)
      009C14 0D 02            [ 1]  410 	tnz	(0x02, sp)
      009C16 27 31            [ 1]  411 	jreq	00136$
                                    412 ;	lib/stm8s_clk.c: 370: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      009C18 0D 08            [ 1]  413 	tnz	(0x08, sp)
      009C1A 26 0C            [ 1]  414 	jrne	00132$
      009C1C 7B 01            [ 1]  415 	ld	a, (0x01, sp)
      009C1E A1 E1            [ 1]  416 	cp	a, #0xe1
      009C20 26 06            [ 1]  417 	jrne	00132$
                                    418 ;	lib/stm8s_clk.c: 372: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      009C22 72 11 50 C0      [ 1]  419 	bres	0x50c0, #0
      009C26 20 21            [ 2]  420 	jra	00136$
      009C28                        421 00132$:
                                    422 ;	lib/stm8s_clk.c: 374: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      009C28 0D 08            [ 1]  423 	tnz	(0x08, sp)
      009C2A 26 0F            [ 1]  424 	jrne	00128$
      009C2C 7B 01            [ 1]  425 	ld	a, (0x01, sp)
      009C2E A1 D2            [ 1]  426 	cp	a, #0xd2
      009C30 26 09            [ 1]  427 	jrne	00128$
                                    428 ;	lib/stm8s_clk.c: 376: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      009C32 AE 50 C0         [ 2]  429 	ldw	x, #0x50c0
      009C35 F6               [ 1]  430 	ld	a, (x)
      009C36 A4 F7            [ 1]  431 	and	a, #0xf7
      009C38 F7               [ 1]  432 	ld	(x), a
      009C39 20 0E            [ 2]  433 	jra	00136$
      009C3B                        434 00128$:
                                    435 ;	lib/stm8s_clk.c: 378: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      009C3B 0D 08            [ 1]  436 	tnz	(0x08, sp)
      009C3D 26 0A            [ 1]  437 	jrne	00136$
      009C3F 7B 01            [ 1]  438 	ld	a, (0x01, sp)
      009C41 A1 B4            [ 1]  439 	cp	a, #0xb4
      009C43 26 04            [ 1]  440 	jrne	00136$
                                    441 ;	lib/stm8s_clk.c: 380: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      009C45 72 11 50 C1      [ 1]  442 	bres	0x50c1, #0
      009C49                        443 00136$:
                                    444 ;	lib/stm8s_clk.c: 383: return(Swif);
      009C49 7B 02            [ 1]  445 	ld	a, (0x02, sp)
      009C4B 85               [ 2]  446 	popw	x
      009C4C 81               [ 4]  447 	ret
                                    448 ;	lib/stm8s_clk.c: 392: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    449 ;	-----------------------------------------
                                    450 ;	 function CLK_HSIPrescalerConfig
                                    451 ;	-----------------------------------------
      009C4D                        452 _CLK_HSIPrescalerConfig:
                                    453 ;	lib/stm8s_clk.c: 396: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      009C4D AE 50 C6         [ 2]  454 	ldw	x, #0x50c6
      009C50 F6               [ 1]  455 	ld	a, (x)
      009C51 A4 E7            [ 1]  456 	and	a, #0xe7
      009C53 F7               [ 1]  457 	ld	(x), a
                                    458 ;	lib/stm8s_clk.c: 399: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      009C54 AE 50 C6         [ 2]  459 	ldw	x, #0x50c6
      009C57 F6               [ 1]  460 	ld	a, (x)
      009C58 1A 03            [ 1]  461 	or	a, (0x03, sp)
      009C5A AE 50 C6         [ 2]  462 	ldw	x, #0x50c6
      009C5D F7               [ 1]  463 	ld	(x), a
      009C5E 81               [ 4]  464 	ret
                                    465 ;	lib/stm8s_clk.c: 411: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    466 ;	-----------------------------------------
                                    467 ;	 function CLK_CCOConfig
                                    468 ;	-----------------------------------------
      009C5F                        469 _CLK_CCOConfig:
                                    470 ;	lib/stm8s_clk.c: 415: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      009C5F AE 50 C9         [ 2]  471 	ldw	x, #0x50c9
      009C62 F6               [ 1]  472 	ld	a, (x)
      009C63 A4 E1            [ 1]  473 	and	a, #0xe1
      009C65 F7               [ 1]  474 	ld	(x), a
                                    475 ;	lib/stm8s_clk.c: 418: CLK->CCOR |= (uint8_t)CLK_CCO;
      009C66 AE 50 C9         [ 2]  476 	ldw	x, #0x50c9
      009C69 F6               [ 1]  477 	ld	a, (x)
      009C6A 1A 03            [ 1]  478 	or	a, (0x03, sp)
      009C6C AE 50 C9         [ 2]  479 	ldw	x, #0x50c9
      009C6F F7               [ 1]  480 	ld	(x), a
                                    481 ;	lib/stm8s_clk.c: 421: CLK->CCOR |= CLK_CCOR_CCOEN;
      009C70 72 10 50 C9      [ 1]  482 	bset	0x50c9, #0
      009C74 81               [ 4]  483 	ret
                                    484 ;	lib/stm8s_clk.c: 432: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    485 ;	-----------------------------------------
                                    486 ;	 function CLK_ITConfig
                                    487 ;	-----------------------------------------
      009C75                        488 _CLK_ITConfig:
      009C75 88               [ 1]  489 	push	a
                                    490 ;	lib/stm8s_clk.c: 436: switch (CLK_IT)
      009C76 7B 04            [ 1]  491 	ld	a, (0x04, sp)
      009C78 A1 0C            [ 1]  492 	cp	a, #0x0c
      009C7A 26 06            [ 1]  493 	jrne	00135$
      009C7C A6 01            [ 1]  494 	ld	a, #0x01
      009C7E 6B 01            [ 1]  495 	ld	(0x01, sp), a
      009C80 20 02            [ 2]  496 	jra	00136$
      009C82                        497 00135$:
      009C82 0F 01            [ 1]  498 	clr	(0x01, sp)
      009C84                        499 00136$:
      009C84 7B 04            [ 1]  500 	ld	a, (0x04, sp)
      009C86 A1 1C            [ 1]  501 	cp	a, #0x1c
      009C88 26 03            [ 1]  502 	jrne	00138$
      009C8A A6 01            [ 1]  503 	ld	a, #0x01
      009C8C 21                     504 	.byte 0x21
      009C8D                        505 00138$:
      009C8D 4F               [ 1]  506 	clr	a
      009C8E                        507 00139$:
                                    508 ;	lib/stm8s_clk.c: 434: if (NewState != DISABLE)
      009C8E 0D 05            [ 1]  509 	tnz	(0x05, sp)
      009C90 27 19            [ 1]  510 	jreq	00110$
                                    511 ;	lib/stm8s_clk.c: 436: switch (CLK_IT)
      009C92 0D 01            [ 1]  512 	tnz	(0x01, sp)
      009C94 26 0C            [ 1]  513 	jrne	00102$
      009C96 4D               [ 1]  514 	tnz	a
      009C97 27 29            [ 1]  515 	jreq	00112$
                                    516 ;	lib/stm8s_clk.c: 439: CLK->SWCR |= CLK_SWCR_SWIEN;
      009C99 AE 50 C5         [ 2]  517 	ldw	x, #0x50c5
      009C9C F6               [ 1]  518 	ld	a, (x)
      009C9D AA 04            [ 1]  519 	or	a, #0x04
      009C9F F7               [ 1]  520 	ld	(x), a
                                    521 ;	lib/stm8s_clk.c: 440: break;
      009CA0 20 20            [ 2]  522 	jra	00112$
                                    523 ;	lib/stm8s_clk.c: 441: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      009CA2                        524 00102$:
                                    525 ;	lib/stm8s_clk.c: 442: CLK->CSSR |= CLK_CSSR_CSSDIE;
      009CA2 AE 50 C8         [ 2]  526 	ldw	x, #0x50c8
      009CA5 F6               [ 1]  527 	ld	a, (x)
      009CA6 AA 04            [ 1]  528 	or	a, #0x04
      009CA8 F7               [ 1]  529 	ld	(x), a
                                    530 ;	lib/stm8s_clk.c: 443: break;
      009CA9 20 17            [ 2]  531 	jra	00112$
                                    532 ;	lib/stm8s_clk.c: 446: }
      009CAB                        533 00110$:
                                    534 ;	lib/stm8s_clk.c: 450: switch (CLK_IT)
      009CAB 0D 01            [ 1]  535 	tnz	(0x01, sp)
      009CAD 26 0C            [ 1]  536 	jrne	00106$
      009CAF 4D               [ 1]  537 	tnz	a
      009CB0 27 10            [ 1]  538 	jreq	00112$
                                    539 ;	lib/stm8s_clk.c: 453: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      009CB2 AE 50 C5         [ 2]  540 	ldw	x, #0x50c5
      009CB5 F6               [ 1]  541 	ld	a, (x)
      009CB6 A4 FB            [ 1]  542 	and	a, #0xfb
      009CB8 F7               [ 1]  543 	ld	(x), a
                                    544 ;	lib/stm8s_clk.c: 454: break;
      009CB9 20 07            [ 2]  545 	jra	00112$
                                    546 ;	lib/stm8s_clk.c: 455: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      009CBB                        547 00106$:
                                    548 ;	lib/stm8s_clk.c: 456: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      009CBB AE 50 C8         [ 2]  549 	ldw	x, #0x50c8
      009CBE F6               [ 1]  550 	ld	a, (x)
      009CBF A4 FB            [ 1]  551 	and	a, #0xfb
      009CC1 F7               [ 1]  552 	ld	(x), a
                                    553 ;	lib/stm8s_clk.c: 460: }
      009CC2                        554 00112$:
      009CC2 84               [ 1]  555 	pop	a
      009CC3 81               [ 4]  556 	ret
                                    557 ;	lib/stm8s_clk.c: 469: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    558 ;	-----------------------------------------
                                    559 ;	 function CLK_SYSCLKConfig
                                    560 ;	-----------------------------------------
      009CC4                        561 _CLK_SYSCLKConfig:
      009CC4 89               [ 2]  562 	pushw	x
                                    563 ;	lib/stm8s_clk.c: 472: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      009CC5 0D 05            [ 1]  564 	tnz	(0x05, sp)
      009CC7 2B 19            [ 1]  565 	jrmi	00102$
                                    566 ;	lib/stm8s_clk.c: 474: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      009CC9 AE 50 C6         [ 2]  567 	ldw	x, #0x50c6
      009CCC F6               [ 1]  568 	ld	a, (x)
      009CCD A4 E7            [ 1]  569 	and	a, #0xe7
      009CCF F7               [ 1]  570 	ld	(x), a
                                    571 ;	lib/stm8s_clk.c: 475: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      009CD0 AE 50 C6         [ 2]  572 	ldw	x, #0x50c6
      009CD3 F6               [ 1]  573 	ld	a, (x)
      009CD4 6B 01            [ 1]  574 	ld	(0x01, sp), a
      009CD6 7B 05            [ 1]  575 	ld	a, (0x05, sp)
      009CD8 A4 18            [ 1]  576 	and	a, #0x18
      009CDA 1A 01            [ 1]  577 	or	a, (0x01, sp)
      009CDC AE 50 C6         [ 2]  578 	ldw	x, #0x50c6
      009CDF F7               [ 1]  579 	ld	(x), a
      009CE0 20 17            [ 2]  580 	jra	00104$
      009CE2                        581 00102$:
                                    582 ;	lib/stm8s_clk.c: 479: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      009CE2 AE 50 C6         [ 2]  583 	ldw	x, #0x50c6
      009CE5 F6               [ 1]  584 	ld	a, (x)
      009CE6 A4 F8            [ 1]  585 	and	a, #0xf8
      009CE8 F7               [ 1]  586 	ld	(x), a
                                    587 ;	lib/stm8s_clk.c: 480: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      009CE9 AE 50 C6         [ 2]  588 	ldw	x, #0x50c6
      009CEC F6               [ 1]  589 	ld	a, (x)
      009CED 6B 02            [ 1]  590 	ld	(0x02, sp), a
      009CEF 7B 05            [ 1]  591 	ld	a, (0x05, sp)
      009CF1 A4 07            [ 1]  592 	and	a, #0x07
      009CF3 1A 02            [ 1]  593 	or	a, (0x02, sp)
      009CF5 AE 50 C6         [ 2]  594 	ldw	x, #0x50c6
      009CF8 F7               [ 1]  595 	ld	(x), a
      009CF9                        596 00104$:
      009CF9 85               [ 2]  597 	popw	x
      009CFA 81               [ 4]  598 	ret
                                    599 ;	lib/stm8s_clk.c: 490: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    600 ;	-----------------------------------------
                                    601 ;	 function CLK_SWIMConfig
                                    602 ;	-----------------------------------------
      009CFB                        603 _CLK_SWIMConfig:
                                    604 ;	lib/stm8s_clk.c: 493: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      009CFB 0D 03            [ 1]  605 	tnz	(0x03, sp)
      009CFD 27 05            [ 1]  606 	jreq	00102$
                                    607 ;	lib/stm8s_clk.c: 496: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      009CFF 72 10 50 CD      [ 1]  608 	bset	0x50cd, #0
      009D03 81               [ 4]  609 	ret
      009D04                        610 00102$:
                                    611 ;	lib/stm8s_clk.c: 501: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      009D04 72 11 50 CD      [ 1]  612 	bres	0x50cd, #0
      009D08 81               [ 4]  613 	ret
                                    614 ;	lib/stm8s_clk.c: 512: void CLK_ClockSecuritySystemEnable(void)
                                    615 ;	-----------------------------------------
                                    616 ;	 function CLK_ClockSecuritySystemEnable
                                    617 ;	-----------------------------------------
      009D09                        618 _CLK_ClockSecuritySystemEnable:
                                    619 ;	lib/stm8s_clk.c: 515: CLK->CSSR |= CLK_CSSR_CSSEN;
      009D09 72 10 50 C8      [ 1]  620 	bset	0x50c8, #0
      009D0D 81               [ 4]  621 	ret
                                    622 ;	lib/stm8s_clk.c: 524: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    623 ;	-----------------------------------------
                                    624 ;	 function CLK_GetSYSCLKSource
                                    625 ;	-----------------------------------------
      009D0E                        626 _CLK_GetSYSCLKSource:
                                    627 ;	lib/stm8s_clk.c: 526: return((CLK_Source_TypeDef)CLK->CMSR);
      009D0E AE 50 C3         [ 2]  628 	ldw	x, #0x50c3
      009D11 F6               [ 1]  629 	ld	a, (x)
      009D12 81               [ 4]  630 	ret
                                    631 ;	lib/stm8s_clk.c: 534: uint32_t CLK_GetClockFreq(void)
                                    632 ;	-----------------------------------------
                                    633 ;	 function CLK_GetClockFreq
                                    634 ;	-----------------------------------------
      009D13                        635 _CLK_GetClockFreq:
      009D13 52 07            [ 2]  636 	sub	sp, #7
                                    637 ;	lib/stm8s_clk.c: 541: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      009D15 AE 50 C3         [ 2]  638 	ldw	x, #0x50c3
      009D18 F6               [ 1]  639 	ld	a, (x)
      009D19 6B 05            [ 1]  640 	ld	(0x05, sp), a
                                    641 ;	lib/stm8s_clk.c: 543: if (clocksource == CLK_SOURCE_HSI)
      009D1B 7B 05            [ 1]  642 	ld	a, (0x05, sp)
      009D1D A1 E1            [ 1]  643 	cp	a, #0xe1
      009D1F 26 2C            [ 1]  644 	jrne	00105$
                                    645 ;	lib/stm8s_clk.c: 545: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      009D21 AE 50 C6         [ 2]  646 	ldw	x, #0x50c6
      009D24 F6               [ 1]  647 	ld	a, (x)
      009D25 A4 18            [ 1]  648 	and	a, #0x18
                                    649 ;	lib/stm8s_clk.c: 546: tmp = (uint8_t)(tmp >> 3);
      009D27 44               [ 1]  650 	srl	a
      009D28 44               [ 1]  651 	srl	a
      009D29 44               [ 1]  652 	srl	a
                                    653 ;	lib/stm8s_clk.c: 547: presc = HSIDivFactor[tmp];
      009D2A AE 9E 00         [ 2]  654 	ldw	x, #_HSIDivFactor+0
      009D2D 1F 06            [ 2]  655 	ldw	(0x06, sp), x
      009D2F 5F               [ 1]  656 	clrw	x
      009D30 97               [ 1]  657 	ld	xl, a
      009D31 72 FB 06         [ 2]  658 	addw	x, (0x06, sp)
      009D34 F6               [ 1]  659 	ld	a, (x)
                                    660 ;	lib/stm8s_clk.c: 548: clockfrequency = HSI_VALUE / presc;
      009D35 5F               [ 1]  661 	clrw	x
      009D36 97               [ 1]  662 	ld	xl, a
      009D37 90 5F            [ 1]  663 	clrw	y
      009D39 89               [ 2]  664 	pushw	x
      009D3A 90 89            [ 2]  665 	pushw	y
      009D3C 4B 00            [ 1]  666 	push	#0x00
      009D3E 4B 24            [ 1]  667 	push	#0x24
      009D40 4B F4            [ 1]  668 	push	#0xf4
      009D42 4B 00            [ 1]  669 	push	#0x00
      009D44 CD 9F 00         [ 4]  670 	call	__divulong
      009D47 5B 08            [ 2]  671 	addw	sp, #8
      009D49 1F 03            [ 2]  672 	ldw	(0x03, sp), x
      009D4B 20 1A            [ 2]  673 	jra	00106$
      009D4D                        674 00105$:
                                    675 ;	lib/stm8s_clk.c: 550: else if ( clocksource == CLK_SOURCE_LSI)
      009D4D 7B 05            [ 1]  676 	ld	a, (0x05, sp)
      009D4F A1 D2            [ 1]  677 	cp	a, #0xd2
      009D51 26 0B            [ 1]  678 	jrne	00102$
                                    679 ;	lib/stm8s_clk.c: 552: clockfrequency = LSI_VALUE;
      009D53 AE F4 00         [ 2]  680 	ldw	x, #0xf400
      009D56 1F 03            [ 2]  681 	ldw	(0x03, sp), x
      009D58 90 AE 00 01      [ 2]  682 	ldw	y, #0x0001
      009D5C 20 09            [ 2]  683 	jra	00106$
      009D5E                        684 00102$:
                                    685 ;	lib/stm8s_clk.c: 556: clockfrequency = HSE_VALUE;
      009D5E AE 24 00         [ 2]  686 	ldw	x, #0x2400
      009D61 1F 03            [ 2]  687 	ldw	(0x03, sp), x
      009D63 90 AE 00 F4      [ 2]  688 	ldw	y, #0x00f4
      009D67                        689 00106$:
                                    690 ;	lib/stm8s_clk.c: 559: return((uint32_t)clockfrequency);
      009D67 1E 03            [ 2]  691 	ldw	x, (0x03, sp)
      009D69 5B 07            [ 2]  692 	addw	sp, #7
      009D6B 81               [ 4]  693 	ret
                                    694 ;	lib/stm8s_clk.c: 569: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    695 ;	-----------------------------------------
                                    696 ;	 function CLK_AdjustHSICalibrationValue
                                    697 ;	-----------------------------------------
      009D6C                        698 _CLK_AdjustHSICalibrationValue:
                                    699 ;	lib/stm8s_clk.c: 573: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      009D6C AE 50 CC         [ 2]  700 	ldw	x, #0x50cc
      009D6F F6               [ 1]  701 	ld	a, (x)
      009D70 A4 F8            [ 1]  702 	and	a, #0xf8
      009D72 1A 03            [ 1]  703 	or	a, (0x03, sp)
      009D74 AE 50 CC         [ 2]  704 	ldw	x, #0x50cc
      009D77 F7               [ 1]  705 	ld	(x), a
      009D78 81               [ 4]  706 	ret
                                    707 ;	lib/stm8s_clk.c: 585: void CLK_SYSCLKEmergencyClear(void)
                                    708 ;	-----------------------------------------
                                    709 ;	 function CLK_SYSCLKEmergencyClear
                                    710 ;	-----------------------------------------
      009D79                        711 _CLK_SYSCLKEmergencyClear:
                                    712 ;	lib/stm8s_clk.c: 587: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      009D79 72 11 50 C5      [ 1]  713 	bres	0x50c5, #0
      009D7D 81               [ 4]  714 	ret
                                    715 ;	lib/stm8s_clk.c: 597: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    716 ;	-----------------------------------------
                                    717 ;	 function CLK_GetFlagStatus
                                    718 ;	-----------------------------------------
      009D7E                        719 _CLK_GetFlagStatus:
      009D7E 88               [ 1]  720 	push	a
                                    721 ;	lib/stm8s_clk.c: 604: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      009D7F 4F               [ 1]  722 	clr	a
      009D80 97               [ 1]  723 	ld	xl, a
      009D81 7B 04            [ 1]  724 	ld	a, (0x04, sp)
      009D83 95               [ 1]  725 	ld	xh, a
                                    726 ;	lib/stm8s_clk.c: 607: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      009D84 A3 01 00         [ 2]  727 	cpw	x, #0x0100
      009D87 26 06            [ 1]  728 	jrne	00111$
                                    729 ;	lib/stm8s_clk.c: 609: tmpreg = CLK->ICKR;
      009D89 AE 50 C0         [ 2]  730 	ldw	x, #0x50c0
      009D8C F6               [ 1]  731 	ld	a, (x)
      009D8D 20 25            [ 2]  732 	jra	00112$
      009D8F                        733 00111$:
                                    734 ;	lib/stm8s_clk.c: 611: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      009D8F A3 02 00         [ 2]  735 	cpw	x, #0x0200
      009D92 26 06            [ 1]  736 	jrne	00108$
                                    737 ;	lib/stm8s_clk.c: 613: tmpreg = CLK->ECKR;
      009D94 AE 50 C1         [ 2]  738 	ldw	x, #0x50c1
      009D97 F6               [ 1]  739 	ld	a, (x)
      009D98 20 1A            [ 2]  740 	jra	00112$
      009D9A                        741 00108$:
                                    742 ;	lib/stm8s_clk.c: 615: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      009D9A A3 03 00         [ 2]  743 	cpw	x, #0x0300
      009D9D 26 06            [ 1]  744 	jrne	00105$
                                    745 ;	lib/stm8s_clk.c: 617: tmpreg = CLK->SWCR;
      009D9F AE 50 C5         [ 2]  746 	ldw	x, #0x50c5
      009DA2 F6               [ 1]  747 	ld	a, (x)
      009DA3 20 0F            [ 2]  748 	jra	00112$
      009DA5                        749 00105$:
                                    750 ;	lib/stm8s_clk.c: 619: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      009DA5 A3 04 00         [ 2]  751 	cpw	x, #0x0400
      009DA8 26 06            [ 1]  752 	jrne	00102$
                                    753 ;	lib/stm8s_clk.c: 621: tmpreg = CLK->CSSR;
      009DAA AE 50 C8         [ 2]  754 	ldw	x, #0x50c8
      009DAD F6               [ 1]  755 	ld	a, (x)
      009DAE 20 04            [ 2]  756 	jra	00112$
      009DB0                        757 00102$:
                                    758 ;	lib/stm8s_clk.c: 625: tmpreg = CLK->CCOR;
      009DB0 AE 50 C9         [ 2]  759 	ldw	x, #0x50c9
      009DB3 F6               [ 1]  760 	ld	a, (x)
      009DB4                        761 00112$:
                                    762 ;	lib/stm8s_clk.c: 628: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      009DB4 88               [ 1]  763 	push	a
      009DB5 7B 06            [ 1]  764 	ld	a, (0x06, sp)
      009DB7 6B 02            [ 1]  765 	ld	(0x02, sp), a
      009DB9 84               [ 1]  766 	pop	a
      009DBA 14 01            [ 1]  767 	and	a, (0x01, sp)
      009DBC 4D               [ 1]  768 	tnz	a
      009DBD 27 03            [ 1]  769 	jreq	00114$
                                    770 ;	lib/stm8s_clk.c: 630: bitstatus = SET;
      009DBF A6 01            [ 1]  771 	ld	a, #0x01
                                    772 ;	lib/stm8s_clk.c: 634: bitstatus = RESET;
      009DC1 21                     773 	.byte 0x21
      009DC2                        774 00114$:
      009DC2 4F               [ 1]  775 	clr	a
      009DC3                        776 00115$:
                                    777 ;	lib/stm8s_clk.c: 638: return((FlagStatus)bitstatus);
      009DC3 5B 01            [ 2]  778 	addw	sp, #1
      009DC5 81               [ 4]  779 	ret
                                    780 ;	lib/stm8s_clk.c: 647: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    781 ;	-----------------------------------------
                                    782 ;	 function CLK_GetITStatus
                                    783 ;	-----------------------------------------
      009DC6                        784 _CLK_GetITStatus:
                                    785 ;	lib/stm8s_clk.c: 651: if (CLK_IT == CLK_IT_SWIF)
      009DC6 7B 03            [ 1]  786 	ld	a, (0x03, sp)
      009DC8 A1 1C            [ 1]  787 	cp	a, #0x1c
      009DCA 26 0F            [ 1]  788 	jrne	00108$
                                    789 ;	lib/stm8s_clk.c: 654: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      009DCC AE 50 C5         [ 2]  790 	ldw	x, #0x50c5
      009DCF F6               [ 1]  791 	ld	a, (x)
      009DD0 14 03            [ 1]  792 	and	a, (0x03, sp)
      009DD2 A1 0C            [ 1]  793 	cp	a, #0x0c
      009DD4 26 03            [ 1]  794 	jrne	00102$
                                    795 ;	lib/stm8s_clk.c: 656: bitstatus = SET;
      009DD6 A6 01            [ 1]  796 	ld	a, #0x01
      009DD8 81               [ 4]  797 	ret
      009DD9                        798 00102$:
                                    799 ;	lib/stm8s_clk.c: 660: bitstatus = RESET;
      009DD9 4F               [ 1]  800 	clr	a
      009DDA 81               [ 4]  801 	ret
      009DDB                        802 00108$:
                                    803 ;	lib/stm8s_clk.c: 666: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      009DDB AE 50 C8         [ 2]  804 	ldw	x, #0x50c8
      009DDE F6               [ 1]  805 	ld	a, (x)
      009DDF 14 03            [ 1]  806 	and	a, (0x03, sp)
      009DE1 A1 0C            [ 1]  807 	cp	a, #0x0c
      009DE3 26 03            [ 1]  808 	jrne	00105$
                                    809 ;	lib/stm8s_clk.c: 668: bitstatus = SET;
      009DE5 A6 01            [ 1]  810 	ld	a, #0x01
      009DE7 81               [ 4]  811 	ret
      009DE8                        812 00105$:
                                    813 ;	lib/stm8s_clk.c: 672: bitstatus = RESET;
      009DE8 4F               [ 1]  814 	clr	a
                                    815 ;	lib/stm8s_clk.c: 677: return bitstatus;
      009DE9 81               [ 4]  816 	ret
                                    817 ;	lib/stm8s_clk.c: 686: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    818 ;	-----------------------------------------
                                    819 ;	 function CLK_ClearITPendingBit
                                    820 ;	-----------------------------------------
      009DEA                        821 _CLK_ClearITPendingBit:
                                    822 ;	lib/stm8s_clk.c: 689: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      009DEA 7B 03            [ 1]  823 	ld	a, (0x03, sp)
      009DEC A1 0C            [ 1]  824 	cp	a, #0x0c
      009DEE 26 08            [ 1]  825 	jrne	00102$
                                    826 ;	lib/stm8s_clk.c: 692: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      009DF0 AE 50 C8         [ 2]  827 	ldw	x, #0x50c8
      009DF3 F6               [ 1]  828 	ld	a, (x)
      009DF4 A4 F7            [ 1]  829 	and	a, #0xf7
      009DF6 F7               [ 1]  830 	ld	(x), a
      009DF7 81               [ 4]  831 	ret
      009DF8                        832 00102$:
                                    833 ;	lib/stm8s_clk.c: 697: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      009DF8 AE 50 C5         [ 2]  834 	ldw	x, #0x50c5
      009DFB F6               [ 1]  835 	ld	a, (x)
      009DFC A4 F7            [ 1]  836 	and	a, #0xf7
      009DFE F7               [ 1]  837 	ld	(x), a
      009DFF 81               [ 4]  838 	ret
                                    839 	.area CODE
      009E00                        840 _HSIDivFactor:
      009E00 01                     841 	.db #0x01	; 1
      009E01 02                     842 	.db #0x02	; 2
      009E02 04                     843 	.db #0x04	; 4
      009E03 08                     844 	.db #0x08	; 8
      009E04                        845 _CLKPrescTable:
      009E04 01                     846 	.db #0x01	; 1
      009E05 02                     847 	.db #0x02	; 2
      009E06 04                     848 	.db #0x04	; 4
      009E07 08                     849 	.db #0x08	; 8
      009E08 0A                     850 	.db #0x0a	; 10
      009E09 10                     851 	.db #0x10	; 16
      009E0A 14                     852 	.db #0x14	; 20
      009E0B 28                     853 	.db #0x28	; 40
                                    854 	.area INITIALIZER
                                    855 	.area CABS (ABS)
