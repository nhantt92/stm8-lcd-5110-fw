;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module lcd5110
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _LcdIvertLineFragment
	.globl _LcdIvertLine
	.globl _memset
	.globl _memcpy
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _LcdInit
	.globl _LcdClear
	.globl _LcdUpdate
	.globl _LcdContrast
	.globl _LcdGotoXYFont
	.globl _LcdChar
	.globl _LcdStr
	.globl _LcdFStr
	.globl _LcdPixel
	.globl _LcdLine
	.globl _LcdCircle
	.globl _LcdRect
	.globl _LcdImage
	.globl _LcdWriteToCache
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_LcdCache:
	.ds 504
_BottomCacheMark:
	.ds 2
_TopCacheMark:
	.ds 2
_LcdCacheIdx:
	.ds 2
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
;	user/lcd5110.c: 17: void LcdInit(void)
;	-----------------------------------------
;	 function LcdInit
;	-----------------------------------------
_LcdInit:
;	user/lcd5110.c: 19: GPIO_Init(GPIOC, LCD_SDIN_PIN|LCD_SCLK_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
	push	#0xc0
	push	#0x60
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/lcd5110.c: 20: GPIO_Init(GPIOD, LCD_DC_PIN|LCD_CE_PIN|LCD_RST_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
	push	#0xc0
	push	#0x0e
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/lcd5110.c: 21: SET_RST;
	push	#0x08
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/lcd5110.c: 22: RESET_DC;
	push	#0x02
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/lcd5110.c: 23: RESET_CE;
	push	#0x04
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/lcd5110.c: 24: RESET_SDIN;
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/lcd5110.c: 25: RESET_SCLK;
	push	#0x20
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/lcd5110.c: 28: RESET_RST;
	push	#0x08
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/lcd5110.c: 29: SET_RST;
	push	#0x08
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/lcd5110.c: 32: SET_CE;
	push	#0x04
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/lcd5110.c: 35: LcdSend(0x21, LCD_CMD); // LCD Extended Commands
	push	#0x00
	push	#0x21
	call	_LcdSend
	popw	x
;	user/lcd5110.c: 36: LcdSend(0xC8, LCD_CMD); // Set Contrast (LCD Vop)
	push	#0x00
	push	#0xc8
	call	_LcdSend
	popw	x
;	user/lcd5110.c: 37: LcdSend(0x06, LCD_CMD); // Set Temperature coefficent
	push	#0x00
	push	#0x06
	call	_LcdSend
	popw	x
;	user/lcd5110.c: 38: LcdSend(0x13, LCD_CMD); // LCD bias mode 1:48
	push	#0x00
	push	#0x13
	call	_LcdSend
	popw	x
;	user/lcd5110.c: 39: LcdSend(0x20, LCD_CMD); // LCD Standard Commands and Horizontal addressing mode
	push	#0x00
	push	#0x20
	call	_LcdSend
	popw	x
;	user/lcd5110.c: 40: LcdSend(0x0C, LCD_CMD); // LCD in normal mode
	push	#0x00
	push	#0x0c
	call	_LcdSend
	popw	x
;	user/lcd5110.c: 43: LcdClear();
	call	_LcdClear
;	user/lcd5110.c: 44: LcdUpdate();
	jp	_LcdUpdate
;	user/lcd5110.c: 47: void LcdClear(void)
;	-----------------------------------------
;	 function LcdClear
;	-----------------------------------------
_LcdClear:
;	user/lcd5110.c: 50: memset(LcdCache, 0x00, LCD_CACHE_SIZE);
	ldw	x, #_LcdCache+0
	push	#0xf8
	push	#0x01
	push	#0x00
	push	#0x00
	pushw	x
	call	_memset
	addw	sp, #6
;	user/lcd5110.c: 52: BottomCacheMark = 0;
	clrw	x
	ldw	_BottomCacheMark+0, x
;	user/lcd5110.c: 53: TopCacheMark = LCD_CACHE_SIZE - 1;
	ldw	x, #0x01f7
	ldw	_TopCacheMark+0, x
	ret
;	user/lcd5110.c: 56: void LcdUpdate(void)
;	-----------------------------------------
;	 function LcdUpdate
;	-----------------------------------------
_LcdUpdate:
	pushw	x
;	user/lcd5110.c: 59: if(BottomCacheMark < 0) BottomCacheMark = 0;
	ldw	x, _BottomCacheMark+0
	tnzw	x
	jrpl	00104$
	clrw	x
	ldw	_BottomCacheMark+0, x
	jra	00105$
00104$:
;	user/lcd5110.c: 60: else if(BottomCacheMark >= LCD_CACHE_SIZE) BottomCacheMark = LCD_CACHE_SIZE - 1;
	ldw	x, _BottomCacheMark+0
	cpw	x, #0x01f8
	jrslt	00105$
	ldw	x, #0x01f7
	ldw	_BottomCacheMark+0, x
00105$:
;	user/lcd5110.c: 61: if(TopCacheMark < 0) TopCacheMark = 0;
	ldw	x, _TopCacheMark+0
	tnzw	x
	jrpl	00109$
	clrw	x
	ldw	_TopCacheMark+0, x
	jra	00110$
00109$:
;	user/lcd5110.c: 62: else if(TopCacheMark >= LCD_CACHE_SIZE) TopCacheMark = LCD_CACHE_SIZE - 1;
	ldw	x, _TopCacheMark+0
	cpw	x, #0x01f8
	jrslt	00110$
	ldw	x, #0x01f7
	ldw	_TopCacheMark+0, x
00110$:
;	user/lcd5110.c: 65: LcdSend(0x80 | (BottomCacheMark % LCD_X_RES), LCD_CMD);
	push	#0x54
	push	#0x00
	ldw	x, _BottomCacheMark+0
	pushw	x
	call	__modsint
	addw	sp, #4
	ld	a, xl
	or	a, #0x80
	push	a
	pop	a
	push	#0x00
	push	a
	call	_LcdSend
	popw	x
;	user/lcd5110.c: 66: LcdSend(0x40 | (BottomCacheMark / LCD_X_RES), LCD_CMD);
	push	#0x54
	push	#0x00
	ldw	x, _BottomCacheMark+0
	pushw	x
	call	__divsint
	addw	sp, #4
	ld	a, xl
	or	a, #0x40
	push	a
	pop	a
	push	#0x00
	push	a
	call	_LcdSend
	popw	x
;	user/lcd5110.c: 69: for (i = BottomCacheMark; i <= TopCacheMark; i++)
	ld	a, _BottomCacheMark+1
	ldw	x, #_LcdCache+0
	ldw	(0x01, sp), x
00113$:
	clrw	x
	ld	xl, a
	cpw	x, _TopCacheMark+0
	jrsgt	00111$
;	user/lcd5110.c: 71: LcdSend(LcdCache[i], LCD_DATA);
	clrw	x
	ld	xl, a
	addw	x, (0x01, sp)
	push	a
	ld	a, (x)
	ld	xl, a
	pop	a
	push	a
	push	#0x01
	pushw	x
	addw	sp, #1
	call	_LcdSend
	popw	x
	pop	a
;	user/lcd5110.c: 69: for (i = BottomCacheMark; i <= TopCacheMark; i++)
	inc	a
	jra	00113$
00111$:
;	user/lcd5110.c: 75: BottomCacheMark = LCD_CACHE_SIZE - 1;
	ldw	x, #0x01f7
	ldw	_BottomCacheMark+0, x
;	user/lcd5110.c: 76: TopCacheMark = 0;
	clrw	x
	ldw	_TopCacheMark+0, x
	popw	x
	ret
;	user/lcd5110.c: 80: static void LcdVSPI(uint8_t data)
;	-----------------------------------------
;	 function LcdVSPI
;	-----------------------------------------
_LcdVSPI:
	push	a
;	user/lcd5110.c: 83: for(i = 0; i < 8; i++, data = data << 1)
	clr	(0x01, sp)
00105$:
;	user/lcd5110.c: 85: if((data & 0x80) == 0x80) SET_SDIN;
	ld	a, (0x04, sp)
	and	a, #0x80
	cp	a, #0x80
	jrne	00102$
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	jra	00103$
00102$:
;	user/lcd5110.c: 86: else RESET_SDIN;
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
00103$:
;	user/lcd5110.c: 87: SET_SCLK;
	push	#0x20
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/lcd5110.c: 88: RESET_SCLK;
	push	#0x20
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/lcd5110.c: 83: for(i = 0; i < 8; i++, data = data << 1)
	inc	(0x01, sp)
	sll	(0x04, sp)
	ld	a, (0x01, sp)
	cp	a, #0x08
	jrc	00105$
	pop	a
	ret
;	user/lcd5110.c: 93: static void LcdSend(uint8_t data, uint8_t cmd)
;	-----------------------------------------
;	 function LcdSend
;	-----------------------------------------
_LcdSend:
;	user/lcd5110.c: 96: RESET_CE;
	push	#0x04
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/lcd5110.c: 97: if(cmd = LCD_DATA) SET_DC;
	push	#0x02
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/lcd5110.c: 99: LcdVSPI(data);
	ld	a, (0x03, sp)
	push	a
	call	_LcdVSPI
	pop	a
;	user/lcd5110.c: 101: SET_CE;
	push	#0x04
	push	#0x0f
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	ret
;	user/lcd5110.c: 105: void LcdContrast (uint8_t contrast )
;	-----------------------------------------
;	 function LcdContrast
;	-----------------------------------------
_LcdContrast:
;	user/lcd5110.c: 107: LcdSend(0x21, LCD_CMD);              // LCD Extended Commands
	push	#0x00
	push	#0x21
	call	_LcdSend
	popw	x
;	user/lcd5110.c: 108: LcdSend(0x80 | contrast, LCD_CMD);   // Set contrast
	ld	a, (0x03, sp)
	or	a, #0x80
	push	#0x00
	push	a
	call	_LcdSend
	popw	x
;	user/lcd5110.c: 109: LcdSend(0x20, LCD_CMD);              // LCD Standard Commands
	push	#0x00
	push	#0x20
	call	_LcdSend
	popw	x
	ret
;	user/lcd5110.c: 113: uint8_t LcdGotoXYFont(uint8_t x, uint8_t y)
;	-----------------------------------------
;	 function LcdGotoXYFont
;	-----------------------------------------
_LcdGotoXYFont:
	pushw	x
;	user/lcd5110.c: 115: if(x > 13 || y > 5) return OUT_OF_BORDER;
	ld	a, (0x05, sp)
	cp	a, #0x0d
	jrugt	00101$
	ld	a, (0x06, sp)
	cp	a, #0x05
	jrule	00102$
00101$:
	ld	a, #0x01
	jra	00104$
00102$:
;	user/lcd5110.c: 117: LcdCacheIdx = x * 6 + y * 84;
	ld	a, (0x05, sp)
	ld	xl, a
	ld	a, #0x06
	mul	x, a
	ldw	(0x01, sp), x
	ld	a, (0x06, sp)
	ld	xl, a
	ld	a, #0x54
	mul	x, a
	addw	x, (0x01, sp)
	ldw	_LcdCacheIdx+0, x
;	user/lcd5110.c: 118: return OK;
	clr	a
00104$:
	popw	x
	ret
;	user/lcd5110.c: 123: uint8_t LcdChar(LcdFontSize size, uint8_t ch)
;	-----------------------------------------
;	 function LcdChar
;	-----------------------------------------
_LcdChar:
	sub	sp, #47
;	user/lcd5110.c: 129: if (LcdCacheIdx < BottomCacheMark)
	ldw	x, _BottomCacheMark+0
	cpw	x, _LcdCacheIdx+0
	jrsle	00102$
;	user/lcd5110.c: 132: BottomCacheMark = LcdCacheIdx;
	ldw	x, _LcdCacheIdx+0
	ldw	_BottomCacheMark+0, x
00102$:
;	user/lcd5110.c: 135: if ( (ch >= 0x20) && (ch <= 0x7F) )
	ld	a, (0x33, sp)
	cp	a, #0x20
	jrc	00107$
	ld	a, (0x33, sp)
	cp	a, #0x7f
	jrugt	00107$
;	user/lcd5110.c: 138: ch -= 32;
	ld	a, (0x33, sp)
	sub	a, #0x20
	ld	(0x33, sp), a
	jra	00108$
00107$:
;	user/lcd5110.c: 140: else if (ch >= 0xC0)
	ld	a, (0x33, sp)
	cp	a, #0xc0
	jrc	00104$
;	user/lcd5110.c: 143: ch -= 96;
	ld	a, (0x33, sp)
	sub	a, #0x60
	ld	(0x33, sp), a
	jra	00108$
00104$:
;	user/lcd5110.c: 148: ch = 95;
	ld	a, #0x5f
	ld	(0x33, sp), a
00108$:
;	user/lcd5110.c: 153: for (i = 0; i < 5; i++)
	ld	a, (0x33, sp)
	ld	xl, a
	ld	a, #0x05
	mul	x, a
	ldw	(0x25, sp), x
;	user/lcd5110.c: 151: if (size == FONT_1X)
	tnz	(0x32, sp)
	jrne	00147$
;	user/lcd5110.c: 153: for (i = 0; i < 5; i++)
	ldw	x, #_LcdCache+0
	ldw	(0x04, sp), x
	ldw	x, #_FontLookup+0
	addw	x, (0x25, sp)
	ldw	(0x1a, sp), x
	clr	a
00153$:
;	user/lcd5110.c: 156: LcdCache[LcdCacheIdx++] = *( &(FontLookup[ch][i]) ) << 1;
	ldw	y, _LcdCacheIdx+0
	ldw	x, _LcdCacheIdx+0
	incw	x
	ldw	_LcdCacheIdx+0, x
	addw	y, (0x04, sp)
	clrw	x
	ld	xl, a
	addw	x, (0x1a, sp)
	push	a
	ld	a, (x)
	ld	xl, a
	pop	a
	sllw	x
	push	a
	ld	a, xl
	ld	(y), a
	pop	a
;	user/lcd5110.c: 153: for (i = 0; i < 5; i++)
	inc	a
	cp	a, #0x05
	jrc	00153$
	jp	00148$
00147$:
;	user/lcd5110.c: 161: tmpIdx = LcdCacheIdx - 84;
	ldw	x, _LcdCacheIdx+0
	subw	x, #0x0054
;	user/lcd5110.c: 172: if ((ch > 15) & (ch < 26)) {
	ld	a, (0x33, sp)
	cp	a, #0x0f
	jrugt	00277$
	clr	(0x24, sp)
	jra	00278$
00277$:
	ld	a, #0x01
	ld	(0x24, sp), a
00278$:
	ld	a, (0x33, sp)
	cp	a, #0x1a
	clr	a
	rlc	a
;	user/lcd5110.c: 173: ch -= 16;
	push	a
	ld	a, (0x34, sp)
	sub	a, #0x10
	ld	(0x18, sp), a
	pop	a
;	user/lcd5110.c: 172: if ((ch > 15) & (ch < 26)) {
	and	a, (0x24, sp)
	ld	(0x27, sp), a
;	user/lcd5110.c: 159: else if (size == FONT_2X)
	ld	a, (0x32, sp)
	cp	a, #0x01
	jreq	00281$
	jp	00144$
00281$:
;	user/lcd5110.c: 161: tmpIdx = LcdCacheIdx - 84;
	ldw	(0x18, sp), x
;	user/lcd5110.c: 163: if (tmpIdx < BottomCacheMark)
	ldw	x, (0x18, sp)
	cpw	x, _BottomCacheMark+0
	jrsge	00112$
;	user/lcd5110.c: 165: BottomCacheMark = tmpIdx;
	ld	a, (0x19, sp)
	ld	_BottomCacheMark+1, a
	ld	a, (0x18, sp)
	ld	_BottomCacheMark+0, a
00112$:
;	user/lcd5110.c: 168: if (tmpIdx < 0) return OUT_OF_BORDER;
	tnz	(0x18, sp)
	jrpl	00114$
	ld	a, #0x01
	jp	00161$
00114$:
;	user/lcd5110.c: 172: if ((ch > 15) & (ch < 26)) {
	tnz	(0x27, sp)
	jreq	00176$
;	user/lcd5110.c: 173: ch -= 16;
	ld	a, (0x17, sp)
	ld	(0x33, sp), a
;	user/lcd5110.c: 174: for (i = 0; i < 10; i++)
	ldw	x, #_LcdCache+0
	ldw	(0x28, sp), x
	ldw	x, #_BigNumbers+0
	ldw	(0x0a, sp), x
	ld	a, (0x33, sp)
	ld	xl, a
	ld	a, #0x14
	mul	x, a
	addw	x, (0x0a, sp)
	ldw	(0x15, sp), x
	ldw	y, (0x18, sp)
	ldw	(0x13, sp), y
	clr	(0x01, sp)
00155$:
;	user/lcd5110.c: 176: LcdCache[tmpIdx++] = *(&(BigNumbers[ch][i]));
	ldw	y, (0x13, sp)
	ldw	(0x11, sp), y
	ldw	x, (0x13, sp)
	incw	x
	ldw	(0x13, sp), x
	ldw	y, (0x28, sp)
	addw	y, (0x11, sp)
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, (0x15, sp)
	ld	a, (x)
	ld	(y), a
;	user/lcd5110.c: 177: LcdCache[tmpIdx+83] = *(&(BigNumbers[ch][10+i]));
	ldw	y, (0x13, sp)
	addw	y, #0x0053
	addw	y, (0x28, sp)
	ld	a, (0x01, sp)
	add	a, #0x0a
	clrw	x
	ld	xl, a
	addw	x, (0x15, sp)
	ld	a, (x)
	ld	(y), a
;	user/lcd5110.c: 174: for (i = 0; i < 10; i++)
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x0a
	jrc	00155$
	jp	00119$
;	user/lcd5110.c: 181: for (i = 0; i < 5; i++)
00176$:
	ldw	x, #_FontLookup+0
	addw	x, (0x25, sp)
	ldw	(0x08, sp), x
	ldw	x, #_LcdCache+0
	ldw	(0x22, sp), x
	clr	(0x01, sp)
00157$:
;	user/lcd5110.c: 184: c = *(&(FontLookup[ch][i])) << 1;
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, (0x08, sp)
	ld	a, (x)
	sll	a
;	user/lcd5110.c: 187: b1 =  (c & 0x01) * 3;
	ld	yl, a
	and	a, #0x01
	ld	xl, a
	ld	a, #0x03
	mul	x, a
	ld	a, xl
	ld	(0x10, sp), a
;	user/lcd5110.c: 188: b1 |= (c & 0x02) * 6;
	ld	a, yl
	and	a, #0x02
	ld	xl, a
	ld	a, #0x06
	mul	x, a
	ld	a, xl
	or	a, (0x10, sp)
	ld	(0x06, sp), a
;	user/lcd5110.c: 189: b1 |= (c & 0x04) * 12;
	ld	a, yl
	and	a, #0x04
	ld	xl, a
	ld	a, #0x0c
	mul	x, a
	ld	a, xl
	or	a, (0x06, sp)
	ld	(0x03, sp), a
;	user/lcd5110.c: 190: b1 |= (c & 0x08) * 24;
	ld	a, yl
	and	a, #0x08
	ld	xl, a
	ld	a, #0x18
	mul	x, a
	ld	a, xl
	or	a, (0x03, sp)
	ld	(0x0f, sp), a
;	user/lcd5110.c: 192: c >>= 4;
	exg	a, yl
	swap	a
	and	a, #0x0f
	exg	a, yl
;	user/lcd5110.c: 194: b2 =  (c & 0x01) * 3;
	ld	a, yl
	and	a, #0x01
	ld	xl, a
	ld	a, #0x03
	mul	x, a
	ld	a, xl
	ld	(0x0e, sp), a
;	user/lcd5110.c: 195: b2 |= (c & 0x02) * 6;
	ld	a, yl
	and	a, #0x02
	ld	xl, a
	ld	a, #0x06
	mul	x, a
	ld	a, xl
	or	a, (0x0e, sp)
	ld	(0x07, sp), a
;	user/lcd5110.c: 196: b2 |= (c & 0x04) * 12;
	ld	a, yl
	and	a, #0x04
	ld	xl, a
	ld	a, #0x0c
	mul	x, a
	ld	a, xl
	or	a, (0x07, sp)
	ld	(0x02, sp), a
;	user/lcd5110.c: 197: b2 |= (c & 0x08) * 24;
	ld	a, yl
	and	a, #0x08
	ld	xl, a
	ld	a, #0x18
	mul	x, a
	ld	a, xl
	or	a, (0x02, sp)
;	user/lcd5110.c: 200: LcdCache[tmpIdx++] = b1;
	ldw	y, (0x18, sp)
	ldw	x, (0x18, sp)
	incw	x
	addw	y, (0x22, sp)
	push	a
	ld	a, (0x10, sp)
	ld	(y), a
	pop	a
;	user/lcd5110.c: 201: LcdCache[tmpIdx++] = b1;
	ldw	(0x1c, sp), x
	incw	x
	ldw	(0x18, sp), x
	ldw	x, (0x22, sp)
	addw	x, (0x1c, sp)
	push	a
	ld	a, (0x10, sp)
	ld	(x), a
	pop	a
;	user/lcd5110.c: 202: LcdCache[tmpIdx + 82] = b2;
	ldw	x, (0x18, sp)
	addw	x, #0x0052
	addw	x, (0x22, sp)
	ld	(x), a
;	user/lcd5110.c: 203: LcdCache[tmpIdx + 83] = b2;
	ldw	x, (0x18, sp)
	addw	x, #0x0053
	addw	x, (0x22, sp)
	ld	(x), a
;	user/lcd5110.c: 181: for (i = 0; i < 5; i++)
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x05
	jrnc	00286$
	jp	00157$
00286$:
00119$:
;	user/lcd5110.c: 208: LcdCacheIdx = (LcdCacheIdx + 11) % LCD_CACHE_SIZE;
	ldw	x, _LcdCacheIdx+0
	addw	x, #0x000b
	push	#0xf8
	push	#0x01
	pushw	x
	call	__modsint
	addw	sp, #4
	ldw	_LcdCacheIdx+0, x
	jp	00148$
00144$:
;	user/lcd5110.c: 210: else if (size == FONT_4X) {
	ld	a, (0x32, sp)
	cp	a, #0x02
	jreq	00289$
	jp	00148$
00289$:
;	user/lcd5110.c: 211: tmpIdx = LcdCacheIdx - 84;
	ldw	(0x2c, sp), x
;	user/lcd5110.c: 213: if (tmpIdx < BottomCacheMark)
	ldw	x, (0x2c, sp)
	cpw	x, _BottomCacheMark+0
	jrsge	00121$
;	user/lcd5110.c: 215: BottomCacheMark = tmpIdx;
	ld	a, (0x2d, sp)
	ld	_BottomCacheMark+1, a
	ld	a, (0x2c, sp)
	ld	_BottomCacheMark+0, a
00121$:
;	user/lcd5110.c: 218: if (tmpIdx < 0) return OUT_OF_BORDER;
	tnz	(0x2c, sp)
	jrpl	00123$
	ld	a, #0x01
	jp	00161$
00123$:
;	user/lcd5110.c: 223: if ((ch > 15) & (ch < 26)) {
	tnz	(0x27, sp)
	jreq	00134$
;	user/lcd5110.c: 224: ch -= 16;
	ld	a, (0x17, sp)
	ld	(0x33, sp), a
	jra	00135$
00134$:
;	user/lcd5110.c: 226: else if (ch == 43-32) { // +
	ld	a, (0x33, sp)
	cp	a, #0x0b
	jrne	00131$
;	user/lcd5110.c: 227: ch = 10;
	ld	a, #0x0a
	ld	(0x33, sp), a
	jra	00135$
00131$:
;	user/lcd5110.c: 229: else if (ch == 45-32) { // -
	ld	a, (0x33, sp)
	cp	a, #0x0d
	jrne	00128$
;	user/lcd5110.c: 230: ch = 11;
	ld	a, #0x0b
	ld	(0x33, sp), a
	jra	00135$
00128$:
;	user/lcd5110.c: 232: else if (ch == 46-32) { // .
	ld	a, (0x33, sp)
	cp	a, #0x0e
	jrne	00125$
;	user/lcd5110.c: 233: ch = 12;
	ld	a, #0x0c
	ld	(0x33, sp), a
	jra	00135$
00125$:
;	user/lcd5110.c: 236: ch= 255;
	ld	a, #0xff
	ld	(0x33, sp), a
00135$:
;	user/lcd5110.c: 239: if (ch != 255) {
	ld	a, (0x33, sp)
	cp	a, #0xff
	jreq	00138$
;	user/lcd5110.c: 240: for (i = 0; i < 20; i++)
	ldw	x, #_LcdCache+0
	ldw	(0x2e, sp), x
	ldw	x, #_LargeNumbers+0
	ldw	(0x1e, sp), x
	ld	a, (0x33, sp)
	ld	xl, a
	ld	a, #0x50
	mul	x, a
	addw	x, (0x1e, sp)
	ldw	(0x0c, sp), x
	ldw	y, (0x2c, sp)
	ldw	(0x20, sp), y
	clr	(0x01, sp)
00159$:
;	user/lcd5110.c: 242: LcdCache[tmpIdx++] = *(&(LargeNumbers[ch][i]));
	ldw	y, (0x20, sp)
	ldw	(0x2a, sp), y
	ldw	x, (0x20, sp)
	incw	x
	ldw	(0x20, sp), x
	ldw	y, (0x2e, sp)
	addw	y, (0x2a, sp)
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, (0x0c, sp)
	ld	a, (x)
	ld	(y), a
;	user/lcd5110.c: 243: LcdCache[tmpIdx+83] = *(&(LargeNumbers[ch][20+i]));
	ldw	y, (0x20, sp)
	addw	y, #0x0053
	addw	y, (0x2e, sp)
	ld	a, (0x01, sp)
	add	a, #0x14
	clrw	x
	ld	xl, a
	addw	x, (0x0c, sp)
	ld	a, (x)
	ld	(y), a
;	user/lcd5110.c: 244: LcdCache[tmpIdx+167] = *(&(LargeNumbers[ch][40+i]));
	ldw	y, (0x20, sp)
	addw	y, #0x00a7
	addw	y, (0x2e, sp)
	ld	a, (0x01, sp)
	add	a, #0x28
	clrw	x
	ld	xl, a
	addw	x, (0x0c, sp)
	ld	a, (x)
	ld	(y), a
;	user/lcd5110.c: 245: LcdCache[tmpIdx+251] = *(&(LargeNumbers[ch][60+i]));
	ldw	y, (0x20, sp)
	addw	y, #0x00fb
	addw	y, (0x2e, sp)
	ld	a, (0x01, sp)
	add	a, #0x3c
	clrw	x
	ld	xl, a
	addw	x, (0x0c, sp)
	ld	a, (x)
	ld	(y), a
;	user/lcd5110.c: 240: for (i = 0; i < 20; i++)
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x14
	jrc	00159$
00138$:
;	user/lcd5110.c: 250: LcdCacheIdx = (LcdCacheIdx + 20) % LCD_CACHE_SIZE;
	ldw	x, _LcdCacheIdx+0
	addw	x, #0x0014
	push	#0xf8
	push	#0x01
	pushw	x
	call	__modsint
	addw	sp, #4
	ldw	_LcdCacheIdx+0, x
;	user/lcd5110.c: 252: if (ch == 12) { // .
	ld	a, (0x33, sp)
	cp	a, #0x0c
	jrne	00148$
;	user/lcd5110.c: 253: LcdCacheIdx -=5;
	ldw	x, _LcdCacheIdx+0
	subw	x, #0x0005
	ldw	_LcdCacheIdx+0, x
00148$:
;	user/lcd5110.c: 257: if (LcdCacheIdx > TopCacheMark)
	ldw	x, _TopCacheMark+0
	cpw	x, _LcdCacheIdx+0
	jrsge	00150$
;	user/lcd5110.c: 260: TopCacheMark = LcdCacheIdx;
	ldw	x, _LcdCacheIdx+0
	ldw	_TopCacheMark+0, x
00150$:
;	user/lcd5110.c: 264: LcdCache[LcdCacheIdx] = 0x00;
	ldw	x, #_LcdCache+0
	addw	x, _LcdCacheIdx+0
	clr	(x)
;	user/lcd5110.c: 266: if(LcdCacheIdx == (LCD_CACHE_SIZE - 1))
	ldw	x, _LcdCacheIdx+0
	cpw	x, #0x01f7
	jrne	00152$
;	user/lcd5110.c: 268: LcdCacheIdx = 0;
	clrw	x
	ldw	_LcdCacheIdx+0, x
;	user/lcd5110.c: 269: return OK_WITH_WRAP;
	ld	a, #0x02
	jra	00161$
00152$:
;	user/lcd5110.c: 272: LcdCacheIdx++;
	ldw	x, _LcdCacheIdx+0
	incw	x
	ldw	_LcdCacheIdx+0, x
;	user/lcd5110.c: 273: return OK;
	clr	a
00161$:
	addw	sp, #47
	ret
;	user/lcd5110.c: 277: uint8_t LcdStr(LcdFontSize size, uint8_t dataArray[])
;	-----------------------------------------
;	 function LcdStr
;	-----------------------------------------
_LcdStr:
	push	a
;	user/lcd5110.c: 281: while( dataArray[ tmpIdx ] != '\0' )
	clr	(0x01, sp)
00103$:
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, (0x05, sp)
	ld	a, (x)
	tnz	a
	jreq	00105$
;	user/lcd5110.c: 283: response = LcdChar(size, dataArray[ tmpIdx ]);
	push	a
	ld	a, (0x05, sp)
	push	a
	call	_LcdChar
	popw	x
;	user/lcd5110.c: 284: if( response == OUT_OF_BORDER)
	cp	a, #0x01
	jrne	00102$
;	user/lcd5110.c: 285: return OUT_OF_BORDER;
	ld	a, #0x01
	jra	00106$
00102$:
;	user/lcd5110.c: 286: tmpIdx++;
	inc	(0x01, sp)
	jra	00103$
00105$:
;	user/lcd5110.c: 288: return OK;
	clr	a
00106$:
	addw	sp, #1
	ret
;	user/lcd5110.c: 292: uint8_t LcdFStr(LcdFontSize size, const uint8_t *dataPtr)
;	-----------------------------------------
;	 function LcdFStr
;	-----------------------------------------
_LcdFStr:
	pushw	x
;	user/lcd5110.c: 296: for (c = *( dataPtr ); c; ++dataPtr, c = *( dataPtr ))
	ldw	x, (0x06, sp)
	ld	a, (x)
	ldw	(0x01, sp), x
00105$:
	tnz	a
	jreq	00103$
;	user/lcd5110.c: 298: response = LcdChar(size, c );
	push	a
	ld	a, (0x06, sp)
	push	a
	call	_LcdChar
	popw	x
;	user/lcd5110.c: 299: if(response == OUT_OF_BORDER)
	cp	a, #0x01
	jrne	00106$
;	user/lcd5110.c: 300: return OUT_OF_BORDER;
	ld	a, #0x01
	jra	00107$
00106$:
;	user/lcd5110.c: 296: for (c = *( dataPtr ); c; ++dataPtr, c = *( dataPtr ))
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	ld	a, (x)
	jra	00105$
00103$:
;	user/lcd5110.c: 302: return OK;
	clr	a
00107$:
	popw	x
	ret
;	user/lcd5110.c: 306: uint8_t LcdPixel(uint8_t x, uint8_t y, LcdPixelMode mode)
;	-----------------------------------------
;	 function LcdPixel
;	-----------------------------------------
_LcdPixel:
	sub	sp, #10
;	user/lcd5110.c: 312: if (x >= LCD_X_RES || y >= LCD_Y_RES) return OUT_OF_BORDER;
	ld	a, (0x0d, sp)
	cp	a, #0x54
	jrnc	00101$
	ld	a, (0x0e, sp)
	cp	a, #0x30
	jrc	00102$
00101$:
	ld	a, #0x01
	jp	00116$
00102$:
;	user/lcd5110.c: 314: index = ( ( y / 8 ) * 84 ) + x;
	ld	a, (0x0e, sp)
	srl	a
	srl	a
	srl	a
	push	a
	exg	a, xl
	ld	a, #0x54
	exg	a, xl
	mul	x, a
	ldw	(0x07, sp), x
	pop	a
	clrw	x
	exg	a, xl
	ld	a, (0x0d, sp)
	exg	a, xl
	addw	x, (0x06, sp)
	ldw	(0x01, sp), x
;	user/lcd5110.c: 315: offset  = y - ( ( y / 8 ) * 8 );
	sll	a
	sll	a
	sll	a
	ld	(0x08, sp), a
	ld	a, (0x0e, sp)
	sub	a, (0x08, sp)
	ld	(0x03, sp), a
;	user/lcd5110.c: 317: data = LcdCache[ index ];
	ldw	x, #_LcdCache+0
	addw	x, (0x01, sp)
	ldw	(0x09, sp), x
	ldw	x, (0x09, sp)
	ld	a, (x)
;	user/lcd5110.c: 322: data &= ( ~( 0x01 << offset ) );
	push	a
	ld	a, #0x01
	ld	(0x05, sp), a
	ld	a, (0x04, sp)
	jreq	00145$
00144$:
	sll	(0x05, sp)
	dec	a
	jrne	00144$
00145$:
	pop	a
;	user/lcd5110.c: 320: if (mode == PIXEL_OFF)
	tnz	(0x0f, sp)
	jrne	00110$
;	user/lcd5110.c: 322: data &= ( ~( 0x01 << offset ) );
	push	a
	ld	a, (0x05, sp)
	cpl	a
	ld	(0x06, sp), a
	pop	a
	and	a, (0x05, sp)
	jra	00111$
00110$:
;	user/lcd5110.c: 325: else if (mode == PIXEL_ON)
	push	a
	ld	a, (0x10, sp)
	cp	a, #0x01
	pop	a
	jrne	00107$
;	user/lcd5110.c: 327: data |= ( 0x01 << offset );
	or	a, (0x04, sp)
	jra	00111$
00107$:
;	user/lcd5110.c: 330: else if (mode  == PIXEL_XOR)
	push	a
	ld	a, (0x10, sp)
	cp	a, #0x02
	pop	a
	jrne	00111$
;	user/lcd5110.c: 332: data ^= ( 0x01 << offset );
	xor	a, (0x04, sp)
00111$:
;	user/lcd5110.c: 336: LcdCache[index] = data;
	ldw	x, (0x09, sp)
	ld	(x), a
;	user/lcd5110.c: 338: if (index < BottomCacheMark)
	ldw	x, (0x01, sp)
	cpw	x, _BottomCacheMark+0
	jrsge	00113$
;	user/lcd5110.c: 341: BottomCacheMark = index;
	ld	a, (0x02, sp)
	ld	_BottomCacheMark+1, a
	ld	a, (0x01, sp)
	ld	_BottomCacheMark+0, a
00113$:
;	user/lcd5110.c: 344: if (index > TopCacheMark)
	ldw	x, (0x01, sp)
	cpw	x, _TopCacheMark+0
	jrsle	00115$
;	user/lcd5110.c: 347: TopCacheMark = index;
	ld	a, (0x02, sp)
	ld	_TopCacheMark+1, a
	ld	a, (0x01, sp)
	ld	_TopCacheMark+0, a
00115$:
;	user/lcd5110.c: 349: return OK;
	clr	a
00116$:
	addw	sp, #10
	ret
;	user/lcd5110.c: 353: uint8_t LcdLine(uint8_t x1, uint8_t y1, uint8_t x2, uint8_t y2, LcdPixelMode mode)
;	-----------------------------------------
;	 function LcdLine
;	-----------------------------------------
_LcdLine:
	sub	sp, #27
;	user/lcd5110.c: 362: dy = y2 - y1;
	clrw	x
	ld	a, (0x21, sp)
	ld	xl, a
	ld	a, (0x1f, sp)
	ld	(0x1b, sp), a
	clr	(0x1a, sp)
	subw	x, (0x1a, sp)
	ldw	(0x0f, sp), x
;	user/lcd5110.c: 363: dx = x2 - x1;
	clrw	x
	ld	a, (0x20, sp)
	ld	xl, a
	ld	a, (0x1e, sp)
	ld	(0x0e, sp), a
	clr	(0x0d, sp)
	subw	x, (0x0d, sp)
	ldw	(0x14, sp), x
;	user/lcd5110.c: 365: if (dy < 0)
	tnz	(0x0f, sp)
	jrpl	00102$
;	user/lcd5110.c: 367: dy    = -dy;
	ldw	x, (0x0f, sp)
	negw	x
	ldw	(0x0f, sp), x
;	user/lcd5110.c: 368: stepy = -1;
	ldw	x, #0xffff
	ldw	(0x09, sp), x
	jra	00103$
00102$:
;	user/lcd5110.c: 372: stepy = 1;
	ldw	x, #0x0001
	ldw	(0x09, sp), x
00103$:
;	user/lcd5110.c: 375: if (dx < 0)
	tnz	(0x14, sp)
	jrpl	00105$
;	user/lcd5110.c: 377: dx    = -dx;
	ldw	x, (0x14, sp)
	negw	x
	ldw	(0x14, sp), x
;	user/lcd5110.c: 378: stepx = -1;
	ldw	x, #0xffff
	ldw	(0x05, sp), x
	jra	00106$
00105$:
;	user/lcd5110.c: 382: stepx = 1;
	ldw	x, #0x0001
	ldw	(0x05, sp), x
00106$:
;	user/lcd5110.c: 385: dx <<= 1;
	ldw	x, (0x14, sp)
	sllw	x
	ldw	(0x03, sp), x
;	user/lcd5110.c: 386: dy <<= 1;
	ldw	x, (0x0f, sp)
	sllw	x
	ldw	(0x07, sp), x
;	user/lcd5110.c: 389: response = LcdPixel(x1, y1, mode);
	ld	a, (0x22, sp)
	push	a
	ld	a, (0x20, sp)
	push	a
	ld	a, (0x20, sp)
	push	a
	call	_LcdPixel
	addw	sp, #3
	ld	(0x17, sp), a
;	user/lcd5110.c: 390: if (response)
	tnz	(0x17, sp)
	jreq	00108$
;	user/lcd5110.c: 391: return response;
	ld	a, (0x17, sp)
	jp	00126$
00108$:
;	user/lcd5110.c: 401: y1 += stepy;
	ld	a, (0x0a, sp)
	ld	(0x16, sp), a
;	user/lcd5110.c: 404: x1 += stepx;
	ld	a, (0x06, sp)
	ld	(0x11, sp), a
;	user/lcd5110.c: 394: if (dx > dy)
	ldw	x, (0x03, sp)
	cpw	x, (0x07, sp)
	jrsle	00124$
;	user/lcd5110.c: 396: fraction = dy - ( dx >> 1);
	ldw	x, (0x03, sp)
	sraw	x
	ldw	(0x0b, sp), x
	ldw	x, (0x07, sp)
	subw	x, (0x0b, sp)
	ldw	(0x12, sp), x
;	user/lcd5110.c: 397: while (x1 != x2)
00113$:
	ld	a, (0x1e, sp)
	cp	a, (0x20, sp)
	jreq	00125$
;	user/lcd5110.c: 399: if (fraction >= 0)
	tnz	(0x12, sp)
	jrmi	00110$
;	user/lcd5110.c: 401: y1 += stepy;
	ld	a, (0x1f, sp)
	add	a, (0x16, sp)
	ld	(0x1f, sp), a
;	user/lcd5110.c: 402: fraction -= dx;
	ldw	x, (0x12, sp)
	subw	x, (0x03, sp)
	ldw	(0x12, sp), x
00110$:
;	user/lcd5110.c: 404: x1 += stepx;
	ld	a, (0x1e, sp)
	add	a, (0x11, sp)
	ld	(0x1e, sp), a
;	user/lcd5110.c: 405: fraction += dy;
	ldw	x, (0x12, sp)
	addw	x, (0x07, sp)
	ldw	(0x12, sp), x
;	user/lcd5110.c: 407: response = LcdPixel(x1, y1, mode);
	ld	a, (0x22, sp)
	push	a
	ld	a, (0x20, sp)
	push	a
	ld	a, (0x20, sp)
	push	a
	call	_LcdPixel
	addw	sp, #3
;	user/lcd5110.c: 408: if(response)
	tnz	a
	jreq	00113$
;	user/lcd5110.c: 409: return response;
	jra	00126$
00124$:
;	user/lcd5110.c: 415: fraction = dx - ( dy >> 1);
	ldw	x, (0x07, sp)
	sraw	x
	ldw	(0x18, sp), x
	ldw	x, (0x03, sp)
	subw	x, (0x18, sp)
	ldw	(0x01, sp), x
;	user/lcd5110.c: 416: while (y1 != y2)
00120$:
	ld	a, (0x1f, sp)
	cp	a, (0x21, sp)
	jreq	00125$
;	user/lcd5110.c: 418: if (fraction >= 0)
	tnz	(0x01, sp)
	jrmi	00117$
;	user/lcd5110.c: 420: x1 += stepx;
	ld	a, (0x1e, sp)
	add	a, (0x11, sp)
	ld	(0x1e, sp), a
;	user/lcd5110.c: 421: fraction -= dy;
	ldw	x, (0x01, sp)
	subw	x, (0x07, sp)
	ldw	(0x01, sp), x
00117$:
;	user/lcd5110.c: 423: y1 += stepy;
	ld	a, (0x1f, sp)
	add	a, (0x16, sp)
	ld	(0x1f, sp), a
;	user/lcd5110.c: 424: fraction += dx;
	ldw	x, (0x01, sp)
	addw	x, (0x03, sp)
	ldw	(0x01, sp), x
;	user/lcd5110.c: 426: response = LcdPixel(x1, y1, mode);
	ld	a, (0x22, sp)
	push	a
	ld	a, (0x20, sp)
	push	a
	ld	a, (0x20, sp)
	push	a
	call	_LcdPixel
	addw	sp, #3
;	user/lcd5110.c: 427: if (response)
	tnz	a
	jreq	00120$
;	user/lcd5110.c: 428: return response;
;	user/lcd5110.c: 432: return OK;
	.byte 0x21
00125$:
	clr	a
00126$:
	addw	sp, #27
	ret
;	user/lcd5110.c: 436: uint8_t LcdCircle(uint8_t x, uint8_t y, uint8_t radius, LcdPixelMode mode)
;	-----------------------------------------
;	 function LcdCircle
;	-----------------------------------------
_LcdCircle:
	sub	sp, #15
;	user/lcd5110.c: 438: int8_t xc = 0;
	clr	(0x01, sp)
;	user/lcd5110.c: 442: if (x >= LCD_X_RES || y >= LCD_Y_RES) return OUT_OF_BORDER;
	ld	a, (0x12, sp)
	cp	a, #0x54
	jrnc	00101$
	ld	a, (0x13, sp)
	cp	a, #0x30
	jrc	00102$
00101$:
	ld	a, #0x01
	jp	00110$
00102$:
;	user/lcd5110.c: 444: yc = radius;
	ld	a, (0x14, sp)
	ld	(0x03, sp), a
;	user/lcd5110.c: 445: p = 3 - (radius<<1);
	ld	a, (0x03, sp)
	sll	a
	ld	(0x0c, sp), a
	ld	a, #0x03
	sub	a, (0x0c, sp)
	ld	(0x02, sp), a
;	user/lcd5110.c: 446: while (xc <= yc)  
	ld	a, (0x03, sp)
	ld	(0x07, sp), a
00107$:
	ld	a, (0x01, sp)
	cp	a, (0x07, sp)
	jrsle	00131$
	jp	00109$
00131$:
;	user/lcd5110.c: 448: LcdPixel(x + xc, y + yc, mode);
	ld	a, (0x13, sp)
	ld	xh, a
	add	a, (0x07, sp)
	ld	(0x0b, sp), a
	ld	a, (0x12, sp)
	ld	xl, a
	add	a, (0x01, sp)
	ld	(0x0f, sp), a
	pushw	x
	ld	a, (0x17, sp)
	push	a
	ld	a, (0x0e, sp)
	push	a
	ld	a, (0x13, sp)
	push	a
	call	_LcdPixel
	addw	sp, #3
	popw	x
;	user/lcd5110.c: 449: LcdPixel(x + xc, y - yc, mode);
	ld	a, xh
	sub	a, (0x07, sp)
	ld	(0x05, sp), a
	pushw	x
	ld	a, (0x17, sp)
	push	a
	ld	a, (0x08, sp)
	push	a
	ld	a, (0x13, sp)
	push	a
	call	_LcdPixel
	addw	sp, #3
	popw	x
;	user/lcd5110.c: 450: LcdPixel(x - xc, y + yc, mode);
	ld	a, xl
	sub	a, (0x01, sp)
	ld	(0x0d, sp), a
	pushw	x
	ld	a, (0x17, sp)
	push	a
	ld	a, (0x0e, sp)
	push	a
	ld	a, (0x11, sp)
	push	a
	call	_LcdPixel
	addw	sp, #3
	popw	x
;	user/lcd5110.c: 451: LcdPixel(x - xc, y - yc, mode);
	pushw	x
	ld	a, (0x17, sp)
	push	a
	ld	a, (0x08, sp)
	push	a
	ld	a, (0x11, sp)
	push	a
	call	_LcdPixel
	addw	sp, #3
	popw	x
;	user/lcd5110.c: 452: LcdPixel(x + yc, y + xc, mode);
	ld	a, xh
	add	a, (0x01, sp)
	ld	(0x08, sp), a
	ld	a, xl
	add	a, (0x07, sp)
	ld	(0x09, sp), a
	pushw	x
	ld	a, (0x17, sp)
	push	a
	ld	a, (0x0b, sp)
	push	a
	ld	a, (0x0d, sp)
	push	a
	call	_LcdPixel
	addw	sp, #3
	popw	x
;	user/lcd5110.c: 453: LcdPixel(x + yc, y - xc, mode);
	ld	a, xh
	sub	a, (0x01, sp)
	ld	xh, a
	pushw	x
	ld	a, (0x17, sp)
	push	a
	ld	a, xh
	push	a
	ld	a, (0x0d, sp)
	push	a
	call	_LcdPixel
	addw	sp, #3
	popw	x
;	user/lcd5110.c: 454: LcdPixel(x - yc, y + xc, mode);
	ld	a, xl
	sub	a, (0x07, sp)
	ld	xl, a
	pushw	x
	ld	a, (0x17, sp)
	push	a
	ld	a, (0x0b, sp)
	push	a
	ld	a, xl
	push	a
	call	_LcdPixel
	addw	sp, #3
	popw	x
;	user/lcd5110.c: 455: LcdPixel(x - yc, y - xc, mode);
	ld	a, (0x15, sp)
	push	a
	ld	a, xh
	push	a
	ld	a, xl
	push	a
	call	_LcdPixel
	addw	sp, #3
;	user/lcd5110.c: 456: if (p < 0) p += (xc++ << 2) + 6;
	ld	a, (0x01, sp)
	inc	a
	tnz	(0x02, sp)
	jrpl	00105$
	exg	a, xl
	ld	a, (0x01, sp)
	exg	a, xl
	ld	(0x01, sp), a
	ld	a, xl
	sll	a
	sll	a
	add	a, #0x06
	add	a, (0x02, sp)
	ld	(0x02, sp), a
	jp	00107$
00105$:
;	user/lcd5110.c: 457: else p += ((xc++ - yc--)<<2) + 10;
	push	a
	ld	a, (0x02, sp)
	ld	(0x07, sp), a
	pop	a
	ld	(0x01, sp), a
	ld	a, (0x07, sp)
	ld	(0x0a, sp), a
	dec	(0x07, sp)
	ld	a, (0x06, sp)
	sub	a, (0x0a, sp)
	ld	(0x0e, sp), a
	ld	a, (0x0e, sp)
	sll	a
	sll	a
	ld	(0x04, sp), a
	ld	a, (0x04, sp)
	add	a, #0x0a
	add	a, (0x02, sp)
	ld	(0x02, sp), a
	jp	00107$
00109$:
;	user/lcd5110.c: 460: return OK;
	clr	a
00110$:
	addw	sp, #15
	ret
;	user/lcd5110.c: 464: uint8_t LcdRect(uint8_t x1, uint8_t y1, uint8_t x2, uint8_t y2, LcdPixelMode mode)
;	-----------------------------------------
;	 function LcdRect
;	-----------------------------------------
_LcdRect:
	pushw	x
;	user/lcd5110.c: 469: if ((x1 >= LCD_X_RES) ||  (x2 >= LCD_X_RES) || (y1 >= LCD_Y_RES) || (y2 >= LCD_Y_RES))
	ld	a, (0x05, sp)
	cp	a, #0x54
	jrnc	00101$
	ld	a, (0x07, sp)
	cp	a, #0x54
	jrnc	00101$
	ld	a, (0x06, sp)
	cp	a, #0x30
	jrnc	00101$
	ld	a, (0x08, sp)
	cp	a, #0x30
	jrc	00102$
00101$:
;	user/lcd5110.c: 470: return OUT_OF_BORDER;
	ld	a, #0x01
	jra	00117$
00102$:
;	user/lcd5110.c: 472: if ((x2 > x1) && (y2 > y1))
	ld	a, (0x07, sp)
	cp	a, (0x05, sp)
	jrule	00109$
	ld	a, (0x08, sp)
	cp	a, (0x06, sp)
	jrule	00109$
;	user/lcd5110.c: 475: for (tmpIdx = x1; tmpIdx <= x2; tmpIdx++)
	ld	a, (0x05, sp)
	ld	(0x01, sp), a
00112$:
	ld	a, (0x01, sp)
	cp	a, (0x07, sp)
	jrugt	00106$
;	user/lcd5110.c: 477: LcdPixel(tmpIdx, y1, mode);
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x07, sp)
	push	a
	ld	a, (0x03, sp)
	push	a
	call	_LcdPixel
	addw	sp, #3
;	user/lcd5110.c: 478: LcdPixel(tmpIdx, y2, mode);
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x03, sp)
	push	a
	call	_LcdPixel
	addw	sp, #3
;	user/lcd5110.c: 475: for (tmpIdx = x1; tmpIdx <= x2; tmpIdx++)
	inc	(0x01, sp)
	jra	00112$
00106$:
;	user/lcd5110.c: 482: for (tmpIdx = y1; tmpIdx <= y2; tmpIdx++)
	ld	a, (0x06, sp)
	ld	(0x02, sp), a
00115$:
	ld	a, (0x02, sp)
	cp	a, (0x08, sp)
	jrugt	00109$
;	user/lcd5110.c: 484: LcdPixel(x1, tmpIdx, mode);
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x03, sp)
	push	a
	ld	a, (0x07, sp)
	push	a
	call	_LcdPixel
	addw	sp, #3
;	user/lcd5110.c: 485: LcdPixel(x2, tmpIdx, mode);
	ld	a, (0x09, sp)
	push	a
	ld	a, (0x03, sp)
	push	a
	ld	a, (0x09, sp)
	push	a
	call	_LcdPixel
	addw	sp, #3
;	user/lcd5110.c: 482: for (tmpIdx = y1; tmpIdx <= y2; tmpIdx++)
	inc	(0x02, sp)
	jra	00115$
00109$:
;	user/lcd5110.c: 488: return OK;
	clr	a
00117$:
	popw	x
	ret
;	user/lcd5110.c: 492: void LcdImage(const uint8_t *imageData)
;	-----------------------------------------
;	 function LcdImage
;	-----------------------------------------
_LcdImage:
;	user/lcd5110.c: 495: memcpy(LcdCache, imageData, LCD_CACHE_SIZE);
	ldw	y, (0x03, sp)
	ldw	x, #_LcdCache+0
	push	#0xf8
	push	#0x01
	pushw	y
	pushw	x
	call	_memcpy
	addw	sp, #6
;	user/lcd5110.c: 497: BottomCacheMark = 0;
	clrw	x
	ldw	_BottomCacheMark+0, x
;	user/lcd5110.c: 498: TopCacheMark = LCD_CACHE_SIZE - 1;
	ldw	x, #0x01f7
	ldw	_TopCacheMark+0, x
	ret
;	user/lcd5110.c: 502: void LcdWriteToCache(int16_t addr, uint8_t data)
;	-----------------------------------------
;	 function LcdWriteToCache
;	-----------------------------------------
_LcdWriteToCache:
;	user/lcd5110.c: 504: LcdCache[addr] = data;
	ldw	x, #_LcdCache+0
	addw	x, (0x03, sp)
	ld	a, (0x05, sp)
	ld	(x), a
	ret
;	user/lcd5110.c: 508: void LcdIvertLine(uint8_t line) {
;	-----------------------------------------
;	 function LcdIvertLine
;	-----------------------------------------
_LcdIvertLine:
	sub	sp, #5
;	user/lcd5110.c: 512: addr=line*LCD_X_RES;
	ld	a, (0x08, sp)
	ld	xl, a
	ld	a, #0x54
	mul	x, a
;	user/lcd5110.c: 513: for (x=0; x<LCD_X_RES; x++) {
	ld	a, #0x54
	ld	(0x01, sp), a
	ldw	y, #_LcdCache+0
	ldw	(0x02, sp), y
	ldw	(0x04, sp), x
00104$:
;	user/lcd5110.c: 514: LcdCache[addr] = ~LcdCache[addr];
	ldw	x, (0x02, sp)
	addw	x, (0x04, sp)
	cpl	(x)
;	user/lcd5110.c: 515: addr++;
	ldw	x, (0x04, sp)
	incw	x
	ldw	(0x04, sp), x
	ld	a, (0x01, sp)
	dec	a
	ld	(0x01, sp), a
;	user/lcd5110.c: 513: for (x=0; x<LCD_X_RES; x++) {
	tnz	a
	jrne	00104$
	addw	sp, #5
	ret
;	user/lcd5110.c: 520: void LcdIvertLineFragment(uint8_t line, uint8_t chr_x1, uint8_t chr_x2) 
;	-----------------------------------------
;	 function LcdIvertLineFragment
;	-----------------------------------------
_LcdIvertLineFragment:
	sub	sp, #8
;	user/lcd5110.c: 523: addr_start = line*LCD_X_RES + chr_x1*6;
	ld	a, (0x0b, sp)
	ld	xl, a
	ld	a, #0x54
	mul	x, a
	ldw	(0x07, sp), x
	ld	a, (0x0c, sp)
	ld	yl, a
	ld	a, #0x06
	mul	y, a
	addw	y, (0x07, sp)
;	user/lcd5110.c: 524: addr_end = line*LCD_X_RES + chr_x2*6;
	ld	a, (0x0d, sp)
	ld	xl, a
	ld	a, #0x06
	mul	x, a
	addw	x, (0x07, sp)
	ldw	(0x01, sp), x
;	user/lcd5110.c: 526: for (addr=addr_start; addr<addr_end; addr++) {
	ldw	x, #_LcdCache+0
	ldw	(0x05, sp), x
	ldw	(0x03, sp), y
00103$:
	ldw	x, (0x03, sp)
	cpw	x, (0x01, sp)
	jrnc	00105$
;	user/lcd5110.c: 527: LcdCache[addr] = ~LcdCache[addr];
	ldw	x, (0x05, sp)
	addw	x, (0x03, sp)
	ld	a, (x)
	cpl	a
	ld	(x), a
;	user/lcd5110.c: 526: for (addr=addr_start; addr<addr_end; addr++) {
	ldw	x, (0x03, sp)
	incw	x
	ldw	(0x03, sp), x
	jra	00103$
00105$:
	addw	sp, #8
	ret
	.area CODE
_FontLookup:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5f	; 95
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x7f	; 127
	.db #0x14	; 20
	.db #0x7f	; 127
	.db #0x14	; 20
	.db #0x24	; 36
	.db #0x2a	; 42
	.db #0x7f	; 127
	.db #0x2a	; 42
	.db #0x12	; 18
	.db #0x4c	; 76	'L'
	.db #0x2c	; 44
	.db #0x10	; 16
	.db #0x68	; 104	'h'
	.db #0x64	; 100	'd'
	.db #0x36	; 54	'6'
	.db #0x49	; 73	'I'
	.db #0x55	; 85	'U'
	.db #0x22	; 34
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x22	; 34
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x3e	; 62
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x3e	; 62
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x3e	; 62
	.db #0x51	; 81	'Q'
	.db #0x49	; 73	'I'
	.db #0x45	; 69	'E'
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x61	; 97	'a'
	.db #0x51	; 81	'Q'
	.db #0x49	; 73	'I'
	.db #0x46	; 70	'F'
	.db #0x21	; 33
	.db #0x41	; 65	'A'
	.db #0x45	; 69	'E'
	.db #0x4b	; 75	'K'
	.db #0x31	; 49	'1'
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x12	; 18
	.db #0x7f	; 127
	.db #0x10	; 16
	.db #0x27	; 39
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x45	; 69	'E'
	.db #0x39	; 57	'9'
	.db #0x3c	; 60
	.db #0x4a	; 74	'J'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x30	; 48	'0'
	.db #0x01	; 1
	.db #0x71	; 113	'q'
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x36	; 54	'6'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x36	; 54	'6'
	.db #0x06	; 6
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x29	; 41
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x36	; 54	'6'
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x56	; 86	'V'
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x22	; 34
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x51	; 81	'Q'
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x32	; 50	'2'
	.db #0x49	; 73	'I'
	.db #0x79	; 121	'y'
	.db #0x41	; 65	'A'
	.db #0x3e	; 62
	.db #0x7e	; 126
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x36	; 54	'6'
	.db #0x3e	; 62
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x1c	; 28
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x3e	; 62
	.db #0x41	; 65	'A'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x7a	; 122	'z'
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x41	; 65	'A'
	.db #0x3f	; 63
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x22	; 34
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x02	; 2
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x3e	; 62
	.db #0x41	; 65	'A'
	.db #0x51	; 81	'Q'
	.db #0x21	; 33
	.db #0x5e	; 94
	.db #0x7f	; 127
	.db #0x09	; 9
	.db #0x19	; 25
	.db #0x29	; 41
	.db #0x46	; 70	'F'
	.db #0x46	; 70	'F'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x31	; 49	'1'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x38	; 56	'8'
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x63	; 99	'c'
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x63	; 99	'c'
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x70	; 112	'p'
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x61	; 97	'a'
	.db #0x51	; 81	'Q'
	.db #0x49	; 73	'I'
	.db #0x45	; 69	'E'
	.db #0x43	; 67	'C'
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x78	; 120	'x'
	.db #0x7f	; 127
	.db #0x48	; 72	'H'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x48	; 72	'H'
	.db #0x7f	; 127
	.db #0x38	; 56	'8'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x7e	; 126
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x0c	; 12
	.db #0x52	; 82	'R'
	.db #0x52	; 82	'R'
	.db #0x52	; 82	'R'
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x7d	; 125
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x44	; 68	'D'
	.db #0x3d	; 61
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x7c	; 124
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x48	; 72	'H'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x3f	; 63
	.db #0x44	; 68	'D'
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x3c	; 60
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x7c	; 124
	.db #0x1c	; 28
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x1c	; 28
	.db #0x3c	; 60
	.db #0x40	; 64
	.db #0x30	; 48	'0'
	.db #0x40	; 64
	.db #0x3c	; 60
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x44	; 68	'D'
	.db #0x0c	; 12
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x3c	; 60
	.db #0x44	; 68	'D'
	.db #0x64	; 100	'd'
	.db #0x54	; 84	'T'
	.db #0x4c	; 76	'L'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x36	; 54	'6'
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x36	; 54	'6'
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x12	; 18
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x7c	; 124
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x31	; 49	'1'
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x36	; 54	'6'
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x60	; 96
	.db #0x3f	; 63
	.db #0x21	; 33
	.db #0x3f	; 63
	.db #0x60	; 96
	.db #0x7f	; 127
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x41	; 65	'A'
	.db #0x77	; 119	'w'
	.db #0x08	; 8
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x77	; 119	'w'
	.db #0x22	; 34
	.db #0x41	; 65	'A'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x36	; 54	'6'
	.db #0x7f	; 127
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x7f	; 127
	.db #0x7e	; 126
	.db #0x10	; 16
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x22	; 34
	.db #0x41	; 65	'A'
	.db #0x40	; 64
	.db #0x3e	; 62
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x02	; 2
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x3e	; 62
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x22	; 34
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x3f	; 63
	.db #0x0e	; 14
	.db #0x11	; 17
	.db #0x7f	; 127
	.db #0x11	; 17
	.db #0x0e	; 14
	.db #0x63	; 99	'c'
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x63	; 99	'c'
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x60	; 96
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x7e	; 126
	.db #0x40	; 64
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x7f	; 127
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x22	; 34
	.db #0x41	; 65	'A'
	.db #0x49	; 73	'I'
	.db #0x49	; 73	'I'
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0x3e	; 62
	.db #0x41	; 65	'A'
	.db #0x3e	; 62
	.db #0x46	; 70	'F'
	.db #0x29	; 41
	.db #0x19	; 25
	.db #0x09	; 9
	.db #0x7f	; 127
	.db #0x20	; 32
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x78	; 120	'x'
	.db #0x3c	; 60
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x31	; 49	'1'
	.db #0x7c	; 124
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x60	; 96
	.db #0x38	; 56	'8'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x18	; 24
	.db #0x6c	; 108	'l'
	.db #0x10	; 16
	.db #0x7c	; 124
	.db #0x10	; 16
	.db #0x6c	; 108	'l'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x28	; 40
	.db #0x7c	; 124
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x21	; 33
	.db #0x12	; 18
	.db #0x09	; 9
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x38	; 56	'8'
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x3c	; 60
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x7c	; 124
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x44	; 68	'D'
	.db #0x3c	; 60
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x3c	; 60
	.db #0x60	; 96
	.db #0x0c	; 12
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x7c	; 124
	.db #0x3c	; 60
	.db #0x20	; 32
	.db #0x3c	; 60
	.db #0x20	; 32
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0x7c	; 124
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x20	; 32
	.db #0x7c	; 124
	.db #0x50	; 80	'P'
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x20	; 32
	.db #0x28	; 40
	.db #0x44	; 68	'D'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x48	; 72	'H'
	.db #0x54	; 84	'T'
	.db #0x34	; 52	'4'
	.db #0x14	; 20
	.db #0x7c	; 124
_BigNumbers:
	.db #0xfc	; 252
	.db #0x7a	; 122	'z'
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x7a	; 122	'z'
	.db #0xfc	; 252
	.db #0x7e	; 126
	.db #0xbc	; 188
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xbc	; 188
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x7a	; 122	'z'
	.db #0xfc	; 252
	.db #0x7e	; 126
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x7a	; 122	'z'
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xbd	; 189
	.db #0x7e	; 126
	.db #0xfc	; 252
	.db #0x78	; 120	'x'
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x78	; 120	'x'
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x3d	; 61
	.db #0x7e	; 126
	.db #0xfc	; 252
	.db #0x7a	; 122	'z'
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xbd	; 189
	.db #0x7e	; 126
	.db #0xfc	; 252
	.db #0x7a	; 122	'z'
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xbd	; 189
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x7a	; 122	'z'
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0xfc	; 252
	.db #0x7a	; 122	'z'
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x7a	; 122	'z'
	.db #0xfc	; 252
	.db #0x7e	; 126
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xbd	; 189
	.db #0x7e	; 126
	.db #0xfc	; 252
	.db #0x7a	; 122	'z'
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x7a	; 122	'z'
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xbd	; 189
	.db #0x7e	; 126
_LargeNumbers:
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf2	; 242
	.db #0xe6	; 230
	.db #0xce	; 206
	.db #0x1e	; 30
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x1e	; 30
	.db #0xce	; 206
	.db #0xe6	; 230
	.db #0xf2	; 242
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x9f	; 159
	.db #0xcf	; 207
	.db #0xe7	; 231
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xe7	; 231
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x0e	; 14
	.db #0x1e	; 30
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x1e	; 30
	.db #0xce	; 206
	.db #0xe6	; 230
	.db #0xf2	; 242
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xf9	; 249
	.db #0xf3	; 243
	.db #0xe7	; 231
	.db #0xc7	; 199
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x9f	; 159
	.db #0xcf	; 207
	.db #0xe7	; 231
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x0e	; 14
	.db #0x1e	; 30
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x1e	; 30
	.db #0xce	; 206
	.db #0xe6	; 230
	.db #0xf2	; 242
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xf3	; 243
	.db #0xf9	; 249
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xe7	; 231
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x9f	; 159
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xf3	; 243
	.db #0xf9	; 249
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf2	; 242
	.db #0xe6	; 230
	.db #0xce	; 206
	.db #0x1e	; 30
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x1e	; 30
	.db #0x0e	; 14
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x9f	; 159
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xf3	; 243
	.db #0xf9	; 249
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xe7	; 231
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf2	; 242
	.db #0xe6	; 230
	.db #0xce	; 206
	.db #0x1e	; 30
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x1e	; 30
	.db #0x0e	; 14
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x9f	; 159
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xf9	; 249
	.db #0xf3	; 243
	.db #0xe7	; 231
	.db #0xc7	; 199
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xf3	; 243
	.db #0xf9	; 249
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x9f	; 159
	.db #0xcf	; 207
	.db #0xe7	; 231
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xe7	; 231
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x0e	; 14
	.db #0x1e	; 30
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x1e	; 30
	.db #0xce	; 206
	.db #0xe6	; 230
	.db #0xf2	; 242
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf2	; 242
	.db #0xe6	; 230
	.db #0xce	; 206
	.db #0x1e	; 30
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x1e	; 30
	.db #0xce	; 206
	.db #0xe6	; 230
	.db #0xf2	; 242
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x9f	; 159
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xf9	; 249
	.db #0xf3	; 243
	.db #0xe7	; 231
	.db #0xc7	; 199
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xf3	; 243
	.db #0xf9	; 249
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x9f	; 159
	.db #0xcf	; 207
	.db #0xe7	; 231
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xe7	; 231
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf2	; 242
	.db #0xe6	; 230
	.db #0xce	; 206
	.db #0x1e	; 30
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x1e	; 30
	.db #0xce	; 206
	.db #0xe6	; 230
	.db #0xf2	; 242
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x9f	; 159
	.db #0xcf	; 207
	.db #0xc7	; 199
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc7	; 199
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xf3	; 243
	.db #0xf9	; 249
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xe7	; 231
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area INITIALIZER
	.area CABS (ABS)
