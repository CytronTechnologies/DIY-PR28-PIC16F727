//=========================================================================
//	File name			: PR28.h		
//	Description			: header file
//==========================================================================
#ifndef PR28_H
#define PR28_H

#if defined(__XC8)
  #include <xc.h>
  //#pragma config CONFIG = 0x3CE4
  // #pragma config statements should precede project file includes.
  // Use project enums instead of #define for ON and OFF.

 //CONFIG1
#pragma config FOSC = INTOSCIO        // Oscillator Selection bits (INTOSCIO oscillator: I/O function on RA6/OSC2/CLKOUT pin, I/O function on RA7/OSC1/CLKIN)
#pragma config WDTE = OFF             // Watchdog Timer Enable bit (WDT enabled)
#pragma config PWRTE = ON             // Power-up Timer Enable bit (PWRT enabled)
#pragma config MCLRE = ON             // RE3/MCLR pin function select bit (RE3/MCLR pin function is MCLR)
#pragma config CP = OFF               // Code Protection bit (Program memory code protection is disabled)
#pragma config BOREN = OFF            // Brown-out Reset Selection bits (BOR disabled)
#pragma config BORV = 19              // Brown-out Reset Voltage selection bit (Brown-out Reset Voltage (VBOR) set to 1.9 V nominal)
#pragma config PLLEN = ON             // INTOSC PLLEN Enable Bit (INTOSC Frequency is 16MHz (32x))

 //CONFIG2
#pragma config VCAPEN = DIS           // Voltage Regulator Capacitor Enable bits (All VCAP pin functions are disabled)
#else
#include <htc.h>                  //include the PIC microchip header file
//#include	<pic.h>
//#include 	"PR28.h"

//	configuration
//==========================================================================
__CONFIG(0x3CE4);							// set configuration bit of microcontroller

#endif


// Execute contained code ONE-TIME ONLY

// Create BButton variable type 
// Used for bit indicators for button presses
typedef struct {
	char BTN0 ;						
	char BTN1 ;
	char BTN2 ;
	char BTN3 ;
	char BTN4 ;
	char BTN5 ;
	char BTN6 ;
	char BTN7 ;
	char BTN8 ;				
						// Create sensors 0-8
} BButtons;

#endif /* PR28_H */

typedef struct {
	char SSPBF : 1;
} FFlags;

//==========================================================================================
//	define
//==========================================================================================
#define LED_R1			RC5
#define LED_R2			RC6
#define LED_R3			RC7
#define LED_B1			RA6
#define LED_B2			RA7
#define LED_B3			RA0
#define piezo			RC2
#define	lcd_data		PORTB
#define RS				RE0
#define E				RE1
#define SI1				RC1
#define RCK1			RC4
#define SCK1			RC3
#define SI2				RA5
#define RCK2			RE2
#define SCK2			RC0
#define SI3				RA1
#define RCK3			RA2
#define SCK3			RA3
#define NUM_BTTNS		9


