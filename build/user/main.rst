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
                                     12 	.globl _delay
                                     13 	.globl _clock_setup
                                     14 	.globl _LcdStr
                                     15 	.globl _LcdGotoXYFont
                                     16 	.globl _LcdContrast
                                     17 	.globl _LcdUpdate
                                     18 	.globl _LcdClear
                                     19 	.globl _LcdInit
                                     20 	.globl _CLK_GetFlagStatus
                                     21 	.globl _CLK_SYSCLKConfig
                                     22 	.globl _CLK_HSIPrescalerConfig
                                     23 	.globl _CLK_ClockSwitchConfig
                                     24 	.globl _CLK_PeripheralClockConfig
                                     25 	.globl _CLK_ClockSwitchCmd
                                     26 	.globl _CLK_LSICmd
                                     27 	.globl _CLK_HSICmd
                                     28 	.globl _CLK_HSECmd
                                     29 	.globl _CLK_DeInit
                                     30 ;--------------------------------------------------------
                                     31 ; ram data
                                     32 ;--------------------------------------------------------
                                     33 	.area DATA
                                     34 ;--------------------------------------------------------
                                     35 ; ram data
                                     36 ;--------------------------------------------------------
                                     37 	.area INITIALIZED
                                     38 ;--------------------------------------------------------
                                     39 ; Stack segment in internal ram 
                                     40 ;--------------------------------------------------------
                                     41 	.area	SSEG
      009FDD                         42 __start__stack:
      009FDD                         43 	.ds	1
                                     44 
                                     45 ;--------------------------------------------------------
                                     46 ; absolute external ram data
                                     47 ;--------------------------------------------------------
                                     48 	.area DABS (ABS)
                                     49 ;--------------------------------------------------------
                                     50 ; interrupt vector 
                                     51 ;--------------------------------------------------------
                                     52 	.area HOME
      008000                         53 __interrupt_vect:
      008000 82 00 80 83             54 	int s_GSINIT ;reset
      008004 82 00 00 00             55 	int 0x0000 ;trap
      008008 82 00 00 00             56 	int 0x0000 ;int0
      00800C 82 00 00 00             57 	int 0x0000 ;int1
      008010 82 00 00 00             58 	int 0x0000 ;int2
      008014 82 00 00 00             59 	int 0x0000 ;int3
      008018 82 00 00 00             60 	int 0x0000 ;int4
      00801C 82 00 00 00             61 	int 0x0000 ;int5
      008020 82 00 00 00             62 	int 0x0000 ;int6
      008024 82 00 00 00             63 	int 0x0000 ;int7
      008028 82 00 00 00             64 	int 0x0000 ;int8
      00802C 82 00 00 00             65 	int 0x0000 ;int9
      008030 82 00 00 00             66 	int 0x0000 ;int10
      008034 82 00 00 00             67 	int 0x0000 ;int11
      008038 82 00 00 00             68 	int 0x0000 ;int12
      00803C 82 00 00 00             69 	int 0x0000 ;int13
      008040 82 00 00 00             70 	int 0x0000 ;int14
      008044 82 00 00 00             71 	int 0x0000 ;int15
      008048 82 00 00 00             72 	int 0x0000 ;int16
      00804C 82 00 00 00             73 	int 0x0000 ;int17
      008050 82 00 00 00             74 	int 0x0000 ;int18
      008054 82 00 00 00             75 	int 0x0000 ;int19
      008058 82 00 00 00             76 	int 0x0000 ;int20
      00805C 82 00 00 00             77 	int 0x0000 ;int21
      008060 82 00 00 00             78 	int 0x0000 ;int22
      008064 82 00 00 00             79 	int 0x0000 ;int23
      008068 82 00 00 00             80 	int 0x0000 ;int24
      00806C 82 00 00 00             81 	int 0x0000 ;int25
      008070 82 00 00 00             82 	int 0x0000 ;int26
      008074 82 00 00 00             83 	int 0x0000 ;int27
      008078 82 00 00 00             84 	int 0x0000 ;int28
      00807C 82 00 00 00             85 	int 0x0000 ;int29
                                     86 ;--------------------------------------------------------
                                     87 ; global & static initialisations
                                     88 ;--------------------------------------------------------
                                     89 	.area HOME
                                     90 	.area GSINIT
                                     91 	.area GSFINAL
                                     92 	.area GSINIT
      008083                         93 __sdcc_gs_init_startup:
      008083                         94 __sdcc_init_data:
                                     95 ; stm8_genXINIT() start
      008083 AE 01 FE         [ 2]   96 	ldw x, #l_DATA
      008086 27 07            [ 1]   97 	jreq	00002$
      008088                         98 00001$:
      008088 72 4F 00 00      [ 1]   99 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  100 	decw x
      00808D 26 F9            [ 1]  101 	jrne	00001$
      00808F                        102 00002$:
      00808F AE 00 00         [ 2]  103 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  104 	jreq	00004$
      008094                        105 00003$:
      008094 D6 9F DC         [ 1]  106 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 01 FE         [ 1]  107 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  108 	decw	x
      00809B 26 F7            [ 1]  109 	jrne	00003$
      00809D                        110 00004$:
                                    111 ; stm8_genXINIT() end
                                    112 	.area GSFINAL
      00809D CC 80 80         [ 2]  113 	jp	__sdcc_program_startup
                                    114 ;--------------------------------------------------------
                                    115 ; Home
                                    116 ;--------------------------------------------------------
                                    117 	.area HOME
                                    118 	.area HOME
      008080                        119 __sdcc_program_startup:
      008080 CC 92 5B         [ 2]  120 	jp	_main
                                    121 ;	return from main will return to caller
                                    122 ;--------------------------------------------------------
                                    123 ; code
                                    124 ;--------------------------------------------------------
                                    125 	.area CODE
                                    126 ;	user/main.c: 22: void clock_setup(void)
                                    127 ;	-----------------------------------------
                                    128 ;	 function clock_setup
                                    129 ;	-----------------------------------------
      0091CF                        130 _clock_setup:
                                    131 ;	user/main.c: 24: CLK_DeInit();
      0091CF CD 9A A2         [ 4]  132 	call	_CLK_DeInit
                                    133 ;	user/main.c: 25: CLK_HSECmd(DISABLE);
      0091D2 4B 00            [ 1]  134 	push	#0x00
      0091D4 CD 9A EE         [ 4]  135 	call	_CLK_HSECmd
      0091D7 84               [ 1]  136 	pop	a
                                    137 ;	user/main.c: 26: CLK_LSICmd(DISABLE);
      0091D8 4B 00            [ 1]  138 	push	#0x00
      0091DA CD 9B 0A         [ 4]  139 	call	_CLK_LSICmd
      0091DD 84               [ 1]  140 	pop	a
                                    141 ;	user/main.c: 27: CLK_HSICmd(ENABLE);
      0091DE 4B 01            [ 1]  142 	push	#0x01
      0091E0 CD 9A FC         [ 4]  143 	call	_CLK_HSICmd
      0091E3 84               [ 1]  144 	pop	a
                                    145 ;	user/main.c: 28: while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
      0091E4                        146 00101$:
      0091E4 4B 02            [ 1]  147 	push	#0x02
      0091E6 4B 01            [ 1]  148 	push	#0x01
      0091E8 CD 9D A0         [ 4]  149 	call	_CLK_GetFlagStatus
      0091EB 85               [ 2]  150 	popw	x
      0091EC 4D               [ 1]  151 	tnz	a
      0091ED 27 F5            [ 1]  152 	jreq	00101$
                                    153 ;	user/main.c: 29: CLK_ClockSwitchCmd(ENABLE);
      0091EF 4B 01            [ 1]  154 	push	#0x01
      0091F1 CD 9B 2C         [ 4]  155 	call	_CLK_ClockSwitchCmd
      0091F4 84               [ 1]  156 	pop	a
                                    157 ;	user/main.c: 30: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      0091F5 4B 00            [ 1]  158 	push	#0x00
      0091F7 CD 9C 6F         [ 4]  159 	call	_CLK_HSIPrescalerConfig
      0091FA 84               [ 1]  160 	pop	a
                                    161 ;	user/main.c: 31: CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV2);
      0091FB 4B 81            [ 1]  162 	push	#0x81
      0091FD CD 9C E6         [ 4]  163 	call	_CLK_SYSCLKConfig
      009200 84               [ 1]  164 	pop	a
                                    165 ;	user/main.c: 32: CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
      009201 4B 01            [ 1]  166 	push	#0x01
      009203 4B 00            [ 1]  167 	push	#0x00
      009205 4B E1            [ 1]  168 	push	#0xe1
      009207 4B 01            [ 1]  169 	push	#0x01
      009209 CD 9B AA         [ 4]  170 	call	_CLK_ClockSwitchConfig
      00920C 5B 04            [ 2]  171 	addw	sp, #4
                                    172 ;	user/main.c: 33: CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, ENABLE);
      00920E 4B 01            [ 1]  173 	push	#0x01
      009210 4B 01            [ 1]  174 	push	#0x01
      009212 CD 9B 54         [ 4]  175 	call	_CLK_PeripheralClockConfig
      009215 85               [ 2]  176 	popw	x
                                    177 ;	user/main.c: 34: CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, ENABLE);
      009216 4B 01            [ 1]  178 	push	#0x01
      009218 4B 00            [ 1]  179 	push	#0x00
      00921A CD 9B 54         [ 4]  180 	call	_CLK_PeripheralClockConfig
      00921D 85               [ 2]  181 	popw	x
                                    182 ;	user/main.c: 35: CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
      00921E 4B 00            [ 1]  183 	push	#0x00
      009220 4B 13            [ 1]  184 	push	#0x13
      009222 CD 9B 54         [ 4]  185 	call	_CLK_PeripheralClockConfig
      009225 85               [ 2]  186 	popw	x
                                    187 ;	user/main.c: 36: CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
      009226 4B 00            [ 1]  188 	push	#0x00
      009228 4B 12            [ 1]  189 	push	#0x12
      00922A CD 9B 54         [ 4]  190 	call	_CLK_PeripheralClockConfig
      00922D 85               [ 2]  191 	popw	x
                                    192 ;	user/main.c: 37: CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
      00922E 4B 00            [ 1]  193 	push	#0x00
      009230 4B 03            [ 1]  194 	push	#0x03
      009232 CD 9B 54         [ 4]  195 	call	_CLK_PeripheralClockConfig
      009235 85               [ 2]  196 	popw	x
                                    197 ;	user/main.c: 38: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
      009236 4B 00            [ 1]  198 	push	#0x00
      009238 4B 07            [ 1]  199 	push	#0x07
      00923A CD 9B 54         [ 4]  200 	call	_CLK_PeripheralClockConfig
      00923D 85               [ 2]  201 	popw	x
                                    202 ;	user/main.c: 39: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
      00923E 4B 00            [ 1]  203 	push	#0x00
      009240 4B 05            [ 1]  204 	push	#0x05
      009242 CD 9B 54         [ 4]  205 	call	_CLK_PeripheralClockConfig
      009245 85               [ 2]  206 	popw	x
                                    207 ;	user/main.c: 40: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
      009246 4B 01            [ 1]  208 	push	#0x01
      009248 4B 04            [ 1]  209 	push	#0x04
      00924A CD 9B 54         [ 4]  210 	call	_CLK_PeripheralClockConfig
      00924D 85               [ 2]  211 	popw	x
      00924E 81               [ 4]  212 	ret
                                    213 ;	user/main.c: 43: void delay(uint16_t x)
                                    214 ;	-----------------------------------------
                                    215 ;	 function delay
                                    216 ;	-----------------------------------------
      00924F                        217 _delay:
      00924F 89               [ 2]  218 	pushw	x
                                    219 ;	user/main.c: 45: while(x--);
      009250 1E 05            [ 2]  220 	ldw	x, (0x05, sp)
      009252                        221 00101$:
      009252 1F 01            [ 2]  222 	ldw	(0x01, sp), x
      009254 5A               [ 2]  223 	decw	x
      009255 16 01            [ 2]  224 	ldw	y, (0x01, sp)
      009257 26 F9            [ 1]  225 	jrne	00101$
      009259 85               [ 2]  226 	popw	x
      00925A 81               [ 4]  227 	ret
                                    228 ;	user/main.c: 72: void main() 
                                    229 ;	-----------------------------------------
                                    230 ;	 function main
                                    231 ;	-----------------------------------------
      00925B                        232 _main:
                                    233 ;	user/main.c: 74: clock_setup();
      00925B CD 91 CF         [ 4]  234 	call	_clock_setup
                                    235 ;	user/main.c: 80: LcdInit();
      00925E CD 80 A0         [ 4]  236 	call	_LcdInit
                                    237 ;	user/main.c: 81: LcdClear();
      009261 CD 81 48         [ 4]  238 	call	_LcdClear
                                    239 ;	user/main.c: 82: LcdContrast(0x7E);
      009264 4B 7E            [ 1]  240 	push	#0x7e
      009266 CD 82 6B         [ 4]  241 	call	_LcdContrast
      009269 84               [ 1]  242 	pop	a
                                    243 ;	user/main.c: 83: LcdGotoXYFont(1,1);
      00926A 4B 01            [ 1]  244 	push	#0x01
      00926C 4B 01            [ 1]  245 	push	#0x01
      00926E CD 82 87         [ 4]  246 	call	_LcdGotoXYFont
      009271 85               [ 2]  247 	popw	x
                                    248 ;	user/main.c: 84: LcdStr(FONT_1X, (unsigned char *)"Hello World!");
      009272 AE 9A 8E         [ 2]  249 	ldw	x, #___str_0+0
      009275 89               [ 2]  250 	pushw	x
      009276 4B 00            [ 1]  251 	push	#0x00
      009278 CD 85 C3         [ 4]  252 	call	_LcdStr
      00927B 5B 03            [ 2]  253 	addw	sp, #3
                                    254 ;	user/main.c: 86: LcdGotoXYFont(1,4);
      00927D 4B 04            [ 1]  255 	push	#0x04
      00927F 4B 01            [ 1]  256 	push	#0x01
      009281 CD 82 87         [ 4]  257 	call	_LcdGotoXYFont
      009284 85               [ 2]  258 	popw	x
                                    259 ;	user/main.c: 87: LcdStr(FONT_2X, (unsigned char *)"Hello!");
      009285 AE 9A 9B         [ 2]  260 	ldw	x, #___str_1+0
      009288 89               [ 2]  261 	pushw	x
      009289 4B 01            [ 1]  262 	push	#0x01
      00928B CD 85 C3         [ 4]  263 	call	_LcdStr
      00928E 5B 03            [ 2]  264 	addw	sp, #3
                                    265 ;	user/main.c: 89: LcdUpdate();
      009290 CD 81 64         [ 4]  266 	call	_LcdUpdate
                                    267 ;	user/main.c: 90: while(TRUE) 
      009293                        268 00102$:
      009293 20 FE            [ 2]  269 	jra	00102$
      009295 81               [ 4]  270 	ret
                                    271 	.area CODE
      009296                        272 _FontLookup:
      009296 00                     273 	.db #0x00	; 0
      009297 00                     274 	.db #0x00	; 0
      009298 00                     275 	.db #0x00	; 0
      009299 00                     276 	.db #0x00	; 0
      00929A 00                     277 	.db #0x00	; 0
      00929B 00                     278 	.db #0x00	; 0
      00929C 00                     279 	.db #0x00	; 0
      00929D 5F                     280 	.db #0x5f	; 95
      00929E 00                     281 	.db #0x00	; 0
      00929F 00                     282 	.db #0x00	; 0
      0092A0 00                     283 	.db #0x00	; 0
      0092A1 07                     284 	.db #0x07	; 7
      0092A2 00                     285 	.db #0x00	; 0
      0092A3 07                     286 	.db #0x07	; 7
      0092A4 00                     287 	.db #0x00	; 0
      0092A5 14                     288 	.db #0x14	; 20
      0092A6 7F                     289 	.db #0x7f	; 127
      0092A7 14                     290 	.db #0x14	; 20
      0092A8 7F                     291 	.db #0x7f	; 127
      0092A9 14                     292 	.db #0x14	; 20
      0092AA 24                     293 	.db #0x24	; 36
      0092AB 2A                     294 	.db #0x2a	; 42
      0092AC 7F                     295 	.db #0x7f	; 127
      0092AD 2A                     296 	.db #0x2a	; 42
      0092AE 12                     297 	.db #0x12	; 18
      0092AF 4C                     298 	.db #0x4c	; 76	'L'
      0092B0 2C                     299 	.db #0x2c	; 44
      0092B1 10                     300 	.db #0x10	; 16
      0092B2 68                     301 	.db #0x68	; 104	'h'
      0092B3 64                     302 	.db #0x64	; 100	'd'
      0092B4 36                     303 	.db #0x36	; 54	'6'
      0092B5 49                     304 	.db #0x49	; 73	'I'
      0092B6 55                     305 	.db #0x55	; 85	'U'
      0092B7 22                     306 	.db #0x22	; 34
      0092B8 50                     307 	.db #0x50	; 80	'P'
      0092B9 00                     308 	.db #0x00	; 0
      0092BA 05                     309 	.db #0x05	; 5
      0092BB 03                     310 	.db #0x03	; 3
      0092BC 00                     311 	.db #0x00	; 0
      0092BD 00                     312 	.db #0x00	; 0
      0092BE 00                     313 	.db #0x00	; 0
      0092BF 1C                     314 	.db #0x1c	; 28
      0092C0 22                     315 	.db #0x22	; 34
      0092C1 41                     316 	.db #0x41	; 65	'A'
      0092C2 00                     317 	.db #0x00	; 0
      0092C3 00                     318 	.db #0x00	; 0
      0092C4 41                     319 	.db #0x41	; 65	'A'
      0092C5 22                     320 	.db #0x22	; 34
      0092C6 1C                     321 	.db #0x1c	; 28
      0092C7 00                     322 	.db #0x00	; 0
      0092C8 14                     323 	.db #0x14	; 20
      0092C9 08                     324 	.db #0x08	; 8
      0092CA 3E                     325 	.db #0x3e	; 62
      0092CB 08                     326 	.db #0x08	; 8
      0092CC 14                     327 	.db #0x14	; 20
      0092CD 08                     328 	.db #0x08	; 8
      0092CE 08                     329 	.db #0x08	; 8
      0092CF 3E                     330 	.db #0x3e	; 62
      0092D0 08                     331 	.db #0x08	; 8
      0092D1 08                     332 	.db #0x08	; 8
      0092D2 00                     333 	.db #0x00	; 0
      0092D3 00                     334 	.db #0x00	; 0
      0092D4 50                     335 	.db #0x50	; 80	'P'
      0092D5 30                     336 	.db #0x30	; 48	'0'
      0092D6 00                     337 	.db #0x00	; 0
      0092D7 10                     338 	.db #0x10	; 16
      0092D8 10                     339 	.db #0x10	; 16
      0092D9 10                     340 	.db #0x10	; 16
      0092DA 10                     341 	.db #0x10	; 16
      0092DB 10                     342 	.db #0x10	; 16
      0092DC 00                     343 	.db #0x00	; 0
      0092DD 60                     344 	.db #0x60	; 96
      0092DE 60                     345 	.db #0x60	; 96
      0092DF 00                     346 	.db #0x00	; 0
      0092E0 00                     347 	.db #0x00	; 0
      0092E1 20                     348 	.db #0x20	; 32
      0092E2 10                     349 	.db #0x10	; 16
      0092E3 08                     350 	.db #0x08	; 8
      0092E4 04                     351 	.db #0x04	; 4
      0092E5 02                     352 	.db #0x02	; 2
      0092E6 3E                     353 	.db #0x3e	; 62
      0092E7 51                     354 	.db #0x51	; 81	'Q'
      0092E8 49                     355 	.db #0x49	; 73	'I'
      0092E9 45                     356 	.db #0x45	; 69	'E'
      0092EA 3E                     357 	.db #0x3e	; 62
      0092EB 00                     358 	.db #0x00	; 0
      0092EC 42                     359 	.db #0x42	; 66	'B'
      0092ED 7F                     360 	.db #0x7f	; 127
      0092EE 40                     361 	.db #0x40	; 64
      0092EF 00                     362 	.db #0x00	; 0
      0092F0 42                     363 	.db #0x42	; 66	'B'
      0092F1 61                     364 	.db #0x61	; 97	'a'
      0092F2 51                     365 	.db #0x51	; 81	'Q'
      0092F3 49                     366 	.db #0x49	; 73	'I'
      0092F4 46                     367 	.db #0x46	; 70	'F'
      0092F5 21                     368 	.db #0x21	; 33
      0092F6 41                     369 	.db #0x41	; 65	'A'
      0092F7 45                     370 	.db #0x45	; 69	'E'
      0092F8 4B                     371 	.db #0x4b	; 75	'K'
      0092F9 31                     372 	.db #0x31	; 49	'1'
      0092FA 18                     373 	.db #0x18	; 24
      0092FB 14                     374 	.db #0x14	; 20
      0092FC 12                     375 	.db #0x12	; 18
      0092FD 7F                     376 	.db #0x7f	; 127
      0092FE 10                     377 	.db #0x10	; 16
      0092FF 27                     378 	.db #0x27	; 39
      009300 45                     379 	.db #0x45	; 69	'E'
      009301 45                     380 	.db #0x45	; 69	'E'
      009302 45                     381 	.db #0x45	; 69	'E'
      009303 39                     382 	.db #0x39	; 57	'9'
      009304 3C                     383 	.db #0x3c	; 60
      009305 4A                     384 	.db #0x4a	; 74	'J'
      009306 49                     385 	.db #0x49	; 73	'I'
      009307 49                     386 	.db #0x49	; 73	'I'
      009308 30                     387 	.db #0x30	; 48	'0'
      009309 01                     388 	.db #0x01	; 1
      00930A 71                     389 	.db #0x71	; 113	'q'
      00930B 09                     390 	.db #0x09	; 9
      00930C 05                     391 	.db #0x05	; 5
      00930D 03                     392 	.db #0x03	; 3
      00930E 36                     393 	.db #0x36	; 54	'6'
      00930F 49                     394 	.db #0x49	; 73	'I'
      009310 49                     395 	.db #0x49	; 73	'I'
      009311 49                     396 	.db #0x49	; 73	'I'
      009312 36                     397 	.db #0x36	; 54	'6'
      009313 06                     398 	.db #0x06	; 6
      009314 49                     399 	.db #0x49	; 73	'I'
      009315 49                     400 	.db #0x49	; 73	'I'
      009316 29                     401 	.db #0x29	; 41
      009317 1E                     402 	.db #0x1e	; 30
      009318 00                     403 	.db #0x00	; 0
      009319 36                     404 	.db #0x36	; 54	'6'
      00931A 36                     405 	.db #0x36	; 54	'6'
      00931B 00                     406 	.db #0x00	; 0
      00931C 00                     407 	.db #0x00	; 0
      00931D 00                     408 	.db #0x00	; 0
      00931E 56                     409 	.db #0x56	; 86	'V'
      00931F 36                     410 	.db #0x36	; 54	'6'
      009320 00                     411 	.db #0x00	; 0
      009321 00                     412 	.db #0x00	; 0
      009322 08                     413 	.db #0x08	; 8
      009323 14                     414 	.db #0x14	; 20
      009324 22                     415 	.db #0x22	; 34
      009325 41                     416 	.db #0x41	; 65	'A'
      009326 00                     417 	.db #0x00	; 0
      009327 14                     418 	.db #0x14	; 20
      009328 14                     419 	.db #0x14	; 20
      009329 14                     420 	.db #0x14	; 20
      00932A 14                     421 	.db #0x14	; 20
      00932B 14                     422 	.db #0x14	; 20
      00932C 00                     423 	.db #0x00	; 0
      00932D 41                     424 	.db #0x41	; 65	'A'
      00932E 22                     425 	.db #0x22	; 34
      00932F 14                     426 	.db #0x14	; 20
      009330 08                     427 	.db #0x08	; 8
      009331 02                     428 	.db #0x02	; 2
      009332 01                     429 	.db #0x01	; 1
      009333 51                     430 	.db #0x51	; 81	'Q'
      009334 09                     431 	.db #0x09	; 9
      009335 06                     432 	.db #0x06	; 6
      009336 32                     433 	.db #0x32	; 50	'2'
      009337 49                     434 	.db #0x49	; 73	'I'
      009338 79                     435 	.db #0x79	; 121	'y'
      009339 41                     436 	.db #0x41	; 65	'A'
      00933A 3E                     437 	.db #0x3e	; 62
      00933B 7E                     438 	.db #0x7e	; 126
      00933C 11                     439 	.db #0x11	; 17
      00933D 11                     440 	.db #0x11	; 17
      00933E 11                     441 	.db #0x11	; 17
      00933F 7E                     442 	.db #0x7e	; 126
      009340 7F                     443 	.db #0x7f	; 127
      009341 49                     444 	.db #0x49	; 73	'I'
      009342 49                     445 	.db #0x49	; 73	'I'
      009343 49                     446 	.db #0x49	; 73	'I'
      009344 36                     447 	.db #0x36	; 54	'6'
      009345 3E                     448 	.db #0x3e	; 62
      009346 41                     449 	.db #0x41	; 65	'A'
      009347 41                     450 	.db #0x41	; 65	'A'
      009348 41                     451 	.db #0x41	; 65	'A'
      009349 22                     452 	.db #0x22	; 34
      00934A 7F                     453 	.db #0x7f	; 127
      00934B 41                     454 	.db #0x41	; 65	'A'
      00934C 41                     455 	.db #0x41	; 65	'A'
      00934D 22                     456 	.db #0x22	; 34
      00934E 1C                     457 	.db #0x1c	; 28
      00934F 7F                     458 	.db #0x7f	; 127
      009350 49                     459 	.db #0x49	; 73	'I'
      009351 49                     460 	.db #0x49	; 73	'I'
      009352 49                     461 	.db #0x49	; 73	'I'
      009353 41                     462 	.db #0x41	; 65	'A'
      009354 7F                     463 	.db #0x7f	; 127
      009355 09                     464 	.db #0x09	; 9
      009356 09                     465 	.db #0x09	; 9
      009357 09                     466 	.db #0x09	; 9
      009358 01                     467 	.db #0x01	; 1
      009359 3E                     468 	.db #0x3e	; 62
      00935A 41                     469 	.db #0x41	; 65	'A'
      00935B 49                     470 	.db #0x49	; 73	'I'
      00935C 49                     471 	.db #0x49	; 73	'I'
      00935D 7A                     472 	.db #0x7a	; 122	'z'
      00935E 7F                     473 	.db #0x7f	; 127
      00935F 08                     474 	.db #0x08	; 8
      009360 08                     475 	.db #0x08	; 8
      009361 08                     476 	.db #0x08	; 8
      009362 7F                     477 	.db #0x7f	; 127
      009363 00                     478 	.db #0x00	; 0
      009364 41                     479 	.db #0x41	; 65	'A'
      009365 7F                     480 	.db #0x7f	; 127
      009366 41                     481 	.db #0x41	; 65	'A'
      009367 00                     482 	.db #0x00	; 0
      009368 20                     483 	.db #0x20	; 32
      009369 40                     484 	.db #0x40	; 64
      00936A 41                     485 	.db #0x41	; 65	'A'
      00936B 3F                     486 	.db #0x3f	; 63
      00936C 01                     487 	.db #0x01	; 1
      00936D 7F                     488 	.db #0x7f	; 127
      00936E 08                     489 	.db #0x08	; 8
      00936F 14                     490 	.db #0x14	; 20
      009370 22                     491 	.db #0x22	; 34
      009371 41                     492 	.db #0x41	; 65	'A'
      009372 7F                     493 	.db #0x7f	; 127
      009373 40                     494 	.db #0x40	; 64
      009374 40                     495 	.db #0x40	; 64
      009375 40                     496 	.db #0x40	; 64
      009376 40                     497 	.db #0x40	; 64
      009377 7F                     498 	.db #0x7f	; 127
      009378 02                     499 	.db #0x02	; 2
      009379 0C                     500 	.db #0x0c	; 12
      00937A 02                     501 	.db #0x02	; 2
      00937B 7F                     502 	.db #0x7f	; 127
      00937C 7F                     503 	.db #0x7f	; 127
      00937D 04                     504 	.db #0x04	; 4
      00937E 08                     505 	.db #0x08	; 8
      00937F 10                     506 	.db #0x10	; 16
      009380 7F                     507 	.db #0x7f	; 127
      009381 3E                     508 	.db #0x3e	; 62
      009382 41                     509 	.db #0x41	; 65	'A'
      009383 41                     510 	.db #0x41	; 65	'A'
      009384 41                     511 	.db #0x41	; 65	'A'
      009385 3E                     512 	.db #0x3e	; 62
      009386 7F                     513 	.db #0x7f	; 127
      009387 09                     514 	.db #0x09	; 9
      009388 09                     515 	.db #0x09	; 9
      009389 09                     516 	.db #0x09	; 9
      00938A 06                     517 	.db #0x06	; 6
      00938B 3E                     518 	.db #0x3e	; 62
      00938C 41                     519 	.db #0x41	; 65	'A'
      00938D 51                     520 	.db #0x51	; 81	'Q'
      00938E 21                     521 	.db #0x21	; 33
      00938F 5E                     522 	.db #0x5e	; 94
      009390 7F                     523 	.db #0x7f	; 127
      009391 09                     524 	.db #0x09	; 9
      009392 19                     525 	.db #0x19	; 25
      009393 29                     526 	.db #0x29	; 41
      009394 46                     527 	.db #0x46	; 70	'F'
      009395 46                     528 	.db #0x46	; 70	'F'
      009396 49                     529 	.db #0x49	; 73	'I'
      009397 49                     530 	.db #0x49	; 73	'I'
      009398 49                     531 	.db #0x49	; 73	'I'
      009399 31                     532 	.db #0x31	; 49	'1'
      00939A 01                     533 	.db #0x01	; 1
      00939B 01                     534 	.db #0x01	; 1
      00939C 7F                     535 	.db #0x7f	; 127
      00939D 01                     536 	.db #0x01	; 1
      00939E 01                     537 	.db #0x01	; 1
      00939F 3F                     538 	.db #0x3f	; 63
      0093A0 40                     539 	.db #0x40	; 64
      0093A1 40                     540 	.db #0x40	; 64
      0093A2 40                     541 	.db #0x40	; 64
      0093A3 3F                     542 	.db #0x3f	; 63
      0093A4 1F                     543 	.db #0x1f	; 31
      0093A5 20                     544 	.db #0x20	; 32
      0093A6 40                     545 	.db #0x40	; 64
      0093A7 20                     546 	.db #0x20	; 32
      0093A8 1F                     547 	.db #0x1f	; 31
      0093A9 3F                     548 	.db #0x3f	; 63
      0093AA 40                     549 	.db #0x40	; 64
      0093AB 38                     550 	.db #0x38	; 56	'8'
      0093AC 40                     551 	.db #0x40	; 64
      0093AD 3F                     552 	.db #0x3f	; 63
      0093AE 63                     553 	.db #0x63	; 99	'c'
      0093AF 14                     554 	.db #0x14	; 20
      0093B0 08                     555 	.db #0x08	; 8
      0093B1 14                     556 	.db #0x14	; 20
      0093B2 63                     557 	.db #0x63	; 99	'c'
      0093B3 07                     558 	.db #0x07	; 7
      0093B4 08                     559 	.db #0x08	; 8
      0093B5 70                     560 	.db #0x70	; 112	'p'
      0093B6 08                     561 	.db #0x08	; 8
      0093B7 07                     562 	.db #0x07	; 7
      0093B8 61                     563 	.db #0x61	; 97	'a'
      0093B9 51                     564 	.db #0x51	; 81	'Q'
      0093BA 49                     565 	.db #0x49	; 73	'I'
      0093BB 45                     566 	.db #0x45	; 69	'E'
      0093BC 43                     567 	.db #0x43	; 67	'C'
      0093BD 00                     568 	.db #0x00	; 0
      0093BE 7F                     569 	.db #0x7f	; 127
      0093BF 41                     570 	.db #0x41	; 65	'A'
      0093C0 41                     571 	.db #0x41	; 65	'A'
      0093C1 00                     572 	.db #0x00	; 0
      0093C2 02                     573 	.db #0x02	; 2
      0093C3 04                     574 	.db #0x04	; 4
      0093C4 08                     575 	.db #0x08	; 8
      0093C5 10                     576 	.db #0x10	; 16
      0093C6 20                     577 	.db #0x20	; 32
      0093C7 00                     578 	.db #0x00	; 0
      0093C8 41                     579 	.db #0x41	; 65	'A'
      0093C9 41                     580 	.db #0x41	; 65	'A'
      0093CA 7F                     581 	.db #0x7f	; 127
      0093CB 00                     582 	.db #0x00	; 0
      0093CC 04                     583 	.db #0x04	; 4
      0093CD 02                     584 	.db #0x02	; 2
      0093CE 01                     585 	.db #0x01	; 1
      0093CF 02                     586 	.db #0x02	; 2
      0093D0 04                     587 	.db #0x04	; 4
      0093D1 40                     588 	.db #0x40	; 64
      0093D2 40                     589 	.db #0x40	; 64
      0093D3 40                     590 	.db #0x40	; 64
      0093D4 40                     591 	.db #0x40	; 64
      0093D5 40                     592 	.db #0x40	; 64
      0093D6 00                     593 	.db #0x00	; 0
      0093D7 01                     594 	.db #0x01	; 1
      0093D8 02                     595 	.db #0x02	; 2
      0093D9 04                     596 	.db #0x04	; 4
      0093DA 00                     597 	.db #0x00	; 0
      0093DB 20                     598 	.db #0x20	; 32
      0093DC 54                     599 	.db #0x54	; 84	'T'
      0093DD 54                     600 	.db #0x54	; 84	'T'
      0093DE 54                     601 	.db #0x54	; 84	'T'
      0093DF 78                     602 	.db #0x78	; 120	'x'
      0093E0 7F                     603 	.db #0x7f	; 127
      0093E1 48                     604 	.db #0x48	; 72	'H'
      0093E2 44                     605 	.db #0x44	; 68	'D'
      0093E3 44                     606 	.db #0x44	; 68	'D'
      0093E4 38                     607 	.db #0x38	; 56	'8'
      0093E5 38                     608 	.db #0x38	; 56	'8'
      0093E6 44                     609 	.db #0x44	; 68	'D'
      0093E7 44                     610 	.db #0x44	; 68	'D'
      0093E8 44                     611 	.db #0x44	; 68	'D'
      0093E9 00                     612 	.db #0x00	; 0
      0093EA 38                     613 	.db #0x38	; 56	'8'
      0093EB 44                     614 	.db #0x44	; 68	'D'
      0093EC 44                     615 	.db #0x44	; 68	'D'
      0093ED 48                     616 	.db #0x48	; 72	'H'
      0093EE 7F                     617 	.db #0x7f	; 127
      0093EF 38                     618 	.db #0x38	; 56	'8'
      0093F0 54                     619 	.db #0x54	; 84	'T'
      0093F1 54                     620 	.db #0x54	; 84	'T'
      0093F2 54                     621 	.db #0x54	; 84	'T'
      0093F3 18                     622 	.db #0x18	; 24
      0093F4 08                     623 	.db #0x08	; 8
      0093F5 7E                     624 	.db #0x7e	; 126
      0093F6 09                     625 	.db #0x09	; 9
      0093F7 01                     626 	.db #0x01	; 1
      0093F8 02                     627 	.db #0x02	; 2
      0093F9 0C                     628 	.db #0x0c	; 12
      0093FA 52                     629 	.db #0x52	; 82	'R'
      0093FB 52                     630 	.db #0x52	; 82	'R'
      0093FC 52                     631 	.db #0x52	; 82	'R'
      0093FD 3E                     632 	.db #0x3e	; 62
      0093FE 7F                     633 	.db #0x7f	; 127
      0093FF 08                     634 	.db #0x08	; 8
      009400 04                     635 	.db #0x04	; 4
      009401 04                     636 	.db #0x04	; 4
      009402 78                     637 	.db #0x78	; 120	'x'
      009403 00                     638 	.db #0x00	; 0
      009404 44                     639 	.db #0x44	; 68	'D'
      009405 7D                     640 	.db #0x7d	; 125
      009406 40                     641 	.db #0x40	; 64
      009407 00                     642 	.db #0x00	; 0
      009408 20                     643 	.db #0x20	; 32
      009409 40                     644 	.db #0x40	; 64
      00940A 44                     645 	.db #0x44	; 68	'D'
      00940B 3D                     646 	.db #0x3d	; 61
      00940C 00                     647 	.db #0x00	; 0
      00940D 7F                     648 	.db #0x7f	; 127
      00940E 10                     649 	.db #0x10	; 16
      00940F 28                     650 	.db #0x28	; 40
      009410 44                     651 	.db #0x44	; 68	'D'
      009411 00                     652 	.db #0x00	; 0
      009412 00                     653 	.db #0x00	; 0
      009413 41                     654 	.db #0x41	; 65	'A'
      009414 7F                     655 	.db #0x7f	; 127
      009415 40                     656 	.db #0x40	; 64
      009416 00                     657 	.db #0x00	; 0
      009417 7C                     658 	.db #0x7c	; 124
      009418 04                     659 	.db #0x04	; 4
      009419 18                     660 	.db #0x18	; 24
      00941A 04                     661 	.db #0x04	; 4
      00941B 78                     662 	.db #0x78	; 120	'x'
      00941C 7C                     663 	.db #0x7c	; 124
      00941D 08                     664 	.db #0x08	; 8
      00941E 04                     665 	.db #0x04	; 4
      00941F 04                     666 	.db #0x04	; 4
      009420 78                     667 	.db #0x78	; 120	'x'
      009421 38                     668 	.db #0x38	; 56	'8'
      009422 44                     669 	.db #0x44	; 68	'D'
      009423 44                     670 	.db #0x44	; 68	'D'
      009424 44                     671 	.db #0x44	; 68	'D'
      009425 38                     672 	.db #0x38	; 56	'8'
      009426 7C                     673 	.db #0x7c	; 124
      009427 14                     674 	.db #0x14	; 20
      009428 14                     675 	.db #0x14	; 20
      009429 14                     676 	.db #0x14	; 20
      00942A 08                     677 	.db #0x08	; 8
      00942B 08                     678 	.db #0x08	; 8
      00942C 14                     679 	.db #0x14	; 20
      00942D 14                     680 	.db #0x14	; 20
      00942E 18                     681 	.db #0x18	; 24
      00942F 7C                     682 	.db #0x7c	; 124
      009430 7C                     683 	.db #0x7c	; 124
      009431 08                     684 	.db #0x08	; 8
      009432 04                     685 	.db #0x04	; 4
      009433 04                     686 	.db #0x04	; 4
      009434 08                     687 	.db #0x08	; 8
      009435 48                     688 	.db #0x48	; 72	'H'
      009436 54                     689 	.db #0x54	; 84	'T'
      009437 54                     690 	.db #0x54	; 84	'T'
      009438 54                     691 	.db #0x54	; 84	'T'
      009439 20                     692 	.db #0x20	; 32
      00943A 04                     693 	.db #0x04	; 4
      00943B 3F                     694 	.db #0x3f	; 63
      00943C 44                     695 	.db #0x44	; 68	'D'
      00943D 40                     696 	.db #0x40	; 64
      00943E 20                     697 	.db #0x20	; 32
      00943F 3C                     698 	.db #0x3c	; 60
      009440 40                     699 	.db #0x40	; 64
      009441 40                     700 	.db #0x40	; 64
      009442 20                     701 	.db #0x20	; 32
      009443 7C                     702 	.db #0x7c	; 124
      009444 1C                     703 	.db #0x1c	; 28
      009445 20                     704 	.db #0x20	; 32
      009446 40                     705 	.db #0x40	; 64
      009447 20                     706 	.db #0x20	; 32
      009448 1C                     707 	.db #0x1c	; 28
      009449 3C                     708 	.db #0x3c	; 60
      00944A 40                     709 	.db #0x40	; 64
      00944B 30                     710 	.db #0x30	; 48	'0'
      00944C 40                     711 	.db #0x40	; 64
      00944D 3C                     712 	.db #0x3c	; 60
      00944E 44                     713 	.db #0x44	; 68	'D'
      00944F 28                     714 	.db #0x28	; 40
      009450 10                     715 	.db #0x10	; 16
      009451 28                     716 	.db #0x28	; 40
      009452 44                     717 	.db #0x44	; 68	'D'
      009453 0C                     718 	.db #0x0c	; 12
      009454 50                     719 	.db #0x50	; 80	'P'
      009455 50                     720 	.db #0x50	; 80	'P'
      009456 50                     721 	.db #0x50	; 80	'P'
      009457 3C                     722 	.db #0x3c	; 60
      009458 44                     723 	.db #0x44	; 68	'D'
      009459 64                     724 	.db #0x64	; 100	'd'
      00945A 54                     725 	.db #0x54	; 84	'T'
      00945B 4C                     726 	.db #0x4c	; 76	'L'
      00945C 44                     727 	.db #0x44	; 68	'D'
      00945D 00                     728 	.db #0x00	; 0
      00945E 08                     729 	.db #0x08	; 8
      00945F 36                     730 	.db #0x36	; 54	'6'
      009460 41                     731 	.db #0x41	; 65	'A'
      009461 00                     732 	.db #0x00	; 0
      009462 00                     733 	.db #0x00	; 0
      009463 00                     734 	.db #0x00	; 0
      009464 7F                     735 	.db #0x7f	; 127
      009465 00                     736 	.db #0x00	; 0
      009466 00                     737 	.db #0x00	; 0
      009467 00                     738 	.db #0x00	; 0
      009468 41                     739 	.db #0x41	; 65	'A'
      009469 36                     740 	.db #0x36	; 54	'6'
      00946A 08                     741 	.db #0x08	; 8
      00946B 00                     742 	.db #0x00	; 0
      00946C 08                     743 	.db #0x08	; 8
      00946D 04                     744 	.db #0x04	; 4
      00946E 08                     745 	.db #0x08	; 8
      00946F 10                     746 	.db #0x10	; 16
      009470 08                     747 	.db #0x08	; 8
      009471 06                     748 	.db #0x06	; 6
      009472 09                     749 	.db #0x09	; 9
      009473 09                     750 	.db #0x09	; 9
      009474 06                     751 	.db #0x06	; 6
      009475 00                     752 	.db #0x00	; 0
      009476 7C                     753 	.db #0x7c	; 124
      009477 12                     754 	.db #0x12	; 18
      009478 11                     755 	.db #0x11	; 17
      009479 12                     756 	.db #0x12	; 18
      00947A 7C                     757 	.db #0x7c	; 124
      00947B 7F                     758 	.db #0x7f	; 127
      00947C 49                     759 	.db #0x49	; 73	'I'
      00947D 49                     760 	.db #0x49	; 73	'I'
      00947E 49                     761 	.db #0x49	; 73	'I'
      00947F 31                     762 	.db #0x31	; 49	'1'
      009480 7F                     763 	.db #0x7f	; 127
      009481 49                     764 	.db #0x49	; 73	'I'
      009482 49                     765 	.db #0x49	; 73	'I'
      009483 49                     766 	.db #0x49	; 73	'I'
      009484 36                     767 	.db #0x36	; 54	'6'
      009485 7F                     768 	.db #0x7f	; 127
      009486 01                     769 	.db #0x01	; 1
      009487 01                     770 	.db #0x01	; 1
      009488 01                     771 	.db #0x01	; 1
      009489 01                     772 	.db #0x01	; 1
      00948A 60                     773 	.db #0x60	; 96
      00948B 3F                     774 	.db #0x3f	; 63
      00948C 21                     775 	.db #0x21	; 33
      00948D 3F                     776 	.db #0x3f	; 63
      00948E 60                     777 	.db #0x60	; 96
      00948F 7F                     778 	.db #0x7f	; 127
      009490 49                     779 	.db #0x49	; 73	'I'
      009491 49                     780 	.db #0x49	; 73	'I'
      009492 49                     781 	.db #0x49	; 73	'I'
      009493 41                     782 	.db #0x41	; 65	'A'
      009494 77                     783 	.db #0x77	; 119	'w'
      009495 08                     784 	.db #0x08	; 8
      009496 7F                     785 	.db #0x7f	; 127
      009497 08                     786 	.db #0x08	; 8
      009498 77                     787 	.db #0x77	; 119	'w'
      009499 22                     788 	.db #0x22	; 34
      00949A 41                     789 	.db #0x41	; 65	'A'
      00949B 49                     790 	.db #0x49	; 73	'I'
      00949C 49                     791 	.db #0x49	; 73	'I'
      00949D 36                     792 	.db #0x36	; 54	'6'
      00949E 7F                     793 	.db #0x7f	; 127
      00949F 10                     794 	.db #0x10	; 16
      0094A0 08                     795 	.db #0x08	; 8
      0094A1 04                     796 	.db #0x04	; 4
      0094A2 7F                     797 	.db #0x7f	; 127
      0094A3 7E                     798 	.db #0x7e	; 126
      0094A4 10                     799 	.db #0x10	; 16
      0094A5 09                     800 	.db #0x09	; 9
      0094A6 04                     801 	.db #0x04	; 4
      0094A7 7E                     802 	.db #0x7e	; 126
      0094A8 7F                     803 	.db #0x7f	; 127
      0094A9 08                     804 	.db #0x08	; 8
      0094AA 14                     805 	.db #0x14	; 20
      0094AB 22                     806 	.db #0x22	; 34
      0094AC 41                     807 	.db #0x41	; 65	'A'
      0094AD 40                     808 	.db #0x40	; 64
      0094AE 3E                     809 	.db #0x3e	; 62
      0094AF 01                     810 	.db #0x01	; 1
      0094B0 01                     811 	.db #0x01	; 1
      0094B1 7F                     812 	.db #0x7f	; 127
      0094B2 7F                     813 	.db #0x7f	; 127
      0094B3 02                     814 	.db #0x02	; 2
      0094B4 0C                     815 	.db #0x0c	; 12
      0094B5 02                     816 	.db #0x02	; 2
      0094B6 7F                     817 	.db #0x7f	; 127
      0094B7 7F                     818 	.db #0x7f	; 127
      0094B8 08                     819 	.db #0x08	; 8
      0094B9 08                     820 	.db #0x08	; 8
      0094BA 08                     821 	.db #0x08	; 8
      0094BB 7F                     822 	.db #0x7f	; 127
      0094BC 3E                     823 	.db #0x3e	; 62
      0094BD 41                     824 	.db #0x41	; 65	'A'
      0094BE 41                     825 	.db #0x41	; 65	'A'
      0094BF 41                     826 	.db #0x41	; 65	'A'
      0094C0 3E                     827 	.db #0x3e	; 62
      0094C1 7F                     828 	.db #0x7f	; 127
      0094C2 01                     829 	.db #0x01	; 1
      0094C3 01                     830 	.db #0x01	; 1
      0094C4 01                     831 	.db #0x01	; 1
      0094C5 7F                     832 	.db #0x7f	; 127
      0094C6 7F                     833 	.db #0x7f	; 127
      0094C7 09                     834 	.db #0x09	; 9
      0094C8 09                     835 	.db #0x09	; 9
      0094C9 09                     836 	.db #0x09	; 9
      0094CA 06                     837 	.db #0x06	; 6
      0094CB 3E                     838 	.db #0x3e	; 62
      0094CC 41                     839 	.db #0x41	; 65	'A'
      0094CD 41                     840 	.db #0x41	; 65	'A'
      0094CE 41                     841 	.db #0x41	; 65	'A'
      0094CF 22                     842 	.db #0x22	; 34
      0094D0 01                     843 	.db #0x01	; 1
      0094D1 01                     844 	.db #0x01	; 1
      0094D2 7F                     845 	.db #0x7f	; 127
      0094D3 01                     846 	.db #0x01	; 1
      0094D4 01                     847 	.db #0x01	; 1
      0094D5 07                     848 	.db #0x07	; 7
      0094D6 48                     849 	.db #0x48	; 72	'H'
      0094D7 48                     850 	.db #0x48	; 72	'H'
      0094D8 48                     851 	.db #0x48	; 72	'H'
      0094D9 3F                     852 	.db #0x3f	; 63
      0094DA 0E                     853 	.db #0x0e	; 14
      0094DB 11                     854 	.db #0x11	; 17
      0094DC 7F                     855 	.db #0x7f	; 127
      0094DD 11                     856 	.db #0x11	; 17
      0094DE 0E                     857 	.db #0x0e	; 14
      0094DF 63                     858 	.db #0x63	; 99	'c'
      0094E0 14                     859 	.db #0x14	; 20
      0094E1 08                     860 	.db #0x08	; 8
      0094E2 14                     861 	.db #0x14	; 20
      0094E3 63                     862 	.db #0x63	; 99	'c'
      0094E4 3F                     863 	.db #0x3f	; 63
      0094E5 20                     864 	.db #0x20	; 32
      0094E6 20                     865 	.db #0x20	; 32
      0094E7 3F                     866 	.db #0x3f	; 63
      0094E8 60                     867 	.db #0x60	; 96
      0094E9 07                     868 	.db #0x07	; 7
      0094EA 08                     869 	.db #0x08	; 8
      0094EB 08                     870 	.db #0x08	; 8
      0094EC 08                     871 	.db #0x08	; 8
      0094ED 7F                     872 	.db #0x7f	; 127
      0094EE 7F                     873 	.db #0x7f	; 127
      0094EF 40                     874 	.db #0x40	; 64
      0094F0 7E                     875 	.db #0x7e	; 126
      0094F1 40                     876 	.db #0x40	; 64
      0094F2 7F                     877 	.db #0x7f	; 127
      0094F3 3F                     878 	.db #0x3f	; 63
      0094F4 20                     879 	.db #0x20	; 32
      0094F5 3F                     880 	.db #0x3f	; 63
      0094F6 20                     881 	.db #0x20	; 32
      0094F7 7F                     882 	.db #0x7f	; 127
      0094F8 01                     883 	.db #0x01	; 1
      0094F9 7F                     884 	.db #0x7f	; 127
      0094FA 48                     885 	.db #0x48	; 72	'H'
      0094FB 48                     886 	.db #0x48	; 72	'H'
      0094FC 30                     887 	.db #0x30	; 48	'0'
      0094FD 7F                     888 	.db #0x7f	; 127
      0094FE 48                     889 	.db #0x48	; 72	'H'
      0094FF 30                     890 	.db #0x30	; 48	'0'
      009500 00                     891 	.db #0x00	; 0
      009501 7F                     892 	.db #0x7f	; 127
      009502 00                     893 	.db #0x00	; 0
      009503 7F                     894 	.db #0x7f	; 127
      009504 48                     895 	.db #0x48	; 72	'H'
      009505 48                     896 	.db #0x48	; 72	'H'
      009506 30                     897 	.db #0x30	; 48	'0'
      009507 22                     898 	.db #0x22	; 34
      009508 41                     899 	.db #0x41	; 65	'A'
      009509 49                     900 	.db #0x49	; 73	'I'
      00950A 49                     901 	.db #0x49	; 73	'I'
      00950B 3E                     902 	.db #0x3e	; 62
      00950C 7F                     903 	.db #0x7f	; 127
      00950D 08                     904 	.db #0x08	; 8
      00950E 3E                     905 	.db #0x3e	; 62
      00950F 41                     906 	.db #0x41	; 65	'A'
      009510 3E                     907 	.db #0x3e	; 62
      009511 46                     908 	.db #0x46	; 70	'F'
      009512 29                     909 	.db #0x29	; 41
      009513 19                     910 	.db #0x19	; 25
      009514 09                     911 	.db #0x09	; 9
      009515 7F                     912 	.db #0x7f	; 127
      009516 20                     913 	.db #0x20	; 32
      009517 54                     914 	.db #0x54	; 84	'T'
      009518 54                     915 	.db #0x54	; 84	'T'
      009519 54                     916 	.db #0x54	; 84	'T'
      00951A 78                     917 	.db #0x78	; 120	'x'
      00951B 3C                     918 	.db #0x3c	; 60
      00951C 4A                     919 	.db #0x4a	; 74	'J'
      00951D 4A                     920 	.db #0x4a	; 74	'J'
      00951E 4A                     921 	.db #0x4a	; 74	'J'
      00951F 31                     922 	.db #0x31	; 49	'1'
      009520 7C                     923 	.db #0x7c	; 124
      009521 54                     924 	.db #0x54	; 84	'T'
      009522 54                     925 	.db #0x54	; 84	'T'
      009523 28                     926 	.db #0x28	; 40
      009524 00                     927 	.db #0x00	; 0
      009525 7C                     928 	.db #0x7c	; 124
      009526 04                     929 	.db #0x04	; 4
      009527 04                     930 	.db #0x04	; 4
      009528 0C                     931 	.db #0x0c	; 12
      009529 00                     932 	.db #0x00	; 0
      00952A 60                     933 	.db #0x60	; 96
      00952B 3C                     934 	.db #0x3c	; 60
      00952C 24                     935 	.db #0x24	; 36
      00952D 3C                     936 	.db #0x3c	; 60
      00952E 60                     937 	.db #0x60	; 96
      00952F 38                     938 	.db #0x38	; 56	'8'
      009530 54                     939 	.db #0x54	; 84	'T'
      009531 54                     940 	.db #0x54	; 84	'T'
      009532 54                     941 	.db #0x54	; 84	'T'
      009533 18                     942 	.db #0x18	; 24
      009534 6C                     943 	.db #0x6c	; 108	'l'
      009535 10                     944 	.db #0x10	; 16
      009536 7C                     945 	.db #0x7c	; 124
      009537 10                     946 	.db #0x10	; 16
      009538 6C                     947 	.db #0x6c	; 108	'l'
      009539 00                     948 	.db #0x00	; 0
      00953A 44                     949 	.db #0x44	; 68	'D'
      00953B 54                     950 	.db #0x54	; 84	'T'
      00953C 54                     951 	.db #0x54	; 84	'T'
      00953D 28                     952 	.db #0x28	; 40
      00953E 7C                     953 	.db #0x7c	; 124
      00953F 20                     954 	.db #0x20	; 32
      009540 10                     955 	.db #0x10	; 16
      009541 08                     956 	.db #0x08	; 8
      009542 7C                     957 	.db #0x7c	; 124
      009543 7C                     958 	.db #0x7c	; 124
      009544 21                     959 	.db #0x21	; 33
      009545 12                     960 	.db #0x12	; 18
      009546 09                     961 	.db #0x09	; 9
      009547 7C                     962 	.db #0x7c	; 124
      009548 7C                     963 	.db #0x7c	; 124
      009549 10                     964 	.db #0x10	; 16
      00954A 28                     965 	.db #0x28	; 40
      00954B 44                     966 	.db #0x44	; 68	'D'
      00954C 00                     967 	.db #0x00	; 0
      00954D 40                     968 	.db #0x40	; 64
      00954E 38                     969 	.db #0x38	; 56	'8'
      00954F 04                     970 	.db #0x04	; 4
      009550 04                     971 	.db #0x04	; 4
      009551 7C                     972 	.db #0x7c	; 124
      009552 7C                     973 	.db #0x7c	; 124
      009553 08                     974 	.db #0x08	; 8
      009554 10                     975 	.db #0x10	; 16
      009555 08                     976 	.db #0x08	; 8
      009556 7C                     977 	.db #0x7c	; 124
      009557 7C                     978 	.db #0x7c	; 124
      009558 10                     979 	.db #0x10	; 16
      009559 10                     980 	.db #0x10	; 16
      00955A 10                     981 	.db #0x10	; 16
      00955B 7C                     982 	.db #0x7c	; 124
      00955C 38                     983 	.db #0x38	; 56	'8'
      00955D 44                     984 	.db #0x44	; 68	'D'
      00955E 44                     985 	.db #0x44	; 68	'D'
      00955F 44                     986 	.db #0x44	; 68	'D'
      009560 38                     987 	.db #0x38	; 56	'8'
      009561 7C                     988 	.db #0x7c	; 124
      009562 04                     989 	.db #0x04	; 4
      009563 04                     990 	.db #0x04	; 4
      009564 04                     991 	.db #0x04	; 4
      009565 7C                     992 	.db #0x7c	; 124
      009566 7C                     993 	.db #0x7c	; 124
      009567 14                     994 	.db #0x14	; 20
      009568 14                     995 	.db #0x14	; 20
      009569 14                     996 	.db #0x14	; 20
      00956A 08                     997 	.db #0x08	; 8
      00956B 38                     998 	.db #0x38	; 56	'8'
      00956C 44                     999 	.db #0x44	; 68	'D'
      00956D 44                    1000 	.db #0x44	; 68	'D'
      00956E 44                    1001 	.db #0x44	; 68	'D'
      00956F 00                    1002 	.db #0x00	; 0
      009570 04                    1003 	.db #0x04	; 4
      009571 04                    1004 	.db #0x04	; 4
      009572 7C                    1005 	.db #0x7c	; 124
      009573 04                    1006 	.db #0x04	; 4
      009574 04                    1007 	.db #0x04	; 4
      009575 0C                    1008 	.db #0x0c	; 12
      009576 50                    1009 	.db #0x50	; 80	'P'
      009577 50                    1010 	.db #0x50	; 80	'P'
      009578 50                    1011 	.db #0x50	; 80	'P'
      009579 3C                    1012 	.db #0x3c	; 60
      00957A 08                    1013 	.db #0x08	; 8
      00957B 14                    1014 	.db #0x14	; 20
      00957C 7C                    1015 	.db #0x7c	; 124
      00957D 14                    1016 	.db #0x14	; 20
      00957E 08                    1017 	.db #0x08	; 8
      00957F 44                    1018 	.db #0x44	; 68	'D'
      009580 28                    1019 	.db #0x28	; 40
      009581 10                    1020 	.db #0x10	; 16
      009582 28                    1021 	.db #0x28	; 40
      009583 44                    1022 	.db #0x44	; 68	'D'
      009584 3C                    1023 	.db #0x3c	; 60
      009585 20                    1024 	.db #0x20	; 32
      009586 20                    1025 	.db #0x20	; 32
      009587 3C                    1026 	.db #0x3c	; 60
      009588 60                    1027 	.db #0x60	; 96
      009589 0C                    1028 	.db #0x0c	; 12
      00958A 10                    1029 	.db #0x10	; 16
      00958B 10                    1030 	.db #0x10	; 16
      00958C 10                    1031 	.db #0x10	; 16
      00958D 7C                    1032 	.db #0x7c	; 124
      00958E 7C                    1033 	.db #0x7c	; 124
      00958F 40                    1034 	.db #0x40	; 64
      009590 7C                    1035 	.db #0x7c	; 124
      009591 40                    1036 	.db #0x40	; 64
      009592 7C                    1037 	.db #0x7c	; 124
      009593 3C                    1038 	.db #0x3c	; 60
      009594 20                    1039 	.db #0x20	; 32
      009595 3C                    1040 	.db #0x3c	; 60
      009596 20                    1041 	.db #0x20	; 32
      009597 7C                    1042 	.db #0x7c	; 124
      009598 04                    1043 	.db #0x04	; 4
      009599 7C                    1044 	.db #0x7c	; 124
      00959A 50                    1045 	.db #0x50	; 80	'P'
      00959B 50                    1046 	.db #0x50	; 80	'P'
      00959C 20                    1047 	.db #0x20	; 32
      00959D 7C                    1048 	.db #0x7c	; 124
      00959E 50                    1049 	.db #0x50	; 80	'P'
      00959F 20                    1050 	.db #0x20	; 32
      0095A0 00                    1051 	.db #0x00	; 0
      0095A1 7C                    1052 	.db #0x7c	; 124
      0095A2 00                    1053 	.db #0x00	; 0
      0095A3 7C                    1054 	.db #0x7c	; 124
      0095A4 50                    1055 	.db #0x50	; 80	'P'
      0095A5 50                    1056 	.db #0x50	; 80	'P'
      0095A6 20                    1057 	.db #0x20	; 32
      0095A7 28                    1058 	.db #0x28	; 40
      0095A8 44                    1059 	.db #0x44	; 68	'D'
      0095A9 54                    1060 	.db #0x54	; 84	'T'
      0095AA 54                    1061 	.db #0x54	; 84	'T'
      0095AB 38                    1062 	.db #0x38	; 56	'8'
      0095AC 7C                    1063 	.db #0x7c	; 124
      0095AD 10                    1064 	.db #0x10	; 16
      0095AE 38                    1065 	.db #0x38	; 56	'8'
      0095AF 44                    1066 	.db #0x44	; 68	'D'
      0095B0 38                    1067 	.db #0x38	; 56	'8'
      0095B1 48                    1068 	.db #0x48	; 72	'H'
      0095B2 54                    1069 	.db #0x54	; 84	'T'
      0095B3 34                    1070 	.db #0x34	; 52	'4'
      0095B4 14                    1071 	.db #0x14	; 20
      0095B5 7C                    1072 	.db #0x7c	; 124
      0095B6                       1073 _BigNumbers:
      0095B6 FC                    1074 	.db #0xfc	; 252
      0095B7 7A                    1075 	.db #0x7a	; 122	'z'
      0095B8 06                    1076 	.db #0x06	; 6
      0095B9 06                    1077 	.db #0x06	; 6
      0095BA 06                    1078 	.db #0x06	; 6
      0095BB 06                    1079 	.db #0x06	; 6
      0095BC 06                    1080 	.db #0x06	; 6
      0095BD 06                    1081 	.db #0x06	; 6
      0095BE 7A                    1082 	.db #0x7a	; 122	'z'
      0095BF FC                    1083 	.db #0xfc	; 252
      0095C0 7E                    1084 	.db #0x7e	; 126
      0095C1 BC                    1085 	.db #0xbc	; 188
      0095C2 C0                    1086 	.db #0xc0	; 192
      0095C3 C0                    1087 	.db #0xc0	; 192
      0095C4 C0                    1088 	.db #0xc0	; 192
      0095C5 C0                    1089 	.db #0xc0	; 192
      0095C6 C0                    1090 	.db #0xc0	; 192
      0095C7 C0                    1091 	.db #0xc0	; 192
      0095C8 BC                    1092 	.db #0xbc	; 188
      0095C9 7E                    1093 	.db #0x7e	; 126
      0095CA 00                    1094 	.db #0x00	; 0
      0095CB 00                    1095 	.db #0x00	; 0
      0095CC 00                    1096 	.db #0x00	; 0
      0095CD 00                    1097 	.db #0x00	; 0
      0095CE 00                    1098 	.db #0x00	; 0
      0095CF 00                    1099 	.db #0x00	; 0
      0095D0 00                    1100 	.db #0x00	; 0
      0095D1 00                    1101 	.db #0x00	; 0
      0095D2 78                    1102 	.db #0x78	; 120	'x'
      0095D3 FC                    1103 	.db #0xfc	; 252
      0095D4 00                    1104 	.db #0x00	; 0
      0095D5 00                    1105 	.db #0x00	; 0
      0095D6 00                    1106 	.db #0x00	; 0
      0095D7 00                    1107 	.db #0x00	; 0
      0095D8 00                    1108 	.db #0x00	; 0
      0095D9 00                    1109 	.db #0x00	; 0
      0095DA 00                    1110 	.db #0x00	; 0
      0095DB 00                    1111 	.db #0x00	; 0
      0095DC 3C                    1112 	.db #0x3c	; 60
      0095DD 7E                    1113 	.db #0x7e	; 126
      0095DE 00                    1114 	.db #0x00	; 0
      0095DF 02                    1115 	.db #0x02	; 2
      0095E0 86                    1116 	.db #0x86	; 134
      0095E1 86                    1117 	.db #0x86	; 134
      0095E2 86                    1118 	.db #0x86	; 134
      0095E3 86                    1119 	.db #0x86	; 134
      0095E4 86                    1120 	.db #0x86	; 134
      0095E5 86                    1121 	.db #0x86	; 134
      0095E6 7A                    1122 	.db #0x7a	; 122	'z'
      0095E7 FC                    1123 	.db #0xfc	; 252
      0095E8 7E                    1124 	.db #0x7e	; 126
      0095E9 BD                    1125 	.db #0xbd	; 189
      0095EA C3                    1126 	.db #0xc3	; 195
      0095EB C3                    1127 	.db #0xc3	; 195
      0095EC C3                    1128 	.db #0xc3	; 195
      0095ED C3                    1129 	.db #0xc3	; 195
      0095EE C3                    1130 	.db #0xc3	; 195
      0095EF C3                    1131 	.db #0xc3	; 195
      0095F0 81                    1132 	.db #0x81	; 129
      0095F1 00                    1133 	.db #0x00	; 0
      0095F2 00                    1134 	.db #0x00	; 0
      0095F3 02                    1135 	.db #0x02	; 2
      0095F4 86                    1136 	.db #0x86	; 134
      0095F5 86                    1137 	.db #0x86	; 134
      0095F6 86                    1138 	.db #0x86	; 134
      0095F7 86                    1139 	.db #0x86	; 134
      0095F8 86                    1140 	.db #0x86	; 134
      0095F9 86                    1141 	.db #0x86	; 134
      0095FA 7A                    1142 	.db #0x7a	; 122	'z'
      0095FB FC                    1143 	.db #0xfc	; 252
      0095FC 00                    1144 	.db #0x00	; 0
      0095FD 81                    1145 	.db #0x81	; 129
      0095FE C3                    1146 	.db #0xc3	; 195
      0095FF C3                    1147 	.db #0xc3	; 195
      009600 C3                    1148 	.db #0xc3	; 195
      009601 C3                    1149 	.db #0xc3	; 195
      009602 C3                    1150 	.db #0xc3	; 195
      009603 C3                    1151 	.db #0xc3	; 195
      009604 BD                    1152 	.db #0xbd	; 189
      009605 7E                    1153 	.db #0x7e	; 126
      009606 FC                    1154 	.db #0xfc	; 252
      009607 78                    1155 	.db #0x78	; 120	'x'
      009608 80                    1156 	.db #0x80	; 128
      009609 80                    1157 	.db #0x80	; 128
      00960A 80                    1158 	.db #0x80	; 128
      00960B 80                    1159 	.db #0x80	; 128
      00960C 80                    1160 	.db #0x80	; 128
      00960D 80                    1161 	.db #0x80	; 128
      00960E 78                    1162 	.db #0x78	; 120	'x'
      00960F FC                    1163 	.db #0xfc	; 252
      009610 00                    1164 	.db #0x00	; 0
      009611 01                    1165 	.db #0x01	; 1
      009612 03                    1166 	.db #0x03	; 3
      009613 03                    1167 	.db #0x03	; 3
      009614 03                    1168 	.db #0x03	; 3
      009615 03                    1169 	.db #0x03	; 3
      009616 03                    1170 	.db #0x03	; 3
      009617 03                    1171 	.db #0x03	; 3
      009618 3D                    1172 	.db #0x3d	; 61
      009619 7E                    1173 	.db #0x7e	; 126
      00961A FC                    1174 	.db #0xfc	; 252
      00961B 7A                    1175 	.db #0x7a	; 122	'z'
      00961C 86                    1176 	.db #0x86	; 134
      00961D 86                    1177 	.db #0x86	; 134
      00961E 86                    1178 	.db #0x86	; 134
      00961F 86                    1179 	.db #0x86	; 134
      009620 86                    1180 	.db #0x86	; 134
      009621 86                    1181 	.db #0x86	; 134
      009622 02                    1182 	.db #0x02	; 2
      009623 00                    1183 	.db #0x00	; 0
      009624 00                    1184 	.db #0x00	; 0
      009625 81                    1185 	.db #0x81	; 129
      009626 C3                    1186 	.db #0xc3	; 195
      009627 C3                    1187 	.db #0xc3	; 195
      009628 C3                    1188 	.db #0xc3	; 195
      009629 C3                    1189 	.db #0xc3	; 195
      00962A C3                    1190 	.db #0xc3	; 195
      00962B C3                    1191 	.db #0xc3	; 195
      00962C BD                    1192 	.db #0xbd	; 189
      00962D 7E                    1193 	.db #0x7e	; 126
      00962E FC                    1194 	.db #0xfc	; 252
      00962F 7A                    1195 	.db #0x7a	; 122	'z'
      009630 86                    1196 	.db #0x86	; 134
      009631 86                    1197 	.db #0x86	; 134
      009632 86                    1198 	.db #0x86	; 134
      009633 86                    1199 	.db #0x86	; 134
      009634 86                    1200 	.db #0x86	; 134
      009635 86                    1201 	.db #0x86	; 134
      009636 02                    1202 	.db #0x02	; 2
      009637 00                    1203 	.db #0x00	; 0
      009638 7E                    1204 	.db #0x7e	; 126
      009639 BD                    1205 	.db #0xbd	; 189
      00963A C3                    1206 	.db #0xc3	; 195
      00963B C3                    1207 	.db #0xc3	; 195
      00963C C3                    1208 	.db #0xc3	; 195
      00963D C3                    1209 	.db #0xc3	; 195
      00963E C3                    1210 	.db #0xc3	; 195
      00963F C3                    1211 	.db #0xc3	; 195
      009640 BD                    1212 	.db #0xbd	; 189
      009641 7E                    1213 	.db #0x7e	; 126
      009642 00                    1214 	.db #0x00	; 0
      009643 02                    1215 	.db #0x02	; 2
      009644 06                    1216 	.db #0x06	; 6
      009645 06                    1217 	.db #0x06	; 6
      009646 06                    1218 	.db #0x06	; 6
      009647 06                    1219 	.db #0x06	; 6
      009648 06                    1220 	.db #0x06	; 6
      009649 06                    1221 	.db #0x06	; 6
      00964A 7A                    1222 	.db #0x7a	; 122	'z'
      00964B FC                    1223 	.db #0xfc	; 252
      00964C 00                    1224 	.db #0x00	; 0
      00964D 00                    1225 	.db #0x00	; 0
      00964E 00                    1226 	.db #0x00	; 0
      00964F 00                    1227 	.db #0x00	; 0
      009650 00                    1228 	.db #0x00	; 0
      009651 00                    1229 	.db #0x00	; 0
      009652 00                    1230 	.db #0x00	; 0
      009653 00                    1231 	.db #0x00	; 0
      009654 3C                    1232 	.db #0x3c	; 60
      009655 7E                    1233 	.db #0x7e	; 126
      009656 FC                    1234 	.db #0xfc	; 252
      009657 7A                    1235 	.db #0x7a	; 122	'z'
      009658 86                    1236 	.db #0x86	; 134
      009659 86                    1237 	.db #0x86	; 134
      00965A 86                    1238 	.db #0x86	; 134
      00965B 86                    1239 	.db #0x86	; 134
      00965C 86                    1240 	.db #0x86	; 134
      00965D 86                    1241 	.db #0x86	; 134
      00965E 7A                    1242 	.db #0x7a	; 122	'z'
      00965F FC                    1243 	.db #0xfc	; 252
      009660 7E                    1244 	.db #0x7e	; 126
      009661 BD                    1245 	.db #0xbd	; 189
      009662 C3                    1246 	.db #0xc3	; 195
      009663 C3                    1247 	.db #0xc3	; 195
      009664 C3                    1248 	.db #0xc3	; 195
      009665 C3                    1249 	.db #0xc3	; 195
      009666 C3                    1250 	.db #0xc3	; 195
      009667 C3                    1251 	.db #0xc3	; 195
      009668 BD                    1252 	.db #0xbd	; 189
      009669 7E                    1253 	.db #0x7e	; 126
      00966A FC                    1254 	.db #0xfc	; 252
      00966B 7A                    1255 	.db #0x7a	; 122	'z'
      00966C 86                    1256 	.db #0x86	; 134
      00966D 86                    1257 	.db #0x86	; 134
      00966E 86                    1258 	.db #0x86	; 134
      00966F 86                    1259 	.db #0x86	; 134
      009670 86                    1260 	.db #0x86	; 134
      009671 86                    1261 	.db #0x86	; 134
      009672 7A                    1262 	.db #0x7a	; 122	'z'
      009673 FC                    1263 	.db #0xfc	; 252
      009674 00                    1264 	.db #0x00	; 0
      009675 81                    1265 	.db #0x81	; 129
      009676 C3                    1266 	.db #0xc3	; 195
      009677 C3                    1267 	.db #0xc3	; 195
      009678 C3                    1268 	.db #0xc3	; 195
      009679 C3                    1269 	.db #0xc3	; 195
      00967A C3                    1270 	.db #0xc3	; 195
      00967B C3                    1271 	.db #0xc3	; 195
      00967C BD                    1272 	.db #0xbd	; 189
      00967D 7E                    1273 	.db #0x7e	; 126
      00967E                       1274 _LargeNumbers:
      00967E 00                    1275 	.db #0x00	; 0
      00967F FC                    1276 	.db #0xfc	; 252
      009680 F8                    1277 	.db #0xf8	; 248
      009681 F2                    1278 	.db #0xf2	; 242
      009682 E6                    1279 	.db #0xe6	; 230
      009683 CE                    1280 	.db #0xce	; 206
      009684 1E                    1281 	.db #0x1e	; 30
      009685 3E                    1282 	.db #0x3e	; 62
      009686 3E                    1283 	.db #0x3e	; 62
      009687 3E                    1284 	.db #0x3e	; 62
      009688 3E                    1285 	.db #0x3e	; 62
      009689 3E                    1286 	.db #0x3e	; 62
      00968A 3E                    1287 	.db #0x3e	; 62
      00968B 3E                    1288 	.db #0x3e	; 62
      00968C 1E                    1289 	.db #0x1e	; 30
      00968D CE                    1290 	.db #0xce	; 206
      00968E E6                    1291 	.db #0xe6	; 230
      00968F F2                    1292 	.db #0xf2	; 242
      009690 F8                    1293 	.db #0xf8	; 248
      009691 FC                    1294 	.db #0xfc	; 252
      009692 00                    1295 	.db #0x00	; 0
      009693 FF                    1296 	.db #0xff	; 255
      009694 7F                    1297 	.db #0x7f	; 127
      009695 3F                    1298 	.db #0x3f	; 63
      009696 1F                    1299 	.db #0x1f	; 31
      009697 0F                    1300 	.db #0x0f	; 15
      009698 00                    1301 	.db #0x00	; 0
      009699 00                    1302 	.db #0x00	; 0
      00969A 00                    1303 	.db #0x00	; 0
      00969B 00                    1304 	.db #0x00	; 0
      00969C 00                    1305 	.db #0x00	; 0
      00969D 00                    1306 	.db #0x00	; 0
      00969E 00                    1307 	.db #0x00	; 0
      00969F 00                    1308 	.db #0x00	; 0
      0096A0 00                    1309 	.db #0x00	; 0
      0096A1 0F                    1310 	.db #0x0f	; 15
      0096A2 1F                    1311 	.db #0x1f	; 31
      0096A3 3F                    1312 	.db #0x3f	; 63
      0096A4 7F                    1313 	.db #0x7f	; 127
      0096A5 FF                    1314 	.db #0xff	; 255
      0096A6 00                    1315 	.db #0x00	; 0
      0096A7 FE                    1316 	.db #0xfe	; 254
      0096A8 FC                    1317 	.db #0xfc	; 252
      0096A9 F8                    1318 	.db #0xf8	; 248
      0096AA F0                    1319 	.db #0xf0	; 240
      0096AB E0                    1320 	.db #0xe0	; 224
      0096AC 00                    1321 	.db #0x00	; 0
      0096AD 00                    1322 	.db #0x00	; 0
      0096AE 00                    1323 	.db #0x00	; 0
      0096AF 00                    1324 	.db #0x00	; 0
      0096B0 00                    1325 	.db #0x00	; 0
      0096B1 00                    1326 	.db #0x00	; 0
      0096B2 00                    1327 	.db #0x00	; 0
      0096B3 00                    1328 	.db #0x00	; 0
      0096B4 00                    1329 	.db #0x00	; 0
      0096B5 E0                    1330 	.db #0xe0	; 224
      0096B6 F0                    1331 	.db #0xf0	; 240
      0096B7 F8                    1332 	.db #0xf8	; 248
      0096B8 FC                    1333 	.db #0xfc	; 252
      0096B9 FE                    1334 	.db #0xfe	; 254
      0096BA 00                    1335 	.db #0x00	; 0
      0096BB 7F                    1336 	.db #0x7f	; 127
      0096BC 3F                    1337 	.db #0x3f	; 63
      0096BD 9F                    1338 	.db #0x9f	; 159
      0096BE CF                    1339 	.db #0xcf	; 207
      0096BF E7                    1340 	.db #0xe7	; 231
      0096C0 F0                    1341 	.db #0xf0	; 240
      0096C1 F8                    1342 	.db #0xf8	; 248
      0096C2 F8                    1343 	.db #0xf8	; 248
      0096C3 F8                    1344 	.db #0xf8	; 248
      0096C4 F8                    1345 	.db #0xf8	; 248
      0096C5 F8                    1346 	.db #0xf8	; 248
      0096C6 F8                    1347 	.db #0xf8	; 248
      0096C7 F8                    1348 	.db #0xf8	; 248
      0096C8 F0                    1349 	.db #0xf0	; 240
      0096C9 E7                    1350 	.db #0xe7	; 231
      0096CA CF                    1351 	.db #0xcf	; 207
      0096CB 9F                    1352 	.db #0x9f	; 159
      0096CC 3F                    1353 	.db #0x3f	; 63
      0096CD 7F                    1354 	.db #0x7f	; 127
      0096CE 00                    1355 	.db #0x00	; 0
      0096CF 00                    1356 	.db #0x00	; 0
      0096D0 00                    1357 	.db #0x00	; 0
      0096D1 00                    1358 	.db #0x00	; 0
      0096D2 00                    1359 	.db #0x00	; 0
      0096D3 00                    1360 	.db #0x00	; 0
      0096D4 00                    1361 	.db #0x00	; 0
      0096D5 00                    1362 	.db #0x00	; 0
      0096D6 00                    1363 	.db #0x00	; 0
      0096D7 00                    1364 	.db #0x00	; 0
      0096D8 00                    1365 	.db #0x00	; 0
      0096D9 00                    1366 	.db #0x00	; 0
      0096DA 00                    1367 	.db #0x00	; 0
      0096DB 00                    1368 	.db #0x00	; 0
      0096DC 00                    1369 	.db #0x00	; 0
      0096DD C0                    1370 	.db #0xc0	; 192
      0096DE E0                    1371 	.db #0xe0	; 224
      0096DF F0                    1372 	.db #0xf0	; 240
      0096E0 F8                    1373 	.db #0xf8	; 248
      0096E1 FC                    1374 	.db #0xfc	; 252
      0096E2 00                    1375 	.db #0x00	; 0
      0096E3 00                    1376 	.db #0x00	; 0
      0096E4 00                    1377 	.db #0x00	; 0
      0096E5 00                    1378 	.db #0x00	; 0
      0096E6 00                    1379 	.db #0x00	; 0
      0096E7 00                    1380 	.db #0x00	; 0
      0096E8 00                    1381 	.db #0x00	; 0
      0096E9 00                    1382 	.db #0x00	; 0
      0096EA 00                    1383 	.db #0x00	; 0
      0096EB 00                    1384 	.db #0x00	; 0
      0096EC 00                    1385 	.db #0x00	; 0
      0096ED 00                    1386 	.db #0x00	; 0
      0096EE 00                    1387 	.db #0x00	; 0
      0096EF 00                    1388 	.db #0x00	; 0
      0096F0 00                    1389 	.db #0x00	; 0
      0096F1 0F                    1390 	.db #0x0f	; 15
      0096F2 1F                    1391 	.db #0x1f	; 31
      0096F3 3F                    1392 	.db #0x3f	; 63
      0096F4 7F                    1393 	.db #0x7f	; 127
      0096F5 FF                    1394 	.db #0xff	; 255
      0096F6 00                    1395 	.db #0x00	; 0
      0096F7 00                    1396 	.db #0x00	; 0
      0096F8 00                    1397 	.db #0x00	; 0
      0096F9 00                    1398 	.db #0x00	; 0
      0096FA 00                    1399 	.db #0x00	; 0
      0096FB 00                    1400 	.db #0x00	; 0
      0096FC 00                    1401 	.db #0x00	; 0
      0096FD 00                    1402 	.db #0x00	; 0
      0096FE 00                    1403 	.db #0x00	; 0
      0096FF 00                    1404 	.db #0x00	; 0
      009700 00                    1405 	.db #0x00	; 0
      009701 00                    1406 	.db #0x00	; 0
      009702 00                    1407 	.db #0x00	; 0
      009703 00                    1408 	.db #0x00	; 0
      009704 00                    1409 	.db #0x00	; 0
      009705 E0                    1410 	.db #0xe0	; 224
      009706 F0                    1411 	.db #0xf0	; 240
      009707 F8                    1412 	.db #0xf8	; 248
      009708 FC                    1413 	.db #0xfc	; 252
      009709 FE                    1414 	.db #0xfe	; 254
      00970A 00                    1415 	.db #0x00	; 0
      00970B 00                    1416 	.db #0x00	; 0
      00970C 00                    1417 	.db #0x00	; 0
      00970D 00                    1418 	.db #0x00	; 0
      00970E 00                    1419 	.db #0x00	; 0
      00970F 00                    1420 	.db #0x00	; 0
      009710 00                    1421 	.db #0x00	; 0
      009711 00                    1422 	.db #0x00	; 0
      009712 00                    1423 	.db #0x00	; 0
      009713 00                    1424 	.db #0x00	; 0
      009714 00                    1425 	.db #0x00	; 0
      009715 00                    1426 	.db #0x00	; 0
      009716 00                    1427 	.db #0x00	; 0
      009717 00                    1428 	.db #0x00	; 0
      009718 00                    1429 	.db #0x00	; 0
      009719 07                    1430 	.db #0x07	; 7
      00971A 0F                    1431 	.db #0x0f	; 15
      00971B 1F                    1432 	.db #0x1f	; 31
      00971C 3F                    1433 	.db #0x3f	; 63
      00971D 7F                    1434 	.db #0x7f	; 127
      00971E 00                    1435 	.db #0x00	; 0
      00971F 00                    1436 	.db #0x00	; 0
      009720 00                    1437 	.db #0x00	; 0
      009721 02                    1438 	.db #0x02	; 2
      009722 06                    1439 	.db #0x06	; 6
      009723 0E                    1440 	.db #0x0e	; 14
      009724 1E                    1441 	.db #0x1e	; 30
      009725 3E                    1442 	.db #0x3e	; 62
      009726 3E                    1443 	.db #0x3e	; 62
      009727 3E                    1444 	.db #0x3e	; 62
      009728 3E                    1445 	.db #0x3e	; 62
      009729 3E                    1446 	.db #0x3e	; 62
      00972A 3E                    1447 	.db #0x3e	; 62
      00972B 3E                    1448 	.db #0x3e	; 62
      00972C 1E                    1449 	.db #0x1e	; 30
      00972D CE                    1450 	.db #0xce	; 206
      00972E E6                    1451 	.db #0xe6	; 230
      00972F F2                    1452 	.db #0xf2	; 242
      009730 F8                    1453 	.db #0xf8	; 248
      009731 FC                    1454 	.db #0xfc	; 252
      009732 00                    1455 	.db #0x00	; 0
      009733 00                    1456 	.db #0x00	; 0
      009734 00                    1457 	.db #0x00	; 0
      009735 80                    1458 	.db #0x80	; 128
      009736 C0                    1459 	.db #0xc0	; 192
      009737 C0                    1460 	.db #0xc0	; 192
      009738 C0                    1461 	.db #0xc0	; 192
      009739 C0                    1462 	.db #0xc0	; 192
      00973A C0                    1463 	.db #0xc0	; 192
      00973B C0                    1464 	.db #0xc0	; 192
      00973C C0                    1465 	.db #0xc0	; 192
      00973D C0                    1466 	.db #0xc0	; 192
      00973E C0                    1467 	.db #0xc0	; 192
      00973F C0                    1468 	.db #0xc0	; 192
      009740 C0                    1469 	.db #0xc0	; 192
      009741 C7                    1470 	.db #0xc7	; 199
      009742 CF                    1471 	.db #0xcf	; 207
      009743 9F                    1472 	.db #0x9f	; 159
      009744 3F                    1473 	.db #0x3f	; 63
      009745 7F                    1474 	.db #0x7f	; 127
      009746 00                    1475 	.db #0x00	; 0
      009747 FC                    1476 	.db #0xfc	; 252
      009748 F9                    1477 	.db #0xf9	; 249
      009749 F3                    1478 	.db #0xf3	; 243
      00974A E7                    1479 	.db #0xe7	; 231
      00974B C7                    1480 	.db #0xc7	; 199
      00974C 07                    1481 	.db #0x07	; 7
      00974D 07                    1482 	.db #0x07	; 7
      00974E 07                    1483 	.db #0x07	; 7
      00974F 07                    1484 	.db #0x07	; 7
      009750 07                    1485 	.db #0x07	; 7
      009751 07                    1486 	.db #0x07	; 7
      009752 07                    1487 	.db #0x07	; 7
      009753 07                    1488 	.db #0x07	; 7
      009754 07                    1489 	.db #0x07	; 7
      009755 07                    1490 	.db #0x07	; 7
      009756 07                    1491 	.db #0x07	; 7
      009757 03                    1492 	.db #0x03	; 3
      009758 01                    1493 	.db #0x01	; 1
      009759 00                    1494 	.db #0x00	; 0
      00975A 00                    1495 	.db #0x00	; 0
      00975B 7F                    1496 	.db #0x7f	; 127
      00975C 3F                    1497 	.db #0x3f	; 63
      00975D 9F                    1498 	.db #0x9f	; 159
      00975E CF                    1499 	.db #0xcf	; 207
      00975F E7                    1500 	.db #0xe7	; 231
      009760 F0                    1501 	.db #0xf0	; 240
      009761 F0                    1502 	.db #0xf0	; 240
      009762 F8                    1503 	.db #0xf8	; 248
      009763 F8                    1504 	.db #0xf8	; 248
      009764 F8                    1505 	.db #0xf8	; 248
      009765 F8                    1506 	.db #0xf8	; 248
      009766 F8                    1507 	.db #0xf8	; 248
      009767 F8                    1508 	.db #0xf8	; 248
      009768 F0                    1509 	.db #0xf0	; 240
      009769 E0                    1510 	.db #0xe0	; 224
      00976A C0                    1511 	.db #0xc0	; 192
      00976B 80                    1512 	.db #0x80	; 128
      00976C 00                    1513 	.db #0x00	; 0
      00976D 00                    1514 	.db #0x00	; 0
      00976E 00                    1515 	.db #0x00	; 0
      00976F 00                    1516 	.db #0x00	; 0
      009770 00                    1517 	.db #0x00	; 0
      009771 02                    1518 	.db #0x02	; 2
      009772 06                    1519 	.db #0x06	; 6
      009773 0E                    1520 	.db #0x0e	; 14
      009774 1E                    1521 	.db #0x1e	; 30
      009775 3E                    1522 	.db #0x3e	; 62
      009776 3E                    1523 	.db #0x3e	; 62
      009777 3E                    1524 	.db #0x3e	; 62
      009778 3E                    1525 	.db #0x3e	; 62
      009779 3E                    1526 	.db #0x3e	; 62
      00977A 3E                    1527 	.db #0x3e	; 62
      00977B 3E                    1528 	.db #0x3e	; 62
      00977C 1E                    1529 	.db #0x1e	; 30
      00977D CE                    1530 	.db #0xce	; 206
      00977E E6                    1531 	.db #0xe6	; 230
      00977F F2                    1532 	.db #0xf2	; 242
      009780 F8                    1533 	.db #0xf8	; 248
      009781 FC                    1534 	.db #0xfc	; 252
      009782 00                    1535 	.db #0x00	; 0
      009783 00                    1536 	.db #0x00	; 0
      009784 00                    1537 	.db #0x00	; 0
      009785 80                    1538 	.db #0x80	; 128
      009786 C0                    1539 	.db #0xc0	; 192
      009787 C0                    1540 	.db #0xc0	; 192
      009788 C0                    1541 	.db #0xc0	; 192
      009789 C0                    1542 	.db #0xc0	; 192
      00978A C0                    1543 	.db #0xc0	; 192
      00978B C0                    1544 	.db #0xc0	; 192
      00978C C0                    1545 	.db #0xc0	; 192
      00978D C0                    1546 	.db #0xc0	; 192
      00978E C0                    1547 	.db #0xc0	; 192
      00978F C0                    1548 	.db #0xc0	; 192
      009790 C0                    1549 	.db #0xc0	; 192
      009791 C7                    1550 	.db #0xc7	; 199
      009792 CF                    1551 	.db #0xcf	; 207
      009793 9F                    1552 	.db #0x9f	; 159
      009794 3F                    1553 	.db #0x3f	; 63
      009795 7F                    1554 	.db #0x7f	; 127
      009796 00                    1555 	.db #0x00	; 0
      009797 00                    1556 	.db #0x00	; 0
      009798 01                    1557 	.db #0x01	; 1
      009799 03                    1558 	.db #0x03	; 3
      00979A 07                    1559 	.db #0x07	; 7
      00979B 07                    1560 	.db #0x07	; 7
      00979C 07                    1561 	.db #0x07	; 7
      00979D 07                    1562 	.db #0x07	; 7
      00979E 07                    1563 	.db #0x07	; 7
      00979F 07                    1564 	.db #0x07	; 7
      0097A0 07                    1565 	.db #0x07	; 7
      0097A1 07                    1566 	.db #0x07	; 7
      0097A2 07                    1567 	.db #0x07	; 7
      0097A3 07                    1568 	.db #0x07	; 7
      0097A4 07                    1569 	.db #0x07	; 7
      0097A5 C7                    1570 	.db #0xc7	; 199
      0097A6 E7                    1571 	.db #0xe7	; 231
      0097A7 F3                    1572 	.db #0xf3	; 243
      0097A8 F9                    1573 	.db #0xf9	; 249
      0097A9 FC                    1574 	.db #0xfc	; 252
      0097AA 00                    1575 	.db #0x00	; 0
      0097AB 00                    1576 	.db #0x00	; 0
      0097AC 00                    1577 	.db #0x00	; 0
      0097AD 80                    1578 	.db #0x80	; 128
      0097AE C0                    1579 	.db #0xc0	; 192
      0097AF E0                    1580 	.db #0xe0	; 224
      0097B0 F0                    1581 	.db #0xf0	; 240
      0097B1 F0                    1582 	.db #0xf0	; 240
      0097B2 F8                    1583 	.db #0xf8	; 248
      0097B3 F8                    1584 	.db #0xf8	; 248
      0097B4 F8                    1585 	.db #0xf8	; 248
      0097B5 F8                    1586 	.db #0xf8	; 248
      0097B6 F8                    1587 	.db #0xf8	; 248
      0097B7 F8                    1588 	.db #0xf8	; 248
      0097B8 F0                    1589 	.db #0xf0	; 240
      0097B9 E7                    1590 	.db #0xe7	; 231
      0097BA CF                    1591 	.db #0xcf	; 207
      0097BB 9F                    1592 	.db #0x9f	; 159
      0097BC 3F                    1593 	.db #0x3f	; 63
      0097BD 7F                    1594 	.db #0x7f	; 127
      0097BE 00                    1595 	.db #0x00	; 0
      0097BF FC                    1596 	.db #0xfc	; 252
      0097C0 F8                    1597 	.db #0xf8	; 248
      0097C1 F0                    1598 	.db #0xf0	; 240
      0097C2 E0                    1599 	.db #0xe0	; 224
      0097C3 C0                    1600 	.db #0xc0	; 192
      0097C4 00                    1601 	.db #0x00	; 0
      0097C5 00                    1602 	.db #0x00	; 0
      0097C6 00                    1603 	.db #0x00	; 0
      0097C7 00                    1604 	.db #0x00	; 0
      0097C8 00                    1605 	.db #0x00	; 0
      0097C9 00                    1606 	.db #0x00	; 0
      0097CA 00                    1607 	.db #0x00	; 0
      0097CB 00                    1608 	.db #0x00	; 0
      0097CC 00                    1609 	.db #0x00	; 0
      0097CD C0                    1610 	.db #0xc0	; 192
      0097CE E0                    1611 	.db #0xe0	; 224
      0097CF F0                    1612 	.db #0xf0	; 240
      0097D0 F8                    1613 	.db #0xf8	; 248
      0097D1 FC                    1614 	.db #0xfc	; 252
      0097D2 00                    1615 	.db #0x00	; 0
      0097D3 7F                    1616 	.db #0x7f	; 127
      0097D4 3F                    1617 	.db #0x3f	; 63
      0097D5 9F                    1618 	.db #0x9f	; 159
      0097D6 CF                    1619 	.db #0xcf	; 207
      0097D7 C7                    1620 	.db #0xc7	; 199
      0097D8 C0                    1621 	.db #0xc0	; 192
      0097D9 C0                    1622 	.db #0xc0	; 192
      0097DA C0                    1623 	.db #0xc0	; 192
      0097DB C0                    1624 	.db #0xc0	; 192
      0097DC C0                    1625 	.db #0xc0	; 192
      0097DD C0                    1626 	.db #0xc0	; 192
      0097DE C0                    1627 	.db #0xc0	; 192
      0097DF C0                    1628 	.db #0xc0	; 192
      0097E0 C0                    1629 	.db #0xc0	; 192
      0097E1 C7                    1630 	.db #0xc7	; 199
      0097E2 CF                    1631 	.db #0xcf	; 207
      0097E3 9F                    1632 	.db #0x9f	; 159
      0097E4 3F                    1633 	.db #0x3f	; 63
      0097E5 7F                    1634 	.db #0x7f	; 127
      0097E6 00                    1635 	.db #0x00	; 0
      0097E7 00                    1636 	.db #0x00	; 0
      0097E8 01                    1637 	.db #0x01	; 1
      0097E9 03                    1638 	.db #0x03	; 3
      0097EA 07                    1639 	.db #0x07	; 7
      0097EB 07                    1640 	.db #0x07	; 7
      0097EC 07                    1641 	.db #0x07	; 7
      0097ED 07                    1642 	.db #0x07	; 7
      0097EE 07                    1643 	.db #0x07	; 7
      0097EF 07                    1644 	.db #0x07	; 7
      0097F0 07                    1645 	.db #0x07	; 7
      0097F1 07                    1646 	.db #0x07	; 7
      0097F2 07                    1647 	.db #0x07	; 7
      0097F3 07                    1648 	.db #0x07	; 7
      0097F4 07                    1649 	.db #0x07	; 7
      0097F5 C7                    1650 	.db #0xc7	; 199
      0097F6 E7                    1651 	.db #0xe7	; 231
      0097F7 F3                    1652 	.db #0xf3	; 243
      0097F8 F9                    1653 	.db #0xf9	; 249
      0097F9 FC                    1654 	.db #0xfc	; 252
      0097FA 00                    1655 	.db #0x00	; 0
      0097FB 00                    1656 	.db #0x00	; 0
      0097FC 00                    1657 	.db #0x00	; 0
      0097FD 00                    1658 	.db #0x00	; 0
      0097FE 00                    1659 	.db #0x00	; 0
      0097FF 00                    1660 	.db #0x00	; 0
      009800 00                    1661 	.db #0x00	; 0
      009801 00                    1662 	.db #0x00	; 0
      009802 00                    1663 	.db #0x00	; 0
      009803 00                    1664 	.db #0x00	; 0
      009804 00                    1665 	.db #0x00	; 0
      009805 00                    1666 	.db #0x00	; 0
      009806 00                    1667 	.db #0x00	; 0
      009807 00                    1668 	.db #0x00	; 0
      009808 00                    1669 	.db #0x00	; 0
      009809 07                    1670 	.db #0x07	; 7
      00980A 0F                    1671 	.db #0x0f	; 15
      00980B 1F                    1672 	.db #0x1f	; 31
      00980C 3F                    1673 	.db #0x3f	; 63
      00980D 7F                    1674 	.db #0x7f	; 127
      00980E 00                    1675 	.db #0x00	; 0
      00980F FC                    1676 	.db #0xfc	; 252
      009810 F8                    1677 	.db #0xf8	; 248
      009811 F2                    1678 	.db #0xf2	; 242
      009812 E6                    1679 	.db #0xe6	; 230
      009813 CE                    1680 	.db #0xce	; 206
      009814 1E                    1681 	.db #0x1e	; 30
      009815 3E                    1682 	.db #0x3e	; 62
      009816 3E                    1683 	.db #0x3e	; 62
      009817 3E                    1684 	.db #0x3e	; 62
      009818 3E                    1685 	.db #0x3e	; 62
      009819 3E                    1686 	.db #0x3e	; 62
      00981A 3E                    1687 	.db #0x3e	; 62
      00981B 3E                    1688 	.db #0x3e	; 62
      00981C 1E                    1689 	.db #0x1e	; 30
      00981D 0E                    1690 	.db #0x0e	; 14
      00981E 06                    1691 	.db #0x06	; 6
      00981F 02                    1692 	.db #0x02	; 2
      009820 00                    1693 	.db #0x00	; 0
      009821 00                    1694 	.db #0x00	; 0
      009822 00                    1695 	.db #0x00	; 0
      009823 7F                    1696 	.db #0x7f	; 127
      009824 3F                    1697 	.db #0x3f	; 63
      009825 9F                    1698 	.db #0x9f	; 159
      009826 CF                    1699 	.db #0xcf	; 207
      009827 C7                    1700 	.db #0xc7	; 199
      009828 C0                    1701 	.db #0xc0	; 192
      009829 C0                    1702 	.db #0xc0	; 192
      00982A C0                    1703 	.db #0xc0	; 192
      00982B C0                    1704 	.db #0xc0	; 192
      00982C C0                    1705 	.db #0xc0	; 192
      00982D C0                    1706 	.db #0xc0	; 192
      00982E C0                    1707 	.db #0xc0	; 192
      00982F C0                    1708 	.db #0xc0	; 192
      009830 C0                    1709 	.db #0xc0	; 192
      009831 C0                    1710 	.db #0xc0	; 192
      009832 C0                    1711 	.db #0xc0	; 192
      009833 80                    1712 	.db #0x80	; 128
      009834 00                    1713 	.db #0x00	; 0
      009835 00                    1714 	.db #0x00	; 0
      009836 00                    1715 	.db #0x00	; 0
      009837 00                    1716 	.db #0x00	; 0
      009838 01                    1717 	.db #0x01	; 1
      009839 03                    1718 	.db #0x03	; 3
      00983A 07                    1719 	.db #0x07	; 7
      00983B 07                    1720 	.db #0x07	; 7
      00983C 07                    1721 	.db #0x07	; 7
      00983D 07                    1722 	.db #0x07	; 7
      00983E 07                    1723 	.db #0x07	; 7
      00983F 07                    1724 	.db #0x07	; 7
      009840 07                    1725 	.db #0x07	; 7
      009841 07                    1726 	.db #0x07	; 7
      009842 07                    1727 	.db #0x07	; 7
      009843 07                    1728 	.db #0x07	; 7
      009844 07                    1729 	.db #0x07	; 7
      009845 C7                    1730 	.db #0xc7	; 199
      009846 E7                    1731 	.db #0xe7	; 231
      009847 F3                    1732 	.db #0xf3	; 243
      009848 F9                    1733 	.db #0xf9	; 249
      009849 FC                    1734 	.db #0xfc	; 252
      00984A 00                    1735 	.db #0x00	; 0
      00984B 00                    1736 	.db #0x00	; 0
      00984C 00                    1737 	.db #0x00	; 0
      00984D 80                    1738 	.db #0x80	; 128
      00984E C0                    1739 	.db #0xc0	; 192
      00984F E0                    1740 	.db #0xe0	; 224
      009850 F0                    1741 	.db #0xf0	; 240
      009851 F0                    1742 	.db #0xf0	; 240
      009852 F8                    1743 	.db #0xf8	; 248
      009853 F8                    1744 	.db #0xf8	; 248
      009854 F8                    1745 	.db #0xf8	; 248
      009855 F8                    1746 	.db #0xf8	; 248
      009856 F8                    1747 	.db #0xf8	; 248
      009857 F8                    1748 	.db #0xf8	; 248
      009858 F0                    1749 	.db #0xf0	; 240
      009859 E7                    1750 	.db #0xe7	; 231
      00985A CF                    1751 	.db #0xcf	; 207
      00985B 9F                    1752 	.db #0x9f	; 159
      00985C 3F                    1753 	.db #0x3f	; 63
      00985D 7F                    1754 	.db #0x7f	; 127
      00985E 00                    1755 	.db #0x00	; 0
      00985F FC                    1756 	.db #0xfc	; 252
      009860 F8                    1757 	.db #0xf8	; 248
      009861 F2                    1758 	.db #0xf2	; 242
      009862 E6                    1759 	.db #0xe6	; 230
      009863 CE                    1760 	.db #0xce	; 206
      009864 1E                    1761 	.db #0x1e	; 30
      009865 3E                    1762 	.db #0x3e	; 62
      009866 3E                    1763 	.db #0x3e	; 62
      009867 3E                    1764 	.db #0x3e	; 62
      009868 3E                    1765 	.db #0x3e	; 62
      009869 3E                    1766 	.db #0x3e	; 62
      00986A 3E                    1767 	.db #0x3e	; 62
      00986B 3E                    1768 	.db #0x3e	; 62
      00986C 1E                    1769 	.db #0x1e	; 30
      00986D 0E                    1770 	.db #0x0e	; 14
      00986E 06                    1771 	.db #0x06	; 6
      00986F 02                    1772 	.db #0x02	; 2
      009870 00                    1773 	.db #0x00	; 0
      009871 00                    1774 	.db #0x00	; 0
      009872 00                    1775 	.db #0x00	; 0
      009873 7F                    1776 	.db #0x7f	; 127
      009874 3F                    1777 	.db #0x3f	; 63
      009875 9F                    1778 	.db #0x9f	; 159
      009876 CF                    1779 	.db #0xcf	; 207
      009877 C7                    1780 	.db #0xc7	; 199
      009878 C0                    1781 	.db #0xc0	; 192
      009879 C0                    1782 	.db #0xc0	; 192
      00987A C0                    1783 	.db #0xc0	; 192
      00987B C0                    1784 	.db #0xc0	; 192
      00987C C0                    1785 	.db #0xc0	; 192
      00987D C0                    1786 	.db #0xc0	; 192
      00987E C0                    1787 	.db #0xc0	; 192
      00987F C0                    1788 	.db #0xc0	; 192
      009880 C0                    1789 	.db #0xc0	; 192
      009881 C0                    1790 	.db #0xc0	; 192
      009882 C0                    1791 	.db #0xc0	; 192
      009883 80                    1792 	.db #0x80	; 128
      009884 00                    1793 	.db #0x00	; 0
      009885 00                    1794 	.db #0x00	; 0
      009886 00                    1795 	.db #0x00	; 0
      009887 FC                    1796 	.db #0xfc	; 252
      009888 F9                    1797 	.db #0xf9	; 249
      009889 F3                    1798 	.db #0xf3	; 243
      00988A E7                    1799 	.db #0xe7	; 231
      00988B C7                    1800 	.db #0xc7	; 199
      00988C 07                    1801 	.db #0x07	; 7
      00988D 07                    1802 	.db #0x07	; 7
      00988E 07                    1803 	.db #0x07	; 7
      00988F 07                    1804 	.db #0x07	; 7
      009890 07                    1805 	.db #0x07	; 7
      009891 07                    1806 	.db #0x07	; 7
      009892 07                    1807 	.db #0x07	; 7
      009893 07                    1808 	.db #0x07	; 7
      009894 07                    1809 	.db #0x07	; 7
      009895 C7                    1810 	.db #0xc7	; 199
      009896 E7                    1811 	.db #0xe7	; 231
      009897 F3                    1812 	.db #0xf3	; 243
      009898 F9                    1813 	.db #0xf9	; 249
      009899 FC                    1814 	.db #0xfc	; 252
      00989A 00                    1815 	.db #0x00	; 0
      00989B 7F                    1816 	.db #0x7f	; 127
      00989C 3F                    1817 	.db #0x3f	; 63
      00989D 9F                    1818 	.db #0x9f	; 159
      00989E CF                    1819 	.db #0xcf	; 207
      00989F E7                    1820 	.db #0xe7	; 231
      0098A0 F0                    1821 	.db #0xf0	; 240
      0098A1 F0                    1822 	.db #0xf0	; 240
      0098A2 F8                    1823 	.db #0xf8	; 248
      0098A3 F8                    1824 	.db #0xf8	; 248
      0098A4 F8                    1825 	.db #0xf8	; 248
      0098A5 F8                    1826 	.db #0xf8	; 248
      0098A6 F8                    1827 	.db #0xf8	; 248
      0098A7 F8                    1828 	.db #0xf8	; 248
      0098A8 F0                    1829 	.db #0xf0	; 240
      0098A9 E7                    1830 	.db #0xe7	; 231
      0098AA CF                    1831 	.db #0xcf	; 207
      0098AB 9F                    1832 	.db #0x9f	; 159
      0098AC 3F                    1833 	.db #0x3f	; 63
      0098AD 7F                    1834 	.db #0x7f	; 127
      0098AE 00                    1835 	.db #0x00	; 0
      0098AF 00                    1836 	.db #0x00	; 0
      0098B0 00                    1837 	.db #0x00	; 0
      0098B1 02                    1838 	.db #0x02	; 2
      0098B2 06                    1839 	.db #0x06	; 6
      0098B3 0E                    1840 	.db #0x0e	; 14
      0098B4 1E                    1841 	.db #0x1e	; 30
      0098B5 3E                    1842 	.db #0x3e	; 62
      0098B6 3E                    1843 	.db #0x3e	; 62
      0098B7 3E                    1844 	.db #0x3e	; 62
      0098B8 3E                    1845 	.db #0x3e	; 62
      0098B9 3E                    1846 	.db #0x3e	; 62
      0098BA 3E                    1847 	.db #0x3e	; 62
      0098BB 3E                    1848 	.db #0x3e	; 62
      0098BC 1E                    1849 	.db #0x1e	; 30
      0098BD CE                    1850 	.db #0xce	; 206
      0098BE E6                    1851 	.db #0xe6	; 230
      0098BF F2                    1852 	.db #0xf2	; 242
      0098C0 F8                    1853 	.db #0xf8	; 248
      0098C1 FC                    1854 	.db #0xfc	; 252
      0098C2 00                    1855 	.db #0x00	; 0
      0098C3 00                    1856 	.db #0x00	; 0
      0098C4 00                    1857 	.db #0x00	; 0
      0098C5 00                    1858 	.db #0x00	; 0
      0098C6 00                    1859 	.db #0x00	; 0
      0098C7 00                    1860 	.db #0x00	; 0
      0098C8 00                    1861 	.db #0x00	; 0
      0098C9 00                    1862 	.db #0x00	; 0
      0098CA 00                    1863 	.db #0x00	; 0
      0098CB 00                    1864 	.db #0x00	; 0
      0098CC 00                    1865 	.db #0x00	; 0
      0098CD 00                    1866 	.db #0x00	; 0
      0098CE 00                    1867 	.db #0x00	; 0
      0098CF 00                    1868 	.db #0x00	; 0
      0098D0 00                    1869 	.db #0x00	; 0
      0098D1 0F                    1870 	.db #0x0f	; 15
      0098D2 1F                    1871 	.db #0x1f	; 31
      0098D3 3F                    1872 	.db #0x3f	; 63
      0098D4 7F                    1873 	.db #0x7f	; 127
      0098D5 FF                    1874 	.db #0xff	; 255
      0098D6 00                    1875 	.db #0x00	; 0
      0098D7 00                    1876 	.db #0x00	; 0
      0098D8 00                    1877 	.db #0x00	; 0
      0098D9 00                    1878 	.db #0x00	; 0
      0098DA 00                    1879 	.db #0x00	; 0
      0098DB 00                    1880 	.db #0x00	; 0
      0098DC 00                    1881 	.db #0x00	; 0
      0098DD 00                    1882 	.db #0x00	; 0
      0098DE 00                    1883 	.db #0x00	; 0
      0098DF 00                    1884 	.db #0x00	; 0
      0098E0 00                    1885 	.db #0x00	; 0
      0098E1 00                    1886 	.db #0x00	; 0
      0098E2 00                    1887 	.db #0x00	; 0
      0098E3 00                    1888 	.db #0x00	; 0
      0098E4 00                    1889 	.db #0x00	; 0
      0098E5 E0                    1890 	.db #0xe0	; 224
      0098E6 F0                    1891 	.db #0xf0	; 240
      0098E7 F8                    1892 	.db #0xf8	; 248
      0098E8 FC                    1893 	.db #0xfc	; 252
      0098E9 FE                    1894 	.db #0xfe	; 254
      0098EA 00                    1895 	.db #0x00	; 0
      0098EB 00                    1896 	.db #0x00	; 0
      0098EC 00                    1897 	.db #0x00	; 0
      0098ED 00                    1898 	.db #0x00	; 0
      0098EE 00                    1899 	.db #0x00	; 0
      0098EF 00                    1900 	.db #0x00	; 0
      0098F0 00                    1901 	.db #0x00	; 0
      0098F1 00                    1902 	.db #0x00	; 0
      0098F2 00                    1903 	.db #0x00	; 0
      0098F3 00                    1904 	.db #0x00	; 0
      0098F4 00                    1905 	.db #0x00	; 0
      0098F5 00                    1906 	.db #0x00	; 0
      0098F6 00                    1907 	.db #0x00	; 0
      0098F7 00                    1908 	.db #0x00	; 0
      0098F8 00                    1909 	.db #0x00	; 0
      0098F9 07                    1910 	.db #0x07	; 7
      0098FA 0F                    1911 	.db #0x0f	; 15
      0098FB 1F                    1912 	.db #0x1f	; 31
      0098FC 3F                    1913 	.db #0x3f	; 63
      0098FD 7F                    1914 	.db #0x7f	; 127
      0098FE 00                    1915 	.db #0x00	; 0
      0098FF FC                    1916 	.db #0xfc	; 252
      009900 F8                    1917 	.db #0xf8	; 248
      009901 F2                    1918 	.db #0xf2	; 242
      009902 E6                    1919 	.db #0xe6	; 230
      009903 CE                    1920 	.db #0xce	; 206
      009904 1E                    1921 	.db #0x1e	; 30
      009905 3E                    1922 	.db #0x3e	; 62
      009906 3E                    1923 	.db #0x3e	; 62
      009907 3E                    1924 	.db #0x3e	; 62
      009908 3E                    1925 	.db #0x3e	; 62
      009909 3E                    1926 	.db #0x3e	; 62
      00990A 3E                    1927 	.db #0x3e	; 62
      00990B 3E                    1928 	.db #0x3e	; 62
      00990C 1E                    1929 	.db #0x1e	; 30
      00990D CE                    1930 	.db #0xce	; 206
      00990E E6                    1931 	.db #0xe6	; 230
      00990F F2                    1932 	.db #0xf2	; 242
      009910 F8                    1933 	.db #0xf8	; 248
      009911 FC                    1934 	.db #0xfc	; 252
      009912 00                    1935 	.db #0x00	; 0
      009913 7F                    1936 	.db #0x7f	; 127
      009914 3F                    1937 	.db #0x3f	; 63
      009915 9F                    1938 	.db #0x9f	; 159
      009916 CF                    1939 	.db #0xcf	; 207
      009917 C7                    1940 	.db #0xc7	; 199
      009918 C0                    1941 	.db #0xc0	; 192
      009919 C0                    1942 	.db #0xc0	; 192
      00991A C0                    1943 	.db #0xc0	; 192
      00991B C0                    1944 	.db #0xc0	; 192
      00991C C0                    1945 	.db #0xc0	; 192
      00991D C0                    1946 	.db #0xc0	; 192
      00991E C0                    1947 	.db #0xc0	; 192
      00991F C0                    1948 	.db #0xc0	; 192
      009920 C0                    1949 	.db #0xc0	; 192
      009921 C7                    1950 	.db #0xc7	; 199
      009922 CF                    1951 	.db #0xcf	; 207
      009923 9F                    1952 	.db #0x9f	; 159
      009924 3F                    1953 	.db #0x3f	; 63
      009925 7F                    1954 	.db #0x7f	; 127
      009926 00                    1955 	.db #0x00	; 0
      009927 FC                    1956 	.db #0xfc	; 252
      009928 F9                    1957 	.db #0xf9	; 249
      009929 F3                    1958 	.db #0xf3	; 243
      00992A E7                    1959 	.db #0xe7	; 231
      00992B C7                    1960 	.db #0xc7	; 199
      00992C 07                    1961 	.db #0x07	; 7
      00992D 07                    1962 	.db #0x07	; 7
      00992E 07                    1963 	.db #0x07	; 7
      00992F 07                    1964 	.db #0x07	; 7
      009930 07                    1965 	.db #0x07	; 7
      009931 07                    1966 	.db #0x07	; 7
      009932 07                    1967 	.db #0x07	; 7
      009933 07                    1968 	.db #0x07	; 7
      009934 07                    1969 	.db #0x07	; 7
      009935 C7                    1970 	.db #0xc7	; 199
      009936 E7                    1971 	.db #0xe7	; 231
      009937 F3                    1972 	.db #0xf3	; 243
      009938 F9                    1973 	.db #0xf9	; 249
      009939 FC                    1974 	.db #0xfc	; 252
      00993A 00                    1975 	.db #0x00	; 0
      00993B 7F                    1976 	.db #0x7f	; 127
      00993C 3F                    1977 	.db #0x3f	; 63
      00993D 9F                    1978 	.db #0x9f	; 159
      00993E CF                    1979 	.db #0xcf	; 207
      00993F E7                    1980 	.db #0xe7	; 231
      009940 F0                    1981 	.db #0xf0	; 240
      009941 F0                    1982 	.db #0xf0	; 240
      009942 F8                    1983 	.db #0xf8	; 248
      009943 F8                    1984 	.db #0xf8	; 248
      009944 F8                    1985 	.db #0xf8	; 248
      009945 F8                    1986 	.db #0xf8	; 248
      009946 F8                    1987 	.db #0xf8	; 248
      009947 F8                    1988 	.db #0xf8	; 248
      009948 F0                    1989 	.db #0xf0	; 240
      009949 E7                    1990 	.db #0xe7	; 231
      00994A CF                    1991 	.db #0xcf	; 207
      00994B 9F                    1992 	.db #0x9f	; 159
      00994C 3F                    1993 	.db #0x3f	; 63
      00994D 7F                    1994 	.db #0x7f	; 127
      00994E 00                    1995 	.db #0x00	; 0
      00994F FC                    1996 	.db #0xfc	; 252
      009950 F8                    1997 	.db #0xf8	; 248
      009951 F2                    1998 	.db #0xf2	; 242
      009952 E6                    1999 	.db #0xe6	; 230
      009953 CE                    2000 	.db #0xce	; 206
      009954 1E                    2001 	.db #0x1e	; 30
      009955 3E                    2002 	.db #0x3e	; 62
      009956 3E                    2003 	.db #0x3e	; 62
      009957 3E                    2004 	.db #0x3e	; 62
      009958 3E                    2005 	.db #0x3e	; 62
      009959 3E                    2006 	.db #0x3e	; 62
      00995A 3E                    2007 	.db #0x3e	; 62
      00995B 3E                    2008 	.db #0x3e	; 62
      00995C 1E                    2009 	.db #0x1e	; 30
      00995D CE                    2010 	.db #0xce	; 206
      00995E E6                    2011 	.db #0xe6	; 230
      00995F F2                    2012 	.db #0xf2	; 242
      009960 F8                    2013 	.db #0xf8	; 248
      009961 FC                    2014 	.db #0xfc	; 252
      009962 00                    2015 	.db #0x00	; 0
      009963 7F                    2016 	.db #0x7f	; 127
      009964 3F                    2017 	.db #0x3f	; 63
      009965 9F                    2018 	.db #0x9f	; 159
      009966 CF                    2019 	.db #0xcf	; 207
      009967 C7                    2020 	.db #0xc7	; 199
      009968 C0                    2021 	.db #0xc0	; 192
      009969 C0                    2022 	.db #0xc0	; 192
      00996A C0                    2023 	.db #0xc0	; 192
      00996B C0                    2024 	.db #0xc0	; 192
      00996C C0                    2025 	.db #0xc0	; 192
      00996D C0                    2026 	.db #0xc0	; 192
      00996E C0                    2027 	.db #0xc0	; 192
      00996F C0                    2028 	.db #0xc0	; 192
      009970 C0                    2029 	.db #0xc0	; 192
      009971 C7                    2030 	.db #0xc7	; 199
      009972 CF                    2031 	.db #0xcf	; 207
      009973 9F                    2032 	.db #0x9f	; 159
      009974 3F                    2033 	.db #0x3f	; 63
      009975 7F                    2034 	.db #0x7f	; 127
      009976 00                    2035 	.db #0x00	; 0
      009977 00                    2036 	.db #0x00	; 0
      009978 01                    2037 	.db #0x01	; 1
      009979 03                    2038 	.db #0x03	; 3
      00997A 07                    2039 	.db #0x07	; 7
      00997B 07                    2040 	.db #0x07	; 7
      00997C 07                    2041 	.db #0x07	; 7
      00997D 07                    2042 	.db #0x07	; 7
      00997E 07                    2043 	.db #0x07	; 7
      00997F 07                    2044 	.db #0x07	; 7
      009980 07                    2045 	.db #0x07	; 7
      009981 07                    2046 	.db #0x07	; 7
      009982 07                    2047 	.db #0x07	; 7
      009983 07                    2048 	.db #0x07	; 7
      009984 07                    2049 	.db #0x07	; 7
      009985 C7                    2050 	.db #0xc7	; 199
      009986 E7                    2051 	.db #0xe7	; 231
      009987 F3                    2052 	.db #0xf3	; 243
      009988 F9                    2053 	.db #0xf9	; 249
      009989 FC                    2054 	.db #0xfc	; 252
      00998A 00                    2055 	.db #0x00	; 0
      00998B 00                    2056 	.db #0x00	; 0
      00998C 00                    2057 	.db #0x00	; 0
      00998D 80                    2058 	.db #0x80	; 128
      00998E C0                    2059 	.db #0xc0	; 192
      00998F E0                    2060 	.db #0xe0	; 224
      009990 F0                    2061 	.db #0xf0	; 240
      009991 F0                    2062 	.db #0xf0	; 240
      009992 F8                    2063 	.db #0xf8	; 248
      009993 F8                    2064 	.db #0xf8	; 248
      009994 F8                    2065 	.db #0xf8	; 248
      009995 F8                    2066 	.db #0xf8	; 248
      009996 F8                    2067 	.db #0xf8	; 248
      009997 F8                    2068 	.db #0xf8	; 248
      009998 F0                    2069 	.db #0xf0	; 240
      009999 E7                    2070 	.db #0xe7	; 231
      00999A CF                    2071 	.db #0xcf	; 207
      00999B 9F                    2072 	.db #0x9f	; 159
      00999C 3F                    2073 	.db #0x3f	; 63
      00999D 7F                    2074 	.db #0x7f	; 127
      00999E 00                    2075 	.db #0x00	; 0
      00999F 00                    2076 	.db #0x00	; 0
      0099A0 00                    2077 	.db #0x00	; 0
      0099A1 00                    2078 	.db #0x00	; 0
      0099A2 00                    2079 	.db #0x00	; 0
      0099A3 00                    2080 	.db #0x00	; 0
      0099A4 00                    2081 	.db #0x00	; 0
      0099A5 00                    2082 	.db #0x00	; 0
      0099A6 00                    2083 	.db #0x00	; 0
      0099A7 00                    2084 	.db #0x00	; 0
      0099A8 00                    2085 	.db #0x00	; 0
      0099A9 00                    2086 	.db #0x00	; 0
      0099AA 00                    2087 	.db #0x00	; 0
      0099AB 00                    2088 	.db #0x00	; 0
      0099AC 00                    2089 	.db #0x00	; 0
      0099AD 00                    2090 	.db #0x00	; 0
      0099AE 00                    2091 	.db #0x00	; 0
      0099AF 00                    2092 	.db #0x00	; 0
      0099B0 00                    2093 	.db #0x00	; 0
      0099B1 00                    2094 	.db #0x00	; 0
      0099B2 00                    2095 	.db #0x00	; 0
      0099B3 00                    2096 	.db #0x00	; 0
      0099B4 00                    2097 	.db #0x00	; 0
      0099B5 C0                    2098 	.db #0xc0	; 192
      0099B6 C0                    2099 	.db #0xc0	; 192
      0099B7 C0                    2100 	.db #0xc0	; 192
      0099B8 C0                    2101 	.db #0xc0	; 192
      0099B9 C0                    2102 	.db #0xc0	; 192
      0099BA FE                    2103 	.db #0xfe	; 254
      0099BB FE                    2104 	.db #0xfe	; 254
      0099BC FE                    2105 	.db #0xfe	; 254
      0099BD FE                    2106 	.db #0xfe	; 254
      0099BE FE                    2107 	.db #0xfe	; 254
      0099BF C0                    2108 	.db #0xc0	; 192
      0099C0 C0                    2109 	.db #0xc0	; 192
      0099C1 C0                    2110 	.db #0xc0	; 192
      0099C2 C0                    2111 	.db #0xc0	; 192
      0099C3 C0                    2112 	.db #0xc0	; 192
      0099C4 00                    2113 	.db #0x00	; 0
      0099C5 00                    2114 	.db #0x00	; 0
      0099C6 00                    2115 	.db #0x00	; 0
      0099C7 00                    2116 	.db #0x00	; 0
      0099C8 00                    2117 	.db #0x00	; 0
      0099C9 07                    2118 	.db #0x07	; 7
      0099CA 07                    2119 	.db #0x07	; 7
      0099CB 07                    2120 	.db #0x07	; 7
      0099CC 07                    2121 	.db #0x07	; 7
      0099CD 07                    2122 	.db #0x07	; 7
      0099CE FF                    2123 	.db #0xff	; 255
      0099CF FF                    2124 	.db #0xff	; 255
      0099D0 FF                    2125 	.db #0xff	; 255
      0099D1 FF                    2126 	.db #0xff	; 255
      0099D2 FF                    2127 	.db #0xff	; 255
      0099D3 07                    2128 	.db #0x07	; 7
      0099D4 07                    2129 	.db #0x07	; 7
      0099D5 07                    2130 	.db #0x07	; 7
      0099D6 07                    2131 	.db #0x07	; 7
      0099D7 07                    2132 	.db #0x07	; 7
      0099D8 00                    2133 	.db #0x00	; 0
      0099D9 00                    2134 	.db #0x00	; 0
      0099DA 00                    2135 	.db #0x00	; 0
      0099DB 00                    2136 	.db #0x00	; 0
      0099DC 00                    2137 	.db #0x00	; 0
      0099DD 00                    2138 	.db #0x00	; 0
      0099DE 00                    2139 	.db #0x00	; 0
      0099DF 00                    2140 	.db #0x00	; 0
      0099E0 00                    2141 	.db #0x00	; 0
      0099E1 00                    2142 	.db #0x00	; 0
      0099E2 00                    2143 	.db #0x00	; 0
      0099E3 00                    2144 	.db #0x00	; 0
      0099E4 00                    2145 	.db #0x00	; 0
      0099E5 00                    2146 	.db #0x00	; 0
      0099E6 00                    2147 	.db #0x00	; 0
      0099E7 00                    2148 	.db #0x00	; 0
      0099E8 00                    2149 	.db #0x00	; 0
      0099E9 00                    2150 	.db #0x00	; 0
      0099EA 00                    2151 	.db #0x00	; 0
      0099EB 00                    2152 	.db #0x00	; 0
      0099EC 00                    2153 	.db #0x00	; 0
      0099ED 00                    2154 	.db #0x00	; 0
      0099EE 00                    2155 	.db #0x00	; 0
      0099EF 00                    2156 	.db #0x00	; 0
      0099F0 00                    2157 	.db #0x00	; 0
      0099F1 00                    2158 	.db #0x00	; 0
      0099F2 00                    2159 	.db #0x00	; 0
      0099F3 00                    2160 	.db #0x00	; 0
      0099F4 00                    2161 	.db #0x00	; 0
      0099F5 00                    2162 	.db #0x00	; 0
      0099F6 00                    2163 	.db #0x00	; 0
      0099F7 00                    2164 	.db #0x00	; 0
      0099F8 00                    2165 	.db #0x00	; 0
      0099F9 00                    2166 	.db #0x00	; 0
      0099FA 00                    2167 	.db #0x00	; 0
      0099FB 00                    2168 	.db #0x00	; 0
      0099FC 00                    2169 	.db #0x00	; 0
      0099FD 00                    2170 	.db #0x00	; 0
      0099FE 00                    2171 	.db #0x00	; 0
      0099FF 00                    2172 	.db #0x00	; 0
      009A00 00                    2173 	.db #0x00	; 0
      009A01 00                    2174 	.db #0x00	; 0
      009A02 00                    2175 	.db #0x00	; 0
      009A03 00                    2176 	.db #0x00	; 0
      009A04 00                    2177 	.db #0x00	; 0
      009A05 C0                    2178 	.db #0xc0	; 192
      009A06 C0                    2179 	.db #0xc0	; 192
      009A07 C0                    2180 	.db #0xc0	; 192
      009A08 C0                    2181 	.db #0xc0	; 192
      009A09 C0                    2182 	.db #0xc0	; 192
      009A0A C0                    2183 	.db #0xc0	; 192
      009A0B C0                    2184 	.db #0xc0	; 192
      009A0C C0                    2185 	.db #0xc0	; 192
      009A0D C0                    2186 	.db #0xc0	; 192
      009A0E C0                    2187 	.db #0xc0	; 192
      009A0F C0                    2188 	.db #0xc0	; 192
      009A10 C0                    2189 	.db #0xc0	; 192
      009A11 C0                    2190 	.db #0xc0	; 192
      009A12 C0                    2191 	.db #0xc0	; 192
      009A13 C0                    2192 	.db #0xc0	; 192
      009A14 00                    2193 	.db #0x00	; 0
      009A15 00                    2194 	.db #0x00	; 0
      009A16 00                    2195 	.db #0x00	; 0
      009A17 00                    2196 	.db #0x00	; 0
      009A18 00                    2197 	.db #0x00	; 0
      009A19 07                    2198 	.db #0x07	; 7
      009A1A 07                    2199 	.db #0x07	; 7
      009A1B 07                    2200 	.db #0x07	; 7
      009A1C 07                    2201 	.db #0x07	; 7
      009A1D 07                    2202 	.db #0x07	; 7
      009A1E 07                    2203 	.db #0x07	; 7
      009A1F 07                    2204 	.db #0x07	; 7
      009A20 07                    2205 	.db #0x07	; 7
      009A21 07                    2206 	.db #0x07	; 7
      009A22 07                    2207 	.db #0x07	; 7
      009A23 07                    2208 	.db #0x07	; 7
      009A24 07                    2209 	.db #0x07	; 7
      009A25 07                    2210 	.db #0x07	; 7
      009A26 07                    2211 	.db #0x07	; 7
      009A27 07                    2212 	.db #0x07	; 7
      009A28 00                    2213 	.db #0x00	; 0
      009A29 00                    2214 	.db #0x00	; 0
      009A2A 00                    2215 	.db #0x00	; 0
      009A2B 00                    2216 	.db #0x00	; 0
      009A2C 00                    2217 	.db #0x00	; 0
      009A2D 00                    2218 	.db #0x00	; 0
      009A2E 00                    2219 	.db #0x00	; 0
      009A2F 00                    2220 	.db #0x00	; 0
      009A30 00                    2221 	.db #0x00	; 0
      009A31 00                    2222 	.db #0x00	; 0
      009A32 00                    2223 	.db #0x00	; 0
      009A33 00                    2224 	.db #0x00	; 0
      009A34 00                    2225 	.db #0x00	; 0
      009A35 00                    2226 	.db #0x00	; 0
      009A36 00                    2227 	.db #0x00	; 0
      009A37 00                    2228 	.db #0x00	; 0
      009A38 00                    2229 	.db #0x00	; 0
      009A39 00                    2230 	.db #0x00	; 0
      009A3A 00                    2231 	.db #0x00	; 0
      009A3B 00                    2232 	.db #0x00	; 0
      009A3C 00                    2233 	.db #0x00	; 0
      009A3D 00                    2234 	.db #0x00	; 0
      009A3E 00                    2235 	.db #0x00	; 0
      009A3F 00                    2236 	.db #0x00	; 0
      009A40 00                    2237 	.db #0x00	; 0
      009A41 00                    2238 	.db #0x00	; 0
      009A42 00                    2239 	.db #0x00	; 0
      009A43 00                    2240 	.db #0x00	; 0
      009A44 00                    2241 	.db #0x00	; 0
      009A45 00                    2242 	.db #0x00	; 0
      009A46 00                    2243 	.db #0x00	; 0
      009A47 00                    2244 	.db #0x00	; 0
      009A48 00                    2245 	.db #0x00	; 0
      009A49 00                    2246 	.db #0x00	; 0
      009A4A 00                    2247 	.db #0x00	; 0
      009A4B 00                    2248 	.db #0x00	; 0
      009A4C 00                    2249 	.db #0x00	; 0
      009A4D 00                    2250 	.db #0x00	; 0
      009A4E 00                    2251 	.db #0x00	; 0
      009A4F 00                    2252 	.db #0x00	; 0
      009A50 00                    2253 	.db #0x00	; 0
      009A51 00                    2254 	.db #0x00	; 0
      009A52 00                    2255 	.db #0x00	; 0
      009A53 00                    2256 	.db #0x00	; 0
      009A54 00                    2257 	.db #0x00	; 0
      009A55 00                    2258 	.db #0x00	; 0
      009A56 00                    2259 	.db #0x00	; 0
      009A57 00                    2260 	.db #0x00	; 0
      009A58 00                    2261 	.db #0x00	; 0
      009A59 00                    2262 	.db #0x00	; 0
      009A5A 00                    2263 	.db #0x00	; 0
      009A5B 00                    2264 	.db #0x00	; 0
      009A5C 00                    2265 	.db #0x00	; 0
      009A5D 00                    2266 	.db #0x00	; 0
      009A5E 00                    2267 	.db #0x00	; 0
      009A5F 00                    2268 	.db #0x00	; 0
      009A60 00                    2269 	.db #0x00	; 0
      009A61 00                    2270 	.db #0x00	; 0
      009A62 00                    2271 	.db #0x00	; 0
      009A63 00                    2272 	.db #0x00	; 0
      009A64 00                    2273 	.db #0x00	; 0
      009A65 00                    2274 	.db #0x00	; 0
      009A66 00                    2275 	.db #0x00	; 0
      009A67 00                    2276 	.db #0x00	; 0
      009A68 00                    2277 	.db #0x00	; 0
      009A69 00                    2278 	.db #0x00	; 0
      009A6A 00                    2279 	.db #0x00	; 0
      009A6B 00                    2280 	.db #0x00	; 0
      009A6C 00                    2281 	.db #0x00	; 0
      009A6D 00                    2282 	.db #0x00	; 0
      009A6E 00                    2283 	.db #0x00	; 0
      009A6F 00                    2284 	.db #0x00	; 0
      009A70 00                    2285 	.db #0x00	; 0
      009A71 00                    2286 	.db #0x00	; 0
      009A72 00                    2287 	.db #0x00	; 0
      009A73 00                    2288 	.db #0x00	; 0
      009A74 00                    2289 	.db #0x00	; 0
      009A75 00                    2290 	.db #0x00	; 0
      009A76 00                    2291 	.db #0x00	; 0
      009A77 00                    2292 	.db #0x00	; 0
      009A78 00                    2293 	.db #0x00	; 0
      009A79 00                    2294 	.db #0x00	; 0
      009A7A 00                    2295 	.db #0x00	; 0
      009A7B 00                    2296 	.db #0x00	; 0
      009A7C 00                    2297 	.db #0x00	; 0
      009A7D 00                    2298 	.db #0x00	; 0
      009A7E 00                    2299 	.db #0x00	; 0
      009A7F 3E                    2300 	.db #0x3e	; 62
      009A80 3E                    2301 	.db #0x3e	; 62
      009A81 3E                    2302 	.db #0x3e	; 62
      009A82 3E                    2303 	.db #0x3e	; 62
      009A83 3E                    2304 	.db #0x3e	; 62
      009A84 00                    2305 	.db #0x00	; 0
      009A85 00                    2306 	.db #0x00	; 0
      009A86 00                    2307 	.db #0x00	; 0
      009A87 00                    2308 	.db #0x00	; 0
      009A88 00                    2309 	.db #0x00	; 0
      009A89 00                    2310 	.db #0x00	; 0
      009A8A 00                    2311 	.db #0x00	; 0
      009A8B 00                    2312 	.db #0x00	; 0
      009A8C 00                    2313 	.db #0x00	; 0
      009A8D 00                    2314 	.db #0x00	; 0
      009A8E                       2315 ___str_0:
      009A8E 48 65 6C 6C 6F 20 57  2316 	.ascii "Hello World!"
             6F 72 6C 64 21
      009A9A 00                    2317 	.db 0x00
      009A9B                       2318 ___str_1:
      009A9B 48 65 6C 6C 6F 21     2319 	.ascii "Hello!"
      009AA1 00                    2320 	.db 0x00
                                   2321 	.area INITIALIZER
                                   2322 	.area CABS (ABS)
