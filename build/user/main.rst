                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _clock_setup
                                     13 	.globl _LcdStr
                                     14 	.globl _LcdGotoXYFont
                                     15 	.globl _LcdContrast
                                     16 	.globl _LcdUpdate
                                     17 	.globl _LcdClear
                                     18 	.globl _LcdInit
                                     19 	.globl _GPIO_WriteLow
                                     20 	.globl _GPIO_Init
                                     21 	.globl _CLK_GetFlagStatus
                                     22 	.globl _CLK_SYSCLKConfig
                                     23 	.globl _CLK_HSIPrescalerConfig
                                     24 	.globl _CLK_ClockSwitchConfig
                                     25 	.globl _CLK_PeripheralClockConfig
                                     26 	.globl _CLK_ClockSwitchCmd
                                     27 	.globl _CLK_LSICmd
                                     28 	.globl _CLK_HSICmd
                                     29 	.globl _CLK_HSECmd
                                     30 	.globl _CLK_DeInit
                                     31 ;--------------------------------------------------------
                                     32 ; ram data
                                     33 ;--------------------------------------------------------
                                     34 	.area DATA
                                     35 ;--------------------------------------------------------
                                     36 ; ram data
                                     37 ;--------------------------------------------------------
                                     38 	.area INITIALIZED
                                     39 ;--------------------------------------------------------
                                     40 ; Stack segment in internal ram 
                                     41 ;--------------------------------------------------------
                                     42 	.area	SSEG
      009FD4                         43 __start__stack:
      009FD4                         44 	.ds	1
                                     45 
                                     46 ;--------------------------------------------------------
                                     47 ; absolute external ram data
                                     48 ;--------------------------------------------------------
                                     49 	.area DABS (ABS)
                                     50 ;--------------------------------------------------------
                                     51 ; interrupt vector 
                                     52 ;--------------------------------------------------------
                                     53 	.area HOME
      008000                         54 __interrupt_vect:
      008000 82 00 80 83             55 	int s_GSINIT ;reset
      008004 82 00 00 00             56 	int 0x0000 ;trap
      008008 82 00 00 00             57 	int 0x0000 ;int0
      00800C 82 00 00 00             58 	int 0x0000 ;int1
      008010 82 00 00 00             59 	int 0x0000 ;int2
      008014 82 00 00 00             60 	int 0x0000 ;int3
      008018 82 00 00 00             61 	int 0x0000 ;int4
      00801C 82 00 00 00             62 	int 0x0000 ;int5
      008020 82 00 00 00             63 	int 0x0000 ;int6
      008024 82 00 00 00             64 	int 0x0000 ;int7
      008028 82 00 00 00             65 	int 0x0000 ;int8
      00802C 82 00 00 00             66 	int 0x0000 ;int9
      008030 82 00 00 00             67 	int 0x0000 ;int10
      008034 82 00 00 00             68 	int 0x0000 ;int11
      008038 82 00 00 00             69 	int 0x0000 ;int12
      00803C 82 00 00 00             70 	int 0x0000 ;int13
      008040 82 00 00 00             71 	int 0x0000 ;int14
      008044 82 00 00 00             72 	int 0x0000 ;int15
      008048 82 00 00 00             73 	int 0x0000 ;int16
      00804C 82 00 00 00             74 	int 0x0000 ;int17
      008050 82 00 00 00             75 	int 0x0000 ;int18
      008054 82 00 00 00             76 	int 0x0000 ;int19
      008058 82 00 00 00             77 	int 0x0000 ;int20
      00805C 82 00 00 00             78 	int 0x0000 ;int21
      008060 82 00 00 00             79 	int 0x0000 ;int22
      008064 82 00 00 00             80 	int 0x0000 ;int23
      008068 82 00 00 00             81 	int 0x0000 ;int24
      00806C 82 00 00 00             82 	int 0x0000 ;int25
      008070 82 00 00 00             83 	int 0x0000 ;int26
      008074 82 00 00 00             84 	int 0x0000 ;int27
      008078 82 00 00 00             85 	int 0x0000 ;int28
      00807C 82 00 00 00             86 	int 0x0000 ;int29
                                     87 ;--------------------------------------------------------
                                     88 ; global & static initialisations
                                     89 ;--------------------------------------------------------
                                     90 	.area HOME
                                     91 	.area GSINIT
                                     92 	.area GSFINAL
                                     93 	.area GSINIT
      008083                         94 __sdcc_gs_init_startup:
      008083                         95 __sdcc_init_data:
                                     96 ; stm8_genXINIT() start
      008083 AE 01 FE         [ 2]   97 	ldw x, #l_DATA
      008086 27 07            [ 1]   98 	jreq	00002$
      008088                         99 00001$:
      008088 72 4F 00 00      [ 1]  100 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  101 	decw x
      00808D 26 F9            [ 1]  102 	jrne	00001$
      00808F                        103 00002$:
      00808F AE 00 00         [ 2]  104 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  105 	jreq	00004$
      008094                        106 00003$:
      008094 D6 9F D3         [ 1]  107 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 01 FE         [ 1]  108 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  109 	decw	x
      00809B 26 F7            [ 1]  110 	jrne	00003$
      00809D                        111 00004$:
                                    112 ; stm8_genXINIT() end
                                    113 	.area GSFINAL
      00809D CC 80 80         [ 2]  114 	jp	__sdcc_program_startup
                                    115 ;--------------------------------------------------------
                                    116 ; Home
                                    117 ;--------------------------------------------------------
                                    118 	.area HOME
                                    119 	.area HOME
      008080                        120 __sdcc_program_startup:
      008080 CC 92 08         [ 2]  121 	jp	_main
                                    122 ;	return from main will return to caller
                                    123 ;--------------------------------------------------------
                                    124 ; code
                                    125 ;--------------------------------------------------------
                                    126 	.area CODE
                                    127 ;	user/main.c: 22: void clock_setup(void)
                                    128 ;	-----------------------------------------
                                    129 ;	 function clock_setup
                                    130 ;	-----------------------------------------
      009188                        131 _clock_setup:
                                    132 ;	user/main.c: 24: CLK_DeInit();
      009188 CD 9A 80         [ 4]  133 	call	_CLK_DeInit
                                    134 ;	user/main.c: 25: CLK_HSECmd(DISABLE);
      00918B 4B 00            [ 1]  135 	push	#0x00
      00918D CD 9A CC         [ 4]  136 	call	_CLK_HSECmd
      009190 84               [ 1]  137 	pop	a
                                    138 ;	user/main.c: 26: CLK_LSICmd(DISABLE);
      009191 4B 00            [ 1]  139 	push	#0x00
      009193 CD 9A E8         [ 4]  140 	call	_CLK_LSICmd
      009196 84               [ 1]  141 	pop	a
                                    142 ;	user/main.c: 27: CLK_HSICmd(ENABLE);
      009197 4B 01            [ 1]  143 	push	#0x01
      009199 CD 9A DA         [ 4]  144 	call	_CLK_HSICmd
      00919C 84               [ 1]  145 	pop	a
                                    146 ;	user/main.c: 28: while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
      00919D                        147 00101$:
      00919D 4B 02            [ 1]  148 	push	#0x02
      00919F 4B 01            [ 1]  149 	push	#0x01
      0091A1 CD 9D 7E         [ 4]  150 	call	_CLK_GetFlagStatus
      0091A4 85               [ 2]  151 	popw	x
      0091A5 4D               [ 1]  152 	tnz	a
      0091A6 27 F5            [ 1]  153 	jreq	00101$
                                    154 ;	user/main.c: 29: CLK_ClockSwitchCmd(ENABLE);
      0091A8 4B 01            [ 1]  155 	push	#0x01
      0091AA CD 9B 0A         [ 4]  156 	call	_CLK_ClockSwitchCmd
      0091AD 84               [ 1]  157 	pop	a
                                    158 ;	user/main.c: 30: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      0091AE 4B 00            [ 1]  159 	push	#0x00
      0091B0 CD 9C 4D         [ 4]  160 	call	_CLK_HSIPrescalerConfig
      0091B3 84               [ 1]  161 	pop	a
                                    162 ;	user/main.c: 31: CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);
      0091B4 4B 81            [ 1]  163 	push	#0x81
      0091B6 CD 9C C4         [ 4]  164 	call	_CLK_SYSCLKConfig
      0091B9 84               [ 1]  165 	pop	a
                                    166 ;	user/main.c: 32: CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
      0091BA 4B 01            [ 1]  167 	push	#0x01
      0091BC 4B 00            [ 1]  168 	push	#0x00
      0091BE 4B E1            [ 1]  169 	push	#0xe1
      0091C0 4B 01            [ 1]  170 	push	#0x01
      0091C2 CD 9B 88         [ 4]  171 	call	_CLK_ClockSwitchConfig
      0091C5 5B 04            [ 2]  172 	addw	sp, #4
                                    173 ;	user/main.c: 33: CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
      0091C7 4B 01            [ 1]  174 	push	#0x01
      0091C9 4B 01            [ 1]  175 	push	#0x01
      0091CB CD 9B 32         [ 4]  176 	call	_CLK_PeripheralClockConfig
      0091CE 85               [ 2]  177 	popw	x
                                    178 ;	user/main.c: 34: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
      0091CF 4B 01            [ 1]  179 	push	#0x01
      0091D1 4B 00            [ 1]  180 	push	#0x00
      0091D3 CD 9B 32         [ 4]  181 	call	_CLK_PeripheralClockConfig
      0091D6 85               [ 2]  182 	popw	x
                                    183 ;	user/main.c: 35: CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
      0091D7 4B 00            [ 1]  184 	push	#0x00
      0091D9 4B 13            [ 1]  185 	push	#0x13
      0091DB CD 9B 32         [ 4]  186 	call	_CLK_PeripheralClockConfig
      0091DE 85               [ 2]  187 	popw	x
                                    188 ;	user/main.c: 36: CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
      0091DF 4B 00            [ 1]  189 	push	#0x00
      0091E1 4B 12            [ 1]  190 	push	#0x12
      0091E3 CD 9B 32         [ 4]  191 	call	_CLK_PeripheralClockConfig
      0091E6 85               [ 2]  192 	popw	x
                                    193 ;	user/main.c: 37: CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
      0091E7 4B 00            [ 1]  194 	push	#0x00
      0091E9 4B 03            [ 1]  195 	push	#0x03
      0091EB CD 9B 32         [ 4]  196 	call	_CLK_PeripheralClockConfig
      0091EE 85               [ 2]  197 	popw	x
                                    198 ;	user/main.c: 38: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
      0091EF 4B 00            [ 1]  199 	push	#0x00
      0091F1 4B 07            [ 1]  200 	push	#0x07
      0091F3 CD 9B 32         [ 4]  201 	call	_CLK_PeripheralClockConfig
      0091F6 85               [ 2]  202 	popw	x
                                    203 ;	user/main.c: 39: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
      0091F7 4B 00            [ 1]  204 	push	#0x00
      0091F9 4B 05            [ 1]  205 	push	#0x05
      0091FB CD 9B 32         [ 4]  206 	call	_CLK_PeripheralClockConfig
      0091FE 85               [ 2]  207 	popw	x
                                    208 ;	user/main.c: 40: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
      0091FF 4B 01            [ 1]  209 	push	#0x01
      009201 4B 04            [ 1]  210 	push	#0x04
      009203 CD 9B 32         [ 4]  211 	call	_CLK_PeripheralClockConfig
      009206 85               [ 2]  212 	popw	x
      009207 81               [ 4]  213 	ret
                                    214 ;	user/main.c: 68: void main() 
                                    215 ;	-----------------------------------------
                                    216 ;	 function main
                                    217 ;	-----------------------------------------
      009208                        218 _main:
                                    219 ;	user/main.c: 71: clock_setup();
      009208 CD 91 88         [ 4]  220 	call	_clock_setup
                                    221 ;	user/main.c: 77: GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
      00920B 4B F0            [ 1]  222 	push	#0xf0
      00920D 4B 20            [ 1]  223 	push	#0x20
      00920F 4B 05            [ 1]  224 	push	#0x05
      009211 4B 50            [ 1]  225 	push	#0x50
      009213 CD 9E 0C         [ 4]  226 	call	_GPIO_Init
      009216 5B 04            [ 2]  227 	addw	sp, #4
                                    228 ;	user/main.c: 78: GPIO_Init(GPIOC, GPIO_PIN_5|GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST);
      009218 4B F0            [ 1]  229 	push	#0xf0
      00921A 4B 60            [ 1]  230 	push	#0x60
      00921C 4B 0A            [ 1]  231 	push	#0x0a
      00921E 4B 50            [ 1]  232 	push	#0x50
      009220 CD 9E 0C         [ 4]  233 	call	_GPIO_Init
      009223 5B 04            [ 2]  234 	addw	sp, #4
                                    235 ;	user/main.c: 79: GPIO_Init(GPIOD, GPIO_PIN_1|GPIO_PIN_2|GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
      009225 4B F0            [ 1]  236 	push	#0xf0
      009227 4B 0E            [ 1]  237 	push	#0x0e
      009229 4B 0F            [ 1]  238 	push	#0x0f
      00922B 4B 50            [ 1]  239 	push	#0x50
      00922D CD 9E 0C         [ 4]  240 	call	_GPIO_Init
      009230 5B 04            [ 2]  241 	addw	sp, #4
                                    242 ;	user/main.c: 80: GPIO_WriteLow(GPIOB, GPIO_PIN_5);
      009232 4B 20            [ 1]  243 	push	#0x20
      009234 4B 05            [ 1]  244 	push	#0x05
      009236 4B 50            [ 1]  245 	push	#0x50
      009238 CD 9E A7         [ 4]  246 	call	_GPIO_WriteLow
      00923B 5B 03            [ 2]  247 	addw	sp, #3
                                    248 ;	user/main.c: 81: LcdInit();
      00923D CD 80 A0         [ 4]  249 	call	_LcdInit
                                    250 ;	user/main.c: 82: LcdContrast(0x3E);
      009240 4B 3E            [ 1]  251 	push	#0x3e
      009242 CD 82 66         [ 4]  252 	call	_LcdContrast
      009245 84               [ 1]  253 	pop	a
                                    254 ;	user/main.c: 83: LcdClear();
      009246 CD 81 2E         [ 4]  255 	call	_LcdClear
                                    256 ;	user/main.c: 84: LcdGotoXYFont(1,1);
      009249 4B 01            [ 1]  257 	push	#0x01
      00924B 4B 01            [ 1]  258 	push	#0x01
      00924D CD 82 82         [ 4]  259 	call	_LcdGotoXYFont
      009250 85               [ 2]  260 	popw	x
                                    261 ;	user/main.c: 85: LcdStr(FONT_2X, (uint8_t *)"nhantt");
      009251 AE 9A 6D         [ 2]  262 	ldw	x, #___str_0+0
      009254 89               [ 2]  263 	pushw	x
      009255 4B 01            [ 1]  264 	push	#0x01
      009257 CD 85 E9         [ 4]  265 	call	_LcdStr
      00925A 5B 03            [ 2]  266 	addw	sp, #3
                                    267 ;	user/main.c: 86: LcdGotoXYFont(1,4);
      00925C 4B 04            [ 1]  268 	push	#0x04
      00925E 4B 01            [ 1]  269 	push	#0x01
      009260 CD 82 82         [ 4]  270 	call	_LcdGotoXYFont
      009263 85               [ 2]  271 	popw	x
                                    272 ;	user/main.c: 87: LcdStr(FONT_1X, (uint8_t *)"01268090091");
      009264 AE 9A 74         [ 2]  273 	ldw	x, #___str_1+0
      009267 89               [ 2]  274 	pushw	x
      009268 4B 00            [ 1]  275 	push	#0x00
      00926A CD 85 E9         [ 4]  276 	call	_LcdStr
      00926D 5B 03            [ 2]  277 	addw	sp, #3
                                    278 ;	user/main.c: 88: LcdUpdate();
      00926F CD 81 4A         [ 4]  279 	call	_LcdUpdate
                                    280 ;	user/main.c: 89: while(1) 
      009272                        281 00102$:
      009272 20 FE            [ 2]  282 	jra	00102$
      009274 81               [ 4]  283 	ret
                                    284 	.area CODE
      009275                        285 _FontLookup:
      009275 00                     286 	.db #0x00	; 0
      009276 00                     287 	.db #0x00	; 0
      009277 00                     288 	.db #0x00	; 0
      009278 00                     289 	.db #0x00	; 0
      009279 00                     290 	.db #0x00	; 0
      00927A 00                     291 	.db #0x00	; 0
      00927B 00                     292 	.db #0x00	; 0
      00927C 5F                     293 	.db #0x5f	; 95
      00927D 00                     294 	.db #0x00	; 0
      00927E 00                     295 	.db #0x00	; 0
      00927F 00                     296 	.db #0x00	; 0
      009280 07                     297 	.db #0x07	; 7
      009281 00                     298 	.db #0x00	; 0
      009282 07                     299 	.db #0x07	; 7
      009283 00                     300 	.db #0x00	; 0
      009284 14                     301 	.db #0x14	; 20
      009285 7F                     302 	.db #0x7f	; 127
      009286 14                     303 	.db #0x14	; 20
      009287 7F                     304 	.db #0x7f	; 127
      009288 14                     305 	.db #0x14	; 20
      009289 24                     306 	.db #0x24	; 36
      00928A 2A                     307 	.db #0x2a	; 42
      00928B 7F                     308 	.db #0x7f	; 127
      00928C 2A                     309 	.db #0x2a	; 42
      00928D 12                     310 	.db #0x12	; 18
      00928E 4C                     311 	.db #0x4c	; 76	'L'
      00928F 2C                     312 	.db #0x2c	; 44
      009290 10                     313 	.db #0x10	; 16
      009291 68                     314 	.db #0x68	; 104	'h'
      009292 64                     315 	.db #0x64	; 100	'd'
      009293 36                     316 	.db #0x36	; 54	'6'
      009294 49                     317 	.db #0x49	; 73	'I'
      009295 55                     318 	.db #0x55	; 85	'U'
      009296 22                     319 	.db #0x22	; 34
      009297 50                     320 	.db #0x50	; 80	'P'
      009298 00                     321 	.db #0x00	; 0
      009299 05                     322 	.db #0x05	; 5
      00929A 03                     323 	.db #0x03	; 3
      00929B 00                     324 	.db #0x00	; 0
      00929C 00                     325 	.db #0x00	; 0
      00929D 00                     326 	.db #0x00	; 0
      00929E 1C                     327 	.db #0x1c	; 28
      00929F 22                     328 	.db #0x22	; 34
      0092A0 41                     329 	.db #0x41	; 65	'A'
      0092A1 00                     330 	.db #0x00	; 0
      0092A2 00                     331 	.db #0x00	; 0
      0092A3 41                     332 	.db #0x41	; 65	'A'
      0092A4 22                     333 	.db #0x22	; 34
      0092A5 1C                     334 	.db #0x1c	; 28
      0092A6 00                     335 	.db #0x00	; 0
      0092A7 14                     336 	.db #0x14	; 20
      0092A8 08                     337 	.db #0x08	; 8
      0092A9 3E                     338 	.db #0x3e	; 62
      0092AA 08                     339 	.db #0x08	; 8
      0092AB 14                     340 	.db #0x14	; 20
      0092AC 08                     341 	.db #0x08	; 8
      0092AD 08                     342 	.db #0x08	; 8
      0092AE 3E                     343 	.db #0x3e	; 62
      0092AF 08                     344 	.db #0x08	; 8
      0092B0 08                     345 	.db #0x08	; 8
      0092B1 00                     346 	.db #0x00	; 0
      0092B2 00                     347 	.db #0x00	; 0
      0092B3 50                     348 	.db #0x50	; 80	'P'
      0092B4 30                     349 	.db #0x30	; 48	'0'
      0092B5 00                     350 	.db #0x00	; 0
      0092B6 10                     351 	.db #0x10	; 16
      0092B7 10                     352 	.db #0x10	; 16
      0092B8 10                     353 	.db #0x10	; 16
      0092B9 10                     354 	.db #0x10	; 16
      0092BA 10                     355 	.db #0x10	; 16
      0092BB 00                     356 	.db #0x00	; 0
      0092BC 60                     357 	.db #0x60	; 96
      0092BD 60                     358 	.db #0x60	; 96
      0092BE 00                     359 	.db #0x00	; 0
      0092BF 00                     360 	.db #0x00	; 0
      0092C0 20                     361 	.db #0x20	; 32
      0092C1 10                     362 	.db #0x10	; 16
      0092C2 08                     363 	.db #0x08	; 8
      0092C3 04                     364 	.db #0x04	; 4
      0092C4 02                     365 	.db #0x02	; 2
      0092C5 3E                     366 	.db #0x3e	; 62
      0092C6 51                     367 	.db #0x51	; 81	'Q'
      0092C7 49                     368 	.db #0x49	; 73	'I'
      0092C8 45                     369 	.db #0x45	; 69	'E'
      0092C9 3E                     370 	.db #0x3e	; 62
      0092CA 00                     371 	.db #0x00	; 0
      0092CB 42                     372 	.db #0x42	; 66	'B'
      0092CC 7F                     373 	.db #0x7f	; 127
      0092CD 40                     374 	.db #0x40	; 64
      0092CE 00                     375 	.db #0x00	; 0
      0092CF 42                     376 	.db #0x42	; 66	'B'
      0092D0 61                     377 	.db #0x61	; 97	'a'
      0092D1 51                     378 	.db #0x51	; 81	'Q'
      0092D2 49                     379 	.db #0x49	; 73	'I'
      0092D3 46                     380 	.db #0x46	; 70	'F'
      0092D4 21                     381 	.db #0x21	; 33
      0092D5 41                     382 	.db #0x41	; 65	'A'
      0092D6 45                     383 	.db #0x45	; 69	'E'
      0092D7 4B                     384 	.db #0x4b	; 75	'K'
      0092D8 31                     385 	.db #0x31	; 49	'1'
      0092D9 18                     386 	.db #0x18	; 24
      0092DA 14                     387 	.db #0x14	; 20
      0092DB 12                     388 	.db #0x12	; 18
      0092DC 7F                     389 	.db #0x7f	; 127
      0092DD 10                     390 	.db #0x10	; 16
      0092DE 27                     391 	.db #0x27	; 39
      0092DF 45                     392 	.db #0x45	; 69	'E'
      0092E0 45                     393 	.db #0x45	; 69	'E'
      0092E1 45                     394 	.db #0x45	; 69	'E'
      0092E2 39                     395 	.db #0x39	; 57	'9'
      0092E3 3C                     396 	.db #0x3c	; 60
      0092E4 4A                     397 	.db #0x4a	; 74	'J'
      0092E5 49                     398 	.db #0x49	; 73	'I'
      0092E6 49                     399 	.db #0x49	; 73	'I'
      0092E7 30                     400 	.db #0x30	; 48	'0'
      0092E8 01                     401 	.db #0x01	; 1
      0092E9 71                     402 	.db #0x71	; 113	'q'
      0092EA 09                     403 	.db #0x09	; 9
      0092EB 05                     404 	.db #0x05	; 5
      0092EC 03                     405 	.db #0x03	; 3
      0092ED 36                     406 	.db #0x36	; 54	'6'
      0092EE 49                     407 	.db #0x49	; 73	'I'
      0092EF 49                     408 	.db #0x49	; 73	'I'
      0092F0 49                     409 	.db #0x49	; 73	'I'
      0092F1 36                     410 	.db #0x36	; 54	'6'
      0092F2 06                     411 	.db #0x06	; 6
      0092F3 49                     412 	.db #0x49	; 73	'I'
      0092F4 49                     413 	.db #0x49	; 73	'I'
      0092F5 29                     414 	.db #0x29	; 41
      0092F6 1E                     415 	.db #0x1e	; 30
      0092F7 00                     416 	.db #0x00	; 0
      0092F8 36                     417 	.db #0x36	; 54	'6'
      0092F9 36                     418 	.db #0x36	; 54	'6'
      0092FA 00                     419 	.db #0x00	; 0
      0092FB 00                     420 	.db #0x00	; 0
      0092FC 00                     421 	.db #0x00	; 0
      0092FD 56                     422 	.db #0x56	; 86	'V'
      0092FE 36                     423 	.db #0x36	; 54	'6'
      0092FF 00                     424 	.db #0x00	; 0
      009300 00                     425 	.db #0x00	; 0
      009301 08                     426 	.db #0x08	; 8
      009302 14                     427 	.db #0x14	; 20
      009303 22                     428 	.db #0x22	; 34
      009304 41                     429 	.db #0x41	; 65	'A'
      009305 00                     430 	.db #0x00	; 0
      009306 14                     431 	.db #0x14	; 20
      009307 14                     432 	.db #0x14	; 20
      009308 14                     433 	.db #0x14	; 20
      009309 14                     434 	.db #0x14	; 20
      00930A 14                     435 	.db #0x14	; 20
      00930B 00                     436 	.db #0x00	; 0
      00930C 41                     437 	.db #0x41	; 65	'A'
      00930D 22                     438 	.db #0x22	; 34
      00930E 14                     439 	.db #0x14	; 20
      00930F 08                     440 	.db #0x08	; 8
      009310 02                     441 	.db #0x02	; 2
      009311 01                     442 	.db #0x01	; 1
      009312 51                     443 	.db #0x51	; 81	'Q'
      009313 09                     444 	.db #0x09	; 9
      009314 06                     445 	.db #0x06	; 6
      009315 32                     446 	.db #0x32	; 50	'2'
      009316 49                     447 	.db #0x49	; 73	'I'
      009317 79                     448 	.db #0x79	; 121	'y'
      009318 41                     449 	.db #0x41	; 65	'A'
      009319 3E                     450 	.db #0x3e	; 62
      00931A 7E                     451 	.db #0x7e	; 126
      00931B 11                     452 	.db #0x11	; 17
      00931C 11                     453 	.db #0x11	; 17
      00931D 11                     454 	.db #0x11	; 17
      00931E 7E                     455 	.db #0x7e	; 126
      00931F 7F                     456 	.db #0x7f	; 127
      009320 49                     457 	.db #0x49	; 73	'I'
      009321 49                     458 	.db #0x49	; 73	'I'
      009322 49                     459 	.db #0x49	; 73	'I'
      009323 36                     460 	.db #0x36	; 54	'6'
      009324 3E                     461 	.db #0x3e	; 62
      009325 41                     462 	.db #0x41	; 65	'A'
      009326 41                     463 	.db #0x41	; 65	'A'
      009327 41                     464 	.db #0x41	; 65	'A'
      009328 22                     465 	.db #0x22	; 34
      009329 7F                     466 	.db #0x7f	; 127
      00932A 41                     467 	.db #0x41	; 65	'A'
      00932B 41                     468 	.db #0x41	; 65	'A'
      00932C 22                     469 	.db #0x22	; 34
      00932D 1C                     470 	.db #0x1c	; 28
      00932E 7F                     471 	.db #0x7f	; 127
      00932F 49                     472 	.db #0x49	; 73	'I'
      009330 49                     473 	.db #0x49	; 73	'I'
      009331 49                     474 	.db #0x49	; 73	'I'
      009332 41                     475 	.db #0x41	; 65	'A'
      009333 7F                     476 	.db #0x7f	; 127
      009334 09                     477 	.db #0x09	; 9
      009335 09                     478 	.db #0x09	; 9
      009336 09                     479 	.db #0x09	; 9
      009337 01                     480 	.db #0x01	; 1
      009338 3E                     481 	.db #0x3e	; 62
      009339 41                     482 	.db #0x41	; 65	'A'
      00933A 49                     483 	.db #0x49	; 73	'I'
      00933B 49                     484 	.db #0x49	; 73	'I'
      00933C 7A                     485 	.db #0x7a	; 122	'z'
      00933D 7F                     486 	.db #0x7f	; 127
      00933E 08                     487 	.db #0x08	; 8
      00933F 08                     488 	.db #0x08	; 8
      009340 08                     489 	.db #0x08	; 8
      009341 7F                     490 	.db #0x7f	; 127
      009342 00                     491 	.db #0x00	; 0
      009343 41                     492 	.db #0x41	; 65	'A'
      009344 7F                     493 	.db #0x7f	; 127
      009345 41                     494 	.db #0x41	; 65	'A'
      009346 00                     495 	.db #0x00	; 0
      009347 20                     496 	.db #0x20	; 32
      009348 40                     497 	.db #0x40	; 64
      009349 41                     498 	.db #0x41	; 65	'A'
      00934A 3F                     499 	.db #0x3f	; 63
      00934B 01                     500 	.db #0x01	; 1
      00934C 7F                     501 	.db #0x7f	; 127
      00934D 08                     502 	.db #0x08	; 8
      00934E 14                     503 	.db #0x14	; 20
      00934F 22                     504 	.db #0x22	; 34
      009350 41                     505 	.db #0x41	; 65	'A'
      009351 7F                     506 	.db #0x7f	; 127
      009352 40                     507 	.db #0x40	; 64
      009353 40                     508 	.db #0x40	; 64
      009354 40                     509 	.db #0x40	; 64
      009355 40                     510 	.db #0x40	; 64
      009356 7F                     511 	.db #0x7f	; 127
      009357 02                     512 	.db #0x02	; 2
      009358 0C                     513 	.db #0x0c	; 12
      009359 02                     514 	.db #0x02	; 2
      00935A 7F                     515 	.db #0x7f	; 127
      00935B 7F                     516 	.db #0x7f	; 127
      00935C 04                     517 	.db #0x04	; 4
      00935D 08                     518 	.db #0x08	; 8
      00935E 10                     519 	.db #0x10	; 16
      00935F 7F                     520 	.db #0x7f	; 127
      009360 3E                     521 	.db #0x3e	; 62
      009361 41                     522 	.db #0x41	; 65	'A'
      009362 41                     523 	.db #0x41	; 65	'A'
      009363 41                     524 	.db #0x41	; 65	'A'
      009364 3E                     525 	.db #0x3e	; 62
      009365 7F                     526 	.db #0x7f	; 127
      009366 09                     527 	.db #0x09	; 9
      009367 09                     528 	.db #0x09	; 9
      009368 09                     529 	.db #0x09	; 9
      009369 06                     530 	.db #0x06	; 6
      00936A 3E                     531 	.db #0x3e	; 62
      00936B 41                     532 	.db #0x41	; 65	'A'
      00936C 51                     533 	.db #0x51	; 81	'Q'
      00936D 21                     534 	.db #0x21	; 33
      00936E 5E                     535 	.db #0x5e	; 94
      00936F 7F                     536 	.db #0x7f	; 127
      009370 09                     537 	.db #0x09	; 9
      009371 19                     538 	.db #0x19	; 25
      009372 29                     539 	.db #0x29	; 41
      009373 46                     540 	.db #0x46	; 70	'F'
      009374 46                     541 	.db #0x46	; 70	'F'
      009375 49                     542 	.db #0x49	; 73	'I'
      009376 49                     543 	.db #0x49	; 73	'I'
      009377 49                     544 	.db #0x49	; 73	'I'
      009378 31                     545 	.db #0x31	; 49	'1'
      009379 01                     546 	.db #0x01	; 1
      00937A 01                     547 	.db #0x01	; 1
      00937B 7F                     548 	.db #0x7f	; 127
      00937C 01                     549 	.db #0x01	; 1
      00937D 01                     550 	.db #0x01	; 1
      00937E 3F                     551 	.db #0x3f	; 63
      00937F 40                     552 	.db #0x40	; 64
      009380 40                     553 	.db #0x40	; 64
      009381 40                     554 	.db #0x40	; 64
      009382 3F                     555 	.db #0x3f	; 63
      009383 1F                     556 	.db #0x1f	; 31
      009384 20                     557 	.db #0x20	; 32
      009385 40                     558 	.db #0x40	; 64
      009386 20                     559 	.db #0x20	; 32
      009387 1F                     560 	.db #0x1f	; 31
      009388 3F                     561 	.db #0x3f	; 63
      009389 40                     562 	.db #0x40	; 64
      00938A 38                     563 	.db #0x38	; 56	'8'
      00938B 40                     564 	.db #0x40	; 64
      00938C 3F                     565 	.db #0x3f	; 63
      00938D 63                     566 	.db #0x63	; 99	'c'
      00938E 14                     567 	.db #0x14	; 20
      00938F 08                     568 	.db #0x08	; 8
      009390 14                     569 	.db #0x14	; 20
      009391 63                     570 	.db #0x63	; 99	'c'
      009392 07                     571 	.db #0x07	; 7
      009393 08                     572 	.db #0x08	; 8
      009394 70                     573 	.db #0x70	; 112	'p'
      009395 08                     574 	.db #0x08	; 8
      009396 07                     575 	.db #0x07	; 7
      009397 61                     576 	.db #0x61	; 97	'a'
      009398 51                     577 	.db #0x51	; 81	'Q'
      009399 49                     578 	.db #0x49	; 73	'I'
      00939A 45                     579 	.db #0x45	; 69	'E'
      00939B 43                     580 	.db #0x43	; 67	'C'
      00939C 00                     581 	.db #0x00	; 0
      00939D 7F                     582 	.db #0x7f	; 127
      00939E 41                     583 	.db #0x41	; 65	'A'
      00939F 41                     584 	.db #0x41	; 65	'A'
      0093A0 00                     585 	.db #0x00	; 0
      0093A1 02                     586 	.db #0x02	; 2
      0093A2 04                     587 	.db #0x04	; 4
      0093A3 08                     588 	.db #0x08	; 8
      0093A4 10                     589 	.db #0x10	; 16
      0093A5 20                     590 	.db #0x20	; 32
      0093A6 00                     591 	.db #0x00	; 0
      0093A7 41                     592 	.db #0x41	; 65	'A'
      0093A8 41                     593 	.db #0x41	; 65	'A'
      0093A9 7F                     594 	.db #0x7f	; 127
      0093AA 00                     595 	.db #0x00	; 0
      0093AB 04                     596 	.db #0x04	; 4
      0093AC 02                     597 	.db #0x02	; 2
      0093AD 01                     598 	.db #0x01	; 1
      0093AE 02                     599 	.db #0x02	; 2
      0093AF 04                     600 	.db #0x04	; 4
      0093B0 40                     601 	.db #0x40	; 64
      0093B1 40                     602 	.db #0x40	; 64
      0093B2 40                     603 	.db #0x40	; 64
      0093B3 40                     604 	.db #0x40	; 64
      0093B4 40                     605 	.db #0x40	; 64
      0093B5 00                     606 	.db #0x00	; 0
      0093B6 01                     607 	.db #0x01	; 1
      0093B7 02                     608 	.db #0x02	; 2
      0093B8 04                     609 	.db #0x04	; 4
      0093B9 00                     610 	.db #0x00	; 0
      0093BA 20                     611 	.db #0x20	; 32
      0093BB 54                     612 	.db #0x54	; 84	'T'
      0093BC 54                     613 	.db #0x54	; 84	'T'
      0093BD 54                     614 	.db #0x54	; 84	'T'
      0093BE 78                     615 	.db #0x78	; 120	'x'
      0093BF 7F                     616 	.db #0x7f	; 127
      0093C0 48                     617 	.db #0x48	; 72	'H'
      0093C1 44                     618 	.db #0x44	; 68	'D'
      0093C2 44                     619 	.db #0x44	; 68	'D'
      0093C3 38                     620 	.db #0x38	; 56	'8'
      0093C4 38                     621 	.db #0x38	; 56	'8'
      0093C5 44                     622 	.db #0x44	; 68	'D'
      0093C6 44                     623 	.db #0x44	; 68	'D'
      0093C7 44                     624 	.db #0x44	; 68	'D'
      0093C8 00                     625 	.db #0x00	; 0
      0093C9 38                     626 	.db #0x38	; 56	'8'
      0093CA 44                     627 	.db #0x44	; 68	'D'
      0093CB 44                     628 	.db #0x44	; 68	'D'
      0093CC 48                     629 	.db #0x48	; 72	'H'
      0093CD 7F                     630 	.db #0x7f	; 127
      0093CE 38                     631 	.db #0x38	; 56	'8'
      0093CF 54                     632 	.db #0x54	; 84	'T'
      0093D0 54                     633 	.db #0x54	; 84	'T'
      0093D1 54                     634 	.db #0x54	; 84	'T'
      0093D2 18                     635 	.db #0x18	; 24
      0093D3 08                     636 	.db #0x08	; 8
      0093D4 7E                     637 	.db #0x7e	; 126
      0093D5 09                     638 	.db #0x09	; 9
      0093D6 01                     639 	.db #0x01	; 1
      0093D7 02                     640 	.db #0x02	; 2
      0093D8 0C                     641 	.db #0x0c	; 12
      0093D9 52                     642 	.db #0x52	; 82	'R'
      0093DA 52                     643 	.db #0x52	; 82	'R'
      0093DB 52                     644 	.db #0x52	; 82	'R'
      0093DC 3E                     645 	.db #0x3e	; 62
      0093DD 7F                     646 	.db #0x7f	; 127
      0093DE 08                     647 	.db #0x08	; 8
      0093DF 04                     648 	.db #0x04	; 4
      0093E0 04                     649 	.db #0x04	; 4
      0093E1 78                     650 	.db #0x78	; 120	'x'
      0093E2 00                     651 	.db #0x00	; 0
      0093E3 44                     652 	.db #0x44	; 68	'D'
      0093E4 7D                     653 	.db #0x7d	; 125
      0093E5 40                     654 	.db #0x40	; 64
      0093E6 00                     655 	.db #0x00	; 0
      0093E7 20                     656 	.db #0x20	; 32
      0093E8 40                     657 	.db #0x40	; 64
      0093E9 44                     658 	.db #0x44	; 68	'D'
      0093EA 3D                     659 	.db #0x3d	; 61
      0093EB 00                     660 	.db #0x00	; 0
      0093EC 7F                     661 	.db #0x7f	; 127
      0093ED 10                     662 	.db #0x10	; 16
      0093EE 28                     663 	.db #0x28	; 40
      0093EF 44                     664 	.db #0x44	; 68	'D'
      0093F0 00                     665 	.db #0x00	; 0
      0093F1 00                     666 	.db #0x00	; 0
      0093F2 41                     667 	.db #0x41	; 65	'A'
      0093F3 7F                     668 	.db #0x7f	; 127
      0093F4 40                     669 	.db #0x40	; 64
      0093F5 00                     670 	.db #0x00	; 0
      0093F6 7C                     671 	.db #0x7c	; 124
      0093F7 04                     672 	.db #0x04	; 4
      0093F8 18                     673 	.db #0x18	; 24
      0093F9 04                     674 	.db #0x04	; 4
      0093FA 78                     675 	.db #0x78	; 120	'x'
      0093FB 7C                     676 	.db #0x7c	; 124
      0093FC 08                     677 	.db #0x08	; 8
      0093FD 04                     678 	.db #0x04	; 4
      0093FE 04                     679 	.db #0x04	; 4
      0093FF 78                     680 	.db #0x78	; 120	'x'
      009400 38                     681 	.db #0x38	; 56	'8'
      009401 44                     682 	.db #0x44	; 68	'D'
      009402 44                     683 	.db #0x44	; 68	'D'
      009403 44                     684 	.db #0x44	; 68	'D'
      009404 38                     685 	.db #0x38	; 56	'8'
      009405 7C                     686 	.db #0x7c	; 124
      009406 14                     687 	.db #0x14	; 20
      009407 14                     688 	.db #0x14	; 20
      009408 14                     689 	.db #0x14	; 20
      009409 08                     690 	.db #0x08	; 8
      00940A 08                     691 	.db #0x08	; 8
      00940B 14                     692 	.db #0x14	; 20
      00940C 14                     693 	.db #0x14	; 20
      00940D 18                     694 	.db #0x18	; 24
      00940E 7C                     695 	.db #0x7c	; 124
      00940F 7C                     696 	.db #0x7c	; 124
      009410 08                     697 	.db #0x08	; 8
      009411 04                     698 	.db #0x04	; 4
      009412 04                     699 	.db #0x04	; 4
      009413 08                     700 	.db #0x08	; 8
      009414 48                     701 	.db #0x48	; 72	'H'
      009415 54                     702 	.db #0x54	; 84	'T'
      009416 54                     703 	.db #0x54	; 84	'T'
      009417 54                     704 	.db #0x54	; 84	'T'
      009418 20                     705 	.db #0x20	; 32
      009419 04                     706 	.db #0x04	; 4
      00941A 3F                     707 	.db #0x3f	; 63
      00941B 44                     708 	.db #0x44	; 68	'D'
      00941C 40                     709 	.db #0x40	; 64
      00941D 20                     710 	.db #0x20	; 32
      00941E 3C                     711 	.db #0x3c	; 60
      00941F 40                     712 	.db #0x40	; 64
      009420 40                     713 	.db #0x40	; 64
      009421 20                     714 	.db #0x20	; 32
      009422 7C                     715 	.db #0x7c	; 124
      009423 1C                     716 	.db #0x1c	; 28
      009424 20                     717 	.db #0x20	; 32
      009425 40                     718 	.db #0x40	; 64
      009426 20                     719 	.db #0x20	; 32
      009427 1C                     720 	.db #0x1c	; 28
      009428 3C                     721 	.db #0x3c	; 60
      009429 40                     722 	.db #0x40	; 64
      00942A 30                     723 	.db #0x30	; 48	'0'
      00942B 40                     724 	.db #0x40	; 64
      00942C 3C                     725 	.db #0x3c	; 60
      00942D 44                     726 	.db #0x44	; 68	'D'
      00942E 28                     727 	.db #0x28	; 40
      00942F 10                     728 	.db #0x10	; 16
      009430 28                     729 	.db #0x28	; 40
      009431 44                     730 	.db #0x44	; 68	'D'
      009432 0C                     731 	.db #0x0c	; 12
      009433 50                     732 	.db #0x50	; 80	'P'
      009434 50                     733 	.db #0x50	; 80	'P'
      009435 50                     734 	.db #0x50	; 80	'P'
      009436 3C                     735 	.db #0x3c	; 60
      009437 44                     736 	.db #0x44	; 68	'D'
      009438 64                     737 	.db #0x64	; 100	'd'
      009439 54                     738 	.db #0x54	; 84	'T'
      00943A 4C                     739 	.db #0x4c	; 76	'L'
      00943B 44                     740 	.db #0x44	; 68	'D'
      00943C 00                     741 	.db #0x00	; 0
      00943D 08                     742 	.db #0x08	; 8
      00943E 36                     743 	.db #0x36	; 54	'6'
      00943F 41                     744 	.db #0x41	; 65	'A'
      009440 00                     745 	.db #0x00	; 0
      009441 00                     746 	.db #0x00	; 0
      009442 00                     747 	.db #0x00	; 0
      009443 7F                     748 	.db #0x7f	; 127
      009444 00                     749 	.db #0x00	; 0
      009445 00                     750 	.db #0x00	; 0
      009446 00                     751 	.db #0x00	; 0
      009447 41                     752 	.db #0x41	; 65	'A'
      009448 36                     753 	.db #0x36	; 54	'6'
      009449 08                     754 	.db #0x08	; 8
      00944A 00                     755 	.db #0x00	; 0
      00944B 08                     756 	.db #0x08	; 8
      00944C 04                     757 	.db #0x04	; 4
      00944D 08                     758 	.db #0x08	; 8
      00944E 10                     759 	.db #0x10	; 16
      00944F 08                     760 	.db #0x08	; 8
      009450 06                     761 	.db #0x06	; 6
      009451 09                     762 	.db #0x09	; 9
      009452 09                     763 	.db #0x09	; 9
      009453 06                     764 	.db #0x06	; 6
      009454 00                     765 	.db #0x00	; 0
      009455 7C                     766 	.db #0x7c	; 124
      009456 12                     767 	.db #0x12	; 18
      009457 11                     768 	.db #0x11	; 17
      009458 12                     769 	.db #0x12	; 18
      009459 7C                     770 	.db #0x7c	; 124
      00945A 7F                     771 	.db #0x7f	; 127
      00945B 49                     772 	.db #0x49	; 73	'I'
      00945C 49                     773 	.db #0x49	; 73	'I'
      00945D 49                     774 	.db #0x49	; 73	'I'
      00945E 31                     775 	.db #0x31	; 49	'1'
      00945F 7F                     776 	.db #0x7f	; 127
      009460 49                     777 	.db #0x49	; 73	'I'
      009461 49                     778 	.db #0x49	; 73	'I'
      009462 49                     779 	.db #0x49	; 73	'I'
      009463 36                     780 	.db #0x36	; 54	'6'
      009464 7F                     781 	.db #0x7f	; 127
      009465 01                     782 	.db #0x01	; 1
      009466 01                     783 	.db #0x01	; 1
      009467 01                     784 	.db #0x01	; 1
      009468 01                     785 	.db #0x01	; 1
      009469 60                     786 	.db #0x60	; 96
      00946A 3F                     787 	.db #0x3f	; 63
      00946B 21                     788 	.db #0x21	; 33
      00946C 3F                     789 	.db #0x3f	; 63
      00946D 60                     790 	.db #0x60	; 96
      00946E 7F                     791 	.db #0x7f	; 127
      00946F 49                     792 	.db #0x49	; 73	'I'
      009470 49                     793 	.db #0x49	; 73	'I'
      009471 49                     794 	.db #0x49	; 73	'I'
      009472 41                     795 	.db #0x41	; 65	'A'
      009473 77                     796 	.db #0x77	; 119	'w'
      009474 08                     797 	.db #0x08	; 8
      009475 7F                     798 	.db #0x7f	; 127
      009476 08                     799 	.db #0x08	; 8
      009477 77                     800 	.db #0x77	; 119	'w'
      009478 22                     801 	.db #0x22	; 34
      009479 41                     802 	.db #0x41	; 65	'A'
      00947A 49                     803 	.db #0x49	; 73	'I'
      00947B 49                     804 	.db #0x49	; 73	'I'
      00947C 36                     805 	.db #0x36	; 54	'6'
      00947D 7F                     806 	.db #0x7f	; 127
      00947E 10                     807 	.db #0x10	; 16
      00947F 08                     808 	.db #0x08	; 8
      009480 04                     809 	.db #0x04	; 4
      009481 7F                     810 	.db #0x7f	; 127
      009482 7E                     811 	.db #0x7e	; 126
      009483 10                     812 	.db #0x10	; 16
      009484 09                     813 	.db #0x09	; 9
      009485 04                     814 	.db #0x04	; 4
      009486 7E                     815 	.db #0x7e	; 126
      009487 7F                     816 	.db #0x7f	; 127
      009488 08                     817 	.db #0x08	; 8
      009489 14                     818 	.db #0x14	; 20
      00948A 22                     819 	.db #0x22	; 34
      00948B 41                     820 	.db #0x41	; 65	'A'
      00948C 40                     821 	.db #0x40	; 64
      00948D 3E                     822 	.db #0x3e	; 62
      00948E 01                     823 	.db #0x01	; 1
      00948F 01                     824 	.db #0x01	; 1
      009490 7F                     825 	.db #0x7f	; 127
      009491 7F                     826 	.db #0x7f	; 127
      009492 02                     827 	.db #0x02	; 2
      009493 0C                     828 	.db #0x0c	; 12
      009494 02                     829 	.db #0x02	; 2
      009495 7F                     830 	.db #0x7f	; 127
      009496 7F                     831 	.db #0x7f	; 127
      009497 08                     832 	.db #0x08	; 8
      009498 08                     833 	.db #0x08	; 8
      009499 08                     834 	.db #0x08	; 8
      00949A 7F                     835 	.db #0x7f	; 127
      00949B 3E                     836 	.db #0x3e	; 62
      00949C 41                     837 	.db #0x41	; 65	'A'
      00949D 41                     838 	.db #0x41	; 65	'A'
      00949E 41                     839 	.db #0x41	; 65	'A'
      00949F 3E                     840 	.db #0x3e	; 62
      0094A0 7F                     841 	.db #0x7f	; 127
      0094A1 01                     842 	.db #0x01	; 1
      0094A2 01                     843 	.db #0x01	; 1
      0094A3 01                     844 	.db #0x01	; 1
      0094A4 7F                     845 	.db #0x7f	; 127
      0094A5 7F                     846 	.db #0x7f	; 127
      0094A6 09                     847 	.db #0x09	; 9
      0094A7 09                     848 	.db #0x09	; 9
      0094A8 09                     849 	.db #0x09	; 9
      0094A9 06                     850 	.db #0x06	; 6
      0094AA 3E                     851 	.db #0x3e	; 62
      0094AB 41                     852 	.db #0x41	; 65	'A'
      0094AC 41                     853 	.db #0x41	; 65	'A'
      0094AD 41                     854 	.db #0x41	; 65	'A'
      0094AE 22                     855 	.db #0x22	; 34
      0094AF 01                     856 	.db #0x01	; 1
      0094B0 01                     857 	.db #0x01	; 1
      0094B1 7F                     858 	.db #0x7f	; 127
      0094B2 01                     859 	.db #0x01	; 1
      0094B3 01                     860 	.db #0x01	; 1
      0094B4 07                     861 	.db #0x07	; 7
      0094B5 48                     862 	.db #0x48	; 72	'H'
      0094B6 48                     863 	.db #0x48	; 72	'H'
      0094B7 48                     864 	.db #0x48	; 72	'H'
      0094B8 3F                     865 	.db #0x3f	; 63
      0094B9 0E                     866 	.db #0x0e	; 14
      0094BA 11                     867 	.db #0x11	; 17
      0094BB 7F                     868 	.db #0x7f	; 127
      0094BC 11                     869 	.db #0x11	; 17
      0094BD 0E                     870 	.db #0x0e	; 14
      0094BE 63                     871 	.db #0x63	; 99	'c'
      0094BF 14                     872 	.db #0x14	; 20
      0094C0 08                     873 	.db #0x08	; 8
      0094C1 14                     874 	.db #0x14	; 20
      0094C2 63                     875 	.db #0x63	; 99	'c'
      0094C3 3F                     876 	.db #0x3f	; 63
      0094C4 20                     877 	.db #0x20	; 32
      0094C5 20                     878 	.db #0x20	; 32
      0094C6 3F                     879 	.db #0x3f	; 63
      0094C7 60                     880 	.db #0x60	; 96
      0094C8 07                     881 	.db #0x07	; 7
      0094C9 08                     882 	.db #0x08	; 8
      0094CA 08                     883 	.db #0x08	; 8
      0094CB 08                     884 	.db #0x08	; 8
      0094CC 7F                     885 	.db #0x7f	; 127
      0094CD 7F                     886 	.db #0x7f	; 127
      0094CE 40                     887 	.db #0x40	; 64
      0094CF 7E                     888 	.db #0x7e	; 126
      0094D0 40                     889 	.db #0x40	; 64
      0094D1 7F                     890 	.db #0x7f	; 127
      0094D2 3F                     891 	.db #0x3f	; 63
      0094D3 20                     892 	.db #0x20	; 32
      0094D4 3F                     893 	.db #0x3f	; 63
      0094D5 20                     894 	.db #0x20	; 32
      0094D6 7F                     895 	.db #0x7f	; 127
      0094D7 01                     896 	.db #0x01	; 1
      0094D8 7F                     897 	.db #0x7f	; 127
      0094D9 48                     898 	.db #0x48	; 72	'H'
      0094DA 48                     899 	.db #0x48	; 72	'H'
      0094DB 30                     900 	.db #0x30	; 48	'0'
      0094DC 7F                     901 	.db #0x7f	; 127
      0094DD 48                     902 	.db #0x48	; 72	'H'
      0094DE 30                     903 	.db #0x30	; 48	'0'
      0094DF 00                     904 	.db #0x00	; 0
      0094E0 7F                     905 	.db #0x7f	; 127
      0094E1 00                     906 	.db #0x00	; 0
      0094E2 7F                     907 	.db #0x7f	; 127
      0094E3 48                     908 	.db #0x48	; 72	'H'
      0094E4 48                     909 	.db #0x48	; 72	'H'
      0094E5 30                     910 	.db #0x30	; 48	'0'
      0094E6 22                     911 	.db #0x22	; 34
      0094E7 41                     912 	.db #0x41	; 65	'A'
      0094E8 49                     913 	.db #0x49	; 73	'I'
      0094E9 49                     914 	.db #0x49	; 73	'I'
      0094EA 3E                     915 	.db #0x3e	; 62
      0094EB 7F                     916 	.db #0x7f	; 127
      0094EC 08                     917 	.db #0x08	; 8
      0094ED 3E                     918 	.db #0x3e	; 62
      0094EE 41                     919 	.db #0x41	; 65	'A'
      0094EF 3E                     920 	.db #0x3e	; 62
      0094F0 46                     921 	.db #0x46	; 70	'F'
      0094F1 29                     922 	.db #0x29	; 41
      0094F2 19                     923 	.db #0x19	; 25
      0094F3 09                     924 	.db #0x09	; 9
      0094F4 7F                     925 	.db #0x7f	; 127
      0094F5 20                     926 	.db #0x20	; 32
      0094F6 54                     927 	.db #0x54	; 84	'T'
      0094F7 54                     928 	.db #0x54	; 84	'T'
      0094F8 54                     929 	.db #0x54	; 84	'T'
      0094F9 78                     930 	.db #0x78	; 120	'x'
      0094FA 3C                     931 	.db #0x3c	; 60
      0094FB 4A                     932 	.db #0x4a	; 74	'J'
      0094FC 4A                     933 	.db #0x4a	; 74	'J'
      0094FD 4A                     934 	.db #0x4a	; 74	'J'
      0094FE 31                     935 	.db #0x31	; 49	'1'
      0094FF 7C                     936 	.db #0x7c	; 124
      009500 54                     937 	.db #0x54	; 84	'T'
      009501 54                     938 	.db #0x54	; 84	'T'
      009502 28                     939 	.db #0x28	; 40
      009503 00                     940 	.db #0x00	; 0
      009504 7C                     941 	.db #0x7c	; 124
      009505 04                     942 	.db #0x04	; 4
      009506 04                     943 	.db #0x04	; 4
      009507 0C                     944 	.db #0x0c	; 12
      009508 00                     945 	.db #0x00	; 0
      009509 60                     946 	.db #0x60	; 96
      00950A 3C                     947 	.db #0x3c	; 60
      00950B 24                     948 	.db #0x24	; 36
      00950C 3C                     949 	.db #0x3c	; 60
      00950D 60                     950 	.db #0x60	; 96
      00950E 38                     951 	.db #0x38	; 56	'8'
      00950F 54                     952 	.db #0x54	; 84	'T'
      009510 54                     953 	.db #0x54	; 84	'T'
      009511 54                     954 	.db #0x54	; 84	'T'
      009512 18                     955 	.db #0x18	; 24
      009513 6C                     956 	.db #0x6c	; 108	'l'
      009514 10                     957 	.db #0x10	; 16
      009515 7C                     958 	.db #0x7c	; 124
      009516 10                     959 	.db #0x10	; 16
      009517 6C                     960 	.db #0x6c	; 108	'l'
      009518 00                     961 	.db #0x00	; 0
      009519 44                     962 	.db #0x44	; 68	'D'
      00951A 54                     963 	.db #0x54	; 84	'T'
      00951B 54                     964 	.db #0x54	; 84	'T'
      00951C 28                     965 	.db #0x28	; 40
      00951D 7C                     966 	.db #0x7c	; 124
      00951E 20                     967 	.db #0x20	; 32
      00951F 10                     968 	.db #0x10	; 16
      009520 08                     969 	.db #0x08	; 8
      009521 7C                     970 	.db #0x7c	; 124
      009522 7C                     971 	.db #0x7c	; 124
      009523 21                     972 	.db #0x21	; 33
      009524 12                     973 	.db #0x12	; 18
      009525 09                     974 	.db #0x09	; 9
      009526 7C                     975 	.db #0x7c	; 124
      009527 7C                     976 	.db #0x7c	; 124
      009528 10                     977 	.db #0x10	; 16
      009529 28                     978 	.db #0x28	; 40
      00952A 44                     979 	.db #0x44	; 68	'D'
      00952B 00                     980 	.db #0x00	; 0
      00952C 40                     981 	.db #0x40	; 64
      00952D 38                     982 	.db #0x38	; 56	'8'
      00952E 04                     983 	.db #0x04	; 4
      00952F 04                     984 	.db #0x04	; 4
      009530 7C                     985 	.db #0x7c	; 124
      009531 7C                     986 	.db #0x7c	; 124
      009532 08                     987 	.db #0x08	; 8
      009533 10                     988 	.db #0x10	; 16
      009534 08                     989 	.db #0x08	; 8
      009535 7C                     990 	.db #0x7c	; 124
      009536 7C                     991 	.db #0x7c	; 124
      009537 10                     992 	.db #0x10	; 16
      009538 10                     993 	.db #0x10	; 16
      009539 10                     994 	.db #0x10	; 16
      00953A 7C                     995 	.db #0x7c	; 124
      00953B 38                     996 	.db #0x38	; 56	'8'
      00953C 44                     997 	.db #0x44	; 68	'D'
      00953D 44                     998 	.db #0x44	; 68	'D'
      00953E 44                     999 	.db #0x44	; 68	'D'
      00953F 38                    1000 	.db #0x38	; 56	'8'
      009540 7C                    1001 	.db #0x7c	; 124
      009541 04                    1002 	.db #0x04	; 4
      009542 04                    1003 	.db #0x04	; 4
      009543 04                    1004 	.db #0x04	; 4
      009544 7C                    1005 	.db #0x7c	; 124
      009545 7C                    1006 	.db #0x7c	; 124
      009546 14                    1007 	.db #0x14	; 20
      009547 14                    1008 	.db #0x14	; 20
      009548 14                    1009 	.db #0x14	; 20
      009549 08                    1010 	.db #0x08	; 8
      00954A 38                    1011 	.db #0x38	; 56	'8'
      00954B 44                    1012 	.db #0x44	; 68	'D'
      00954C 44                    1013 	.db #0x44	; 68	'D'
      00954D 44                    1014 	.db #0x44	; 68	'D'
      00954E 00                    1015 	.db #0x00	; 0
      00954F 04                    1016 	.db #0x04	; 4
      009550 04                    1017 	.db #0x04	; 4
      009551 7C                    1018 	.db #0x7c	; 124
      009552 04                    1019 	.db #0x04	; 4
      009553 04                    1020 	.db #0x04	; 4
      009554 0C                    1021 	.db #0x0c	; 12
      009555 50                    1022 	.db #0x50	; 80	'P'
      009556 50                    1023 	.db #0x50	; 80	'P'
      009557 50                    1024 	.db #0x50	; 80	'P'
      009558 3C                    1025 	.db #0x3c	; 60
      009559 08                    1026 	.db #0x08	; 8
      00955A 14                    1027 	.db #0x14	; 20
      00955B 7C                    1028 	.db #0x7c	; 124
      00955C 14                    1029 	.db #0x14	; 20
      00955D 08                    1030 	.db #0x08	; 8
      00955E 44                    1031 	.db #0x44	; 68	'D'
      00955F 28                    1032 	.db #0x28	; 40
      009560 10                    1033 	.db #0x10	; 16
      009561 28                    1034 	.db #0x28	; 40
      009562 44                    1035 	.db #0x44	; 68	'D'
      009563 3C                    1036 	.db #0x3c	; 60
      009564 20                    1037 	.db #0x20	; 32
      009565 20                    1038 	.db #0x20	; 32
      009566 3C                    1039 	.db #0x3c	; 60
      009567 60                    1040 	.db #0x60	; 96
      009568 0C                    1041 	.db #0x0c	; 12
      009569 10                    1042 	.db #0x10	; 16
      00956A 10                    1043 	.db #0x10	; 16
      00956B 10                    1044 	.db #0x10	; 16
      00956C 7C                    1045 	.db #0x7c	; 124
      00956D 7C                    1046 	.db #0x7c	; 124
      00956E 40                    1047 	.db #0x40	; 64
      00956F 7C                    1048 	.db #0x7c	; 124
      009570 40                    1049 	.db #0x40	; 64
      009571 7C                    1050 	.db #0x7c	; 124
      009572 3C                    1051 	.db #0x3c	; 60
      009573 20                    1052 	.db #0x20	; 32
      009574 3C                    1053 	.db #0x3c	; 60
      009575 20                    1054 	.db #0x20	; 32
      009576 7C                    1055 	.db #0x7c	; 124
      009577 04                    1056 	.db #0x04	; 4
      009578 7C                    1057 	.db #0x7c	; 124
      009579 50                    1058 	.db #0x50	; 80	'P'
      00957A 50                    1059 	.db #0x50	; 80	'P'
      00957B 20                    1060 	.db #0x20	; 32
      00957C 7C                    1061 	.db #0x7c	; 124
      00957D 50                    1062 	.db #0x50	; 80	'P'
      00957E 20                    1063 	.db #0x20	; 32
      00957F 00                    1064 	.db #0x00	; 0
      009580 7C                    1065 	.db #0x7c	; 124
      009581 00                    1066 	.db #0x00	; 0
      009582 7C                    1067 	.db #0x7c	; 124
      009583 50                    1068 	.db #0x50	; 80	'P'
      009584 50                    1069 	.db #0x50	; 80	'P'
      009585 20                    1070 	.db #0x20	; 32
      009586 28                    1071 	.db #0x28	; 40
      009587 44                    1072 	.db #0x44	; 68	'D'
      009588 54                    1073 	.db #0x54	; 84	'T'
      009589 54                    1074 	.db #0x54	; 84	'T'
      00958A 38                    1075 	.db #0x38	; 56	'8'
      00958B 7C                    1076 	.db #0x7c	; 124
      00958C 10                    1077 	.db #0x10	; 16
      00958D 38                    1078 	.db #0x38	; 56	'8'
      00958E 44                    1079 	.db #0x44	; 68	'D'
      00958F 38                    1080 	.db #0x38	; 56	'8'
      009590 48                    1081 	.db #0x48	; 72	'H'
      009591 54                    1082 	.db #0x54	; 84	'T'
      009592 34                    1083 	.db #0x34	; 52	'4'
      009593 14                    1084 	.db #0x14	; 20
      009594 7C                    1085 	.db #0x7c	; 124
      009595                       1086 _BigNumbers:
      009595 FC                    1087 	.db #0xfc	; 252
      009596 7A                    1088 	.db #0x7a	; 122	'z'
      009597 06                    1089 	.db #0x06	; 6
      009598 06                    1090 	.db #0x06	; 6
      009599 06                    1091 	.db #0x06	; 6
      00959A 06                    1092 	.db #0x06	; 6
      00959B 06                    1093 	.db #0x06	; 6
      00959C 06                    1094 	.db #0x06	; 6
      00959D 7A                    1095 	.db #0x7a	; 122	'z'
      00959E FC                    1096 	.db #0xfc	; 252
      00959F 7E                    1097 	.db #0x7e	; 126
      0095A0 BC                    1098 	.db #0xbc	; 188
      0095A1 C0                    1099 	.db #0xc0	; 192
      0095A2 C0                    1100 	.db #0xc0	; 192
      0095A3 C0                    1101 	.db #0xc0	; 192
      0095A4 C0                    1102 	.db #0xc0	; 192
      0095A5 C0                    1103 	.db #0xc0	; 192
      0095A6 C0                    1104 	.db #0xc0	; 192
      0095A7 BC                    1105 	.db #0xbc	; 188
      0095A8 7E                    1106 	.db #0x7e	; 126
      0095A9 00                    1107 	.db #0x00	; 0
      0095AA 00                    1108 	.db #0x00	; 0
      0095AB 00                    1109 	.db #0x00	; 0
      0095AC 00                    1110 	.db #0x00	; 0
      0095AD 00                    1111 	.db #0x00	; 0
      0095AE 00                    1112 	.db #0x00	; 0
      0095AF 00                    1113 	.db #0x00	; 0
      0095B0 00                    1114 	.db #0x00	; 0
      0095B1 78                    1115 	.db #0x78	; 120	'x'
      0095B2 FC                    1116 	.db #0xfc	; 252
      0095B3 00                    1117 	.db #0x00	; 0
      0095B4 00                    1118 	.db #0x00	; 0
      0095B5 00                    1119 	.db #0x00	; 0
      0095B6 00                    1120 	.db #0x00	; 0
      0095B7 00                    1121 	.db #0x00	; 0
      0095B8 00                    1122 	.db #0x00	; 0
      0095B9 00                    1123 	.db #0x00	; 0
      0095BA 00                    1124 	.db #0x00	; 0
      0095BB 3C                    1125 	.db #0x3c	; 60
      0095BC 7E                    1126 	.db #0x7e	; 126
      0095BD 00                    1127 	.db #0x00	; 0
      0095BE 02                    1128 	.db #0x02	; 2
      0095BF 86                    1129 	.db #0x86	; 134
      0095C0 86                    1130 	.db #0x86	; 134
      0095C1 86                    1131 	.db #0x86	; 134
      0095C2 86                    1132 	.db #0x86	; 134
      0095C3 86                    1133 	.db #0x86	; 134
      0095C4 86                    1134 	.db #0x86	; 134
      0095C5 7A                    1135 	.db #0x7a	; 122	'z'
      0095C6 FC                    1136 	.db #0xfc	; 252
      0095C7 7E                    1137 	.db #0x7e	; 126
      0095C8 BD                    1138 	.db #0xbd	; 189
      0095C9 C3                    1139 	.db #0xc3	; 195
      0095CA C3                    1140 	.db #0xc3	; 195
      0095CB C3                    1141 	.db #0xc3	; 195
      0095CC C3                    1142 	.db #0xc3	; 195
      0095CD C3                    1143 	.db #0xc3	; 195
      0095CE C3                    1144 	.db #0xc3	; 195
      0095CF 81                    1145 	.db #0x81	; 129
      0095D0 00                    1146 	.db #0x00	; 0
      0095D1 00                    1147 	.db #0x00	; 0
      0095D2 02                    1148 	.db #0x02	; 2
      0095D3 86                    1149 	.db #0x86	; 134
      0095D4 86                    1150 	.db #0x86	; 134
      0095D5 86                    1151 	.db #0x86	; 134
      0095D6 86                    1152 	.db #0x86	; 134
      0095D7 86                    1153 	.db #0x86	; 134
      0095D8 86                    1154 	.db #0x86	; 134
      0095D9 7A                    1155 	.db #0x7a	; 122	'z'
      0095DA FC                    1156 	.db #0xfc	; 252
      0095DB 00                    1157 	.db #0x00	; 0
      0095DC 81                    1158 	.db #0x81	; 129
      0095DD C3                    1159 	.db #0xc3	; 195
      0095DE C3                    1160 	.db #0xc3	; 195
      0095DF C3                    1161 	.db #0xc3	; 195
      0095E0 C3                    1162 	.db #0xc3	; 195
      0095E1 C3                    1163 	.db #0xc3	; 195
      0095E2 C3                    1164 	.db #0xc3	; 195
      0095E3 BD                    1165 	.db #0xbd	; 189
      0095E4 7E                    1166 	.db #0x7e	; 126
      0095E5 FC                    1167 	.db #0xfc	; 252
      0095E6 78                    1168 	.db #0x78	; 120	'x'
      0095E7 80                    1169 	.db #0x80	; 128
      0095E8 80                    1170 	.db #0x80	; 128
      0095E9 80                    1171 	.db #0x80	; 128
      0095EA 80                    1172 	.db #0x80	; 128
      0095EB 80                    1173 	.db #0x80	; 128
      0095EC 80                    1174 	.db #0x80	; 128
      0095ED 78                    1175 	.db #0x78	; 120	'x'
      0095EE FC                    1176 	.db #0xfc	; 252
      0095EF 00                    1177 	.db #0x00	; 0
      0095F0 01                    1178 	.db #0x01	; 1
      0095F1 03                    1179 	.db #0x03	; 3
      0095F2 03                    1180 	.db #0x03	; 3
      0095F3 03                    1181 	.db #0x03	; 3
      0095F4 03                    1182 	.db #0x03	; 3
      0095F5 03                    1183 	.db #0x03	; 3
      0095F6 03                    1184 	.db #0x03	; 3
      0095F7 3D                    1185 	.db #0x3d	; 61
      0095F8 7E                    1186 	.db #0x7e	; 126
      0095F9 FC                    1187 	.db #0xfc	; 252
      0095FA 7A                    1188 	.db #0x7a	; 122	'z'
      0095FB 86                    1189 	.db #0x86	; 134
      0095FC 86                    1190 	.db #0x86	; 134
      0095FD 86                    1191 	.db #0x86	; 134
      0095FE 86                    1192 	.db #0x86	; 134
      0095FF 86                    1193 	.db #0x86	; 134
      009600 86                    1194 	.db #0x86	; 134
      009601 02                    1195 	.db #0x02	; 2
      009602 00                    1196 	.db #0x00	; 0
      009603 00                    1197 	.db #0x00	; 0
      009604 81                    1198 	.db #0x81	; 129
      009605 C3                    1199 	.db #0xc3	; 195
      009606 C3                    1200 	.db #0xc3	; 195
      009607 C3                    1201 	.db #0xc3	; 195
      009608 C3                    1202 	.db #0xc3	; 195
      009609 C3                    1203 	.db #0xc3	; 195
      00960A C3                    1204 	.db #0xc3	; 195
      00960B BD                    1205 	.db #0xbd	; 189
      00960C 7E                    1206 	.db #0x7e	; 126
      00960D FC                    1207 	.db #0xfc	; 252
      00960E 7A                    1208 	.db #0x7a	; 122	'z'
      00960F 86                    1209 	.db #0x86	; 134
      009610 86                    1210 	.db #0x86	; 134
      009611 86                    1211 	.db #0x86	; 134
      009612 86                    1212 	.db #0x86	; 134
      009613 86                    1213 	.db #0x86	; 134
      009614 86                    1214 	.db #0x86	; 134
      009615 02                    1215 	.db #0x02	; 2
      009616 00                    1216 	.db #0x00	; 0
      009617 7E                    1217 	.db #0x7e	; 126
      009618 BD                    1218 	.db #0xbd	; 189
      009619 C3                    1219 	.db #0xc3	; 195
      00961A C3                    1220 	.db #0xc3	; 195
      00961B C3                    1221 	.db #0xc3	; 195
      00961C C3                    1222 	.db #0xc3	; 195
      00961D C3                    1223 	.db #0xc3	; 195
      00961E C3                    1224 	.db #0xc3	; 195
      00961F BD                    1225 	.db #0xbd	; 189
      009620 7E                    1226 	.db #0x7e	; 126
      009621 00                    1227 	.db #0x00	; 0
      009622 02                    1228 	.db #0x02	; 2
      009623 06                    1229 	.db #0x06	; 6
      009624 06                    1230 	.db #0x06	; 6
      009625 06                    1231 	.db #0x06	; 6
      009626 06                    1232 	.db #0x06	; 6
      009627 06                    1233 	.db #0x06	; 6
      009628 06                    1234 	.db #0x06	; 6
      009629 7A                    1235 	.db #0x7a	; 122	'z'
      00962A FC                    1236 	.db #0xfc	; 252
      00962B 00                    1237 	.db #0x00	; 0
      00962C 00                    1238 	.db #0x00	; 0
      00962D 00                    1239 	.db #0x00	; 0
      00962E 00                    1240 	.db #0x00	; 0
      00962F 00                    1241 	.db #0x00	; 0
      009630 00                    1242 	.db #0x00	; 0
      009631 00                    1243 	.db #0x00	; 0
      009632 00                    1244 	.db #0x00	; 0
      009633 3C                    1245 	.db #0x3c	; 60
      009634 7E                    1246 	.db #0x7e	; 126
      009635 FC                    1247 	.db #0xfc	; 252
      009636 7A                    1248 	.db #0x7a	; 122	'z'
      009637 86                    1249 	.db #0x86	; 134
      009638 86                    1250 	.db #0x86	; 134
      009639 86                    1251 	.db #0x86	; 134
      00963A 86                    1252 	.db #0x86	; 134
      00963B 86                    1253 	.db #0x86	; 134
      00963C 86                    1254 	.db #0x86	; 134
      00963D 7A                    1255 	.db #0x7a	; 122	'z'
      00963E FC                    1256 	.db #0xfc	; 252
      00963F 7E                    1257 	.db #0x7e	; 126
      009640 BD                    1258 	.db #0xbd	; 189
      009641 C3                    1259 	.db #0xc3	; 195
      009642 C3                    1260 	.db #0xc3	; 195
      009643 C3                    1261 	.db #0xc3	; 195
      009644 C3                    1262 	.db #0xc3	; 195
      009645 C3                    1263 	.db #0xc3	; 195
      009646 C3                    1264 	.db #0xc3	; 195
      009647 BD                    1265 	.db #0xbd	; 189
      009648 7E                    1266 	.db #0x7e	; 126
      009649 FC                    1267 	.db #0xfc	; 252
      00964A 7A                    1268 	.db #0x7a	; 122	'z'
      00964B 86                    1269 	.db #0x86	; 134
      00964C 86                    1270 	.db #0x86	; 134
      00964D 86                    1271 	.db #0x86	; 134
      00964E 86                    1272 	.db #0x86	; 134
      00964F 86                    1273 	.db #0x86	; 134
      009650 86                    1274 	.db #0x86	; 134
      009651 7A                    1275 	.db #0x7a	; 122	'z'
      009652 FC                    1276 	.db #0xfc	; 252
      009653 00                    1277 	.db #0x00	; 0
      009654 81                    1278 	.db #0x81	; 129
      009655 C3                    1279 	.db #0xc3	; 195
      009656 C3                    1280 	.db #0xc3	; 195
      009657 C3                    1281 	.db #0xc3	; 195
      009658 C3                    1282 	.db #0xc3	; 195
      009659 C3                    1283 	.db #0xc3	; 195
      00965A C3                    1284 	.db #0xc3	; 195
      00965B BD                    1285 	.db #0xbd	; 189
      00965C 7E                    1286 	.db #0x7e	; 126
      00965D                       1287 _LargeNumbers:
      00965D 00                    1288 	.db #0x00	; 0
      00965E FC                    1289 	.db #0xfc	; 252
      00965F F8                    1290 	.db #0xf8	; 248
      009660 F2                    1291 	.db #0xf2	; 242
      009661 E6                    1292 	.db #0xe6	; 230
      009662 CE                    1293 	.db #0xce	; 206
      009663 1E                    1294 	.db #0x1e	; 30
      009664 3E                    1295 	.db #0x3e	; 62
      009665 3E                    1296 	.db #0x3e	; 62
      009666 3E                    1297 	.db #0x3e	; 62
      009667 3E                    1298 	.db #0x3e	; 62
      009668 3E                    1299 	.db #0x3e	; 62
      009669 3E                    1300 	.db #0x3e	; 62
      00966A 3E                    1301 	.db #0x3e	; 62
      00966B 1E                    1302 	.db #0x1e	; 30
      00966C CE                    1303 	.db #0xce	; 206
      00966D E6                    1304 	.db #0xe6	; 230
      00966E F2                    1305 	.db #0xf2	; 242
      00966F F8                    1306 	.db #0xf8	; 248
      009670 FC                    1307 	.db #0xfc	; 252
      009671 00                    1308 	.db #0x00	; 0
      009672 FF                    1309 	.db #0xff	; 255
      009673 7F                    1310 	.db #0x7f	; 127
      009674 3F                    1311 	.db #0x3f	; 63
      009675 1F                    1312 	.db #0x1f	; 31
      009676 0F                    1313 	.db #0x0f	; 15
      009677 00                    1314 	.db #0x00	; 0
      009678 00                    1315 	.db #0x00	; 0
      009679 00                    1316 	.db #0x00	; 0
      00967A 00                    1317 	.db #0x00	; 0
      00967B 00                    1318 	.db #0x00	; 0
      00967C 00                    1319 	.db #0x00	; 0
      00967D 00                    1320 	.db #0x00	; 0
      00967E 00                    1321 	.db #0x00	; 0
      00967F 00                    1322 	.db #0x00	; 0
      009680 0F                    1323 	.db #0x0f	; 15
      009681 1F                    1324 	.db #0x1f	; 31
      009682 3F                    1325 	.db #0x3f	; 63
      009683 7F                    1326 	.db #0x7f	; 127
      009684 FF                    1327 	.db #0xff	; 255
      009685 00                    1328 	.db #0x00	; 0
      009686 FE                    1329 	.db #0xfe	; 254
      009687 FC                    1330 	.db #0xfc	; 252
      009688 F8                    1331 	.db #0xf8	; 248
      009689 F0                    1332 	.db #0xf0	; 240
      00968A E0                    1333 	.db #0xe0	; 224
      00968B 00                    1334 	.db #0x00	; 0
      00968C 00                    1335 	.db #0x00	; 0
      00968D 00                    1336 	.db #0x00	; 0
      00968E 00                    1337 	.db #0x00	; 0
      00968F 00                    1338 	.db #0x00	; 0
      009690 00                    1339 	.db #0x00	; 0
      009691 00                    1340 	.db #0x00	; 0
      009692 00                    1341 	.db #0x00	; 0
      009693 00                    1342 	.db #0x00	; 0
      009694 E0                    1343 	.db #0xe0	; 224
      009695 F0                    1344 	.db #0xf0	; 240
      009696 F8                    1345 	.db #0xf8	; 248
      009697 FC                    1346 	.db #0xfc	; 252
      009698 FE                    1347 	.db #0xfe	; 254
      009699 00                    1348 	.db #0x00	; 0
      00969A 7F                    1349 	.db #0x7f	; 127
      00969B 3F                    1350 	.db #0x3f	; 63
      00969C 9F                    1351 	.db #0x9f	; 159
      00969D CF                    1352 	.db #0xcf	; 207
      00969E E7                    1353 	.db #0xe7	; 231
      00969F F0                    1354 	.db #0xf0	; 240
      0096A0 F8                    1355 	.db #0xf8	; 248
      0096A1 F8                    1356 	.db #0xf8	; 248
      0096A2 F8                    1357 	.db #0xf8	; 248
      0096A3 F8                    1358 	.db #0xf8	; 248
      0096A4 F8                    1359 	.db #0xf8	; 248
      0096A5 F8                    1360 	.db #0xf8	; 248
      0096A6 F8                    1361 	.db #0xf8	; 248
      0096A7 F0                    1362 	.db #0xf0	; 240
      0096A8 E7                    1363 	.db #0xe7	; 231
      0096A9 CF                    1364 	.db #0xcf	; 207
      0096AA 9F                    1365 	.db #0x9f	; 159
      0096AB 3F                    1366 	.db #0x3f	; 63
      0096AC 7F                    1367 	.db #0x7f	; 127
      0096AD 00                    1368 	.db #0x00	; 0
      0096AE 00                    1369 	.db #0x00	; 0
      0096AF 00                    1370 	.db #0x00	; 0
      0096B0 00                    1371 	.db #0x00	; 0
      0096B1 00                    1372 	.db #0x00	; 0
      0096B2 00                    1373 	.db #0x00	; 0
      0096B3 00                    1374 	.db #0x00	; 0
      0096B4 00                    1375 	.db #0x00	; 0
      0096B5 00                    1376 	.db #0x00	; 0
      0096B6 00                    1377 	.db #0x00	; 0
      0096B7 00                    1378 	.db #0x00	; 0
      0096B8 00                    1379 	.db #0x00	; 0
      0096B9 00                    1380 	.db #0x00	; 0
      0096BA 00                    1381 	.db #0x00	; 0
      0096BB 00                    1382 	.db #0x00	; 0
      0096BC C0                    1383 	.db #0xc0	; 192
      0096BD E0                    1384 	.db #0xe0	; 224
      0096BE F0                    1385 	.db #0xf0	; 240
      0096BF F8                    1386 	.db #0xf8	; 248
      0096C0 FC                    1387 	.db #0xfc	; 252
      0096C1 00                    1388 	.db #0x00	; 0
      0096C2 00                    1389 	.db #0x00	; 0
      0096C3 00                    1390 	.db #0x00	; 0
      0096C4 00                    1391 	.db #0x00	; 0
      0096C5 00                    1392 	.db #0x00	; 0
      0096C6 00                    1393 	.db #0x00	; 0
      0096C7 00                    1394 	.db #0x00	; 0
      0096C8 00                    1395 	.db #0x00	; 0
      0096C9 00                    1396 	.db #0x00	; 0
      0096CA 00                    1397 	.db #0x00	; 0
      0096CB 00                    1398 	.db #0x00	; 0
      0096CC 00                    1399 	.db #0x00	; 0
      0096CD 00                    1400 	.db #0x00	; 0
      0096CE 00                    1401 	.db #0x00	; 0
      0096CF 00                    1402 	.db #0x00	; 0
      0096D0 0F                    1403 	.db #0x0f	; 15
      0096D1 1F                    1404 	.db #0x1f	; 31
      0096D2 3F                    1405 	.db #0x3f	; 63
      0096D3 7F                    1406 	.db #0x7f	; 127
      0096D4 FF                    1407 	.db #0xff	; 255
      0096D5 00                    1408 	.db #0x00	; 0
      0096D6 00                    1409 	.db #0x00	; 0
      0096D7 00                    1410 	.db #0x00	; 0
      0096D8 00                    1411 	.db #0x00	; 0
      0096D9 00                    1412 	.db #0x00	; 0
      0096DA 00                    1413 	.db #0x00	; 0
      0096DB 00                    1414 	.db #0x00	; 0
      0096DC 00                    1415 	.db #0x00	; 0
      0096DD 00                    1416 	.db #0x00	; 0
      0096DE 00                    1417 	.db #0x00	; 0
      0096DF 00                    1418 	.db #0x00	; 0
      0096E0 00                    1419 	.db #0x00	; 0
      0096E1 00                    1420 	.db #0x00	; 0
      0096E2 00                    1421 	.db #0x00	; 0
      0096E3 00                    1422 	.db #0x00	; 0
      0096E4 E0                    1423 	.db #0xe0	; 224
      0096E5 F0                    1424 	.db #0xf0	; 240
      0096E6 F8                    1425 	.db #0xf8	; 248
      0096E7 FC                    1426 	.db #0xfc	; 252
      0096E8 FE                    1427 	.db #0xfe	; 254
      0096E9 00                    1428 	.db #0x00	; 0
      0096EA 00                    1429 	.db #0x00	; 0
      0096EB 00                    1430 	.db #0x00	; 0
      0096EC 00                    1431 	.db #0x00	; 0
      0096ED 00                    1432 	.db #0x00	; 0
      0096EE 00                    1433 	.db #0x00	; 0
      0096EF 00                    1434 	.db #0x00	; 0
      0096F0 00                    1435 	.db #0x00	; 0
      0096F1 00                    1436 	.db #0x00	; 0
      0096F2 00                    1437 	.db #0x00	; 0
      0096F3 00                    1438 	.db #0x00	; 0
      0096F4 00                    1439 	.db #0x00	; 0
      0096F5 00                    1440 	.db #0x00	; 0
      0096F6 00                    1441 	.db #0x00	; 0
      0096F7 00                    1442 	.db #0x00	; 0
      0096F8 07                    1443 	.db #0x07	; 7
      0096F9 0F                    1444 	.db #0x0f	; 15
      0096FA 1F                    1445 	.db #0x1f	; 31
      0096FB 3F                    1446 	.db #0x3f	; 63
      0096FC 7F                    1447 	.db #0x7f	; 127
      0096FD 00                    1448 	.db #0x00	; 0
      0096FE 00                    1449 	.db #0x00	; 0
      0096FF 00                    1450 	.db #0x00	; 0
      009700 02                    1451 	.db #0x02	; 2
      009701 06                    1452 	.db #0x06	; 6
      009702 0E                    1453 	.db #0x0e	; 14
      009703 1E                    1454 	.db #0x1e	; 30
      009704 3E                    1455 	.db #0x3e	; 62
      009705 3E                    1456 	.db #0x3e	; 62
      009706 3E                    1457 	.db #0x3e	; 62
      009707 3E                    1458 	.db #0x3e	; 62
      009708 3E                    1459 	.db #0x3e	; 62
      009709 3E                    1460 	.db #0x3e	; 62
      00970A 3E                    1461 	.db #0x3e	; 62
      00970B 1E                    1462 	.db #0x1e	; 30
      00970C CE                    1463 	.db #0xce	; 206
      00970D E6                    1464 	.db #0xe6	; 230
      00970E F2                    1465 	.db #0xf2	; 242
      00970F F8                    1466 	.db #0xf8	; 248
      009710 FC                    1467 	.db #0xfc	; 252
      009711 00                    1468 	.db #0x00	; 0
      009712 00                    1469 	.db #0x00	; 0
      009713 00                    1470 	.db #0x00	; 0
      009714 80                    1471 	.db #0x80	; 128
      009715 C0                    1472 	.db #0xc0	; 192
      009716 C0                    1473 	.db #0xc0	; 192
      009717 C0                    1474 	.db #0xc0	; 192
      009718 C0                    1475 	.db #0xc0	; 192
      009719 C0                    1476 	.db #0xc0	; 192
      00971A C0                    1477 	.db #0xc0	; 192
      00971B C0                    1478 	.db #0xc0	; 192
      00971C C0                    1479 	.db #0xc0	; 192
      00971D C0                    1480 	.db #0xc0	; 192
      00971E C0                    1481 	.db #0xc0	; 192
      00971F C0                    1482 	.db #0xc0	; 192
      009720 C7                    1483 	.db #0xc7	; 199
      009721 CF                    1484 	.db #0xcf	; 207
      009722 9F                    1485 	.db #0x9f	; 159
      009723 3F                    1486 	.db #0x3f	; 63
      009724 7F                    1487 	.db #0x7f	; 127
      009725 00                    1488 	.db #0x00	; 0
      009726 FC                    1489 	.db #0xfc	; 252
      009727 F9                    1490 	.db #0xf9	; 249
      009728 F3                    1491 	.db #0xf3	; 243
      009729 E7                    1492 	.db #0xe7	; 231
      00972A C7                    1493 	.db #0xc7	; 199
      00972B 07                    1494 	.db #0x07	; 7
      00972C 07                    1495 	.db #0x07	; 7
      00972D 07                    1496 	.db #0x07	; 7
      00972E 07                    1497 	.db #0x07	; 7
      00972F 07                    1498 	.db #0x07	; 7
      009730 07                    1499 	.db #0x07	; 7
      009731 07                    1500 	.db #0x07	; 7
      009732 07                    1501 	.db #0x07	; 7
      009733 07                    1502 	.db #0x07	; 7
      009734 07                    1503 	.db #0x07	; 7
      009735 07                    1504 	.db #0x07	; 7
      009736 03                    1505 	.db #0x03	; 3
      009737 01                    1506 	.db #0x01	; 1
      009738 00                    1507 	.db #0x00	; 0
      009739 00                    1508 	.db #0x00	; 0
      00973A 7F                    1509 	.db #0x7f	; 127
      00973B 3F                    1510 	.db #0x3f	; 63
      00973C 9F                    1511 	.db #0x9f	; 159
      00973D CF                    1512 	.db #0xcf	; 207
      00973E E7                    1513 	.db #0xe7	; 231
      00973F F0                    1514 	.db #0xf0	; 240
      009740 F0                    1515 	.db #0xf0	; 240
      009741 F8                    1516 	.db #0xf8	; 248
      009742 F8                    1517 	.db #0xf8	; 248
      009743 F8                    1518 	.db #0xf8	; 248
      009744 F8                    1519 	.db #0xf8	; 248
      009745 F8                    1520 	.db #0xf8	; 248
      009746 F8                    1521 	.db #0xf8	; 248
      009747 F0                    1522 	.db #0xf0	; 240
      009748 E0                    1523 	.db #0xe0	; 224
      009749 C0                    1524 	.db #0xc0	; 192
      00974A 80                    1525 	.db #0x80	; 128
      00974B 00                    1526 	.db #0x00	; 0
      00974C 00                    1527 	.db #0x00	; 0
      00974D 00                    1528 	.db #0x00	; 0
      00974E 00                    1529 	.db #0x00	; 0
      00974F 00                    1530 	.db #0x00	; 0
      009750 02                    1531 	.db #0x02	; 2
      009751 06                    1532 	.db #0x06	; 6
      009752 0E                    1533 	.db #0x0e	; 14
      009753 1E                    1534 	.db #0x1e	; 30
      009754 3E                    1535 	.db #0x3e	; 62
      009755 3E                    1536 	.db #0x3e	; 62
      009756 3E                    1537 	.db #0x3e	; 62
      009757 3E                    1538 	.db #0x3e	; 62
      009758 3E                    1539 	.db #0x3e	; 62
      009759 3E                    1540 	.db #0x3e	; 62
      00975A 3E                    1541 	.db #0x3e	; 62
      00975B 1E                    1542 	.db #0x1e	; 30
      00975C CE                    1543 	.db #0xce	; 206
      00975D E6                    1544 	.db #0xe6	; 230
      00975E F2                    1545 	.db #0xf2	; 242
      00975F F8                    1546 	.db #0xf8	; 248
      009760 FC                    1547 	.db #0xfc	; 252
      009761 00                    1548 	.db #0x00	; 0
      009762 00                    1549 	.db #0x00	; 0
      009763 00                    1550 	.db #0x00	; 0
      009764 80                    1551 	.db #0x80	; 128
      009765 C0                    1552 	.db #0xc0	; 192
      009766 C0                    1553 	.db #0xc0	; 192
      009767 C0                    1554 	.db #0xc0	; 192
      009768 C0                    1555 	.db #0xc0	; 192
      009769 C0                    1556 	.db #0xc0	; 192
      00976A C0                    1557 	.db #0xc0	; 192
      00976B C0                    1558 	.db #0xc0	; 192
      00976C C0                    1559 	.db #0xc0	; 192
      00976D C0                    1560 	.db #0xc0	; 192
      00976E C0                    1561 	.db #0xc0	; 192
      00976F C0                    1562 	.db #0xc0	; 192
      009770 C7                    1563 	.db #0xc7	; 199
      009771 CF                    1564 	.db #0xcf	; 207
      009772 9F                    1565 	.db #0x9f	; 159
      009773 3F                    1566 	.db #0x3f	; 63
      009774 7F                    1567 	.db #0x7f	; 127
      009775 00                    1568 	.db #0x00	; 0
      009776 00                    1569 	.db #0x00	; 0
      009777 01                    1570 	.db #0x01	; 1
      009778 03                    1571 	.db #0x03	; 3
      009779 07                    1572 	.db #0x07	; 7
      00977A 07                    1573 	.db #0x07	; 7
      00977B 07                    1574 	.db #0x07	; 7
      00977C 07                    1575 	.db #0x07	; 7
      00977D 07                    1576 	.db #0x07	; 7
      00977E 07                    1577 	.db #0x07	; 7
      00977F 07                    1578 	.db #0x07	; 7
      009780 07                    1579 	.db #0x07	; 7
      009781 07                    1580 	.db #0x07	; 7
      009782 07                    1581 	.db #0x07	; 7
      009783 07                    1582 	.db #0x07	; 7
      009784 C7                    1583 	.db #0xc7	; 199
      009785 E7                    1584 	.db #0xe7	; 231
      009786 F3                    1585 	.db #0xf3	; 243
      009787 F9                    1586 	.db #0xf9	; 249
      009788 FC                    1587 	.db #0xfc	; 252
      009789 00                    1588 	.db #0x00	; 0
      00978A 00                    1589 	.db #0x00	; 0
      00978B 00                    1590 	.db #0x00	; 0
      00978C 80                    1591 	.db #0x80	; 128
      00978D C0                    1592 	.db #0xc0	; 192
      00978E E0                    1593 	.db #0xe0	; 224
      00978F F0                    1594 	.db #0xf0	; 240
      009790 F0                    1595 	.db #0xf0	; 240
      009791 F8                    1596 	.db #0xf8	; 248
      009792 F8                    1597 	.db #0xf8	; 248
      009793 F8                    1598 	.db #0xf8	; 248
      009794 F8                    1599 	.db #0xf8	; 248
      009795 F8                    1600 	.db #0xf8	; 248
      009796 F8                    1601 	.db #0xf8	; 248
      009797 F0                    1602 	.db #0xf0	; 240
      009798 E7                    1603 	.db #0xe7	; 231
      009799 CF                    1604 	.db #0xcf	; 207
      00979A 9F                    1605 	.db #0x9f	; 159
      00979B 3F                    1606 	.db #0x3f	; 63
      00979C 7F                    1607 	.db #0x7f	; 127
      00979D 00                    1608 	.db #0x00	; 0
      00979E FC                    1609 	.db #0xfc	; 252
      00979F F8                    1610 	.db #0xf8	; 248
      0097A0 F0                    1611 	.db #0xf0	; 240
      0097A1 E0                    1612 	.db #0xe0	; 224
      0097A2 C0                    1613 	.db #0xc0	; 192
      0097A3 00                    1614 	.db #0x00	; 0
      0097A4 00                    1615 	.db #0x00	; 0
      0097A5 00                    1616 	.db #0x00	; 0
      0097A6 00                    1617 	.db #0x00	; 0
      0097A7 00                    1618 	.db #0x00	; 0
      0097A8 00                    1619 	.db #0x00	; 0
      0097A9 00                    1620 	.db #0x00	; 0
      0097AA 00                    1621 	.db #0x00	; 0
      0097AB 00                    1622 	.db #0x00	; 0
      0097AC C0                    1623 	.db #0xc0	; 192
      0097AD E0                    1624 	.db #0xe0	; 224
      0097AE F0                    1625 	.db #0xf0	; 240
      0097AF F8                    1626 	.db #0xf8	; 248
      0097B0 FC                    1627 	.db #0xfc	; 252
      0097B1 00                    1628 	.db #0x00	; 0
      0097B2 7F                    1629 	.db #0x7f	; 127
      0097B3 3F                    1630 	.db #0x3f	; 63
      0097B4 9F                    1631 	.db #0x9f	; 159
      0097B5 CF                    1632 	.db #0xcf	; 207
      0097B6 C7                    1633 	.db #0xc7	; 199
      0097B7 C0                    1634 	.db #0xc0	; 192
      0097B8 C0                    1635 	.db #0xc0	; 192
      0097B9 C0                    1636 	.db #0xc0	; 192
      0097BA C0                    1637 	.db #0xc0	; 192
      0097BB C0                    1638 	.db #0xc0	; 192
      0097BC C0                    1639 	.db #0xc0	; 192
      0097BD C0                    1640 	.db #0xc0	; 192
      0097BE C0                    1641 	.db #0xc0	; 192
      0097BF C0                    1642 	.db #0xc0	; 192
      0097C0 C7                    1643 	.db #0xc7	; 199
      0097C1 CF                    1644 	.db #0xcf	; 207
      0097C2 9F                    1645 	.db #0x9f	; 159
      0097C3 3F                    1646 	.db #0x3f	; 63
      0097C4 7F                    1647 	.db #0x7f	; 127
      0097C5 00                    1648 	.db #0x00	; 0
      0097C6 00                    1649 	.db #0x00	; 0
      0097C7 01                    1650 	.db #0x01	; 1
      0097C8 03                    1651 	.db #0x03	; 3
      0097C9 07                    1652 	.db #0x07	; 7
      0097CA 07                    1653 	.db #0x07	; 7
      0097CB 07                    1654 	.db #0x07	; 7
      0097CC 07                    1655 	.db #0x07	; 7
      0097CD 07                    1656 	.db #0x07	; 7
      0097CE 07                    1657 	.db #0x07	; 7
      0097CF 07                    1658 	.db #0x07	; 7
      0097D0 07                    1659 	.db #0x07	; 7
      0097D1 07                    1660 	.db #0x07	; 7
      0097D2 07                    1661 	.db #0x07	; 7
      0097D3 07                    1662 	.db #0x07	; 7
      0097D4 C7                    1663 	.db #0xc7	; 199
      0097D5 E7                    1664 	.db #0xe7	; 231
      0097D6 F3                    1665 	.db #0xf3	; 243
      0097D7 F9                    1666 	.db #0xf9	; 249
      0097D8 FC                    1667 	.db #0xfc	; 252
      0097D9 00                    1668 	.db #0x00	; 0
      0097DA 00                    1669 	.db #0x00	; 0
      0097DB 00                    1670 	.db #0x00	; 0
      0097DC 00                    1671 	.db #0x00	; 0
      0097DD 00                    1672 	.db #0x00	; 0
      0097DE 00                    1673 	.db #0x00	; 0
      0097DF 00                    1674 	.db #0x00	; 0
      0097E0 00                    1675 	.db #0x00	; 0
      0097E1 00                    1676 	.db #0x00	; 0
      0097E2 00                    1677 	.db #0x00	; 0
      0097E3 00                    1678 	.db #0x00	; 0
      0097E4 00                    1679 	.db #0x00	; 0
      0097E5 00                    1680 	.db #0x00	; 0
      0097E6 00                    1681 	.db #0x00	; 0
      0097E7 00                    1682 	.db #0x00	; 0
      0097E8 07                    1683 	.db #0x07	; 7
      0097E9 0F                    1684 	.db #0x0f	; 15
      0097EA 1F                    1685 	.db #0x1f	; 31
      0097EB 3F                    1686 	.db #0x3f	; 63
      0097EC 7F                    1687 	.db #0x7f	; 127
      0097ED 00                    1688 	.db #0x00	; 0
      0097EE FC                    1689 	.db #0xfc	; 252
      0097EF F8                    1690 	.db #0xf8	; 248
      0097F0 F2                    1691 	.db #0xf2	; 242
      0097F1 E6                    1692 	.db #0xe6	; 230
      0097F2 CE                    1693 	.db #0xce	; 206
      0097F3 1E                    1694 	.db #0x1e	; 30
      0097F4 3E                    1695 	.db #0x3e	; 62
      0097F5 3E                    1696 	.db #0x3e	; 62
      0097F6 3E                    1697 	.db #0x3e	; 62
      0097F7 3E                    1698 	.db #0x3e	; 62
      0097F8 3E                    1699 	.db #0x3e	; 62
      0097F9 3E                    1700 	.db #0x3e	; 62
      0097FA 3E                    1701 	.db #0x3e	; 62
      0097FB 1E                    1702 	.db #0x1e	; 30
      0097FC 0E                    1703 	.db #0x0e	; 14
      0097FD 06                    1704 	.db #0x06	; 6
      0097FE 02                    1705 	.db #0x02	; 2
      0097FF 00                    1706 	.db #0x00	; 0
      009800 00                    1707 	.db #0x00	; 0
      009801 00                    1708 	.db #0x00	; 0
      009802 7F                    1709 	.db #0x7f	; 127
      009803 3F                    1710 	.db #0x3f	; 63
      009804 9F                    1711 	.db #0x9f	; 159
      009805 CF                    1712 	.db #0xcf	; 207
      009806 C7                    1713 	.db #0xc7	; 199
      009807 C0                    1714 	.db #0xc0	; 192
      009808 C0                    1715 	.db #0xc0	; 192
      009809 C0                    1716 	.db #0xc0	; 192
      00980A C0                    1717 	.db #0xc0	; 192
      00980B C0                    1718 	.db #0xc0	; 192
      00980C C0                    1719 	.db #0xc0	; 192
      00980D C0                    1720 	.db #0xc0	; 192
      00980E C0                    1721 	.db #0xc0	; 192
      00980F C0                    1722 	.db #0xc0	; 192
      009810 C0                    1723 	.db #0xc0	; 192
      009811 C0                    1724 	.db #0xc0	; 192
      009812 80                    1725 	.db #0x80	; 128
      009813 00                    1726 	.db #0x00	; 0
      009814 00                    1727 	.db #0x00	; 0
      009815 00                    1728 	.db #0x00	; 0
      009816 00                    1729 	.db #0x00	; 0
      009817 01                    1730 	.db #0x01	; 1
      009818 03                    1731 	.db #0x03	; 3
      009819 07                    1732 	.db #0x07	; 7
      00981A 07                    1733 	.db #0x07	; 7
      00981B 07                    1734 	.db #0x07	; 7
      00981C 07                    1735 	.db #0x07	; 7
      00981D 07                    1736 	.db #0x07	; 7
      00981E 07                    1737 	.db #0x07	; 7
      00981F 07                    1738 	.db #0x07	; 7
      009820 07                    1739 	.db #0x07	; 7
      009821 07                    1740 	.db #0x07	; 7
      009822 07                    1741 	.db #0x07	; 7
      009823 07                    1742 	.db #0x07	; 7
      009824 C7                    1743 	.db #0xc7	; 199
      009825 E7                    1744 	.db #0xe7	; 231
      009826 F3                    1745 	.db #0xf3	; 243
      009827 F9                    1746 	.db #0xf9	; 249
      009828 FC                    1747 	.db #0xfc	; 252
      009829 00                    1748 	.db #0x00	; 0
      00982A 00                    1749 	.db #0x00	; 0
      00982B 00                    1750 	.db #0x00	; 0
      00982C 80                    1751 	.db #0x80	; 128
      00982D C0                    1752 	.db #0xc0	; 192
      00982E E0                    1753 	.db #0xe0	; 224
      00982F F0                    1754 	.db #0xf0	; 240
      009830 F0                    1755 	.db #0xf0	; 240
      009831 F8                    1756 	.db #0xf8	; 248
      009832 F8                    1757 	.db #0xf8	; 248
      009833 F8                    1758 	.db #0xf8	; 248
      009834 F8                    1759 	.db #0xf8	; 248
      009835 F8                    1760 	.db #0xf8	; 248
      009836 F8                    1761 	.db #0xf8	; 248
      009837 F0                    1762 	.db #0xf0	; 240
      009838 E7                    1763 	.db #0xe7	; 231
      009839 CF                    1764 	.db #0xcf	; 207
      00983A 9F                    1765 	.db #0x9f	; 159
      00983B 3F                    1766 	.db #0x3f	; 63
      00983C 7F                    1767 	.db #0x7f	; 127
      00983D 00                    1768 	.db #0x00	; 0
      00983E FC                    1769 	.db #0xfc	; 252
      00983F F8                    1770 	.db #0xf8	; 248
      009840 F2                    1771 	.db #0xf2	; 242
      009841 E6                    1772 	.db #0xe6	; 230
      009842 CE                    1773 	.db #0xce	; 206
      009843 1E                    1774 	.db #0x1e	; 30
      009844 3E                    1775 	.db #0x3e	; 62
      009845 3E                    1776 	.db #0x3e	; 62
      009846 3E                    1777 	.db #0x3e	; 62
      009847 3E                    1778 	.db #0x3e	; 62
      009848 3E                    1779 	.db #0x3e	; 62
      009849 3E                    1780 	.db #0x3e	; 62
      00984A 3E                    1781 	.db #0x3e	; 62
      00984B 1E                    1782 	.db #0x1e	; 30
      00984C 0E                    1783 	.db #0x0e	; 14
      00984D 06                    1784 	.db #0x06	; 6
      00984E 02                    1785 	.db #0x02	; 2
      00984F 00                    1786 	.db #0x00	; 0
      009850 00                    1787 	.db #0x00	; 0
      009851 00                    1788 	.db #0x00	; 0
      009852 7F                    1789 	.db #0x7f	; 127
      009853 3F                    1790 	.db #0x3f	; 63
      009854 9F                    1791 	.db #0x9f	; 159
      009855 CF                    1792 	.db #0xcf	; 207
      009856 C7                    1793 	.db #0xc7	; 199
      009857 C0                    1794 	.db #0xc0	; 192
      009858 C0                    1795 	.db #0xc0	; 192
      009859 C0                    1796 	.db #0xc0	; 192
      00985A C0                    1797 	.db #0xc0	; 192
      00985B C0                    1798 	.db #0xc0	; 192
      00985C C0                    1799 	.db #0xc0	; 192
      00985D C0                    1800 	.db #0xc0	; 192
      00985E C0                    1801 	.db #0xc0	; 192
      00985F C0                    1802 	.db #0xc0	; 192
      009860 C0                    1803 	.db #0xc0	; 192
      009861 C0                    1804 	.db #0xc0	; 192
      009862 80                    1805 	.db #0x80	; 128
      009863 00                    1806 	.db #0x00	; 0
      009864 00                    1807 	.db #0x00	; 0
      009865 00                    1808 	.db #0x00	; 0
      009866 FC                    1809 	.db #0xfc	; 252
      009867 F9                    1810 	.db #0xf9	; 249
      009868 F3                    1811 	.db #0xf3	; 243
      009869 E7                    1812 	.db #0xe7	; 231
      00986A C7                    1813 	.db #0xc7	; 199
      00986B 07                    1814 	.db #0x07	; 7
      00986C 07                    1815 	.db #0x07	; 7
      00986D 07                    1816 	.db #0x07	; 7
      00986E 07                    1817 	.db #0x07	; 7
      00986F 07                    1818 	.db #0x07	; 7
      009870 07                    1819 	.db #0x07	; 7
      009871 07                    1820 	.db #0x07	; 7
      009872 07                    1821 	.db #0x07	; 7
      009873 07                    1822 	.db #0x07	; 7
      009874 C7                    1823 	.db #0xc7	; 199
      009875 E7                    1824 	.db #0xe7	; 231
      009876 F3                    1825 	.db #0xf3	; 243
      009877 F9                    1826 	.db #0xf9	; 249
      009878 FC                    1827 	.db #0xfc	; 252
      009879 00                    1828 	.db #0x00	; 0
      00987A 7F                    1829 	.db #0x7f	; 127
      00987B 3F                    1830 	.db #0x3f	; 63
      00987C 9F                    1831 	.db #0x9f	; 159
      00987D CF                    1832 	.db #0xcf	; 207
      00987E E7                    1833 	.db #0xe7	; 231
      00987F F0                    1834 	.db #0xf0	; 240
      009880 F0                    1835 	.db #0xf0	; 240
      009881 F8                    1836 	.db #0xf8	; 248
      009882 F8                    1837 	.db #0xf8	; 248
      009883 F8                    1838 	.db #0xf8	; 248
      009884 F8                    1839 	.db #0xf8	; 248
      009885 F8                    1840 	.db #0xf8	; 248
      009886 F8                    1841 	.db #0xf8	; 248
      009887 F0                    1842 	.db #0xf0	; 240
      009888 E7                    1843 	.db #0xe7	; 231
      009889 CF                    1844 	.db #0xcf	; 207
      00988A 9F                    1845 	.db #0x9f	; 159
      00988B 3F                    1846 	.db #0x3f	; 63
      00988C 7F                    1847 	.db #0x7f	; 127
      00988D 00                    1848 	.db #0x00	; 0
      00988E 00                    1849 	.db #0x00	; 0
      00988F 00                    1850 	.db #0x00	; 0
      009890 02                    1851 	.db #0x02	; 2
      009891 06                    1852 	.db #0x06	; 6
      009892 0E                    1853 	.db #0x0e	; 14
      009893 1E                    1854 	.db #0x1e	; 30
      009894 3E                    1855 	.db #0x3e	; 62
      009895 3E                    1856 	.db #0x3e	; 62
      009896 3E                    1857 	.db #0x3e	; 62
      009897 3E                    1858 	.db #0x3e	; 62
      009898 3E                    1859 	.db #0x3e	; 62
      009899 3E                    1860 	.db #0x3e	; 62
      00989A 3E                    1861 	.db #0x3e	; 62
      00989B 1E                    1862 	.db #0x1e	; 30
      00989C CE                    1863 	.db #0xce	; 206
      00989D E6                    1864 	.db #0xe6	; 230
      00989E F2                    1865 	.db #0xf2	; 242
      00989F F8                    1866 	.db #0xf8	; 248
      0098A0 FC                    1867 	.db #0xfc	; 252
      0098A1 00                    1868 	.db #0x00	; 0
      0098A2 00                    1869 	.db #0x00	; 0
      0098A3 00                    1870 	.db #0x00	; 0
      0098A4 00                    1871 	.db #0x00	; 0
      0098A5 00                    1872 	.db #0x00	; 0
      0098A6 00                    1873 	.db #0x00	; 0
      0098A7 00                    1874 	.db #0x00	; 0
      0098A8 00                    1875 	.db #0x00	; 0
      0098A9 00                    1876 	.db #0x00	; 0
      0098AA 00                    1877 	.db #0x00	; 0
      0098AB 00                    1878 	.db #0x00	; 0
      0098AC 00                    1879 	.db #0x00	; 0
      0098AD 00                    1880 	.db #0x00	; 0
      0098AE 00                    1881 	.db #0x00	; 0
      0098AF 00                    1882 	.db #0x00	; 0
      0098B0 0F                    1883 	.db #0x0f	; 15
      0098B1 1F                    1884 	.db #0x1f	; 31
      0098B2 3F                    1885 	.db #0x3f	; 63
      0098B3 7F                    1886 	.db #0x7f	; 127
      0098B4 FF                    1887 	.db #0xff	; 255
      0098B5 00                    1888 	.db #0x00	; 0
      0098B6 00                    1889 	.db #0x00	; 0
      0098B7 00                    1890 	.db #0x00	; 0
      0098B8 00                    1891 	.db #0x00	; 0
      0098B9 00                    1892 	.db #0x00	; 0
      0098BA 00                    1893 	.db #0x00	; 0
      0098BB 00                    1894 	.db #0x00	; 0
      0098BC 00                    1895 	.db #0x00	; 0
      0098BD 00                    1896 	.db #0x00	; 0
      0098BE 00                    1897 	.db #0x00	; 0
      0098BF 00                    1898 	.db #0x00	; 0
      0098C0 00                    1899 	.db #0x00	; 0
      0098C1 00                    1900 	.db #0x00	; 0
      0098C2 00                    1901 	.db #0x00	; 0
      0098C3 00                    1902 	.db #0x00	; 0
      0098C4 E0                    1903 	.db #0xe0	; 224
      0098C5 F0                    1904 	.db #0xf0	; 240
      0098C6 F8                    1905 	.db #0xf8	; 248
      0098C7 FC                    1906 	.db #0xfc	; 252
      0098C8 FE                    1907 	.db #0xfe	; 254
      0098C9 00                    1908 	.db #0x00	; 0
      0098CA 00                    1909 	.db #0x00	; 0
      0098CB 00                    1910 	.db #0x00	; 0
      0098CC 00                    1911 	.db #0x00	; 0
      0098CD 00                    1912 	.db #0x00	; 0
      0098CE 00                    1913 	.db #0x00	; 0
      0098CF 00                    1914 	.db #0x00	; 0
      0098D0 00                    1915 	.db #0x00	; 0
      0098D1 00                    1916 	.db #0x00	; 0
      0098D2 00                    1917 	.db #0x00	; 0
      0098D3 00                    1918 	.db #0x00	; 0
      0098D4 00                    1919 	.db #0x00	; 0
      0098D5 00                    1920 	.db #0x00	; 0
      0098D6 00                    1921 	.db #0x00	; 0
      0098D7 00                    1922 	.db #0x00	; 0
      0098D8 07                    1923 	.db #0x07	; 7
      0098D9 0F                    1924 	.db #0x0f	; 15
      0098DA 1F                    1925 	.db #0x1f	; 31
      0098DB 3F                    1926 	.db #0x3f	; 63
      0098DC 7F                    1927 	.db #0x7f	; 127
      0098DD 00                    1928 	.db #0x00	; 0
      0098DE FC                    1929 	.db #0xfc	; 252
      0098DF F8                    1930 	.db #0xf8	; 248
      0098E0 F2                    1931 	.db #0xf2	; 242
      0098E1 E6                    1932 	.db #0xe6	; 230
      0098E2 CE                    1933 	.db #0xce	; 206
      0098E3 1E                    1934 	.db #0x1e	; 30
      0098E4 3E                    1935 	.db #0x3e	; 62
      0098E5 3E                    1936 	.db #0x3e	; 62
      0098E6 3E                    1937 	.db #0x3e	; 62
      0098E7 3E                    1938 	.db #0x3e	; 62
      0098E8 3E                    1939 	.db #0x3e	; 62
      0098E9 3E                    1940 	.db #0x3e	; 62
      0098EA 3E                    1941 	.db #0x3e	; 62
      0098EB 1E                    1942 	.db #0x1e	; 30
      0098EC CE                    1943 	.db #0xce	; 206
      0098ED E6                    1944 	.db #0xe6	; 230
      0098EE F2                    1945 	.db #0xf2	; 242
      0098EF F8                    1946 	.db #0xf8	; 248
      0098F0 FC                    1947 	.db #0xfc	; 252
      0098F1 00                    1948 	.db #0x00	; 0
      0098F2 7F                    1949 	.db #0x7f	; 127
      0098F3 3F                    1950 	.db #0x3f	; 63
      0098F4 9F                    1951 	.db #0x9f	; 159
      0098F5 CF                    1952 	.db #0xcf	; 207
      0098F6 C7                    1953 	.db #0xc7	; 199
      0098F7 C0                    1954 	.db #0xc0	; 192
      0098F8 C0                    1955 	.db #0xc0	; 192
      0098F9 C0                    1956 	.db #0xc0	; 192
      0098FA C0                    1957 	.db #0xc0	; 192
      0098FB C0                    1958 	.db #0xc0	; 192
      0098FC C0                    1959 	.db #0xc0	; 192
      0098FD C0                    1960 	.db #0xc0	; 192
      0098FE C0                    1961 	.db #0xc0	; 192
      0098FF C0                    1962 	.db #0xc0	; 192
      009900 C7                    1963 	.db #0xc7	; 199
      009901 CF                    1964 	.db #0xcf	; 207
      009902 9F                    1965 	.db #0x9f	; 159
      009903 3F                    1966 	.db #0x3f	; 63
      009904 7F                    1967 	.db #0x7f	; 127
      009905 00                    1968 	.db #0x00	; 0
      009906 FC                    1969 	.db #0xfc	; 252
      009907 F9                    1970 	.db #0xf9	; 249
      009908 F3                    1971 	.db #0xf3	; 243
      009909 E7                    1972 	.db #0xe7	; 231
      00990A C7                    1973 	.db #0xc7	; 199
      00990B 07                    1974 	.db #0x07	; 7
      00990C 07                    1975 	.db #0x07	; 7
      00990D 07                    1976 	.db #0x07	; 7
      00990E 07                    1977 	.db #0x07	; 7
      00990F 07                    1978 	.db #0x07	; 7
      009910 07                    1979 	.db #0x07	; 7
      009911 07                    1980 	.db #0x07	; 7
      009912 07                    1981 	.db #0x07	; 7
      009913 07                    1982 	.db #0x07	; 7
      009914 C7                    1983 	.db #0xc7	; 199
      009915 E7                    1984 	.db #0xe7	; 231
      009916 F3                    1985 	.db #0xf3	; 243
      009917 F9                    1986 	.db #0xf9	; 249
      009918 FC                    1987 	.db #0xfc	; 252
      009919 00                    1988 	.db #0x00	; 0
      00991A 7F                    1989 	.db #0x7f	; 127
      00991B 3F                    1990 	.db #0x3f	; 63
      00991C 9F                    1991 	.db #0x9f	; 159
      00991D CF                    1992 	.db #0xcf	; 207
      00991E E7                    1993 	.db #0xe7	; 231
      00991F F0                    1994 	.db #0xf0	; 240
      009920 F0                    1995 	.db #0xf0	; 240
      009921 F8                    1996 	.db #0xf8	; 248
      009922 F8                    1997 	.db #0xf8	; 248
      009923 F8                    1998 	.db #0xf8	; 248
      009924 F8                    1999 	.db #0xf8	; 248
      009925 F8                    2000 	.db #0xf8	; 248
      009926 F8                    2001 	.db #0xf8	; 248
      009927 F0                    2002 	.db #0xf0	; 240
      009928 E7                    2003 	.db #0xe7	; 231
      009929 CF                    2004 	.db #0xcf	; 207
      00992A 9F                    2005 	.db #0x9f	; 159
      00992B 3F                    2006 	.db #0x3f	; 63
      00992C 7F                    2007 	.db #0x7f	; 127
      00992D 00                    2008 	.db #0x00	; 0
      00992E FC                    2009 	.db #0xfc	; 252
      00992F F8                    2010 	.db #0xf8	; 248
      009930 F2                    2011 	.db #0xf2	; 242
      009931 E6                    2012 	.db #0xe6	; 230
      009932 CE                    2013 	.db #0xce	; 206
      009933 1E                    2014 	.db #0x1e	; 30
      009934 3E                    2015 	.db #0x3e	; 62
      009935 3E                    2016 	.db #0x3e	; 62
      009936 3E                    2017 	.db #0x3e	; 62
      009937 3E                    2018 	.db #0x3e	; 62
      009938 3E                    2019 	.db #0x3e	; 62
      009939 3E                    2020 	.db #0x3e	; 62
      00993A 3E                    2021 	.db #0x3e	; 62
      00993B 1E                    2022 	.db #0x1e	; 30
      00993C CE                    2023 	.db #0xce	; 206
      00993D E6                    2024 	.db #0xe6	; 230
      00993E F2                    2025 	.db #0xf2	; 242
      00993F F8                    2026 	.db #0xf8	; 248
      009940 FC                    2027 	.db #0xfc	; 252
      009941 00                    2028 	.db #0x00	; 0
      009942 7F                    2029 	.db #0x7f	; 127
      009943 3F                    2030 	.db #0x3f	; 63
      009944 9F                    2031 	.db #0x9f	; 159
      009945 CF                    2032 	.db #0xcf	; 207
      009946 C7                    2033 	.db #0xc7	; 199
      009947 C0                    2034 	.db #0xc0	; 192
      009948 C0                    2035 	.db #0xc0	; 192
      009949 C0                    2036 	.db #0xc0	; 192
      00994A C0                    2037 	.db #0xc0	; 192
      00994B C0                    2038 	.db #0xc0	; 192
      00994C C0                    2039 	.db #0xc0	; 192
      00994D C0                    2040 	.db #0xc0	; 192
      00994E C0                    2041 	.db #0xc0	; 192
      00994F C0                    2042 	.db #0xc0	; 192
      009950 C7                    2043 	.db #0xc7	; 199
      009951 CF                    2044 	.db #0xcf	; 207
      009952 9F                    2045 	.db #0x9f	; 159
      009953 3F                    2046 	.db #0x3f	; 63
      009954 7F                    2047 	.db #0x7f	; 127
      009955 00                    2048 	.db #0x00	; 0
      009956 00                    2049 	.db #0x00	; 0
      009957 01                    2050 	.db #0x01	; 1
      009958 03                    2051 	.db #0x03	; 3
      009959 07                    2052 	.db #0x07	; 7
      00995A 07                    2053 	.db #0x07	; 7
      00995B 07                    2054 	.db #0x07	; 7
      00995C 07                    2055 	.db #0x07	; 7
      00995D 07                    2056 	.db #0x07	; 7
      00995E 07                    2057 	.db #0x07	; 7
      00995F 07                    2058 	.db #0x07	; 7
      009960 07                    2059 	.db #0x07	; 7
      009961 07                    2060 	.db #0x07	; 7
      009962 07                    2061 	.db #0x07	; 7
      009963 07                    2062 	.db #0x07	; 7
      009964 C7                    2063 	.db #0xc7	; 199
      009965 E7                    2064 	.db #0xe7	; 231
      009966 F3                    2065 	.db #0xf3	; 243
      009967 F9                    2066 	.db #0xf9	; 249
      009968 FC                    2067 	.db #0xfc	; 252
      009969 00                    2068 	.db #0x00	; 0
      00996A 00                    2069 	.db #0x00	; 0
      00996B 00                    2070 	.db #0x00	; 0
      00996C 80                    2071 	.db #0x80	; 128
      00996D C0                    2072 	.db #0xc0	; 192
      00996E E0                    2073 	.db #0xe0	; 224
      00996F F0                    2074 	.db #0xf0	; 240
      009970 F0                    2075 	.db #0xf0	; 240
      009971 F8                    2076 	.db #0xf8	; 248
      009972 F8                    2077 	.db #0xf8	; 248
      009973 F8                    2078 	.db #0xf8	; 248
      009974 F8                    2079 	.db #0xf8	; 248
      009975 F8                    2080 	.db #0xf8	; 248
      009976 F8                    2081 	.db #0xf8	; 248
      009977 F0                    2082 	.db #0xf0	; 240
      009978 E7                    2083 	.db #0xe7	; 231
      009979 CF                    2084 	.db #0xcf	; 207
      00997A 9F                    2085 	.db #0x9f	; 159
      00997B 3F                    2086 	.db #0x3f	; 63
      00997C 7F                    2087 	.db #0x7f	; 127
      00997D 00                    2088 	.db #0x00	; 0
      00997E 00                    2089 	.db #0x00	; 0
      00997F 00                    2090 	.db #0x00	; 0
      009980 00                    2091 	.db #0x00	; 0
      009981 00                    2092 	.db #0x00	; 0
      009982 00                    2093 	.db #0x00	; 0
      009983 00                    2094 	.db #0x00	; 0
      009984 00                    2095 	.db #0x00	; 0
      009985 00                    2096 	.db #0x00	; 0
      009986 00                    2097 	.db #0x00	; 0
      009987 00                    2098 	.db #0x00	; 0
      009988 00                    2099 	.db #0x00	; 0
      009989 00                    2100 	.db #0x00	; 0
      00998A 00                    2101 	.db #0x00	; 0
      00998B 00                    2102 	.db #0x00	; 0
      00998C 00                    2103 	.db #0x00	; 0
      00998D 00                    2104 	.db #0x00	; 0
      00998E 00                    2105 	.db #0x00	; 0
      00998F 00                    2106 	.db #0x00	; 0
      009990 00                    2107 	.db #0x00	; 0
      009991 00                    2108 	.db #0x00	; 0
      009992 00                    2109 	.db #0x00	; 0
      009993 00                    2110 	.db #0x00	; 0
      009994 C0                    2111 	.db #0xc0	; 192
      009995 C0                    2112 	.db #0xc0	; 192
      009996 C0                    2113 	.db #0xc0	; 192
      009997 C0                    2114 	.db #0xc0	; 192
      009998 C0                    2115 	.db #0xc0	; 192
      009999 FE                    2116 	.db #0xfe	; 254
      00999A FE                    2117 	.db #0xfe	; 254
      00999B FE                    2118 	.db #0xfe	; 254
      00999C FE                    2119 	.db #0xfe	; 254
      00999D FE                    2120 	.db #0xfe	; 254
      00999E C0                    2121 	.db #0xc0	; 192
      00999F C0                    2122 	.db #0xc0	; 192
      0099A0 C0                    2123 	.db #0xc0	; 192
      0099A1 C0                    2124 	.db #0xc0	; 192
      0099A2 C0                    2125 	.db #0xc0	; 192
      0099A3 00                    2126 	.db #0x00	; 0
      0099A4 00                    2127 	.db #0x00	; 0
      0099A5 00                    2128 	.db #0x00	; 0
      0099A6 00                    2129 	.db #0x00	; 0
      0099A7 00                    2130 	.db #0x00	; 0
      0099A8 07                    2131 	.db #0x07	; 7
      0099A9 07                    2132 	.db #0x07	; 7
      0099AA 07                    2133 	.db #0x07	; 7
      0099AB 07                    2134 	.db #0x07	; 7
      0099AC 07                    2135 	.db #0x07	; 7
      0099AD FF                    2136 	.db #0xff	; 255
      0099AE FF                    2137 	.db #0xff	; 255
      0099AF FF                    2138 	.db #0xff	; 255
      0099B0 FF                    2139 	.db #0xff	; 255
      0099B1 FF                    2140 	.db #0xff	; 255
      0099B2 07                    2141 	.db #0x07	; 7
      0099B3 07                    2142 	.db #0x07	; 7
      0099B4 07                    2143 	.db #0x07	; 7
      0099B5 07                    2144 	.db #0x07	; 7
      0099B6 07                    2145 	.db #0x07	; 7
      0099B7 00                    2146 	.db #0x00	; 0
      0099B8 00                    2147 	.db #0x00	; 0
      0099B9 00                    2148 	.db #0x00	; 0
      0099BA 00                    2149 	.db #0x00	; 0
      0099BB 00                    2150 	.db #0x00	; 0
      0099BC 00                    2151 	.db #0x00	; 0
      0099BD 00                    2152 	.db #0x00	; 0
      0099BE 00                    2153 	.db #0x00	; 0
      0099BF 00                    2154 	.db #0x00	; 0
      0099C0 00                    2155 	.db #0x00	; 0
      0099C1 00                    2156 	.db #0x00	; 0
      0099C2 00                    2157 	.db #0x00	; 0
      0099C3 00                    2158 	.db #0x00	; 0
      0099C4 00                    2159 	.db #0x00	; 0
      0099C5 00                    2160 	.db #0x00	; 0
      0099C6 00                    2161 	.db #0x00	; 0
      0099C7 00                    2162 	.db #0x00	; 0
      0099C8 00                    2163 	.db #0x00	; 0
      0099C9 00                    2164 	.db #0x00	; 0
      0099CA 00                    2165 	.db #0x00	; 0
      0099CB 00                    2166 	.db #0x00	; 0
      0099CC 00                    2167 	.db #0x00	; 0
      0099CD 00                    2168 	.db #0x00	; 0
      0099CE 00                    2169 	.db #0x00	; 0
      0099CF 00                    2170 	.db #0x00	; 0
      0099D0 00                    2171 	.db #0x00	; 0
      0099D1 00                    2172 	.db #0x00	; 0
      0099D2 00                    2173 	.db #0x00	; 0
      0099D3 00                    2174 	.db #0x00	; 0
      0099D4 00                    2175 	.db #0x00	; 0
      0099D5 00                    2176 	.db #0x00	; 0
      0099D6 00                    2177 	.db #0x00	; 0
      0099D7 00                    2178 	.db #0x00	; 0
      0099D8 00                    2179 	.db #0x00	; 0
      0099D9 00                    2180 	.db #0x00	; 0
      0099DA 00                    2181 	.db #0x00	; 0
      0099DB 00                    2182 	.db #0x00	; 0
      0099DC 00                    2183 	.db #0x00	; 0
      0099DD 00                    2184 	.db #0x00	; 0
      0099DE 00                    2185 	.db #0x00	; 0
      0099DF 00                    2186 	.db #0x00	; 0
      0099E0 00                    2187 	.db #0x00	; 0
      0099E1 00                    2188 	.db #0x00	; 0
      0099E2 00                    2189 	.db #0x00	; 0
      0099E3 00                    2190 	.db #0x00	; 0
      0099E4 C0                    2191 	.db #0xc0	; 192
      0099E5 C0                    2192 	.db #0xc0	; 192
      0099E6 C0                    2193 	.db #0xc0	; 192
      0099E7 C0                    2194 	.db #0xc0	; 192
      0099E8 C0                    2195 	.db #0xc0	; 192
      0099E9 C0                    2196 	.db #0xc0	; 192
      0099EA C0                    2197 	.db #0xc0	; 192
      0099EB C0                    2198 	.db #0xc0	; 192
      0099EC C0                    2199 	.db #0xc0	; 192
      0099ED C0                    2200 	.db #0xc0	; 192
      0099EE C0                    2201 	.db #0xc0	; 192
      0099EF C0                    2202 	.db #0xc0	; 192
      0099F0 C0                    2203 	.db #0xc0	; 192
      0099F1 C0                    2204 	.db #0xc0	; 192
      0099F2 C0                    2205 	.db #0xc0	; 192
      0099F3 00                    2206 	.db #0x00	; 0
      0099F4 00                    2207 	.db #0x00	; 0
      0099F5 00                    2208 	.db #0x00	; 0
      0099F6 00                    2209 	.db #0x00	; 0
      0099F7 00                    2210 	.db #0x00	; 0
      0099F8 07                    2211 	.db #0x07	; 7
      0099F9 07                    2212 	.db #0x07	; 7
      0099FA 07                    2213 	.db #0x07	; 7
      0099FB 07                    2214 	.db #0x07	; 7
      0099FC 07                    2215 	.db #0x07	; 7
      0099FD 07                    2216 	.db #0x07	; 7
      0099FE 07                    2217 	.db #0x07	; 7
      0099FF 07                    2218 	.db #0x07	; 7
      009A00 07                    2219 	.db #0x07	; 7
      009A01 07                    2220 	.db #0x07	; 7
      009A02 07                    2221 	.db #0x07	; 7
      009A03 07                    2222 	.db #0x07	; 7
      009A04 07                    2223 	.db #0x07	; 7
      009A05 07                    2224 	.db #0x07	; 7
      009A06 07                    2225 	.db #0x07	; 7
      009A07 00                    2226 	.db #0x00	; 0
      009A08 00                    2227 	.db #0x00	; 0
      009A09 00                    2228 	.db #0x00	; 0
      009A0A 00                    2229 	.db #0x00	; 0
      009A0B 00                    2230 	.db #0x00	; 0
      009A0C 00                    2231 	.db #0x00	; 0
      009A0D 00                    2232 	.db #0x00	; 0
      009A0E 00                    2233 	.db #0x00	; 0
      009A0F 00                    2234 	.db #0x00	; 0
      009A10 00                    2235 	.db #0x00	; 0
      009A11 00                    2236 	.db #0x00	; 0
      009A12 00                    2237 	.db #0x00	; 0
      009A13 00                    2238 	.db #0x00	; 0
      009A14 00                    2239 	.db #0x00	; 0
      009A15 00                    2240 	.db #0x00	; 0
      009A16 00                    2241 	.db #0x00	; 0
      009A17 00                    2242 	.db #0x00	; 0
      009A18 00                    2243 	.db #0x00	; 0
      009A19 00                    2244 	.db #0x00	; 0
      009A1A 00                    2245 	.db #0x00	; 0
      009A1B 00                    2246 	.db #0x00	; 0
      009A1C 00                    2247 	.db #0x00	; 0
      009A1D 00                    2248 	.db #0x00	; 0
      009A1E 00                    2249 	.db #0x00	; 0
      009A1F 00                    2250 	.db #0x00	; 0
      009A20 00                    2251 	.db #0x00	; 0
      009A21 00                    2252 	.db #0x00	; 0
      009A22 00                    2253 	.db #0x00	; 0
      009A23 00                    2254 	.db #0x00	; 0
      009A24 00                    2255 	.db #0x00	; 0
      009A25 00                    2256 	.db #0x00	; 0
      009A26 00                    2257 	.db #0x00	; 0
      009A27 00                    2258 	.db #0x00	; 0
      009A28 00                    2259 	.db #0x00	; 0
      009A29 00                    2260 	.db #0x00	; 0
      009A2A 00                    2261 	.db #0x00	; 0
      009A2B 00                    2262 	.db #0x00	; 0
      009A2C 00                    2263 	.db #0x00	; 0
      009A2D 00                    2264 	.db #0x00	; 0
      009A2E 00                    2265 	.db #0x00	; 0
      009A2F 00                    2266 	.db #0x00	; 0
      009A30 00                    2267 	.db #0x00	; 0
      009A31 00                    2268 	.db #0x00	; 0
      009A32 00                    2269 	.db #0x00	; 0
      009A33 00                    2270 	.db #0x00	; 0
      009A34 00                    2271 	.db #0x00	; 0
      009A35 00                    2272 	.db #0x00	; 0
      009A36 00                    2273 	.db #0x00	; 0
      009A37 00                    2274 	.db #0x00	; 0
      009A38 00                    2275 	.db #0x00	; 0
      009A39 00                    2276 	.db #0x00	; 0
      009A3A 00                    2277 	.db #0x00	; 0
      009A3B 00                    2278 	.db #0x00	; 0
      009A3C 00                    2279 	.db #0x00	; 0
      009A3D 00                    2280 	.db #0x00	; 0
      009A3E 00                    2281 	.db #0x00	; 0
      009A3F 00                    2282 	.db #0x00	; 0
      009A40 00                    2283 	.db #0x00	; 0
      009A41 00                    2284 	.db #0x00	; 0
      009A42 00                    2285 	.db #0x00	; 0
      009A43 00                    2286 	.db #0x00	; 0
      009A44 00                    2287 	.db #0x00	; 0
      009A45 00                    2288 	.db #0x00	; 0
      009A46 00                    2289 	.db #0x00	; 0
      009A47 00                    2290 	.db #0x00	; 0
      009A48 00                    2291 	.db #0x00	; 0
      009A49 00                    2292 	.db #0x00	; 0
      009A4A 00                    2293 	.db #0x00	; 0
      009A4B 00                    2294 	.db #0x00	; 0
      009A4C 00                    2295 	.db #0x00	; 0
      009A4D 00                    2296 	.db #0x00	; 0
      009A4E 00                    2297 	.db #0x00	; 0
      009A4F 00                    2298 	.db #0x00	; 0
      009A50 00                    2299 	.db #0x00	; 0
      009A51 00                    2300 	.db #0x00	; 0
      009A52 00                    2301 	.db #0x00	; 0
      009A53 00                    2302 	.db #0x00	; 0
      009A54 00                    2303 	.db #0x00	; 0
      009A55 00                    2304 	.db #0x00	; 0
      009A56 00                    2305 	.db #0x00	; 0
      009A57 00                    2306 	.db #0x00	; 0
      009A58 00                    2307 	.db #0x00	; 0
      009A59 00                    2308 	.db #0x00	; 0
      009A5A 00                    2309 	.db #0x00	; 0
      009A5B 00                    2310 	.db #0x00	; 0
      009A5C 00                    2311 	.db #0x00	; 0
      009A5D 00                    2312 	.db #0x00	; 0
      009A5E 3E                    2313 	.db #0x3e	; 62
      009A5F 3E                    2314 	.db #0x3e	; 62
      009A60 3E                    2315 	.db #0x3e	; 62
      009A61 3E                    2316 	.db #0x3e	; 62
      009A62 3E                    2317 	.db #0x3e	; 62
      009A63 00                    2318 	.db #0x00	; 0
      009A64 00                    2319 	.db #0x00	; 0
      009A65 00                    2320 	.db #0x00	; 0
      009A66 00                    2321 	.db #0x00	; 0
      009A67 00                    2322 	.db #0x00	; 0
      009A68 00                    2323 	.db #0x00	; 0
      009A69 00                    2324 	.db #0x00	; 0
      009A6A 00                    2325 	.db #0x00	; 0
      009A6B 00                    2326 	.db #0x00	; 0
      009A6C 00                    2327 	.db #0x00	; 0
      009A6D                       2328 ___str_0:
      009A6D 6E 68 61 6E 74 74     2329 	.ascii "nhantt"
      009A73 00                    2330 	.db 0x00
      009A74                       2331 ___str_1:
      009A74 30 31 32 36 38 30 39  2332 	.ascii "01268090091"
             30 30 39 31
      009A7F 00                    2333 	.db 0x00
                                   2334 	.area INITIALIZER
                                   2335 	.area CABS (ABS)
