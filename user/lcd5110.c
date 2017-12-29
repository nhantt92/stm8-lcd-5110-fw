#include "lcd5110.h"
#include <string.h>
#include "stm8s_gpio.h"

static void LcdVSPI(uint8_t data);
static void LcdSend(uint8_t data, LcdCmdData cmd);

// Display Cache

static uint8_t LcdCache[LCD_CACHE_SIZE];
static int16_t BottomCacheMark;
static int16_t TopCacheMark;
static int16_t LcdCacheIdx;

// Display Initialization

void LcdInit(void)
{
	GPIO_Init(GPIOC, LCD_SDIN_PIN|LCD_SCLK_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
	GPIO_Init(GPIOD, LCD_DC_PIN|LCD_CE_PIN|LCD_RST_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
	SET_RST;
	RESET_DC;
	RESET_CE;
	RESET_SDIN;
	RESET_SCLK;

    // Reset
	RESET_RST;
	SET_RST;

    // Disable LCD controller
	SET_CE;
  
    // Send commands
    LcdSend(0x21, LCD_CMD); // LCD Extended Commands
    LcdSend(0xC8, LCD_CMD); // Set Contrast (LCD Vop)
    LcdSend(0x06, LCD_CMD); // Set Temperature coefficent
    LcdSend(0x13, LCD_CMD); // LCD bias mode 1:48
    LcdSend(0x20, LCD_CMD); // LCD Standard Commands and Horizontal addressing mode
    LcdSend(0x0C, LCD_CMD); // LCD in normal mode

    // Clear Display
    LcdClear();
    LcdUpdate();
}

void LcdClear(void)
{	
	// Clear Cache
	memset(LcdCache, 0x00, LCD_CACHE_SIZE);
	// Reset Cache marks
	BottomCacheMark = 0;
	TopCacheMark = LCD_CACHE_SIZE - 1;
}

void LcdUpdate(void)
{
	uint8_t i;
	if(BottomCacheMark < 0) BottomCacheMark = 0;
	else if(BottomCacheMark >= LCD_CACHE_SIZE) BottomCacheMark = LCD_CACHE_SIZE - 1;
	if(TopCacheMark < 0) TopCacheMark = 0;
	else if(TopCacheMark >= LCD_CACHE_SIZE) TopCacheMark = LCD_CACHE_SIZE - 1;
	
    // Set start address
    LcdSend(0x80 | (BottomCacheMark % LCD_X_RES), LCD_CMD);
    LcdSend(0x40 | (BottomCacheMark / LCD_X_RES), LCD_CMD);

    // Refresh display
    for (i = BottomCacheMark; i <= TopCacheMark; i++)
    {
    	LcdSend(LcdCache[i], LCD_DATA);
    }

    // Reset Cache Marks
    BottomCacheMark = LCD_CACHE_SIZE - 1;
    TopCacheMark = 0;
}

// Send data to display (SPI sw)
static void LcdVSPI(uint8_t data)
{
	uint8_t i;
	for(i = 0; i < 8; i++, data = data << 1)
	{
		if((data & 0x80) == 0x80) SET_SDIN;
		else RESET_SDIN;
		SET_SCLK;
		RESET_SCLK;
	}
}

// Send data or command to display
static void LcdSend(uint8_t data, uint8_t cmd)
{
	// Enable display controller
	RESET_CE;
	if(cmd = LCD_DATA) SET_DC;
	else RESET_DC;
	LcdVSPI(data);
	// Disable display controller
	SET_CE;
}

// Set contrast 0x00 ... 0x7F
void LcdContrast (uint8_t contrast )
{
    LcdSend(0x21, LCD_CMD);              // LCD Extended Commands
    LcdSend(0x80 | contrast, LCD_CMD);   // Set contrast
    LcdSend(0x20, LCD_CMD);              // LCD Standard Commands
}

// Set cursor position (standard font size) x = 0...13, y = 0...5
uint8_t LcdGotoXYFont(uint8_t x, uint8_t y)
{
    if(x > 13 || y > 5) return OUT_OF_BORDER;

    LcdCacheIdx = x * 6 + y * 84;
    return OK;
}


// Print a single char into current position
uint8_t LcdChar(LcdFontSize size, uint8_t ch)
{
    unsigned char i, c;
    unsigned char b1, b2;
    int  tmpIdx;

    if (LcdCacheIdx < BottomCacheMark)
    {
        // Set bottom Cache Mark
        BottomCacheMark = LcdCacheIdx;
    }

    if ( (ch >= 0x20) && (ch <= 0x7F) )
    {
        // offset in symbols table ASCII[0x20-0x7F]
        ch -= 32;
    }
    else if (ch >= 0xC0)
    {
        // offset in symbols table CP1251[0xC0-0xFF] (Cyrillic)
        ch -= 96;
    }
    else
    {
        // Ignore unknown symbols
        ch = 95;
    }

    if (size == FONT_1X)
    {
        for (i = 0; i < 5; i++)
        {
            // Copy symbol image into cache
            LcdCache[LcdCacheIdx++] = *( &(FontLookup[ch][i]) ) << 1;
        }
    }
    else if (size == FONT_2X)
    {
        tmpIdx = LcdCacheIdx - 84;

        if (tmpIdx < BottomCacheMark)
        {
            BottomCacheMark = tmpIdx;
        }

        if (tmpIdx < 0) return OUT_OF_BORDER;

        // The Big numbers defined in BigNumbers array
        // Other symbols will scale
        if ((ch > 15) & (ch < 26)) {
          ch -= 16;
          for (i = 0; i < 10; i++)
          {
            LcdCache[tmpIdx++] = *(&(BigNumbers[ch][i]));
            LcdCache[tmpIdx+83] = *(&(BigNumbers[ch][10+i]));
          }
        }
        else{
          for (i = 0; i < 5; i++)
          {
              // Copy symbol image from the table to the temporart variable
              c = *(&(FontLookup[ch][i])) << 1;
              // Scale image
              // First part
              b1 =  (c & 0x01) * 3;
              b1 |= (c & 0x02) * 6;
              b1 |= (c & 0x04) * 12;
              b1 |= (c & 0x08) * 24;

              c >>= 4;
              // Second part
              b2 =  (c & 0x01) * 3;
              b2 |= (c & 0x02) * 6;
              b2 |= (c & 0x04) * 12;
              b2 |= (c & 0x08) * 24;

              // Copy to the cache
              LcdCache[tmpIdx++] = b1;
              LcdCache[tmpIdx++] = b1;
              LcdCache[tmpIdx + 82] = b2;
              LcdCache[tmpIdx + 83] = b2;
          }
        }

        // Set new cursor position
        LcdCacheIdx = (LcdCacheIdx + 11) % LCD_CACHE_SIZE;
    }
    else if (size == FONT_4X) {
        tmpIdx = LcdCacheIdx - 84;

        if (tmpIdx < BottomCacheMark)
        {
            BottomCacheMark = tmpIdx;
        }

        if (tmpIdx < 0) return OUT_OF_BORDER;
        
        // The LARGE numbers defined in LargeNumbers array
        // Other symbols will ignored
        // "+", "-" and "."
        if ((ch > 15) & (ch < 26)) {
          ch -= 16;
        }
        else if (ch == 43-32) { // +
          ch = 10;
        }
        else if (ch == 45-32) { // -
          ch = 11;
        }
        else if (ch == 46-32) { // .
          ch = 12;
        }
        else {
          ch= 255;
        }
        
        if (ch != 255) {
          for (i = 0; i < 20; i++)
          {
            LcdCache[tmpIdx++] = *(&(LargeNumbers[ch][i]));
            LcdCache[tmpIdx+83] = *(&(LargeNumbers[ch][20+i]));
            LcdCache[tmpIdx+167] = *(&(LargeNumbers[ch][40+i]));
            LcdCache[tmpIdx+251] = *(&(LargeNumbers[ch][60+i]));
          }
        }

        // Set new cursor position
        LcdCacheIdx = (LcdCacheIdx + 20) % LCD_CACHE_SIZE;
        
        if (ch == 12) { // .
          LcdCacheIdx -=5;
        }
    }

    if (LcdCacheIdx > TopCacheMark)
    {
        // Set top Cache Mark
        TopCacheMark = LcdCacheIdx;
    }

    // Horizontal space between chars
    LcdCache[LcdCacheIdx] = 0x00;

    if(LcdCacheIdx == (LCD_CACHE_SIZE - 1))
    {
        LcdCacheIdx = 0;
        return OK_WITH_WRAP;
    }

    LcdCacheIdx++;
    return OK;
}

// Print a string to display
uint8_t LcdStr(LcdFontSize size, uint8_t dataArray[])
{
    uint8_t tmpIdx=0;
   	uint8_t response;
    while( dataArray[ tmpIdx ] != '\0' )
    {
        response = LcdChar(size, dataArray[ tmpIdx ]);
        if( response == OUT_OF_BORDER)
            return OUT_OF_BORDER;
        tmpIdx++;
    }
    return OK;
}

// Print a string from the Flash to display
uint8_t LcdFStr(LcdFontSize size, const uint8_t *dataPtr)
{
    uint8_t c;
    uint8_t response;
    for (c = *( dataPtr ); c; ++dataPtr, c = *( dataPtr ))
    {
        response = LcdChar(size, c );
        if(response == OUT_OF_BORDER)
            return OUT_OF_BORDER;
    }
    return OK;
}

// Draw pixel
uint8_t LcdPixel(uint8_t x, uint8_t y, LcdPixelMode mode)
{
    int16_t  index;
    uint8_t  offset;
    uint8_t  data;

    if (x >= LCD_X_RES || y >= LCD_Y_RES) return OUT_OF_BORDER;

    index = ( ( y / 8 ) * 84 ) + x;
    offset  = y - ( ( y / 8 ) * 8 );

    data = LcdCache[ index ];

    // PIXEL_OFF
    if (mode == PIXEL_OFF)
    {
        data &= ( ~( 0x01 << offset ) );
    }
    // PIXEL_ON
    else if (mode == PIXEL_ON)
    {
        data |= ( 0x01 << offset );
    }
    // PIXEL_XOR
    else if (mode  == PIXEL_XOR)
    {
        data ^= ( 0x01 << offset );
    }

    // Copy result to the cache
    LcdCache[index] = data;

    if (index < BottomCacheMark)
    {
        // Set new bottom Cache Mark
        BottomCacheMark = index;
    }

    if (index > TopCacheMark)
    {
    	// Set new top Cache Mark
        TopCacheMark = index;
    }
    return OK;
}

// Draw line
uint8_t LcdLine(uint8_t x1, uint8_t y1, uint8_t x2, uint8_t y2, LcdPixelMode mode)
{
    int16_t dx, dy, stepx, stepy, fraction;
    uint8_t response;

    // dy   y2 - y1
    // -- = -------
    // dx   x2 - x1

    dy = y2 - y1;
    dx = x2 - x1;

    if (dy < 0)
    {
        dy    = -dy;
        stepy = -1;
    }
    else
    {
        stepy = 1;
    }

    if (dx < 0)
    {
        dx    = -dx;
        stepx = -1;
    }
    else
    {
        stepx = 1;
    }

    dx <<= 1;
    dy <<= 1;

    // Draw start point
    response = LcdPixel(x1, y1, mode);
    if (response)
        return response;

    // Draw next points
    if (dx > dy)
    {
        fraction = dy - ( dx >> 1);
        while (x1 != x2)
        {
            if (fraction >= 0)
            {
                y1 += stepy;
                fraction -= dx;
            }
            x1 += stepx;
            fraction += dy;

            response = LcdPixel(x1, y1, mode);
            if(response)
                return response;

        }
    }
    else
    {
        fraction = dx - ( dy >> 1);
        while (y1 != y2)
        {
            if (fraction >= 0)
            {
                x1 += stepx;
                fraction -= dy;
            }
            y1 += stepy;
            fraction += dx;

            response = LcdPixel(x1, y1, mode);
            if (response)
                return response;
        }
    }

    return OK;
}

// Draw Circle
uint8_t LcdCircle(uint8_t x, uint8_t y, uint8_t radius, LcdPixelMode mode)
{
    int8_t xc = 0;
    int8_t yc = 0;
    int8_t p = 0;

    if (x >= LCD_X_RES || y >= LCD_Y_RES) return OUT_OF_BORDER;

    yc = radius;
    p = 3 - (radius<<1);
    while (xc <= yc)  
    {
        LcdPixel(x + xc, y + yc, mode);
        LcdPixel(x + xc, y - yc, mode);
        LcdPixel(x - xc, y + yc, mode);
        LcdPixel(x - xc, y - yc, mode);
        LcdPixel(x + yc, y + xc, mode);
        LcdPixel(x + yc, y - xc, mode);
        LcdPixel(x - yc, y + xc, mode);
        LcdPixel(x - yc, y - xc, mode);
        if (p < 0) p += (xc++ << 2) + 6;
            else p += ((xc++ - yc--)<<2) + 10;
    }

    return OK;
}

// Draw Rect
uint8_t LcdRect(uint8_t x1, uint8_t y1, uint8_t x2, uint8_t y2, LcdPixelMode mode)
{
    uint8_t tmpIdx;

    // Return if border offsets
    if ((x1 >= LCD_X_RES) ||  (x2 >= LCD_X_RES) || (y1 >= LCD_Y_RES) || (y2 >= LCD_Y_RES))
        return OUT_OF_BORDER;

    if ((x2 > x1) && (y2 > y1))
    {
        // Draw horizontal lines
        for (tmpIdx = x1; tmpIdx <= x2; tmpIdx++)
        {
            LcdPixel(tmpIdx, y1, mode);
            LcdPixel(tmpIdx, y2, mode);
        }

        // Draw vertical lines
        for (tmpIdx = y1; tmpIdx <= y2; tmpIdx++)
        {
            LcdPixel(x1, tmpIdx, mode);
            LcdPixel(x2, tmpIdx, mode);
        }
    }
    return OK;
}

// Draw Image
void LcdImage(const uint8_t *imageData)
{
    // Copy data to the cache
    memcpy(LcdCache, imageData, LCD_CACHE_SIZE);
    
    BottomCacheMark = 0;
    TopCacheMark = LCD_CACHE_SIZE - 1;
}

// Copy data to cache
void LcdWriteToCache(int16_t addr, uint8_t data)
{
  LcdCache[addr] = data;
}

// Invert string line
void LcdIvertLine(uint8_t line) {
  uint8_t x;
  uint16_t addr;
  
  addr=line*LCD_X_RES;
  for (x=0; x<LCD_X_RES; x++) {
    LcdCache[addr] = ~LcdCache[addr];
    addr++;
  }
}

// Invert fragment of string line
void LcdIvertLineFragment(uint8_t line, uint8_t chr_x1, uint8_t chr_x2) 
{
 	uint16_t addr, addr_start, addr_end;
  addr_start = line*LCD_X_RES + chr_x1*6;
  addr_end = line*LCD_X_RES + chr_x2*6;

  for (addr=addr_start; addr<addr_end; addr++) {
    LcdCache[addr] = ~LcdCache[addr];
  }
}
