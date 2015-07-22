//=========================================================================
//	Author              : Cytron Technologies
//	Project             : PR 28 - Tic-Tac-Toe with mTouch
//	Project description	: Showing user the working of mTouch by 
//                        demonstrating Tic Tac Toe game. Compatible with
//                        -MPLAB IDE with HITECH C compiler
//                        -MPLABX with HITECH C compiler v9.83/v9.82/9.80 and XC8 compiler.
//==========================================================================

#include 	"PR28.h"




//==========================================================================================
//	define
//==========================================================================================
#define NUM_ROW				3
#define NUM_COL				3


//============================================================================================
//	global variable
//============================================================================================
unsigned int 	reading[NUM_BTTNS];		// current reading for each button
unsigned int 	average[NUM_BTTNS];		// running average for each button
unsigned int  	threshold;          // threshold value is req'd # counts decrease from avg
unsigned char	index;                // index value relates ea. button and scanning sequence
unsigned int 	threshold4;           // Threshold of 1/4th = 1/4th of the average value used in computation of threshold variable threshold is a selection of the sum of these
FFlags Flags;                       // Flags struct variable contains application status
BButtons Buttons;                   // Buttons struct variable indicates button presses
unsigned int	bigval;               // current button bigval   - for averaging technique
unsigned int	smallavg;             // current button smallavg - for averaging technique
unsigned char   result;
unsigned char   result1[NUM_ROW];
unsigned char	flag;
char			data;
unsigned char	matrix[NUM_ROW][NUM_COL];



//===========================================================================================
//	function prototype
//===========================================================================================
void Init(void);
void RestartTimers(void);
void RestartTimer1(void);
void SetNextChannel(void);
void CapInit(void);
void DisplayLEDs(void);
void interrupt isr(void);
void SLEEP_NOP(void);
void led_display1(unsigned char value1);
void led_display2(unsigned char value2);
void led_display3(unsigned char value3);
void delay(unsigned long data);			
void send_config(unsigned char data);
void send_char(unsigned char data);
void lcd_goto(unsigned char data);
void lcd_clr(void);
void lcd_shift(void);
void send_string(const char *s);
void e_pulse(void);
void draw(void);
void led_off (void);
void GetReading(void);
void PIEZO(void);
void PIEZO_D(void);
void PIEZO_S(void);
void store(void);
void player_1(void);
void player_2(void);
void checkflag(void);
char winlose(void);
void checkstatus(void);


/*====================================================================
========================  PROGRAM CODE  ==============================
====================================================================*/

//*********************************************************************
// 	main() ************************************************************
//	Main loop. ********************************************************
// ********************************************************************
void main(void) {

	Init();

	//configure lcd
	send_config(0b00000001);			//clear display at lcd
	send_config(0b00000010);			//lcd return to home 
	send_config(0b00000110);			//entry mode-cursor increase 1
	send_config(0b00001100);			//display on, cursor off and cursor blink off
	send_config(0b00111000);			//function set
	lcd_clr();                    // clear LCD
	lcd_goto(0);					
	send_string("Cytron Technologies Sdn Bhd   ");	// initial display
	lcd_goto(20);
	send_string("PR 28 - mTouch with Tic Tac Toe");
	delay(10000);
	for (int i = 0; i <15 ; i++)                    // shift display to left character by character
	{
			lcd_shift();
	}
	delay(30000);                     // delay
	lcd_clr();                        // clear LCD
	lcd_goto(0);                      // go to the first line of LCD
	send_string("Player 1 = red");		//guide for indicator
	lcd_goto(20);
	send_string("Player 2 = green");
	delay(60000);                     //delay
	lcd_clr();
	lcd_goto(0);
	send_string("Player 1 starts");		//guide who starts initially
	lcd_goto(20);
	send_string("first");
	delay(30000);

	Buttons.BTN0 = Buttons.BTN1 = Buttons.BTN2 = Buttons.BTN3 = 0;		// clear all variables
	Buttons.BTN4 = Buttons.BTN5 = Buttons.BTN6 = Buttons.BTN7 = 0;
	Buttons.BTN8 = 0;

	
	PIEZO_S();							// play starting melody
	while (data == ' ')					// if there is no winners or draw
	{
	 	if( flag == 0)					// if it is player 1's turn
	{
		lcd_clr();						// clear LCD
	 	lcd_goto(0);					// go to the first line of LCD
	 	send_string("Player 1's turn");	// display string
	}else								// if player 2's turn
	{
		lcd_clr();						// clear lcd
	 	lcd_goto(0);					// go to the first line of LCD
	 	send_string("Player 2's turn");	// display string
	}
	 checkflag();						// check who is player currently
	 data = winlose();					// check winner
	}
	if(data =='X'){						// if player 1 wins
	PIEZO();							// play melody
	lcd_clr();							// clear LCD
	lcd_goto(0);						// go to the first line of LCD
	send_string("congratulation! ");	// display string
	lcd_goto(20);						// go to the second line of LCD
	send_string("**player1 wins**");	// display string
	}
	if(data == 'O'){					// if player 2 wins
	PIEZO();							// play melody
	lcd_clr();							// clear LCD
	lcd_goto(0);						// go to the first line of LCD
	send_string("congratulation! ");	// sned string
	lcd_goto(20);						// go to the second line of LCD
	send_string("**player2 wins**");	// display string
	}while(data == 'd'){				// if draw
	PIEZO_D();							// play melody
	while(1){  
	 	draw();							// blink RGB LEDs in blue color
		lcd_clr();						// clear LCD
		lcd_goto(0);					// go to the first line	of LCD
		send_string("congratulation! ");// display string
		lcd_goto(20);					// go to the second line of LCD
		send_string("***draw***");		// display string
	}
	}
	while(1){}							// loop forever
}



// ************************************************************************************
// Function: Init() *******************************************************************
// Purpose: Initialize PORTS, Capacitive Sensing Module and Selected Time Base ********
// ************************************************************************************
void Init(void) 
 {

	// *********************************************************************************
	// PORT and LED Setup **************************************************************
	//**********************************************************************************
	// Pin usage for this sample application
	//--------------------------------------------------------------------------
	//			7		6		5		4		3		2		1		0      |
	// PORTA    LED_B2  LED_B1  SI_2    CPS8    SCK_3   RCK_3   SI_3    LED_B3 |    
	// PORTB    DB7     DB6     DB5     DB4     DB3     DB2     DB1     DB0    |
	// PORTC	LED_R3  LED_R2  LED_R1  RCK_1   SCK_1   BUZ     SI_1    SCK_2  | 
	// PORTD	CPS7    CPS6    CPS5    CPS4    CPS3    CPS2    CPS1    CPS0   |
	// PORTE	X		X		X		X		.		RCK_2   E		RS     |
	//--------------------------------------------------------------------------

	TRISA = 0b00010000;					// configure PORTA I/O direction
	TRISB = 0b00000000;					// configure PORTB as output
	TRISC = 0b00000000;					// configure PORTC as output
	TRISD = 0b11111111;					// configure PORTD as input
	TRISE = 0b00000000;					// configure PORTE as output
	PORTB = 0;							// clear PORTB
	PORTE = 0;							// clear PORTE

	led_off();

	ANSELA = 0x10;						// configure RA4 as anaolog pin
	ANSELB = 0x00;						// configure PORTB as digital pins
	ANSELE = 0x00;						// configure PORTE as digital pins
	ANSELD = 0b11111111;				// configure PORTD as analog pins

	result = 0;							// clear all variables
	flag = 0;
	index =0;
	OSCCON  = 0x10;						//internal oscillator frequency = 4MHz, HFIOSC has not yet locked and reached its maximum frequency
	



	// *********************************************************************************
	// Initialize Cap Module ***********************************************************
	// *********************************************************************************

	GIE = 1;							// enable general interrupt
	CPSCON0 = 0b10001101;				// csm is operating, oscillator is in high range, sinking current, Timer0 clock source is capacitive sensing oscillator
	CPSCON1 = 0b00001000;				// select capacitive sensing channel 0-8
	CapInit();							// initialize CSM
	data = winlose();					// check winners
	PEIE = 1;							// enable peripheral interrupt
 }



// *************************************************************************************
// Function: CapInit()
// Purpose: Initialize the Capacitive Sense Module and Time Base Modules
// *************************************************************************************

void CapInit(void)
 {

	// Set up variables
	for (index=0; index<9; index++) {		
		average[index] = 0;
		reading[index] = 0;
        }
	for(int i=0; i<3; i++){
	for(int j=0; j<3; j++){
	matrix[i][j] = ' ';
	}
	}

	// ********************************************************************************
	// Initialize for Timer2 time base and Timer 1 Gate *******************************
	// ********************************************************************************
	
	T2CON = 0b01110110;						// 1:15 post-scaler, Timer2 on , prescaler 16
	PR2   = 0xB4;							// set PR2 value
	TMR2IF = 0;								// clear timer 2 interrupt flag
	TMR2IE = 1;								// enable Timer 2 to PR2 match interrupt
	T1CON  = 0b11000101;					// Timer 1 clock source is capacitive sensing oscillator, 1:1 prescaler value, dedicated Timer 1 oscillator circuit enabled, do not synchronize external clock source, enable Timer 1
	T1GCON = 0b11100010;					// counting controlled by Timer 1 Gate function, active high, toggle mode enabled, single pulse mode enabled, single pulse acquisition has not started, TMR2 match PR2 output
	TMR1GIF = 0;							// clear Timer 1 Gate interrupt flag
	TMR1GIE   = 1;							// enable the Timer1 Gate Acquisition complete interrupt

	}

//********************************************************************
// ISR() *************************************************************
// Interrupt Service Routine *****************************************
// off all the timers and clear interrupt flag ***********************
// get the reading of Timer 1 ****************************************
//********************************************************************

void interrupt isr(void) 
  {
	
	while (TMR1GIF ) 				// if Timer 1 gate interrupt
	{
		// Perform touch reading
		TMR2ON =0;					// off Timer 2
		TMR1ON = 0;					// off Timer 1
		TMR1GIF = 0;				// clear Timer 1 gate interrupt flag
		
		GetReading();				// decode the reading
	}
}

//********************************************************************
// checkflag() *******************************************************
// Check which player turns ******************************************
// flag = 0 indicates player 1 and ***********************************
// flag = 1 indicates player 2 ***************************************
//********************************************************************
void checkflag(void)
{
		switch(flag){
		case 0: player_1(); break;
		case 1: player_2(); break;
		default: break;
		}
}

//********************************************************************
// player_1() ********************************************************
// player 1 routine **************************************************
// display RGB LEDs in red color if it is pressed ********************
//********************************************************************
void player_1(void)
{
	while(flag == 0){
	checkstatus();
	}
	
}

//********************************************************************
// player_2() ********************************************************
// player 2 routine **************************************************
// display RGB LEDs in green color if it is pressed ******************
//********************************************************************
void player_2(void)
{
	while (flag == 1){
	checkstatus();
	}
}

//********************************************************************
// store() ***********************************************************
// Record which position has been pressed ****************************
// for player 1, store 'X' into matrix *******************************
// for plater 2, store 'O' into matrix *******************************
//********************************************************************
void store(void)
{
	if (flag ==0){
	if(Buttons.BTN0 == 1) { matrix[0][0] = 'X';}
	if(Buttons.BTN1 == 1) { matrix[0][1] = 'X';}
	if(Buttons.BTN2 == 1) { matrix[0][2] = 'X';}
	if(Buttons.BTN3 == 1) { matrix[1][0] = 'X';}
	if(Buttons.BTN4 == 1) { matrix[1][1] = 'X';}
	if(Buttons.BTN5 == 1) { matrix[1][2] = 'X';}
	if(Buttons.BTN6 == 1) { matrix[2][0] = 'X';}
	if(Buttons.BTN7 == 1) { matrix[2][1] = 'X';}
	if(Buttons.BTN8 == 1) { matrix[2][2] = 'X';}
	}
	else if(flag == 1){
	if(Buttons.BTN0 == 1) { matrix[0][0] = 'O';}
	if(Buttons.BTN1 == 1) { matrix[0][1] = 'O';}
	if(Buttons.BTN2 == 1) { matrix[0][2] = 'O';}
	if(Buttons.BTN3 == 1) { matrix[1][0] = 'O';}
	if(Buttons.BTN4 == 1) { matrix[1][1] = 'O';}
	if(Buttons.BTN5 == 1) { matrix[1][2] = 'O';}
	if(Buttons.BTN6 == 1) { matrix[2][0] = 'O';}
	if(Buttons.BTN7 == 1) { matrix[2][1] = 'O';}
	if(Buttons.BTN8 == 1) { matrix[2][2] = 'O';}
	}
}

//********************************************************************
// checkstatus() *****************************************************
// Check availability of position ************************************
// if pressed, maintain flag *****************************************
// if not pressed, toggle flag, record postion and display LED *******
//********************************************************************
void checkstatus(void){
	if(Buttons.BTN0 ==1){
	if (matrix[0][0] =='X' | matrix[0][0] == 'O')	
	{ if(flag==0){flag = 0;}						
		else 
		flag = 1;
	}else {
	store();					
	DisplayLEDs();
	if(flag ==0){flag = 1;}
	else 
	flag = 0;
	}
	}
	if(Buttons.BTN1 ==1){
	if (matrix[0][1] =='X' | matrix[0][1] == 'O')
	{ if(flag==0){flag = 0;}
		else 
		flag = 1;
	}else {
	store();
	DisplayLEDs();
	if(flag ==0){flag = 1;}
	else 
	flag = 0;
	}
	}
	if(Buttons.BTN2 ==1){
	if (matrix[0][2] =='X' | matrix[0][2] == 'O')
	{ if(flag==0){flag = 0;}
		else 
		flag = 1;
	}else {
	store();
	DisplayLEDs();
	if(flag ==0){flag = 1;}
	else 
	flag = 0;
	}
	}
	if(Buttons.BTN3 ==1){
	if (matrix[1][0] =='X' | matrix[1][0] == 'O')
	{ if(flag==0){flag = 0;}
		else 
		flag = 1;
	}else {
	store();
	DisplayLEDs();
	if(flag ==0){flag = 1;}
	else 
	flag = 0;
	}
	}
	if(Buttons.BTN4 ==1){
	if (matrix[1][1] =='X' | matrix[1][1] == 'O')
	{ if(flag==0){flag = 0;}
		else 
		flag = 1;
	}else {
	store();
	DisplayLEDs();
	if(flag ==0){flag = 1;}
	else 
	flag = 0;
	}
	}
	if(Buttons.BTN5 ==1){
	if (matrix[1][2] =='X' | matrix[1][2] == 'O')
	{ if(flag==0){flag = 0;}
		else 
		flag = 1;
	}else {
	store();
	DisplayLEDs();
	if(flag ==0){flag = 1;}
	else 
	flag = 0;
	}
	}
	if(Buttons.BTN6 ==1){
	if (matrix[2][0] =='X' | matrix[2][0] == 'O')
	{ if(flag==0){flag = 0;}
		else 
		flag = 1;
	}else {
	store();
	DisplayLEDs();
	if(flag ==0){flag = 1;}
	else 
	flag = 0;
	}
	}
	if(Buttons.BTN7 ==1){
	if (matrix[2][1] =='X' | matrix[2][1] == 'O')
	{ if(flag==0){flag = 0;}
		else 
		flag = 1;
	}else {
	store();
	DisplayLEDs();
	if(flag ==0){flag = 1;}
	else 
	flag = 0;
	}
	}
	if(Buttons.BTN8 ==1){
	if (matrix[2][2] =='X' | matrix[2][2] == 'O')
	{ if(flag==0){flag = 0;}
		else 
		flag = 1;
	}else {
	store();
	DisplayLEDs();
	if(flag ==0){flag = 1;}
	else 
	flag = 0;
	}
	}
}

//********************************************************************
// GetReading() ******************************************************
// determine which button has been pressed ***************************
// Reads values of TMR1 corresponding to each button/sensor **********
// and makes decision if button/sensor has been touched. *************
//********************************************************************
void GetReading(void){
		bigval = TMR1L + (unsigned int)(TMR1H << 8);				//reading of current sensor which just complete the scan
		bigval = bigval * 16;										
		reading[index] = bigval;
		smallavg = average[index] / 16;
		threshold4     = average[index] >> 2;						// avg >> 2 = 1/4   = 25%   as a threshold value below average
		threshold = threshold4;									// ratiometric threshold from avail above (& combinations)
		if (bigval < average[index] - threshold) 
			{
			switch (index) 
				{
				case 0:		Buttons.BTN0  = 1;  break;					// The current button is pressed   
				case 1:		Buttons.BTN1  = 1;  break;					// Relay button pressed information to application
				case 2:		Buttons.BTN2  = 1;  break;	
				case 3:		Buttons.BTN3  = 1;  break;  
				case 4:		Buttons.BTN4  = 1;  break;	
				case 5:		Buttons.BTN5  = 1;  break;
				case 6:		Buttons.BTN6  = 1;  break;
				case 7:		Buttons.BTN7  = 1;  break;	
				case 8:		Buttons.BTN8  = 1;  break;	

				default:	break;
				}
			}
			else 
			{
			// Button unpressed (no hysteresis provided)
			switch (index) 
				{
				case 0:		Buttons.BTN0  = 0;  break;					// The current button is unpressed    
				case 1:		Buttons.BTN1  = 0;  break;					// Relay button pressed information to application
				case 2:		Buttons.BTN2  = 0;  break;	
				case 3:		Buttons.BTN3  = 0;  break;  
				case 4:		Buttons.BTN4  = 0;  break;	
				case 5:		Buttons.BTN5  = 0;  break;
				case 6:		Buttons.BTN6  = 0;  break;
				case 7:		Buttons.BTN7  = 0;  break;	
				case 8:		Buttons.BTN8  = 0;  break;	

				default:	break;
				}
		
			// Perform average after detection comparison
			average[index] += bigval/16 - smallavg;
			}
		SetNextChannel();				// Set up for next channel
		RestartTimer1();				// Restart timer1
}

//*********************************************************************
//Function: RestartTimers1() *******************************************
// Purpose: Resets and restarts timers 1 & 2 used for capacitive sensing.
//	Based on original method before Timer1 Gate peripheral features
//.	added to 72x. *****************************************************
//*********************************************************************
void RestartTimer1(void) 
  {
	TMR1L = 0;
	TMR1H = 0;
	TMR2 = 0;
	TMR2IF  = 0;
	TMR1ON = 1;
	TMR2ON = 1;	
  }

//**********************************************************************
//	SetNextChannel()  **************************************************
//		Sets the next channel for the oscillator to measure, ***********
//	configures all hardware appropriately, internal, and if ************
//	applicable external. ***********************************************
// *********************************************************************
void SetNextChannel(void) 
	{
	if (++index>= NUM_BTTNS)		// increment index 0->(NUM_SENSORS-1) with rollover
		index = 0;
		else;
		if(index==0)				// Select external pin CPS0..CPS8
			CPSCON1 = 0b00001000;
		if(index==1)
			CPSCON1 = 0b00001001;
		if(index==2)
			CPSCON1 = 0b00001010;
		if(index == 3)
			CPSCON1 = 0b00001011;
		if(index== 4)
			CPSCON1 = 0b00001100;
		if(index == 5)
			CPSCON1 = 0b00001101;
		if(index ==6)
			CPSCON1 = 0b00001110;
		if (index ==7)
			CPSCON1 = 0b00001111;
		if (index == 8)
			CPSCON1 = 0b00000110;
	}

//************************************************************************
// Function: DisplayLEDs() ***********************************************
// Display ouput button on LEDS ******************************************
// accordingly with the players ******************************************
// ***********************************************************************

void DisplayLEDs(void) 
{
		LED_R1 = 1; LED_R2 =1; LED_R3 =1; 			// ON all rows of the cathode of RGB LEDs
		LED_B1 = LED_B2 = LED_B3 = 0; 				// pull the anode of blue color pin of RGB to low
	

		for(int k = 0; k< 3 ; k++)					// check all the posibilities of button pressed and on LED accordingly
	{
		led_display1(result1[0]);led_display2(result1[1]);led_display3(result1[2]);
		if(matrix[0][k] == 'O' & matrix[1][k] == 'O' & matrix[2][k] == 'O'){result1[k] = 0b01001001;}
		else if(matrix[0][k] == 'O' & matrix[1][k] == 'O' & matrix[2][k] == ' '){result1[k] = 0b01001000;}
		else if(matrix[0][k] == 'O' & matrix[1][k] == ' ' & matrix[2][k] == 'O'){result1[k] = 0b01000001;}
		else if(matrix[0][k] == 'O' & matrix[1][k] == ' ' & matrix[2][k] == ' '){result1[k] = 0b01000000;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == 'O' & matrix[2][k] == 'O'){result1[k] = 0b00001001;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == 'O' & matrix[2][k] == ' '){result1[k] = 0b00001000;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == ' ' & matrix[2][k] == 'O'){result1[k] = 0b00000001;}

		else if(matrix[0][k] == 'O' & matrix[1][k] == 'O' & matrix[2][k] == 'X'){result1[k] = 0b01001010;}
		else if(matrix[0][k] == 'O' & matrix[1][k] == 'O' & matrix[2][k] == ' '){result1[k] = 0b01001000;}
		else if(matrix[0][k] == 'O' & matrix[1][k] == ' ' & matrix[2][k] == 'X'){result1[k] = 0b01000010;}
		else if(matrix[0][k] == 'O' & matrix[1][k] == ' ' & matrix[2][k] == ' '){result1[k] = 0b01000000;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == 'O' & matrix[2][k] == 'X'){result1[k] = 0b00001010;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == 'O' & matrix[2][k] == ' '){result1[k] = 0b00001000;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == ' ' & matrix[2][k] == 'X'){result1[k] = 0b00000010;}
		
		else if(matrix[0][k] == 'O' & matrix[1][k] == 'X' & matrix[2][k] == 'O'){result1[k] = 0b01010001;}
		else if(matrix[0][k] == 'O' & matrix[1][k] == 'X' & matrix[2][k] == ' '){result1[k] = 0b01010000;}
		else if(matrix[0][k] == 'O' & matrix[1][k] == ' ' & matrix[2][k] == 'O'){result1[k] = 0b01000001;}
		else if(matrix[0][k] == 'O' & matrix[1][k] == ' ' & matrix[2][k] == ' '){result1[k] = 0b01000000;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == 'X' & matrix[2][k] == 'O'){result1[k] = 0b00010001;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == 'X' & matrix[2][k] == ' '){result1[k] = 0b00010000;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == ' ' & matrix[2][k] == 'O'){result1[k] = 0b00000001;}

		else if(matrix[0][k] == 'O' & matrix[1][k] == 'X' & matrix[2][k] == 'X'){result1[k] = 0b01010010;}
		else if(matrix[0][k] == 'O' & matrix[1][k] == 'X' & matrix[2][k] == ' '){result1[k] = 0b01010000;}
		else if(matrix[0][k] == 'O' & matrix[1][k] == ' ' & matrix[2][k] == 'X'){result1[k] = 0b01000010;}
		else if(matrix[0][k] == 'O' & matrix[1][k] == ' ' & matrix[2][k] == ' '){result1[k] = 0b01000000;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == 'X' & matrix[2][k] == 'X'){result1[k] = 0b00010010;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == 'X' & matrix[2][k] == ' '){result1[k] = 0b00010000;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == ' ' & matrix[2][k] == 'X'){result1[k] = 0b00000010;} 

		else if(matrix[0][k] == 'X' & matrix[1][k] == 'O' & matrix[2][k] == 'O'){result1[k] = 0b10001001;}
		else if(matrix[0][k] == 'X' & matrix[1][k] == 'O' & matrix[2][k] == ' '){result1[k] = 0b10001000;}
		else if(matrix[0][k] == 'X' & matrix[1][k] == ' ' & matrix[2][k] == 'O'){result1[k] = 0b10000001;}
		else if(matrix[0][k] == 'X' & matrix[1][k] == ' ' & matrix[2][k] == ' '){result1[k] = 0b10000000;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == 'O' & matrix[2][k] == 'O'){result1[k] = 0b00001001;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == 'O' & matrix[2][k] == ' '){result1[k] = 0b00001000;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == ' ' & matrix[2][k] == 'O'){result1[k] = 0b00000001;}

		else if(matrix[0][k] == 'X' & matrix[1][k] == 'O' & matrix[2][k] == 'X'){result1[k] = 0b10001010;}
		else if(matrix[0][k] == 'X' & matrix[1][k] == 'O' & matrix[2][k] == ' '){result1[k] = 0b10001000;}
		else if(matrix[0][k] == 'X' & matrix[1][k] == ' ' & matrix[2][k] == 'X'){result1[k] = 0b10000010;}
		else if(matrix[0][k] == 'X' & matrix[1][k] == ' ' & matrix[2][k] == ' '){result1[k] = 0b10000000;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == 'O' & matrix[2][k] == 'X'){result1[k] = 0b00001010;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == 'O' & matrix[2][k] == ' '){result1[k] = 0b00001000;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == ' ' & matrix[2][k] == 'X'){result1[k] = 0b00000010;}

		else if(matrix[0][k] == 'X' & matrix[1][k] == 'X' & matrix[2][k] == 'O'){result1[k] = 0b10010001;}
		else if(matrix[0][k] == 'X' & matrix[1][k] == 'X' & matrix[2][k] == ' '){result1[k] = 0b10010000;}
		else if(matrix[0][k] == 'X' & matrix[1][k] == ' ' & matrix[2][k] == 'O'){result1[k] = 0b10000001;}
		else if(matrix[0][k] == 'X' & matrix[1][k] == ' ' & matrix[2][k] == ' '){result1[k] = 0b10000000;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == 'X' & matrix[2][k] == 'O'){result1[k] = 0b00010001;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == 'X' & matrix[2][k] == ' '){result1[k] = 0b00010000;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == ' ' & matrix[2][k] == 'O'){result1[k] = 0b00000001;}

		else if(matrix[0][k] == 'X' & matrix[1][k] == 'X' & matrix[2][k] == 'X'){result1[k] = 0b10010010;}
		else if(matrix[0][k] == 'X' & matrix[1][k] == 'X' & matrix[2][k] == ' '){result1[k] = 0b10010000;}
		else if(matrix[0][k] == 'X' & matrix[1][k] == ' ' & matrix[2][k] == 'X'){result1[k] = 0b10000010;}
		else if(matrix[0][k] == 'X' & matrix[1][k] == ' ' & matrix[2][k] == ' '){result1[k] = 0b10000000;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == 'X' & matrix[2][k] == 'X'){result1[k] = 0b00010010;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == 'X' & matrix[2][k] == ' '){result1[k] = 0b00010000;}
		else if(matrix[0][k] == ' ' & matrix[1][k] == ' ' & matrix[2][k] == 'X'){result1[k] = 0b00000010;}
	
		led_display1(result1[0]);led_display2(result1[1]);led_display3(result1[2]);
	}	
}

//************************************************************************
// Function: led_display2() **********************************************
// display first row of RGB led using 74hc595 hift register **************
// ***********************************************************************
void led_display1(unsigned char value1)
{
	if((value1&0b00000001)==1)		SI1=1;		// use 74HC595 and detect the serial-in data and
	else	SI1=0;								//display result in parallel
	SCK1=1;
	SCK1=0;

	if(((value1&0b00000010)>>1)==1)	SI1=1;
	else	SI1=0;
	SCK1=1;
	SCK1=0;

	if(((value1&0b00000100)>>2)==1)	SI1=1;
	else	SI1=0;
	SCK1=1;
	SCK1=0;

	if(((value1&0b00001000)>>3)==1)	SI1=1;
	else	SI1=0;
	SCK1=1;
	SCK1=0;
	
	if(((value1&0b00010000)>>4)==1)	SI1=1;
	else	SI1=0;
	SCK1=1;
	SCK1=0;

	if(((value1&0b00100000)>>5)==1)	SI1=1;
	else	SI1=0;
	SCK1=1;
	SCK1=0;

	if(((value1&0b01000000)>>6)==1)	SI1=1;
	else	SI1=0;
	SCK1=1;
	SCK1=0;

	if(((value1&0b10000000)>>7)==1)	SI1=1;
	else	SI1=0;
	SCK1=1;
	SCK1=0;

	RCK1=1;
	RCK1=0;
}

//************************************************************************
// Function: led_display2() **********************************************
// display second row of RGB led using 74hc595 hift register *************
// ***********************************************************************
void led_display2(unsigned char value2)
{
	if((value2&0b00000001)==1)		SI2=1;		// use 74HC595 and detect the serial-in data and
	else	SI2=0;								//display result in parallel
	SCK2=1;
	SCK2=0;

	if(((value2&0b00000010)>>1)==1)	SI2=1;
	else	SI2=0;
	SCK2=1;
	SCK2=0;

	if(((value2&0b00000100)>>2)==1)	SI2=1;
	else	SI2=0;
	SCK2=1;
	SCK2=0;

	if(((value2&0b00001000)>>3)==1)	SI2=1;
	else	SI2=0;
	SCK2=1;
	SCK2=0;
	
	if(((value2&0b00010000)>>4)==1)	SI2=1;
	else	SI2=0;
	SCK2=1;
	SCK2=0;

	if(((value2&0b00100000)>>5)==1)	SI2=1;
	else	SI2=0;
	SCK2=1;
	SCK2=0;

	if(((value2&0b01000000)>>6)==1)	SI2=1;
	else	SI2=0;
	SCK2=1;
	SCK2=0;

	if(((value2&0b10000000)>>7)==1)	SI2=1;
	else	SI2=0;
	SCK2=1;
	SCK2=0;

	RCK2=1;
	RCK2=0;
}

//************************************************************************
// Function: led_display3() **********************************************
// display third row of RGB led using 74hc595 hift register **************
// ***********************************************************************
void led_display3(unsigned char value3)
{
	if((value3&0b00000001)==1)		SI3=1;		// use 74HC595 and detect the serial-in data and
	else	SI3=0;								//display result in parallel
	SCK3=1;
	SCK3=0;

	if(((value3&0b00000010)>>1)==1)	SI3=1;
	else	SI3=0;
	SCK3=1;
	SCK3=0;

	if(((value3&0b00000100)>>2)==1)	SI3=1;
	else	SI3=0;
	SCK3=1;
	SCK3=0;

	if(((value3&0b00001000)>>3)==1)	SI3=1;
	else	SI3=0;
	SCK3=1;
	SCK3=0;
	
	if(((value3&0b00010000)>>4)==1)	SI3=1;
	else	SI3=0;
	SCK3=1;
	SCK3=0;

	if(((value3&0b00100000)>>5)==1)	SI3=1;
	else	SI3=0;
	SCK3=1;
	SCK3=0;

	if(((value3&0b01000000)>>6)==1)	SI3=1;
	else	SI3=0;
	SCK3=1;
	SCK3=0;

	if(((value3&0b10000000)>>7)==1)	SI3=1;
	else	SI3=0;
	SCK3=1;
	SCK3=0;

	RCK3=1;
	RCK3=0;
}

//************************************************************************
// Function: delay() *****************************************************
// delay routine *********************************************************
// ***********************************************************************
void delay(unsigned long data)			//delay function, the delay time
{										//depend on the given value
	for( ;data>0;data-=1);
}

//************************************************************************
// Function: send_config() ***********************************************
// send the configuration of LCD *****************************************
// ***********************************************************************
void send_config(unsigned char data)
{
	RS=0;								//clear rs into config mode
	lcd_data=data;
	delay(50);
	e_pulse();
}

//************************************************************************
// Function: send_char() *************************************************
// send character to LCD *************************************************
// ***********************************************************************
void send_char(unsigned char data)
{
	RS=1;								//set rs into write mode
	lcd_data=data;						 
	delay(50);
	e_pulse();
}

//************************************************************************
// Function: e_pulse() ***************************************************
// ***********************************************************************
// ***********************************************************************
void e_pulse(void)
{
	E=1;
	delay(50);
	E=0;
	delay(50);
}

//************************************************************************
// Function: lcd_goto() **************************************************
// determine the location of string to be displayed at LCD ***************
// ***********************************************************************
void lcd_goto(unsigned char data)
{
 	if(data<16)
	{
	 	send_config(0x80+data);
	}
	else
	{
	 	data=data-20;
		send_config(0xc0+data);
	}
}

//************************************************************************
// Function: lcd_shift() *************************************************
// shift LCD display to the left *****************************************
// ***********************************************************************
void lcd_shift(void)
{
	send_config(0x18);
	delay(6000);
}

//************************************************************************
// Function: lcd_clr() ***************************************************
// clear LCD display *****************************************************
// ***********************************************************************
void lcd_clr(void)
{
 	send_config(0x01);
	delay(50);	
}

//************************************************************************
// Function: send_string() ***********************************************
// send string to LCD ****************************************************
// ***********************************************************************
void send_string(const char *s)
{          
	//unsigned char i=0;
  	while (s && *s)send_char (*s++);

}

//************************************************************************
// Function: draw() ******************************************************
// blink RGB LEDs in blue color ******************************************
// ***********************************************************************
void draw(void){

	LED_R1 = LED_R2 = LED_R3 = 1;		// ON all three rows of cathode of RGB LEDs
	result = 0b00100100;				// ON blue color LEDs
	LED_B1 = LED_B2 = LED_B3 = 1;		
	led_display1(result);				// display result
	led_display2(result);
	led_display3(result);
	delay(3500);						// delay
	led_off();							// switch off LEDs
	delay(3500);						// delay
}

//************************************************************************
// Function: led_off() ***************************************************
// switch off all RGB LEDs ***********************************************
// ***********************************************************************
void led_off(void)
{
	result = 0b00000000;
	LED_B1 = LED_B2 = LED_B3 = 0;
	LED_R1 = LED_R2 = LED_R3 = 0;
	led_display1(result);
	led_display2(result);
	led_display3(result);
}

//************************************************************************
// Function: PIEZO() *****************************************************
// play the winner melody ************************************************
// ***********************************************************************
void PIEZO(void)
{
	GIE=0;							// disable global interrupt
	TMR2ON = 0;						// off Timer 2
	TMR1ON = 0;						// off Timer 1
	
	CCP1CON = 0b00001100;			// enable PWM mode
	T2CON = 0b00000111;				// 1:1 postscaler, timer 2 ON, prescaler 16
	PR2 = 0x76;						// note C
	CCPR1L = 50;
	delay(4000);
	PR2 = 0x7D;						// note b
	CCPR1L = 50;
	delay(4000);
	PR2 = 0x9E;						// note g
	CCPR1L = 50;
	delay(4000);
	PR2 = 0x76;						// note C
	CCPR1L = 100;
	delay(8000);
	PR2 = 0x7D;						// note b
	CCPR1L = 100;
	delay(8000);
	PR2 = 0xBD;						// note e
	CCPR1L = 50;
	delay(4000);
	PR2 = 0x00;						// rest
	CCPR1L = 50;
	delay(2000);
	PR2 = 0x76;						// note C
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xEE;						// note c
	CCPR1L = 50;
	delay(4000);
	PR2 = 0x9E;						// note g
	CCPR1L = 50;
	delay(4000);
	PR2 = 0x8D;						// note a
	CCPR1L = 50;
	delay(8000);
	PR2 = 0x76;						// note C
	CCPR1L = 50;
	delay(8000);

	CCP1CON = 0x00;					// disable PWM
	T2CON=0b01110110;				// reset to CSM configuration
	PR2 = 0xB4;
	CCPR1L = 0;

	TMR2IF = 0;						// clear Timer 2 interrupt flag
	TMR2IE = 1;						// enable Timer 2 to PR2 match interrupt
	T1CON  = 0b11000101;			// reset to CSM configuration
	T1GCON = 0b11100010;			// 			"
	TMR1GIF = 0;					// clear Timer 1 gate interrupt
	TMR1GIE = 1;					// enable Timer 1 Gate Acquisition complete interrupt

	RestartTimer1();				// restart Timer
	GIE = 1;						// enable global interrupt
}

//************************************************************************
// Function: PIEZO_D() ***************************************************
// play the draw melody **************************************************
// ***********************************************************************
void PIEZO_D(void)
{
	GIE=0;							// disable global interrupt
	TMR2ON = 0;						// OFF Timer 2
	TMR1ON = 0;						// OFF Timer 1
	CCP1CON = 0b00001100;			// enable PWM mode
	T2CON = 0b00000111;				// 1:1 postscaler, timer 2 ON, prescaler 16
	PR2 = 0xBC;						// note E
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xBC;						// note E
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xB2;						// note f
	CCPR1L = 50;
	delay(4000);
	PR2 = 0x9E;						// note g
	CCPR1L = 100;
	delay(4000);
	PR2 = 0x9E;						// note g
	CCPR1L = 100;
	delay(4000);
	PR2 = 0xB2;						// note f
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xBC;						// note E
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xD3;						// note D
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xEE;						// note c
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xEE;						// note c
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xD3;						// note D
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xBC;						// note E
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xBC;						// note E
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xD3;						// note D
	CCPR1L = 50;
	delay(2000);
	PR2 = 0xD3;						// note D
	CCPR1L = 50;
	delay(8000);
	PR2 = 0xBC;						// note E
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xBC;						// note E
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xB2;						// note f
	CCPR1L = 50;
	delay(4000);
	PR2 = 0x9E;						// note g
	CCPR1L = 50;
	delay(4000);
	PR2 = 0x9E;						// note g
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xB2;						// note E
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xBC;						// note E
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xD3;						// note D
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xEE;						// note c
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xEE;						// note c
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xD3;						// note D
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xBC;						// note E
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xD3;						// note D
	CCPR1L = 50;
	delay(4000);
	PR2 = 0xEE;						// note c
	CCPR1L = 50;
	delay(2000);
	PR2 = 0xEE;						// note c
	CCPR1L = 50;
	delay(8000);

	CCP1CON = 0x00;					// disable PWM mode
	T2CON=0b01110110;				// reset to CSM configuration
	PR2 = 0xB4;
	CCPR1L = 0;

	TMR2IF = 0;						// clear Timer 2 interrupt flag
	TMR2IE = 1;						// enable Timer 2 to PR2 match interrupt
	T1CON = 0b11000101;				// reset to CSM configuration
	T1GCON = 0b11100010;			//			"
	TMR1GIF = 0;					// clear Timer 1 Gate interrupt flag
	TMR1GIE = 1;					// enable Timer 1 Gate Acquisition complete interrupt

	RestartTimer1();				// restart timer
	GIE = 1;						// enable global interrupt
}

//************************************************************************
// Function: PIEZO_S() ***************************************************
// play the starting melody **********************************************
// ***********************************************************************
void PIEZO_S(void)
{
	GIE=0;							// disable global interrupt
	TMR2ON = 0;						// OFF Timer 2
	TMR1ON = 0;						// OFF Timer 1
	
	CCP1CON = 0b00001100;			// enable PWM mode
	T2CON = 0b00000111;				// 1:1 postscaler, timer 2 ON, prescaler 16

	PR2 = 0xEE;						// note c
	CCPR1L = 50;
	delay(2000);
	PR2 = 0xD3;						// note d
	CCPR1L = 50;
	delay(2000);
	PR2 = 0xBD;						// note e
	CCPR1L = 100;
	delay(2000);
	PR2 = 0xB2;						// note f
	CCPR1L = 100;
	delay(2000);
	PR2 = 0x9E;						// note g
	CCPR1L = 50;
	delay(2000);
	PR2 = 0x8D;						// note a
	CCPR1L = 50;
	delay(2000);
	PR2 = 0x7D;						// note b
	CCPR1L = 50;
	delay(2000);
	PR2 = 0x76;						// note C
	CCPR1L = 50;
	delay(4000);


	CCP1CON = 0x00;					// disable PWM mode
	T2CON=0b01110110;				// reset to CSM configuration
	PR2 = 0xB4;
	CCPR1L = 0;

	TMR2IF = 0;						// clear Timer 2 interrupt flag
	TMR2IE = 1;						// enable Timer 2 to PR2 match interrupt
	T1CON = 0b11000101;				// reset to CSM configuration
	T1GCON = 0b11100010;			// 				"
	TMR1GIF = 0;					// clear Timer 1 Gate Interrupt
	TMR1GIE = 1;					// enable Timer 1 Gate Acquisition complete interrupt

	RestartTimer1();				// restart timer
	GIE = 1;						// enable global interrupt
}

//************************************************************************
// Function: winlose() ***************************************************
// check winners *********************************************************
// ***********************************************************************
char winlose(void)
{
	int status;
	int i,j;
	status =0;
	char flag_w;
	for(int i=0; i<3; i++)
	{
	//check row
	if((matrix[i][0]== matrix[i][1]) & (matrix[i][0] == matrix[i][2])){
	return matrix[i][0];
	}
	//check column
	if(matrix[0][i] == matrix[1][i] & matrix[0][i] == matrix[2][i]){
	return matrix[0][i];
	}
	//check diagonals
	if(matrix[0][0] == matrix[1][1] & matrix[0][0] == matrix[2][2]){
	return matrix[0][0];
	}
	if(matrix[0][2] == matrix[1][1] & matrix[0][2] == matrix[2][0]){
	return matrix[0][2];
	}
	
	//check draw
	}
	for(int i=0; i<3; i++){
	for(int j=0; j<3; j++){
	if(matrix[i][j] == ' '){
	status++;
	}else{
	status = status;
	}
	}
	}
	if(status == 0){
	flag_w = 'd';
	return flag_w;
	}else{
	flag_w = ' ';
	return flag_w;
	}
}	