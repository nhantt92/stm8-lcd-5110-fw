#include "lcd5110.h"
#include <string.h>

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
	GPIO_Init(GPIOA, LCD_DC_PIN|LCD_CE_PIN|LCD_RST_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
	SET_RST;
	RESET_DC;
	RESET_CE;
	RESET_SDIN;
	RESET_SCLK;

	//Reset
	RESET_RST;
	SET_RST;

	// Disable LCD Controller
	SET_CE;

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

	// Refresh display
	for(i = BottomCacheMark; i <= TopCacheMark; i++)
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

// Draw pixel
uint8_t LcdPixel(uint8_t x, uint8_t y, LcdPixelMode mode)
{
    int  index;
    unsigned char  offset;
    unsigned char  data;

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


