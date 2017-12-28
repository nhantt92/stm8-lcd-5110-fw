                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
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
      009553                         68 _CLK_DeInit:
                                     69 ;	lib/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      009553 35 01 50 C0      [ 1]   70 	mov	0x50c0+0, #0x01
                                     71 ;	lib/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      009557 35 00 50 C1      [ 1]   72 	mov	0x50c1+0, #0x00
                                     73 ;	lib/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      00955B 35 E1 50 C4      [ 1]   74 	mov	0x50c4+0, #0xe1
                                     75 ;	lib/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      00955F 35 00 50 C5      [ 1]   76 	mov	0x50c5+0, #0x00
                                     77 ;	lib/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      009563 35 18 50 C6      [ 1]   78 	mov	0x50c6+0, #0x18
                                     79 ;	lib/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      009567 35 FF 50 C7      [ 1]   80 	mov	0x50c7+0, #0xff
                                     81 ;	lib/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      00956B 35 FF 50 CA      [ 1]   82 	mov	0x50ca+0, #0xff
                                     83 ;	lib/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      00956F 35 00 50 C8      [ 1]   84 	mov	0x50c8+0, #0x00
                                     85 ;	lib/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      009573 35 00 50 C9      [ 1]   86 	mov	0x50c9+0, #0x00
                                     87 ;	lib/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      009577                         88 00101$:
      009577 AE 50 C9         [ 2]   89 	ldw	x, #0x50c9
      00957A F6               [ 1]   90 	ld	a, (x)
      00957B 44               [ 1]   91 	srl	a
      00957C 25 F9            [ 1]   92 	jrc	00101$
                                     93 ;	lib/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      00957E 35 00 50 C9      [ 1]   94 	mov	0x50c9+0, #0x00
                                     95 ;	lib/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      009582 35 00 50 CC      [ 1]   96 	mov	0x50cc+0, #0x00
                                     97 ;	lib/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      009586 35 00 50 CD      [ 1]   98 	mov	0x50cd+0, #0x00
      00958A 81               [ 4]   99 	ret
                                    100 ;	lib/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function CLK_FastHaltWakeUpCmd
                                    103 ;	-----------------------------------------
      00958B                        104 _CLK_FastHaltWakeUpCmd:
                                    105 ;	lib/stm8s_clk.c: 102: if (NewState != DISABLE)
      00958B 0D 03            [ 1]  106 	tnz	(0x03, sp)
      00958D 27 08            [ 1]  107 	jreq	00102$
                                    108 ;	lib/stm8s_clk.c: 105: CLK->ICKR |= CLK_ICKR_FHWU;
      00958F AE 50 C0         [ 2]  109 	ldw	x, #0x50c0
      009592 F6               [ 1]  110 	ld	a, (x)
      009593 AA 04            [ 1]  111 	or	a, #0x04
      009595 F7               [ 1]  112 	ld	(x), a
      009596 81               [ 4]  113 	ret
      009597                        114 00102$:
                                    115 ;	lib/stm8s_clk.c: 110: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      009597 AE 50 C0         [ 2]  116 	ldw	x, #0x50c0
      00959A F6               [ 1]  117 	ld	a, (x)
      00959B A4 FB            [ 1]  118 	and	a, #0xfb
      00959D F7               [ 1]  119 	ld	(x), a
      00959E 81               [ 4]  120 	ret
                                    121 ;	lib/stm8s_clk.c: 119: void CLK_HSECmd(FunctionalState NewState)
                                    122 ;	-----------------------------------------
                                    123 ;	 function CLK_HSECmd
                                    124 ;	-----------------------------------------
      00959F                        125 _CLK_HSECmd:
                                    126 ;	lib/stm8s_clk.c: 122: if (NewState != DISABLE)
      00959F 0D 03            [ 1]  127 	tnz	(0x03, sp)
      0095A1 27 05            [ 1]  128 	jreq	00102$
                                    129 ;	lib/stm8s_clk.c: 125: CLK->ECKR |= CLK_ECKR_HSEEN;
      0095A3 72 10 50 C1      [ 1]  130 	bset	0x50c1, #0
      0095A7 81               [ 4]  131 	ret
      0095A8                        132 00102$:
                                    133 ;	lib/stm8s_clk.c: 130: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      0095A8 72 11 50 C1      [ 1]  134 	bres	0x50c1, #0
      0095AC 81               [ 4]  135 	ret
                                    136 ;	lib/stm8s_clk.c: 139: void CLK_HSICmd(FunctionalState NewState)
                                    137 ;	-----------------------------------------
                                    138 ;	 function CLK_HSICmd
                                    139 ;	-----------------------------------------
      0095AD                        140 _CLK_HSICmd:
                                    141 ;	lib/stm8s_clk.c: 142: if (NewState != DISABLE)
      0095AD 0D 03            [ 1]  142 	tnz	(0x03, sp)
      0095AF 27 05            [ 1]  143 	jreq	00102$
                                    144 ;	lib/stm8s_clk.c: 145: CLK->ICKR |= CLK_ICKR_HSIEN;
      0095B1 72 10 50 C0      [ 1]  145 	bset	0x50c0, #0
      0095B5 81               [ 4]  146 	ret
      0095B6                        147 00102$:
                                    148 ;	lib/stm8s_clk.c: 150: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      0095B6 72 11 50 C0      [ 1]  149 	bres	0x50c0, #0
      0095BA 81               [ 4]  150 	ret
                                    151 ;	lib/stm8s_clk.c: 160: void CLK_LSICmd(FunctionalState NewState)
                                    152 ;	-----------------------------------------
                                    153 ;	 function CLK_LSICmd
                                    154 ;	-----------------------------------------
      0095BB                        155 _CLK_LSICmd:
                                    156 ;	lib/stm8s_clk.c: 163: if (NewState != DISABLE)
      0095BB 0D 03            [ 1]  157 	tnz	(0x03, sp)
      0095BD 27 08            [ 1]  158 	jreq	00102$
                                    159 ;	lib/stm8s_clk.c: 166: CLK->ICKR |= CLK_ICKR_LSIEN;
      0095BF AE 50 C0         [ 2]  160 	ldw	x, #0x50c0
      0095C2 F6               [ 1]  161 	ld	a, (x)
      0095C3 AA 08            [ 1]  162 	or	a, #0x08
      0095C5 F7               [ 1]  163 	ld	(x), a
      0095C6 81               [ 4]  164 	ret
      0095C7                        165 00102$:
                                    166 ;	lib/stm8s_clk.c: 171: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      0095C7 AE 50 C0         [ 2]  167 	ldw	x, #0x50c0
      0095CA F6               [ 1]  168 	ld	a, (x)
      0095CB A4 F7            [ 1]  169 	and	a, #0xf7
      0095CD F7               [ 1]  170 	ld	(x), a
      0095CE 81               [ 4]  171 	ret
                                    172 ;	lib/stm8s_clk.c: 181: void CLK_CCOCmd(FunctionalState NewState)
                                    173 ;	-----------------------------------------
                                    174 ;	 function CLK_CCOCmd
                                    175 ;	-----------------------------------------
      0095CF                        176 _CLK_CCOCmd:
                                    177 ;	lib/stm8s_clk.c: 184: if (NewState != DISABLE)
      0095CF 0D 03            [ 1]  178 	tnz	(0x03, sp)
      0095D1 27 05            [ 1]  179 	jreq	00102$
                                    180 ;	lib/stm8s_clk.c: 187: CLK->CCOR |= CLK_CCOR_CCOEN;
      0095D3 72 10 50 C9      [ 1]  181 	bset	0x50c9, #0
      0095D7 81               [ 4]  182 	ret
      0095D8                        183 00102$:
                                    184 ;	lib/stm8s_clk.c: 192: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      0095D8 72 11 50 C9      [ 1]  185 	bres	0x50c9, #0
      0095DC 81               [ 4]  186 	ret
                                    187 ;	lib/stm8s_clk.c: 203: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    188 ;	-----------------------------------------
                                    189 ;	 function CLK_ClockSwitchCmd
                                    190 ;	-----------------------------------------
      0095DD                        191 _CLK_ClockSwitchCmd:
                                    192 ;	lib/stm8s_clk.c: 206: if (NewState != DISABLE )
      0095DD 0D 03            [ 1]  193 	tnz	(0x03, sp)
      0095DF 27 08            [ 1]  194 	jreq	00102$
                                    195 ;	lib/stm8s_clk.c: 209: CLK->SWCR |= CLK_SWCR_SWEN;
      0095E1 AE 50 C5         [ 2]  196 	ldw	x, #0x50c5
      0095E4 F6               [ 1]  197 	ld	a, (x)
      0095E5 AA 02            [ 1]  198 	or	a, #0x02
      0095E7 F7               [ 1]  199 	ld	(x), a
      0095E8 81               [ 4]  200 	ret
      0095E9                        201 00102$:
                                    202 ;	lib/stm8s_clk.c: 214: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      0095E9 AE 50 C5         [ 2]  203 	ldw	x, #0x50c5
      0095EC F6               [ 1]  204 	ld	a, (x)
      0095ED A4 FD            [ 1]  205 	and	a, #0xfd
      0095EF F7               [ 1]  206 	ld	(x), a
      0095F0 81               [ 4]  207 	ret
                                    208 ;	lib/stm8s_clk.c: 226: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    209 ;	-----------------------------------------
                                    210 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    211 ;	-----------------------------------------
      0095F1                        212 _CLK_SlowActiveHaltWakeUpCmd:
                                    213 ;	lib/stm8s_clk.c: 229: if (NewState != DISABLE)
      0095F1 0D 03            [ 1]  214 	tnz	(0x03, sp)
      0095F3 27 08            [ 1]  215 	jreq	00102$
                                    216 ;	lib/stm8s_clk.c: 232: CLK->ICKR |= CLK_ICKR_SWUAH;
      0095F5 AE 50 C0         [ 2]  217 	ldw	x, #0x50c0
      0095F8 F6               [ 1]  218 	ld	a, (x)
      0095F9 AA 20            [ 1]  219 	or	a, #0x20
      0095FB F7               [ 1]  220 	ld	(x), a
      0095FC 81               [ 4]  221 	ret
      0095FD                        222 00102$:
                                    223 ;	lib/stm8s_clk.c: 237: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      0095FD AE 50 C0         [ 2]  224 	ldw	x, #0x50c0
      009600 F6               [ 1]  225 	ld	a, (x)
      009601 A4 DF            [ 1]  226 	and	a, #0xdf
      009603 F7               [ 1]  227 	ld	(x), a
      009604 81               [ 4]  228 	ret
                                    229 ;	lib/stm8s_clk.c: 249: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    230 ;	-----------------------------------------
                                    231 ;	 function CLK_PeripheralClockConfig
                                    232 ;	-----------------------------------------
      009605                        233 _CLK_PeripheralClockConfig:
      009605 89               [ 2]  234 	pushw	x
                                    235 ;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009606 7B 05            [ 1]  236 	ld	a, (0x05, sp)
      009608 A4 0F            [ 1]  237 	and	a, #0x0f
      00960A 88               [ 1]  238 	push	a
      00960B A6 01            [ 1]  239 	ld	a, #0x01
      00960D 6B 03            [ 1]  240 	ld	(0x03, sp), a
      00960F 84               [ 1]  241 	pop	a
      009610 4D               [ 1]  242 	tnz	a
      009611 27 05            [ 1]  243 	jreq	00125$
      009613                        244 00124$:
      009613 08 02            [ 1]  245 	sll	(0x02, sp)
      009615 4A               [ 1]  246 	dec	a
      009616 26 FB            [ 1]  247 	jrne	00124$
      009618                        248 00125$:
                                    249 ;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      009618 7B 02            [ 1]  250 	ld	a, (0x02, sp)
      00961A 43               [ 1]  251 	cpl	a
      00961B 6B 01            [ 1]  252 	ld	(0x01, sp), a
                                    253 ;	lib/stm8s_clk.c: 252: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      00961D 7B 05            [ 1]  254 	ld	a, (0x05, sp)
      00961F A5 10            [ 1]  255 	bcp	a, #0x10
      009621 26 1C            [ 1]  256 	jrne	00108$
                                    257 ;	lib/stm8s_clk.c: 254: if (NewState != DISABLE)
      009623 0D 06            [ 1]  258 	tnz	(0x06, sp)
      009625 27 0C            [ 1]  259 	jreq	00102$
                                    260 ;	lib/stm8s_clk.c: 257: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009627 AE 50 C7         [ 2]  261 	ldw	x, #0x50c7
      00962A F6               [ 1]  262 	ld	a, (x)
      00962B 1A 02            [ 1]  263 	or	a, (0x02, sp)
      00962D AE 50 C7         [ 2]  264 	ldw	x, #0x50c7
      009630 F7               [ 1]  265 	ld	(x), a
      009631 20 26            [ 2]  266 	jra	00110$
      009633                        267 00102$:
                                    268 ;	lib/stm8s_clk.c: 262: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      009633 AE 50 C7         [ 2]  269 	ldw	x, #0x50c7
      009636 F6               [ 1]  270 	ld	a, (x)
      009637 14 01            [ 1]  271 	and	a, (0x01, sp)
      009639 AE 50 C7         [ 2]  272 	ldw	x, #0x50c7
      00963C F7               [ 1]  273 	ld	(x), a
      00963D 20 1A            [ 2]  274 	jra	00110$
      00963F                        275 00108$:
                                    276 ;	lib/stm8s_clk.c: 267: if (NewState != DISABLE)
      00963F 0D 06            [ 1]  277 	tnz	(0x06, sp)
      009641 27 0C            [ 1]  278 	jreq	00105$
                                    279 ;	lib/stm8s_clk.c: 270: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      009643 AE 50 CA         [ 2]  280 	ldw	x, #0x50ca
      009646 F6               [ 1]  281 	ld	a, (x)
      009647 1A 02            [ 1]  282 	or	a, (0x02, sp)
      009649 AE 50 CA         [ 2]  283 	ldw	x, #0x50ca
      00964C F7               [ 1]  284 	ld	(x), a
      00964D 20 0A            [ 2]  285 	jra	00110$
      00964F                        286 00105$:
                                    287 ;	lib/stm8s_clk.c: 275: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      00964F AE 50 CA         [ 2]  288 	ldw	x, #0x50ca
      009652 F6               [ 1]  289 	ld	a, (x)
      009653 14 01            [ 1]  290 	and	a, (0x01, sp)
      009655 AE 50 CA         [ 2]  291 	ldw	x, #0x50ca
      009658 F7               [ 1]  292 	ld	(x), a
      009659                        293 00110$:
      009659 85               [ 2]  294 	popw	x
      00965A 81               [ 4]  295 	ret
                                    296 ;	lib/stm8s_clk.c: 292: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    297 ;	-----------------------------------------
                                    298 ;	 function CLK_ClockSwitchConfig
                                    299 ;	-----------------------------------------
      00965B                        300 _CLK_ClockSwitchConfig:
      00965B 89               [ 2]  301 	pushw	x
                                    302 ;	lib/stm8s_clk.c: 299: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      00965C AE 50 C3         [ 2]  303 	ldw	x, #0x50c3
      00965F F6               [ 1]  304 	ld	a, (x)
      009660 6B 02            [ 1]  305 	ld	(0x02, sp), a
                                    306 ;	lib/stm8s_clk.c: 302: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      009662 7B 05            [ 1]  307 	ld	a, (0x05, sp)
      009664 A1 01            [ 1]  308 	cp	a, #0x01
      009666 26 40            [ 1]  309 	jrne	00122$
                                    310 ;	lib/stm8s_clk.c: 305: CLK->SWCR |= CLK_SWCR_SWEN;
      009668 AE 50 C5         [ 2]  311 	ldw	x, #0x50c5
      00966B F6               [ 1]  312 	ld	a, (x)
      00966C AA 02            [ 1]  313 	or	a, #0x02
      00966E F7               [ 1]  314 	ld	(x), a
                                    315 ;	lib/stm8s_clk.c: 308: if (ITState != DISABLE)
      00966F 0D 07            [ 1]  316 	tnz	(0x07, sp)
      009671 27 09            [ 1]  317 	jreq	00102$
                                    318 ;	lib/stm8s_clk.c: 310: CLK->SWCR |= CLK_SWCR_SWIEN;
      009673 AE 50 C5         [ 2]  319 	ldw	x, #0x50c5
      009676 F6               [ 1]  320 	ld	a, (x)
      009677 AA 04            [ 1]  321 	or	a, #0x04
      009679 F7               [ 1]  322 	ld	(x), a
      00967A 20 07            [ 2]  323 	jra	00103$
      00967C                        324 00102$:
                                    325 ;	lib/stm8s_clk.c: 314: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      00967C AE 50 C5         [ 2]  326 	ldw	x, #0x50c5
      00967F F6               [ 1]  327 	ld	a, (x)
      009680 A4 FB            [ 1]  328 	and	a, #0xfb
      009682 F7               [ 1]  329 	ld	(x), a
      009683                        330 00103$:
                                    331 ;	lib/stm8s_clk.c: 318: CLK->SWR = (uint8_t)CLK_NewClock;
      009683 AE 50 C4         [ 2]  332 	ldw	x, #0x50c4
      009686 7B 06            [ 1]  333 	ld	a, (0x06, sp)
      009688 F7               [ 1]  334 	ld	(x), a
                                    335 ;	lib/stm8s_clk.c: 321: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      009689 AE FF FF         [ 2]  336 	ldw	x, #0xffff
      00968C                        337 00105$:
      00968C 90 AE 50 C5      [ 2]  338 	ldw	y, #0x50c5
      009690 90 F6            [ 1]  339 	ld	a, (y)
      009692 44               [ 1]  340 	srl	a
      009693 24 06            [ 1]  341 	jrnc	00107$
      009695 5D               [ 2]  342 	tnzw	x
      009696 27 03            [ 1]  343 	jreq	00107$
                                    344 ;	lib/stm8s_clk.c: 323: DownCounter--;
      009698 5A               [ 2]  345 	decw	x
      009699 20 F1            [ 2]  346 	jra	00105$
      00969B                        347 00107$:
                                    348 ;	lib/stm8s_clk.c: 326: if(DownCounter != 0)
      00969B 5D               [ 2]  349 	tnzw	x
      00969C 27 06            [ 1]  350 	jreq	00109$
                                    351 ;	lib/stm8s_clk.c: 328: Swif = SUCCESS;
      00969E A6 01            [ 1]  352 	ld	a, #0x01
      0096A0 6B 01            [ 1]  353 	ld	(0x01, sp), a
      0096A2 20 43            [ 2]  354 	jra	00123$
      0096A4                        355 00109$:
                                    356 ;	lib/stm8s_clk.c: 332: Swif = ERROR;
      0096A4 0F 01            [ 1]  357 	clr	(0x01, sp)
      0096A6 20 3F            [ 2]  358 	jra	00123$
      0096A8                        359 00122$:
                                    360 ;	lib/stm8s_clk.c: 338: if (ITState != DISABLE)
      0096A8 0D 07            [ 1]  361 	tnz	(0x07, sp)
      0096AA 27 09            [ 1]  362 	jreq	00112$
                                    363 ;	lib/stm8s_clk.c: 340: CLK->SWCR |= CLK_SWCR_SWIEN;
      0096AC AE 50 C5         [ 2]  364 	ldw	x, #0x50c5
      0096AF F6               [ 1]  365 	ld	a, (x)
      0096B0 AA 04            [ 1]  366 	or	a, #0x04
      0096B2 F7               [ 1]  367 	ld	(x), a
      0096B3 20 07            [ 2]  368 	jra	00113$
      0096B5                        369 00112$:
                                    370 ;	lib/stm8s_clk.c: 344: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      0096B5 AE 50 C5         [ 2]  371 	ldw	x, #0x50c5
      0096B8 F6               [ 1]  372 	ld	a, (x)
      0096B9 A4 FB            [ 1]  373 	and	a, #0xfb
      0096BB F7               [ 1]  374 	ld	(x), a
      0096BC                        375 00113$:
                                    376 ;	lib/stm8s_clk.c: 348: CLK->SWR = (uint8_t)CLK_NewClock;
      0096BC AE 50 C4         [ 2]  377 	ldw	x, #0x50c4
      0096BF 7B 06            [ 1]  378 	ld	a, (0x06, sp)
      0096C1 F7               [ 1]  379 	ld	(x), a
                                    380 ;	lib/stm8s_clk.c: 351: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      0096C2 AE FF FF         [ 2]  381 	ldw	x, #0xffff
      0096C5                        382 00115$:
      0096C5 90 AE 50 C5      [ 2]  383 	ldw	y, #0x50c5
      0096C9 90 F6            [ 1]  384 	ld	a, (y)
      0096CB A5 08            [ 1]  385 	bcp	a, #0x08
      0096CD 27 06            [ 1]  386 	jreq	00117$
      0096CF 5D               [ 2]  387 	tnzw	x
      0096D0 27 03            [ 1]  388 	jreq	00117$
                                    389 ;	lib/stm8s_clk.c: 353: DownCounter--;
      0096D2 5A               [ 2]  390 	decw	x
      0096D3 20 F0            [ 2]  391 	jra	00115$
      0096D5                        392 00117$:
                                    393 ;	lib/stm8s_clk.c: 356: if(DownCounter != 0)
      0096D5 5D               [ 2]  394 	tnzw	x
      0096D6 27 0D            [ 1]  395 	jreq	00119$
                                    396 ;	lib/stm8s_clk.c: 359: CLK->SWCR |= CLK_SWCR_SWEN;
      0096D8 AE 50 C5         [ 2]  397 	ldw	x, #0x50c5
      0096DB F6               [ 1]  398 	ld	a, (x)
      0096DC AA 02            [ 1]  399 	or	a, #0x02
      0096DE F7               [ 1]  400 	ld	(x), a
                                    401 ;	lib/stm8s_clk.c: 360: Swif = SUCCESS;
      0096DF A6 01            [ 1]  402 	ld	a, #0x01
      0096E1 6B 01            [ 1]  403 	ld	(0x01, sp), a
      0096E3 20 02            [ 2]  404 	jra	00123$
      0096E5                        405 00119$:
                                    406 ;	lib/stm8s_clk.c: 364: Swif = ERROR;
      0096E5 0F 01            [ 1]  407 	clr	(0x01, sp)
      0096E7                        408 00123$:
                                    409 ;	lib/stm8s_clk.c: 367: if(Swif != ERROR)
      0096E7 0D 01            [ 1]  410 	tnz	(0x01, sp)
      0096E9 27 31            [ 1]  411 	jreq	00136$
                                    412 ;	lib/stm8s_clk.c: 370: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      0096EB 0D 08            [ 1]  413 	tnz	(0x08, sp)
      0096ED 26 0C            [ 1]  414 	jrne	00132$
      0096EF 7B 02            [ 1]  415 	ld	a, (0x02, sp)
      0096F1 A1 E1            [ 1]  416 	cp	a, #0xe1
      0096F3 26 06            [ 1]  417 	jrne	00132$
                                    418 ;	lib/stm8s_clk.c: 372: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      0096F5 72 11 50 C0      [ 1]  419 	bres	0x50c0, #0
      0096F9 20 21            [ 2]  420 	jra	00136$
      0096FB                        421 00132$:
                                    422 ;	lib/stm8s_clk.c: 374: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      0096FB 0D 08            [ 1]  423 	tnz	(0x08, sp)
      0096FD 26 0F            [ 1]  424 	jrne	00128$
      0096FF 7B 02            [ 1]  425 	ld	a, (0x02, sp)
      009701 A1 D2            [ 1]  426 	cp	a, #0xd2
      009703 26 09            [ 1]  427 	jrne	00128$
                                    428 ;	lib/stm8s_clk.c: 376: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      009705 AE 50 C0         [ 2]  429 	ldw	x, #0x50c0
      009708 F6               [ 1]  430 	ld	a, (x)
      009709 A4 F7            [ 1]  431 	and	a, #0xf7
      00970B F7               [ 1]  432 	ld	(x), a
      00970C 20 0E            [ 2]  433 	jra	00136$
      00970E                        434 00128$:
                                    435 ;	lib/stm8s_clk.c: 378: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      00970E 0D 08            [ 1]  436 	tnz	(0x08, sp)
      009710 26 0A            [ 1]  437 	jrne	00136$
      009712 7B 02            [ 1]  438 	ld	a, (0x02, sp)
      009714 A1 B4            [ 1]  439 	cp	a, #0xb4
      009716 26 04            [ 1]  440 	jrne	00136$
                                    441 ;	lib/stm8s_clk.c: 380: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      009718 72 11 50 C1      [ 1]  442 	bres	0x50c1, #0
      00971C                        443 00136$:
                                    444 ;	lib/stm8s_clk.c: 383: return(Swif);
      00971C 7B 01            [ 1]  445 	ld	a, (0x01, sp)
      00971E 85               [ 2]  446 	popw	x
      00971F 81               [ 4]  447 	ret
                                    448 ;	lib/stm8s_clk.c: 392: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    449 ;	-----------------------------------------
                                    450 ;	 function CLK_HSIPrescalerConfig
                                    451 ;	-----------------------------------------
      009720                        452 _CLK_HSIPrescalerConfig:
                                    453 ;	lib/stm8s_clk.c: 396: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      009720 AE 50 C6         [ 2]  454 	ldw	x, #0x50c6
      009723 F6               [ 1]  455 	ld	a, (x)
      009724 A4 E7            [ 1]  456 	and	a, #0xe7
      009726 F7               [ 1]  457 	ld	(x), a
                                    458 ;	lib/stm8s_clk.c: 399: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      009727 AE 50 C6         [ 2]  459 	ldw	x, #0x50c6
      00972A F6               [ 1]  460 	ld	a, (x)
      00972B 1A 03            [ 1]  461 	or	a, (0x03, sp)
      00972D AE 50 C6         [ 2]  462 	ldw	x, #0x50c6
      009730 F7               [ 1]  463 	ld	(x), a
      009731 81               [ 4]  464 	ret
                                    465 ;	lib/stm8s_clk.c: 411: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    466 ;	-----------------------------------------
                                    467 ;	 function CLK_CCOConfig
                                    468 ;	-----------------------------------------
      009732                        469 _CLK_CCOConfig:
                                    470 ;	lib/stm8s_clk.c: 415: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      009732 AE 50 C9         [ 2]  471 	ldw	x, #0x50c9
      009735 F6               [ 1]  472 	ld	a, (x)
      009736 A4 E1            [ 1]  473 	and	a, #0xe1
      009738 F7               [ 1]  474 	ld	(x), a
                                    475 ;	lib/stm8s_clk.c: 418: CLK->CCOR |= (uint8_t)CLK_CCO;
      009739 AE 50 C9         [ 2]  476 	ldw	x, #0x50c9
      00973C F6               [ 1]  477 	ld	a, (x)
      00973D 1A 03            [ 1]  478 	or	a, (0x03, sp)
      00973F AE 50 C9         [ 2]  479 	ldw	x, #0x50c9
      009742 F7               [ 1]  480 	ld	(x), a
                                    481 ;	lib/stm8s_clk.c: 421: CLK->CCOR |= CLK_CCOR_CCOEN;
      009743 72 10 50 C9      [ 1]  482 	bset	0x50c9, #0
      009747 81               [ 4]  483 	ret
                                    484 ;	lib/stm8s_clk.c: 432: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    485 ;	-----------------------------------------
                                    486 ;	 function CLK_ITConfig
                                    487 ;	-----------------------------------------
      009748                        488 _CLK_ITConfig:
      009748 88               [ 1]  489 	push	a
                                    490 ;	lib/stm8s_clk.c: 436: switch (CLK_IT)
      009749 7B 04            [ 1]  491 	ld	a, (0x04, sp)
      00974B A1 0C            [ 1]  492 	cp	a, #0x0c
      00974D 26 06            [ 1]  493 	jrne	00135$
      00974F A6 01            [ 1]  494 	ld	a, #0x01
      009751 6B 01            [ 1]  495 	ld	(0x01, sp), a
      009753 20 02            [ 2]  496 	jra	00136$
      009755                        497 00135$:
      009755 0F 01            [ 1]  498 	clr	(0x01, sp)
      009757                        499 00136$:
      009757 7B 04            [ 1]  500 	ld	a, (0x04, sp)
      009759 A1 1C            [ 1]  501 	cp	a, #0x1c
      00975B 26 03            [ 1]  502 	jrne	00138$
      00975D A6 01            [ 1]  503 	ld	a, #0x01
      00975F 21                     504 	.byte 0x21
      009760                        505 00138$:
      009760 4F               [ 1]  506 	clr	a
      009761                        507 00139$:
                                    508 ;	lib/stm8s_clk.c: 434: if (NewState != DISABLE)
      009761 0D 05            [ 1]  509 	tnz	(0x05, sp)
      009763 27 19            [ 1]  510 	jreq	00110$
                                    511 ;	lib/stm8s_clk.c: 436: switch (CLK_IT)
      009765 0D 01            [ 1]  512 	tnz	(0x01, sp)
      009767 26 0C            [ 1]  513 	jrne	00102$
      009769 4D               [ 1]  514 	tnz	a
      00976A 27 29            [ 1]  515 	jreq	00112$
                                    516 ;	lib/stm8s_clk.c: 439: CLK->SWCR |= CLK_SWCR_SWIEN;
      00976C AE 50 C5         [ 2]  517 	ldw	x, #0x50c5
      00976F F6               [ 1]  518 	ld	a, (x)
      009770 AA 04            [ 1]  519 	or	a, #0x04
      009772 F7               [ 1]  520 	ld	(x), a
                                    521 ;	lib/stm8s_clk.c: 440: break;
      009773 20 20            [ 2]  522 	jra	00112$
                                    523 ;	lib/stm8s_clk.c: 441: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      009775                        524 00102$:
                                    525 ;	lib/stm8s_clk.c: 442: CLK->CSSR |= CLK_CSSR_CSSDIE;
      009775 AE 50 C8         [ 2]  526 	ldw	x, #0x50c8
      009778 F6               [ 1]  527 	ld	a, (x)
      009779 AA 04            [ 1]  528 	or	a, #0x04
      00977B F7               [ 1]  529 	ld	(x), a
                                    530 ;	lib/stm8s_clk.c: 443: break;
      00977C 20 17            [ 2]  531 	jra	00112$
                                    532 ;	lib/stm8s_clk.c: 446: }
      00977E                        533 00110$:
                                    534 ;	lib/stm8s_clk.c: 450: switch (CLK_IT)
      00977E 0D 01            [ 1]  535 	tnz	(0x01, sp)
      009780 26 0C            [ 1]  536 	jrne	00106$
      009782 4D               [ 1]  537 	tnz	a
      009783 27 10            [ 1]  538 	jreq	00112$
                                    539 ;	lib/stm8s_clk.c: 453: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      009785 AE 50 C5         [ 2]  540 	ldw	x, #0x50c5
      009788 F6               [ 1]  541 	ld	a, (x)
      009789 A4 FB            [ 1]  542 	and	a, #0xfb
      00978B F7               [ 1]  543 	ld	(x), a
                                    544 ;	lib/stm8s_clk.c: 454: break;
      00978C 20 07            [ 2]  545 	jra	00112$
                                    546 ;	lib/stm8s_clk.c: 455: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      00978E                        547 00106$:
                                    548 ;	lib/stm8s_clk.c: 456: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      00978E AE 50 C8         [ 2]  549 	ldw	x, #0x50c8
      009791 F6               [ 1]  550 	ld	a, (x)
      009792 A4 FB            [ 1]  551 	and	a, #0xfb
      009794 F7               [ 1]  552 	ld	(x), a
                                    553 ;	lib/stm8s_clk.c: 460: }
      009795                        554 00112$:
      009795 84               [ 1]  555 	pop	a
      009796 81               [ 4]  556 	ret
                                    557 ;	lib/stm8s_clk.c: 469: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    558 ;	-----------------------------------------
                                    559 ;	 function CLK_SYSCLKConfig
                                    560 ;	-----------------------------------------
      009797                        561 _CLK_SYSCLKConfig:
      009797 89               [ 2]  562 	pushw	x
                                    563 ;	lib/stm8s_clk.c: 472: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      009798 0D 05            [ 1]  564 	tnz	(0x05, sp)
      00979A 2B 19            [ 1]  565 	jrmi	00102$
                                    566 ;	lib/stm8s_clk.c: 474: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      00979C AE 50 C6         [ 2]  567 	ldw	x, #0x50c6
      00979F F6               [ 1]  568 	ld	a, (x)
      0097A0 A4 E7            [ 1]  569 	and	a, #0xe7
      0097A2 F7               [ 1]  570 	ld	(x), a
                                    571 ;	lib/stm8s_clk.c: 475: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      0097A3 AE 50 C6         [ 2]  572 	ldw	x, #0x50c6
      0097A6 F6               [ 1]  573 	ld	a, (x)
      0097A7 6B 02            [ 1]  574 	ld	(0x02, sp), a
      0097A9 7B 05            [ 1]  575 	ld	a, (0x05, sp)
      0097AB A4 18            [ 1]  576 	and	a, #0x18
      0097AD 1A 02            [ 1]  577 	or	a, (0x02, sp)
      0097AF AE 50 C6         [ 2]  578 	ldw	x, #0x50c6
      0097B2 F7               [ 1]  579 	ld	(x), a
      0097B3 20 17            [ 2]  580 	jra	00104$
      0097B5                        581 00102$:
                                    582 ;	lib/stm8s_clk.c: 479: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      0097B5 AE 50 C6         [ 2]  583 	ldw	x, #0x50c6
      0097B8 F6               [ 1]  584 	ld	a, (x)
      0097B9 A4 F8            [ 1]  585 	and	a, #0xf8
      0097BB F7               [ 1]  586 	ld	(x), a
                                    587 ;	lib/stm8s_clk.c: 480: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      0097BC AE 50 C6         [ 2]  588 	ldw	x, #0x50c6
      0097BF F6               [ 1]  589 	ld	a, (x)
      0097C0 6B 01            [ 1]  590 	ld	(0x01, sp), a
      0097C2 7B 05            [ 1]  591 	ld	a, (0x05, sp)
      0097C4 A4 07            [ 1]  592 	and	a, #0x07
      0097C6 1A 01            [ 1]  593 	or	a, (0x01, sp)
      0097C8 AE 50 C6         [ 2]  594 	ldw	x, #0x50c6
      0097CB F7               [ 1]  595 	ld	(x), a
      0097CC                        596 00104$:
      0097CC 85               [ 2]  597 	popw	x
      0097CD 81               [ 4]  598 	ret
                                    599 ;	lib/stm8s_clk.c: 490: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    600 ;	-----------------------------------------
                                    601 ;	 function CLK_SWIMConfig
                                    602 ;	-----------------------------------------
      0097CE                        603 _CLK_SWIMConfig:
                                    604 ;	lib/stm8s_clk.c: 493: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      0097CE 0D 03            [ 1]  605 	tnz	(0x03, sp)
      0097D0 27 05            [ 1]  606 	jreq	00102$
                                    607 ;	lib/stm8s_clk.c: 496: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      0097D2 72 10 50 CD      [ 1]  608 	bset	0x50cd, #0
      0097D6 81               [ 4]  609 	ret
      0097D7                        610 00102$:
                                    611 ;	lib/stm8s_clk.c: 501: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      0097D7 72 11 50 CD      [ 1]  612 	bres	0x50cd, #0
      0097DB 81               [ 4]  613 	ret
                                    614 ;	lib/stm8s_clk.c: 512: void CLK_ClockSecuritySystemEnable(void)
                                    615 ;	-----------------------------------------
                                    616 ;	 function CLK_ClockSecuritySystemEnable
                                    617 ;	-----------------------------------------
      0097DC                        618 _CLK_ClockSecuritySystemEnable:
                                    619 ;	lib/stm8s_clk.c: 515: CLK->CSSR |= CLK_CSSR_CSSEN;
      0097DC 72 10 50 C8      [ 1]  620 	bset	0x50c8, #0
      0097E0 81               [ 4]  621 	ret
                                    622 ;	lib/stm8s_clk.c: 524: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    623 ;	-----------------------------------------
                                    624 ;	 function CLK_GetSYSCLKSource
                                    625 ;	-----------------------------------------
      0097E1                        626 _CLK_GetSYSCLKSource:
                                    627 ;	lib/stm8s_clk.c: 526: return((CLK_Source_TypeDef)CLK->CMSR);
      0097E1 AE 50 C3         [ 2]  628 	ldw	x, #0x50c3
      0097E4 F6               [ 1]  629 	ld	a, (x)
      0097E5 81               [ 4]  630 	ret
                                    631 ;	lib/stm8s_clk.c: 534: uint32_t CLK_GetClockFreq(void)
                                    632 ;	-----------------------------------------
                                    633 ;	 function CLK_GetClockFreq
                                    634 ;	-----------------------------------------
      0097E6                        635 _CLK_GetClockFreq:
      0097E6 52 07            [ 2]  636 	sub	sp, #7
                                    637 ;	lib/stm8s_clk.c: 541: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      0097E8 AE 50 C3         [ 2]  638 	ldw	x, #0x50c3
      0097EB F6               [ 1]  639 	ld	a, (x)
      0097EC 6B 01            [ 1]  640 	ld	(0x01, sp), a
                                    641 ;	lib/stm8s_clk.c: 543: if (clocksource == CLK_SOURCE_HSI)
      0097EE 7B 01            [ 1]  642 	ld	a, (0x01, sp)
      0097F0 A1 E1            [ 1]  643 	cp	a, #0xe1
      0097F2 26 2C            [ 1]  644 	jrne	00105$
                                    645 ;	lib/stm8s_clk.c: 545: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      0097F4 AE 50 C6         [ 2]  646 	ldw	x, #0x50c6
      0097F7 F6               [ 1]  647 	ld	a, (x)
      0097F8 A4 18            [ 1]  648 	and	a, #0x18
                                    649 ;	lib/stm8s_clk.c: 546: tmp = (uint8_t)(tmp >> 3);
      0097FA 44               [ 1]  650 	srl	a
      0097FB 44               [ 1]  651 	srl	a
      0097FC 44               [ 1]  652 	srl	a
                                    653 ;	lib/stm8s_clk.c: 547: presc = HSIDivFactor[tmp];
      0097FD AE 98 D3         [ 2]  654 	ldw	x, #_HSIDivFactor+0
      009800 1F 06            [ 2]  655 	ldw	(0x06, sp), x
      009802 5F               [ 1]  656 	clrw	x
      009803 97               [ 1]  657 	ld	xl, a
      009804 72 FB 06         [ 2]  658 	addw	x, (0x06, sp)
      009807 F6               [ 1]  659 	ld	a, (x)
                                    660 ;	lib/stm8s_clk.c: 548: clockfrequency = HSI_VALUE / presc;
      009808 5F               [ 1]  661 	clrw	x
      009809 97               [ 1]  662 	ld	xl, a
      00980A 90 5F            [ 1]  663 	clrw	y
      00980C 89               [ 2]  664 	pushw	x
      00980D 90 89            [ 2]  665 	pushw	y
      00980F 4B 00            [ 1]  666 	push	#0x00
      009811 4B 24            [ 1]  667 	push	#0x24
      009813 4B F4            [ 1]  668 	push	#0xf4
      009815 4B 00            [ 1]  669 	push	#0x00
      009817 CD 9B AE         [ 4]  670 	call	__divulong
      00981A 5B 08            [ 2]  671 	addw	sp, #8
      00981C 1F 04            [ 2]  672 	ldw	(0x04, sp), x
      00981E 20 1A            [ 2]  673 	jra	00106$
      009820                        674 00105$:
                                    675 ;	lib/stm8s_clk.c: 550: else if ( clocksource == CLK_SOURCE_LSI)
      009820 7B 01            [ 1]  676 	ld	a, (0x01, sp)
      009822 A1 D2            [ 1]  677 	cp	a, #0xd2
      009824 26 0B            [ 1]  678 	jrne	00102$
                                    679 ;	lib/stm8s_clk.c: 552: clockfrequency = LSI_VALUE;
      009826 AE F4 00         [ 2]  680 	ldw	x, #0xf400
      009829 1F 04            [ 2]  681 	ldw	(0x04, sp), x
      00982B 90 AE 00 01      [ 2]  682 	ldw	y, #0x0001
      00982F 20 09            [ 2]  683 	jra	00106$
      009831                        684 00102$:
                                    685 ;	lib/stm8s_clk.c: 556: clockfrequency = HSE_VALUE;
      009831 AE 24 00         [ 2]  686 	ldw	x, #0x2400
      009834 1F 04            [ 2]  687 	ldw	(0x04, sp), x
      009836 90 AE 00 F4      [ 2]  688 	ldw	y, #0x00f4
      00983A                        689 00106$:
                                    690 ;	lib/stm8s_clk.c: 559: return((uint32_t)clockfrequency);
      00983A 1E 04            [ 2]  691 	ldw	x, (0x04, sp)
      00983C 5B 07            [ 2]  692 	addw	sp, #7
      00983E 81               [ 4]  693 	ret
                                    694 ;	lib/stm8s_clk.c: 569: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    695 ;	-----------------------------------------
                                    696 ;	 function CLK_AdjustHSICalibrationValue
                                    697 ;	-----------------------------------------
      00983F                        698 _CLK_AdjustHSICalibrationValue:
                                    699 ;	lib/stm8s_clk.c: 573: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      00983F AE 50 CC         [ 2]  700 	ldw	x, #0x50cc
      009842 F6               [ 1]  701 	ld	a, (x)
      009843 A4 F8            [ 1]  702 	and	a, #0xf8
      009845 1A 03            [ 1]  703 	or	a, (0x03, sp)
      009847 AE 50 CC         [ 2]  704 	ldw	x, #0x50cc
      00984A F7               [ 1]  705 	ld	(x), a
      00984B 81               [ 4]  706 	ret
                                    707 ;	lib/stm8s_clk.c: 585: void CLK_SYSCLKEmergencyClear(void)
                                    708 ;	-----------------------------------------
                                    709 ;	 function CLK_SYSCLKEmergencyClear
                                    710 ;	-----------------------------------------
      00984C                        711 _CLK_SYSCLKEmergencyClear:
                                    712 ;	lib/stm8s_clk.c: 587: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      00984C 72 11 50 C5      [ 1]  713 	bres	0x50c5, #0
      009850 81               [ 4]  714 	ret
                                    715 ;	lib/stm8s_clk.c: 597: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    716 ;	-----------------------------------------
                                    717 ;	 function CLK_GetFlagStatus
                                    718 ;	-----------------------------------------
      009851                        719 _CLK_GetFlagStatus:
      009851 88               [ 1]  720 	push	a
                                    721 ;	lib/stm8s_clk.c: 604: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      009852 4F               [ 1]  722 	clr	a
      009853 97               [ 1]  723 	ld	xl, a
      009854 7B 04            [ 1]  724 	ld	a, (0x04, sp)
      009856 95               [ 1]  725 	ld	xh, a
                                    726 ;	lib/stm8s_clk.c: 607: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      009857 A3 01 00         [ 2]  727 	cpw	x, #0x0100
      00985A 26 06            [ 1]  728 	jrne	00111$
                                    729 ;	lib/stm8s_clk.c: 609: tmpreg = CLK->ICKR;
      00985C AE 50 C0         [ 2]  730 	ldw	x, #0x50c0
      00985F F6               [ 1]  731 	ld	a, (x)
      009860 20 25            [ 2]  732 	jra	00112$
      009862                        733 00111$:
                                    734 ;	lib/stm8s_clk.c: 611: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      009862 A3 02 00         [ 2]  735 	cpw	x, #0x0200
      009865 26 06            [ 1]  736 	jrne	00108$
                                    737 ;	lib/stm8s_clk.c: 613: tmpreg = CLK->ECKR;
      009867 AE 50 C1         [ 2]  738 	ldw	x, #0x50c1
      00986A F6               [ 1]  739 	ld	a, (x)
      00986B 20 1A            [ 2]  740 	jra	00112$
      00986D                        741 00108$:
                                    742 ;	lib/stm8s_clk.c: 615: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      00986D A3 03 00         [ 2]  743 	cpw	x, #0x0300
      009870 26 06            [ 1]  744 	jrne	00105$
                                    745 ;	lib/stm8s_clk.c: 617: tmpreg = CLK->SWCR;
      009872 AE 50 C5         [ 2]  746 	ldw	x, #0x50c5
      009875 F6               [ 1]  747 	ld	a, (x)
      009876 20 0F            [ 2]  748 	jra	00112$
      009878                        749 00105$:
                                    750 ;	lib/stm8s_clk.c: 619: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      009878 A3 04 00         [ 2]  751 	cpw	x, #0x0400
      00987B 26 06            [ 1]  752 	jrne	00102$
                                    753 ;	lib/stm8s_clk.c: 621: tmpreg = CLK->CSSR;
      00987D AE 50 C8         [ 2]  754 	ldw	x, #0x50c8
      009880 F6               [ 1]  755 	ld	a, (x)
      009881 20 04            [ 2]  756 	jra	00112$
      009883                        757 00102$:
                                    758 ;	lib/stm8s_clk.c: 625: tmpreg = CLK->CCOR;
      009883 AE 50 C9         [ 2]  759 	ldw	x, #0x50c9
      009886 F6               [ 1]  760 	ld	a, (x)
      009887                        761 00112$:
                                    762 ;	lib/stm8s_clk.c: 628: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      009887 88               [ 1]  763 	push	a
      009888 7B 06            [ 1]  764 	ld	a, (0x06, sp)
      00988A 6B 02            [ 1]  765 	ld	(0x02, sp), a
      00988C 84               [ 1]  766 	pop	a
      00988D 14 01            [ 1]  767 	and	a, (0x01, sp)
      00988F 4D               [ 1]  768 	tnz	a
      009890 27 03            [ 1]  769 	jreq	00114$
                                    770 ;	lib/stm8s_clk.c: 630: bitstatus = SET;
      009892 A6 01            [ 1]  771 	ld	a, #0x01
                                    772 ;	lib/stm8s_clk.c: 634: bitstatus = RESET;
      009894 21                     773 	.byte 0x21
      009895                        774 00114$:
      009895 4F               [ 1]  775 	clr	a
      009896                        776 00115$:
                                    777 ;	lib/stm8s_clk.c: 638: return((FlagStatus)bitstatus);
      009896 5B 01            [ 2]  778 	addw	sp, #1
      009898 81               [ 4]  779 	ret
                                    780 ;	lib/stm8s_clk.c: 647: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    781 ;	-----------------------------------------
                                    782 ;	 function CLK_GetITStatus
                                    783 ;	-----------------------------------------
      009899                        784 _CLK_GetITStatus:
                                    785 ;	lib/stm8s_clk.c: 651: if (CLK_IT == CLK_IT_SWIF)
      009899 7B 03            [ 1]  786 	ld	a, (0x03, sp)
      00989B A1 1C            [ 1]  787 	cp	a, #0x1c
      00989D 26 0F            [ 1]  788 	jrne	00108$
                                    789 ;	lib/stm8s_clk.c: 654: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      00989F AE 50 C5         [ 2]  790 	ldw	x, #0x50c5
      0098A2 F6               [ 1]  791 	ld	a, (x)
      0098A3 14 03            [ 1]  792 	and	a, (0x03, sp)
      0098A5 A1 0C            [ 1]  793 	cp	a, #0x0c
      0098A7 26 03            [ 1]  794 	jrne	00102$
                                    795 ;	lib/stm8s_clk.c: 656: bitstatus = SET;
      0098A9 A6 01            [ 1]  796 	ld	a, #0x01
      0098AB 81               [ 4]  797 	ret
      0098AC                        798 00102$:
                                    799 ;	lib/stm8s_clk.c: 660: bitstatus = RESET;
      0098AC 4F               [ 1]  800 	clr	a
      0098AD 81               [ 4]  801 	ret
      0098AE                        802 00108$:
                                    803 ;	lib/stm8s_clk.c: 666: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      0098AE AE 50 C8         [ 2]  804 	ldw	x, #0x50c8
      0098B1 F6               [ 1]  805 	ld	a, (x)
      0098B2 14 03            [ 1]  806 	and	a, (0x03, sp)
      0098B4 A1 0C            [ 1]  807 	cp	a, #0x0c
      0098B6 26 03            [ 1]  808 	jrne	00105$
                                    809 ;	lib/stm8s_clk.c: 668: bitstatus = SET;
      0098B8 A6 01            [ 1]  810 	ld	a, #0x01
      0098BA 81               [ 4]  811 	ret
      0098BB                        812 00105$:
                                    813 ;	lib/stm8s_clk.c: 672: bitstatus = RESET;
      0098BB 4F               [ 1]  814 	clr	a
                                    815 ;	lib/stm8s_clk.c: 677: return bitstatus;
      0098BC 81               [ 4]  816 	ret
                                    817 ;	lib/stm8s_clk.c: 686: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    818 ;	-----------------------------------------
                                    819 ;	 function CLK_ClearITPendingBit
                                    820 ;	-----------------------------------------
      0098BD                        821 _CLK_ClearITPendingBit:
                                    822 ;	lib/stm8s_clk.c: 689: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      0098BD 7B 03            [ 1]  823 	ld	a, (0x03, sp)
      0098BF A1 0C            [ 1]  824 	cp	a, #0x0c
      0098C1 26 08            [ 1]  825 	jrne	00102$
                                    826 ;	lib/stm8s_clk.c: 692: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      0098C3 AE 50 C8         [ 2]  827 	ldw	x, #0x50c8
      0098C6 F6               [ 1]  828 	ld	a, (x)
      0098C7 A4 F7            [ 1]  829 	and	a, #0xf7
      0098C9 F7               [ 1]  830 	ld	(x), a
      0098CA 81               [ 4]  831 	ret
      0098CB                        832 00102$:
                                    833 ;	lib/stm8s_clk.c: 697: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      0098CB AE 50 C5         [ 2]  834 	ldw	x, #0x50c5
      0098CE F6               [ 1]  835 	ld	a, (x)
      0098CF A4 F7            [ 1]  836 	and	a, #0xf7
      0098D1 F7               [ 1]  837 	ld	(x), a
      0098D2 81               [ 4]  838 	ret
                                    839 	.area CODE
      0098D3                        840 _HSIDivFactor:
      0098D3 01                     841 	.db #0x01	; 1
      0098D4 02                     842 	.db #0x02	; 2
      0098D5 04                     843 	.db #0x04	; 4
      0098D6 08                     844 	.db #0x08	; 8
      0098D7                        845 _CLKPrescTable:
      0098D7 01                     846 	.db #0x01	; 1
      0098D8 02                     847 	.db #0x02	; 2
      0098D9 04                     848 	.db #0x04	; 4
      0098DA 08                     849 	.db #0x08	; 8
      0098DB 0A                     850 	.db #0x0a	; 10
      0098DC 10                     851 	.db #0x10	; 16
      0098DD 14                     852 	.db #0x14	; 20
      0098DE 28                     853 	.db #0x28	; 40
                                    854 	.area INITIALIZER
                                    855 	.area CABS (ABS)
