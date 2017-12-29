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
      009AA2                         68 _CLK_DeInit:
                                     69 ;	lib/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      009AA2 35 01 50 C0      [ 1]   70 	mov	0x50c0+0, #0x01
                                     71 ;	lib/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      009AA6 35 00 50 C1      [ 1]   72 	mov	0x50c1+0, #0x00
                                     73 ;	lib/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      009AAA 35 E1 50 C4      [ 1]   74 	mov	0x50c4+0, #0xe1
                                     75 ;	lib/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      009AAE 35 00 50 C5      [ 1]   76 	mov	0x50c5+0, #0x00
                                     77 ;	lib/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      009AB2 35 18 50 C6      [ 1]   78 	mov	0x50c6+0, #0x18
                                     79 ;	lib/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      009AB6 35 FF 50 C7      [ 1]   80 	mov	0x50c7+0, #0xff
                                     81 ;	lib/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      009ABA 35 FF 50 CA      [ 1]   82 	mov	0x50ca+0, #0xff
                                     83 ;	lib/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      009ABE 35 00 50 C8      [ 1]   84 	mov	0x50c8+0, #0x00
                                     85 ;	lib/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      009AC2 35 00 50 C9      [ 1]   86 	mov	0x50c9+0, #0x00
                                     87 ;	lib/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      009AC6                         88 00101$:
      009AC6 AE 50 C9         [ 2]   89 	ldw	x, #0x50c9
      009AC9 F6               [ 1]   90 	ld	a, (x)
      009ACA 44               [ 1]   91 	srl	a
      009ACB 25 F9            [ 1]   92 	jrc	00101$
                                     93 ;	lib/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      009ACD 35 00 50 C9      [ 1]   94 	mov	0x50c9+0, #0x00
                                     95 ;	lib/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      009AD1 35 00 50 CC      [ 1]   96 	mov	0x50cc+0, #0x00
                                     97 ;	lib/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      009AD5 35 00 50 CD      [ 1]   98 	mov	0x50cd+0, #0x00
      009AD9 81               [ 4]   99 	ret
                                    100 ;	lib/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function CLK_FastHaltWakeUpCmd
                                    103 ;	-----------------------------------------
      009ADA                        104 _CLK_FastHaltWakeUpCmd:
                                    105 ;	lib/stm8s_clk.c: 102: if (NewState != DISABLE)
      009ADA 0D 03            [ 1]  106 	tnz	(0x03, sp)
      009ADC 27 08            [ 1]  107 	jreq	00102$
                                    108 ;	lib/stm8s_clk.c: 105: CLK->ICKR |= CLK_ICKR_FHWU;
      009ADE AE 50 C0         [ 2]  109 	ldw	x, #0x50c0
      009AE1 F6               [ 1]  110 	ld	a, (x)
      009AE2 AA 04            [ 1]  111 	or	a, #0x04
      009AE4 F7               [ 1]  112 	ld	(x), a
      009AE5 81               [ 4]  113 	ret
      009AE6                        114 00102$:
                                    115 ;	lib/stm8s_clk.c: 110: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      009AE6 AE 50 C0         [ 2]  116 	ldw	x, #0x50c0
      009AE9 F6               [ 1]  117 	ld	a, (x)
      009AEA A4 FB            [ 1]  118 	and	a, #0xfb
      009AEC F7               [ 1]  119 	ld	(x), a
      009AED 81               [ 4]  120 	ret
                                    121 ;	lib/stm8s_clk.c: 119: void CLK_HSECmd(FunctionalState NewState)
                                    122 ;	-----------------------------------------
                                    123 ;	 function CLK_HSECmd
                                    124 ;	-----------------------------------------
      009AEE                        125 _CLK_HSECmd:
                                    126 ;	lib/stm8s_clk.c: 122: if (NewState != DISABLE)
      009AEE 0D 03            [ 1]  127 	tnz	(0x03, sp)
      009AF0 27 05            [ 1]  128 	jreq	00102$
                                    129 ;	lib/stm8s_clk.c: 125: CLK->ECKR |= CLK_ECKR_HSEEN;
      009AF2 72 10 50 C1      [ 1]  130 	bset	0x50c1, #0
      009AF6 81               [ 4]  131 	ret
      009AF7                        132 00102$:
                                    133 ;	lib/stm8s_clk.c: 130: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      009AF7 72 11 50 C1      [ 1]  134 	bres	0x50c1, #0
      009AFB 81               [ 4]  135 	ret
                                    136 ;	lib/stm8s_clk.c: 139: void CLK_HSICmd(FunctionalState NewState)
                                    137 ;	-----------------------------------------
                                    138 ;	 function CLK_HSICmd
                                    139 ;	-----------------------------------------
      009AFC                        140 _CLK_HSICmd:
                                    141 ;	lib/stm8s_clk.c: 142: if (NewState != DISABLE)
      009AFC 0D 03            [ 1]  142 	tnz	(0x03, sp)
      009AFE 27 05            [ 1]  143 	jreq	00102$
                                    144 ;	lib/stm8s_clk.c: 145: CLK->ICKR |= CLK_ICKR_HSIEN;
      009B00 72 10 50 C0      [ 1]  145 	bset	0x50c0, #0
      009B04 81               [ 4]  146 	ret
      009B05                        147 00102$:
                                    148 ;	lib/stm8s_clk.c: 150: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      009B05 72 11 50 C0      [ 1]  149 	bres	0x50c0, #0
      009B09 81               [ 4]  150 	ret
                                    151 ;	lib/stm8s_clk.c: 160: void CLK_LSICmd(FunctionalState NewState)
                                    152 ;	-----------------------------------------
                                    153 ;	 function CLK_LSICmd
                                    154 ;	-----------------------------------------
      009B0A                        155 _CLK_LSICmd:
                                    156 ;	lib/stm8s_clk.c: 163: if (NewState != DISABLE)
      009B0A 0D 03            [ 1]  157 	tnz	(0x03, sp)
      009B0C 27 08            [ 1]  158 	jreq	00102$
                                    159 ;	lib/stm8s_clk.c: 166: CLK->ICKR |= CLK_ICKR_LSIEN;
      009B0E AE 50 C0         [ 2]  160 	ldw	x, #0x50c0
      009B11 F6               [ 1]  161 	ld	a, (x)
      009B12 AA 08            [ 1]  162 	or	a, #0x08
      009B14 F7               [ 1]  163 	ld	(x), a
      009B15 81               [ 4]  164 	ret
      009B16                        165 00102$:
                                    166 ;	lib/stm8s_clk.c: 171: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      009B16 AE 50 C0         [ 2]  167 	ldw	x, #0x50c0
      009B19 F6               [ 1]  168 	ld	a, (x)
      009B1A A4 F7            [ 1]  169 	and	a, #0xf7
      009B1C F7               [ 1]  170 	ld	(x), a
      009B1D 81               [ 4]  171 	ret
                                    172 ;	lib/stm8s_clk.c: 181: void CLK_CCOCmd(FunctionalState NewState)
                                    173 ;	-----------------------------------------
                                    174 ;	 function CLK_CCOCmd
                                    175 ;	-----------------------------------------
      009B1E                        176 _CLK_CCOCmd:
                                    177 ;	lib/stm8s_clk.c: 184: if (NewState != DISABLE)
      009B1E 0D 03            [ 1]  178 	tnz	(0x03, sp)
      009B20 27 05            [ 1]  179 	jreq	00102$
                                    180 ;	lib/stm8s_clk.c: 187: CLK->CCOR |= CLK_CCOR_CCOEN;
      009B22 72 10 50 C9      [ 1]  181 	bset	0x50c9, #0
      009B26 81               [ 4]  182 	ret
      009B27                        183 00102$:
                                    184 ;	lib/stm8s_clk.c: 192: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      009B27 72 11 50 C9      [ 1]  185 	bres	0x50c9, #0
      009B2B 81               [ 4]  186 	ret
                                    187 ;	lib/stm8s_clk.c: 203: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    188 ;	-----------------------------------------
                                    189 ;	 function CLK_ClockSwitchCmd
                                    190 ;	-----------------------------------------
      009B2C                        191 _CLK_ClockSwitchCmd:
                                    192 ;	lib/stm8s_clk.c: 206: if (NewState != DISABLE )
      009B2C 0D 03            [ 1]  193 	tnz	(0x03, sp)
      009B2E 27 08            [ 1]  194 	jreq	00102$
                                    195 ;	lib/stm8s_clk.c: 209: CLK->SWCR |= CLK_SWCR_SWEN;
      009B30 AE 50 C5         [ 2]  196 	ldw	x, #0x50c5
      009B33 F6               [ 1]  197 	ld	a, (x)
      009B34 AA 02            [ 1]  198 	or	a, #0x02
      009B36 F7               [ 1]  199 	ld	(x), a
      009B37 81               [ 4]  200 	ret
      009B38                        201 00102$:
                                    202 ;	lib/stm8s_clk.c: 214: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      009B38 AE 50 C5         [ 2]  203 	ldw	x, #0x50c5
      009B3B F6               [ 1]  204 	ld	a, (x)
      009B3C A4 FD            [ 1]  205 	and	a, #0xfd
      009B3E F7               [ 1]  206 	ld	(x), a
      009B3F 81               [ 4]  207 	ret
                                    208 ;	lib/stm8s_clk.c: 226: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    209 ;	-----------------------------------------
                                    210 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    211 ;	-----------------------------------------
      009B40                        212 _CLK_SlowActiveHaltWakeUpCmd:
                                    213 ;	lib/stm8s_clk.c: 229: if (NewState != DISABLE)
      009B40 0D 03            [ 1]  214 	tnz	(0x03, sp)
      009B42 27 08            [ 1]  215 	jreq	00102$
                                    216 ;	lib/stm8s_clk.c: 232: CLK->ICKR |= CLK_ICKR_SWUAH;
      009B44 AE 50 C0         [ 2]  217 	ldw	x, #0x50c0
      009B47 F6               [ 1]  218 	ld	a, (x)
      009B48 AA 20            [ 1]  219 	or	a, #0x20
      009B4A F7               [ 1]  220 	ld	(x), a
      009B4B 81               [ 4]  221 	ret
      009B4C                        222 00102$:
                                    223 ;	lib/stm8s_clk.c: 237: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      009B4C AE 50 C0         [ 2]  224 	ldw	x, #0x50c0
      009B4F F6               [ 1]  225 	ld	a, (x)
      009B50 A4 DF            [ 1]  226 	and	a, #0xdf
      009B52 F7               [ 1]  227 	ld	(x), a
      009B53 81               [ 4]  228 	ret
                                    229 ;	lib/stm8s_clk.c: 249: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    230 ;	-----------------------------------------
                                    231 ;	 function CLK_PeripheralClockConfig
                                    232 ;	-----------------------------------------
      009B54                        233 _CLK_PeripheralClockConfig:
      009B54 89               [ 2]  234 	pushw	x
                                    235 ;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009B55 7B 05            [ 1]  236 	ld	a, (0x05, sp)
      009B57 A4 0F            [ 1]  237 	and	a, #0x0f
      009B59 88               [ 1]  238 	push	a
      009B5A A6 01            [ 1]  239 	ld	a, #0x01
      009B5C 6B 03            [ 1]  240 	ld	(0x03, sp), a
      009B5E 84               [ 1]  241 	pop	a
      009B5F 4D               [ 1]  242 	tnz	a
      009B60 27 05            [ 1]  243 	jreq	00125$
      009B62                        244 00124$:
      009B62 08 02            [ 1]  245 	sll	(0x02, sp)
      009B64 4A               [ 1]  246 	dec	a
      009B65 26 FB            [ 1]  247 	jrne	00124$
      009B67                        248 00125$:
                                    249 ;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      009B67 7B 02            [ 1]  250 	ld	a, (0x02, sp)
      009B69 43               [ 1]  251 	cpl	a
      009B6A 6B 01            [ 1]  252 	ld	(0x01, sp), a
                                    253 ;	lib/stm8s_clk.c: 252: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      009B6C 7B 05            [ 1]  254 	ld	a, (0x05, sp)
      009B6E A5 10            [ 1]  255 	bcp	a, #0x10
      009B70 26 1C            [ 1]  256 	jrne	00108$
                                    257 ;	lib/stm8s_clk.c: 254: if (NewState != DISABLE)
      009B72 0D 06            [ 1]  258 	tnz	(0x06, sp)
      009B74 27 0C            [ 1]  259 	jreq	00102$
                                    260 ;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009B76 AE 50 C7         [ 2]  261 	ldw	x, #0x50c7
      009B79 F6               [ 1]  262 	ld	a, (x)
      009B7A 1A 02            [ 1]  263 	or	a, (0x02, sp)
      009B7C AE 50 C7         [ 2]  264 	ldw	x, #0x50c7
      009B7F F7               [ 1]  265 	ld	(x), a
      009B80 20 26            [ 2]  266 	jra	00110$
      009B82                        267 00102$:
                                    268 ;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      009B82 AE 50 C7         [ 2]  269 	ldw	x, #0x50c7
      009B85 F6               [ 1]  270 	ld	a, (x)
      009B86 14 01            [ 1]  271 	and	a, (0x01, sp)
      009B88 AE 50 C7         [ 2]  272 	ldw	x, #0x50c7
      009B8B F7               [ 1]  273 	ld	(x), a
      009B8C 20 1A            [ 2]  274 	jra	00110$
      009B8E                        275 00108$:
                                    276 ;	lib/stm8s_clk.c: 267: if (NewState != DISABLE)
      009B8E 0D 06            [ 1]  277 	tnz	(0x06, sp)
      009B90 27 0C            [ 1]  278 	jreq	00105$
                                    279 ;	lib/stm8s_clk.c: 270: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009B92 AE 50 CA         [ 2]  280 	ldw	x, #0x50ca
      009B95 F6               [ 1]  281 	ld	a, (x)
      009B96 1A 02            [ 1]  282 	or	a, (0x02, sp)
      009B98 AE 50 CA         [ 2]  283 	ldw	x, #0x50ca
      009B9B F7               [ 1]  284 	ld	(x), a
      009B9C 20 0A            [ 2]  285 	jra	00110$
      009B9E                        286 00105$:
                                    287 ;	lib/stm8s_clk.c: 275: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      009B9E AE 50 CA         [ 2]  288 	ldw	x, #0x50ca
      009BA1 F6               [ 1]  289 	ld	a, (x)
      009BA2 14 01            [ 1]  290 	and	a, (0x01, sp)
      009BA4 AE 50 CA         [ 2]  291 	ldw	x, #0x50ca
      009BA7 F7               [ 1]  292 	ld	(x), a
      009BA8                        293 00110$:
      009BA8 85               [ 2]  294 	popw	x
      009BA9 81               [ 4]  295 	ret
                                    296 ;	lib/stm8s_clk.c: 292: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    297 ;	-----------------------------------------
                                    298 ;	 function CLK_ClockSwitchConfig
                                    299 ;	-----------------------------------------
      009BAA                        300 _CLK_ClockSwitchConfig:
      009BAA 89               [ 2]  301 	pushw	x
                                    302 ;	lib/stm8s_clk.c: 299: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      009BAB AE 50 C3         [ 2]  303 	ldw	x, #0x50c3
      009BAE F6               [ 1]  304 	ld	a, (x)
      009BAF 6B 02            [ 1]  305 	ld	(0x02, sp), a
                                    306 ;	lib/stm8s_clk.c: 302: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      009BB1 7B 05            [ 1]  307 	ld	a, (0x05, sp)
      009BB3 A1 01            [ 1]  308 	cp	a, #0x01
      009BB5 26 40            [ 1]  309 	jrne	00122$
                                    310 ;	lib/stm8s_clk.c: 305: CLK->SWCR |= CLK_SWCR_SWEN;
      009BB7 AE 50 C5         [ 2]  311 	ldw	x, #0x50c5
      009BBA F6               [ 1]  312 	ld	a, (x)
      009BBB AA 02            [ 1]  313 	or	a, #0x02
      009BBD F7               [ 1]  314 	ld	(x), a
                                    315 ;	lib/stm8s_clk.c: 308: if (ITState != DISABLE)
      009BBE 0D 07            [ 1]  316 	tnz	(0x07, sp)
      009BC0 27 09            [ 1]  317 	jreq	00102$
                                    318 ;	lib/stm8s_clk.c: 310: CLK->SWCR |= CLK_SWCR_SWIEN;
      009BC2 AE 50 C5         [ 2]  319 	ldw	x, #0x50c5
      009BC5 F6               [ 1]  320 	ld	a, (x)
      009BC6 AA 04            [ 1]  321 	or	a, #0x04
      009BC8 F7               [ 1]  322 	ld	(x), a
      009BC9 20 07            [ 2]  323 	jra	00103$
      009BCB                        324 00102$:
                                    325 ;	lib/stm8s_clk.c: 314: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      009BCB AE 50 C5         [ 2]  326 	ldw	x, #0x50c5
      009BCE F6               [ 1]  327 	ld	a, (x)
      009BCF A4 FB            [ 1]  328 	and	a, #0xfb
      009BD1 F7               [ 1]  329 	ld	(x), a
      009BD2                        330 00103$:
                                    331 ;	lib/stm8s_clk.c: 318: CLK->SWR = (uint8_t)CLK_NewClock;
      009BD2 AE 50 C4         [ 2]  332 	ldw	x, #0x50c4
      009BD5 7B 06            [ 1]  333 	ld	a, (0x06, sp)
      009BD7 F7               [ 1]  334 	ld	(x), a
                                    335 ;	lib/stm8s_clk.c: 321: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      009BD8 AE FF FF         [ 2]  336 	ldw	x, #0xffff
      009BDB                        337 00105$:
      009BDB 90 AE 50 C5      [ 2]  338 	ldw	y, #0x50c5
      009BDF 90 F6            [ 1]  339 	ld	a, (y)
      009BE1 44               [ 1]  340 	srl	a
      009BE2 24 06            [ 1]  341 	jrnc	00107$
      009BE4 5D               [ 2]  342 	tnzw	x
      009BE5 27 03            [ 1]  343 	jreq	00107$
                                    344 ;	lib/stm8s_clk.c: 323: DownCounter--;
      009BE7 5A               [ 2]  345 	decw	x
      009BE8 20 F1            [ 2]  346 	jra	00105$
      009BEA                        347 00107$:
                                    348 ;	lib/stm8s_clk.c: 326: if(DownCounter != 0)
      009BEA 5D               [ 2]  349 	tnzw	x
      009BEB 27 06            [ 1]  350 	jreq	00109$
                                    351 ;	lib/stm8s_clk.c: 328: Swif = SUCCESS;
      009BED A6 01            [ 1]  352 	ld	a, #0x01
      009BEF 6B 01            [ 1]  353 	ld	(0x01, sp), a
      009BF1 20 43            [ 2]  354 	jra	00123$
      009BF3                        355 00109$:
                                    356 ;	lib/stm8s_clk.c: 332: Swif = ERROR;
      009BF3 0F 01            [ 1]  357 	clr	(0x01, sp)
      009BF5 20 3F            [ 2]  358 	jra	00123$
      009BF7                        359 00122$:
                                    360 ;	lib/stm8s_clk.c: 338: if (ITState != DISABLE)
      009BF7 0D 07            [ 1]  361 	tnz	(0x07, sp)
      009BF9 27 09            [ 1]  362 	jreq	00112$
                                    363 ;	lib/stm8s_clk.c: 340: CLK->SWCR |= CLK_SWCR_SWIEN;
      009BFB AE 50 C5         [ 2]  364 	ldw	x, #0x50c5
      009BFE F6               [ 1]  365 	ld	a, (x)
      009BFF AA 04            [ 1]  366 	or	a, #0x04
      009C01 F7               [ 1]  367 	ld	(x), a
      009C02 20 07            [ 2]  368 	jra	00113$
      009C04                        369 00112$:
                                    370 ;	lib/stm8s_clk.c: 344: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      009C04 AE 50 C5         [ 2]  371 	ldw	x, #0x50c5
      009C07 F6               [ 1]  372 	ld	a, (x)
      009C08 A4 FB            [ 1]  373 	and	a, #0xfb
      009C0A F7               [ 1]  374 	ld	(x), a
      009C0B                        375 00113$:
                                    376 ;	lib/stm8s_clk.c: 348: CLK->SWR = (uint8_t)CLK_NewClock;
      009C0B AE 50 C4         [ 2]  377 	ldw	x, #0x50c4
      009C0E 7B 06            [ 1]  378 	ld	a, (0x06, sp)
      009C10 F7               [ 1]  379 	ld	(x), a
                                    380 ;	lib/stm8s_clk.c: 351: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      009C11 AE FF FF         [ 2]  381 	ldw	x, #0xffff
      009C14                        382 00115$:
      009C14 90 AE 50 C5      [ 2]  383 	ldw	y, #0x50c5
      009C18 90 F6            [ 1]  384 	ld	a, (y)
      009C1A A5 08            [ 1]  385 	bcp	a, #0x08
      009C1C 27 06            [ 1]  386 	jreq	00117$
      009C1E 5D               [ 2]  387 	tnzw	x
      009C1F 27 03            [ 1]  388 	jreq	00117$
                                    389 ;	lib/stm8s_clk.c: 353: DownCounter--;
      009C21 5A               [ 2]  390 	decw	x
      009C22 20 F0            [ 2]  391 	jra	00115$
      009C24                        392 00117$:
                                    393 ;	lib/stm8s_clk.c: 356: if(DownCounter != 0)
      009C24 5D               [ 2]  394 	tnzw	x
      009C25 27 0D            [ 1]  395 	jreq	00119$
                                    396 ;	lib/stm8s_clk.c: 359: CLK->SWCR |= CLK_SWCR_SWEN;
      009C27 AE 50 C5         [ 2]  397 	ldw	x, #0x50c5
      009C2A F6               [ 1]  398 	ld	a, (x)
      009C2B AA 02            [ 1]  399 	or	a, #0x02
      009C2D F7               [ 1]  400 	ld	(x), a
                                    401 ;	lib/stm8s_clk.c: 360: Swif = SUCCESS;
      009C2E A6 01            [ 1]  402 	ld	a, #0x01
      009C30 6B 01            [ 1]  403 	ld	(0x01, sp), a
      009C32 20 02            [ 2]  404 	jra	00123$
      009C34                        405 00119$:
                                    406 ;	lib/stm8s_clk.c: 364: Swif = ERROR;
      009C34 0F 01            [ 1]  407 	clr	(0x01, sp)
      009C36                        408 00123$:
                                    409 ;	lib/stm8s_clk.c: 367: if(Swif != ERROR)
      009C36 0D 01            [ 1]  410 	tnz	(0x01, sp)
      009C38 27 31            [ 1]  411 	jreq	00136$
                                    412 ;	lib/stm8s_clk.c: 370: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      009C3A 0D 08            [ 1]  413 	tnz	(0x08, sp)
      009C3C 26 0C            [ 1]  414 	jrne	00132$
      009C3E 7B 02            [ 1]  415 	ld	a, (0x02, sp)
      009C40 A1 E1            [ 1]  416 	cp	a, #0xe1
      009C42 26 06            [ 1]  417 	jrne	00132$
                                    418 ;	lib/stm8s_clk.c: 372: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      009C44 72 11 50 C0      [ 1]  419 	bres	0x50c0, #0
      009C48 20 21            [ 2]  420 	jra	00136$
      009C4A                        421 00132$:
                                    422 ;	lib/stm8s_clk.c: 374: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      009C4A 0D 08            [ 1]  423 	tnz	(0x08, sp)
      009C4C 26 0F            [ 1]  424 	jrne	00128$
      009C4E 7B 02            [ 1]  425 	ld	a, (0x02, sp)
      009C50 A1 D2            [ 1]  426 	cp	a, #0xd2
      009C52 26 09            [ 1]  427 	jrne	00128$
                                    428 ;	lib/stm8s_clk.c: 376: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      009C54 AE 50 C0         [ 2]  429 	ldw	x, #0x50c0
      009C57 F6               [ 1]  430 	ld	a, (x)
      009C58 A4 F7            [ 1]  431 	and	a, #0xf7
      009C5A F7               [ 1]  432 	ld	(x), a
      009C5B 20 0E            [ 2]  433 	jra	00136$
      009C5D                        434 00128$:
                                    435 ;	lib/stm8s_clk.c: 378: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      009C5D 0D 08            [ 1]  436 	tnz	(0x08, sp)
      009C5F 26 0A            [ 1]  437 	jrne	00136$
      009C61 7B 02            [ 1]  438 	ld	a, (0x02, sp)
      009C63 A1 B4            [ 1]  439 	cp	a, #0xb4
      009C65 26 04            [ 1]  440 	jrne	00136$
                                    441 ;	lib/stm8s_clk.c: 380: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      009C67 72 11 50 C1      [ 1]  442 	bres	0x50c1, #0
      009C6B                        443 00136$:
                                    444 ;	lib/stm8s_clk.c: 383: return(Swif);
      009C6B 7B 01            [ 1]  445 	ld	a, (0x01, sp)
      009C6D 85               [ 2]  446 	popw	x
      009C6E 81               [ 4]  447 	ret
                                    448 ;	lib/stm8s_clk.c: 392: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    449 ;	-----------------------------------------
                                    450 ;	 function CLK_HSIPrescalerConfig
                                    451 ;	-----------------------------------------
      009C6F                        452 _CLK_HSIPrescalerConfig:
                                    453 ;	lib/stm8s_clk.c: 396: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      009C6F AE 50 C6         [ 2]  454 	ldw	x, #0x50c6
      009C72 F6               [ 1]  455 	ld	a, (x)
      009C73 A4 E7            [ 1]  456 	and	a, #0xe7
      009C75 F7               [ 1]  457 	ld	(x), a
                                    458 ;	lib/stm8s_clk.c: 399: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      009C76 AE 50 C6         [ 2]  459 	ldw	x, #0x50c6
      009C79 F6               [ 1]  460 	ld	a, (x)
      009C7A 1A 03            [ 1]  461 	or	a, (0x03, sp)
      009C7C AE 50 C6         [ 2]  462 	ldw	x, #0x50c6
      009C7F F7               [ 1]  463 	ld	(x), a
      009C80 81               [ 4]  464 	ret
                                    465 ;	lib/stm8s_clk.c: 411: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    466 ;	-----------------------------------------
                                    467 ;	 function CLK_CCOConfig
                                    468 ;	-----------------------------------------
      009C81                        469 _CLK_CCOConfig:
                                    470 ;	lib/stm8s_clk.c: 415: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      009C81 AE 50 C9         [ 2]  471 	ldw	x, #0x50c9
      009C84 F6               [ 1]  472 	ld	a, (x)
      009C85 A4 E1            [ 1]  473 	and	a, #0xe1
      009C87 F7               [ 1]  474 	ld	(x), a
                                    475 ;	lib/stm8s_clk.c: 418: CLK->CCOR |= (uint8_t)CLK_CCO;
      009C88 AE 50 C9         [ 2]  476 	ldw	x, #0x50c9
      009C8B F6               [ 1]  477 	ld	a, (x)
      009C8C 1A 03            [ 1]  478 	or	a, (0x03, sp)
      009C8E AE 50 C9         [ 2]  479 	ldw	x, #0x50c9
      009C91 F7               [ 1]  480 	ld	(x), a
                                    481 ;	lib/stm8s_clk.c: 421: CLK->CCOR |= CLK_CCOR_CCOEN;
      009C92 72 10 50 C9      [ 1]  482 	bset	0x50c9, #0
      009C96 81               [ 4]  483 	ret
                                    484 ;	lib/stm8s_clk.c: 432: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    485 ;	-----------------------------------------
                                    486 ;	 function CLK_ITConfig
                                    487 ;	-----------------------------------------
      009C97                        488 _CLK_ITConfig:
      009C97 88               [ 1]  489 	push	a
                                    490 ;	lib/stm8s_clk.c: 436: switch (CLK_IT)
      009C98 7B 04            [ 1]  491 	ld	a, (0x04, sp)
      009C9A A1 0C            [ 1]  492 	cp	a, #0x0c
      009C9C 26 06            [ 1]  493 	jrne	00135$
      009C9E A6 01            [ 1]  494 	ld	a, #0x01
      009CA0 6B 01            [ 1]  495 	ld	(0x01, sp), a
      009CA2 20 02            [ 2]  496 	jra	00136$
      009CA4                        497 00135$:
      009CA4 0F 01            [ 1]  498 	clr	(0x01, sp)
      009CA6                        499 00136$:
      009CA6 7B 04            [ 1]  500 	ld	a, (0x04, sp)
      009CA8 A1 1C            [ 1]  501 	cp	a, #0x1c
      009CAA 26 03            [ 1]  502 	jrne	00138$
      009CAC A6 01            [ 1]  503 	ld	a, #0x01
      009CAE 21                     504 	.byte 0x21
      009CAF                        505 00138$:
      009CAF 4F               [ 1]  506 	clr	a
      009CB0                        507 00139$:
                                    508 ;	lib/stm8s_clk.c: 434: if (NewState != DISABLE)
      009CB0 0D 05            [ 1]  509 	tnz	(0x05, sp)
      009CB2 27 19            [ 1]  510 	jreq	00110$
                                    511 ;	lib/stm8s_clk.c: 436: switch (CLK_IT)
      009CB4 0D 01            [ 1]  512 	tnz	(0x01, sp)
      009CB6 26 0C            [ 1]  513 	jrne	00102$
      009CB8 4D               [ 1]  514 	tnz	a
      009CB9 27 29            [ 1]  515 	jreq	00112$
                                    516 ;	lib/stm8s_clk.c: 439: CLK->SWCR |= CLK_SWCR_SWIEN;
      009CBB AE 50 C5         [ 2]  517 	ldw	x, #0x50c5
      009CBE F6               [ 1]  518 	ld	a, (x)
      009CBF AA 04            [ 1]  519 	or	a, #0x04
      009CC1 F7               [ 1]  520 	ld	(x), a
                                    521 ;	lib/stm8s_clk.c: 440: break;
      009CC2 20 20            [ 2]  522 	jra	00112$
                                    523 ;	lib/stm8s_clk.c: 441: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      009CC4                        524 00102$:
                                    525 ;	lib/stm8s_clk.c: 442: CLK->CSSR |= CLK_CSSR_CSSDIE;
      009CC4 AE 50 C8         [ 2]  526 	ldw	x, #0x50c8
      009CC7 F6               [ 1]  527 	ld	a, (x)
      009CC8 AA 04            [ 1]  528 	or	a, #0x04
      009CCA F7               [ 1]  529 	ld	(x), a
                                    530 ;	lib/stm8s_clk.c: 443: break;
      009CCB 20 17            [ 2]  531 	jra	00112$
                                    532 ;	lib/stm8s_clk.c: 446: }
      009CCD                        533 00110$:
                                    534 ;	lib/stm8s_clk.c: 450: switch (CLK_IT)
      009CCD 0D 01            [ 1]  535 	tnz	(0x01, sp)
      009CCF 26 0C            [ 1]  536 	jrne	00106$
      009CD1 4D               [ 1]  537 	tnz	a
      009CD2 27 10            [ 1]  538 	jreq	00112$
                                    539 ;	lib/stm8s_clk.c: 453: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      009CD4 AE 50 C5         [ 2]  540 	ldw	x, #0x50c5
      009CD7 F6               [ 1]  541 	ld	a, (x)
      009CD8 A4 FB            [ 1]  542 	and	a, #0xfb
      009CDA F7               [ 1]  543 	ld	(x), a
                                    544 ;	lib/stm8s_clk.c: 454: break;
      009CDB 20 07            [ 2]  545 	jra	00112$
                                    546 ;	lib/stm8s_clk.c: 455: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      009CDD                        547 00106$:
                                    548 ;	lib/stm8s_clk.c: 456: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      009CDD AE 50 C8         [ 2]  549 	ldw	x, #0x50c8
      009CE0 F6               [ 1]  550 	ld	a, (x)
      009CE1 A4 FB            [ 1]  551 	and	a, #0xfb
      009CE3 F7               [ 1]  552 	ld	(x), a
                                    553 ;	lib/stm8s_clk.c: 460: }
      009CE4                        554 00112$:
      009CE4 84               [ 1]  555 	pop	a
      009CE5 81               [ 4]  556 	ret
                                    557 ;	lib/stm8s_clk.c: 469: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    558 ;	-----------------------------------------
                                    559 ;	 function CLK_SYSCLKConfig
                                    560 ;	-----------------------------------------
      009CE6                        561 _CLK_SYSCLKConfig:
      009CE6 89               [ 2]  562 	pushw	x
                                    563 ;	lib/stm8s_clk.c: 472: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      009CE7 0D 05            [ 1]  564 	tnz	(0x05, sp)
      009CE9 2B 19            [ 1]  565 	jrmi	00102$
                                    566 ;	lib/stm8s_clk.c: 474: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      009CEB AE 50 C6         [ 2]  567 	ldw	x, #0x50c6
      009CEE F6               [ 1]  568 	ld	a, (x)
      009CEF A4 E7            [ 1]  569 	and	a, #0xe7
      009CF1 F7               [ 1]  570 	ld	(x), a
                                    571 ;	lib/stm8s_clk.c: 475: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      009CF2 AE 50 C6         [ 2]  572 	ldw	x, #0x50c6
      009CF5 F6               [ 1]  573 	ld	a, (x)
      009CF6 6B 01            [ 1]  574 	ld	(0x01, sp), a
      009CF8 7B 05            [ 1]  575 	ld	a, (0x05, sp)
      009CFA A4 18            [ 1]  576 	and	a, #0x18
      009CFC 1A 01            [ 1]  577 	or	a, (0x01, sp)
      009CFE AE 50 C6         [ 2]  578 	ldw	x, #0x50c6
      009D01 F7               [ 1]  579 	ld	(x), a
      009D02 20 17            [ 2]  580 	jra	00104$
      009D04                        581 00102$:
                                    582 ;	lib/stm8s_clk.c: 479: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      009D04 AE 50 C6         [ 2]  583 	ldw	x, #0x50c6
      009D07 F6               [ 1]  584 	ld	a, (x)
      009D08 A4 F8            [ 1]  585 	and	a, #0xf8
      009D0A F7               [ 1]  586 	ld	(x), a
                                    587 ;	lib/stm8s_clk.c: 480: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      009D0B AE 50 C6         [ 2]  588 	ldw	x, #0x50c6
      009D0E F6               [ 1]  589 	ld	a, (x)
      009D0F 6B 02            [ 1]  590 	ld	(0x02, sp), a
      009D11 7B 05            [ 1]  591 	ld	a, (0x05, sp)
      009D13 A4 07            [ 1]  592 	and	a, #0x07
      009D15 1A 02            [ 1]  593 	or	a, (0x02, sp)
      009D17 AE 50 C6         [ 2]  594 	ldw	x, #0x50c6
      009D1A F7               [ 1]  595 	ld	(x), a
      009D1B                        596 00104$:
      009D1B 85               [ 2]  597 	popw	x
      009D1C 81               [ 4]  598 	ret
                                    599 ;	lib/stm8s_clk.c: 490: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    600 ;	-----------------------------------------
                                    601 ;	 function CLK_SWIMConfig
                                    602 ;	-----------------------------------------
      009D1D                        603 _CLK_SWIMConfig:
                                    604 ;	lib/stm8s_clk.c: 493: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      009D1D 0D 03            [ 1]  605 	tnz	(0x03, sp)
      009D1F 27 05            [ 1]  606 	jreq	00102$
                                    607 ;	lib/stm8s_clk.c: 496: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      009D21 72 10 50 CD      [ 1]  608 	bset	0x50cd, #0
      009D25 81               [ 4]  609 	ret
      009D26                        610 00102$:
                                    611 ;	lib/stm8s_clk.c: 501: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      009D26 72 11 50 CD      [ 1]  612 	bres	0x50cd, #0
      009D2A 81               [ 4]  613 	ret
                                    614 ;	lib/stm8s_clk.c: 512: void CLK_ClockSecuritySystemEnable(void)
                                    615 ;	-----------------------------------------
                                    616 ;	 function CLK_ClockSecuritySystemEnable
                                    617 ;	-----------------------------------------
      009D2B                        618 _CLK_ClockSecuritySystemEnable:
                                    619 ;	lib/stm8s_clk.c: 515: CLK->CSSR |= CLK_CSSR_CSSEN;
      009D2B 72 10 50 C8      [ 1]  620 	bset	0x50c8, #0
      009D2F 81               [ 4]  621 	ret
                                    622 ;	lib/stm8s_clk.c: 524: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    623 ;	-----------------------------------------
                                    624 ;	 function CLK_GetSYSCLKSource
                                    625 ;	-----------------------------------------
      009D30                        626 _CLK_GetSYSCLKSource:
                                    627 ;	lib/stm8s_clk.c: 526: return((CLK_Source_TypeDef)CLK->CMSR);
      009D30 AE 50 C3         [ 2]  628 	ldw	x, #0x50c3
      009D33 F6               [ 1]  629 	ld	a, (x)
      009D34 81               [ 4]  630 	ret
                                    631 ;	lib/stm8s_clk.c: 534: uint32_t CLK_GetClockFreq(void)
                                    632 ;	-----------------------------------------
                                    633 ;	 function CLK_GetClockFreq
                                    634 ;	-----------------------------------------
      009D35                        635 _CLK_GetClockFreq:
      009D35 52 07            [ 2]  636 	sub	sp, #7
                                    637 ;	lib/stm8s_clk.c: 541: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      009D37 AE 50 C3         [ 2]  638 	ldw	x, #0x50c3
      009D3A F6               [ 1]  639 	ld	a, (x)
      009D3B 6B 01            [ 1]  640 	ld	(0x01, sp), a
                                    641 ;	lib/stm8s_clk.c: 543: if (clocksource == CLK_SOURCE_HSI)
      009D3D 7B 01            [ 1]  642 	ld	a, (0x01, sp)
      009D3F A1 E1            [ 1]  643 	cp	a, #0xe1
      009D41 26 2C            [ 1]  644 	jrne	00105$
                                    645 ;	lib/stm8s_clk.c: 545: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      009D43 AE 50 C6         [ 2]  646 	ldw	x, #0x50c6
      009D46 F6               [ 1]  647 	ld	a, (x)
      009D47 A4 18            [ 1]  648 	and	a, #0x18
                                    649 ;	lib/stm8s_clk.c: 546: tmp = (uint8_t)(tmp >> 3);
      009D49 44               [ 1]  650 	srl	a
      009D4A 44               [ 1]  651 	srl	a
      009D4B 44               [ 1]  652 	srl	a
                                    653 ;	lib/stm8s_clk.c: 547: presc = HSIDivFactor[tmp];
      009D4C AE 9E 22         [ 2]  654 	ldw	x, #_HSIDivFactor+0
      009D4F 1F 06            [ 2]  655 	ldw	(0x06, sp), x
      009D51 5F               [ 1]  656 	clrw	x
      009D52 97               [ 1]  657 	ld	xl, a
      009D53 72 FB 06         [ 2]  658 	addw	x, (0x06, sp)
      009D56 F6               [ 1]  659 	ld	a, (x)
                                    660 ;	lib/stm8s_clk.c: 548: clockfrequency = HSI_VALUE / presc;
      009D57 5F               [ 1]  661 	clrw	x
      009D58 97               [ 1]  662 	ld	xl, a
      009D59 90 5F            [ 1]  663 	clrw	y
      009D5B 89               [ 2]  664 	pushw	x
      009D5C 90 89            [ 2]  665 	pushw	y
      009D5E 4B 00            [ 1]  666 	push	#0x00
      009D60 4B 24            [ 1]  667 	push	#0x24
      009D62 4B F4            [ 1]  668 	push	#0xf4
      009D64 4B 00            [ 1]  669 	push	#0x00
      009D66 CD 9F 09         [ 4]  670 	call	__divulong
      009D69 5B 08            [ 2]  671 	addw	sp, #8
      009D6B 1F 04            [ 2]  672 	ldw	(0x04, sp), x
      009D6D 20 1A            [ 2]  673 	jra	00106$
      009D6F                        674 00105$:
                                    675 ;	lib/stm8s_clk.c: 550: else if ( clocksource == CLK_SOURCE_LSI)
      009D6F 7B 01            [ 1]  676 	ld	a, (0x01, sp)
      009D71 A1 D2            [ 1]  677 	cp	a, #0xd2
      009D73 26 0B            [ 1]  678 	jrne	00102$
                                    679 ;	lib/stm8s_clk.c: 552: clockfrequency = LSI_VALUE;
      009D75 AE F4 00         [ 2]  680 	ldw	x, #0xf400
      009D78 1F 04            [ 2]  681 	ldw	(0x04, sp), x
      009D7A 90 AE 00 01      [ 2]  682 	ldw	y, #0x0001
      009D7E 20 09            [ 2]  683 	jra	00106$
      009D80                        684 00102$:
                                    685 ;	lib/stm8s_clk.c: 556: clockfrequency = HSE_VALUE;
      009D80 AE 24 00         [ 2]  686 	ldw	x, #0x2400
      009D83 1F 04            [ 2]  687 	ldw	(0x04, sp), x
      009D85 90 AE 00 F4      [ 2]  688 	ldw	y, #0x00f4
      009D89                        689 00106$:
                                    690 ;	lib/stm8s_clk.c: 559: return((uint32_t)clockfrequency);
      009D89 1E 04            [ 2]  691 	ldw	x, (0x04, sp)
      009D8B 5B 07            [ 2]  692 	addw	sp, #7
      009D8D 81               [ 4]  693 	ret
                                    694 ;	lib/stm8s_clk.c: 569: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    695 ;	-----------------------------------------
                                    696 ;	 function CLK_AdjustHSICalibrationValue
                                    697 ;	-----------------------------------------
      009D8E                        698 _CLK_AdjustHSICalibrationValue:
                                    699 ;	lib/stm8s_clk.c: 573: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      009D8E AE 50 CC         [ 2]  700 	ldw	x, #0x50cc
      009D91 F6               [ 1]  701 	ld	a, (x)
      009D92 A4 F8            [ 1]  702 	and	a, #0xf8
      009D94 1A 03            [ 1]  703 	or	a, (0x03, sp)
      009D96 AE 50 CC         [ 2]  704 	ldw	x, #0x50cc
      009D99 F7               [ 1]  705 	ld	(x), a
      009D9A 81               [ 4]  706 	ret
                                    707 ;	lib/stm8s_clk.c: 585: void CLK_SYSCLKEmergencyClear(void)
                                    708 ;	-----------------------------------------
                                    709 ;	 function CLK_SYSCLKEmergencyClear
                                    710 ;	-----------------------------------------
      009D9B                        711 _CLK_SYSCLKEmergencyClear:
                                    712 ;	lib/stm8s_clk.c: 587: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      009D9B 72 11 50 C5      [ 1]  713 	bres	0x50c5, #0
      009D9F 81               [ 4]  714 	ret
                                    715 ;	lib/stm8s_clk.c: 597: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    716 ;	-----------------------------------------
                                    717 ;	 function CLK_GetFlagStatus
                                    718 ;	-----------------------------------------
      009DA0                        719 _CLK_GetFlagStatus:
      009DA0 88               [ 1]  720 	push	a
                                    721 ;	lib/stm8s_clk.c: 604: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      009DA1 4F               [ 1]  722 	clr	a
      009DA2 97               [ 1]  723 	ld	xl, a
      009DA3 7B 04            [ 1]  724 	ld	a, (0x04, sp)
      009DA5 95               [ 1]  725 	ld	xh, a
                                    726 ;	lib/stm8s_clk.c: 607: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      009DA6 A3 01 00         [ 2]  727 	cpw	x, #0x0100
      009DA9 26 06            [ 1]  728 	jrne	00111$
                                    729 ;	lib/stm8s_clk.c: 609: tmpreg = CLK->ICKR;
      009DAB AE 50 C0         [ 2]  730 	ldw	x, #0x50c0
      009DAE F6               [ 1]  731 	ld	a, (x)
      009DAF 20 25            [ 2]  732 	jra	00112$
      009DB1                        733 00111$:
                                    734 ;	lib/stm8s_clk.c: 611: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      009DB1 A3 02 00         [ 2]  735 	cpw	x, #0x0200
      009DB4 26 06            [ 1]  736 	jrne	00108$
                                    737 ;	lib/stm8s_clk.c: 613: tmpreg = CLK->ECKR;
      009DB6 AE 50 C1         [ 2]  738 	ldw	x, #0x50c1
      009DB9 F6               [ 1]  739 	ld	a, (x)
      009DBA 20 1A            [ 2]  740 	jra	00112$
      009DBC                        741 00108$:
                                    742 ;	lib/stm8s_clk.c: 615: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      009DBC A3 03 00         [ 2]  743 	cpw	x, #0x0300
      009DBF 26 06            [ 1]  744 	jrne	00105$
                                    745 ;	lib/stm8s_clk.c: 617: tmpreg = CLK->SWCR;
      009DC1 AE 50 C5         [ 2]  746 	ldw	x, #0x50c5
      009DC4 F6               [ 1]  747 	ld	a, (x)
      009DC5 20 0F            [ 2]  748 	jra	00112$
      009DC7                        749 00105$:
                                    750 ;	lib/stm8s_clk.c: 619: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      009DC7 A3 04 00         [ 2]  751 	cpw	x, #0x0400
      009DCA 26 06            [ 1]  752 	jrne	00102$
                                    753 ;	lib/stm8s_clk.c: 621: tmpreg = CLK->CSSR;
      009DCC AE 50 C8         [ 2]  754 	ldw	x, #0x50c8
      009DCF F6               [ 1]  755 	ld	a, (x)
      009DD0 20 04            [ 2]  756 	jra	00112$
      009DD2                        757 00102$:
                                    758 ;	lib/stm8s_clk.c: 625: tmpreg = CLK->CCOR;
      009DD2 AE 50 C9         [ 2]  759 	ldw	x, #0x50c9
      009DD5 F6               [ 1]  760 	ld	a, (x)
      009DD6                        761 00112$:
                                    762 ;	lib/stm8s_clk.c: 628: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      009DD6 88               [ 1]  763 	push	a
      009DD7 7B 06            [ 1]  764 	ld	a, (0x06, sp)
      009DD9 6B 02            [ 1]  765 	ld	(0x02, sp), a
      009DDB 84               [ 1]  766 	pop	a
      009DDC 14 01            [ 1]  767 	and	a, (0x01, sp)
      009DDE 4D               [ 1]  768 	tnz	a
      009DDF 27 03            [ 1]  769 	jreq	00114$
                                    770 ;	lib/stm8s_clk.c: 630: bitstatus = SET;
      009DE1 A6 01            [ 1]  771 	ld	a, #0x01
                                    772 ;	lib/stm8s_clk.c: 634: bitstatus = RESET;
      009DE3 21                     773 	.byte 0x21
      009DE4                        774 00114$:
      009DE4 4F               [ 1]  775 	clr	a
      009DE5                        776 00115$:
                                    777 ;	lib/stm8s_clk.c: 638: return((FlagStatus)bitstatus);
      009DE5 5B 01            [ 2]  778 	addw	sp, #1
      009DE7 81               [ 4]  779 	ret
                                    780 ;	lib/stm8s_clk.c: 647: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    781 ;	-----------------------------------------
                                    782 ;	 function CLK_GetITStatus
                                    783 ;	-----------------------------------------
      009DE8                        784 _CLK_GetITStatus:
                                    785 ;	lib/stm8s_clk.c: 651: if (CLK_IT == CLK_IT_SWIF)
      009DE8 7B 03            [ 1]  786 	ld	a, (0x03, sp)
      009DEA A1 1C            [ 1]  787 	cp	a, #0x1c
      009DEC 26 0F            [ 1]  788 	jrne	00108$
                                    789 ;	lib/stm8s_clk.c: 654: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      009DEE AE 50 C5         [ 2]  790 	ldw	x, #0x50c5
      009DF1 F6               [ 1]  791 	ld	a, (x)
      009DF2 14 03            [ 1]  792 	and	a, (0x03, sp)
      009DF4 A1 0C            [ 1]  793 	cp	a, #0x0c
      009DF6 26 03            [ 1]  794 	jrne	00102$
                                    795 ;	lib/stm8s_clk.c: 656: bitstatus = SET;
      009DF8 A6 01            [ 1]  796 	ld	a, #0x01
      009DFA 81               [ 4]  797 	ret
      009DFB                        798 00102$:
                                    799 ;	lib/stm8s_clk.c: 660: bitstatus = RESET;
      009DFB 4F               [ 1]  800 	clr	a
      009DFC 81               [ 4]  801 	ret
      009DFD                        802 00108$:
                                    803 ;	lib/stm8s_clk.c: 666: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      009DFD AE 50 C8         [ 2]  804 	ldw	x, #0x50c8
      009E00 F6               [ 1]  805 	ld	a, (x)
      009E01 14 03            [ 1]  806 	and	a, (0x03, sp)
      009E03 A1 0C            [ 1]  807 	cp	a, #0x0c
      009E05 26 03            [ 1]  808 	jrne	00105$
                                    809 ;	lib/stm8s_clk.c: 668: bitstatus = SET;
      009E07 A6 01            [ 1]  810 	ld	a, #0x01
      009E09 81               [ 4]  811 	ret
      009E0A                        812 00105$:
                                    813 ;	lib/stm8s_clk.c: 672: bitstatus = RESET;
      009E0A 4F               [ 1]  814 	clr	a
                                    815 ;	lib/stm8s_clk.c: 677: return bitstatus;
      009E0B 81               [ 4]  816 	ret
                                    817 ;	lib/stm8s_clk.c: 686: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    818 ;	-----------------------------------------
                                    819 ;	 function CLK_ClearITPendingBit
                                    820 ;	-----------------------------------------
      009E0C                        821 _CLK_ClearITPendingBit:
                                    822 ;	lib/stm8s_clk.c: 689: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      009E0C 7B 03            [ 1]  823 	ld	a, (0x03, sp)
      009E0E A1 0C            [ 1]  824 	cp	a, #0x0c
      009E10 26 08            [ 1]  825 	jrne	00102$
                                    826 ;	lib/stm8s_clk.c: 692: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      009E12 AE 50 C8         [ 2]  827 	ldw	x, #0x50c8
      009E15 F6               [ 1]  828 	ld	a, (x)
      009E16 A4 F7            [ 1]  829 	and	a, #0xf7
      009E18 F7               [ 1]  830 	ld	(x), a
      009E19 81               [ 4]  831 	ret
      009E1A                        832 00102$:
                                    833 ;	lib/stm8s_clk.c: 697: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      009E1A AE 50 C5         [ 2]  834 	ldw	x, #0x50c5
      009E1D F6               [ 1]  835 	ld	a, (x)
      009E1E A4 F7            [ 1]  836 	and	a, #0xf7
      009E20 F7               [ 1]  837 	ld	(x), a
      009E21 81               [ 4]  838 	ret
                                    839 	.area CODE
      009E22                        840 _HSIDivFactor:
      009E22 01                     841 	.db #0x01	; 1
      009E23 02                     842 	.db #0x02	; 2
      009E24 04                     843 	.db #0x04	; 4
      009E25 08                     844 	.db #0x08	; 8
      009E26                        845 _CLKPrescTable:
      009E26 01                     846 	.db #0x01	; 1
      009E27 02                     847 	.db #0x02	; 2
      009E28 04                     848 	.db #0x04	; 4
      009E29 08                     849 	.db #0x08	; 8
      009E2A 0A                     850 	.db #0x0a	; 10
      009E2B 10                     851 	.db #0x10	; 16
      009E2C 14                     852 	.db #0x14	; 20
      009E2D 28                     853 	.db #0x28	; 40
                                    854 	.area INITIALIZER
                                    855 	.area CABS (ABS)
