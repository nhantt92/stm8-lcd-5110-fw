                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _TIM4_UPD_OVF_IRQHandler
                                     13 	.globl _delay
                                     14 	.globl _clock_setup
                                     15 	.globl _LcdPixel
                                     16 	.globl _LcdGotoXYFont
                                     17 	.globl _LcdInit
                                     18 	.globl _TIMER_InitTime
                                     19 	.globl _TIMER_Inc
                                     20 	.globl _TIMER_Init
                                     21 	.globl _TIM4_ClearITPendingBit
                                     22 	.globl _IWDG_Enable
                                     23 	.globl _IWDG_ReloadCounter
                                     24 	.globl _IWDG_SetReload
                                     25 	.globl _IWDG_SetPrescaler
                                     26 	.globl _IWDG_WriteAccessCmd
                                     27 	.globl _GPIO_Init
                                     28 	.globl _CLK_GetFlagStatus
                                     29 	.globl _CLK_SYSCLKConfig
                                     30 	.globl _CLK_HSIPrescalerConfig
                                     31 	.globl _CLK_ClockSwitchConfig
                                     32 	.globl _CLK_PeripheralClockConfig
                                     33 	.globl _CLK_ClockSwitchCmd
                                     34 	.globl _CLK_LSICmd
                                     35 	.globl _CLK_HSICmd
                                     36 	.globl _CLK_HSECmd
                                     37 	.globl _CLK_DeInit
                                     38 	.globl _tick
                                     39 	.globl _IWDG_Config
                                     40 ;--------------------------------------------------------
                                     41 ; ram data
                                     42 ;--------------------------------------------------------
                                     43 	.area DATA
      0001FF                         44 _tick::
      0001FF                         45 	.ds 6
                                     46 ;--------------------------------------------------------
                                     47 ; ram data
                                     48 ;--------------------------------------------------------
                                     49 	.area INITIALIZED
                                     50 ;--------------------------------------------------------
                                     51 ; Stack segment in internal ram 
                                     52 ;--------------------------------------------------------
                                     53 	.area	SSEG
      009C29                         54 __start__stack:
      009C29                         55 	.ds	1
                                     56 
                                     57 ;--------------------------------------------------------
                                     58 ; absolute external ram data
                                     59 ;--------------------------------------------------------
                                     60 	.area DABS (ABS)
                                     61 ;--------------------------------------------------------
                                     62 ; interrupt vector 
                                     63 ;--------------------------------------------------------
                                     64 	.area HOME
      008000                         65 __interrupt_vect:
      008000 82 00 80 83             66 	int s_GSINIT ;reset
      008004 82 00 00 00             67 	int 0x0000 ;trap
      008008 82 00 00 00             68 	int 0x0000 ;int0
      00800C 82 00 00 00             69 	int 0x0000 ;int1
      008010 82 00 00 00             70 	int 0x0000 ;int2
      008014 82 00 00 00             71 	int 0x0000 ;int3
      008018 82 00 00 00             72 	int 0x0000 ;int4
      00801C 82 00 00 00             73 	int 0x0000 ;int5
      008020 82 00 00 00             74 	int 0x0000 ;int6
      008024 82 00 00 00             75 	int 0x0000 ;int7
      008028 82 00 00 00             76 	int 0x0000 ;int8
      00802C 82 00 00 00             77 	int 0x0000 ;int9
      008030 82 00 00 00             78 	int 0x0000 ;int10
      008034 82 00 00 00             79 	int 0x0000 ;int11
      008038 82 00 00 00             80 	int 0x0000 ;int12
      00803C 82 00 00 00             81 	int 0x0000 ;int13
      008040 82 00 00 00             82 	int 0x0000 ;int14
      008044 82 00 00 00             83 	int 0x0000 ;int15
      008048 82 00 00 00             84 	int 0x0000 ;int16
      00804C 82 00 00 00             85 	int 0x0000 ;int17
      008050 82 00 00 00             86 	int 0x0000 ;int18
      008054 82 00 00 00             87 	int 0x0000 ;int19
      008058 82 00 00 00             88 	int 0x0000 ;int20
      00805C 82 00 00 00             89 	int 0x0000 ;int21
      008060 82 00 00 00             90 	int 0x0000 ;int22
      008064 82 00 8B BA             91 	int _TIM4_UPD_OVF_IRQHandler ;int23
      008068 82 00 00 00             92 	int 0x0000 ;int24
      00806C 82 00 00 00             93 	int 0x0000 ;int25
      008070 82 00 00 00             94 	int 0x0000 ;int26
      008074 82 00 00 00             95 	int 0x0000 ;int27
      008078 82 00 00 00             96 	int 0x0000 ;int28
      00807C 82 00 00 00             97 	int 0x0000 ;int29
                                     98 ;--------------------------------------------------------
                                     99 ; global & static initialisations
                                    100 ;--------------------------------------------------------
                                    101 	.area HOME
                                    102 	.area GSINIT
                                    103 	.area GSFINAL
                                    104 	.area GSINIT
      008083                        105 __sdcc_gs_init_startup:
      008083                        106 __sdcc_init_data:
                                    107 ; stm8_genXINIT() start
      008083 AE 02 0D         [ 2]  108 	ldw x, #l_DATA
      008086 27 07            [ 1]  109 	jreq	00002$
      008088                        110 00001$:
      008088 72 4F 00 00      [ 1]  111 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  112 	decw x
      00808D 26 F9            [ 1]  113 	jrne	00001$
      00808F                        114 00002$:
      00808F AE 00 00         [ 2]  115 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  116 	jreq	00004$
      008094                        117 00003$:
      008094 D6 9C 28         [ 1]  118 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 02 0D         [ 1]  119 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  120 	decw	x
      00809B 26 F7            [ 1]  121 	jrne	00003$
      00809D                        122 00004$:
                                    123 ; stm8_genXINIT() end
                                    124 	.area GSFINAL
      00809D CC 80 80         [ 2]  125 	jp	__sdcc_program_startup
                                    126 ;--------------------------------------------------------
                                    127 ; Home
                                    128 ;--------------------------------------------------------
                                    129 	.area HOME
                                    130 	.area HOME
      008080                        131 __sdcc_program_startup:
      008080 CC 8B E0         [ 2]  132 	jp	_main
                                    133 ;	return from main will return to caller
                                    134 ;--------------------------------------------------------
                                    135 ; code
                                    136 ;--------------------------------------------------------
                                    137 	.area CODE
                                    138 ;	user/main.c: 26: void clock_setup(void)
                                    139 ;	-----------------------------------------
                                    140 ;	 function clock_setup
                                    141 ;	-----------------------------------------
      008B13                        142 _clock_setup:
                                    143 ;	user/main.c: 28: CLK_DeInit();
      008B13 CD 95 53         [ 4]  144 	call	_CLK_DeInit
                                    145 ;	user/main.c: 29: CLK_HSECmd(DISABLE);
      008B16 4B 00            [ 1]  146 	push	#0x00
      008B18 CD 95 9F         [ 4]  147 	call	_CLK_HSECmd
      008B1B 84               [ 1]  148 	pop	a
                                    149 ;	user/main.c: 30: CLK_LSICmd(DISABLE);
      008B1C 4B 00            [ 1]  150 	push	#0x00
      008B1E CD 95 BB         [ 4]  151 	call	_CLK_LSICmd
      008B21 84               [ 1]  152 	pop	a
                                    153 ;	user/main.c: 31: CLK_HSICmd(ENABLE);
      008B22 4B 01            [ 1]  154 	push	#0x01
      008B24 CD 95 AD         [ 4]  155 	call	_CLK_HSICmd
      008B27 84               [ 1]  156 	pop	a
                                    157 ;	user/main.c: 32: while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
      008B28                        158 00101$:
      008B28 4B 02            [ 1]  159 	push	#0x02
      008B2A 4B 01            [ 1]  160 	push	#0x01
      008B2C CD 98 51         [ 4]  161 	call	_CLK_GetFlagStatus
      008B2F 85               [ 2]  162 	popw	x
      008B30 4D               [ 1]  163 	tnz	a
      008B31 27 F5            [ 1]  164 	jreq	00101$
                                    165 ;	user/main.c: 33: CLK_ClockSwitchCmd(ENABLE);
      008B33 4B 01            [ 1]  166 	push	#0x01
      008B35 CD 95 DD         [ 4]  167 	call	_CLK_ClockSwitchCmd
      008B38 84               [ 1]  168 	pop	a
                                    169 ;	user/main.c: 34: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);
      008B39 4B 18            [ 1]  170 	push	#0x18
      008B3B CD 97 20         [ 4]  171 	call	_CLK_HSIPrescalerConfig
      008B3E 84               [ 1]  172 	pop	a
                                    173 ;	user/main.c: 35: CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);
      008B3F 4B 81            [ 1]  174 	push	#0x81
      008B41 CD 97 97         [ 4]  175 	call	_CLK_SYSCLKConfig
      008B44 84               [ 1]  176 	pop	a
                                    177 ;	user/main.c: 36: CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
      008B45 4B 01            [ 1]  178 	push	#0x01
      008B47 4B 00            [ 1]  179 	push	#0x00
      008B49 4B E1            [ 1]  180 	push	#0xe1
      008B4B 4B 01            [ 1]  181 	push	#0x01
      008B4D CD 96 5B         [ 4]  182 	call	_CLK_ClockSwitchConfig
      008B50 5B 04            [ 2]  183 	addw	sp, #4
                                    184 ;	user/main.c: 37: CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
      008B52 4B 00            [ 1]  185 	push	#0x00
      008B54 4B 01            [ 1]  186 	push	#0x01
      008B56 CD 96 05         [ 4]  187 	call	_CLK_PeripheralClockConfig
      008B59 85               [ 2]  188 	popw	x
                                    189 ;	user/main.c: 38: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
      008B5A 4B 01            [ 1]  190 	push	#0x01
      008B5C 4B 00            [ 1]  191 	push	#0x00
      008B5E CD 96 05         [ 4]  192 	call	_CLK_PeripheralClockConfig
      008B61 85               [ 2]  193 	popw	x
                                    194 ;	user/main.c: 39: CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
      008B62 4B 00            [ 1]  195 	push	#0x00
      008B64 4B 13            [ 1]  196 	push	#0x13
      008B66 CD 96 05         [ 4]  197 	call	_CLK_PeripheralClockConfig
      008B69 85               [ 2]  198 	popw	x
                                    199 ;	user/main.c: 40: CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
      008B6A 4B 00            [ 1]  200 	push	#0x00
      008B6C 4B 12            [ 1]  201 	push	#0x12
      008B6E CD 96 05         [ 4]  202 	call	_CLK_PeripheralClockConfig
      008B71 85               [ 2]  203 	popw	x
                                    204 ;	user/main.c: 41: CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
      008B72 4B 00            [ 1]  205 	push	#0x00
      008B74 4B 03            [ 1]  206 	push	#0x03
      008B76 CD 96 05         [ 4]  207 	call	_CLK_PeripheralClockConfig
      008B79 85               [ 2]  208 	popw	x
                                    209 ;	user/main.c: 42: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
      008B7A 4B 00            [ 1]  210 	push	#0x00
      008B7C 4B 07            [ 1]  211 	push	#0x07
      008B7E CD 96 05         [ 4]  212 	call	_CLK_PeripheralClockConfig
      008B81 85               [ 2]  213 	popw	x
                                    214 ;	user/main.c: 43: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
      008B82 4B 00            [ 1]  215 	push	#0x00
      008B84 4B 05            [ 1]  216 	push	#0x05
      008B86 CD 96 05         [ 4]  217 	call	_CLK_PeripheralClockConfig
      008B89 85               [ 2]  218 	popw	x
                                    219 ;	user/main.c: 44: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
      008B8A 4B 01            [ 1]  220 	push	#0x01
      008B8C 4B 04            [ 1]  221 	push	#0x04
      008B8E CD 96 05         [ 4]  222 	call	_CLK_PeripheralClockConfig
      008B91 85               [ 2]  223 	popw	x
      008B92 81               [ 4]  224 	ret
                                    225 ;	user/main.c: 47: static void GPIO_Config(void)
                                    226 ;	-----------------------------------------
                                    227 ;	 function GPIO_Config
                                    228 ;	-----------------------------------------
      008B93                        229 _GPIO_Config:
                                    230 ;	user/main.c: 49: GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_IN_PU_NO_IT);
      008B93 4B 40            [ 1]  231 	push	#0x40
      008B95 4B 10            [ 1]  232 	push	#0x10
      008B97 4B 05            [ 1]  233 	push	#0x05
      008B99 4B 50            [ 1]  234 	push	#0x50
      008B9B CD 98 DF         [ 4]  235 	call	_GPIO_Init
      008B9E 5B 04            [ 2]  236 	addw	sp, #4
                                    237 ;	user/main.c: 50: GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_IN_PU_NO_IT);
      008BA0 4B 40            [ 1]  238 	push	#0x40
      008BA2 4B 20            [ 1]  239 	push	#0x20
      008BA4 4B 05            [ 1]  240 	push	#0x05
      008BA6 4B 50            [ 1]  241 	push	#0x50
      008BA8 CD 98 DF         [ 4]  242 	call	_GPIO_Init
      008BAB 5B 04            [ 2]  243 	addw	sp, #4
      008BAD 81               [ 4]  244 	ret
                                    245 ;	user/main.c: 53: void delay(uint16_t x)
                                    246 ;	-----------------------------------------
                                    247 ;	 function delay
                                    248 ;	-----------------------------------------
      008BAE                        249 _delay:
      008BAE 89               [ 2]  250 	pushw	x
                                    251 ;	user/main.c: 55: while(x--);
      008BAF 1E 05            [ 2]  252 	ldw	x, (0x05, sp)
      008BB1                        253 00101$:
      008BB1 1F 01            [ 2]  254 	ldw	(0x01, sp), x
      008BB3 5A               [ 2]  255 	decw	x
      008BB4 16 01            [ 2]  256 	ldw	y, (0x01, sp)
      008BB6 26 F9            [ 1]  257 	jrne	00101$
      008BB8 85               [ 2]  258 	popw	x
      008BB9 81               [ 4]  259 	ret
                                    260 ;	user/main.c: 58: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    261 ;	-----------------------------------------
                                    262 ;	 function TIM4_UPD_OVF_IRQHandler
                                    263 ;	-----------------------------------------
      008BBA                        264 _TIM4_UPD_OVF_IRQHandler:
      008BBA 62               [ 2]  265 	div	x, a
                                    266 ;	user/main.c: 60: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
      008BBB 4B 01            [ 1]  267 	push	#0x01
      008BBD CD 9B A6         [ 4]  268 	call	_TIM4_ClearITPendingBit
      008BC0 84               [ 1]  269 	pop	a
                                    270 ;	user/main.c: 61: TIMER_Inc();
      008BC1 CD 94 5A         [ 4]  271 	call	_TIMER_Inc
                                    272 ;	user/main.c: 62: IWDG_ReloadCounter();
      008BC4 CD 99 CF         [ 4]  273 	call	_IWDG_ReloadCounter
      008BC7 80               [11]  274 	iret
                                    275 ;	user/main.c: 65: void IWDG_Config(void)
                                    276 ;	-----------------------------------------
                                    277 ;	 function IWDG_Config
                                    278 ;	-----------------------------------------
      008BC8                        279 _IWDG_Config:
                                    280 ;	user/main.c: 69: IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
      008BC8 4B 55            [ 1]  281 	push	#0x55
      008BCA CD 99 BA         [ 4]  282 	call	_IWDG_WriteAccessCmd
      008BCD 84               [ 1]  283 	pop	a
                                    284 ;	user/main.c: 71: IWDG_SetPrescaler(IWDG_Prescaler_256);
      008BCE 4B 06            [ 1]  285 	push	#0x06
      008BD0 CD 99 C1         [ 4]  286 	call	_IWDG_SetPrescaler
      008BD3 84               [ 1]  287 	pop	a
                                    288 ;	user/main.c: 75: IWDG_SetReload(250);
      008BD4 4B FA            [ 1]  289 	push	#0xfa
      008BD6 CD 99 C8         [ 4]  290 	call	_IWDG_SetReload
      008BD9 84               [ 1]  291 	pop	a
                                    292 ;	user/main.c: 77: IWDG_ReloadCounter();
      008BDA CD 99 CF         [ 4]  293 	call	_IWDG_ReloadCounter
                                    294 ;	user/main.c: 79: IWDG_Enable();
      008BDD CC 99 D4         [ 2]  295 	jp	_IWDG_Enable
                                    296 ;	user/main.c: 82: void main() 
                                    297 ;	-----------------------------------------
                                    298 ;	 function main
                                    299 ;	-----------------------------------------
      008BE0                        300 _main:
                                    301 ;	user/main.c: 84: clock_setup();
      008BE0 CD 8B 13         [ 4]  302 	call	_clock_setup
                                    303 ;	user/main.c: 85: GPIO_Config();
      008BE3 CD 8B 93         [ 4]  304 	call	_GPIO_Config
                                    305 ;	user/main.c: 87: TIMER_Init();
      008BE6 CD 94 27         [ 4]  306 	call	_TIMER_Init
                                    307 ;	user/main.c: 88: IWDG_Config();
      008BE9 CD 8B C8         [ 4]  308 	call	_IWDG_Config
                                    309 ;	user/main.c: 89: LcdInit();
      008BEC CD 80 A0         [ 4]  310 	call	_LcdInit
                                    311 ;	user/main.c: 90: enableInterrupts();
      008BEF 9A               [ 1]  312 	rim
                                    313 ;	user/main.c: 91: TIMER_InitTime(&tick);
      008BF0 AE 01 FF         [ 2]  314 	ldw	x, #_tick+0
      008BF3 89               [ 2]  315 	pushw	x
      008BF4 CD 94 86         [ 4]  316 	call	_TIMER_InitTime
      008BF7 85               [ 2]  317 	popw	x
                                    318 ;	user/main.c: 92: LcdGotoXYFont(1,1);
      008BF8 4B 01            [ 1]  319 	push	#0x01
      008BFA 4B 01            [ 1]  320 	push	#0x01
      008BFC CD 82 55         [ 4]  321 	call	_LcdGotoXYFont
      008BFF 85               [ 2]  322 	popw	x
                                    323 ;	user/main.c: 93: LcdPixel(1,1, PIXEL_ON);
      008C00 4B 01            [ 1]  324 	push	#0x01
      008C02 4B 01            [ 1]  325 	push	#0x01
      008C04 4B 01            [ 1]  326 	push	#0x01
      008C06 CD 82 7D         [ 4]  327 	call	_LcdPixel
      008C09 5B 03            [ 2]  328 	addw	sp, #3
                                    329 ;	user/main.c: 94: LcdPixel(2,1, PIXEL_ON);
      008C0B 4B 01            [ 1]  330 	push	#0x01
      008C0D 4B 01            [ 1]  331 	push	#0x01
      008C0F 4B 02            [ 1]  332 	push	#0x02
      008C11 CD 82 7D         [ 4]  333 	call	_LcdPixel
      008C14 5B 03            [ 2]  334 	addw	sp, #3
                                    335 ;	user/main.c: 95: LcdPixel(3,1, PIXEL_ON);
      008C16 4B 01            [ 1]  336 	push	#0x01
      008C18 4B 01            [ 1]  337 	push	#0x01
      008C1A 4B 03            [ 1]  338 	push	#0x03
      008C1C CD 82 7D         [ 4]  339 	call	_LcdPixel
      008C1F 5B 03            [ 2]  340 	addw	sp, #3
                                    341 ;	user/main.c: 96: LcdPixel(4,1, PIXEL_ON);
      008C21 4B 01            [ 1]  342 	push	#0x01
      008C23 4B 01            [ 1]  343 	push	#0x01
      008C25 4B 04            [ 1]  344 	push	#0x04
      008C27 CD 82 7D         [ 4]  345 	call	_LcdPixel
      008C2A 5B 03            [ 2]  346 	addw	sp, #3
                                    347 ;	user/main.c: 97: while(TRUE) 
      008C2C                        348 00102$:
      008C2C 20 FE            [ 2]  349 	jra	00102$
      008C2E 81               [ 4]  350 	ret
                                    351 	.area CODE
      008C2F                        352 _FontLookup:
      008C2F 00                     353 	.db #0x00	; 0
      008C30 00                     354 	.db #0x00	; 0
      008C31 00                     355 	.db #0x00	; 0
      008C32 00                     356 	.db #0x00	; 0
      008C33 00                     357 	.db #0x00	; 0
      008C34 00                     358 	.db #0x00	; 0
      008C35 00                     359 	.db #0x00	; 0
      008C36 5F                     360 	.db #0x5f	; 95
      008C37 00                     361 	.db #0x00	; 0
      008C38 00                     362 	.db #0x00	; 0
      008C39 00                     363 	.db #0x00	; 0
      008C3A 07                     364 	.db #0x07	; 7
      008C3B 00                     365 	.db #0x00	; 0
      008C3C 07                     366 	.db #0x07	; 7
      008C3D 00                     367 	.db #0x00	; 0
      008C3E 14                     368 	.db #0x14	; 20
      008C3F 7F                     369 	.db #0x7f	; 127
      008C40 14                     370 	.db #0x14	; 20
      008C41 7F                     371 	.db #0x7f	; 127
      008C42 14                     372 	.db #0x14	; 20
      008C43 24                     373 	.db #0x24	; 36
      008C44 2A                     374 	.db #0x2a	; 42
      008C45 7F                     375 	.db #0x7f	; 127
      008C46 2A                     376 	.db #0x2a	; 42
      008C47 12                     377 	.db #0x12	; 18
      008C48 4C                     378 	.db #0x4c	; 76	'L'
      008C49 2C                     379 	.db #0x2c	; 44
      008C4A 10                     380 	.db #0x10	; 16
      008C4B 68                     381 	.db #0x68	; 104	'h'
      008C4C 64                     382 	.db #0x64	; 100	'd'
      008C4D 36                     383 	.db #0x36	; 54	'6'
      008C4E 49                     384 	.db #0x49	; 73	'I'
      008C4F 55                     385 	.db #0x55	; 85	'U'
      008C50 22                     386 	.db #0x22	; 34
      008C51 50                     387 	.db #0x50	; 80	'P'
      008C52 00                     388 	.db #0x00	; 0
      008C53 05                     389 	.db #0x05	; 5
      008C54 03                     390 	.db #0x03	; 3
      008C55 00                     391 	.db #0x00	; 0
      008C56 00                     392 	.db #0x00	; 0
      008C57 00                     393 	.db #0x00	; 0
      008C58 1C                     394 	.db #0x1c	; 28
      008C59 22                     395 	.db #0x22	; 34
      008C5A 41                     396 	.db #0x41	; 65	'A'
      008C5B 00                     397 	.db #0x00	; 0
      008C5C 00                     398 	.db #0x00	; 0
      008C5D 41                     399 	.db #0x41	; 65	'A'
      008C5E 22                     400 	.db #0x22	; 34
      008C5F 1C                     401 	.db #0x1c	; 28
      008C60 00                     402 	.db #0x00	; 0
      008C61 14                     403 	.db #0x14	; 20
      008C62 08                     404 	.db #0x08	; 8
      008C63 3E                     405 	.db #0x3e	; 62
      008C64 08                     406 	.db #0x08	; 8
      008C65 14                     407 	.db #0x14	; 20
      008C66 08                     408 	.db #0x08	; 8
      008C67 08                     409 	.db #0x08	; 8
      008C68 3E                     410 	.db #0x3e	; 62
      008C69 08                     411 	.db #0x08	; 8
      008C6A 08                     412 	.db #0x08	; 8
      008C6B 00                     413 	.db #0x00	; 0
      008C6C 00                     414 	.db #0x00	; 0
      008C6D 50                     415 	.db #0x50	; 80	'P'
      008C6E 30                     416 	.db #0x30	; 48	'0'
      008C6F 00                     417 	.db #0x00	; 0
      008C70 10                     418 	.db #0x10	; 16
      008C71 10                     419 	.db #0x10	; 16
      008C72 10                     420 	.db #0x10	; 16
      008C73 10                     421 	.db #0x10	; 16
      008C74 10                     422 	.db #0x10	; 16
      008C75 00                     423 	.db #0x00	; 0
      008C76 60                     424 	.db #0x60	; 96
      008C77 60                     425 	.db #0x60	; 96
      008C78 00                     426 	.db #0x00	; 0
      008C79 00                     427 	.db #0x00	; 0
      008C7A 20                     428 	.db #0x20	; 32
      008C7B 10                     429 	.db #0x10	; 16
      008C7C 08                     430 	.db #0x08	; 8
      008C7D 04                     431 	.db #0x04	; 4
      008C7E 02                     432 	.db #0x02	; 2
      008C7F 3E                     433 	.db #0x3e	; 62
      008C80 51                     434 	.db #0x51	; 81	'Q'
      008C81 49                     435 	.db #0x49	; 73	'I'
      008C82 45                     436 	.db #0x45	; 69	'E'
      008C83 3E                     437 	.db #0x3e	; 62
      008C84 00                     438 	.db #0x00	; 0
      008C85 42                     439 	.db #0x42	; 66	'B'
      008C86 7F                     440 	.db #0x7f	; 127
      008C87 40                     441 	.db #0x40	; 64
      008C88 00                     442 	.db #0x00	; 0
      008C89 42                     443 	.db #0x42	; 66	'B'
      008C8A 61                     444 	.db #0x61	; 97	'a'
      008C8B 51                     445 	.db #0x51	; 81	'Q'
      008C8C 49                     446 	.db #0x49	; 73	'I'
      008C8D 46                     447 	.db #0x46	; 70	'F'
      008C8E 21                     448 	.db #0x21	; 33
      008C8F 41                     449 	.db #0x41	; 65	'A'
      008C90 45                     450 	.db #0x45	; 69	'E'
      008C91 4B                     451 	.db #0x4b	; 75	'K'
      008C92 31                     452 	.db #0x31	; 49	'1'
      008C93 18                     453 	.db #0x18	; 24
      008C94 14                     454 	.db #0x14	; 20
      008C95 12                     455 	.db #0x12	; 18
      008C96 7F                     456 	.db #0x7f	; 127
      008C97 10                     457 	.db #0x10	; 16
      008C98 27                     458 	.db #0x27	; 39
      008C99 45                     459 	.db #0x45	; 69	'E'
      008C9A 45                     460 	.db #0x45	; 69	'E'
      008C9B 45                     461 	.db #0x45	; 69	'E'
      008C9C 39                     462 	.db #0x39	; 57	'9'
      008C9D 3C                     463 	.db #0x3c	; 60
      008C9E 4A                     464 	.db #0x4a	; 74	'J'
      008C9F 49                     465 	.db #0x49	; 73	'I'
      008CA0 49                     466 	.db #0x49	; 73	'I'
      008CA1 30                     467 	.db #0x30	; 48	'0'
      008CA2 01                     468 	.db #0x01	; 1
      008CA3 71                     469 	.db #0x71	; 113	'q'
      008CA4 09                     470 	.db #0x09	; 9
      008CA5 05                     471 	.db #0x05	; 5
      008CA6 03                     472 	.db #0x03	; 3
      008CA7 36                     473 	.db #0x36	; 54	'6'
      008CA8 49                     474 	.db #0x49	; 73	'I'
      008CA9 49                     475 	.db #0x49	; 73	'I'
      008CAA 49                     476 	.db #0x49	; 73	'I'
      008CAB 36                     477 	.db #0x36	; 54	'6'
      008CAC 06                     478 	.db #0x06	; 6
      008CAD 49                     479 	.db #0x49	; 73	'I'
      008CAE 49                     480 	.db #0x49	; 73	'I'
      008CAF 29                     481 	.db #0x29	; 41
      008CB0 1E                     482 	.db #0x1e	; 30
      008CB1 00                     483 	.db #0x00	; 0
      008CB2 36                     484 	.db #0x36	; 54	'6'
      008CB3 36                     485 	.db #0x36	; 54	'6'
      008CB4 00                     486 	.db #0x00	; 0
      008CB5 00                     487 	.db #0x00	; 0
      008CB6 00                     488 	.db #0x00	; 0
      008CB7 56                     489 	.db #0x56	; 86	'V'
      008CB8 36                     490 	.db #0x36	; 54	'6'
      008CB9 00                     491 	.db #0x00	; 0
      008CBA 00                     492 	.db #0x00	; 0
      008CBB 08                     493 	.db #0x08	; 8
      008CBC 14                     494 	.db #0x14	; 20
      008CBD 22                     495 	.db #0x22	; 34
      008CBE 41                     496 	.db #0x41	; 65	'A'
      008CBF 00                     497 	.db #0x00	; 0
      008CC0 14                     498 	.db #0x14	; 20
      008CC1 14                     499 	.db #0x14	; 20
      008CC2 14                     500 	.db #0x14	; 20
      008CC3 14                     501 	.db #0x14	; 20
      008CC4 14                     502 	.db #0x14	; 20
      008CC5 00                     503 	.db #0x00	; 0
      008CC6 41                     504 	.db #0x41	; 65	'A'
      008CC7 22                     505 	.db #0x22	; 34
      008CC8 14                     506 	.db #0x14	; 20
      008CC9 08                     507 	.db #0x08	; 8
      008CCA 02                     508 	.db #0x02	; 2
      008CCB 01                     509 	.db #0x01	; 1
      008CCC 51                     510 	.db #0x51	; 81	'Q'
      008CCD 09                     511 	.db #0x09	; 9
      008CCE 06                     512 	.db #0x06	; 6
      008CCF 32                     513 	.db #0x32	; 50	'2'
      008CD0 49                     514 	.db #0x49	; 73	'I'
      008CD1 79                     515 	.db #0x79	; 121	'y'
      008CD2 41                     516 	.db #0x41	; 65	'A'
      008CD3 3E                     517 	.db #0x3e	; 62
      008CD4 7E                     518 	.db #0x7e	; 126
      008CD5 11                     519 	.db #0x11	; 17
      008CD6 11                     520 	.db #0x11	; 17
      008CD7 11                     521 	.db #0x11	; 17
      008CD8 7E                     522 	.db #0x7e	; 126
      008CD9 7F                     523 	.db #0x7f	; 127
      008CDA 49                     524 	.db #0x49	; 73	'I'
      008CDB 49                     525 	.db #0x49	; 73	'I'
      008CDC 49                     526 	.db #0x49	; 73	'I'
      008CDD 36                     527 	.db #0x36	; 54	'6'
      008CDE 3E                     528 	.db #0x3e	; 62
      008CDF 41                     529 	.db #0x41	; 65	'A'
      008CE0 41                     530 	.db #0x41	; 65	'A'
      008CE1 41                     531 	.db #0x41	; 65	'A'
      008CE2 22                     532 	.db #0x22	; 34
      008CE3 7F                     533 	.db #0x7f	; 127
      008CE4 41                     534 	.db #0x41	; 65	'A'
      008CE5 41                     535 	.db #0x41	; 65	'A'
      008CE6 22                     536 	.db #0x22	; 34
      008CE7 1C                     537 	.db #0x1c	; 28
      008CE8 7F                     538 	.db #0x7f	; 127
      008CE9 49                     539 	.db #0x49	; 73	'I'
      008CEA 49                     540 	.db #0x49	; 73	'I'
      008CEB 49                     541 	.db #0x49	; 73	'I'
      008CEC 41                     542 	.db #0x41	; 65	'A'
      008CED 7F                     543 	.db #0x7f	; 127
      008CEE 09                     544 	.db #0x09	; 9
      008CEF 09                     545 	.db #0x09	; 9
      008CF0 09                     546 	.db #0x09	; 9
      008CF1 01                     547 	.db #0x01	; 1
      008CF2 3E                     548 	.db #0x3e	; 62
      008CF3 41                     549 	.db #0x41	; 65	'A'
      008CF4 49                     550 	.db #0x49	; 73	'I'
      008CF5 49                     551 	.db #0x49	; 73	'I'
      008CF6 7A                     552 	.db #0x7a	; 122	'z'
      008CF7 7F                     553 	.db #0x7f	; 127
      008CF8 08                     554 	.db #0x08	; 8
      008CF9 08                     555 	.db #0x08	; 8
      008CFA 08                     556 	.db #0x08	; 8
      008CFB 7F                     557 	.db #0x7f	; 127
      008CFC 00                     558 	.db #0x00	; 0
      008CFD 41                     559 	.db #0x41	; 65	'A'
      008CFE 7F                     560 	.db #0x7f	; 127
      008CFF 41                     561 	.db #0x41	; 65	'A'
      008D00 00                     562 	.db #0x00	; 0
      008D01 20                     563 	.db #0x20	; 32
      008D02 40                     564 	.db #0x40	; 64
      008D03 41                     565 	.db #0x41	; 65	'A'
      008D04 3F                     566 	.db #0x3f	; 63
      008D05 01                     567 	.db #0x01	; 1
      008D06 7F                     568 	.db #0x7f	; 127
      008D07 08                     569 	.db #0x08	; 8
      008D08 14                     570 	.db #0x14	; 20
      008D09 22                     571 	.db #0x22	; 34
      008D0A 41                     572 	.db #0x41	; 65	'A'
      008D0B 7F                     573 	.db #0x7f	; 127
      008D0C 40                     574 	.db #0x40	; 64
      008D0D 40                     575 	.db #0x40	; 64
      008D0E 40                     576 	.db #0x40	; 64
      008D0F 40                     577 	.db #0x40	; 64
      008D10 7F                     578 	.db #0x7f	; 127
      008D11 02                     579 	.db #0x02	; 2
      008D12 0C                     580 	.db #0x0c	; 12
      008D13 02                     581 	.db #0x02	; 2
      008D14 7F                     582 	.db #0x7f	; 127
      008D15 7F                     583 	.db #0x7f	; 127
      008D16 04                     584 	.db #0x04	; 4
      008D17 08                     585 	.db #0x08	; 8
      008D18 10                     586 	.db #0x10	; 16
      008D19 7F                     587 	.db #0x7f	; 127
      008D1A 3E                     588 	.db #0x3e	; 62
      008D1B 41                     589 	.db #0x41	; 65	'A'
      008D1C 41                     590 	.db #0x41	; 65	'A'
      008D1D 41                     591 	.db #0x41	; 65	'A'
      008D1E 3E                     592 	.db #0x3e	; 62
      008D1F 7F                     593 	.db #0x7f	; 127
      008D20 09                     594 	.db #0x09	; 9
      008D21 09                     595 	.db #0x09	; 9
      008D22 09                     596 	.db #0x09	; 9
      008D23 06                     597 	.db #0x06	; 6
      008D24 3E                     598 	.db #0x3e	; 62
      008D25 41                     599 	.db #0x41	; 65	'A'
      008D26 51                     600 	.db #0x51	; 81	'Q'
      008D27 21                     601 	.db #0x21	; 33
      008D28 5E                     602 	.db #0x5e	; 94
      008D29 7F                     603 	.db #0x7f	; 127
      008D2A 09                     604 	.db #0x09	; 9
      008D2B 19                     605 	.db #0x19	; 25
      008D2C 29                     606 	.db #0x29	; 41
      008D2D 46                     607 	.db #0x46	; 70	'F'
      008D2E 46                     608 	.db #0x46	; 70	'F'
      008D2F 49                     609 	.db #0x49	; 73	'I'
      008D30 49                     610 	.db #0x49	; 73	'I'
      008D31 49                     611 	.db #0x49	; 73	'I'
      008D32 31                     612 	.db #0x31	; 49	'1'
      008D33 01                     613 	.db #0x01	; 1
      008D34 01                     614 	.db #0x01	; 1
      008D35 7F                     615 	.db #0x7f	; 127
      008D36 01                     616 	.db #0x01	; 1
      008D37 01                     617 	.db #0x01	; 1
      008D38 3F                     618 	.db #0x3f	; 63
      008D39 40                     619 	.db #0x40	; 64
      008D3A 40                     620 	.db #0x40	; 64
      008D3B 40                     621 	.db #0x40	; 64
      008D3C 3F                     622 	.db #0x3f	; 63
      008D3D 1F                     623 	.db #0x1f	; 31
      008D3E 20                     624 	.db #0x20	; 32
      008D3F 40                     625 	.db #0x40	; 64
      008D40 20                     626 	.db #0x20	; 32
      008D41 1F                     627 	.db #0x1f	; 31
      008D42 3F                     628 	.db #0x3f	; 63
      008D43 40                     629 	.db #0x40	; 64
      008D44 38                     630 	.db #0x38	; 56	'8'
      008D45 40                     631 	.db #0x40	; 64
      008D46 3F                     632 	.db #0x3f	; 63
      008D47 63                     633 	.db #0x63	; 99	'c'
      008D48 14                     634 	.db #0x14	; 20
      008D49 08                     635 	.db #0x08	; 8
      008D4A 14                     636 	.db #0x14	; 20
      008D4B 63                     637 	.db #0x63	; 99	'c'
      008D4C 07                     638 	.db #0x07	; 7
      008D4D 08                     639 	.db #0x08	; 8
      008D4E 70                     640 	.db #0x70	; 112	'p'
      008D4F 08                     641 	.db #0x08	; 8
      008D50 07                     642 	.db #0x07	; 7
      008D51 61                     643 	.db #0x61	; 97	'a'
      008D52 51                     644 	.db #0x51	; 81	'Q'
      008D53 49                     645 	.db #0x49	; 73	'I'
      008D54 45                     646 	.db #0x45	; 69	'E'
      008D55 43                     647 	.db #0x43	; 67	'C'
      008D56 00                     648 	.db #0x00	; 0
      008D57 7F                     649 	.db #0x7f	; 127
      008D58 41                     650 	.db #0x41	; 65	'A'
      008D59 41                     651 	.db #0x41	; 65	'A'
      008D5A 00                     652 	.db #0x00	; 0
      008D5B 02                     653 	.db #0x02	; 2
      008D5C 04                     654 	.db #0x04	; 4
      008D5D 08                     655 	.db #0x08	; 8
      008D5E 10                     656 	.db #0x10	; 16
      008D5F 20                     657 	.db #0x20	; 32
      008D60 00                     658 	.db #0x00	; 0
      008D61 41                     659 	.db #0x41	; 65	'A'
      008D62 41                     660 	.db #0x41	; 65	'A'
      008D63 7F                     661 	.db #0x7f	; 127
      008D64 00                     662 	.db #0x00	; 0
      008D65 04                     663 	.db #0x04	; 4
      008D66 02                     664 	.db #0x02	; 2
      008D67 01                     665 	.db #0x01	; 1
      008D68 02                     666 	.db #0x02	; 2
      008D69 04                     667 	.db #0x04	; 4
      008D6A 40                     668 	.db #0x40	; 64
      008D6B 40                     669 	.db #0x40	; 64
      008D6C 40                     670 	.db #0x40	; 64
      008D6D 40                     671 	.db #0x40	; 64
      008D6E 40                     672 	.db #0x40	; 64
      008D6F 00                     673 	.db #0x00	; 0
      008D70 01                     674 	.db #0x01	; 1
      008D71 02                     675 	.db #0x02	; 2
      008D72 04                     676 	.db #0x04	; 4
      008D73 00                     677 	.db #0x00	; 0
      008D74 20                     678 	.db #0x20	; 32
      008D75 54                     679 	.db #0x54	; 84	'T'
      008D76 54                     680 	.db #0x54	; 84	'T'
      008D77 54                     681 	.db #0x54	; 84	'T'
      008D78 78                     682 	.db #0x78	; 120	'x'
      008D79 7F                     683 	.db #0x7f	; 127
      008D7A 48                     684 	.db #0x48	; 72	'H'
      008D7B 44                     685 	.db #0x44	; 68	'D'
      008D7C 44                     686 	.db #0x44	; 68	'D'
      008D7D 38                     687 	.db #0x38	; 56	'8'
      008D7E 38                     688 	.db #0x38	; 56	'8'
      008D7F 44                     689 	.db #0x44	; 68	'D'
      008D80 44                     690 	.db #0x44	; 68	'D'
      008D81 44                     691 	.db #0x44	; 68	'D'
      008D82 00                     692 	.db #0x00	; 0
      008D83 38                     693 	.db #0x38	; 56	'8'
      008D84 44                     694 	.db #0x44	; 68	'D'
      008D85 44                     695 	.db #0x44	; 68	'D'
      008D86 48                     696 	.db #0x48	; 72	'H'
      008D87 7F                     697 	.db #0x7f	; 127
      008D88 38                     698 	.db #0x38	; 56	'8'
      008D89 54                     699 	.db #0x54	; 84	'T'
      008D8A 54                     700 	.db #0x54	; 84	'T'
      008D8B 54                     701 	.db #0x54	; 84	'T'
      008D8C 18                     702 	.db #0x18	; 24
      008D8D 08                     703 	.db #0x08	; 8
      008D8E 7E                     704 	.db #0x7e	; 126
      008D8F 09                     705 	.db #0x09	; 9
      008D90 01                     706 	.db #0x01	; 1
      008D91 02                     707 	.db #0x02	; 2
      008D92 0C                     708 	.db #0x0c	; 12
      008D93 52                     709 	.db #0x52	; 82	'R'
      008D94 52                     710 	.db #0x52	; 82	'R'
      008D95 52                     711 	.db #0x52	; 82	'R'
      008D96 3E                     712 	.db #0x3e	; 62
      008D97 7F                     713 	.db #0x7f	; 127
      008D98 08                     714 	.db #0x08	; 8
      008D99 04                     715 	.db #0x04	; 4
      008D9A 04                     716 	.db #0x04	; 4
      008D9B 78                     717 	.db #0x78	; 120	'x'
      008D9C 00                     718 	.db #0x00	; 0
      008D9D 44                     719 	.db #0x44	; 68	'D'
      008D9E 7D                     720 	.db #0x7d	; 125
      008D9F 40                     721 	.db #0x40	; 64
      008DA0 00                     722 	.db #0x00	; 0
      008DA1 20                     723 	.db #0x20	; 32
      008DA2 40                     724 	.db #0x40	; 64
      008DA3 44                     725 	.db #0x44	; 68	'D'
      008DA4 3D                     726 	.db #0x3d	; 61
      008DA5 00                     727 	.db #0x00	; 0
      008DA6 7F                     728 	.db #0x7f	; 127
      008DA7 10                     729 	.db #0x10	; 16
      008DA8 28                     730 	.db #0x28	; 40
      008DA9 44                     731 	.db #0x44	; 68	'D'
      008DAA 00                     732 	.db #0x00	; 0
      008DAB 00                     733 	.db #0x00	; 0
      008DAC 41                     734 	.db #0x41	; 65	'A'
      008DAD 7F                     735 	.db #0x7f	; 127
      008DAE 40                     736 	.db #0x40	; 64
      008DAF 00                     737 	.db #0x00	; 0
      008DB0 7C                     738 	.db #0x7c	; 124
      008DB1 04                     739 	.db #0x04	; 4
      008DB2 18                     740 	.db #0x18	; 24
      008DB3 04                     741 	.db #0x04	; 4
      008DB4 78                     742 	.db #0x78	; 120	'x'
      008DB5 7C                     743 	.db #0x7c	; 124
      008DB6 08                     744 	.db #0x08	; 8
      008DB7 04                     745 	.db #0x04	; 4
      008DB8 04                     746 	.db #0x04	; 4
      008DB9 78                     747 	.db #0x78	; 120	'x'
      008DBA 38                     748 	.db #0x38	; 56	'8'
      008DBB 44                     749 	.db #0x44	; 68	'D'
      008DBC 44                     750 	.db #0x44	; 68	'D'
      008DBD 44                     751 	.db #0x44	; 68	'D'
      008DBE 38                     752 	.db #0x38	; 56	'8'
      008DBF 7C                     753 	.db #0x7c	; 124
      008DC0 14                     754 	.db #0x14	; 20
      008DC1 14                     755 	.db #0x14	; 20
      008DC2 14                     756 	.db #0x14	; 20
      008DC3 08                     757 	.db #0x08	; 8
      008DC4 08                     758 	.db #0x08	; 8
      008DC5 14                     759 	.db #0x14	; 20
      008DC6 14                     760 	.db #0x14	; 20
      008DC7 18                     761 	.db #0x18	; 24
      008DC8 7C                     762 	.db #0x7c	; 124
      008DC9 7C                     763 	.db #0x7c	; 124
      008DCA 08                     764 	.db #0x08	; 8
      008DCB 04                     765 	.db #0x04	; 4
      008DCC 04                     766 	.db #0x04	; 4
      008DCD 08                     767 	.db #0x08	; 8
      008DCE 48                     768 	.db #0x48	; 72	'H'
      008DCF 54                     769 	.db #0x54	; 84	'T'
      008DD0 54                     770 	.db #0x54	; 84	'T'
      008DD1 54                     771 	.db #0x54	; 84	'T'
      008DD2 20                     772 	.db #0x20	; 32
      008DD3 04                     773 	.db #0x04	; 4
      008DD4 3F                     774 	.db #0x3f	; 63
      008DD5 44                     775 	.db #0x44	; 68	'D'
      008DD6 40                     776 	.db #0x40	; 64
      008DD7 20                     777 	.db #0x20	; 32
      008DD8 3C                     778 	.db #0x3c	; 60
      008DD9 40                     779 	.db #0x40	; 64
      008DDA 40                     780 	.db #0x40	; 64
      008DDB 20                     781 	.db #0x20	; 32
      008DDC 7C                     782 	.db #0x7c	; 124
      008DDD 1C                     783 	.db #0x1c	; 28
      008DDE 20                     784 	.db #0x20	; 32
      008DDF 40                     785 	.db #0x40	; 64
      008DE0 20                     786 	.db #0x20	; 32
      008DE1 1C                     787 	.db #0x1c	; 28
      008DE2 3C                     788 	.db #0x3c	; 60
      008DE3 40                     789 	.db #0x40	; 64
      008DE4 30                     790 	.db #0x30	; 48	'0'
      008DE5 40                     791 	.db #0x40	; 64
      008DE6 3C                     792 	.db #0x3c	; 60
      008DE7 44                     793 	.db #0x44	; 68	'D'
      008DE8 28                     794 	.db #0x28	; 40
      008DE9 10                     795 	.db #0x10	; 16
      008DEA 28                     796 	.db #0x28	; 40
      008DEB 44                     797 	.db #0x44	; 68	'D'
      008DEC 0C                     798 	.db #0x0c	; 12
      008DED 50                     799 	.db #0x50	; 80	'P'
      008DEE 50                     800 	.db #0x50	; 80	'P'
      008DEF 50                     801 	.db #0x50	; 80	'P'
      008DF0 3C                     802 	.db #0x3c	; 60
      008DF1 44                     803 	.db #0x44	; 68	'D'
      008DF2 64                     804 	.db #0x64	; 100	'd'
      008DF3 54                     805 	.db #0x54	; 84	'T'
      008DF4 4C                     806 	.db #0x4c	; 76	'L'
      008DF5 44                     807 	.db #0x44	; 68	'D'
      008DF6 00                     808 	.db #0x00	; 0
      008DF7 08                     809 	.db #0x08	; 8
      008DF8 36                     810 	.db #0x36	; 54	'6'
      008DF9 41                     811 	.db #0x41	; 65	'A'
      008DFA 00                     812 	.db #0x00	; 0
      008DFB 00                     813 	.db #0x00	; 0
      008DFC 00                     814 	.db #0x00	; 0
      008DFD 7F                     815 	.db #0x7f	; 127
      008DFE 00                     816 	.db #0x00	; 0
      008DFF 00                     817 	.db #0x00	; 0
      008E00 00                     818 	.db #0x00	; 0
      008E01 41                     819 	.db #0x41	; 65	'A'
      008E02 36                     820 	.db #0x36	; 54	'6'
      008E03 08                     821 	.db #0x08	; 8
      008E04 00                     822 	.db #0x00	; 0
      008E05 08                     823 	.db #0x08	; 8
      008E06 04                     824 	.db #0x04	; 4
      008E07 08                     825 	.db #0x08	; 8
      008E08 10                     826 	.db #0x10	; 16
      008E09 08                     827 	.db #0x08	; 8
      008E0A 06                     828 	.db #0x06	; 6
      008E0B 09                     829 	.db #0x09	; 9
      008E0C 09                     830 	.db #0x09	; 9
      008E0D 06                     831 	.db #0x06	; 6
      008E0E 00                     832 	.db #0x00	; 0
      008E0F 7C                     833 	.db #0x7c	; 124
      008E10 12                     834 	.db #0x12	; 18
      008E11 11                     835 	.db #0x11	; 17
      008E12 12                     836 	.db #0x12	; 18
      008E13 7C                     837 	.db #0x7c	; 124
      008E14 7F                     838 	.db #0x7f	; 127
      008E15 49                     839 	.db #0x49	; 73	'I'
      008E16 49                     840 	.db #0x49	; 73	'I'
      008E17 49                     841 	.db #0x49	; 73	'I'
      008E18 31                     842 	.db #0x31	; 49	'1'
      008E19 7F                     843 	.db #0x7f	; 127
      008E1A 49                     844 	.db #0x49	; 73	'I'
      008E1B 49                     845 	.db #0x49	; 73	'I'
      008E1C 49                     846 	.db #0x49	; 73	'I'
      008E1D 36                     847 	.db #0x36	; 54	'6'
      008E1E 7F                     848 	.db #0x7f	; 127
      008E1F 01                     849 	.db #0x01	; 1
      008E20 01                     850 	.db #0x01	; 1
      008E21 01                     851 	.db #0x01	; 1
      008E22 01                     852 	.db #0x01	; 1
      008E23 60                     853 	.db #0x60	; 96
      008E24 3F                     854 	.db #0x3f	; 63
      008E25 21                     855 	.db #0x21	; 33
      008E26 3F                     856 	.db #0x3f	; 63
      008E27 60                     857 	.db #0x60	; 96
      008E28 7F                     858 	.db #0x7f	; 127
      008E29 49                     859 	.db #0x49	; 73	'I'
      008E2A 49                     860 	.db #0x49	; 73	'I'
      008E2B 49                     861 	.db #0x49	; 73	'I'
      008E2C 41                     862 	.db #0x41	; 65	'A'
      008E2D 77                     863 	.db #0x77	; 119	'w'
      008E2E 08                     864 	.db #0x08	; 8
      008E2F 7F                     865 	.db #0x7f	; 127
      008E30 08                     866 	.db #0x08	; 8
      008E31 77                     867 	.db #0x77	; 119	'w'
      008E32 22                     868 	.db #0x22	; 34
      008E33 41                     869 	.db #0x41	; 65	'A'
      008E34 49                     870 	.db #0x49	; 73	'I'
      008E35 49                     871 	.db #0x49	; 73	'I'
      008E36 36                     872 	.db #0x36	; 54	'6'
      008E37 7F                     873 	.db #0x7f	; 127
      008E38 10                     874 	.db #0x10	; 16
      008E39 08                     875 	.db #0x08	; 8
      008E3A 04                     876 	.db #0x04	; 4
      008E3B 7F                     877 	.db #0x7f	; 127
      008E3C 7E                     878 	.db #0x7e	; 126
      008E3D 10                     879 	.db #0x10	; 16
      008E3E 09                     880 	.db #0x09	; 9
      008E3F 04                     881 	.db #0x04	; 4
      008E40 7E                     882 	.db #0x7e	; 126
      008E41 7F                     883 	.db #0x7f	; 127
      008E42 08                     884 	.db #0x08	; 8
      008E43 14                     885 	.db #0x14	; 20
      008E44 22                     886 	.db #0x22	; 34
      008E45 41                     887 	.db #0x41	; 65	'A'
      008E46 40                     888 	.db #0x40	; 64
      008E47 3E                     889 	.db #0x3e	; 62
      008E48 01                     890 	.db #0x01	; 1
      008E49 01                     891 	.db #0x01	; 1
      008E4A 7F                     892 	.db #0x7f	; 127
      008E4B 7F                     893 	.db #0x7f	; 127
      008E4C 02                     894 	.db #0x02	; 2
      008E4D 0C                     895 	.db #0x0c	; 12
      008E4E 02                     896 	.db #0x02	; 2
      008E4F 7F                     897 	.db #0x7f	; 127
      008E50 7F                     898 	.db #0x7f	; 127
      008E51 08                     899 	.db #0x08	; 8
      008E52 08                     900 	.db #0x08	; 8
      008E53 08                     901 	.db #0x08	; 8
      008E54 7F                     902 	.db #0x7f	; 127
      008E55 3E                     903 	.db #0x3e	; 62
      008E56 41                     904 	.db #0x41	; 65	'A'
      008E57 41                     905 	.db #0x41	; 65	'A'
      008E58 41                     906 	.db #0x41	; 65	'A'
      008E59 3E                     907 	.db #0x3e	; 62
      008E5A 7F                     908 	.db #0x7f	; 127
      008E5B 01                     909 	.db #0x01	; 1
      008E5C 01                     910 	.db #0x01	; 1
      008E5D 01                     911 	.db #0x01	; 1
      008E5E 7F                     912 	.db #0x7f	; 127
      008E5F 7F                     913 	.db #0x7f	; 127
      008E60 09                     914 	.db #0x09	; 9
      008E61 09                     915 	.db #0x09	; 9
      008E62 09                     916 	.db #0x09	; 9
      008E63 06                     917 	.db #0x06	; 6
      008E64 3E                     918 	.db #0x3e	; 62
      008E65 41                     919 	.db #0x41	; 65	'A'
      008E66 41                     920 	.db #0x41	; 65	'A'
      008E67 41                     921 	.db #0x41	; 65	'A'
      008E68 22                     922 	.db #0x22	; 34
      008E69 01                     923 	.db #0x01	; 1
      008E6A 01                     924 	.db #0x01	; 1
      008E6B 7F                     925 	.db #0x7f	; 127
      008E6C 01                     926 	.db #0x01	; 1
      008E6D 01                     927 	.db #0x01	; 1
      008E6E 07                     928 	.db #0x07	; 7
      008E6F 48                     929 	.db #0x48	; 72	'H'
      008E70 48                     930 	.db #0x48	; 72	'H'
      008E71 48                     931 	.db #0x48	; 72	'H'
      008E72 3F                     932 	.db #0x3f	; 63
      008E73 0E                     933 	.db #0x0e	; 14
      008E74 11                     934 	.db #0x11	; 17
      008E75 7F                     935 	.db #0x7f	; 127
      008E76 11                     936 	.db #0x11	; 17
      008E77 0E                     937 	.db #0x0e	; 14
      008E78 63                     938 	.db #0x63	; 99	'c'
      008E79 14                     939 	.db #0x14	; 20
      008E7A 08                     940 	.db #0x08	; 8
      008E7B 14                     941 	.db #0x14	; 20
      008E7C 63                     942 	.db #0x63	; 99	'c'
      008E7D 3F                     943 	.db #0x3f	; 63
      008E7E 20                     944 	.db #0x20	; 32
      008E7F 20                     945 	.db #0x20	; 32
      008E80 3F                     946 	.db #0x3f	; 63
      008E81 60                     947 	.db #0x60	; 96
      008E82 07                     948 	.db #0x07	; 7
      008E83 08                     949 	.db #0x08	; 8
      008E84 08                     950 	.db #0x08	; 8
      008E85 08                     951 	.db #0x08	; 8
      008E86 7F                     952 	.db #0x7f	; 127
      008E87 7F                     953 	.db #0x7f	; 127
      008E88 40                     954 	.db #0x40	; 64
      008E89 7E                     955 	.db #0x7e	; 126
      008E8A 40                     956 	.db #0x40	; 64
      008E8B 7F                     957 	.db #0x7f	; 127
      008E8C 3F                     958 	.db #0x3f	; 63
      008E8D 20                     959 	.db #0x20	; 32
      008E8E 3F                     960 	.db #0x3f	; 63
      008E8F 20                     961 	.db #0x20	; 32
      008E90 7F                     962 	.db #0x7f	; 127
      008E91 01                     963 	.db #0x01	; 1
      008E92 7F                     964 	.db #0x7f	; 127
      008E93 48                     965 	.db #0x48	; 72	'H'
      008E94 48                     966 	.db #0x48	; 72	'H'
      008E95 30                     967 	.db #0x30	; 48	'0'
      008E96 7F                     968 	.db #0x7f	; 127
      008E97 48                     969 	.db #0x48	; 72	'H'
      008E98 30                     970 	.db #0x30	; 48	'0'
      008E99 00                     971 	.db #0x00	; 0
      008E9A 7F                     972 	.db #0x7f	; 127
      008E9B 00                     973 	.db #0x00	; 0
      008E9C 7F                     974 	.db #0x7f	; 127
      008E9D 48                     975 	.db #0x48	; 72	'H'
      008E9E 48                     976 	.db #0x48	; 72	'H'
      008E9F 30                     977 	.db #0x30	; 48	'0'
      008EA0 22                     978 	.db #0x22	; 34
      008EA1 41                     979 	.db #0x41	; 65	'A'
      008EA2 49                     980 	.db #0x49	; 73	'I'
      008EA3 49                     981 	.db #0x49	; 73	'I'
      008EA4 3E                     982 	.db #0x3e	; 62
      008EA5 7F                     983 	.db #0x7f	; 127
      008EA6 08                     984 	.db #0x08	; 8
      008EA7 3E                     985 	.db #0x3e	; 62
      008EA8 41                     986 	.db #0x41	; 65	'A'
      008EA9 3E                     987 	.db #0x3e	; 62
      008EAA 46                     988 	.db #0x46	; 70	'F'
      008EAB 29                     989 	.db #0x29	; 41
      008EAC 19                     990 	.db #0x19	; 25
      008EAD 09                     991 	.db #0x09	; 9
      008EAE 7F                     992 	.db #0x7f	; 127
      008EAF 20                     993 	.db #0x20	; 32
      008EB0 54                     994 	.db #0x54	; 84	'T'
      008EB1 54                     995 	.db #0x54	; 84	'T'
      008EB2 54                     996 	.db #0x54	; 84	'T'
      008EB3 78                     997 	.db #0x78	; 120	'x'
      008EB4 3C                     998 	.db #0x3c	; 60
      008EB5 4A                     999 	.db #0x4a	; 74	'J'
      008EB6 4A                    1000 	.db #0x4a	; 74	'J'
      008EB7 4A                    1001 	.db #0x4a	; 74	'J'
      008EB8 31                    1002 	.db #0x31	; 49	'1'
      008EB9 7C                    1003 	.db #0x7c	; 124
      008EBA 54                    1004 	.db #0x54	; 84	'T'
      008EBB 54                    1005 	.db #0x54	; 84	'T'
      008EBC 28                    1006 	.db #0x28	; 40
      008EBD 00                    1007 	.db #0x00	; 0
      008EBE 7C                    1008 	.db #0x7c	; 124
      008EBF 04                    1009 	.db #0x04	; 4
      008EC0 04                    1010 	.db #0x04	; 4
      008EC1 0C                    1011 	.db #0x0c	; 12
      008EC2 00                    1012 	.db #0x00	; 0
      008EC3 60                    1013 	.db #0x60	; 96
      008EC4 3C                    1014 	.db #0x3c	; 60
      008EC5 24                    1015 	.db #0x24	; 36
      008EC6 3C                    1016 	.db #0x3c	; 60
      008EC7 60                    1017 	.db #0x60	; 96
      008EC8 38                    1018 	.db #0x38	; 56	'8'
      008EC9 54                    1019 	.db #0x54	; 84	'T'
      008ECA 54                    1020 	.db #0x54	; 84	'T'
      008ECB 54                    1021 	.db #0x54	; 84	'T'
      008ECC 18                    1022 	.db #0x18	; 24
      008ECD 6C                    1023 	.db #0x6c	; 108	'l'
      008ECE 10                    1024 	.db #0x10	; 16
      008ECF 7C                    1025 	.db #0x7c	; 124
      008ED0 10                    1026 	.db #0x10	; 16
      008ED1 6C                    1027 	.db #0x6c	; 108	'l'
      008ED2 00                    1028 	.db #0x00	; 0
      008ED3 44                    1029 	.db #0x44	; 68	'D'
      008ED4 54                    1030 	.db #0x54	; 84	'T'
      008ED5 54                    1031 	.db #0x54	; 84	'T'
      008ED6 28                    1032 	.db #0x28	; 40
      008ED7 7C                    1033 	.db #0x7c	; 124
      008ED8 20                    1034 	.db #0x20	; 32
      008ED9 10                    1035 	.db #0x10	; 16
      008EDA 08                    1036 	.db #0x08	; 8
      008EDB 7C                    1037 	.db #0x7c	; 124
      008EDC 7C                    1038 	.db #0x7c	; 124
      008EDD 21                    1039 	.db #0x21	; 33
      008EDE 12                    1040 	.db #0x12	; 18
      008EDF 09                    1041 	.db #0x09	; 9
      008EE0 7C                    1042 	.db #0x7c	; 124
      008EE1 7C                    1043 	.db #0x7c	; 124
      008EE2 10                    1044 	.db #0x10	; 16
      008EE3 28                    1045 	.db #0x28	; 40
      008EE4 44                    1046 	.db #0x44	; 68	'D'
      008EE5 00                    1047 	.db #0x00	; 0
      008EE6 40                    1048 	.db #0x40	; 64
      008EE7 38                    1049 	.db #0x38	; 56	'8'
      008EE8 04                    1050 	.db #0x04	; 4
      008EE9 04                    1051 	.db #0x04	; 4
      008EEA 7C                    1052 	.db #0x7c	; 124
      008EEB 7C                    1053 	.db #0x7c	; 124
      008EEC 08                    1054 	.db #0x08	; 8
      008EED 10                    1055 	.db #0x10	; 16
      008EEE 08                    1056 	.db #0x08	; 8
      008EEF 7C                    1057 	.db #0x7c	; 124
      008EF0 7C                    1058 	.db #0x7c	; 124
      008EF1 10                    1059 	.db #0x10	; 16
      008EF2 10                    1060 	.db #0x10	; 16
      008EF3 10                    1061 	.db #0x10	; 16
      008EF4 7C                    1062 	.db #0x7c	; 124
      008EF5 38                    1063 	.db #0x38	; 56	'8'
      008EF6 44                    1064 	.db #0x44	; 68	'D'
      008EF7 44                    1065 	.db #0x44	; 68	'D'
      008EF8 44                    1066 	.db #0x44	; 68	'D'
      008EF9 38                    1067 	.db #0x38	; 56	'8'
      008EFA 7C                    1068 	.db #0x7c	; 124
      008EFB 04                    1069 	.db #0x04	; 4
      008EFC 04                    1070 	.db #0x04	; 4
      008EFD 04                    1071 	.db #0x04	; 4
      008EFE 7C                    1072 	.db #0x7c	; 124
      008EFF 7C                    1073 	.db #0x7c	; 124
      008F00 14                    1074 	.db #0x14	; 20
      008F01 14                    1075 	.db #0x14	; 20
      008F02 14                    1076 	.db #0x14	; 20
      008F03 08                    1077 	.db #0x08	; 8
      008F04 38                    1078 	.db #0x38	; 56	'8'
      008F05 44                    1079 	.db #0x44	; 68	'D'
      008F06 44                    1080 	.db #0x44	; 68	'D'
      008F07 44                    1081 	.db #0x44	; 68	'D'
      008F08 00                    1082 	.db #0x00	; 0
      008F09 04                    1083 	.db #0x04	; 4
      008F0A 04                    1084 	.db #0x04	; 4
      008F0B 7C                    1085 	.db #0x7c	; 124
      008F0C 04                    1086 	.db #0x04	; 4
      008F0D 04                    1087 	.db #0x04	; 4
      008F0E 0C                    1088 	.db #0x0c	; 12
      008F0F 50                    1089 	.db #0x50	; 80	'P'
      008F10 50                    1090 	.db #0x50	; 80	'P'
      008F11 50                    1091 	.db #0x50	; 80	'P'
      008F12 3C                    1092 	.db #0x3c	; 60
      008F13 08                    1093 	.db #0x08	; 8
      008F14 14                    1094 	.db #0x14	; 20
      008F15 7C                    1095 	.db #0x7c	; 124
      008F16 14                    1096 	.db #0x14	; 20
      008F17 08                    1097 	.db #0x08	; 8
      008F18 44                    1098 	.db #0x44	; 68	'D'
      008F19 28                    1099 	.db #0x28	; 40
      008F1A 10                    1100 	.db #0x10	; 16
      008F1B 28                    1101 	.db #0x28	; 40
      008F1C 44                    1102 	.db #0x44	; 68	'D'
      008F1D 3C                    1103 	.db #0x3c	; 60
      008F1E 20                    1104 	.db #0x20	; 32
      008F1F 20                    1105 	.db #0x20	; 32
      008F20 3C                    1106 	.db #0x3c	; 60
      008F21 60                    1107 	.db #0x60	; 96
      008F22 0C                    1108 	.db #0x0c	; 12
      008F23 10                    1109 	.db #0x10	; 16
      008F24 10                    1110 	.db #0x10	; 16
      008F25 10                    1111 	.db #0x10	; 16
      008F26 7C                    1112 	.db #0x7c	; 124
      008F27 7C                    1113 	.db #0x7c	; 124
      008F28 40                    1114 	.db #0x40	; 64
      008F29 7C                    1115 	.db #0x7c	; 124
      008F2A 40                    1116 	.db #0x40	; 64
      008F2B 7C                    1117 	.db #0x7c	; 124
      008F2C 3C                    1118 	.db #0x3c	; 60
      008F2D 20                    1119 	.db #0x20	; 32
      008F2E 3C                    1120 	.db #0x3c	; 60
      008F2F 20                    1121 	.db #0x20	; 32
      008F30 7C                    1122 	.db #0x7c	; 124
      008F31 04                    1123 	.db #0x04	; 4
      008F32 7C                    1124 	.db #0x7c	; 124
      008F33 50                    1125 	.db #0x50	; 80	'P'
      008F34 50                    1126 	.db #0x50	; 80	'P'
      008F35 20                    1127 	.db #0x20	; 32
      008F36 7C                    1128 	.db #0x7c	; 124
      008F37 50                    1129 	.db #0x50	; 80	'P'
      008F38 20                    1130 	.db #0x20	; 32
      008F39 00                    1131 	.db #0x00	; 0
      008F3A 7C                    1132 	.db #0x7c	; 124
      008F3B 00                    1133 	.db #0x00	; 0
      008F3C 7C                    1134 	.db #0x7c	; 124
      008F3D 50                    1135 	.db #0x50	; 80	'P'
      008F3E 50                    1136 	.db #0x50	; 80	'P'
      008F3F 20                    1137 	.db #0x20	; 32
      008F40 28                    1138 	.db #0x28	; 40
      008F41 44                    1139 	.db #0x44	; 68	'D'
      008F42 54                    1140 	.db #0x54	; 84	'T'
      008F43 54                    1141 	.db #0x54	; 84	'T'
      008F44 38                    1142 	.db #0x38	; 56	'8'
      008F45 7C                    1143 	.db #0x7c	; 124
      008F46 10                    1144 	.db #0x10	; 16
      008F47 38                    1145 	.db #0x38	; 56	'8'
      008F48 44                    1146 	.db #0x44	; 68	'D'
      008F49 38                    1147 	.db #0x38	; 56	'8'
      008F4A 48                    1148 	.db #0x48	; 72	'H'
      008F4B 54                    1149 	.db #0x54	; 84	'T'
      008F4C 34                    1150 	.db #0x34	; 52	'4'
      008F4D 14                    1151 	.db #0x14	; 20
      008F4E 7C                    1152 	.db #0x7c	; 124
      008F4F                       1153 _BigNumbers:
      008F4F FC                    1154 	.db #0xfc	; 252
      008F50 7A                    1155 	.db #0x7a	; 122	'z'
      008F51 06                    1156 	.db #0x06	; 6
      008F52 06                    1157 	.db #0x06	; 6
      008F53 06                    1158 	.db #0x06	; 6
      008F54 06                    1159 	.db #0x06	; 6
      008F55 06                    1160 	.db #0x06	; 6
      008F56 06                    1161 	.db #0x06	; 6
      008F57 7A                    1162 	.db #0x7a	; 122	'z'
      008F58 FC                    1163 	.db #0xfc	; 252
      008F59 7E                    1164 	.db #0x7e	; 126
      008F5A BC                    1165 	.db #0xbc	; 188
      008F5B C0                    1166 	.db #0xc0	; 192
      008F5C C0                    1167 	.db #0xc0	; 192
      008F5D C0                    1168 	.db #0xc0	; 192
      008F5E C0                    1169 	.db #0xc0	; 192
      008F5F C0                    1170 	.db #0xc0	; 192
      008F60 C0                    1171 	.db #0xc0	; 192
      008F61 BC                    1172 	.db #0xbc	; 188
      008F62 7E                    1173 	.db #0x7e	; 126
      008F63 00                    1174 	.db #0x00	; 0
      008F64 00                    1175 	.db #0x00	; 0
      008F65 00                    1176 	.db #0x00	; 0
      008F66 00                    1177 	.db #0x00	; 0
      008F67 00                    1178 	.db #0x00	; 0
      008F68 00                    1179 	.db #0x00	; 0
      008F69 00                    1180 	.db #0x00	; 0
      008F6A 00                    1181 	.db #0x00	; 0
      008F6B 78                    1182 	.db #0x78	; 120	'x'
      008F6C FC                    1183 	.db #0xfc	; 252
      008F6D 00                    1184 	.db #0x00	; 0
      008F6E 00                    1185 	.db #0x00	; 0
      008F6F 00                    1186 	.db #0x00	; 0
      008F70 00                    1187 	.db #0x00	; 0
      008F71 00                    1188 	.db #0x00	; 0
      008F72 00                    1189 	.db #0x00	; 0
      008F73 00                    1190 	.db #0x00	; 0
      008F74 00                    1191 	.db #0x00	; 0
      008F75 3C                    1192 	.db #0x3c	; 60
      008F76 7E                    1193 	.db #0x7e	; 126
      008F77 00                    1194 	.db #0x00	; 0
      008F78 02                    1195 	.db #0x02	; 2
      008F79 86                    1196 	.db #0x86	; 134
      008F7A 86                    1197 	.db #0x86	; 134
      008F7B 86                    1198 	.db #0x86	; 134
      008F7C 86                    1199 	.db #0x86	; 134
      008F7D 86                    1200 	.db #0x86	; 134
      008F7E 86                    1201 	.db #0x86	; 134
      008F7F 7A                    1202 	.db #0x7a	; 122	'z'
      008F80 FC                    1203 	.db #0xfc	; 252
      008F81 7E                    1204 	.db #0x7e	; 126
      008F82 BD                    1205 	.db #0xbd	; 189
      008F83 C3                    1206 	.db #0xc3	; 195
      008F84 C3                    1207 	.db #0xc3	; 195
      008F85 C3                    1208 	.db #0xc3	; 195
      008F86 C3                    1209 	.db #0xc3	; 195
      008F87 C3                    1210 	.db #0xc3	; 195
      008F88 C3                    1211 	.db #0xc3	; 195
      008F89 81                    1212 	.db #0x81	; 129
      008F8A 00                    1213 	.db #0x00	; 0
      008F8B 00                    1214 	.db #0x00	; 0
      008F8C 02                    1215 	.db #0x02	; 2
      008F8D 86                    1216 	.db #0x86	; 134
      008F8E 86                    1217 	.db #0x86	; 134
      008F8F 86                    1218 	.db #0x86	; 134
      008F90 86                    1219 	.db #0x86	; 134
      008F91 86                    1220 	.db #0x86	; 134
      008F92 86                    1221 	.db #0x86	; 134
      008F93 7A                    1222 	.db #0x7a	; 122	'z'
      008F94 FC                    1223 	.db #0xfc	; 252
      008F95 00                    1224 	.db #0x00	; 0
      008F96 81                    1225 	.db #0x81	; 129
      008F97 C3                    1226 	.db #0xc3	; 195
      008F98 C3                    1227 	.db #0xc3	; 195
      008F99 C3                    1228 	.db #0xc3	; 195
      008F9A C3                    1229 	.db #0xc3	; 195
      008F9B C3                    1230 	.db #0xc3	; 195
      008F9C C3                    1231 	.db #0xc3	; 195
      008F9D BD                    1232 	.db #0xbd	; 189
      008F9E 7E                    1233 	.db #0x7e	; 126
      008F9F FC                    1234 	.db #0xfc	; 252
      008FA0 78                    1235 	.db #0x78	; 120	'x'
      008FA1 80                    1236 	.db #0x80	; 128
      008FA2 80                    1237 	.db #0x80	; 128
      008FA3 80                    1238 	.db #0x80	; 128
      008FA4 80                    1239 	.db #0x80	; 128
      008FA5 80                    1240 	.db #0x80	; 128
      008FA6 80                    1241 	.db #0x80	; 128
      008FA7 78                    1242 	.db #0x78	; 120	'x'
      008FA8 FC                    1243 	.db #0xfc	; 252
      008FA9 00                    1244 	.db #0x00	; 0
      008FAA 01                    1245 	.db #0x01	; 1
      008FAB 03                    1246 	.db #0x03	; 3
      008FAC 03                    1247 	.db #0x03	; 3
      008FAD 03                    1248 	.db #0x03	; 3
      008FAE 03                    1249 	.db #0x03	; 3
      008FAF 03                    1250 	.db #0x03	; 3
      008FB0 03                    1251 	.db #0x03	; 3
      008FB1 3D                    1252 	.db #0x3d	; 61
      008FB2 7E                    1253 	.db #0x7e	; 126
      008FB3 FC                    1254 	.db #0xfc	; 252
      008FB4 7A                    1255 	.db #0x7a	; 122	'z'
      008FB5 86                    1256 	.db #0x86	; 134
      008FB6 86                    1257 	.db #0x86	; 134
      008FB7 86                    1258 	.db #0x86	; 134
      008FB8 86                    1259 	.db #0x86	; 134
      008FB9 86                    1260 	.db #0x86	; 134
      008FBA 86                    1261 	.db #0x86	; 134
      008FBB 02                    1262 	.db #0x02	; 2
      008FBC 00                    1263 	.db #0x00	; 0
      008FBD 00                    1264 	.db #0x00	; 0
      008FBE 81                    1265 	.db #0x81	; 129
      008FBF C3                    1266 	.db #0xc3	; 195
      008FC0 C3                    1267 	.db #0xc3	; 195
      008FC1 C3                    1268 	.db #0xc3	; 195
      008FC2 C3                    1269 	.db #0xc3	; 195
      008FC3 C3                    1270 	.db #0xc3	; 195
      008FC4 C3                    1271 	.db #0xc3	; 195
      008FC5 BD                    1272 	.db #0xbd	; 189
      008FC6 7E                    1273 	.db #0x7e	; 126
      008FC7 FC                    1274 	.db #0xfc	; 252
      008FC8 7A                    1275 	.db #0x7a	; 122	'z'
      008FC9 86                    1276 	.db #0x86	; 134
      008FCA 86                    1277 	.db #0x86	; 134
      008FCB 86                    1278 	.db #0x86	; 134
      008FCC 86                    1279 	.db #0x86	; 134
      008FCD 86                    1280 	.db #0x86	; 134
      008FCE 86                    1281 	.db #0x86	; 134
      008FCF 02                    1282 	.db #0x02	; 2
      008FD0 00                    1283 	.db #0x00	; 0
      008FD1 7E                    1284 	.db #0x7e	; 126
      008FD2 BD                    1285 	.db #0xbd	; 189
      008FD3 C3                    1286 	.db #0xc3	; 195
      008FD4 C3                    1287 	.db #0xc3	; 195
      008FD5 C3                    1288 	.db #0xc3	; 195
      008FD6 C3                    1289 	.db #0xc3	; 195
      008FD7 C3                    1290 	.db #0xc3	; 195
      008FD8 C3                    1291 	.db #0xc3	; 195
      008FD9 BD                    1292 	.db #0xbd	; 189
      008FDA 7E                    1293 	.db #0x7e	; 126
      008FDB 00                    1294 	.db #0x00	; 0
      008FDC 02                    1295 	.db #0x02	; 2
      008FDD 06                    1296 	.db #0x06	; 6
      008FDE 06                    1297 	.db #0x06	; 6
      008FDF 06                    1298 	.db #0x06	; 6
      008FE0 06                    1299 	.db #0x06	; 6
      008FE1 06                    1300 	.db #0x06	; 6
      008FE2 06                    1301 	.db #0x06	; 6
      008FE3 7A                    1302 	.db #0x7a	; 122	'z'
      008FE4 FC                    1303 	.db #0xfc	; 252
      008FE5 00                    1304 	.db #0x00	; 0
      008FE6 00                    1305 	.db #0x00	; 0
      008FE7 00                    1306 	.db #0x00	; 0
      008FE8 00                    1307 	.db #0x00	; 0
      008FE9 00                    1308 	.db #0x00	; 0
      008FEA 00                    1309 	.db #0x00	; 0
      008FEB 00                    1310 	.db #0x00	; 0
      008FEC 00                    1311 	.db #0x00	; 0
      008FED 3C                    1312 	.db #0x3c	; 60
      008FEE 7E                    1313 	.db #0x7e	; 126
      008FEF FC                    1314 	.db #0xfc	; 252
      008FF0 7A                    1315 	.db #0x7a	; 122	'z'
      008FF1 86                    1316 	.db #0x86	; 134
      008FF2 86                    1317 	.db #0x86	; 134
      008FF3 86                    1318 	.db #0x86	; 134
      008FF4 86                    1319 	.db #0x86	; 134
      008FF5 86                    1320 	.db #0x86	; 134
      008FF6 86                    1321 	.db #0x86	; 134
      008FF7 7A                    1322 	.db #0x7a	; 122	'z'
      008FF8 FC                    1323 	.db #0xfc	; 252
      008FF9 7E                    1324 	.db #0x7e	; 126
      008FFA BD                    1325 	.db #0xbd	; 189
      008FFB C3                    1326 	.db #0xc3	; 195
      008FFC C3                    1327 	.db #0xc3	; 195
      008FFD C3                    1328 	.db #0xc3	; 195
      008FFE C3                    1329 	.db #0xc3	; 195
      008FFF C3                    1330 	.db #0xc3	; 195
      009000 C3                    1331 	.db #0xc3	; 195
      009001 BD                    1332 	.db #0xbd	; 189
      009002 7E                    1333 	.db #0x7e	; 126
      009003 FC                    1334 	.db #0xfc	; 252
      009004 7A                    1335 	.db #0x7a	; 122	'z'
      009005 86                    1336 	.db #0x86	; 134
      009006 86                    1337 	.db #0x86	; 134
      009007 86                    1338 	.db #0x86	; 134
      009008 86                    1339 	.db #0x86	; 134
      009009 86                    1340 	.db #0x86	; 134
      00900A 86                    1341 	.db #0x86	; 134
      00900B 7A                    1342 	.db #0x7a	; 122	'z'
      00900C FC                    1343 	.db #0xfc	; 252
      00900D 00                    1344 	.db #0x00	; 0
      00900E 81                    1345 	.db #0x81	; 129
      00900F C3                    1346 	.db #0xc3	; 195
      009010 C3                    1347 	.db #0xc3	; 195
      009011 C3                    1348 	.db #0xc3	; 195
      009012 C3                    1349 	.db #0xc3	; 195
      009013 C3                    1350 	.db #0xc3	; 195
      009014 C3                    1351 	.db #0xc3	; 195
      009015 BD                    1352 	.db #0xbd	; 189
      009016 7E                    1353 	.db #0x7e	; 126
      009017                       1354 _LargeNumbers:
      009017 00                    1355 	.db #0x00	; 0
      009018 FC                    1356 	.db #0xfc	; 252
      009019 F8                    1357 	.db #0xf8	; 248
      00901A F2                    1358 	.db #0xf2	; 242
      00901B E6                    1359 	.db #0xe6	; 230
      00901C CE                    1360 	.db #0xce	; 206
      00901D 1E                    1361 	.db #0x1e	; 30
      00901E 3E                    1362 	.db #0x3e	; 62
      00901F 3E                    1363 	.db #0x3e	; 62
      009020 3E                    1364 	.db #0x3e	; 62
      009021 3E                    1365 	.db #0x3e	; 62
      009022 3E                    1366 	.db #0x3e	; 62
      009023 3E                    1367 	.db #0x3e	; 62
      009024 3E                    1368 	.db #0x3e	; 62
      009025 1E                    1369 	.db #0x1e	; 30
      009026 CE                    1370 	.db #0xce	; 206
      009027 E6                    1371 	.db #0xe6	; 230
      009028 F2                    1372 	.db #0xf2	; 242
      009029 F8                    1373 	.db #0xf8	; 248
      00902A FC                    1374 	.db #0xfc	; 252
      00902B 00                    1375 	.db #0x00	; 0
      00902C FF                    1376 	.db #0xff	; 255
      00902D 7F                    1377 	.db #0x7f	; 127
      00902E 3F                    1378 	.db #0x3f	; 63
      00902F 1F                    1379 	.db #0x1f	; 31
      009030 0F                    1380 	.db #0x0f	; 15
      009031 00                    1381 	.db #0x00	; 0
      009032 00                    1382 	.db #0x00	; 0
      009033 00                    1383 	.db #0x00	; 0
      009034 00                    1384 	.db #0x00	; 0
      009035 00                    1385 	.db #0x00	; 0
      009036 00                    1386 	.db #0x00	; 0
      009037 00                    1387 	.db #0x00	; 0
      009038 00                    1388 	.db #0x00	; 0
      009039 00                    1389 	.db #0x00	; 0
      00903A 0F                    1390 	.db #0x0f	; 15
      00903B 1F                    1391 	.db #0x1f	; 31
      00903C 3F                    1392 	.db #0x3f	; 63
      00903D 7F                    1393 	.db #0x7f	; 127
      00903E FF                    1394 	.db #0xff	; 255
      00903F 00                    1395 	.db #0x00	; 0
      009040 FE                    1396 	.db #0xfe	; 254
      009041 FC                    1397 	.db #0xfc	; 252
      009042 F8                    1398 	.db #0xf8	; 248
      009043 F0                    1399 	.db #0xf0	; 240
      009044 E0                    1400 	.db #0xe0	; 224
      009045 00                    1401 	.db #0x00	; 0
      009046 00                    1402 	.db #0x00	; 0
      009047 00                    1403 	.db #0x00	; 0
      009048 00                    1404 	.db #0x00	; 0
      009049 00                    1405 	.db #0x00	; 0
      00904A 00                    1406 	.db #0x00	; 0
      00904B 00                    1407 	.db #0x00	; 0
      00904C 00                    1408 	.db #0x00	; 0
      00904D 00                    1409 	.db #0x00	; 0
      00904E E0                    1410 	.db #0xe0	; 224
      00904F F0                    1411 	.db #0xf0	; 240
      009050 F8                    1412 	.db #0xf8	; 248
      009051 FC                    1413 	.db #0xfc	; 252
      009052 FE                    1414 	.db #0xfe	; 254
      009053 00                    1415 	.db #0x00	; 0
      009054 7F                    1416 	.db #0x7f	; 127
      009055 3F                    1417 	.db #0x3f	; 63
      009056 9F                    1418 	.db #0x9f	; 159
      009057 CF                    1419 	.db #0xcf	; 207
      009058 E7                    1420 	.db #0xe7	; 231
      009059 F0                    1421 	.db #0xf0	; 240
      00905A F8                    1422 	.db #0xf8	; 248
      00905B F8                    1423 	.db #0xf8	; 248
      00905C F8                    1424 	.db #0xf8	; 248
      00905D F8                    1425 	.db #0xf8	; 248
      00905E F8                    1426 	.db #0xf8	; 248
      00905F F8                    1427 	.db #0xf8	; 248
      009060 F8                    1428 	.db #0xf8	; 248
      009061 F0                    1429 	.db #0xf0	; 240
      009062 E7                    1430 	.db #0xe7	; 231
      009063 CF                    1431 	.db #0xcf	; 207
      009064 9F                    1432 	.db #0x9f	; 159
      009065 3F                    1433 	.db #0x3f	; 63
      009066 7F                    1434 	.db #0x7f	; 127
      009067 00                    1435 	.db #0x00	; 0
      009068 00                    1436 	.db #0x00	; 0
      009069 00                    1437 	.db #0x00	; 0
      00906A 00                    1438 	.db #0x00	; 0
      00906B 00                    1439 	.db #0x00	; 0
      00906C 00                    1440 	.db #0x00	; 0
      00906D 00                    1441 	.db #0x00	; 0
      00906E 00                    1442 	.db #0x00	; 0
      00906F 00                    1443 	.db #0x00	; 0
      009070 00                    1444 	.db #0x00	; 0
      009071 00                    1445 	.db #0x00	; 0
      009072 00                    1446 	.db #0x00	; 0
      009073 00                    1447 	.db #0x00	; 0
      009074 00                    1448 	.db #0x00	; 0
      009075 00                    1449 	.db #0x00	; 0
      009076 C0                    1450 	.db #0xc0	; 192
      009077 E0                    1451 	.db #0xe0	; 224
      009078 F0                    1452 	.db #0xf0	; 240
      009079 F8                    1453 	.db #0xf8	; 248
      00907A FC                    1454 	.db #0xfc	; 252
      00907B 00                    1455 	.db #0x00	; 0
      00907C 00                    1456 	.db #0x00	; 0
      00907D 00                    1457 	.db #0x00	; 0
      00907E 00                    1458 	.db #0x00	; 0
      00907F 00                    1459 	.db #0x00	; 0
      009080 00                    1460 	.db #0x00	; 0
      009081 00                    1461 	.db #0x00	; 0
      009082 00                    1462 	.db #0x00	; 0
      009083 00                    1463 	.db #0x00	; 0
      009084 00                    1464 	.db #0x00	; 0
      009085 00                    1465 	.db #0x00	; 0
      009086 00                    1466 	.db #0x00	; 0
      009087 00                    1467 	.db #0x00	; 0
      009088 00                    1468 	.db #0x00	; 0
      009089 00                    1469 	.db #0x00	; 0
      00908A 0F                    1470 	.db #0x0f	; 15
      00908B 1F                    1471 	.db #0x1f	; 31
      00908C 3F                    1472 	.db #0x3f	; 63
      00908D 7F                    1473 	.db #0x7f	; 127
      00908E FF                    1474 	.db #0xff	; 255
      00908F 00                    1475 	.db #0x00	; 0
      009090 00                    1476 	.db #0x00	; 0
      009091 00                    1477 	.db #0x00	; 0
      009092 00                    1478 	.db #0x00	; 0
      009093 00                    1479 	.db #0x00	; 0
      009094 00                    1480 	.db #0x00	; 0
      009095 00                    1481 	.db #0x00	; 0
      009096 00                    1482 	.db #0x00	; 0
      009097 00                    1483 	.db #0x00	; 0
      009098 00                    1484 	.db #0x00	; 0
      009099 00                    1485 	.db #0x00	; 0
      00909A 00                    1486 	.db #0x00	; 0
      00909B 00                    1487 	.db #0x00	; 0
      00909C 00                    1488 	.db #0x00	; 0
      00909D 00                    1489 	.db #0x00	; 0
      00909E E0                    1490 	.db #0xe0	; 224
      00909F F0                    1491 	.db #0xf0	; 240
      0090A0 F8                    1492 	.db #0xf8	; 248
      0090A1 FC                    1493 	.db #0xfc	; 252
      0090A2 FE                    1494 	.db #0xfe	; 254
      0090A3 00                    1495 	.db #0x00	; 0
      0090A4 00                    1496 	.db #0x00	; 0
      0090A5 00                    1497 	.db #0x00	; 0
      0090A6 00                    1498 	.db #0x00	; 0
      0090A7 00                    1499 	.db #0x00	; 0
      0090A8 00                    1500 	.db #0x00	; 0
      0090A9 00                    1501 	.db #0x00	; 0
      0090AA 00                    1502 	.db #0x00	; 0
      0090AB 00                    1503 	.db #0x00	; 0
      0090AC 00                    1504 	.db #0x00	; 0
      0090AD 00                    1505 	.db #0x00	; 0
      0090AE 00                    1506 	.db #0x00	; 0
      0090AF 00                    1507 	.db #0x00	; 0
      0090B0 00                    1508 	.db #0x00	; 0
      0090B1 00                    1509 	.db #0x00	; 0
      0090B2 07                    1510 	.db #0x07	; 7
      0090B3 0F                    1511 	.db #0x0f	; 15
      0090B4 1F                    1512 	.db #0x1f	; 31
      0090B5 3F                    1513 	.db #0x3f	; 63
      0090B6 7F                    1514 	.db #0x7f	; 127
      0090B7 00                    1515 	.db #0x00	; 0
      0090B8 00                    1516 	.db #0x00	; 0
      0090B9 00                    1517 	.db #0x00	; 0
      0090BA 02                    1518 	.db #0x02	; 2
      0090BB 06                    1519 	.db #0x06	; 6
      0090BC 0E                    1520 	.db #0x0e	; 14
      0090BD 1E                    1521 	.db #0x1e	; 30
      0090BE 3E                    1522 	.db #0x3e	; 62
      0090BF 3E                    1523 	.db #0x3e	; 62
      0090C0 3E                    1524 	.db #0x3e	; 62
      0090C1 3E                    1525 	.db #0x3e	; 62
      0090C2 3E                    1526 	.db #0x3e	; 62
      0090C3 3E                    1527 	.db #0x3e	; 62
      0090C4 3E                    1528 	.db #0x3e	; 62
      0090C5 1E                    1529 	.db #0x1e	; 30
      0090C6 CE                    1530 	.db #0xce	; 206
      0090C7 E6                    1531 	.db #0xe6	; 230
      0090C8 F2                    1532 	.db #0xf2	; 242
      0090C9 F8                    1533 	.db #0xf8	; 248
      0090CA FC                    1534 	.db #0xfc	; 252
      0090CB 00                    1535 	.db #0x00	; 0
      0090CC 00                    1536 	.db #0x00	; 0
      0090CD 00                    1537 	.db #0x00	; 0
      0090CE 80                    1538 	.db #0x80	; 128
      0090CF C0                    1539 	.db #0xc0	; 192
      0090D0 C0                    1540 	.db #0xc0	; 192
      0090D1 C0                    1541 	.db #0xc0	; 192
      0090D2 C0                    1542 	.db #0xc0	; 192
      0090D3 C0                    1543 	.db #0xc0	; 192
      0090D4 C0                    1544 	.db #0xc0	; 192
      0090D5 C0                    1545 	.db #0xc0	; 192
      0090D6 C0                    1546 	.db #0xc0	; 192
      0090D7 C0                    1547 	.db #0xc0	; 192
      0090D8 C0                    1548 	.db #0xc0	; 192
      0090D9 C0                    1549 	.db #0xc0	; 192
      0090DA C7                    1550 	.db #0xc7	; 199
      0090DB CF                    1551 	.db #0xcf	; 207
      0090DC 9F                    1552 	.db #0x9f	; 159
      0090DD 3F                    1553 	.db #0x3f	; 63
      0090DE 7F                    1554 	.db #0x7f	; 127
      0090DF 00                    1555 	.db #0x00	; 0
      0090E0 FC                    1556 	.db #0xfc	; 252
      0090E1 F9                    1557 	.db #0xf9	; 249
      0090E2 F3                    1558 	.db #0xf3	; 243
      0090E3 E7                    1559 	.db #0xe7	; 231
      0090E4 C7                    1560 	.db #0xc7	; 199
      0090E5 07                    1561 	.db #0x07	; 7
      0090E6 07                    1562 	.db #0x07	; 7
      0090E7 07                    1563 	.db #0x07	; 7
      0090E8 07                    1564 	.db #0x07	; 7
      0090E9 07                    1565 	.db #0x07	; 7
      0090EA 07                    1566 	.db #0x07	; 7
      0090EB 07                    1567 	.db #0x07	; 7
      0090EC 07                    1568 	.db #0x07	; 7
      0090ED 07                    1569 	.db #0x07	; 7
      0090EE 07                    1570 	.db #0x07	; 7
      0090EF 07                    1571 	.db #0x07	; 7
      0090F0 03                    1572 	.db #0x03	; 3
      0090F1 01                    1573 	.db #0x01	; 1
      0090F2 00                    1574 	.db #0x00	; 0
      0090F3 00                    1575 	.db #0x00	; 0
      0090F4 7F                    1576 	.db #0x7f	; 127
      0090F5 3F                    1577 	.db #0x3f	; 63
      0090F6 9F                    1578 	.db #0x9f	; 159
      0090F7 CF                    1579 	.db #0xcf	; 207
      0090F8 E7                    1580 	.db #0xe7	; 231
      0090F9 F0                    1581 	.db #0xf0	; 240
      0090FA F0                    1582 	.db #0xf0	; 240
      0090FB F8                    1583 	.db #0xf8	; 248
      0090FC F8                    1584 	.db #0xf8	; 248
      0090FD F8                    1585 	.db #0xf8	; 248
      0090FE F8                    1586 	.db #0xf8	; 248
      0090FF F8                    1587 	.db #0xf8	; 248
      009100 F8                    1588 	.db #0xf8	; 248
      009101 F0                    1589 	.db #0xf0	; 240
      009102 E0                    1590 	.db #0xe0	; 224
      009103 C0                    1591 	.db #0xc0	; 192
      009104 80                    1592 	.db #0x80	; 128
      009105 00                    1593 	.db #0x00	; 0
      009106 00                    1594 	.db #0x00	; 0
      009107 00                    1595 	.db #0x00	; 0
      009108 00                    1596 	.db #0x00	; 0
      009109 00                    1597 	.db #0x00	; 0
      00910A 02                    1598 	.db #0x02	; 2
      00910B 06                    1599 	.db #0x06	; 6
      00910C 0E                    1600 	.db #0x0e	; 14
      00910D 1E                    1601 	.db #0x1e	; 30
      00910E 3E                    1602 	.db #0x3e	; 62
      00910F 3E                    1603 	.db #0x3e	; 62
      009110 3E                    1604 	.db #0x3e	; 62
      009111 3E                    1605 	.db #0x3e	; 62
      009112 3E                    1606 	.db #0x3e	; 62
      009113 3E                    1607 	.db #0x3e	; 62
      009114 3E                    1608 	.db #0x3e	; 62
      009115 1E                    1609 	.db #0x1e	; 30
      009116 CE                    1610 	.db #0xce	; 206
      009117 E6                    1611 	.db #0xe6	; 230
      009118 F2                    1612 	.db #0xf2	; 242
      009119 F8                    1613 	.db #0xf8	; 248
      00911A FC                    1614 	.db #0xfc	; 252
      00911B 00                    1615 	.db #0x00	; 0
      00911C 00                    1616 	.db #0x00	; 0
      00911D 00                    1617 	.db #0x00	; 0
      00911E 80                    1618 	.db #0x80	; 128
      00911F C0                    1619 	.db #0xc0	; 192
      009120 C0                    1620 	.db #0xc0	; 192
      009121 C0                    1621 	.db #0xc0	; 192
      009122 C0                    1622 	.db #0xc0	; 192
      009123 C0                    1623 	.db #0xc0	; 192
      009124 C0                    1624 	.db #0xc0	; 192
      009125 C0                    1625 	.db #0xc0	; 192
      009126 C0                    1626 	.db #0xc0	; 192
      009127 C0                    1627 	.db #0xc0	; 192
      009128 C0                    1628 	.db #0xc0	; 192
      009129 C0                    1629 	.db #0xc0	; 192
      00912A C7                    1630 	.db #0xc7	; 199
      00912B CF                    1631 	.db #0xcf	; 207
      00912C 9F                    1632 	.db #0x9f	; 159
      00912D 3F                    1633 	.db #0x3f	; 63
      00912E 7F                    1634 	.db #0x7f	; 127
      00912F 00                    1635 	.db #0x00	; 0
      009130 00                    1636 	.db #0x00	; 0
      009131 01                    1637 	.db #0x01	; 1
      009132 03                    1638 	.db #0x03	; 3
      009133 07                    1639 	.db #0x07	; 7
      009134 07                    1640 	.db #0x07	; 7
      009135 07                    1641 	.db #0x07	; 7
      009136 07                    1642 	.db #0x07	; 7
      009137 07                    1643 	.db #0x07	; 7
      009138 07                    1644 	.db #0x07	; 7
      009139 07                    1645 	.db #0x07	; 7
      00913A 07                    1646 	.db #0x07	; 7
      00913B 07                    1647 	.db #0x07	; 7
      00913C 07                    1648 	.db #0x07	; 7
      00913D 07                    1649 	.db #0x07	; 7
      00913E C7                    1650 	.db #0xc7	; 199
      00913F E7                    1651 	.db #0xe7	; 231
      009140 F3                    1652 	.db #0xf3	; 243
      009141 F9                    1653 	.db #0xf9	; 249
      009142 FC                    1654 	.db #0xfc	; 252
      009143 00                    1655 	.db #0x00	; 0
      009144 00                    1656 	.db #0x00	; 0
      009145 00                    1657 	.db #0x00	; 0
      009146 80                    1658 	.db #0x80	; 128
      009147 C0                    1659 	.db #0xc0	; 192
      009148 E0                    1660 	.db #0xe0	; 224
      009149 F0                    1661 	.db #0xf0	; 240
      00914A F0                    1662 	.db #0xf0	; 240
      00914B F8                    1663 	.db #0xf8	; 248
      00914C F8                    1664 	.db #0xf8	; 248
      00914D F8                    1665 	.db #0xf8	; 248
      00914E F8                    1666 	.db #0xf8	; 248
      00914F F8                    1667 	.db #0xf8	; 248
      009150 F8                    1668 	.db #0xf8	; 248
      009151 F0                    1669 	.db #0xf0	; 240
      009152 E7                    1670 	.db #0xe7	; 231
      009153 CF                    1671 	.db #0xcf	; 207
      009154 9F                    1672 	.db #0x9f	; 159
      009155 3F                    1673 	.db #0x3f	; 63
      009156 7F                    1674 	.db #0x7f	; 127
      009157 00                    1675 	.db #0x00	; 0
      009158 FC                    1676 	.db #0xfc	; 252
      009159 F8                    1677 	.db #0xf8	; 248
      00915A F0                    1678 	.db #0xf0	; 240
      00915B E0                    1679 	.db #0xe0	; 224
      00915C C0                    1680 	.db #0xc0	; 192
      00915D 00                    1681 	.db #0x00	; 0
      00915E 00                    1682 	.db #0x00	; 0
      00915F 00                    1683 	.db #0x00	; 0
      009160 00                    1684 	.db #0x00	; 0
      009161 00                    1685 	.db #0x00	; 0
      009162 00                    1686 	.db #0x00	; 0
      009163 00                    1687 	.db #0x00	; 0
      009164 00                    1688 	.db #0x00	; 0
      009165 00                    1689 	.db #0x00	; 0
      009166 C0                    1690 	.db #0xc0	; 192
      009167 E0                    1691 	.db #0xe0	; 224
      009168 F0                    1692 	.db #0xf0	; 240
      009169 F8                    1693 	.db #0xf8	; 248
      00916A FC                    1694 	.db #0xfc	; 252
      00916B 00                    1695 	.db #0x00	; 0
      00916C 7F                    1696 	.db #0x7f	; 127
      00916D 3F                    1697 	.db #0x3f	; 63
      00916E 9F                    1698 	.db #0x9f	; 159
      00916F CF                    1699 	.db #0xcf	; 207
      009170 C7                    1700 	.db #0xc7	; 199
      009171 C0                    1701 	.db #0xc0	; 192
      009172 C0                    1702 	.db #0xc0	; 192
      009173 C0                    1703 	.db #0xc0	; 192
      009174 C0                    1704 	.db #0xc0	; 192
      009175 C0                    1705 	.db #0xc0	; 192
      009176 C0                    1706 	.db #0xc0	; 192
      009177 C0                    1707 	.db #0xc0	; 192
      009178 C0                    1708 	.db #0xc0	; 192
      009179 C0                    1709 	.db #0xc0	; 192
      00917A C7                    1710 	.db #0xc7	; 199
      00917B CF                    1711 	.db #0xcf	; 207
      00917C 9F                    1712 	.db #0x9f	; 159
      00917D 3F                    1713 	.db #0x3f	; 63
      00917E 7F                    1714 	.db #0x7f	; 127
      00917F 00                    1715 	.db #0x00	; 0
      009180 00                    1716 	.db #0x00	; 0
      009181 01                    1717 	.db #0x01	; 1
      009182 03                    1718 	.db #0x03	; 3
      009183 07                    1719 	.db #0x07	; 7
      009184 07                    1720 	.db #0x07	; 7
      009185 07                    1721 	.db #0x07	; 7
      009186 07                    1722 	.db #0x07	; 7
      009187 07                    1723 	.db #0x07	; 7
      009188 07                    1724 	.db #0x07	; 7
      009189 07                    1725 	.db #0x07	; 7
      00918A 07                    1726 	.db #0x07	; 7
      00918B 07                    1727 	.db #0x07	; 7
      00918C 07                    1728 	.db #0x07	; 7
      00918D 07                    1729 	.db #0x07	; 7
      00918E C7                    1730 	.db #0xc7	; 199
      00918F E7                    1731 	.db #0xe7	; 231
      009190 F3                    1732 	.db #0xf3	; 243
      009191 F9                    1733 	.db #0xf9	; 249
      009192 FC                    1734 	.db #0xfc	; 252
      009193 00                    1735 	.db #0x00	; 0
      009194 00                    1736 	.db #0x00	; 0
      009195 00                    1737 	.db #0x00	; 0
      009196 00                    1738 	.db #0x00	; 0
      009197 00                    1739 	.db #0x00	; 0
      009198 00                    1740 	.db #0x00	; 0
      009199 00                    1741 	.db #0x00	; 0
      00919A 00                    1742 	.db #0x00	; 0
      00919B 00                    1743 	.db #0x00	; 0
      00919C 00                    1744 	.db #0x00	; 0
      00919D 00                    1745 	.db #0x00	; 0
      00919E 00                    1746 	.db #0x00	; 0
      00919F 00                    1747 	.db #0x00	; 0
      0091A0 00                    1748 	.db #0x00	; 0
      0091A1 00                    1749 	.db #0x00	; 0
      0091A2 07                    1750 	.db #0x07	; 7
      0091A3 0F                    1751 	.db #0x0f	; 15
      0091A4 1F                    1752 	.db #0x1f	; 31
      0091A5 3F                    1753 	.db #0x3f	; 63
      0091A6 7F                    1754 	.db #0x7f	; 127
      0091A7 00                    1755 	.db #0x00	; 0
      0091A8 FC                    1756 	.db #0xfc	; 252
      0091A9 F8                    1757 	.db #0xf8	; 248
      0091AA F2                    1758 	.db #0xf2	; 242
      0091AB E6                    1759 	.db #0xe6	; 230
      0091AC CE                    1760 	.db #0xce	; 206
      0091AD 1E                    1761 	.db #0x1e	; 30
      0091AE 3E                    1762 	.db #0x3e	; 62
      0091AF 3E                    1763 	.db #0x3e	; 62
      0091B0 3E                    1764 	.db #0x3e	; 62
      0091B1 3E                    1765 	.db #0x3e	; 62
      0091B2 3E                    1766 	.db #0x3e	; 62
      0091B3 3E                    1767 	.db #0x3e	; 62
      0091B4 3E                    1768 	.db #0x3e	; 62
      0091B5 1E                    1769 	.db #0x1e	; 30
      0091B6 0E                    1770 	.db #0x0e	; 14
      0091B7 06                    1771 	.db #0x06	; 6
      0091B8 02                    1772 	.db #0x02	; 2
      0091B9 00                    1773 	.db #0x00	; 0
      0091BA 00                    1774 	.db #0x00	; 0
      0091BB 00                    1775 	.db #0x00	; 0
      0091BC 7F                    1776 	.db #0x7f	; 127
      0091BD 3F                    1777 	.db #0x3f	; 63
      0091BE 9F                    1778 	.db #0x9f	; 159
      0091BF CF                    1779 	.db #0xcf	; 207
      0091C0 C7                    1780 	.db #0xc7	; 199
      0091C1 C0                    1781 	.db #0xc0	; 192
      0091C2 C0                    1782 	.db #0xc0	; 192
      0091C3 C0                    1783 	.db #0xc0	; 192
      0091C4 C0                    1784 	.db #0xc0	; 192
      0091C5 C0                    1785 	.db #0xc0	; 192
      0091C6 C0                    1786 	.db #0xc0	; 192
      0091C7 C0                    1787 	.db #0xc0	; 192
      0091C8 C0                    1788 	.db #0xc0	; 192
      0091C9 C0                    1789 	.db #0xc0	; 192
      0091CA C0                    1790 	.db #0xc0	; 192
      0091CB C0                    1791 	.db #0xc0	; 192
      0091CC 80                    1792 	.db #0x80	; 128
      0091CD 00                    1793 	.db #0x00	; 0
      0091CE 00                    1794 	.db #0x00	; 0
      0091CF 00                    1795 	.db #0x00	; 0
      0091D0 00                    1796 	.db #0x00	; 0
      0091D1 01                    1797 	.db #0x01	; 1
      0091D2 03                    1798 	.db #0x03	; 3
      0091D3 07                    1799 	.db #0x07	; 7
      0091D4 07                    1800 	.db #0x07	; 7
      0091D5 07                    1801 	.db #0x07	; 7
      0091D6 07                    1802 	.db #0x07	; 7
      0091D7 07                    1803 	.db #0x07	; 7
      0091D8 07                    1804 	.db #0x07	; 7
      0091D9 07                    1805 	.db #0x07	; 7
      0091DA 07                    1806 	.db #0x07	; 7
      0091DB 07                    1807 	.db #0x07	; 7
      0091DC 07                    1808 	.db #0x07	; 7
      0091DD 07                    1809 	.db #0x07	; 7
      0091DE C7                    1810 	.db #0xc7	; 199
      0091DF E7                    1811 	.db #0xe7	; 231
      0091E0 F3                    1812 	.db #0xf3	; 243
      0091E1 F9                    1813 	.db #0xf9	; 249
      0091E2 FC                    1814 	.db #0xfc	; 252
      0091E3 00                    1815 	.db #0x00	; 0
      0091E4 00                    1816 	.db #0x00	; 0
      0091E5 00                    1817 	.db #0x00	; 0
      0091E6 80                    1818 	.db #0x80	; 128
      0091E7 C0                    1819 	.db #0xc0	; 192
      0091E8 E0                    1820 	.db #0xe0	; 224
      0091E9 F0                    1821 	.db #0xf0	; 240
      0091EA F0                    1822 	.db #0xf0	; 240
      0091EB F8                    1823 	.db #0xf8	; 248
      0091EC F8                    1824 	.db #0xf8	; 248
      0091ED F8                    1825 	.db #0xf8	; 248
      0091EE F8                    1826 	.db #0xf8	; 248
      0091EF F8                    1827 	.db #0xf8	; 248
      0091F0 F8                    1828 	.db #0xf8	; 248
      0091F1 F0                    1829 	.db #0xf0	; 240
      0091F2 E7                    1830 	.db #0xe7	; 231
      0091F3 CF                    1831 	.db #0xcf	; 207
      0091F4 9F                    1832 	.db #0x9f	; 159
      0091F5 3F                    1833 	.db #0x3f	; 63
      0091F6 7F                    1834 	.db #0x7f	; 127
      0091F7 00                    1835 	.db #0x00	; 0
      0091F8 FC                    1836 	.db #0xfc	; 252
      0091F9 F8                    1837 	.db #0xf8	; 248
      0091FA F2                    1838 	.db #0xf2	; 242
      0091FB E6                    1839 	.db #0xe6	; 230
      0091FC CE                    1840 	.db #0xce	; 206
      0091FD 1E                    1841 	.db #0x1e	; 30
      0091FE 3E                    1842 	.db #0x3e	; 62
      0091FF 3E                    1843 	.db #0x3e	; 62
      009200 3E                    1844 	.db #0x3e	; 62
      009201 3E                    1845 	.db #0x3e	; 62
      009202 3E                    1846 	.db #0x3e	; 62
      009203 3E                    1847 	.db #0x3e	; 62
      009204 3E                    1848 	.db #0x3e	; 62
      009205 1E                    1849 	.db #0x1e	; 30
      009206 0E                    1850 	.db #0x0e	; 14
      009207 06                    1851 	.db #0x06	; 6
      009208 02                    1852 	.db #0x02	; 2
      009209 00                    1853 	.db #0x00	; 0
      00920A 00                    1854 	.db #0x00	; 0
      00920B 00                    1855 	.db #0x00	; 0
      00920C 7F                    1856 	.db #0x7f	; 127
      00920D 3F                    1857 	.db #0x3f	; 63
      00920E 9F                    1858 	.db #0x9f	; 159
      00920F CF                    1859 	.db #0xcf	; 207
      009210 C7                    1860 	.db #0xc7	; 199
      009211 C0                    1861 	.db #0xc0	; 192
      009212 C0                    1862 	.db #0xc0	; 192
      009213 C0                    1863 	.db #0xc0	; 192
      009214 C0                    1864 	.db #0xc0	; 192
      009215 C0                    1865 	.db #0xc0	; 192
      009216 C0                    1866 	.db #0xc0	; 192
      009217 C0                    1867 	.db #0xc0	; 192
      009218 C0                    1868 	.db #0xc0	; 192
      009219 C0                    1869 	.db #0xc0	; 192
      00921A C0                    1870 	.db #0xc0	; 192
      00921B C0                    1871 	.db #0xc0	; 192
      00921C 80                    1872 	.db #0x80	; 128
      00921D 00                    1873 	.db #0x00	; 0
      00921E 00                    1874 	.db #0x00	; 0
      00921F 00                    1875 	.db #0x00	; 0
      009220 FC                    1876 	.db #0xfc	; 252
      009221 F9                    1877 	.db #0xf9	; 249
      009222 F3                    1878 	.db #0xf3	; 243
      009223 E7                    1879 	.db #0xe7	; 231
      009224 C7                    1880 	.db #0xc7	; 199
      009225 07                    1881 	.db #0x07	; 7
      009226 07                    1882 	.db #0x07	; 7
      009227 07                    1883 	.db #0x07	; 7
      009228 07                    1884 	.db #0x07	; 7
      009229 07                    1885 	.db #0x07	; 7
      00922A 07                    1886 	.db #0x07	; 7
      00922B 07                    1887 	.db #0x07	; 7
      00922C 07                    1888 	.db #0x07	; 7
      00922D 07                    1889 	.db #0x07	; 7
      00922E C7                    1890 	.db #0xc7	; 199
      00922F E7                    1891 	.db #0xe7	; 231
      009230 F3                    1892 	.db #0xf3	; 243
      009231 F9                    1893 	.db #0xf9	; 249
      009232 FC                    1894 	.db #0xfc	; 252
      009233 00                    1895 	.db #0x00	; 0
      009234 7F                    1896 	.db #0x7f	; 127
      009235 3F                    1897 	.db #0x3f	; 63
      009236 9F                    1898 	.db #0x9f	; 159
      009237 CF                    1899 	.db #0xcf	; 207
      009238 E7                    1900 	.db #0xe7	; 231
      009239 F0                    1901 	.db #0xf0	; 240
      00923A F0                    1902 	.db #0xf0	; 240
      00923B F8                    1903 	.db #0xf8	; 248
      00923C F8                    1904 	.db #0xf8	; 248
      00923D F8                    1905 	.db #0xf8	; 248
      00923E F8                    1906 	.db #0xf8	; 248
      00923F F8                    1907 	.db #0xf8	; 248
      009240 F8                    1908 	.db #0xf8	; 248
      009241 F0                    1909 	.db #0xf0	; 240
      009242 E7                    1910 	.db #0xe7	; 231
      009243 CF                    1911 	.db #0xcf	; 207
      009244 9F                    1912 	.db #0x9f	; 159
      009245 3F                    1913 	.db #0x3f	; 63
      009246 7F                    1914 	.db #0x7f	; 127
      009247 00                    1915 	.db #0x00	; 0
      009248 00                    1916 	.db #0x00	; 0
      009249 00                    1917 	.db #0x00	; 0
      00924A 02                    1918 	.db #0x02	; 2
      00924B 06                    1919 	.db #0x06	; 6
      00924C 0E                    1920 	.db #0x0e	; 14
      00924D 1E                    1921 	.db #0x1e	; 30
      00924E 3E                    1922 	.db #0x3e	; 62
      00924F 3E                    1923 	.db #0x3e	; 62
      009250 3E                    1924 	.db #0x3e	; 62
      009251 3E                    1925 	.db #0x3e	; 62
      009252 3E                    1926 	.db #0x3e	; 62
      009253 3E                    1927 	.db #0x3e	; 62
      009254 3E                    1928 	.db #0x3e	; 62
      009255 1E                    1929 	.db #0x1e	; 30
      009256 CE                    1930 	.db #0xce	; 206
      009257 E6                    1931 	.db #0xe6	; 230
      009258 F2                    1932 	.db #0xf2	; 242
      009259 F8                    1933 	.db #0xf8	; 248
      00925A FC                    1934 	.db #0xfc	; 252
      00925B 00                    1935 	.db #0x00	; 0
      00925C 00                    1936 	.db #0x00	; 0
      00925D 00                    1937 	.db #0x00	; 0
      00925E 00                    1938 	.db #0x00	; 0
      00925F 00                    1939 	.db #0x00	; 0
      009260 00                    1940 	.db #0x00	; 0
      009261 00                    1941 	.db #0x00	; 0
      009262 00                    1942 	.db #0x00	; 0
      009263 00                    1943 	.db #0x00	; 0
      009264 00                    1944 	.db #0x00	; 0
      009265 00                    1945 	.db #0x00	; 0
      009266 00                    1946 	.db #0x00	; 0
      009267 00                    1947 	.db #0x00	; 0
      009268 00                    1948 	.db #0x00	; 0
      009269 00                    1949 	.db #0x00	; 0
      00926A 0F                    1950 	.db #0x0f	; 15
      00926B 1F                    1951 	.db #0x1f	; 31
      00926C 3F                    1952 	.db #0x3f	; 63
      00926D 7F                    1953 	.db #0x7f	; 127
      00926E FF                    1954 	.db #0xff	; 255
      00926F 00                    1955 	.db #0x00	; 0
      009270 00                    1956 	.db #0x00	; 0
      009271 00                    1957 	.db #0x00	; 0
      009272 00                    1958 	.db #0x00	; 0
      009273 00                    1959 	.db #0x00	; 0
      009274 00                    1960 	.db #0x00	; 0
      009275 00                    1961 	.db #0x00	; 0
      009276 00                    1962 	.db #0x00	; 0
      009277 00                    1963 	.db #0x00	; 0
      009278 00                    1964 	.db #0x00	; 0
      009279 00                    1965 	.db #0x00	; 0
      00927A 00                    1966 	.db #0x00	; 0
      00927B 00                    1967 	.db #0x00	; 0
      00927C 00                    1968 	.db #0x00	; 0
      00927D 00                    1969 	.db #0x00	; 0
      00927E E0                    1970 	.db #0xe0	; 224
      00927F F0                    1971 	.db #0xf0	; 240
      009280 F8                    1972 	.db #0xf8	; 248
      009281 FC                    1973 	.db #0xfc	; 252
      009282 FE                    1974 	.db #0xfe	; 254
      009283 00                    1975 	.db #0x00	; 0
      009284 00                    1976 	.db #0x00	; 0
      009285 00                    1977 	.db #0x00	; 0
      009286 00                    1978 	.db #0x00	; 0
      009287 00                    1979 	.db #0x00	; 0
      009288 00                    1980 	.db #0x00	; 0
      009289 00                    1981 	.db #0x00	; 0
      00928A 00                    1982 	.db #0x00	; 0
      00928B 00                    1983 	.db #0x00	; 0
      00928C 00                    1984 	.db #0x00	; 0
      00928D 00                    1985 	.db #0x00	; 0
      00928E 00                    1986 	.db #0x00	; 0
      00928F 00                    1987 	.db #0x00	; 0
      009290 00                    1988 	.db #0x00	; 0
      009291 00                    1989 	.db #0x00	; 0
      009292 07                    1990 	.db #0x07	; 7
      009293 0F                    1991 	.db #0x0f	; 15
      009294 1F                    1992 	.db #0x1f	; 31
      009295 3F                    1993 	.db #0x3f	; 63
      009296 7F                    1994 	.db #0x7f	; 127
      009297 00                    1995 	.db #0x00	; 0
      009298 FC                    1996 	.db #0xfc	; 252
      009299 F8                    1997 	.db #0xf8	; 248
      00929A F2                    1998 	.db #0xf2	; 242
      00929B E6                    1999 	.db #0xe6	; 230
      00929C CE                    2000 	.db #0xce	; 206
      00929D 1E                    2001 	.db #0x1e	; 30
      00929E 3E                    2002 	.db #0x3e	; 62
      00929F 3E                    2003 	.db #0x3e	; 62
      0092A0 3E                    2004 	.db #0x3e	; 62
      0092A1 3E                    2005 	.db #0x3e	; 62
      0092A2 3E                    2006 	.db #0x3e	; 62
      0092A3 3E                    2007 	.db #0x3e	; 62
      0092A4 3E                    2008 	.db #0x3e	; 62
      0092A5 1E                    2009 	.db #0x1e	; 30
      0092A6 CE                    2010 	.db #0xce	; 206
      0092A7 E6                    2011 	.db #0xe6	; 230
      0092A8 F2                    2012 	.db #0xf2	; 242
      0092A9 F8                    2013 	.db #0xf8	; 248
      0092AA FC                    2014 	.db #0xfc	; 252
      0092AB 00                    2015 	.db #0x00	; 0
      0092AC 7F                    2016 	.db #0x7f	; 127
      0092AD 3F                    2017 	.db #0x3f	; 63
      0092AE 9F                    2018 	.db #0x9f	; 159
      0092AF CF                    2019 	.db #0xcf	; 207
      0092B0 C7                    2020 	.db #0xc7	; 199
      0092B1 C0                    2021 	.db #0xc0	; 192
      0092B2 C0                    2022 	.db #0xc0	; 192
      0092B3 C0                    2023 	.db #0xc0	; 192
      0092B4 C0                    2024 	.db #0xc0	; 192
      0092B5 C0                    2025 	.db #0xc0	; 192
      0092B6 C0                    2026 	.db #0xc0	; 192
      0092B7 C0                    2027 	.db #0xc0	; 192
      0092B8 C0                    2028 	.db #0xc0	; 192
      0092B9 C0                    2029 	.db #0xc0	; 192
      0092BA C7                    2030 	.db #0xc7	; 199
      0092BB CF                    2031 	.db #0xcf	; 207
      0092BC 9F                    2032 	.db #0x9f	; 159
      0092BD 3F                    2033 	.db #0x3f	; 63
      0092BE 7F                    2034 	.db #0x7f	; 127
      0092BF 00                    2035 	.db #0x00	; 0
      0092C0 FC                    2036 	.db #0xfc	; 252
      0092C1 F9                    2037 	.db #0xf9	; 249
      0092C2 F3                    2038 	.db #0xf3	; 243
      0092C3 E7                    2039 	.db #0xe7	; 231
      0092C4 C7                    2040 	.db #0xc7	; 199
      0092C5 07                    2041 	.db #0x07	; 7
      0092C6 07                    2042 	.db #0x07	; 7
      0092C7 07                    2043 	.db #0x07	; 7
      0092C8 07                    2044 	.db #0x07	; 7
      0092C9 07                    2045 	.db #0x07	; 7
      0092CA 07                    2046 	.db #0x07	; 7
      0092CB 07                    2047 	.db #0x07	; 7
      0092CC 07                    2048 	.db #0x07	; 7
      0092CD 07                    2049 	.db #0x07	; 7
      0092CE C7                    2050 	.db #0xc7	; 199
      0092CF E7                    2051 	.db #0xe7	; 231
      0092D0 F3                    2052 	.db #0xf3	; 243
      0092D1 F9                    2053 	.db #0xf9	; 249
      0092D2 FC                    2054 	.db #0xfc	; 252
      0092D3 00                    2055 	.db #0x00	; 0
      0092D4 7F                    2056 	.db #0x7f	; 127
      0092D5 3F                    2057 	.db #0x3f	; 63
      0092D6 9F                    2058 	.db #0x9f	; 159
      0092D7 CF                    2059 	.db #0xcf	; 207
      0092D8 E7                    2060 	.db #0xe7	; 231
      0092D9 F0                    2061 	.db #0xf0	; 240
      0092DA F0                    2062 	.db #0xf0	; 240
      0092DB F8                    2063 	.db #0xf8	; 248
      0092DC F8                    2064 	.db #0xf8	; 248
      0092DD F8                    2065 	.db #0xf8	; 248
      0092DE F8                    2066 	.db #0xf8	; 248
      0092DF F8                    2067 	.db #0xf8	; 248
      0092E0 F8                    2068 	.db #0xf8	; 248
      0092E1 F0                    2069 	.db #0xf0	; 240
      0092E2 E7                    2070 	.db #0xe7	; 231
      0092E3 CF                    2071 	.db #0xcf	; 207
      0092E4 9F                    2072 	.db #0x9f	; 159
      0092E5 3F                    2073 	.db #0x3f	; 63
      0092E6 7F                    2074 	.db #0x7f	; 127
      0092E7 00                    2075 	.db #0x00	; 0
      0092E8 FC                    2076 	.db #0xfc	; 252
      0092E9 F8                    2077 	.db #0xf8	; 248
      0092EA F2                    2078 	.db #0xf2	; 242
      0092EB E6                    2079 	.db #0xe6	; 230
      0092EC CE                    2080 	.db #0xce	; 206
      0092ED 1E                    2081 	.db #0x1e	; 30
      0092EE 3E                    2082 	.db #0x3e	; 62
      0092EF 3E                    2083 	.db #0x3e	; 62
      0092F0 3E                    2084 	.db #0x3e	; 62
      0092F1 3E                    2085 	.db #0x3e	; 62
      0092F2 3E                    2086 	.db #0x3e	; 62
      0092F3 3E                    2087 	.db #0x3e	; 62
      0092F4 3E                    2088 	.db #0x3e	; 62
      0092F5 1E                    2089 	.db #0x1e	; 30
      0092F6 CE                    2090 	.db #0xce	; 206
      0092F7 E6                    2091 	.db #0xe6	; 230
      0092F8 F2                    2092 	.db #0xf2	; 242
      0092F9 F8                    2093 	.db #0xf8	; 248
      0092FA FC                    2094 	.db #0xfc	; 252
      0092FB 00                    2095 	.db #0x00	; 0
      0092FC 7F                    2096 	.db #0x7f	; 127
      0092FD 3F                    2097 	.db #0x3f	; 63
      0092FE 9F                    2098 	.db #0x9f	; 159
      0092FF CF                    2099 	.db #0xcf	; 207
      009300 C7                    2100 	.db #0xc7	; 199
      009301 C0                    2101 	.db #0xc0	; 192
      009302 C0                    2102 	.db #0xc0	; 192
      009303 C0                    2103 	.db #0xc0	; 192
      009304 C0                    2104 	.db #0xc0	; 192
      009305 C0                    2105 	.db #0xc0	; 192
      009306 C0                    2106 	.db #0xc0	; 192
      009307 C0                    2107 	.db #0xc0	; 192
      009308 C0                    2108 	.db #0xc0	; 192
      009309 C0                    2109 	.db #0xc0	; 192
      00930A C7                    2110 	.db #0xc7	; 199
      00930B CF                    2111 	.db #0xcf	; 207
      00930C 9F                    2112 	.db #0x9f	; 159
      00930D 3F                    2113 	.db #0x3f	; 63
      00930E 7F                    2114 	.db #0x7f	; 127
      00930F 00                    2115 	.db #0x00	; 0
      009310 00                    2116 	.db #0x00	; 0
      009311 01                    2117 	.db #0x01	; 1
      009312 03                    2118 	.db #0x03	; 3
      009313 07                    2119 	.db #0x07	; 7
      009314 07                    2120 	.db #0x07	; 7
      009315 07                    2121 	.db #0x07	; 7
      009316 07                    2122 	.db #0x07	; 7
      009317 07                    2123 	.db #0x07	; 7
      009318 07                    2124 	.db #0x07	; 7
      009319 07                    2125 	.db #0x07	; 7
      00931A 07                    2126 	.db #0x07	; 7
      00931B 07                    2127 	.db #0x07	; 7
      00931C 07                    2128 	.db #0x07	; 7
      00931D 07                    2129 	.db #0x07	; 7
      00931E C7                    2130 	.db #0xc7	; 199
      00931F E7                    2131 	.db #0xe7	; 231
      009320 F3                    2132 	.db #0xf3	; 243
      009321 F9                    2133 	.db #0xf9	; 249
      009322 FC                    2134 	.db #0xfc	; 252
      009323 00                    2135 	.db #0x00	; 0
      009324 00                    2136 	.db #0x00	; 0
      009325 00                    2137 	.db #0x00	; 0
      009326 80                    2138 	.db #0x80	; 128
      009327 C0                    2139 	.db #0xc0	; 192
      009328 E0                    2140 	.db #0xe0	; 224
      009329 F0                    2141 	.db #0xf0	; 240
      00932A F0                    2142 	.db #0xf0	; 240
      00932B F8                    2143 	.db #0xf8	; 248
      00932C F8                    2144 	.db #0xf8	; 248
      00932D F8                    2145 	.db #0xf8	; 248
      00932E F8                    2146 	.db #0xf8	; 248
      00932F F8                    2147 	.db #0xf8	; 248
      009330 F8                    2148 	.db #0xf8	; 248
      009331 F0                    2149 	.db #0xf0	; 240
      009332 E7                    2150 	.db #0xe7	; 231
      009333 CF                    2151 	.db #0xcf	; 207
      009334 9F                    2152 	.db #0x9f	; 159
      009335 3F                    2153 	.db #0x3f	; 63
      009336 7F                    2154 	.db #0x7f	; 127
      009337 00                    2155 	.db #0x00	; 0
      009338 00                    2156 	.db #0x00	; 0
      009339 00                    2157 	.db #0x00	; 0
      00933A 00                    2158 	.db #0x00	; 0
      00933B 00                    2159 	.db #0x00	; 0
      00933C 00                    2160 	.db #0x00	; 0
      00933D 00                    2161 	.db #0x00	; 0
      00933E 00                    2162 	.db #0x00	; 0
      00933F 00                    2163 	.db #0x00	; 0
      009340 00                    2164 	.db #0x00	; 0
      009341 00                    2165 	.db #0x00	; 0
      009342 00                    2166 	.db #0x00	; 0
      009343 00                    2167 	.db #0x00	; 0
      009344 00                    2168 	.db #0x00	; 0
      009345 00                    2169 	.db #0x00	; 0
      009346 00                    2170 	.db #0x00	; 0
      009347 00                    2171 	.db #0x00	; 0
      009348 00                    2172 	.db #0x00	; 0
      009349 00                    2173 	.db #0x00	; 0
      00934A 00                    2174 	.db #0x00	; 0
      00934B 00                    2175 	.db #0x00	; 0
      00934C 00                    2176 	.db #0x00	; 0
      00934D 00                    2177 	.db #0x00	; 0
      00934E C0                    2178 	.db #0xc0	; 192
      00934F C0                    2179 	.db #0xc0	; 192
      009350 C0                    2180 	.db #0xc0	; 192
      009351 C0                    2181 	.db #0xc0	; 192
      009352 C0                    2182 	.db #0xc0	; 192
      009353 FE                    2183 	.db #0xfe	; 254
      009354 FE                    2184 	.db #0xfe	; 254
      009355 FE                    2185 	.db #0xfe	; 254
      009356 FE                    2186 	.db #0xfe	; 254
      009357 FE                    2187 	.db #0xfe	; 254
      009358 C0                    2188 	.db #0xc0	; 192
      009359 C0                    2189 	.db #0xc0	; 192
      00935A C0                    2190 	.db #0xc0	; 192
      00935B C0                    2191 	.db #0xc0	; 192
      00935C C0                    2192 	.db #0xc0	; 192
      00935D 00                    2193 	.db #0x00	; 0
      00935E 00                    2194 	.db #0x00	; 0
      00935F 00                    2195 	.db #0x00	; 0
      009360 00                    2196 	.db #0x00	; 0
      009361 00                    2197 	.db #0x00	; 0
      009362 07                    2198 	.db #0x07	; 7
      009363 07                    2199 	.db #0x07	; 7
      009364 07                    2200 	.db #0x07	; 7
      009365 07                    2201 	.db #0x07	; 7
      009366 07                    2202 	.db #0x07	; 7
      009367 FF                    2203 	.db #0xff	; 255
      009368 FF                    2204 	.db #0xff	; 255
      009369 FF                    2205 	.db #0xff	; 255
      00936A FF                    2206 	.db #0xff	; 255
      00936B FF                    2207 	.db #0xff	; 255
      00936C 07                    2208 	.db #0x07	; 7
      00936D 07                    2209 	.db #0x07	; 7
      00936E 07                    2210 	.db #0x07	; 7
      00936F 07                    2211 	.db #0x07	; 7
      009370 07                    2212 	.db #0x07	; 7
      009371 00                    2213 	.db #0x00	; 0
      009372 00                    2214 	.db #0x00	; 0
      009373 00                    2215 	.db #0x00	; 0
      009374 00                    2216 	.db #0x00	; 0
      009375 00                    2217 	.db #0x00	; 0
      009376 00                    2218 	.db #0x00	; 0
      009377 00                    2219 	.db #0x00	; 0
      009378 00                    2220 	.db #0x00	; 0
      009379 00                    2221 	.db #0x00	; 0
      00937A 00                    2222 	.db #0x00	; 0
      00937B 00                    2223 	.db #0x00	; 0
      00937C 00                    2224 	.db #0x00	; 0
      00937D 00                    2225 	.db #0x00	; 0
      00937E 00                    2226 	.db #0x00	; 0
      00937F 00                    2227 	.db #0x00	; 0
      009380 00                    2228 	.db #0x00	; 0
      009381 00                    2229 	.db #0x00	; 0
      009382 00                    2230 	.db #0x00	; 0
      009383 00                    2231 	.db #0x00	; 0
      009384 00                    2232 	.db #0x00	; 0
      009385 00                    2233 	.db #0x00	; 0
      009386 00                    2234 	.db #0x00	; 0
      009387 00                    2235 	.db #0x00	; 0
      009388 00                    2236 	.db #0x00	; 0
      009389 00                    2237 	.db #0x00	; 0
      00938A 00                    2238 	.db #0x00	; 0
      00938B 00                    2239 	.db #0x00	; 0
      00938C 00                    2240 	.db #0x00	; 0
      00938D 00                    2241 	.db #0x00	; 0
      00938E 00                    2242 	.db #0x00	; 0
      00938F 00                    2243 	.db #0x00	; 0
      009390 00                    2244 	.db #0x00	; 0
      009391 00                    2245 	.db #0x00	; 0
      009392 00                    2246 	.db #0x00	; 0
      009393 00                    2247 	.db #0x00	; 0
      009394 00                    2248 	.db #0x00	; 0
      009395 00                    2249 	.db #0x00	; 0
      009396 00                    2250 	.db #0x00	; 0
      009397 00                    2251 	.db #0x00	; 0
      009398 00                    2252 	.db #0x00	; 0
      009399 00                    2253 	.db #0x00	; 0
      00939A 00                    2254 	.db #0x00	; 0
      00939B 00                    2255 	.db #0x00	; 0
      00939C 00                    2256 	.db #0x00	; 0
      00939D 00                    2257 	.db #0x00	; 0
      00939E C0                    2258 	.db #0xc0	; 192
      00939F C0                    2259 	.db #0xc0	; 192
      0093A0 C0                    2260 	.db #0xc0	; 192
      0093A1 C0                    2261 	.db #0xc0	; 192
      0093A2 C0                    2262 	.db #0xc0	; 192
      0093A3 C0                    2263 	.db #0xc0	; 192
      0093A4 C0                    2264 	.db #0xc0	; 192
      0093A5 C0                    2265 	.db #0xc0	; 192
      0093A6 C0                    2266 	.db #0xc0	; 192
      0093A7 C0                    2267 	.db #0xc0	; 192
      0093A8 C0                    2268 	.db #0xc0	; 192
      0093A9 C0                    2269 	.db #0xc0	; 192
      0093AA C0                    2270 	.db #0xc0	; 192
      0093AB C0                    2271 	.db #0xc0	; 192
      0093AC C0                    2272 	.db #0xc0	; 192
      0093AD 00                    2273 	.db #0x00	; 0
      0093AE 00                    2274 	.db #0x00	; 0
      0093AF 00                    2275 	.db #0x00	; 0
      0093B0 00                    2276 	.db #0x00	; 0
      0093B1 00                    2277 	.db #0x00	; 0
      0093B2 07                    2278 	.db #0x07	; 7
      0093B3 07                    2279 	.db #0x07	; 7
      0093B4 07                    2280 	.db #0x07	; 7
      0093B5 07                    2281 	.db #0x07	; 7
      0093B6 07                    2282 	.db #0x07	; 7
      0093B7 07                    2283 	.db #0x07	; 7
      0093B8 07                    2284 	.db #0x07	; 7
      0093B9 07                    2285 	.db #0x07	; 7
      0093BA 07                    2286 	.db #0x07	; 7
      0093BB 07                    2287 	.db #0x07	; 7
      0093BC 07                    2288 	.db #0x07	; 7
      0093BD 07                    2289 	.db #0x07	; 7
      0093BE 07                    2290 	.db #0x07	; 7
      0093BF 07                    2291 	.db #0x07	; 7
      0093C0 07                    2292 	.db #0x07	; 7
      0093C1 00                    2293 	.db #0x00	; 0
      0093C2 00                    2294 	.db #0x00	; 0
      0093C3 00                    2295 	.db #0x00	; 0
      0093C4 00                    2296 	.db #0x00	; 0
      0093C5 00                    2297 	.db #0x00	; 0
      0093C6 00                    2298 	.db #0x00	; 0
      0093C7 00                    2299 	.db #0x00	; 0
      0093C8 00                    2300 	.db #0x00	; 0
      0093C9 00                    2301 	.db #0x00	; 0
      0093CA 00                    2302 	.db #0x00	; 0
      0093CB 00                    2303 	.db #0x00	; 0
      0093CC 00                    2304 	.db #0x00	; 0
      0093CD 00                    2305 	.db #0x00	; 0
      0093CE 00                    2306 	.db #0x00	; 0
      0093CF 00                    2307 	.db #0x00	; 0
      0093D0 00                    2308 	.db #0x00	; 0
      0093D1 00                    2309 	.db #0x00	; 0
      0093D2 00                    2310 	.db #0x00	; 0
      0093D3 00                    2311 	.db #0x00	; 0
      0093D4 00                    2312 	.db #0x00	; 0
      0093D5 00                    2313 	.db #0x00	; 0
      0093D6 00                    2314 	.db #0x00	; 0
      0093D7 00                    2315 	.db #0x00	; 0
      0093D8 00                    2316 	.db #0x00	; 0
      0093D9 00                    2317 	.db #0x00	; 0
      0093DA 00                    2318 	.db #0x00	; 0
      0093DB 00                    2319 	.db #0x00	; 0
      0093DC 00                    2320 	.db #0x00	; 0
      0093DD 00                    2321 	.db #0x00	; 0
      0093DE 00                    2322 	.db #0x00	; 0
      0093DF 00                    2323 	.db #0x00	; 0
      0093E0 00                    2324 	.db #0x00	; 0
      0093E1 00                    2325 	.db #0x00	; 0
      0093E2 00                    2326 	.db #0x00	; 0
      0093E3 00                    2327 	.db #0x00	; 0
      0093E4 00                    2328 	.db #0x00	; 0
      0093E5 00                    2329 	.db #0x00	; 0
      0093E6 00                    2330 	.db #0x00	; 0
      0093E7 00                    2331 	.db #0x00	; 0
      0093E8 00                    2332 	.db #0x00	; 0
      0093E9 00                    2333 	.db #0x00	; 0
      0093EA 00                    2334 	.db #0x00	; 0
      0093EB 00                    2335 	.db #0x00	; 0
      0093EC 00                    2336 	.db #0x00	; 0
      0093ED 00                    2337 	.db #0x00	; 0
      0093EE 00                    2338 	.db #0x00	; 0
      0093EF 00                    2339 	.db #0x00	; 0
      0093F0 00                    2340 	.db #0x00	; 0
      0093F1 00                    2341 	.db #0x00	; 0
      0093F2 00                    2342 	.db #0x00	; 0
      0093F3 00                    2343 	.db #0x00	; 0
      0093F4 00                    2344 	.db #0x00	; 0
      0093F5 00                    2345 	.db #0x00	; 0
      0093F6 00                    2346 	.db #0x00	; 0
      0093F7 00                    2347 	.db #0x00	; 0
      0093F8 00                    2348 	.db #0x00	; 0
      0093F9 00                    2349 	.db #0x00	; 0
      0093FA 00                    2350 	.db #0x00	; 0
      0093FB 00                    2351 	.db #0x00	; 0
      0093FC 00                    2352 	.db #0x00	; 0
      0093FD 00                    2353 	.db #0x00	; 0
      0093FE 00                    2354 	.db #0x00	; 0
      0093FF 00                    2355 	.db #0x00	; 0
      009400 00                    2356 	.db #0x00	; 0
      009401 00                    2357 	.db #0x00	; 0
      009402 00                    2358 	.db #0x00	; 0
      009403 00                    2359 	.db #0x00	; 0
      009404 00                    2360 	.db #0x00	; 0
      009405 00                    2361 	.db #0x00	; 0
      009406 00                    2362 	.db #0x00	; 0
      009407 00                    2363 	.db #0x00	; 0
      009408 00                    2364 	.db #0x00	; 0
      009409 00                    2365 	.db #0x00	; 0
      00940A 00                    2366 	.db #0x00	; 0
      00940B 00                    2367 	.db #0x00	; 0
      00940C 00                    2368 	.db #0x00	; 0
      00940D 00                    2369 	.db #0x00	; 0
      00940E 00                    2370 	.db #0x00	; 0
      00940F 00                    2371 	.db #0x00	; 0
      009410 00                    2372 	.db #0x00	; 0
      009411 00                    2373 	.db #0x00	; 0
      009412 00                    2374 	.db #0x00	; 0
      009413 00                    2375 	.db #0x00	; 0
      009414 00                    2376 	.db #0x00	; 0
      009415 00                    2377 	.db #0x00	; 0
      009416 00                    2378 	.db #0x00	; 0
      009417 00                    2379 	.db #0x00	; 0
      009418 3E                    2380 	.db #0x3e	; 62
      009419 3E                    2381 	.db #0x3e	; 62
      00941A 3E                    2382 	.db #0x3e	; 62
      00941B 3E                    2383 	.db #0x3e	; 62
      00941C 3E                    2384 	.db #0x3e	; 62
      00941D 00                    2385 	.db #0x00	; 0
      00941E 00                    2386 	.db #0x00	; 0
      00941F 00                    2387 	.db #0x00	; 0
      009420 00                    2388 	.db #0x00	; 0
      009421 00                    2389 	.db #0x00	; 0
      009422 00                    2390 	.db #0x00	; 0
      009423 00                    2391 	.db #0x00	; 0
      009424 00                    2392 	.db #0x00	; 0
      009425 00                    2393 	.db #0x00	; 0
      009426 00                    2394 	.db #0x00	; 0
                                   2395 	.area INITIALIZER
                                   2396 	.area CABS (ABS)
