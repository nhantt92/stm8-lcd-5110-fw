                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_gpio
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _GPIO_Init
                                     12 	.globl _GPIO_Write
                                     13 	.globl _GPIO_WriteHigh
                                     14 	.globl _GPIO_WriteLow
                                     15 	.globl _GPIO_WriteReverse
                                     16 	.globl _GPIO_ReadOutputData
                                     17 	.globl _GPIO_ReadInputData
                                     18 	.globl _GPIO_ReadInputPin
                                     19 	.globl _GPIO_ExternalPullUpConfig
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area DATA
                                     24 ;--------------------------------------------------------
                                     25 ; ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area INITIALIZED
                                     28 ;--------------------------------------------------------
                                     29 ; absolute external ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area DABS (ABS)
                                     32 ;--------------------------------------------------------
                                     33 ; global & static initialisations
                                     34 ;--------------------------------------------------------
                                     35 	.area HOME
                                     36 	.area GSINIT
                                     37 	.area GSFINAL
                                     38 	.area GSINIT
                                     39 ;--------------------------------------------------------
                                     40 ; Home
                                     41 ;--------------------------------------------------------
                                     42 	.area HOME
                                     43 	.area HOME
                                     44 ;--------------------------------------------------------
                                     45 ; code
                                     46 ;--------------------------------------------------------
                                     47 	.area CODE
                                     48 ;	lib/stm8s_gpio.c: 13: void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
                                     49 ;	-----------------------------------------
                                     50 ;	 function GPIO_Init
                                     51 ;	-----------------------------------------
      009E0C                         52 _GPIO_Init:
      009E0C 52 07            [ 2]   53 	sub	sp, #7
                                     54 ;	lib/stm8s_gpio.c: 16: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      009E0E 16 0A            [ 2]   55 	ldw	y, (0x0a, sp)
      009E10 17 01            [ 2]   56 	ldw	(0x01, sp), y
      009E12 1E 01            [ 2]   57 	ldw	x, (0x01, sp)
      009E14 7F               [ 1]   58 	clr	(x)
                                     59 ;	lib/stm8s_gpio.c: 17: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      009E15 1E 01            [ 2]   60 	ldw	x, (0x01, sp)
      009E17 5C               [ 2]   61 	incw	x
      009E18 5C               [ 2]   62 	incw	x
      009E19 1F 03            [ 2]   63 	ldw	(0x03, sp), x
      009E1B 1E 03            [ 2]   64 	ldw	x, (0x03, sp)
      009E1D 7F               [ 1]   65 	clr	(x)
                                     66 ;	lib/stm8s_gpio.c: 18: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      009E1E 1E 01            [ 2]   67 	ldw	x, (0x01, sp)
      009E20 1C 00 03         [ 2]   68 	addw	x, #0x0003
      009E23 1F 05            [ 2]   69 	ldw	(0x05, sp), x
      009E25 1E 05            [ 2]   70 	ldw	x, (0x05, sp)
      009E27 7F               [ 1]   71 	clr	(x)
                                     72 ;	lib/stm8s_gpio.c: 19: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      009E28 16 01            [ 2]   73 	ldw	y, (0x01, sp)
      009E2A 72 A9 00 04      [ 2]   74 	addw	y, #0x0004
      009E2E 90 7F            [ 1]   75 	clr	(y)
                                     76 ;	lib/stm8s_gpio.c: 22: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin)); /* Reset corresponding bit to GPIO_Pin in CR2 register */
      009E30 90 F6            [ 1]   77 	ld	a, (y)
      009E32 88               [ 1]   78 	push	a
      009E33 7B 0D            [ 1]   79 	ld	a, (0x0d, sp)
      009E35 43               [ 1]   80 	cpl	a
      009E36 6B 08            [ 1]   81 	ld	(0x08, sp), a
      009E38 84               [ 1]   82 	pop	a
      009E39 14 07            [ 1]   83 	and	a, (0x07, sp)
      009E3B 90 F7            [ 1]   84 	ld	(y), a
                                     85 ;	lib/stm8s_gpio.c: 27: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
      009E3D 0D 0D            [ 1]   86 	tnz	(0x0d, sp)
      009E3F 2A 22            [ 1]   87 	jrpl	00105$
                                     88 ;	lib/stm8s_gpio.c: 29: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
      009E41 7B 0D            [ 1]   89 	ld	a, (0x0d, sp)
      009E43 A5 10            [ 1]   90 	bcp	a, #0x10
      009E45 27 0A            [ 1]   91 	jreq	00102$
                                     92 ;	lib/stm8s_gpio.c: 31: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      009E47 1E 01            [ 2]   93 	ldw	x, (0x01, sp)
      009E49 F6               [ 1]   94 	ld	a, (x)
      009E4A 1A 0C            [ 1]   95 	or	a, (0x0c, sp)
      009E4C 1E 01            [ 2]   96 	ldw	x, (0x01, sp)
      009E4E F7               [ 1]   97 	ld	(x), a
      009E4F 20 08            [ 2]   98 	jra	00103$
      009E51                         99 00102$:
                                    100 ;	lib/stm8s_gpio.c: 35: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
      009E51 1E 01            [ 2]  101 	ldw	x, (0x01, sp)
      009E53 F6               [ 1]  102 	ld	a, (x)
      009E54 14 07            [ 1]  103 	and	a, (0x07, sp)
      009E56 1E 01            [ 2]  104 	ldw	x, (0x01, sp)
      009E58 F7               [ 1]  105 	ld	(x), a
      009E59                        106 00103$:
                                    107 ;	lib/stm8s_gpio.c: 38: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      009E59 1E 03            [ 2]  108 	ldw	x, (0x03, sp)
      009E5B F6               [ 1]  109 	ld	a, (x)
      009E5C 1A 0C            [ 1]  110 	or	a, (0x0c, sp)
      009E5E 1E 03            [ 2]  111 	ldw	x, (0x03, sp)
      009E60 F7               [ 1]  112 	ld	(x), a
      009E61 20 08            [ 2]  113 	jra	00106$
      009E63                        114 00105$:
                                    115 ;	lib/stm8s_gpio.c: 43: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
      009E63 1E 03            [ 2]  116 	ldw	x, (0x03, sp)
      009E65 F6               [ 1]  117 	ld	a, (x)
      009E66 14 07            [ 1]  118 	and	a, (0x07, sp)
      009E68 1E 03            [ 2]  119 	ldw	x, (0x03, sp)
      009E6A F7               [ 1]  120 	ld	(x), a
      009E6B                        121 00106$:
                                    122 ;	lib/stm8s_gpio.c: 48: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
      009E6B 7B 0D            [ 1]  123 	ld	a, (0x0d, sp)
      009E6D A5 40            [ 1]  124 	bcp	a, #0x40
      009E6F 27 0A            [ 1]  125 	jreq	00108$
                                    126 ;	lib/stm8s_gpio.c: 50: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      009E71 1E 05            [ 2]  127 	ldw	x, (0x05, sp)
      009E73 F6               [ 1]  128 	ld	a, (x)
      009E74 1A 0C            [ 1]  129 	or	a, (0x0c, sp)
      009E76 1E 05            [ 2]  130 	ldw	x, (0x05, sp)
      009E78 F7               [ 1]  131 	ld	(x), a
      009E79 20 08            [ 2]  132 	jra	00109$
      009E7B                        133 00108$:
                                    134 ;	lib/stm8s_gpio.c: 54: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      009E7B 1E 05            [ 2]  135 	ldw	x, (0x05, sp)
      009E7D F6               [ 1]  136 	ld	a, (x)
      009E7E 14 07            [ 1]  137 	and	a, (0x07, sp)
      009E80 1E 05            [ 2]  138 	ldw	x, (0x05, sp)
      009E82 F7               [ 1]  139 	ld	(x), a
      009E83                        140 00109$:
                                    141 ;	lib/stm8s_gpio.c: 59: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
      009E83 7B 0D            [ 1]  142 	ld	a, (0x0d, sp)
      009E85 A5 20            [ 1]  143 	bcp	a, #0x20
      009E87 27 08            [ 1]  144 	jreq	00111$
                                    145 ;	lib/stm8s_gpio.c: 61: GPIOx->CR2 |= (uint8_t)GPIO_Pin;
      009E89 90 F6            [ 1]  146 	ld	a, (y)
      009E8B 1A 0C            [ 1]  147 	or	a, (0x0c, sp)
      009E8D 90 F7            [ 1]  148 	ld	(y), a
      009E8F 20 06            [ 2]  149 	jra	00113$
      009E91                        150 00111$:
                                    151 ;	lib/stm8s_gpio.c: 65: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      009E91 90 F6            [ 1]  152 	ld	a, (y)
      009E93 14 07            [ 1]  153 	and	a, (0x07, sp)
      009E95 90 F7            [ 1]  154 	ld	(y), a
      009E97                        155 00113$:
      009E97 5B 07            [ 2]  156 	addw	sp, #7
      009E99 81               [ 4]  157 	ret
                                    158 ;	lib/stm8s_gpio.c: 69: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
                                    159 ;	-----------------------------------------
                                    160 ;	 function GPIO_Write
                                    161 ;	-----------------------------------------
      009E9A                        162 _GPIO_Write:
                                    163 ;	lib/stm8s_gpio.c: 71: GPIOx->ODR = PortVal;
      009E9A 1E 03            [ 2]  164 	ldw	x, (0x03, sp)
      009E9C 7B 05            [ 1]  165 	ld	a, (0x05, sp)
      009E9E F7               [ 1]  166 	ld	(x), a
      009E9F 81               [ 4]  167 	ret
                                    168 ;	lib/stm8s_gpio.c: 74: void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    169 ;	-----------------------------------------
                                    170 ;	 function GPIO_WriteHigh
                                    171 ;	-----------------------------------------
      009EA0                        172 _GPIO_WriteHigh:
                                    173 ;	lib/stm8s_gpio.c: 76: GPIOx->ODR |= (uint8_t)PortPins;
      009EA0 1E 03            [ 2]  174 	ldw	x, (0x03, sp)
      009EA2 F6               [ 1]  175 	ld	a, (x)
      009EA3 1A 05            [ 1]  176 	or	a, (0x05, sp)
      009EA5 F7               [ 1]  177 	ld	(x), a
      009EA6 81               [ 4]  178 	ret
                                    179 ;	lib/stm8s_gpio.c: 79: void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    180 ;	-----------------------------------------
                                    181 ;	 function GPIO_WriteLow
                                    182 ;	-----------------------------------------
      009EA7                        183 _GPIO_WriteLow:
      009EA7 88               [ 1]  184 	push	a
                                    185 ;	lib/stm8s_gpio.c: 81: GPIOx->ODR &= (uint8_t)(~PortPins);
      009EA8 1E 04            [ 2]  186 	ldw	x, (0x04, sp)
      009EAA F6               [ 1]  187 	ld	a, (x)
      009EAB 6B 01            [ 1]  188 	ld	(0x01, sp), a
      009EAD 7B 06            [ 1]  189 	ld	a, (0x06, sp)
      009EAF 43               [ 1]  190 	cpl	a
      009EB0 14 01            [ 1]  191 	and	a, (0x01, sp)
      009EB2 F7               [ 1]  192 	ld	(x), a
      009EB3 84               [ 1]  193 	pop	a
      009EB4 81               [ 4]  194 	ret
                                    195 ;	lib/stm8s_gpio.c: 84: void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    196 ;	-----------------------------------------
                                    197 ;	 function GPIO_WriteReverse
                                    198 ;	-----------------------------------------
      009EB5                        199 _GPIO_WriteReverse:
                                    200 ;	lib/stm8s_gpio.c: 86: GPIOx->ODR ^= (uint8_t)PortPins;
      009EB5 1E 03            [ 2]  201 	ldw	x, (0x03, sp)
      009EB7 F6               [ 1]  202 	ld	a, (x)
      009EB8 18 05            [ 1]  203 	xor	a, (0x05, sp)
      009EBA F7               [ 1]  204 	ld	(x), a
      009EBB 81               [ 4]  205 	ret
                                    206 ;	lib/stm8s_gpio.c: 89: uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
                                    207 ;	-----------------------------------------
                                    208 ;	 function GPIO_ReadOutputData
                                    209 ;	-----------------------------------------
      009EBC                        210 _GPIO_ReadOutputData:
                                    211 ;	lib/stm8s_gpio.c: 91: return ((uint8_t)GPIOx->ODR);
      009EBC 1E 03            [ 2]  212 	ldw	x, (0x03, sp)
      009EBE F6               [ 1]  213 	ld	a, (x)
      009EBF 81               [ 4]  214 	ret
                                    215 ;	lib/stm8s_gpio.c: 94: uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
                                    216 ;	-----------------------------------------
                                    217 ;	 function GPIO_ReadInputData
                                    218 ;	-----------------------------------------
      009EC0                        219 _GPIO_ReadInputData:
                                    220 ;	lib/stm8s_gpio.c: 96: return ((uint8_t)GPIOx->IDR);
      009EC0 1E 03            [ 2]  221 	ldw	x, (0x03, sp)
      009EC2 E6 01            [ 1]  222 	ld	a, (0x1, x)
      009EC4 81               [ 4]  223 	ret
                                    224 ;	lib/stm8s_gpio.c: 99: BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    225 ;	-----------------------------------------
                                    226 ;	 function GPIO_ReadInputPin
                                    227 ;	-----------------------------------------
      009EC5                        228 _GPIO_ReadInputPin:
                                    229 ;	lib/stm8s_gpio.c: 101: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
      009EC5 1E 03            [ 2]  230 	ldw	x, (0x03, sp)
      009EC7 E6 01            [ 1]  231 	ld	a, (0x1, x)
      009EC9 14 05            [ 1]  232 	and	a, (0x05, sp)
      009ECB 81               [ 4]  233 	ret
                                    234 ;	lib/stm8s_gpio.c: 104: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
                                    235 ;	-----------------------------------------
                                    236 ;	 function GPIO_ExternalPullUpConfig
                                    237 ;	-----------------------------------------
      009ECC                        238 _GPIO_ExternalPullUpConfig:
      009ECC 88               [ 1]  239 	push	a
                                    240 ;	lib/stm8s_gpio.c: 108: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      009ECD 1E 04            [ 2]  241 	ldw	x, (0x04, sp)
      009ECF 1C 00 03         [ 2]  242 	addw	x, #0x0003
                                    243 ;	lib/stm8s_gpio.c: 106: if (NewState != DISABLE) /* External Pull-Up Set*/
      009ED2 0D 07            [ 1]  244 	tnz	(0x07, sp)
      009ED4 27 06            [ 1]  245 	jreq	00102$
                                    246 ;	lib/stm8s_gpio.c: 108: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      009ED6 F6               [ 1]  247 	ld	a, (x)
      009ED7 1A 06            [ 1]  248 	or	a, (0x06, sp)
      009ED9 F7               [ 1]  249 	ld	(x), a
      009EDA 20 09            [ 2]  250 	jra	00104$
      009EDC                        251 00102$:
                                    252 ;	lib/stm8s_gpio.c: 111: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      009EDC F6               [ 1]  253 	ld	a, (x)
      009EDD 6B 01            [ 1]  254 	ld	(0x01, sp), a
      009EDF 7B 06            [ 1]  255 	ld	a, (0x06, sp)
      009EE1 43               [ 1]  256 	cpl	a
      009EE2 14 01            [ 1]  257 	and	a, (0x01, sp)
      009EE4 F7               [ 1]  258 	ld	(x), a
      009EE5                        259 00104$:
      009EE5 84               [ 1]  260 	pop	a
      009EE6 81               [ 4]  261 	ret
                                    262 	.area CODE
                                    263 	.area INITIALIZER
                                    264 	.area CABS (ABS)
