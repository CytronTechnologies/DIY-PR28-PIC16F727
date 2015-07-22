//=========================================================================
//	File name			: PR28.h		
//	Description			: header file
//==========================================================================
#ifndef PR28_H
#define PR28_H
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
#define rs				RE0
#define e				RE1
#define si1				RC1
#define rck1			RC4
#define sck1			RC3
#define si2				RA5
#define rck2			RE2
#define sck2			RC0
#define si3				RA1
#define rck3			RA2
#define sck3			RA3
#define NUM_BTTNS		9


