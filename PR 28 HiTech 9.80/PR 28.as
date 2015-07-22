opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 6738"

opt pagewidth 120

	opt lm

	processor	16F727
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 12 "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	psect config,class=CONFIG,delta=2 ;#
# 12 "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	dw 0x3CE4 ;#
	FNCALL	_main,_Init
	FNCALL	_main,_send_config
	FNCALL	_main,_lcd_clr
	FNCALL	_main,_lcd_goto
	FNCALL	_main,_send_string
	FNCALL	_main,_delay
	FNCALL	_main,_lcd_shift
	FNCALL	_main,_PIEZO_S
	FNCALL	_main,_checkflag
	FNCALL	_main,_winlose
	FNCALL	_main,_PIEZO
	FNCALL	_main,_PIEZO_D
	FNCALL	_main,_draw
	FNCALL	_checkflag,_player_1
	FNCALL	_checkflag,_player_2
	FNCALL	_player_2,_checkstatus
	FNCALL	_player_1,_checkstatus
	FNCALL	_lcd_shift,_send_config
	FNCALL	_lcd_shift,_delay
	FNCALL	_send_string,_send_char
	FNCALL	_lcd_goto,_send_config
	FNCALL	_lcd_clr,_send_config
	FNCALL	_lcd_clr,_delay
	FNCALL	_send_char,_delay
	FNCALL	_send_char,_e_pulse
	FNCALL	_checkstatus,_store
	FNCALL	_checkstatus,_DisplayLEDs
	FNCALL	_draw,_led_display1
	FNCALL	_draw,_led_display2
	FNCALL	_draw,_led_display3
	FNCALL	_draw,_delay
	FNCALL	_draw,_led_off
	FNCALL	_send_config,_delay
	FNCALL	_send_config,_e_pulse
	FNCALL	_Init,_led_off
	FNCALL	_Init,_CapInit
	FNCALL	_Init,_winlose
	FNCALL	_e_pulse,_delay
	FNCALL	_DisplayLEDs,_led_display1
	FNCALL	_DisplayLEDs,_led_display2
	FNCALL	_DisplayLEDs,_led_display3
	FNCALL	_CapInit,___bmul
	FNCALL	_led_off,_led_display1
	FNCALL	_led_off,_led_display2
	FNCALL	_led_off,_led_display3
	FNCALL	_PIEZO_D,_delay
	FNCALL	_PIEZO_D,_RestartTimer1
	FNCALL	_PIEZO,_delay
	FNCALL	_PIEZO,_RestartTimer1
	FNCALL	_winlose,___bmul
	FNCALL	_PIEZO_S,_delay
	FNCALL	_PIEZO_S,_RestartTimer1
	FNROOT	_main
	FNCALL	_isr,_GetReading
	FNCALL	_GetReading,_SetNextChannel
	FNCALL	_GetReading,i1_RestartTimer1
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	_average
	global	_Buttons
	global	_matrix
	global	_result1
	global	_smallavg
	global	_threshold
	global	_threshold4
	global	_Flags
	global	_data
	global	_flag
	global	_index
	global	_result
	global	_bigval
	global	_reading
	global	_CCP1CON
psect	text692,local,class=CODE,delta=2
global __ptext692
__ptext692:
_CCP1CON	set	23
	global	_CCPR1L
_CCPR1L	set	21
	global	_PORTB
_PORTB	set	6
	global	_PORTE
_PORTE	set	9
	global	_T1CON
_T1CON	set	16
	global	_T2CON
_T2CON	set	18
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_TMR2
_TMR2	set	17
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RA0
_RA0	set	40
	global	_RA1
_RA1	set	41
	global	_RA2
_RA2	set	42
	global	_RA3
_RA3	set	43
	global	_RA5
_RA5	set	45
	global	_RA6
_RA6	set	46
	global	_RA7
_RA7	set	47
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC3
_RC3	set	59
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_RC6
_RC6	set	62
	global	_RC7
_RC7	set	63
	global	_RE0
_RE0	set	72
	global	_RE1
_RE1	set	73
	global	_RE2
_RE2	set	74
	global	_TMR1GIF
_TMR1GIF	set	103
	global	_TMR1ON
_TMR1ON	set	128
	global	_TMR2IF
_TMR2IF	set	97
	global	_TMR2ON
_TMR2ON	set	146
	global	_OSCCON
_OSCCON	set	144
	global	_PR2
_PR2	set	146
	global	_T1GCON
_T1GCON	set	143
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_TRISE
_TRISE	set	137
	global	_TMR1GIE
_TMR1GIE	set	1127
	global	_TMR2IE
_TMR2IE	set	1121
	global	_CPSCON0
_CPSCON0	set	264
	global	_CPSCON1
_CPSCON1	set	265
	global	_ANSELA
_ANSELA	set	389
	global	_ANSELB
_ANSELB	set	390
	global	_ANSELD
_ANSELD	set	392
	global	_ANSELE
_ANSELE	set	393
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_2:	
	retlw	80	;'P'
	retlw	82	;'R'
	retlw	32	;' '
	retlw	50	;'2'
	retlw	56	;'8'
	retlw	32	;' '
	retlw	45	;'-'
	retlw	32	;' '
	retlw	109	;'m'
	retlw	84	;'T'
	retlw	111	;'o'
	retlw	117	;'u'
	retlw	99	;'c'
	retlw	104	;'h'
	retlw	32	;' '
	retlw	119	;'w'
	retlw	105	;'i'
	retlw	116	;'t'
	retlw	104	;'h'
	retlw	32	;' '
	retlw	84	;'T'
	retlw	105	;'i'
	retlw	99	;'c'
	retlw	32	;' '
	retlw	84	;'T'
	retlw	97	;'a'
	retlw	99	;'c'
	retlw	32	;' '
	retlw	84	;'T'
	retlw	111	;'o'
	retlw	101	;'e'
	retlw	0
psect	strings
	
STR_1:	
	retlw	67	;'C'
	retlw	121	;'y'
	retlw	116	;'t'
	retlw	114	;'r'
	retlw	111	;'o'
	retlw	110	;'n'
	retlw	32	;' '
	retlw	84	;'T'
	retlw	101	;'e'
	retlw	99	;'c'
	retlw	104	;'h'
	retlw	110	;'n'
	retlw	111	;'o'
	retlw	108	;'l'
	retlw	111	;'o'
	retlw	103	;'g'
	retlw	105	;'i'
	retlw	101	;'e'
	retlw	115	;'s'
	retlw	32	;' '
	retlw	83	;'S'
	retlw	100	;'d'
	retlw	110	;'n'
	retlw	32	;' '
	retlw	66	;'B'
	retlw	104	;'h'
	retlw	100	;'d'
	retlw	32	;' '
	retlw	32	;' '
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_9:	
	retlw	99	;'c'
	retlw	111	;'o'
	retlw	110	;'n'
	retlw	103	;'g'
	retlw	114	;'r'
	retlw	97	;'a'
	retlw	116	;'t'
	retlw	117	;'u'
	retlw	108	;'l'
	retlw	97	;'a'
	retlw	116	;'t'
	retlw	105	;'i'
	retlw	111	;'o'
	retlw	110	;'n'
	retlw	33	;'!'
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_10:	
	retlw	42	;'*'
	retlw	42	;'*'
	retlw	112	;'p'
	retlw	108	;'l'
	retlw	97	;'a'
	retlw	121	;'y'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	49	;'1'
	retlw	32	;' '
	retlw	119	;'w'
	retlw	105	;'i'
	retlw	110	;'n'
	retlw	115	;'s'
	retlw	42	;'*'
	retlw	42	;'*'
	retlw	0
psect	strings
	
STR_12:	
	retlw	42	;'*'
	retlw	42	;'*'
	retlw	112	;'p'
	retlw	108	;'l'
	retlw	97	;'a'
	retlw	121	;'y'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	50	;'2'
	retlw	32	;' '
	retlw	119	;'w'
	retlw	105	;'i'
	retlw	110	;'n'
	retlw	115	;'s'
	retlw	42	;'*'
	retlw	42	;'*'
	retlw	0
psect	strings
	
STR_4:	
	retlw	80	;'P'
	retlw	108	;'l'
	retlw	97	;'a'
	retlw	121	;'y'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	32	;' '
	retlw	50	;'2'
	retlw	32	;' '
	retlw	61	;'='
	retlw	32	;' '
	retlw	103	;'g'
	retlw	114	;'r'
	retlw	101	;'e'
	retlw	101	;'e'
	retlw	110	;'n'
	retlw	0
psect	strings
	
STR_7:	
	retlw	80	;'P'
	retlw	108	;'l'
	retlw	97	;'a'
	retlw	121	;'y'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	32	;' '
	retlw	49	;'1'
	retlw	39	;'''
	retlw	115	;'s'
	retlw	32	;' '
	retlw	116	;'t'
	retlw	117	;'u'
	retlw	114	;'r'
	retlw	110	;'n'
	retlw	0
psect	strings
	
STR_8:	
	retlw	80	;'P'
	retlw	108	;'l'
	retlw	97	;'a'
	retlw	121	;'y'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	32	;' '
	retlw	50	;'2'
	retlw	39	;'''
	retlw	115	;'s'
	retlw	32	;' '
	retlw	116	;'t'
	retlw	117	;'u'
	retlw	114	;'r'
	retlw	110	;'n'
	retlw	0
psect	strings
	
STR_5:	
	retlw	80	;'P'
	retlw	108	;'l'
	retlw	97	;'a'
	retlw	121	;'y'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	32	;' '
	retlw	49	;'1'
	retlw	32	;' '
	retlw	115	;'s'
	retlw	116	;'t'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	116	;'t'
	retlw	115	;'s'
	retlw	0
psect	strings
	
STR_3:	
	retlw	80	;'P'
	retlw	108	;'l'
	retlw	97	;'a'
	retlw	121	;'y'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	32	;' '
	retlw	49	;'1'
	retlw	32	;' '
	retlw	61	;'='
	retlw	32	;' '
	retlw	114	;'r'
	retlw	101	;'e'
	retlw	100	;'d'
	retlw	0
psect	strings
	
STR_14:	
	retlw	42	;'*'
	retlw	42	;'*'
	retlw	42	;'*'
	retlw	100	;'d'
	retlw	114	;'r'
	retlw	97	;'a'
	retlw	119	;'w'
	retlw	42	;'*'
	retlw	42	;'*'
	retlw	42	;'*'
	retlw	0
psect	strings
	
STR_6:	
	retlw	102	;'f'
	retlw	105	;'i'
	retlw	114	;'r'
	retlw	115	;'s'
	retlw	116	;'t'
	retlw	0
psect	strings
STR_11	equ	STR_9+0
STR_13	equ	STR_9+0
	file	"PR 28.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_bigval:
       ds      2

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_average:
       ds      18

_Buttons:
       ds      9

_matrix:
       ds      9

_result1:
       ds      3

_smallavg:
       ds      2

_threshold:
       ds      2

_threshold4:
       ds      2

_Flags:
       ds      1

_data:
       ds      1

_flag:
       ds      1

_index:
       ds      1

_result:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_reading:
       ds      18

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+032h)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+012h)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_Init
?_Init:	; 0 bytes @ 0x0
	global	?_send_config
?_send_config:	; 0 bytes @ 0x0
	global	?_lcd_clr
?_lcd_clr:	; 0 bytes @ 0x0
	global	?_lcd_goto
?_lcd_goto:	; 0 bytes @ 0x0
	global	?_send_string
?_send_string:	; 0 bytes @ 0x0
	global	?_lcd_shift
?_lcd_shift:	; 0 bytes @ 0x0
	global	?_PIEZO_S
?_PIEZO_S:	; 0 bytes @ 0x0
	global	?_checkflag
?_checkflag:	; 0 bytes @ 0x0
	global	?_PIEZO
?_PIEZO:	; 0 bytes @ 0x0
	global	?_PIEZO_D
?_PIEZO_D:	; 0 bytes @ 0x0
	global	?_draw
?_draw:	; 0 bytes @ 0x0
	global	?_led_off
?_led_off:	; 0 bytes @ 0x0
	global	?_CapInit
?_CapInit:	; 0 bytes @ 0x0
	global	?_GetReading
?_GetReading:	; 0 bytes @ 0x0
	global	?_player_1
?_player_1:	; 0 bytes @ 0x0
	global	?_player_2
?_player_2:	; 0 bytes @ 0x0
	global	?_checkstatus
?_checkstatus:	; 0 bytes @ 0x0
	global	?_DisplayLEDs
?_DisplayLEDs:	; 0 bytes @ 0x0
	global	?_SetNextChannel
?_SetNextChannel:	; 0 bytes @ 0x0
	global	??_SetNextChannel
??_SetNextChannel:	; 0 bytes @ 0x0
	global	?_RestartTimer1
?_RestartTimer1:	; 0 bytes @ 0x0
	global	?_led_display1
?_led_display1:	; 0 bytes @ 0x0
	global	?_led_display2
?_led_display2:	; 0 bytes @ 0x0
	global	?_led_display3
?_led_display3:	; 0 bytes @ 0x0
	global	?_e_pulse
?_e_pulse:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_isr
?_isr:	; 0 bytes @ 0x0
	global	?_store
?_store:	; 0 bytes @ 0x0
	global	?_send_char
?_send_char:	; 0 bytes @ 0x0
	global	?i1_RestartTimer1
?i1_RestartTimer1:	; 0 bytes @ 0x0
	global	??i1_RestartTimer1
??i1_RestartTimer1:	; 0 bytes @ 0x0
	global	?_winlose
?_winlose:	; 1 bytes @ 0x0
	ds	1
	global	??_GetReading
??_GetReading:	; 0 bytes @ 0x1
	ds	7
	global	??_isr
??_isr:	; 0 bytes @ 0x8
	ds	4
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	??_RestartTimer1
??_RestartTimer1:	; 0 bytes @ 0x0
	global	??_led_display1
??_led_display1:	; 0 bytes @ 0x0
	global	??_led_display2
??_led_display2:	; 0 bytes @ 0x0
	global	??_led_display3
??_led_display3:	; 0 bytes @ 0x0
	global	??_store
??_store:	; 0 bytes @ 0x0
	global	?___bmul
?___bmul:	; 1 bytes @ 0x0
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x0
	global	delay@data
delay@data:	; 4 bytes @ 0x0
	ds	1
	global	??___bmul
??___bmul:	; 0 bytes @ 0x1
	global	led_display1@value1
led_display1@value1:	; 1 bytes @ 0x1
	global	led_display2@value2
led_display2@value2:	; 1 bytes @ 0x1
	global	led_display3@value3
led_display3@value3:	; 1 bytes @ 0x1
	ds	1
	global	??_led_off
??_led_off:	; 0 bytes @ 0x2
	global	??_DisplayLEDs
??_DisplayLEDs:	; 0 bytes @ 0x2
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0x2
	ds	1
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0x3
	global	DisplayLEDs@k
DisplayLEDs@k:	; 2 bytes @ 0x3
	ds	1
	global	??_delay
??_delay:	; 0 bytes @ 0x4
	global	??_winlose
??_winlose:	; 0 bytes @ 0x4
	global	??_CapInit
??_CapInit:	; 0 bytes @ 0x4
	ds	1
	global	??_checkflag
??_checkflag:	; 0 bytes @ 0x5
	global	??_player_1
??_player_1:	; 0 bytes @ 0x5
	global	??_player_2
??_player_2:	; 0 bytes @ 0x5
	global	??_checkstatus
??_checkstatus:	; 0 bytes @ 0x5
	ds	3
	global	??_send_config
??_send_config:	; 0 bytes @ 0x8
	global	??_PIEZO_S
??_PIEZO_S:	; 0 bytes @ 0x8
	global	??_PIEZO
??_PIEZO:	; 0 bytes @ 0x8
	global	??_PIEZO_D
??_PIEZO_D:	; 0 bytes @ 0x8
	global	??_draw
??_draw:	; 0 bytes @ 0x8
	global	??_e_pulse
??_e_pulse:	; 0 bytes @ 0x8
	global	??_send_char
??_send_char:	; 0 bytes @ 0x8
	global	send_config@data
send_config@data:	; 1 bytes @ 0x8
	global	send_char@data
send_char@data:	; 1 bytes @ 0x8
	global	winlose@status
winlose@status:	; 2 bytes @ 0x8
	ds	1
	global	??_lcd_clr
??_lcd_clr:	; 0 bytes @ 0x9
	global	??_lcd_goto
??_lcd_goto:	; 0 bytes @ 0x9
	global	??_send_string
??_send_string:	; 0 bytes @ 0x9
	global	??_lcd_shift
??_lcd_shift:	; 0 bytes @ 0x9
	global	CapInit@i
CapInit@i:	; 2 bytes @ 0x9
	ds	1
	global	lcd_goto@data
lcd_goto@data:	; 1 bytes @ 0xA
	global	send_string@s
send_string@s:	; 1 bytes @ 0xA
	global	winlose@flag_w
winlose@flag_w:	; 1 bytes @ 0xA
	ds	1
	global	CapInit@j
CapInit@j:	; 2 bytes @ 0xB
	global	winlose@i_569
winlose@i_569:	; 2 bytes @ 0xB
	ds	2
	global	winlose@j_570
winlose@j_570:	; 2 bytes @ 0xD
	ds	2
	global	winlose@i_568
winlose@i_568:	; 2 bytes @ 0xF
	ds	2
	global	??_Init
??_Init:	; 0 bytes @ 0x11
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x12
	ds	1
	global	main@i
main@i:	; 2 bytes @ 0x13
	ds	2
;;Data sizes: Strings 211, constant 0, data 0, bss 70, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     12      14
;; BANK0           80     21      71
;; BANK1           80      0      18
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; send_string@s	PTR const unsigned char  size(1) Largest target is 32
;;		 -> STR_14(CODE[11]), STR_13(CODE[17]), STR_12(CODE[17]), STR_11(CODE[17]), 
;;		 -> STR_10(CODE[17]), STR_9(CODE[17]), STR_8(CODE[16]), STR_7(CODE[16]), 
;;		 -> STR_6(CODE[6]), STR_5(CODE[16]), STR_4(CODE[17]), STR_3(CODE[15]), 
;;		 -> STR_2(CODE[32]), STR_1(CODE[31]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _isr in COMMON
;;
;;   _isr->_GetReading
;;   _GetReading->_SetNextChannel
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_Init
;;   _lcd_shift->_send_config
;;   _send_string->_send_char
;;   _lcd_goto->_send_config
;;   _lcd_clr->_send_config
;;   _send_char->_delay
;;   _checkstatus->_DisplayLEDs
;;   _draw->_delay
;;   _send_config->_delay
;;   _Init->_winlose
;;   _e_pulse->_delay
;;   _DisplayLEDs->_led_display1
;;   _DisplayLEDs->_led_display2
;;   _DisplayLEDs->_led_display3
;;   _CapInit->___bmul
;;   _led_off->_led_display1
;;   _led_off->_led_display2
;;   _led_off->_led_display3
;;   _PIEZO_D->_delay
;;   _PIEZO->_delay
;;   _winlose->___bmul
;;   _PIEZO_S->_delay
;;
;; Critical Paths under _isr in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _isr in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _isr in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _isr in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 3     3      0   14949
;;                                             18 BANK0      3     3      0
;;                               _Init
;;                        _send_config
;;                            _lcd_clr
;;                           _lcd_goto
;;                        _send_string
;;                              _delay
;;                          _lcd_shift
;;                            _PIEZO_S
;;                          _checkflag
;;                            _winlose
;;                              _PIEZO
;;                            _PIEZO_D
;;                               _draw
;; ---------------------------------------------------------------------------------
;; (1) _checkflag                                            0     0      0   11004
;;                           _player_1
;;                           _player_2
;; ---------------------------------------------------------------------------------
;; (2) _player_2                                             0     0      0    5502
;;                        _checkstatus
;; ---------------------------------------------------------------------------------
;; (2) _player_1                                             0     0      0    5502
;;                        _checkstatus
;; ---------------------------------------------------------------------------------
;; (1) _lcd_shift                                            0     0      0     157
;;                        _send_config
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _send_string                                          2     2      0     179
;;                                              9 BANK0      2     2      0
;;                          _send_char
;; ---------------------------------------------------------------------------------
;; (1) _lcd_goto                                             2     2      0     201
;;                                              9 BANK0      2     2      0
;;                        _send_config
;; ---------------------------------------------------------------------------------
;; (1) _lcd_clr                                              0     0      0     157
;;                        _send_config
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (2) _send_char                                            1     1      0     112
;;                                              8 BANK0      1     1      0
;;                              _delay
;;                            _e_pulse
;; ---------------------------------------------------------------------------------
;; (3) _checkstatus                                          0     0      0    5502
;;                              _store
;;                        _DisplayLEDs
;; ---------------------------------------------------------------------------------
;; (1) _draw                                                 1     1      0    1101
;;                                              8 BANK0      1     1      0
;;                       _led_display1
;;                       _led_display2
;;                       _led_display3
;;                              _delay
;;                            _led_off
;; ---------------------------------------------------------------------------------
;; (2) _send_config                                          1     1      0     112
;;                                              8 BANK0      1     1      0
;;                              _delay
;;                            _e_pulse
;; ---------------------------------------------------------------------------------
;; (1) _Init                                                 1     1      0    1272
;;                                             17 BANK0      1     1      0
;;                            _led_off
;;                            _CapInit
;;                            _winlose
;; ---------------------------------------------------------------------------------
;; (3) _e_pulse                                              0     0      0      45
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (4) _DisplayLEDs                                          3     3      0    5502
;;                                              2 BANK0      3     3      0
;;                       _led_display1
;;                       _led_display2
;;                       _led_display3
;; ---------------------------------------------------------------------------------
;; (2) _CapInit                                              9     9      0     204
;;                                              4 BANK0      9     9      0
;;                             ___bmul
;; ---------------------------------------------------------------------------------
;; (2) _led_off                                              0     0      0     528
;;                       _led_display1
;;                       _led_display2
;;                       _led_display3
;; ---------------------------------------------------------------------------------
;; (1) _PIEZO_D                                              0     0      0      45
;;                              _delay
;;                      _RestartTimer1
;; ---------------------------------------------------------------------------------
;; (1) _PIEZO                                                0     0      0      45
;;                              _delay
;;                      _RestartTimer1
;; ---------------------------------------------------------------------------------
;; (1) _winlose                                             17    17      0     540
;;                                              4 BANK0     13    13      0
;;                             ___bmul
;; ---------------------------------------------------------------------------------
;; (1) _PIEZO_S                                              0     0      0      45
;;                              _delay
;;                      _RestartTimer1
;; ---------------------------------------------------------------------------------
;; (2) ___bmul                                               4     3      1      68
;;                                              0 BANK0      4     3      1
;; ---------------------------------------------------------------------------------
;; (3) _led_display3                                         2     2      0     176
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (3) _led_display2                                         2     2      0     176
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (3) _led_display1                                         2     2      0     176
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (2) _RestartTimer1                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4) _store                                                1     1      0       0
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _delay                                                8     4      4      45
;;                                              0 BANK0      8     4      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (6) _isr                                                  4     4      0       0
;;                                              8 COMMON     4     4      0
;;                         _GetReading
;; ---------------------------------------------------------------------------------
;; (7) _GetReading                                           7     7      0       0
;;                                              1 COMMON     7     7      0
;;                     _SetNextChannel
;;                    i1_RestartTimer1
;; ---------------------------------------------------------------------------------
;; (8) i1_RestartTimer1                                      0     0      0       0
;; ---------------------------------------------------------------------------------
;; (8) _SetNextChannel                                       1     1      0       0
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 8
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _Init
;;     _led_off
;;       _led_display1
;;       _led_display2
;;       _led_display3
;;     _CapInit
;;       ___bmul
;;     _winlose
;;       ___bmul
;;   _send_config
;;     _delay
;;     _e_pulse
;;       _delay
;;   _lcd_clr
;;     _send_config
;;       _delay
;;       _e_pulse
;;         _delay
;;     _delay
;;   _lcd_goto
;;     _send_config
;;       _delay
;;       _e_pulse
;;         _delay
;;   _send_string
;;     _send_char
;;       _delay
;;       _e_pulse
;;         _delay
;;   _delay
;;   _lcd_shift
;;     _send_config
;;       _delay
;;       _e_pulse
;;         _delay
;;     _delay
;;   _PIEZO_S
;;     _delay
;;     _RestartTimer1
;;   _checkflag
;;     _player_1
;;       _checkstatus
;;         _store
;;         _DisplayLEDs
;;           _led_display1
;;           _led_display2
;;           _led_display3
;;     _player_2
;;       _checkstatus
;;         _store
;;         _DisplayLEDs
;;           _led_display1
;;           _led_display2
;;           _led_display3
;;   _winlose
;;     ___bmul
;;   _PIEZO
;;     _delay
;;     _RestartTimer1
;;   _PIEZO_D
;;     _delay
;;     _RestartTimer1
;;   _draw
;;     _led_display1
;;     _led_display2
;;     _led_display3
;;     _delay
;;     _led_off
;;       _led_display1
;;       _led_display2
;;       _led_display3
;;
;; _isr (ROOT)
;;   _GetReading
;;     _SetNextChannel
;;     i1_RestartTimer1
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      C       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       B       2        0.0%
;;ABS                  0      0      67       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     15      47       5       88.8%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;DATA                 0      0      72       6        0.0%
;;BITBANK1            50      0       0       7        0.0%
;;BANK1               50      0      12       8       22.5%
;;BITBANK3            60      0       0       9        0.0%
;;BANK3               60      0       0      10        0.0%
;;BITBANK2            60      0       0      11        0.0%
;;BANK2               60      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 85 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2   19[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_Init
;;		_send_config
;;		_lcd_clr
;;		_lcd_goto
;;		_send_string
;;		_delay
;;		_lcd_shift
;;		_PIEZO_S
;;		_checkflag
;;		_winlose
;;		_PIEZO
;;		_PIEZO_D
;;		_draw
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	85
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	87
	
l5558:	
;PR28.c: 87: Init();
	fcall	_Init
	line	90
	
l5560:	
;PR28.c: 90: send_config(0b00000001);
	movlw	(01h)
	fcall	_send_config
	line	91
	
l5562:	
;PR28.c: 91: send_config(0b00000010);
	movlw	(02h)
	fcall	_send_config
	line	92
	
l5564:	
;PR28.c: 92: send_config(0b00000110);
	movlw	(06h)
	fcall	_send_config
	line	93
	
l5566:	
;PR28.c: 93: send_config(0b00001100);
	movlw	(0Ch)
	fcall	_send_config
	line	94
	
l5568:	
;PR28.c: 94: send_config(0b00111000);
	movlw	(038h)
	fcall	_send_config
	line	95
	
l5570:	
;PR28.c: 95: lcd_clr();
	fcall	_lcd_clr
	line	96
	
l5572:	
;PR28.c: 96: lcd_goto(0);
	movlw	(0)
	fcall	_lcd_goto
	line	97
	
l5574:	
;PR28.c: 97: send_string("Cytron Technologies Sdn Bhd   ");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_send_string
	line	98
	
l5576:	
;PR28.c: 98: lcd_goto(20);
	movlw	(014h)
	fcall	_lcd_goto
	line	99
	
l5578:	
;PR28.c: 99: send_string("PR 28 - mTouch with Tic Tac Toe");
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_send_string
	line	100
	
l5580:	
;PR28.c: 100: delay(10000);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	027h
	movwf	(?_delay+1)
	movlw	010h
	movwf	(?_delay)

	fcall	_delay
	line	101
	
l5582:	
;PR28.c: 101: for (int i = 0; i <15 ; i++)
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@i)
	movlw	high(0)
	movwf	((main@i))+1
	
l5584:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Fh))^80h
	subwf	btemp+1,w
	skipz
	goto	u8935
	movlw	low(0Fh)
	subwf	(main@i),w
u8935:

	skipc
	goto	u8931
	goto	u8930
u8931:
	goto	l5588
u8930:
	goto	l5594
	
l5586:	
	goto	l5594
	line	102
	
l761:	
	line	103
	
l5588:	
;PR28.c: 102: {
;PR28.c: 103: lcd_shift();
	fcall	_lcd_shift
	line	101
	
l5590:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l5592:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Fh))^80h
	subwf	btemp+1,w
	skipz
	goto	u8945
	movlw	low(0Fh)
	subwf	(main@i),w
u8945:

	skipc
	goto	u8941
	goto	u8940
u8941:
	goto	l5588
u8940:
	goto	l5594
	
l762:	
	line	105
	
l5594:	
;PR28.c: 104: }
;PR28.c: 105: delay(30000);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	075h
	movwf	(?_delay+1)
	movlw	030h
	movwf	(?_delay)

	fcall	_delay
	line	106
;PR28.c: 106: lcd_clr();
	fcall	_lcd_clr
	line	107
;PR28.c: 107: lcd_goto(0);
	movlw	(0)
	fcall	_lcd_goto
	line	108
	
l5596:	
;PR28.c: 108: send_string("Player 1 = red");
	movlw	((STR_3-__stringbase))&0ffh
	fcall	_send_string
	line	109
	
l5598:	
;PR28.c: 109: lcd_goto(20);
	movlw	(014h)
	fcall	_lcd_goto
	line	110
;PR28.c: 110: send_string("Player 2 = green");
	movlw	((STR_4-__stringbase))&0ffh
	fcall	_send_string
	line	111
	
l5600:	
;PR28.c: 111: delay(60000);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0EAh
	movwf	(?_delay+1)
	movlw	060h
	movwf	(?_delay)

	fcall	_delay
	line	112
	
l5602:	
;PR28.c: 112: lcd_clr();
	fcall	_lcd_clr
	line	113
	
l5604:	
;PR28.c: 113: lcd_goto(0);
	movlw	(0)
	fcall	_lcd_goto
	line	114
	
l5606:	
;PR28.c: 114: send_string("Player 1 starts");
	movlw	((STR_5-__stringbase))&0ffh
	fcall	_send_string
	line	115
;PR28.c: 115: lcd_goto(20);
	movlw	(014h)
	fcall	_lcd_goto
	line	116
	
l5608:	
;PR28.c: 116: send_string("first");
	movlw	((STR_6-__stringbase))&0ffh
	fcall	_send_string
	line	117
	
l5610:	
;PR28.c: 117: delay(30000);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	075h
	movwf	(?_delay+1)
	movlw	030h
	movwf	(?_delay)

	fcall	_delay
	line	119
	
l5612:	
;PR28.c: 119: Buttons.BTN0 = Buttons.BTN1 = Buttons.BTN2 = Buttons.BTN3 = 0;
	movlw	(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(_Buttons)+03h
	movwf	0+(_Buttons)+02h
	movwf	0+(_Buttons)+01h
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_Buttons)
	line	120
	
l5614:	
;PR28.c: 120: Buttons.BTN4 = Buttons.BTN5 = Buttons.BTN6 = Buttons.BTN7 = 0;
	movlw	(0)
	movwf	0+(_Buttons)+07h
	movwf	0+(_Buttons)+06h
	movwf	0+(_Buttons)+05h
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(_Buttons)+04h
	line	121
	
l5616:	
;PR28.c: 121: Buttons.BTN8 = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(_Buttons)+08h
	line	124
	
l5618:	
;PR28.c: 124: PIEZO_S();
	fcall	_PIEZO_S
	line	125
;PR28.c: 125: while (data == ' ')
	goto	l5634
	
l764:	
	line	127
	
l5620:	
;PR28.c: 126: {
;PR28.c: 127: if( flag == 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_flag),f
	skipz
	goto	u8951
	goto	u8950
u8951:
	goto	l5626
u8950:
	line	129
	
l5622:	
;PR28.c: 128: {
;PR28.c: 129: lcd_clr();
	fcall	_lcd_clr
	line	130
;PR28.c: 130: lcd_goto(0);
	movlw	(0)
	fcall	_lcd_goto
	line	131
	
l5624:	
;PR28.c: 131: send_string("Player 1's turn");
	movlw	((STR_7-__stringbase))&0ffh
	fcall	_send_string
	line	132
;PR28.c: 132: }else
	goto	l5630
	
l765:	
	line	134
	
l5626:	
;PR28.c: 133: {
;PR28.c: 134: lcd_clr();
	fcall	_lcd_clr
	line	135
;PR28.c: 135: lcd_goto(0);
	movlw	(0)
	fcall	_lcd_goto
	line	136
	
l5628:	
;PR28.c: 136: send_string("Player 2's turn");
	movlw	((STR_8-__stringbase))&0ffh
	fcall	_send_string
	goto	l5630
	line	137
	
l766:	
	line	138
	
l5630:	
;PR28.c: 137: }
;PR28.c: 138: checkflag();
	fcall	_checkflag
	line	139
	
l5632:	
;PR28.c: 139: data = winlose();
	fcall	_winlose
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_data)
	goto	l5634
	line	140
	
l763:	
	line	125
	
l5634:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_data),w
	xorlw	020h
	skipnz
	goto	u8961
	goto	u8960
u8961:
	goto	l5620
u8960:
	goto	l5636
	
l767:	
	line	141
	
l5636:	
;PR28.c: 140: }
;PR28.c: 141: if(data =='X'){
	movf	(_data),w
	xorlw	058h
	skipz
	goto	u8971
	goto	u8970
u8971:
	goto	l5644
u8970:
	line	142
	
l5638:	
;PR28.c: 142: PIEZO();
	fcall	_PIEZO
	line	143
;PR28.c: 143: lcd_clr();
	fcall	_lcd_clr
	line	144
;PR28.c: 144: lcd_goto(0);
	movlw	(0)
	fcall	_lcd_goto
	line	145
	
l5640:	
;PR28.c: 145: send_string("congratulation! ");
	movlw	((STR_9-__stringbase))&0ffh
	fcall	_send_string
	line	146
	
l5642:	
;PR28.c: 146: lcd_goto(20);
	movlw	(014h)
	fcall	_lcd_goto
	line	147
;PR28.c: 147: send_string("**player1 wins**");
	movlw	((STR_10-__stringbase))&0ffh
	fcall	_send_string
	goto	l5644
	line	148
	
l768:	
	line	149
	
l5644:	
;PR28.c: 148: }
;PR28.c: 149: if(data == 'O'){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_data),w
	xorlw	04Fh
	skipz
	goto	u8981
	goto	u8980
u8981:
	goto	l5658
u8980:
	line	150
	
l5646:	
;PR28.c: 150: PIEZO();
	fcall	_PIEZO
	line	151
;PR28.c: 151: lcd_clr();
	fcall	_lcd_clr
	line	152
;PR28.c: 152: lcd_goto(0);
	movlw	(0)
	fcall	_lcd_goto
	line	153
	
l5648:	
;PR28.c: 153: send_string("congratulation! ");
	movlw	((STR_11-__stringbase))&0ffh
	fcall	_send_string
	line	154
	
l5650:	
;PR28.c: 154: lcd_goto(20);
	movlw	(014h)
	fcall	_lcd_goto
	line	155
;PR28.c: 155: send_string("**player2 wins**");
	movlw	((STR_12-__stringbase))&0ffh
	fcall	_send_string
	goto	l5658
	line	156
	
l769:	
;PR28.c: 156: }while(data == 'd'){
	goto	l5658
	
l771:	
	line	157
	
l5652:	
;PR28.c: 157: PIEZO_D();
	fcall	_PIEZO_D
	line	158
;PR28.c: 158: while(1){
	
l772:	
	line	159
;PR28.c: 159: draw();
	fcall	_draw
	line	160
;PR28.c: 160: lcd_clr();
	fcall	_lcd_clr
	line	161
;PR28.c: 161: lcd_goto(0);
	movlw	(0)
	fcall	_lcd_goto
	line	162
	
l5654:	
;PR28.c: 162: send_string("congratulation! ");
	movlw	((STR_13-__stringbase))&0ffh
	fcall	_send_string
	line	163
	
l5656:	
;PR28.c: 163: lcd_goto(20);
	movlw	(014h)
	fcall	_lcd_goto
	line	164
;PR28.c: 164: send_string("***draw***");
	movlw	((STR_14-__stringbase))&0ffh
	fcall	_send_string
	goto	l772
	line	165
	
l773:	
	line	158
	goto	l772
	
l774:	
	goto	l5658
	line	166
	
l770:	
	line	156
	
l5658:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_data),w
	xorlw	064h
	skipnz
	goto	u8991
	goto	u8990
u8991:
	goto	l5652
u8990:
	goto	l777
	
l775:	
	goto	l777
	line	167
;PR28.c: 165: }
;PR28.c: 166: }
;PR28.c: 167: while(1){}
	
l776:	
	
l777:	
	goto	l777
	
l778:	
	line	168
	
l779:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_checkflag
psect	text693,local,class=CODE,delta=2
global __ptext693
__ptext693:

;; *************** function _checkflag *****************
;; Defined at:
;;		line 291 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_player_1
;;		_player_2
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text693
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	291
	global	__size_of_checkflag
	__size_of_checkflag	equ	__end_of_checkflag-_checkflag
	
_checkflag:	
	opt	stack 0
; Regs used in _checkflag: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	292
	
l5548:	
;PR28.c: 292: switch(flag){
	goto	l5556
	line	293
;PR28.c: 293: case 0: player_1(); break;
	
l801:	
	
l5550:	
	fcall	_player_1
	goto	l805
	line	294
;PR28.c: 294: case 1: player_2(); break;
	
l803:	
	
l5552:	
	fcall	_player_2
	goto	l805
	line	295
;PR28.c: 295: default: break;
	
l804:	
	goto	l805
	line	296
	
l5554:	
;PR28.c: 296: }
	goto	l805
	line	292
	
l800:	
	
l5556:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_flag),w
	; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 0 to 1
; switch strategies available:
; Name         Bytes Cycles
; simple_byte     7     4 (average)
; direct_byte    25    19 (fixed)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l5550
	xorlw	1^0	; case 1
	skipnz
	goto	l5552
	goto	l805

	line	296
	
l802:	
	line	297
	
l805:	
	return
	opt stack 0
GLOBAL	__end_of_checkflag
	__end_of_checkflag:
;; =============== function _checkflag ends ============

	signat	_checkflag,88
	global	_player_2
psect	text694,local,class=CODE,delta=2
global __ptext694
__ptext694:

;; *************** function _player_2 *****************
;; Defined at:
;;		line 318 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_checkstatus
;; This function is called by:
;;		_checkflag
;; This function uses a non-reentrant model
;;
psect	text694
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	318
	global	__size_of_player_2
	__size_of_player_2	equ	__end_of_player_2-_player_2
	
_player_2:	
	opt	stack 0
; Regs used in _player_2: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	319
	
l5542:	
;PR28.c: 319: while (flag == 1){
	goto	l5546
	
l815:	
	line	320
	
l5544:	
;PR28.c: 320: checkstatus();
	fcall	_checkstatus
	goto	l5546
	line	321
	
l814:	
	line	319
	
l5546:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_flag),w
	xorlw	01h
	skipnz
	goto	u8921
	goto	u8920
u8921:
	goto	l5544
u8920:
	goto	l817
	
l816:	
	line	322
	
l817:	
	return
	opt stack 0
GLOBAL	__end_of_player_2
	__end_of_player_2:
;; =============== function _player_2 ends ============

	signat	_player_2,88
	global	_player_1
psect	text695,local,class=CODE,delta=2
global __ptext695
__ptext695:

;; *************** function _player_1 *****************
;; Defined at:
;;		line 305 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_checkstatus
;; This function is called by:
;;		_checkflag
;; This function uses a non-reentrant model
;;
psect	text695
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	305
	global	__size_of_player_1
	__size_of_player_1	equ	__end_of_player_1-_player_1
	
_player_1:	
	opt	stack 0
; Regs used in _player_1: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	306
	
l5536:	
;PR28.c: 306: while(flag == 0){
	goto	l5540
	
l809:	
	line	307
	
l5538:	
;PR28.c: 307: checkstatus();
	fcall	_checkstatus
	goto	l5540
	line	308
	
l808:	
	line	306
	
l5540:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_flag),w
	skipz
	goto	u8910
	goto	l5538
u8910:
	goto	l811
	
l810:	
	line	310
	
l811:	
	return
	opt stack 0
GLOBAL	__end_of_player_1
	__end_of_player_1:
;; =============== function _player_1 ends ============

	signat	_player_1,88
	global	_lcd_shift
psect	text696,local,class=CODE,delta=2
global __ptext696
__ptext696:

;; *************** function _lcd_shift *****************
;; Defined at:
;;		line 884 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_send_config
;;		_delay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text696
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	884
	global	__size_of_lcd_shift
	__size_of_lcd_shift	equ	__end_of_lcd_shift-_lcd_shift
	
_lcd_shift:	
	opt	stack 1
; Regs used in _lcd_shift: [wreg+status,2+status,0+pclath+cstack]
	line	885
	
l5534:	
;PR28.c: 885: send_config(0x18);
	movlw	(018h)
	fcall	_send_config
	line	886
;PR28.c: 886: delay(6000);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	017h
	movwf	(?_delay+1)
	movlw	070h
	movwf	(?_delay)

	fcall	_delay
	line	887
	
l1166:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_shift
	__end_of_lcd_shift:
;; =============== function _lcd_shift ends ============

	signat	_lcd_shift,88
	global	_send_string
psect	text697,local,class=CODE,delta=2
global __ptext697
__ptext697:

;; *************** function _send_string *****************
;; Defined at:
;;		line 904 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;  s               1    wreg     PTR const unsigned char 
;;		 -> STR_14(11), STR_13(17), STR_12(17), STR_11(17), 
;;		 -> STR_10(17), STR_9(17), STR_8(16), STR_7(16), 
;;		 -> STR_6(6), STR_5(16), STR_4(17), STR_3(15), 
;;		 -> STR_2(32), STR_1(31), 
;; Auto vars:     Size  Location     Type
;;  s               1   10[BANK0 ] PTR const unsigned char 
;;		 -> STR_14(11), STR_13(17), STR_12(17), STR_11(17), 
;;		 -> STR_10(17), STR_9(17), STR_8(16), STR_7(16), 
;;		 -> STR_6(6), STR_5(16), STR_4(17), STR_3(15), 
;;		 -> STR_2(32), STR_1(31), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_send_char
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text697
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	904
	global	__size_of_send_string
	__size_of_send_string	equ	__end_of_send_string-_send_string
	
_send_string:	
	opt	stack 1
; Regs used in _send_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;send_string@s stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(send_string@s)
	line	906
	
l5524:	
;PR28.c: 906: while (s && *s)send_char (*s++);
	goto	l5530
	
l1173:	
	
l5526:	
	movf	(send_string@s),w
	movwf	fsr0
	fcall	stringdir
	fcall	_send_char
	
l5528:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_send_string+0)+0
	movf	(??_send_string+0)+0,w
	addwf	(send_string@s),f
	goto	l5530
	
l1172:	
	
l5530:	
	movf	(send_string@s),w
	skipz
	goto	u8890
	goto	l1177
u8890:
	
l5532:	
	movf	(send_string@s),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u8901
	goto	u8900
u8901:
	goto	l5526
u8900:
	goto	l1177
	
l1175:	
	goto	l1177
	
l1176:	
	line	908
	
l1177:	
	return
	opt stack 0
GLOBAL	__end_of_send_string
	__end_of_send_string:
;; =============== function _send_string ends ============

	signat	_send_string,4216
	global	_lcd_goto
psect	text698,local,class=CODE,delta=2
global __ptext698
__ptext698:

;; *************** function _lcd_goto *****************
;; Defined at:
;;		line 867 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1   10[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_send_config
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text698
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	867
	global	__size_of_lcd_goto
	__size_of_lcd_goto	equ	__end_of_lcd_goto-_lcd_goto
	
_lcd_goto:	
	opt	stack 1
; Regs used in _lcd_goto: [wreg+status,2+status,0+pclath+cstack]
;lcd_goto@data stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(lcd_goto@data)
	line	868
	
l5516:	
;PR28.c: 868: if(data<16)
	movlw	(010h)
	subwf	(lcd_goto@data),w
	skipnc
	goto	u8881
	goto	u8880
u8881:
	goto	l5520
u8880:
	line	870
	
l5518:	
;PR28.c: 869: {
;PR28.c: 870: send_config(0x80+data);
	movf	(lcd_goto@data),w
	addlw	080h
	fcall	_send_config
	line	871
;PR28.c: 871: }
	goto	l1163
	line	872
	
l1161:	
	line	874
	
l5520:	
;PR28.c: 872: else
;PR28.c: 873: {
;PR28.c: 874: data=data-20;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_goto@data),w
	addlw	0ECh
	movwf	(??_lcd_goto+0)+0
	movf	(??_lcd_goto+0)+0,w
	movwf	(lcd_goto@data)
	line	875
	
l5522:	
;PR28.c: 875: send_config(0xc0+data);
	movf	(lcd_goto@data),w
	addlw	0C0h
	fcall	_send_config
	goto	l1163
	line	876
	
l1162:	
	line	877
	
l1163:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_goto
	__end_of_lcd_goto:
;; =============== function _lcd_goto ends ============

	signat	_lcd_goto,4216
	global	_lcd_clr
psect	text699,local,class=CODE,delta=2
global __ptext699
__ptext699:

;; *************** function _lcd_clr *****************
;; Defined at:
;;		line 894 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_send_config
;;		_delay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text699
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	894
	global	__size_of_lcd_clr
	__size_of_lcd_clr	equ	__end_of_lcd_clr-_lcd_clr
	
_lcd_clr:	
	opt	stack 1
; Regs used in _lcd_clr: [wreg+status,2+status,0+pclath+cstack]
	line	895
	
l5514:	
;PR28.c: 895: send_config(0x01);
	movlw	(01h)
	fcall	_send_config
	line	896
;PR28.c: 896: delay(50);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0
	movwf	(?_delay+1)
	movlw	032h
	movwf	(?_delay)

	fcall	_delay
	line	897
	
l1169:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_clr
	__end_of_lcd_clr:
;; =============== function _lcd_clr ends ============

	signat	_lcd_clr,88
	global	_send_char
psect	text700,local,class=CODE,delta=2
global __ptext700
__ptext700:

;; *************** function _send_char *****************
;; Defined at:
;;		line 843 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    8[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_delay
;;		_e_pulse
;; This function is called by:
;;		_send_string
;; This function uses a non-reentrant model
;;
psect	text700
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	843
	global	__size_of_send_char
	__size_of_send_char	equ	__end_of_send_char-_send_char
	
_send_char:	
	opt	stack 1
; Regs used in _send_char: [wreg+status,2+status,0+pclath+cstack]
;send_char@data stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(send_char@data)
	line	844
	
l5506:	
;PR28.c: 844: RE0=1;
	bsf	(72/8),(72)&7
	line	845
	
l5508:	
;PR28.c: 845: PORTB=data;
	movf	(send_char@data),w
	movwf	(6)	;volatile
	line	846
	
l5510:	
;PR28.c: 846: delay(50);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0
	movwf	(?_delay+1)
	movlw	032h
	movwf	(?_delay)

	fcall	_delay
	line	847
	
l5512:	
;PR28.c: 847: e_pulse();
	fcall	_e_pulse
	line	848
	
l1155:	
	return
	opt stack 0
GLOBAL	__end_of_send_char
	__end_of_send_char:
;; =============== function _send_char ends ============

	signat	_send_char,4216
	global	_checkstatus
psect	text701,local,class=CODE,delta=2
global __ptext701
__ptext701:

;; *************** function _checkstatus *****************
;; Defined at:
;;		line 362 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_store
;;		_DisplayLEDs
;; This function is called by:
;;		_player_1
;;		_player_2
;; This function uses a non-reentrant model
;;
psect	text701
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	362
	global	__size_of_checkstatus
	__size_of_checkstatus	equ	__end_of_checkstatus-_checkstatus
	
_checkstatus:	
	opt	stack 0
; Regs used in _checkstatus: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	363
	
l5308:	
;PR28.c: 363: if(Buttons.BTN0 ==1){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_Buttons),w
	xorlw	01h
	skipz
	goto	u8431
	goto	u8430
u8431:
	goto	l5330
u8430:
	line	364
	
l5310:	
;PR28.c: 364: if (matrix[0][0] =='X' | matrix[0][0] == 'O')
	movf	(_matrix),w
	xorlw	058h
	skipnz
	goto	u8441
	goto	u8440
u8441:
	goto	l5314
u8440:
	
l5312:	
	movf	(_matrix),w
	xorlw	04Fh
	skipz
	goto	u8451
	goto	u8450
u8451:
	goto	l5320
u8450:
	goto	l5314
	
l847:	
	line	365
	
l5314:	
;PR28.c: 365: { if(flag==0){flag = 0;}
	movf	(_flag),f
	skipz
	goto	u8461
	goto	u8460
u8461:
	goto	l5318
u8460:
	
l5316:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag)
	goto	l5330
	line	366
	
l848:	
	line	367
	
l5318:	
;PR28.c: 366: else
;PR28.c: 367: flag = 1;
	clrf	(_flag)
	bsf	status,0
	rlf	(_flag),f
	goto	l5330
	
l849:	
	line	368
;PR28.c: 368: }else {
	goto	l5330
	
l845:	
	line	369
	
l5320:	
;PR28.c: 369: store();
	fcall	_store
	line	370
	
l5322:	
;PR28.c: 370: DisplayLEDs();
	fcall	_DisplayLEDs
	line	371
	
l5324:	
;PR28.c: 371: if(flag ==0){flag = 1;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_flag),f
	skipz
	goto	u8471
	goto	u8470
u8471:
	goto	l5328
u8470:
	
l5326:	
	clrf	(_flag)
	bsf	status,0
	rlf	(_flag),f
	goto	l5330
	line	372
	
l851:	
	line	373
	
l5328:	
;PR28.c: 372: else
;PR28.c: 373: flag = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag)
	goto	l5330
	
l852:	
	goto	l5330
	line	374
	
l850:	
	goto	l5330
	line	375
	
l844:	
	line	376
	
l5330:	
;PR28.c: 374: }
;PR28.c: 375: }
;PR28.c: 376: if(Buttons.BTN1 ==1){
	movf	0+(_Buttons)+01h,w
	xorlw	01h
	skipz
	goto	u8481
	goto	u8480
u8481:
	goto	l5352
u8480:
	line	377
	
l5332:	
;PR28.c: 377: if (matrix[0][1] =='X' | matrix[0][1] == 'O')
	movf	0+(_matrix)+01h,w
	xorlw	058h
	skipnz
	goto	u8491
	goto	u8490
u8491:
	goto	l5336
u8490:
	
l5334:	
	movf	0+(_matrix)+01h,w
	xorlw	04Fh
	skipz
	goto	u8501
	goto	u8500
u8501:
	goto	l5342
u8500:
	goto	l5336
	
l856:	
	line	378
	
l5336:	
;PR28.c: 378: { if(flag==0){flag = 0;}
	movf	(_flag),f
	skipz
	goto	u8511
	goto	u8510
u8511:
	goto	l5340
u8510:
	
l5338:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag)
	goto	l5352
	line	379
	
l857:	
	line	380
	
l5340:	
;PR28.c: 379: else
;PR28.c: 380: flag = 1;
	clrf	(_flag)
	bsf	status,0
	rlf	(_flag),f
	goto	l5352
	
l858:	
	line	381
;PR28.c: 381: }else {
	goto	l5352
	
l854:	
	line	382
	
l5342:	
;PR28.c: 382: store();
	fcall	_store
	line	383
	
l5344:	
;PR28.c: 383: DisplayLEDs();
	fcall	_DisplayLEDs
	line	384
	
l5346:	
;PR28.c: 384: if(flag ==0){flag = 1;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_flag),f
	skipz
	goto	u8521
	goto	u8520
u8521:
	goto	l5350
u8520:
	
l5348:	
	clrf	(_flag)
	bsf	status,0
	rlf	(_flag),f
	goto	l5352
	line	385
	
l860:	
	line	386
	
l5350:	
;PR28.c: 385: else
;PR28.c: 386: flag = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag)
	goto	l5352
	
l861:	
	goto	l5352
	line	387
	
l859:	
	goto	l5352
	line	388
	
l853:	
	line	389
	
l5352:	
;PR28.c: 387: }
;PR28.c: 388: }
;PR28.c: 389: if(Buttons.BTN2 ==1){
	movf	0+(_Buttons)+02h,w
	xorlw	01h
	skipz
	goto	u8531
	goto	u8530
u8531:
	goto	l5374
u8530:
	line	390
	
l5354:	
;PR28.c: 390: if (matrix[0][2] =='X' | matrix[0][2] == 'O')
	movf	0+(_matrix)+02h,w
	xorlw	058h
	skipnz
	goto	u8541
	goto	u8540
u8541:
	goto	l5358
u8540:
	
l5356:	
	movf	0+(_matrix)+02h,w
	xorlw	04Fh
	skipz
	goto	u8551
	goto	u8550
u8551:
	goto	l5364
u8550:
	goto	l5358
	
l865:	
	line	391
	
l5358:	
;PR28.c: 391: { if(flag==0){flag = 0;}
	movf	(_flag),f
	skipz
	goto	u8561
	goto	u8560
u8561:
	goto	l5362
u8560:
	
l5360:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag)
	goto	l5374
	line	392
	
l866:	
	line	393
	
l5362:	
;PR28.c: 392: else
;PR28.c: 393: flag = 1;
	clrf	(_flag)
	bsf	status,0
	rlf	(_flag),f
	goto	l5374
	
l867:	
	line	394
;PR28.c: 394: }else {
	goto	l5374
	
l863:	
	line	395
	
l5364:	
;PR28.c: 395: store();
	fcall	_store
	line	396
	
l5366:	
;PR28.c: 396: DisplayLEDs();
	fcall	_DisplayLEDs
	line	397
	
l5368:	
;PR28.c: 397: if(flag ==0){flag = 1;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_flag),f
	skipz
	goto	u8571
	goto	u8570
u8571:
	goto	l5372
u8570:
	
l5370:	
	clrf	(_flag)
	bsf	status,0
	rlf	(_flag),f
	goto	l5374
	line	398
	
l869:	
	line	399
	
l5372:	
;PR28.c: 398: else
;PR28.c: 399: flag = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag)
	goto	l5374
	
l870:	
	goto	l5374
	line	400
	
l868:	
	goto	l5374
	line	401
	
l862:	
	line	402
	
l5374:	
;PR28.c: 400: }
;PR28.c: 401: }
;PR28.c: 402: if(Buttons.BTN3 ==1){
	movf	0+(_Buttons)+03h,w
	xorlw	01h
	skipz
	goto	u8581
	goto	u8580
u8581:
	goto	l5396
u8580:
	line	403
	
l5376:	
;PR28.c: 403: if (matrix[1][0] =='X' | matrix[1][0] == 'O')
	movf	0+(_matrix)+03h,w
	xorlw	058h
	skipnz
	goto	u8591
	goto	u8590
u8591:
	goto	l5380
u8590:
	
l5378:	
	movf	0+(_matrix)+03h,w
	xorlw	04Fh
	skipz
	goto	u8601
	goto	u8600
u8601:
	goto	l5386
u8600:
	goto	l5380
	
l874:	
	line	404
	
l5380:	
;PR28.c: 404: { if(flag==0){flag = 0;}
	movf	(_flag),f
	skipz
	goto	u8611
	goto	u8610
u8611:
	goto	l5384
u8610:
	
l5382:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag)
	goto	l5396
	line	405
	
l875:	
	line	406
	
l5384:	
;PR28.c: 405: else
;PR28.c: 406: flag = 1;
	clrf	(_flag)
	bsf	status,0
	rlf	(_flag),f
	goto	l5396
	
l876:	
	line	407
;PR28.c: 407: }else {
	goto	l5396
	
l872:	
	line	408
	
l5386:	
;PR28.c: 408: store();
	fcall	_store
	line	409
	
l5388:	
;PR28.c: 409: DisplayLEDs();
	fcall	_DisplayLEDs
	line	410
	
l5390:	
;PR28.c: 410: if(flag ==0){flag = 1;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_flag),f
	skipz
	goto	u8621
	goto	u8620
u8621:
	goto	l5394
u8620:
	
l5392:	
	clrf	(_flag)
	bsf	status,0
	rlf	(_flag),f
	goto	l5396
	line	411
	
l878:	
	line	412
	
l5394:	
;PR28.c: 411: else
;PR28.c: 412: flag = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag)
	goto	l5396
	
l879:	
	goto	l5396
	line	413
	
l877:	
	goto	l5396
	line	414
	
l871:	
	line	415
	
l5396:	
;PR28.c: 413: }
;PR28.c: 414: }
;PR28.c: 415: if(Buttons.BTN4 ==1){
	movf	0+(_Buttons)+04h,w
	xorlw	01h
	skipz
	goto	u8631
	goto	u8630
u8631:
	goto	l5418
u8630:
	line	416
	
l5398:	
;PR28.c: 416: if (matrix[1][1] =='X' | matrix[1][1] == 'O')
	movf	0+(_matrix)+04h,w
	xorlw	058h
	skipnz
	goto	u8641
	goto	u8640
u8641:
	goto	l5402
u8640:
	
l5400:	
	movf	0+(_matrix)+04h,w
	xorlw	04Fh
	skipz
	goto	u8651
	goto	u8650
u8651:
	goto	l5408
u8650:
	goto	l5402
	
l883:	
	line	417
	
l5402:	
;PR28.c: 417: { if(flag==0){flag = 0;}
	movf	(_flag),f
	skipz
	goto	u8661
	goto	u8660
u8661:
	goto	l5406
u8660:
	
l5404:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag)
	goto	l5418
	line	418
	
l884:	
	line	419
	
l5406:	
;PR28.c: 418: else
;PR28.c: 419: flag = 1;
	clrf	(_flag)
	bsf	status,0
	rlf	(_flag),f
	goto	l5418
	
l885:	
	line	420
;PR28.c: 420: }else {
	goto	l5418
	
l881:	
	line	421
	
l5408:	
;PR28.c: 421: store();
	fcall	_store
	line	422
	
l5410:	
;PR28.c: 422: DisplayLEDs();
	fcall	_DisplayLEDs
	line	423
	
l5412:	
;PR28.c: 423: if(flag ==0){flag = 1;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_flag),f
	skipz
	goto	u8671
	goto	u8670
u8671:
	goto	l5416
u8670:
	
l5414:	
	clrf	(_flag)
	bsf	status,0
	rlf	(_flag),f
	goto	l5418
	line	424
	
l887:	
	line	425
	
l5416:	
;PR28.c: 424: else
;PR28.c: 425: flag = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag)
	goto	l5418
	
l888:	
	goto	l5418
	line	426
	
l886:	
	goto	l5418
	line	427
	
l880:	
	line	428
	
l5418:	
;PR28.c: 426: }
;PR28.c: 427: }
;PR28.c: 428: if(Buttons.BTN5 ==1){
	movf	0+(_Buttons)+05h,w
	xorlw	01h
	skipz
	goto	u8681
	goto	u8680
u8681:
	goto	l5440
u8680:
	line	429
	
l5420:	
;PR28.c: 429: if (matrix[1][2] =='X' | matrix[1][2] == 'O')
	movf	0+(_matrix)+05h,w
	xorlw	058h
	skipnz
	goto	u8691
	goto	u8690
u8691:
	goto	l5424
u8690:
	
l5422:	
	movf	0+(_matrix)+05h,w
	xorlw	04Fh
	skipz
	goto	u8701
	goto	u8700
u8701:
	goto	l5430
u8700:
	goto	l5424
	
l892:	
	line	430
	
l5424:	
;PR28.c: 430: { if(flag==0){flag = 0;}
	movf	(_flag),f
	skipz
	goto	u8711
	goto	u8710
u8711:
	goto	l5428
u8710:
	
l5426:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag)
	goto	l5440
	line	431
	
l893:	
	line	432
	
l5428:	
;PR28.c: 431: else
;PR28.c: 432: flag = 1;
	clrf	(_flag)
	bsf	status,0
	rlf	(_flag),f
	goto	l5440
	
l894:	
	line	433
;PR28.c: 433: }else {
	goto	l5440
	
l890:	
	line	434
	
l5430:	
;PR28.c: 434: store();
	fcall	_store
	line	435
	
l5432:	
;PR28.c: 435: DisplayLEDs();
	fcall	_DisplayLEDs
	line	436
	
l5434:	
;PR28.c: 436: if(flag ==0){flag = 1;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_flag),f
	skipz
	goto	u8721
	goto	u8720
u8721:
	goto	l5438
u8720:
	
l5436:	
	clrf	(_flag)
	bsf	status,0
	rlf	(_flag),f
	goto	l5440
	line	437
	
l896:	
	line	438
	
l5438:	
;PR28.c: 437: else
;PR28.c: 438: flag = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag)
	goto	l5440
	
l897:	
	goto	l5440
	line	439
	
l895:	
	goto	l5440
	line	440
	
l889:	
	line	441
	
l5440:	
;PR28.c: 439: }
;PR28.c: 440: }
;PR28.c: 441: if(Buttons.BTN6 ==1){
	movf	0+(_Buttons)+06h,w
	xorlw	01h
	skipz
	goto	u8731
	goto	u8730
u8731:
	goto	l5462
u8730:
	line	442
	
l5442:	
;PR28.c: 442: if (matrix[2][0] =='X' | matrix[2][0] == 'O')
	movf	0+(_matrix)+06h,w
	xorlw	058h
	skipnz
	goto	u8741
	goto	u8740
u8741:
	goto	l5446
u8740:
	
l5444:	
	movf	0+(_matrix)+06h,w
	xorlw	04Fh
	skipz
	goto	u8751
	goto	u8750
u8751:
	goto	l5452
u8750:
	goto	l5446
	
l901:	
	line	443
	
l5446:	
;PR28.c: 443: { if(flag==0){flag = 0;}
	movf	(_flag),f
	skipz
	goto	u8761
	goto	u8760
u8761:
	goto	l5450
u8760:
	
l5448:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag)
	goto	l5462
	line	444
	
l902:	
	line	445
	
l5450:	
;PR28.c: 444: else
;PR28.c: 445: flag = 1;
	clrf	(_flag)
	bsf	status,0
	rlf	(_flag),f
	goto	l5462
	
l903:	
	line	446
;PR28.c: 446: }else {
	goto	l5462
	
l899:	
	line	447
	
l5452:	
;PR28.c: 447: store();
	fcall	_store
	line	448
	
l5454:	
;PR28.c: 448: DisplayLEDs();
	fcall	_DisplayLEDs
	line	449
	
l5456:	
;PR28.c: 449: if(flag ==0){flag = 1;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_flag),f
	skipz
	goto	u8771
	goto	u8770
u8771:
	goto	l5460
u8770:
	
l5458:	
	clrf	(_flag)
	bsf	status,0
	rlf	(_flag),f
	goto	l5462
	line	450
	
l905:	
	line	451
	
l5460:	
;PR28.c: 450: else
;PR28.c: 451: flag = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag)
	goto	l5462
	
l906:	
	goto	l5462
	line	452
	
l904:	
	goto	l5462
	line	453
	
l898:	
	line	454
	
l5462:	
;PR28.c: 452: }
;PR28.c: 453: }
;PR28.c: 454: if(Buttons.BTN7 ==1){
	movf	0+(_Buttons)+07h,w
	xorlw	01h
	skipz
	goto	u8781
	goto	u8780
u8781:
	goto	l5484
u8780:
	line	455
	
l5464:	
;PR28.c: 455: if (matrix[2][1] =='X' | matrix[2][1] == 'O')
	movf	0+(_matrix)+07h,w
	xorlw	058h
	skipnz
	goto	u8791
	goto	u8790
u8791:
	goto	l5468
u8790:
	
l5466:	
	movf	0+(_matrix)+07h,w
	xorlw	04Fh
	skipz
	goto	u8801
	goto	u8800
u8801:
	goto	l5474
u8800:
	goto	l5468
	
l910:	
	line	456
	
l5468:	
;PR28.c: 456: { if(flag==0){flag = 0;}
	movf	(_flag),f
	skipz
	goto	u8811
	goto	u8810
u8811:
	goto	l5472
u8810:
	
l5470:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag)
	goto	l5484
	line	457
	
l911:	
	line	458
	
l5472:	
;PR28.c: 457: else
;PR28.c: 458: flag = 1;
	clrf	(_flag)
	bsf	status,0
	rlf	(_flag),f
	goto	l5484
	
l912:	
	line	459
;PR28.c: 459: }else {
	goto	l5484
	
l908:	
	line	460
	
l5474:	
;PR28.c: 460: store();
	fcall	_store
	line	461
	
l5476:	
;PR28.c: 461: DisplayLEDs();
	fcall	_DisplayLEDs
	line	462
	
l5478:	
;PR28.c: 462: if(flag ==0){flag = 1;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_flag),f
	skipz
	goto	u8821
	goto	u8820
u8821:
	goto	l5482
u8820:
	
l5480:	
	clrf	(_flag)
	bsf	status,0
	rlf	(_flag),f
	goto	l5484
	line	463
	
l914:	
	line	464
	
l5482:	
;PR28.c: 463: else
;PR28.c: 464: flag = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag)
	goto	l5484
	
l915:	
	goto	l5484
	line	465
	
l913:	
	goto	l5484
	line	466
	
l907:	
	line	467
	
l5484:	
;PR28.c: 465: }
;PR28.c: 466: }
;PR28.c: 467: if(Buttons.BTN8 ==1){
	movf	0+(_Buttons)+08h,w
	xorlw	01h
	skipz
	goto	u8831
	goto	u8830
u8831:
	goto	l925
u8830:
	line	468
	
l5486:	
;PR28.c: 468: if (matrix[2][2] =='X' | matrix[2][2] == 'O')
	movf	0+(_matrix)+08h,w
	xorlw	058h
	skipnz
	goto	u8841
	goto	u8840
u8841:
	goto	l5490
u8840:
	
l5488:	
	movf	0+(_matrix)+08h,w
	xorlw	04Fh
	skipz
	goto	u8851
	goto	u8850
u8851:
	goto	l5496
u8850:
	goto	l5490
	
l919:	
	line	469
	
l5490:	
;PR28.c: 469: { if(flag==0){flag = 0;}
	movf	(_flag),f
	skipz
	goto	u8861
	goto	u8860
u8861:
	goto	l5494
u8860:
	
l5492:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag)
	goto	l925
	line	470
	
l920:	
	line	471
	
l5494:	
;PR28.c: 470: else
;PR28.c: 471: flag = 1;
	clrf	(_flag)
	bsf	status,0
	rlf	(_flag),f
	goto	l925
	
l921:	
	line	472
;PR28.c: 472: }else {
	goto	l925
	
l917:	
	line	473
	
l5496:	
;PR28.c: 473: store();
	fcall	_store
	line	474
	
l5498:	
;PR28.c: 474: DisplayLEDs();
	fcall	_DisplayLEDs
	line	475
	
l5500:	
;PR28.c: 475: if(flag ==0){flag = 1;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_flag),f
	skipz
	goto	u8871
	goto	u8870
u8871:
	goto	l5504
u8870:
	
l5502:	
	clrf	(_flag)
	bsf	status,0
	rlf	(_flag),f
	goto	l925
	line	476
	
l923:	
	line	477
	
l5504:	
;PR28.c: 476: else
;PR28.c: 477: flag = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag)
	goto	l925
	
l924:	
	goto	l925
	line	478
	
l922:	
	goto	l925
	line	479
	
l916:	
	line	480
	
l925:	
	return
	opt stack 0
GLOBAL	__end_of_checkstatus
	__end_of_checkstatus:
;; =============== function _checkstatus ends ============

	signat	_checkstatus,88
	global	_draw
psect	text702,local,class=CODE,delta=2
global __ptext702
__ptext702:

;; *************** function _draw *****************
;; Defined at:
;;		line 914 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_led_display1
;;		_led_display2
;;		_led_display3
;;		_delay
;;		_led_off
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text702
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	914
	global	__size_of_draw
	__size_of_draw	equ	__end_of_draw-_draw
	
_draw:	
	opt	stack 2
; Regs used in _draw: [wreg+status,2+status,0+pclath+cstack]
	line	916
	
l5290:	
;PR28.c: 916: RC5 = RC6 = RC7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(63/8),(63)&7
	btfsc	(63/8),(63)&7
	goto	u8371
	goto	u8370
	
u8371:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	goto	u8384
u8370:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(62/8),(62)&7
u8384:
	btfsc	(62/8),(62)&7
	goto	u8381
	goto	u8380
	
u8381:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(61/8),(61)&7
	goto	u8394
u8380:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7
u8394:
	line	917
	
l5292:	
;PR28.c: 917: result = 0b00100100;
	movlw	(024h)
	movwf	(??_draw+0)+0
	movf	(??_draw+0)+0,w
	movwf	(_result)
	line	918
	
l5294:	
;PR28.c: 918: RA6 = RA7 = RA0 = 1;
	bsf	(40/8),(40)&7
	btfsc	(40/8),(40)&7
	goto	u8401
	goto	u8400
	
u8401:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(47/8),(47)&7
	goto	u8414
u8400:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(47/8),(47)&7
u8414:
	btfsc	(47/8),(47)&7
	goto	u8411
	goto	u8410
	
u8411:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(46/8),(46)&7
	goto	u8424
u8410:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(46/8),(46)&7
u8424:
	line	919
	
l5296:	
;PR28.c: 919: led_display1(result);
	movf	(_result),w
	fcall	_led_display1
	line	920
	
l5298:	
;PR28.c: 920: led_display2(result);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_result),w
	fcall	_led_display2
	line	921
	
l5300:	
;PR28.c: 921: led_display3(result);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_result),w
	fcall	_led_display3
	line	922
	
l5302:	
;PR28.c: 922: delay(3500);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Dh
	movwf	(?_delay+1)
	movlw	0ACh
	movwf	(?_delay)

	fcall	_delay
	line	923
	
l5304:	
;PR28.c: 923: led_off();
	fcall	_led_off
	line	924
	
l5306:	
;PR28.c: 924: delay(3500);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Dh
	movwf	(?_delay+1)
	movlw	0ACh
	movwf	(?_delay)

	fcall	_delay
	line	925
	
l1180:	
	return
	opt stack 0
GLOBAL	__end_of_draw
	__end_of_draw:
;; =============== function _draw ends ============

	signat	_draw,88
	global	_send_config
psect	text703,local,class=CODE,delta=2
global __ptext703
__ptext703:

;; *************** function _send_config *****************
;; Defined at:
;;		line 831 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    8[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_delay
;;		_e_pulse
;; This function is called by:
;;		_main
;;		_lcd_goto
;;		_lcd_shift
;;		_lcd_clr
;; This function uses a non-reentrant model
;;
psect	text703
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	831
	global	__size_of_send_config
	__size_of_send_config	equ	__end_of_send_config-_send_config
	
_send_config:	
	opt	stack 1
; Regs used in _send_config: [wreg+status,2+status,0+pclath+cstack]
;send_config@data stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(send_config@data)
	line	832
	
l5282:	
;PR28.c: 832: RE0=0;
	bcf	(72/8),(72)&7
	line	833
	
l5284:	
;PR28.c: 833: PORTB=data;
	movf	(send_config@data),w
	movwf	(6)	;volatile
	line	834
	
l5286:	
;PR28.c: 834: delay(50);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0
	movwf	(?_delay+1)
	movlw	032h
	movwf	(?_delay)

	fcall	_delay
	line	835
	
l5288:	
;PR28.c: 835: e_pulse();
	fcall	_e_pulse
	line	836
	
l1152:	
	return
	opt stack 0
GLOBAL	__end_of_send_config
	__end_of_send_config:
;; =============== function _send_config ends ============

	signat	_send_config,4216
	global	_Init
psect	text704,local,class=CODE,delta=2
global __ptext704
__ptext704:

;; *************** function _Init *****************
;; Defined at:
;;		line 177 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_led_off
;;		_CapInit
;;		_winlose
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text704
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	177
	global	__size_of_Init
	__size_of_Init	equ	__end_of_Init-_Init
	
_Init:	
	opt	stack 2
; Regs used in _Init: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	192
	
l5240:	
;PR28.c: 192: TRISA = 0b00010000;
	movlw	(010h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	193
	
l5242:	
;PR28.c: 193: TRISB = 0b00000000;
	clrf	(134)^080h	;volatile
	line	194
	
l5244:	
;PR28.c: 194: TRISC = 0b00000000;
	clrf	(135)^080h	;volatile
	line	195
;PR28.c: 195: TRISD = 0b11111111;
	movlw	(0FFh)
	movwf	(136)^080h	;volatile
	line	196
	
l5246:	
;PR28.c: 196: TRISE = 0b00000000;
	clrf	(137)^080h	;volatile
	line	197
	
l5248:	
;PR28.c: 197: PORTB = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	198
	
l5250:	
;PR28.c: 198: PORTE = 0;
	clrf	(9)	;volatile
	line	200
	
l5252:	
;PR28.c: 200: led_off();
	fcall	_led_off
	line	202
	
l5254:	
;PR28.c: 202: ANSELA = 0x10;
	movlw	(010h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(389)^0180h	;volatile
	line	203
	
l5256:	
;PR28.c: 203: ANSELB = 0x00;
	clrf	(390)^0180h	;volatile
	line	204
	
l5258:	
;PR28.c: 204: ANSELE = 0x00;
	clrf	(393)^0180h	;volatile
	line	205
	
l5260:	
;PR28.c: 205: ANSELD = 0b11111111;
	movlw	(0FFh)
	movwf	(392)^0180h	;volatile
	line	207
	
l5262:	
;PR28.c: 207: result = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_result)
	line	208
	
l5264:	
;PR28.c: 208: flag = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag)
	line	209
	
l5266:	
;PR28.c: 209: index =0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_index)
	line	210
	
l5268:	
;PR28.c: 210: OSCCON = 0x10;
	movlw	(010h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(144)^080h	;volatile
	line	219
	
l5270:	
;PR28.c: 219: GIE = 1;
	bsf	(95/8),(95)&7
	line	220
	
l5272:	
;PR28.c: 220: CPSCON0 = 0b10001101;
	movlw	(08Dh)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	221
	
l5274:	
;PR28.c: 221: CPSCON1 = 0b00001000;
	movlw	(08h)
	movwf	(265)^0100h	;volatile
	line	222
	
l5276:	
;PR28.c: 222: CapInit();
	fcall	_CapInit
	line	223
	
l5278:	
;PR28.c: 223: data = winlose();
	fcall	_winlose
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_Init+0)+0
	movf	(??_Init+0)+0,w
	movwf	(_data)
	line	224
	
l5280:	
;PR28.c: 224: PEIE = 1;
	bsf	(94/8),(94)&7
	line	225
	
l782:	
	return
	opt stack 0
GLOBAL	__end_of_Init
	__end_of_Init:
;; =============== function _Init ends ============

	signat	_Init,88
	global	_e_pulse
psect	text705,local,class=CODE,delta=2
global __ptext705
__ptext705:

;; *************** function _e_pulse *****************
;; Defined at:
;;		line 855 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_delay
;; This function is called by:
;;		_send_config
;;		_send_char
;; This function uses a non-reentrant model
;;
psect	text705
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	855
	global	__size_of_e_pulse
	__size_of_e_pulse	equ	__end_of_e_pulse-_e_pulse
	
_e_pulse:	
	opt	stack 1
; Regs used in _e_pulse: [wreg+status,2+status,0+pclath+cstack]
	line	856
	
l5234:	
;PR28.c: 856: RE1=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(73/8),(73)&7
	line	857
	
l5236:	
;PR28.c: 857: delay(50);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0
	movwf	(?_delay+1)
	movlw	032h
	movwf	(?_delay)

	fcall	_delay
	line	858
	
l5238:	
;PR28.c: 858: RE1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(73/8),(73)&7
	line	859
;PR28.c: 859: delay(50);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0
	movwf	(?_delay+1)
	movlw	032h
	movwf	(?_delay)

	fcall	_delay
	line	860
	
l1158:	
	return
	opt stack 0
GLOBAL	__end_of_e_pulse
	__end_of_e_pulse:
;; =============== function _e_pulse ends ============

	signat	_e_pulse,88
	global	_DisplayLEDs
psect	text706,local,class=CODE,delta=2
global __ptext706
__ptext706:

;; *************** function _DisplayLEDs *****************
;; Defined at:
;;		line 591 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  k               2    3[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_led_display1
;;		_led_display2
;;		_led_display3
;; This function is called by:
;;		_checkstatus
;; This function uses a non-reentrant model
;;
psect	text706
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	591
	global	__size_of_DisplayLEDs
	__size_of_DisplayLEDs	equ	__end_of_DisplayLEDs-_DisplayLEDs
	
_DisplayLEDs:	
	opt	stack 0
; Regs used in _DisplayLEDs: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	592
	
l4766:	
;PR28.c: 592: RC5 = 1; RC6 =1; RC7 =1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(61/8),(61)&7
	bsf	(62/8),(62)&7
	bsf	(63/8),(63)&7
	line	593
;PR28.c: 593: RA6 = RA7 = RA0 = 0;
	bcf	(40/8),(40)&7
	bcf	(47/8),(47)&7
	bcf	(46/8),(46)&7
	line	596
	
l4768:	
;PR28.c: 596: for(int k = 0; k< 3 ; k++)
	movlw	low(0)
	movwf	(DisplayLEDs@k)
	movlw	high(0)
	movwf	((DisplayLEDs@k))+1
	
l4770:	
	movf	(DisplayLEDs@k+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u6675
	movlw	low(03h)
	subwf	(DisplayLEDs@k),w
u6675:

	skipc
	goto	u6671
	goto	u6670
u6671:
	goto	l4774
u6670:
	goto	l1087
	
l4772:	
	goto	l1087
	line	597
	
l974:	
	line	598
	
l4774:	
;PR28.c: 597: {
;PR28.c: 598: led_display1(result1[0]);led_display2(result1[1]);led_display3(result1[2]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_result1),w
	fcall	_led_display1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_result1)+01h,w
	fcall	_led_display2
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_result1)+02h,w
	fcall	_led_display3
	line	599
	
l4776:	
;PR28.c: 599: if(matrix[0][k] == 'O' & matrix[1][k] == 'O' & matrix[2][k] == 'O'){result1[k] = 0b01001001;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u6681
	goto	u6680
u6681:
	goto	l4784
u6680:
	
l4778:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u6691
	goto	u6690
u6691:
	goto	l4784
u6690:
	
l4780:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u6701
	goto	u6700
u6701:
	goto	l4784
u6700:
	
l4782:	
	movlw	(049h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	600
	
l976:	
	
l4784:	
;PR28.c: 600: else if(matrix[0][k] == 'O' & matrix[1][k] == 'O' & matrix[2][k] == ' '){result1[k] = 0b01001000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u6711
	goto	u6710
u6711:
	goto	l4792
u6710:
	
l4786:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u6721
	goto	u6720
u6721:
	goto	l4792
u6720:
	
l4788:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u6731
	goto	u6730
u6731:
	goto	l4792
u6730:
	
l4790:	
	movlw	(048h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	601
	
l978:	
	
l4792:	
;PR28.c: 601: else if(matrix[0][k] == 'O' & matrix[1][k] == ' ' & matrix[2][k] == 'O'){result1[k] = 0b01000001;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u6741
	goto	u6740
u6741:
	goto	l4800
u6740:
	
l4794:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u6751
	goto	u6750
u6751:
	goto	l4800
u6750:
	
l4796:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u6761
	goto	u6760
u6761:
	goto	l4800
u6760:
	
l4798:	
	movlw	(041h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	602
	
l980:	
	
l4800:	
;PR28.c: 602: else if(matrix[0][k] == 'O' & matrix[1][k] == ' ' & matrix[2][k] == ' '){result1[k] = 0b01000000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u6771
	goto	u6770
u6771:
	goto	l4808
u6770:
	
l4802:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u6781
	goto	u6780
u6781:
	goto	l4808
u6780:
	
l4804:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u6791
	goto	u6790
u6791:
	goto	l4808
u6790:
	
l4806:	
	movlw	(040h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	603
	
l982:	
	
l4808:	
;PR28.c: 603: else if(matrix[0][k] == ' ' & matrix[1][k] == 'O' & matrix[2][k] == 'O'){result1[k] = 0b00001001;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u6801
	goto	u6800
u6801:
	goto	l4816
u6800:
	
l4810:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u6811
	goto	u6810
u6811:
	goto	l4816
u6810:
	
l4812:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u6821
	goto	u6820
u6821:
	goto	l4816
u6820:
	
l4814:	
	movlw	(09h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	604
	
l984:	
	
l4816:	
;PR28.c: 604: else if(matrix[0][k] == ' ' & matrix[1][k] == 'O' & matrix[2][k] == ' '){result1[k] = 0b00001000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u6831
	goto	u6830
u6831:
	goto	l4824
u6830:
	
l4818:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u6841
	goto	u6840
u6841:
	goto	l4824
u6840:
	
l4820:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u6851
	goto	u6850
u6851:
	goto	l4824
u6850:
	
l4822:	
	movlw	(08h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	605
	
l986:	
	
l4824:	
;PR28.c: 605: else if(matrix[0][k] == ' ' & matrix[1][k] == ' ' & matrix[2][k] == 'O'){result1[k] = 0b00000001;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u6861
	goto	u6860
u6861:
	goto	l4832
u6860:
	
l4826:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u6871
	goto	u6870
u6871:
	goto	l4832
u6870:
	
l4828:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u6881
	goto	u6880
u6881:
	goto	l4832
u6880:
	
l4830:	
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	clrf	indf
	bsf	status,0
	rlf	indf,f
	goto	l5224
	line	607
	
l988:	
	
l4832:	
;PR28.c: 607: else if(matrix[0][k] == 'O' & matrix[1][k] == 'O' & matrix[2][k] == 'X'){result1[k] = 0b01001010;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u6891
	goto	u6890
u6891:
	goto	l4840
u6890:
	
l4834:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u6901
	goto	u6900
u6901:
	goto	l4840
u6900:
	
l4836:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u6911
	goto	u6910
u6911:
	goto	l4840
u6910:
	
l4838:	
	movlw	(04Ah)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	608
	
l990:	
	
l4840:	
;PR28.c: 608: else if(matrix[0][k] == 'O' & matrix[1][k] == 'O' & matrix[2][k] == ' '){result1[k] = 0b01001000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u6921
	goto	u6920
u6921:
	goto	l4848
u6920:
	
l4842:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u6931
	goto	u6930
u6931:
	goto	l4848
u6930:
	
l4844:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u6941
	goto	u6940
u6941:
	goto	l4848
u6940:
	
l4846:	
	movlw	(048h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	609
	
l992:	
	
l4848:	
;PR28.c: 609: else if(matrix[0][k] == 'O' & matrix[1][k] == ' ' & matrix[2][k] == 'X'){result1[k] = 0b01000010;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u6951
	goto	u6950
u6951:
	goto	l4856
u6950:
	
l4850:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u6961
	goto	u6960
u6961:
	goto	l4856
u6960:
	
l4852:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u6971
	goto	u6970
u6971:
	goto	l4856
u6970:
	
l4854:	
	movlw	(042h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	610
	
l994:	
	
l4856:	
;PR28.c: 610: else if(matrix[0][k] == 'O' & matrix[1][k] == ' ' & matrix[2][k] == ' '){result1[k] = 0b01000000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u6981
	goto	u6980
u6981:
	goto	l4864
u6980:
	
l4858:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u6991
	goto	u6990
u6991:
	goto	l4864
u6990:
	
l4860:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7001
	goto	u7000
u7001:
	goto	l4864
u7000:
	
l4862:	
	movlw	(040h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	611
	
l996:	
	
l4864:	
;PR28.c: 611: else if(matrix[0][k] == ' ' & matrix[1][k] == 'O' & matrix[2][k] == 'X'){result1[k] = 0b00001010;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7011
	goto	u7010
u7011:
	goto	l4872
u7010:
	
l4866:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7021
	goto	u7020
u7021:
	goto	l4872
u7020:
	
l4868:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7031
	goto	u7030
u7031:
	goto	l4872
u7030:
	
l4870:	
	movlw	(0Ah)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	612
	
l998:	
	
l4872:	
;PR28.c: 612: else if(matrix[0][k] == ' ' & matrix[1][k] == 'O' & matrix[2][k] == ' '){result1[k] = 0b00001000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7041
	goto	u7040
u7041:
	goto	l4880
u7040:
	
l4874:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7051
	goto	u7050
u7051:
	goto	l4880
u7050:
	
l4876:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7061
	goto	u7060
u7061:
	goto	l4880
u7060:
	
l4878:	
	movlw	(08h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	613
	
l1000:	
	
l4880:	
;PR28.c: 613: else if(matrix[0][k] == ' ' & matrix[1][k] == ' ' & matrix[2][k] == 'X'){result1[k] = 0b00000010;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7071
	goto	u7070
u7071:
	goto	l4888
u7070:
	
l4882:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7081
	goto	u7080
u7081:
	goto	l4888
u7080:
	
l4884:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7091
	goto	u7090
u7091:
	goto	l4888
u7090:
	
l4886:	
	movlw	(02h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	615
	
l1002:	
	
l4888:	
;PR28.c: 615: else if(matrix[0][k] == 'O' & matrix[1][k] == 'X' & matrix[2][k] == 'O'){result1[k] = 0b01010001;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7101
	goto	u7100
u7101:
	goto	l4896
u7100:
	
l4890:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7111
	goto	u7110
u7111:
	goto	l4896
u7110:
	
l4892:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7121
	goto	u7120
u7121:
	goto	l4896
u7120:
	
l4894:	
	movlw	(051h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	616
	
l1004:	
	
l4896:	
;PR28.c: 616: else if(matrix[0][k] == 'O' & matrix[1][k] == 'X' & matrix[2][k] == ' '){result1[k] = 0b01010000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7131
	goto	u7130
u7131:
	goto	l4904
u7130:
	
l4898:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7141
	goto	u7140
u7141:
	goto	l4904
u7140:
	
l4900:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7151
	goto	u7150
u7151:
	goto	l4904
u7150:
	
l4902:	
	movlw	(050h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	617
	
l1006:	
	
l4904:	
;PR28.c: 617: else if(matrix[0][k] == 'O' & matrix[1][k] == ' ' & matrix[2][k] == 'O'){result1[k] = 0b01000001;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7161
	goto	u7160
u7161:
	goto	l4912
u7160:
	
l4906:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7171
	goto	u7170
u7171:
	goto	l4912
u7170:
	
l4908:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7181
	goto	u7180
u7181:
	goto	l4912
u7180:
	
l4910:	
	movlw	(041h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	618
	
l1008:	
	
l4912:	
;PR28.c: 618: else if(matrix[0][k] == 'O' & matrix[1][k] == ' ' & matrix[2][k] == ' '){result1[k] = 0b01000000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7191
	goto	u7190
u7191:
	goto	l4920
u7190:
	
l4914:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7201
	goto	u7200
u7201:
	goto	l4920
u7200:
	
l4916:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7211
	goto	u7210
u7211:
	goto	l4920
u7210:
	
l4918:	
	movlw	(040h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	619
	
l1010:	
	
l4920:	
;PR28.c: 619: else if(matrix[0][k] == ' ' & matrix[1][k] == 'X' & matrix[2][k] == 'O'){result1[k] = 0b00010001;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7221
	goto	u7220
u7221:
	goto	l4928
u7220:
	
l4922:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7231
	goto	u7230
u7231:
	goto	l4928
u7230:
	
l4924:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7241
	goto	u7240
u7241:
	goto	l4928
u7240:
	
l4926:	
	movlw	(011h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	620
	
l1012:	
	
l4928:	
;PR28.c: 620: else if(matrix[0][k] == ' ' & matrix[1][k] == 'X' & matrix[2][k] == ' '){result1[k] = 0b00010000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7251
	goto	u7250
u7251:
	goto	l4936
u7250:
	
l4930:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7261
	goto	u7260
u7261:
	goto	l4936
u7260:
	
l4932:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7271
	goto	u7270
u7271:
	goto	l4936
u7270:
	
l4934:	
	movlw	(010h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	621
	
l1014:	
	
l4936:	
;PR28.c: 621: else if(matrix[0][k] == ' ' & matrix[1][k] == ' ' & matrix[2][k] == 'O'){result1[k] = 0b00000001;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7281
	goto	u7280
u7281:
	goto	l4944
u7280:
	
l4938:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7291
	goto	u7290
u7291:
	goto	l4944
u7290:
	
l4940:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7301
	goto	u7300
u7301:
	goto	l4944
u7300:
	
l4942:	
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	clrf	indf
	bsf	status,0
	rlf	indf,f
	goto	l5224
	line	623
	
l1016:	
	
l4944:	
;PR28.c: 623: else if(matrix[0][k] == 'O' & matrix[1][k] == 'X' & matrix[2][k] == 'X'){result1[k] = 0b01010010;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7311
	goto	u7310
u7311:
	goto	l4952
u7310:
	
l4946:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7321
	goto	u7320
u7321:
	goto	l4952
u7320:
	
l4948:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7331
	goto	u7330
u7331:
	goto	l4952
u7330:
	
l4950:	
	movlw	(052h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	624
	
l1018:	
	
l4952:	
;PR28.c: 624: else if(matrix[0][k] == 'O' & matrix[1][k] == 'X' & matrix[2][k] == ' '){result1[k] = 0b01010000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7341
	goto	u7340
u7341:
	goto	l4960
u7340:
	
l4954:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7351
	goto	u7350
u7351:
	goto	l4960
u7350:
	
l4956:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7361
	goto	u7360
u7361:
	goto	l4960
u7360:
	
l4958:	
	movlw	(050h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	625
	
l1020:	
	
l4960:	
;PR28.c: 625: else if(matrix[0][k] == 'O' & matrix[1][k] == ' ' & matrix[2][k] == 'X'){result1[k] = 0b01000010;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7371
	goto	u7370
u7371:
	goto	l4968
u7370:
	
l4962:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7381
	goto	u7380
u7381:
	goto	l4968
u7380:
	
l4964:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7391
	goto	u7390
u7391:
	goto	l4968
u7390:
	
l4966:	
	movlw	(042h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	626
	
l1022:	
	
l4968:	
;PR28.c: 626: else if(matrix[0][k] == 'O' & matrix[1][k] == ' ' & matrix[2][k] == ' '){result1[k] = 0b01000000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7401
	goto	u7400
u7401:
	goto	l4976
u7400:
	
l4970:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7411
	goto	u7410
u7411:
	goto	l4976
u7410:
	
l4972:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7421
	goto	u7420
u7421:
	goto	l4976
u7420:
	
l4974:	
	movlw	(040h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	627
	
l1024:	
	
l4976:	
;PR28.c: 627: else if(matrix[0][k] == ' ' & matrix[1][k] == 'X' & matrix[2][k] == 'X'){result1[k] = 0b00010010;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7431
	goto	u7430
u7431:
	goto	l4984
u7430:
	
l4978:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7441
	goto	u7440
u7441:
	goto	l4984
u7440:
	
l4980:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7451
	goto	u7450
u7451:
	goto	l4984
u7450:
	
l4982:	
	movlw	(012h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	628
	
l1026:	
	
l4984:	
;PR28.c: 628: else if(matrix[0][k] == ' ' & matrix[1][k] == 'X' & matrix[2][k] == ' '){result1[k] = 0b00010000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7461
	goto	u7460
u7461:
	goto	l4992
u7460:
	
l4986:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7471
	goto	u7470
u7471:
	goto	l4992
u7470:
	
l4988:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7481
	goto	u7480
u7481:
	goto	l4992
u7480:
	
l4990:	
	movlw	(010h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	629
	
l1028:	
	
l4992:	
;PR28.c: 629: else if(matrix[0][k] == ' ' & matrix[1][k] == ' ' & matrix[2][k] == 'X'){result1[k] = 0b00000010;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7491
	goto	u7490
u7491:
	goto	l5000
u7490:
	
l4994:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7501
	goto	u7500
u7501:
	goto	l5000
u7500:
	
l4996:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7511
	goto	u7510
u7511:
	goto	l5000
u7510:
	
l4998:	
	movlw	(02h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	631
	
l1030:	
	
l5000:	
;PR28.c: 631: else if(matrix[0][k] == 'X' & matrix[1][k] == 'O' & matrix[2][k] == 'O'){result1[k] = 0b10001001;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7521
	goto	u7520
u7521:
	goto	l5008
u7520:
	
l5002:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7531
	goto	u7530
u7531:
	goto	l5008
u7530:
	
l5004:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7541
	goto	u7540
u7541:
	goto	l5008
u7540:
	
l5006:	
	movlw	(089h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	632
	
l1032:	
	
l5008:	
;PR28.c: 632: else if(matrix[0][k] == 'X' & matrix[1][k] == 'O' & matrix[2][k] == ' '){result1[k] = 0b10001000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7551
	goto	u7550
u7551:
	goto	l5016
u7550:
	
l5010:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7561
	goto	u7560
u7561:
	goto	l5016
u7560:
	
l5012:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7571
	goto	u7570
u7571:
	goto	l5016
u7570:
	
l5014:	
	movlw	(088h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	633
	
l1034:	
	
l5016:	
;PR28.c: 633: else if(matrix[0][k] == 'X' & matrix[1][k] == ' ' & matrix[2][k] == 'O'){result1[k] = 0b10000001;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7581
	goto	u7580
u7581:
	goto	l5024
u7580:
	
l5018:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7591
	goto	u7590
u7591:
	goto	l5024
u7590:
	
l5020:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7601
	goto	u7600
u7601:
	goto	l5024
u7600:
	
l5022:	
	movlw	(081h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	634
	
l1036:	
	
l5024:	
;PR28.c: 634: else if(matrix[0][k] == 'X' & matrix[1][k] == ' ' & matrix[2][k] == ' '){result1[k] = 0b10000000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7611
	goto	u7610
u7611:
	goto	l5032
u7610:
	
l5026:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7621
	goto	u7620
u7621:
	goto	l5032
u7620:
	
l5028:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7631
	goto	u7630
u7631:
	goto	l5032
u7630:
	
l5030:	
	movlw	(080h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	635
	
l1038:	
	
l5032:	
;PR28.c: 635: else if(matrix[0][k] == ' ' & matrix[1][k] == 'O' & matrix[2][k] == 'O'){result1[k] = 0b00001001;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7641
	goto	u7640
u7641:
	goto	l5040
u7640:
	
l5034:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7651
	goto	u7650
u7651:
	goto	l5040
u7650:
	
l5036:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7661
	goto	u7660
u7661:
	goto	l5040
u7660:
	
l5038:	
	movlw	(09h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	636
	
l1040:	
	
l5040:	
;PR28.c: 636: else if(matrix[0][k] == ' ' & matrix[1][k] == 'O' & matrix[2][k] == ' '){result1[k] = 0b00001000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7671
	goto	u7670
u7671:
	goto	l5048
u7670:
	
l5042:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7681
	goto	u7680
u7681:
	goto	l5048
u7680:
	
l5044:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7691
	goto	u7690
u7691:
	goto	l5048
u7690:
	
l5046:	
	movlw	(08h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	637
	
l1042:	
	
l5048:	
;PR28.c: 637: else if(matrix[0][k] == ' ' & matrix[1][k] == ' ' & matrix[2][k] == 'O'){result1[k] = 0b00000001;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7701
	goto	u7700
u7701:
	goto	l5056
u7700:
	
l5050:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7711
	goto	u7710
u7711:
	goto	l5056
u7710:
	
l5052:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7721
	goto	u7720
u7721:
	goto	l5056
u7720:
	
l5054:	
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	clrf	indf
	bsf	status,0
	rlf	indf,f
	goto	l5224
	line	639
	
l1044:	
	
l5056:	
;PR28.c: 639: else if(matrix[0][k] == 'X' & matrix[1][k] == 'O' & matrix[2][k] == 'X'){result1[k] = 0b10001010;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7731
	goto	u7730
u7731:
	goto	l5064
u7730:
	
l5058:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7741
	goto	u7740
u7741:
	goto	l5064
u7740:
	
l5060:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7751
	goto	u7750
u7751:
	goto	l5064
u7750:
	
l5062:	
	movlw	(08Ah)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	640
	
l1046:	
	
l5064:	
;PR28.c: 640: else if(matrix[0][k] == 'X' & matrix[1][k] == 'O' & matrix[2][k] == ' '){result1[k] = 0b10001000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7761
	goto	u7760
u7761:
	goto	l5072
u7760:
	
l5066:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7771
	goto	u7770
u7771:
	goto	l5072
u7770:
	
l5068:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7781
	goto	u7780
u7781:
	goto	l5072
u7780:
	
l5070:	
	movlw	(088h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	641
	
l1048:	
	
l5072:	
;PR28.c: 641: else if(matrix[0][k] == 'X' & matrix[1][k] == ' ' & matrix[2][k] == 'X'){result1[k] = 0b10000010;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7791
	goto	u7790
u7791:
	goto	l5080
u7790:
	
l5074:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7801
	goto	u7800
u7801:
	goto	l5080
u7800:
	
l5076:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7811
	goto	u7810
u7811:
	goto	l5080
u7810:
	
l5078:	
	movlw	(082h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	642
	
l1050:	
	
l5080:	
;PR28.c: 642: else if(matrix[0][k] == 'X' & matrix[1][k] == ' ' & matrix[2][k] == ' '){result1[k] = 0b10000000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7821
	goto	u7820
u7821:
	goto	l5088
u7820:
	
l5082:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7831
	goto	u7830
u7831:
	goto	l5088
u7830:
	
l5084:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7841
	goto	u7840
u7841:
	goto	l5088
u7840:
	
l5086:	
	movlw	(080h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	643
	
l1052:	
	
l5088:	
;PR28.c: 643: else if(matrix[0][k] == ' ' & matrix[1][k] == 'O' & matrix[2][k] == 'X'){result1[k] = 0b00001010;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7851
	goto	u7850
u7851:
	goto	l5096
u7850:
	
l5090:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7861
	goto	u7860
u7861:
	goto	l5096
u7860:
	
l5092:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7871
	goto	u7870
u7871:
	goto	l5096
u7870:
	
l5094:	
	movlw	(0Ah)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	644
	
l1054:	
	
l5096:	
;PR28.c: 644: else if(matrix[0][k] == ' ' & matrix[1][k] == 'O' & matrix[2][k] == ' '){result1[k] = 0b00001000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7881
	goto	u7880
u7881:
	goto	l5104
u7880:
	
l5098:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7891
	goto	u7890
u7891:
	goto	l5104
u7890:
	
l5100:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7901
	goto	u7900
u7901:
	goto	l5104
u7900:
	
l5102:	
	movlw	(08h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	645
	
l1056:	
	
l5104:	
;PR28.c: 645: else if(matrix[0][k] == ' ' & matrix[1][k] == ' ' & matrix[2][k] == 'X'){result1[k] = 0b00000010;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7911
	goto	u7910
u7911:
	goto	l5112
u7910:
	
l5106:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7921
	goto	u7920
u7921:
	goto	l5112
u7920:
	
l5108:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7931
	goto	u7930
u7931:
	goto	l5112
u7930:
	
l5110:	
	movlw	(02h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	647
	
l1058:	
	
l5112:	
;PR28.c: 647: else if(matrix[0][k] == 'X' & matrix[1][k] == 'X' & matrix[2][k] == 'O'){result1[k] = 0b10010001;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7941
	goto	u7940
u7941:
	goto	l5120
u7940:
	
l5114:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7951
	goto	u7950
u7951:
	goto	l5120
u7950:
	
l5116:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u7961
	goto	u7960
u7961:
	goto	l5120
u7960:
	
l5118:	
	movlw	(091h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	648
	
l1060:	
	
l5120:	
;PR28.c: 648: else if(matrix[0][k] == 'X' & matrix[1][k] == 'X' & matrix[2][k] == ' '){result1[k] = 0b10010000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7971
	goto	u7970
u7971:
	goto	l5128
u7970:
	
l5122:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u7981
	goto	u7980
u7981:
	goto	l5128
u7980:
	
l5124:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u7991
	goto	u7990
u7991:
	goto	l5128
u7990:
	
l5126:	
	movlw	(090h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	649
	
l1062:	
	
l5128:	
;PR28.c: 649: else if(matrix[0][k] == 'X' & matrix[1][k] == ' ' & matrix[2][k] == 'O'){result1[k] = 0b10000001;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u8001
	goto	u8000
u8001:
	goto	l5136
u8000:
	
l5130:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u8011
	goto	u8010
u8011:
	goto	l5136
u8010:
	
l5132:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u8021
	goto	u8020
u8021:
	goto	l5136
u8020:
	
l5134:	
	movlw	(081h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	650
	
l1064:	
	
l5136:	
;PR28.c: 650: else if(matrix[0][k] == 'X' & matrix[1][k] == ' ' & matrix[2][k] == ' '){result1[k] = 0b10000000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u8031
	goto	u8030
u8031:
	goto	l5144
u8030:
	
l5138:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u8041
	goto	u8040
u8041:
	goto	l5144
u8040:
	
l5140:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u8051
	goto	u8050
u8051:
	goto	l5144
u8050:
	
l5142:	
	movlw	(080h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	651
	
l1066:	
	
l5144:	
;PR28.c: 651: else if(matrix[0][k] == ' ' & matrix[1][k] == 'X' & matrix[2][k] == 'O'){result1[k] = 0b00010001;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u8061
	goto	u8060
u8061:
	goto	l5152
u8060:
	
l5146:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u8071
	goto	u8070
u8071:
	goto	l5152
u8070:
	
l5148:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u8081
	goto	u8080
u8081:
	goto	l5152
u8080:
	
l5150:	
	movlw	(011h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	652
	
l1068:	
	
l5152:	
;PR28.c: 652: else if(matrix[0][k] == ' ' & matrix[1][k] == 'X' & matrix[2][k] == ' '){result1[k] = 0b00010000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u8091
	goto	u8090
u8091:
	goto	l5160
u8090:
	
l5154:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u8101
	goto	u8100
u8101:
	goto	l5160
u8100:
	
l5156:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u8111
	goto	u8110
u8111:
	goto	l5160
u8110:
	
l5158:	
	movlw	(010h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	653
	
l1070:	
	
l5160:	
;PR28.c: 653: else if(matrix[0][k] == ' ' & matrix[1][k] == ' ' & matrix[2][k] == 'O'){result1[k] = 0b00000001;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u8121
	goto	u8120
u8121:
	goto	l5168
u8120:
	
l5162:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u8131
	goto	u8130
u8131:
	goto	l5168
u8130:
	
l5164:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	04Fh
	skipz
	goto	u8141
	goto	u8140
u8141:
	goto	l5168
u8140:
	
l5166:	
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	clrf	indf
	bsf	status,0
	rlf	indf,f
	goto	l5224
	line	655
	
l1072:	
	
l5168:	
;PR28.c: 655: else if(matrix[0][k] == 'X' & matrix[1][k] == 'X' & matrix[2][k] == 'X'){result1[k] = 0b10010010;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u8151
	goto	u8150
u8151:
	goto	l5176
u8150:
	
l5170:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u8161
	goto	u8160
u8161:
	goto	l5176
u8160:
	
l5172:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u8171
	goto	u8170
u8171:
	goto	l5176
u8170:
	
l5174:	
	movlw	(092h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	656
	
l1074:	
	
l5176:	
;PR28.c: 656: else if(matrix[0][k] == 'X' & matrix[1][k] == 'X' & matrix[2][k] == ' '){result1[k] = 0b10010000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u8181
	goto	u8180
u8181:
	goto	l5184
u8180:
	
l5178:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u8191
	goto	u8190
u8191:
	goto	l5184
u8190:
	
l5180:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u8201
	goto	u8200
u8201:
	goto	l5184
u8200:
	
l5182:	
	movlw	(090h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	657
	
l1076:	
	
l5184:	
;PR28.c: 657: else if(matrix[0][k] == 'X' & matrix[1][k] == ' ' & matrix[2][k] == 'X'){result1[k] = 0b10000010;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u8211
	goto	u8210
u8211:
	goto	l5192
u8210:
	
l5186:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u8221
	goto	u8220
u8221:
	goto	l5192
u8220:
	
l5188:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u8231
	goto	u8230
u8231:
	goto	l5192
u8230:
	
l5190:	
	movlw	(082h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	658
	
l1078:	
	
l5192:	
;PR28.c: 658: else if(matrix[0][k] == 'X' & matrix[1][k] == ' ' & matrix[2][k] == ' '){result1[k] = 0b10000000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u8241
	goto	u8240
u8241:
	goto	l5200
u8240:
	
l5194:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u8251
	goto	u8250
u8251:
	goto	l5200
u8250:
	
l5196:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u8261
	goto	u8260
u8261:
	goto	l5200
u8260:
	
l5198:	
	movlw	(080h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	659
	
l1080:	
	
l5200:	
;PR28.c: 659: else if(matrix[0][k] == ' ' & matrix[1][k] == 'X' & matrix[2][k] == 'X'){result1[k] = 0b00010010;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u8271
	goto	u8270
u8271:
	goto	l5208
u8270:
	
l5202:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u8281
	goto	u8280
u8281:
	goto	l5208
u8280:
	
l5204:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u8291
	goto	u8290
u8291:
	goto	l5208
u8290:
	
l5206:	
	movlw	(012h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	660
	
l1082:	
	
l5208:	
;PR28.c: 660: else if(matrix[0][k] == ' ' & matrix[1][k] == 'X' & matrix[2][k] == ' '){result1[k] = 0b00010000;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u8301
	goto	u8300
u8301:
	goto	l5216
u8300:
	
l5210:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u8311
	goto	u8310
u8311:
	goto	l5216
u8310:
	
l5212:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u8321
	goto	u8320
u8321:
	goto	l5216
u8320:
	
l5214:	
	movlw	(010h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	line	661
	
l1084:	
	
l5216:	
;PR28.c: 661: else if(matrix[0][k] == ' ' & matrix[1][k] == ' ' & matrix[2][k] == 'X'){result1[k] = 0b00000010;}
	movf	(DisplayLEDs@k),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u8331
	goto	u8330
u8331:
	goto	l5224
u8330:
	
l5218:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+03h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u8341
	goto	u8340
u8341:
	goto	l5224
u8340:
	
l5220:	
	movf	(DisplayLEDs@k),w
	addlw	_matrix+06h&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	058h
	skipz
	goto	u8351
	goto	u8350
u8351:
	goto	l5224
u8350:
	
l5222:	
	movlw	(02h)
	movwf	(??_DisplayLEDs+0)+0
	movf	(DisplayLEDs@k),w
	addlw	_result1&0ffh
	movwf	fsr0
	movf	(??_DisplayLEDs+0)+0,w
	movwf	indf
	goto	l5224
	
l1086:	
	goto	l5224
	line	663
	
l1085:	
	goto	l5224
	
l1083:	
	goto	l5224
	
l1081:	
	goto	l5224
	
l1079:	
	goto	l5224
	
l1077:	
	goto	l5224
	
l1075:	
	goto	l5224
	
l1073:	
	goto	l5224
	
l1071:	
	goto	l5224
	
l1069:	
	goto	l5224
	
l1067:	
	goto	l5224
	
l1065:	
	goto	l5224
	
l1063:	
	goto	l5224
	
l1061:	
	goto	l5224
	
l1059:	
	goto	l5224
	
l1057:	
	goto	l5224
	
l1055:	
	goto	l5224
	
l1053:	
	goto	l5224
	
l1051:	
	goto	l5224
	
l1049:	
	goto	l5224
	
l1047:	
	goto	l5224
	
l1045:	
	goto	l5224
	
l1043:	
	goto	l5224
	
l1041:	
	goto	l5224
	
l1039:	
	goto	l5224
	
l1037:	
	goto	l5224
	
l1035:	
	goto	l5224
	
l1033:	
	goto	l5224
	
l1031:	
	goto	l5224
	
l1029:	
	goto	l5224
	
l1027:	
	goto	l5224
	
l1025:	
	goto	l5224
	
l1023:	
	goto	l5224
	
l1021:	
	goto	l5224
	
l1019:	
	goto	l5224
	
l1017:	
	goto	l5224
	
l1015:	
	goto	l5224
	
l1013:	
	goto	l5224
	
l1011:	
	goto	l5224
	
l1009:	
	goto	l5224
	
l1007:	
	goto	l5224
	
l1005:	
	goto	l5224
	
l1003:	
	goto	l5224
	
l1001:	
	goto	l5224
	
l999:	
	goto	l5224
	
l997:	
	goto	l5224
	
l995:	
	goto	l5224
	
l993:	
	goto	l5224
	
l991:	
	goto	l5224
	
l989:	
	goto	l5224
	
l987:	
	goto	l5224
	
l985:	
	goto	l5224
	
l983:	
	goto	l5224
	
l981:	
	goto	l5224
	
l979:	
	goto	l5224
	
l977:	
	
l5224:	
;PR28.c: 663: led_display1(result1[0]);led_display2(result1[1]);led_display3(result1[2]);
	movf	(_result1),w
	fcall	_led_display1
	
l5226:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_result1)+01h,w
	fcall	_led_display2
	
l5228:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_result1)+02h,w
	fcall	_led_display3
	line	596
	
l5230:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(DisplayLEDs@k),f
	skipnc
	incf	(DisplayLEDs@k+1),f
	movlw	high(01h)
	addwf	(DisplayLEDs@k+1),f
	
l5232:	
	movf	(DisplayLEDs@k+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u8365
	movlw	low(03h)
	subwf	(DisplayLEDs@k),w
u8365:

	skipc
	goto	u8361
	goto	u8360
u8361:
	goto	l4774
u8360:
	goto	l1087
	
l975:	
	line	665
	
l1087:	
	return
	opt stack 0
GLOBAL	__end_of_DisplayLEDs
	__end_of_DisplayLEDs:
;; =============== function _DisplayLEDs ends ============

	signat	_DisplayLEDs,88
	global	_CapInit
psect	text707,local,class=CODE,delta=2
global __ptext707
__ptext707:

;; *************** function _CapInit *****************
;; Defined at:
;;		line 235 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               2   11[BANK0 ] int 
;;  i               2    9[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       5       0       0       0
;;      Totals:         0       9       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		___bmul
;; This function is called by:
;;		_Init
;; This function uses a non-reentrant model
;;
psect	text707
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	235
	global	__size_of_CapInit
	__size_of_CapInit	equ	__end_of_CapInit-_CapInit
	
_CapInit:	
	opt	stack 2
; Regs used in _CapInit: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	238
	
l4722:	
;PR28.c: 238: for (index=0; index<9; index++) {
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_index)
	
l4724:	
	movlw	(09h)
	subwf	(_index),w
	skipc
	goto	u6611
	goto	u6610
u6611:
	goto	l4728
u6610:
	goto	l4734
	
l4726:	
	goto	l4734
	
l785:	
	line	239
	
l4728:	
;PR28.c: 239: average[index] = 0;
	movf	(_index),w
	movwf	(??_CapInit+0)+0
	addwf	(??_CapInit+0)+0,w
	addlw	_average&0ffh
	movwf	fsr0
	movlw	low(0)
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movlw	high(0)
	movwf	indf
	line	240
;PR28.c: 240: reading[index] = 0;
	movf	(_index),w
	movwf	(??_CapInit+0)+0
	addwf	(??_CapInit+0)+0,w
	addlw	_reading&0ffh
	movwf	fsr0
	movlw	low(0)
	movwf	indf
	incf	fsr0,f
	movlw	high(0)
	movwf	indf
	line	238
	
l4730:	
	movlw	(01h)
	movwf	(??_CapInit+0)+0
	movf	(??_CapInit+0)+0,w
	addwf	(_index),f
	
l4732:	
	movlw	(09h)
	subwf	(_index),w
	skipc
	goto	u6621
	goto	u6620
u6621:
	goto	l4728
u6620:
	goto	l4734
	
l786:	
	line	242
	
l4734:	
;PR28.c: 241: }
;PR28.c: 242: for(int i=0; i<3; i++){
	movlw	low(0)
	movwf	(CapInit@i)
	movlw	high(0)
	movwf	((CapInit@i))+1
	
l4736:	
	movf	(CapInit@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u6635
	movlw	low(03h)
	subwf	(CapInit@i),w
u6635:

	skipc
	goto	u6631
	goto	u6630
u6631:
	goto	l4740
u6630:
	goto	l4756
	
l4738:	
	goto	l4756
	
l787:	
	line	243
	
l4740:	
;PR28.c: 243: for(int j=0; j<3; j++){
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(CapInit@j)
	movlw	high(0)
	movwf	((CapInit@j))+1
	
l4742:	
	movf	(CapInit@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u6645
	movlw	low(03h)
	subwf	(CapInit@j),w
u6645:

	skipc
	goto	u6641
	goto	u6640
u6641:
	goto	l4746
u6640:
	goto	l4752
	
l4744:	
	goto	l4752
	
l789:	
	line	244
	
l4746:	
;PR28.c: 244: matrix[i][j] = ' ';
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_CapInit+0)+0
	movlw	(03h)
	movwf	(??_CapInit+1)+0
	movf	(??_CapInit+1)+0,w
	movwf	(?___bmul)
	movf	(CapInit@i),w
	fcall	___bmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_CapInit+2)+0
	movlw	(_matrix)&0ffh
	addwf	0+(??_CapInit+2)+0,w
	movwf	(??_CapInit+3)+0
	movf	(CapInit@j),w
	addwf	0+(??_CapInit+3)+0,w
	movwf	(??_CapInit+4)+0
	movf	0+(??_CapInit+4)+0,w
	movwf	fsr0
	movf	(??_CapInit+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	243
	
l4748:	
	movlw	low(01h)
	addwf	(CapInit@j),f
	skipnc
	incf	(CapInit@j+1),f
	movlw	high(01h)
	addwf	(CapInit@j+1),f
	
l4750:	
	movf	(CapInit@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u6655
	movlw	low(03h)
	subwf	(CapInit@j),w
u6655:

	skipc
	goto	u6651
	goto	u6650
u6651:
	goto	l4746
u6650:
	goto	l4752
	
l790:	
	line	242
	
l4752:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(CapInit@i),f
	skipnc
	incf	(CapInit@i+1),f
	movlw	high(01h)
	addwf	(CapInit@i+1),f
	
l4754:	
	movf	(CapInit@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u6665
	movlw	low(03h)
	subwf	(CapInit@i),w
u6665:

	skipc
	goto	u6661
	goto	u6660
u6661:
	goto	l4740
u6660:
	goto	l4756
	
l788:	
	line	252
	
l4756:	
;PR28.c: 245: }
;PR28.c: 246: }
;PR28.c: 252: T2CON = 0b01110110;
	movlw	(076h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(18)	;volatile
	line	253
;PR28.c: 253: PR2 = 0xB4;
	movlw	(0B4h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	254
	
l4758:	
;PR28.c: 254: TMR2IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(97/8),(97)&7
	line	255
	
l4760:	
;PR28.c: 255: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	256
;PR28.c: 256: T1CON = 0b11000101;
	movlw	(0C5h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(16)	;volatile
	line	257
;PR28.c: 257: T1GCON = 0b11100010;
	movlw	(0E2h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	line	258
	
l4762:	
;PR28.c: 258: TMR1GIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(103/8),(103)&7
	line	259
	
l4764:	
;PR28.c: 259: TMR1GIE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1127/8)^080h,(1127)&7
	line	261
	
l791:	
	return
	opt stack 0
GLOBAL	__end_of_CapInit
	__end_of_CapInit:
;; =============== function _CapInit ends ============

	signat	_CapInit,88
	global	_led_off
psect	text708,local,class=CODE,delta=2
global __ptext708
__ptext708:

;; *************** function _led_off *****************
;; Defined at:
;;		line 932 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_led_display1
;;		_led_display2
;;		_led_display3
;; This function is called by:
;;		_Init
;;		_draw
;; This function uses a non-reentrant model
;;
psect	text708
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	932
	global	__size_of_led_off
	__size_of_led_off	equ	__end_of_led_off-_led_off
	
_led_off:	
	opt	stack 2
; Regs used in _led_off: [wreg+status,2+status,0+pclath+cstack]
	line	933
	
l4710:	
;PR28.c: 933: result = 0b00000000;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_result)
	line	934
	
l4712:	
;PR28.c: 934: RA6 = RA7 = RA0 = 0;
	bcf	(40/8),(40)&7
	bcf	(47/8),(47)&7
	bcf	(46/8),(46)&7
	line	935
	
l4714:	
;PR28.c: 935: RC5 = RC6 = RC7 = 0;
	bcf	(63/8),(63)&7
	bcf	(62/8),(62)&7
	bcf	(61/8),(61)&7
	line	936
	
l4716:	
;PR28.c: 936: led_display1(result);
	movf	(_result),w
	fcall	_led_display1
	line	937
	
l4718:	
;PR28.c: 937: led_display2(result);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_result),w
	fcall	_led_display2
	line	938
	
l4720:	
;PR28.c: 938: led_display3(result);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_result),w
	fcall	_led_display3
	line	939
	
l1183:	
	return
	opt stack 0
GLOBAL	__end_of_led_off
	__end_of_led_off:
;; =============== function _led_off ends ============

	signat	_led_off,88
	global	_PIEZO_D
psect	text709,local,class=CODE,delta=2
global __ptext709
__ptext709:

;; *************** function _PIEZO_D *****************
;; Defined at:
;;		line 1011 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_delay
;;		_RestartTimer1
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text709
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	1011
	global	__size_of_PIEZO_D
	__size_of_PIEZO_D	equ	__end_of_PIEZO_D-_PIEZO_D
	
_PIEZO_D:	
	opt	stack 3
; Regs used in _PIEZO_D: [wreg+status,2+status,0+pclath+cstack]
	line	1012
	
l4566:	
;PR28.c: 1012: GIE=0;
	bcf	(95/8),(95)&7
	line	1013
;PR28.c: 1013: TMR2ON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(146/8),(146)&7
	line	1014
;PR28.c: 1014: TMR1ON = 0;
	bcf	(128/8),(128)&7
	line	1015
	
l4568:	
;PR28.c: 1015: CCP1CON = 0b00001100;
	movlw	(0Ch)
	movwf	(23)	;volatile
	line	1016
;PR28.c: 1016: T2CON = 0b00000111;
	movlw	(07h)
	movwf	(18)	;volatile
	line	1017
;PR28.c: 1017: PR2 = 0xBC;
	movlw	(0BCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1018
;PR28.c: 1018: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1019
	
l4570:	
;PR28.c: 1019: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1020
	
l4572:	
;PR28.c: 1020: PR2 = 0xBC;
	movlw	(0BCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1021
	
l4574:	
;PR28.c: 1021: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1022
	
l4576:	
;PR28.c: 1022: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1023
;PR28.c: 1023: PR2 = 0xB2;
	movlw	(0B2h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1024
;PR28.c: 1024: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1025
	
l4578:	
;PR28.c: 1025: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1026
	
l4580:	
;PR28.c: 1026: PR2 = 0x9E;
	movlw	(09Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1027
	
l4582:	
;PR28.c: 1027: CCPR1L = 100;
	movlw	(064h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1028
	
l4584:	
;PR28.c: 1028: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1029
;PR28.c: 1029: PR2 = 0x9E;
	movlw	(09Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1030
;PR28.c: 1030: CCPR1L = 100;
	movlw	(064h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1031
	
l4586:	
;PR28.c: 1031: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1032
	
l4588:	
;PR28.c: 1032: PR2 = 0xB2;
	movlw	(0B2h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1033
	
l4590:	
;PR28.c: 1033: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1034
	
l4592:	
;PR28.c: 1034: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1035
;PR28.c: 1035: PR2 = 0xBC;
	movlw	(0BCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1036
;PR28.c: 1036: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1037
	
l4594:	
;PR28.c: 1037: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1038
	
l4596:	
;PR28.c: 1038: PR2 = 0xD3;
	movlw	(0D3h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1039
	
l4598:	
;PR28.c: 1039: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1040
	
l4600:	
;PR28.c: 1040: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1041
;PR28.c: 1041: PR2 = 0xEE;
	movlw	(0EEh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1042
;PR28.c: 1042: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1043
	
l4602:	
;PR28.c: 1043: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1044
	
l4604:	
;PR28.c: 1044: PR2 = 0xEE;
	movlw	(0EEh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1045
	
l4606:	
;PR28.c: 1045: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1046
	
l4608:	
;PR28.c: 1046: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1047
;PR28.c: 1047: PR2 = 0xD3;
	movlw	(0D3h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1048
;PR28.c: 1048: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1049
	
l4610:	
;PR28.c: 1049: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1050
	
l4612:	
;PR28.c: 1050: PR2 = 0xBC;
	movlw	(0BCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1051
	
l4614:	
;PR28.c: 1051: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1052
	
l4616:	
;PR28.c: 1052: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1053
;PR28.c: 1053: PR2 = 0xBC;
	movlw	(0BCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1054
;PR28.c: 1054: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1055
	
l4618:	
;PR28.c: 1055: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1056
	
l4620:	
;PR28.c: 1056: PR2 = 0xD3;
	movlw	(0D3h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1057
	
l4622:	
;PR28.c: 1057: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1058
	
l4624:	
;PR28.c: 1058: delay(2000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	07h
	movwf	(?_delay+1)
	movlw	0D0h
	movwf	(?_delay)

	fcall	_delay
	line	1059
;PR28.c: 1059: PR2 = 0xD3;
	movlw	(0D3h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1060
;PR28.c: 1060: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1061
	
l4626:	
;PR28.c: 1061: delay(8000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	01Fh
	movwf	(?_delay+1)
	movlw	040h
	movwf	(?_delay)

	fcall	_delay
	line	1062
	
l4628:	
;PR28.c: 1062: PR2 = 0xBC;
	movlw	(0BCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1063
	
l4630:	
;PR28.c: 1063: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1064
	
l4632:	
;PR28.c: 1064: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1065
;PR28.c: 1065: PR2 = 0xBC;
	movlw	(0BCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1066
;PR28.c: 1066: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1067
	
l4634:	
;PR28.c: 1067: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1068
	
l4636:	
;PR28.c: 1068: PR2 = 0xB2;
	movlw	(0B2h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1069
	
l4638:	
;PR28.c: 1069: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1070
	
l4640:	
;PR28.c: 1070: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1071
;PR28.c: 1071: PR2 = 0x9E;
	movlw	(09Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1072
;PR28.c: 1072: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1073
	
l4642:	
;PR28.c: 1073: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1074
	
l4644:	
;PR28.c: 1074: PR2 = 0x9E;
	movlw	(09Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1075
	
l4646:	
;PR28.c: 1075: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1076
	
l4648:	
;PR28.c: 1076: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1077
;PR28.c: 1077: PR2 = 0xB2;
	movlw	(0B2h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1078
;PR28.c: 1078: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1079
	
l4650:	
;PR28.c: 1079: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1080
	
l4652:	
;PR28.c: 1080: PR2 = 0xBC;
	movlw	(0BCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1081
	
l4654:	
;PR28.c: 1081: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1082
	
l4656:	
;PR28.c: 1082: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1083
;PR28.c: 1083: PR2 = 0xD3;
	movlw	(0D3h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1084
;PR28.c: 1084: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1085
	
l4658:	
;PR28.c: 1085: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1086
	
l4660:	
;PR28.c: 1086: PR2 = 0xEE;
	movlw	(0EEh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1087
	
l4662:	
;PR28.c: 1087: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1088
	
l4664:	
;PR28.c: 1088: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1089
;PR28.c: 1089: PR2 = 0xEE;
	movlw	(0EEh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1090
;PR28.c: 1090: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1091
	
l4666:	
;PR28.c: 1091: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1092
	
l4668:	
;PR28.c: 1092: PR2 = 0xD3;
	movlw	(0D3h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1093
	
l4670:	
;PR28.c: 1093: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1094
	
l4672:	
;PR28.c: 1094: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1095
;PR28.c: 1095: PR2 = 0xBC;
	movlw	(0BCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1096
;PR28.c: 1096: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1097
	
l4674:	
;PR28.c: 1097: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1098
	
l4676:	
;PR28.c: 1098: PR2 = 0xD3;
	movlw	(0D3h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1099
	
l4678:	
;PR28.c: 1099: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1100
	
l4680:	
;PR28.c: 1100: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1101
;PR28.c: 1101: PR2 = 0xEE;
	movlw	(0EEh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1102
;PR28.c: 1102: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1103
	
l4682:	
;PR28.c: 1103: delay(2000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	07h
	movwf	(?_delay+1)
	movlw	0D0h
	movwf	(?_delay)

	fcall	_delay
	line	1104
	
l4684:	
;PR28.c: 1104: PR2 = 0xEE;
	movlw	(0EEh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1105
	
l4686:	
;PR28.c: 1105: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1106
	
l4688:	
;PR28.c: 1106: delay(8000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	01Fh
	movwf	(?_delay+1)
	movlw	040h
	movwf	(?_delay)

	fcall	_delay
	line	1108
	
l4690:	
;PR28.c: 1108: CCP1CON = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(23)	;volatile
	line	1109
	
l4692:	
;PR28.c: 1109: T2CON=0b01110110;
	movlw	(076h)
	movwf	(18)	;volatile
	line	1110
	
l4694:	
;PR28.c: 1110: PR2 = 0xB4;
	movlw	(0B4h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1111
	
l4696:	
;PR28.c: 1111: CCPR1L = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(21)	;volatile
	line	1113
	
l4698:	
;PR28.c: 1113: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	1114
	
l4700:	
;PR28.c: 1114: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	1115
;PR28.c: 1115: T1CON = 0b11000101;
	movlw	(0C5h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(16)	;volatile
	line	1116
;PR28.c: 1116: T1GCON = 0b11100010;
	movlw	(0E2h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	line	1117
	
l4702:	
;PR28.c: 1117: TMR1GIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(103/8),(103)&7
	line	1118
	
l4704:	
;PR28.c: 1118: TMR1GIE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1127/8)^080h,(1127)&7
	line	1120
	
l4706:	
;PR28.c: 1120: RestartTimer1();
	fcall	_RestartTimer1
	line	1121
	
l4708:	
;PR28.c: 1121: GIE = 1;
	bsf	(95/8),(95)&7
	line	1122
	
l1189:	
	return
	opt stack 0
GLOBAL	__end_of_PIEZO_D
	__end_of_PIEZO_D:
;; =============== function _PIEZO_D ends ============

	signat	_PIEZO_D,88
	global	_PIEZO
psect	text710,local,class=CODE,delta=2
global __ptext710
__ptext710:

;; *************** function _PIEZO *****************
;; Defined at:
;;		line 946 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_delay
;;		_RestartTimer1
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text710
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	946
	global	__size_of_PIEZO
	__size_of_PIEZO	equ	__end_of_PIEZO-_PIEZO
	
_PIEZO:	
	opt	stack 3
; Regs used in _PIEZO: [wreg+status,2+status,0+pclath+cstack]
	line	947
	
l4482:	
;PR28.c: 947: GIE=0;
	bcf	(95/8),(95)&7
	line	948
;PR28.c: 948: TMR2ON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(146/8),(146)&7
	line	949
;PR28.c: 949: TMR1ON = 0;
	bcf	(128/8),(128)&7
	line	951
	
l4484:	
;PR28.c: 951: CCP1CON = 0b00001100;
	movlw	(0Ch)
	movwf	(23)	;volatile
	line	952
;PR28.c: 952: T2CON = 0b00000111;
	movlw	(07h)
	movwf	(18)	;volatile
	line	953
;PR28.c: 953: PR2 = 0x76;
	movlw	(076h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	954
;PR28.c: 954: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	955
	
l4486:	
;PR28.c: 955: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	956
	
l4488:	
;PR28.c: 956: PR2 = 0x7D;
	movlw	(07Dh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	957
	
l4490:	
;PR28.c: 957: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	958
	
l4492:	
;PR28.c: 958: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	959
;PR28.c: 959: PR2 = 0x9E;
	movlw	(09Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	960
;PR28.c: 960: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	961
	
l4494:	
;PR28.c: 961: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	962
	
l4496:	
;PR28.c: 962: PR2 = 0x76;
	movlw	(076h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	963
	
l4498:	
;PR28.c: 963: CCPR1L = 100;
	movlw	(064h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	964
	
l4500:	
;PR28.c: 964: delay(8000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	01Fh
	movwf	(?_delay+1)
	movlw	040h
	movwf	(?_delay)

	fcall	_delay
	line	965
;PR28.c: 965: PR2 = 0x7D;
	movlw	(07Dh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	966
;PR28.c: 966: CCPR1L = 100;
	movlw	(064h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	967
	
l4502:	
;PR28.c: 967: delay(8000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	01Fh
	movwf	(?_delay+1)
	movlw	040h
	movwf	(?_delay)

	fcall	_delay
	line	968
	
l4504:	
;PR28.c: 968: PR2 = 0xBD;
	movlw	(0BDh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	969
	
l4506:	
;PR28.c: 969: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	970
	
l4508:	
;PR28.c: 970: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	971
	
l4510:	
;PR28.c: 971: PR2 = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(146)^080h	;volatile
	line	972
	
l4512:	
;PR28.c: 972: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	973
	
l4514:	
;PR28.c: 973: delay(2000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	07h
	movwf	(?_delay+1)
	movlw	0D0h
	movwf	(?_delay)

	fcall	_delay
	line	974
	
l4516:	
;PR28.c: 974: PR2 = 0x76;
	movlw	(076h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	975
	
l4518:	
;PR28.c: 975: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	976
	
l4520:	
;PR28.c: 976: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	977
	
l4522:	
;PR28.c: 977: PR2 = 0xEE;
	movlw	(0EEh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	978
	
l4524:	
;PR28.c: 978: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	979
	
l4526:	
;PR28.c: 979: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	980
	
l4528:	
;PR28.c: 980: PR2 = 0x9E;
	movlw	(09Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	981
	
l4530:	
;PR28.c: 981: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	982
	
l4532:	
;PR28.c: 982: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	983
	
l4534:	
;PR28.c: 983: PR2 = 0x8D;
	movlw	(08Dh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	984
	
l4536:	
;PR28.c: 984: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	985
	
l4538:	
;PR28.c: 985: delay(8000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	01Fh
	movwf	(?_delay+1)
	movlw	040h
	movwf	(?_delay)

	fcall	_delay
	line	986
	
l4540:	
;PR28.c: 986: PR2 = 0x76;
	movlw	(076h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	987
	
l4542:	
;PR28.c: 987: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	988
	
l4544:	
;PR28.c: 988: delay(8000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	01Fh
	movwf	(?_delay+1)
	movlw	040h
	movwf	(?_delay)

	fcall	_delay
	line	990
;PR28.c: 990: CCP1CON = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(23)	;volatile
	line	991
	
l4546:	
;PR28.c: 991: T2CON=0b01110110;
	movlw	(076h)
	movwf	(18)	;volatile
	line	992
	
l4548:	
;PR28.c: 992: PR2 = 0xB4;
	movlw	(0B4h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	993
;PR28.c: 993: CCPR1L = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(21)	;volatile
	line	995
	
l4550:	
;PR28.c: 995: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	996
	
l4552:	
;PR28.c: 996: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	997
	
l4554:	
;PR28.c: 997: T1CON = 0b11000101;
	movlw	(0C5h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(16)	;volatile
	line	998
	
l4556:	
;PR28.c: 998: T1GCON = 0b11100010;
	movlw	(0E2h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	line	999
	
l4558:	
;PR28.c: 999: TMR1GIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(103/8),(103)&7
	line	1000
	
l4560:	
;PR28.c: 1000: TMR1GIE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1127/8)^080h,(1127)&7
	line	1002
	
l4562:	
;PR28.c: 1002: RestartTimer1();
	fcall	_RestartTimer1
	line	1003
	
l4564:	
;PR28.c: 1003: GIE = 1;
	bsf	(95/8),(95)&7
	line	1004
	
l1186:	
	return
	opt stack 0
GLOBAL	__end_of_PIEZO
	__end_of_PIEZO:
;; =============== function _PIEZO ends ============

	signat	_PIEZO,88
	global	_winlose
psect	text711,local,class=CODE,delta=2
global __ptext711
__ptext711:

;; *************** function _winlose *****************
;; Defined at:
;;		line 1184 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               2   13[BANK0 ] int 
;;  i               2   11[BANK0 ] int 
;;  i               2   15[BANK0 ] int 
;;  status          2    8[BANK0 ] int 
;;  j               2    0        int 
;;  i               2    0        int 
;;  flag_w          1   10[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       9       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      13       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		___bmul
;; This function is called by:
;;		_main
;;		_Init
;; This function uses a non-reentrant model
;;
psect	text711
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	1184
	global	__size_of_winlose
	__size_of_winlose	equ	__end_of_winlose-_winlose
	
_winlose:	
	opt	stack 3
; Regs used in _winlose: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	1187
	
l4404:	
;PR28.c: 1185: int status;
;PR28.c: 1186: int i,j;
;PR28.c: 1187: status =0;
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(winlose@status)
	movlw	high(0)
	movwf	((winlose@status))+1
	line	1189
;PR28.c: 1188: char flag_w;
;PR28.c: 1189: for(int i=0; i<3; i++)
	movlw	low(0)
	movwf	(winlose@i_568)
	movlw	high(0)
	movwf	((winlose@i_568))+1
	
l4406:	
	movf	(winlose@i_568+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u6455
	movlw	low(03h)
	subwf	(winlose@i_568),w
u6455:

	skipc
	goto	u6451
	goto	u6450
u6451:
	goto	l4410
u6450:
	goto	l4446
	
l4408:	
	goto	l4446
	line	1190
	
l1195:	
	line	1192
	
l4410:	
;PR28.c: 1190: {
;PR28.c: 1192: if((matrix[i][0]== matrix[i][1]) & (matrix[i][0] == matrix[i][2])){
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_winlose+0)+0
	movf	(??_winlose+0)+0,w
	movwf	(?___bmul)
	movf	(winlose@i_568),w
	fcall	___bmul
	addlw	01h
	addlw	_matrix&0ffh
	movwf	fsr
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_winlose+1)+0
	movlw	(03h)
	movwf	(??_winlose+2)+0
	movf	(??_winlose+2)+0,w
	movwf	(?___bmul)
	movf	(winlose@i_568),w
	fcall	___bmul
	addlw	_matrix&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(??_winlose+1)+0,w
	skipz
	goto	u6461
	goto	u6460
u6461:
	goto	l4418
u6460:
	
l4412:	
	movlw	(03h)
	movwf	(??_winlose+0)+0
	movf	(??_winlose+0)+0,w
	movwf	(?___bmul)
	movf	(winlose@i_568),w
	fcall	___bmul
	addlw	02h
	addlw	_matrix&0ffh
	movwf	fsr
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_winlose+1)+0
	movlw	(03h)
	movwf	(??_winlose+2)+0
	movf	(??_winlose+2)+0,w
	movwf	(?___bmul)
	movf	(winlose@i_568),w
	fcall	___bmul
	addlw	_matrix&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(??_winlose+1)+0,w
	skipz
	goto	u6471
	goto	u6470
u6471:
	goto	l4418
u6470:
	line	1193
	
l4414:	
;PR28.c: 1193: return matrix[i][0];
	movlw	(03h)
	movwf	(??_winlose+0)+0
	movf	(??_winlose+0)+0,w
	movwf	(?___bmul)
	movf	(winlose@i_568),w
	fcall	___bmul
	addlw	_matrix&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	goto	l1198
	
l4416:	
	goto	l1198
	line	1194
	
l1197:	
	line	1196
	
l4418:	
;PR28.c: 1194: }
;PR28.c: 1196: if(matrix[0][i] == matrix[1][i] & matrix[0][i] == matrix[2][i]){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(winlose@i_568),w
	addlw	_matrix+03h&0ffh
	movwf	fsr
	movf	indf,w
	movwf	(??_winlose+0)+0
	movf	(winlose@i_568),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorwf	(??_winlose+0)+0,w
	skipz
	goto	u6481
	goto	u6480
u6481:
	goto	l4426
u6480:
	
l4420:	
	movf	(winlose@i_568),w
	addlw	_matrix+06h&0ffh
	movwf	fsr
	movf	indf,w
	movwf	(??_winlose+0)+0
	movf	(winlose@i_568),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	xorwf	(??_winlose+0)+0,w
	skipz
	goto	u6491
	goto	u6490
u6491:
	goto	l4426
u6490:
	line	1197
	
l4422:	
;PR28.c: 1197: return matrix[0][i];
	movf	(winlose@i_568),w
	addlw	_matrix&0ffh
	movwf	fsr0
	movf	indf,w
	goto	l1198
	
l4424:	
	goto	l1198
	line	1198
	
l1199:	
	line	1200
	
l4426:	
;PR28.c: 1198: }
;PR28.c: 1200: if(matrix[0][0] == matrix[1][1] & matrix[0][0] == matrix[2][2]){
	movf	0+(_matrix)+04h,w
	xorwf	(_matrix),w
	skipz
	goto	u6501
	goto	u6500
u6501:
	goto	l4434
u6500:
	
l4428:	
	movf	0+(_matrix)+08h,w
	xorwf	(_matrix),w
	skipz
	goto	u6511
	goto	u6510
u6511:
	goto	l4434
u6510:
	line	1201
	
l4430:	
;PR28.c: 1201: return matrix[0][0];
	movf	(_matrix),w
	goto	l1198
	
l4432:	
	goto	l1198
	line	1202
	
l1200:	
	line	1203
	
l4434:	
;PR28.c: 1202: }
;PR28.c: 1203: if(matrix[0][2] == matrix[1][1] & matrix[0][2] == matrix[2][0]){
	movf	0+(_matrix)+02h,w
	xorwf	0+(_matrix)+04h,w
	skipz
	goto	u6521
	goto	u6520
u6521:
	goto	l4442
u6520:
	
l4436:	
	movf	0+(_matrix)+02h,w
	xorwf	0+(_matrix)+06h,w
	skipz
	goto	u6531
	goto	u6530
u6531:
	goto	l4442
u6530:
	line	1204
	
l4438:	
;PR28.c: 1204: return matrix[0][2];
	movf	0+(_matrix)+02h,w
	goto	l1198
	
l4440:	
	goto	l1198
	line	1205
	
l1201:	
	line	1189
	
l4442:	
	movlw	low(01h)
	addwf	(winlose@i_568),f
	skipnc
	incf	(winlose@i_568+1),f
	movlw	high(01h)
	addwf	(winlose@i_568+1),f
	
l4444:	
	movf	(winlose@i_568+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u6545
	movlw	low(03h)
	subwf	(winlose@i_568),w
u6545:

	skipc
	goto	u6541
	goto	u6540
u6541:
	goto	l4410
u6540:
	goto	l4446
	
l1196:	
	line	1209
	
l4446:	
;PR28.c: 1205: }
;PR28.c: 1208: }
;PR28.c: 1209: for(int i=0; i<3; i++){
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(winlose@i_569)
	movlw	high(0)
	movwf	((winlose@i_569))+1
	
l4448:	
	movf	(winlose@i_569+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u6555
	movlw	low(03h)
	subwf	(winlose@i_569),w
u6555:

	skipc
	goto	u6551
	goto	u6550
u6551:
	goto	l4452
u6550:
	goto	l4470
	
l4450:	
	goto	l4470
	
l1202:	
	line	1210
	
l4452:	
;PR28.c: 1210: for(int j=0; j<3; j++){
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(winlose@j_570)
	movlw	high(0)
	movwf	((winlose@j_570))+1
	
l4454:	
	movf	(winlose@j_570+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u6565
	movlw	low(03h)
	subwf	(winlose@j_570),w
u6565:

	skipc
	goto	u6561
	goto	u6560
u6561:
	goto	l4458
u6560:
	goto	l4466
	
l4456:	
	goto	l4466
	
l1204:	
	line	1211
	
l4458:	
;PR28.c: 1211: if(matrix[i][j] == ' '){
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_winlose+0)+0
	movf	(??_winlose+0)+0,w
	movwf	(?___bmul)
	movf	(winlose@i_569),w
	fcall	___bmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_winlose+1)+0
	movlw	(_matrix)&0ffh
	addwf	0+(??_winlose+1)+0,w
	movwf	(??_winlose+2)+0
	movf	(winlose@j_570),w
	addwf	0+(??_winlose+2)+0,w
	movwf	(??_winlose+3)+0
	movf	0+(??_winlose+3)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorlw	020h
	skipz
	goto	u6571
	goto	u6570
u6571:
	goto	l4462
u6570:
	line	1212
	
l4460:	
;PR28.c: 1212: status++;
	movlw	low(01h)
	addwf	(winlose@status),f
	skipnc
	incf	(winlose@status+1),f
	movlw	high(01h)
	addwf	(winlose@status+1),f
	line	1213
;PR28.c: 1213: }else{
	goto	l4462
	
l1206:	
	goto	l4462
	line	1215
	
l1207:	
	line	1210
	
l4462:	
	movlw	low(01h)
	addwf	(winlose@j_570),f
	skipnc
	incf	(winlose@j_570+1),f
	movlw	high(01h)
	addwf	(winlose@j_570+1),f
	
l4464:	
	movf	(winlose@j_570+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u6585
	movlw	low(03h)
	subwf	(winlose@j_570),w
u6585:

	skipc
	goto	u6581
	goto	u6580
u6581:
	goto	l4458
u6580:
	goto	l4466
	
l1205:	
	line	1209
	
l4466:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(winlose@i_569),f
	skipnc
	incf	(winlose@i_569+1),f
	movlw	high(01h)
	addwf	(winlose@i_569+1),f
	
l4468:	
	movf	(winlose@i_569+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u6595
	movlw	low(03h)
	subwf	(winlose@i_569),w
u6595:

	skipc
	goto	u6591
	goto	u6590
u6591:
	goto	l4452
u6590:
	goto	l4470
	
l1203:	
	line	1218
	
l4470:	
;PR28.c: 1215: }
;PR28.c: 1216: }
;PR28.c: 1217: }
;PR28.c: 1218: if(status == 0){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((winlose@status+1)),w
	iorwf	((winlose@status)),w
	skipz
	goto	u6601
	goto	u6600
u6601:
	goto	l4478
u6600:
	line	1219
	
l4472:	
;PR28.c: 1219: flag_w = 'd';
	movlw	(064h)
	movwf	(??_winlose+0)+0
	movf	(??_winlose+0)+0,w
	movwf	(winlose@flag_w)
	line	1220
;PR28.c: 1220: return flag_w;
	movf	(winlose@flag_w),w
	goto	l1198
	
l4474:	
	goto	l1198
	line	1221
	
l4476:	
;PR28.c: 1221: }else{
	goto	l1198
	
l1208:	
	line	1222
	
l4478:	
;PR28.c: 1222: flag_w = ' ';
	movlw	(020h)
	movwf	(??_winlose+0)+0
	movf	(??_winlose+0)+0,w
	movwf	(winlose@flag_w)
	line	1223
;PR28.c: 1223: return flag_w;
	movf	(winlose@flag_w),w
	goto	l1198
	
l4480:	
	goto	l1198
	line	1224
	
l1209:	
	line	1225
	
l1198:	
	return
	opt stack 0
GLOBAL	__end_of_winlose
	__end_of_winlose:
;; =============== function _winlose ends ============

	signat	_winlose,89
	global	_PIEZO_S
psect	text712,local,class=CODE,delta=2
global __ptext712
__ptext712:

;; *************** function _PIEZO_S *****************
;; Defined at:
;;		line 1129 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_delay
;;		_RestartTimer1
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text712
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	1129
	global	__size_of_PIEZO_S
	__size_of_PIEZO_S	equ	__end_of_PIEZO_S-_PIEZO_S
	
_PIEZO_S:	
	opt	stack 3
; Regs used in _PIEZO_S: [wreg+status,2+status,0+pclath+cstack]
	line	1130
	
l4348:	
;PR28.c: 1130: GIE=0;
	bcf	(95/8),(95)&7
	line	1131
;PR28.c: 1131: TMR2ON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(146/8),(146)&7
	line	1132
;PR28.c: 1132: TMR1ON = 0;
	bcf	(128/8),(128)&7
	line	1134
	
l4350:	
;PR28.c: 1134: CCP1CON = 0b00001100;
	movlw	(0Ch)
	movwf	(23)	;volatile
	line	1135
;PR28.c: 1135: T2CON = 0b00000111;
	movlw	(07h)
	movwf	(18)	;volatile
	line	1137
;PR28.c: 1137: PR2 = 0xEE;
	movlw	(0EEh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1138
;PR28.c: 1138: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1139
	
l4352:	
;PR28.c: 1139: delay(2000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	07h
	movwf	(?_delay+1)
	movlw	0D0h
	movwf	(?_delay)

	fcall	_delay
	line	1140
	
l4354:	
;PR28.c: 1140: PR2 = 0xD3;
	movlw	(0D3h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1141
	
l4356:	
;PR28.c: 1141: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1142
	
l4358:	
;PR28.c: 1142: delay(2000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	07h
	movwf	(?_delay+1)
	movlw	0D0h
	movwf	(?_delay)

	fcall	_delay
	line	1143
;PR28.c: 1143: PR2 = 0xBD;
	movlw	(0BDh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1144
;PR28.c: 1144: CCPR1L = 100;
	movlw	(064h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1145
	
l4360:	
;PR28.c: 1145: delay(2000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	07h
	movwf	(?_delay+1)
	movlw	0D0h
	movwf	(?_delay)

	fcall	_delay
	line	1146
	
l4362:	
;PR28.c: 1146: PR2 = 0xB2;
	movlw	(0B2h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1147
	
l4364:	
;PR28.c: 1147: CCPR1L = 100;
	movlw	(064h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1148
	
l4366:	
;PR28.c: 1148: delay(2000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	07h
	movwf	(?_delay+1)
	movlw	0D0h
	movwf	(?_delay)

	fcall	_delay
	line	1149
;PR28.c: 1149: PR2 = 0x9E;
	movlw	(09Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1150
;PR28.c: 1150: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1151
	
l4368:	
;PR28.c: 1151: delay(2000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	07h
	movwf	(?_delay+1)
	movlw	0D0h
	movwf	(?_delay)

	fcall	_delay
	line	1152
	
l4370:	
;PR28.c: 1152: PR2 = 0x8D;
	movlw	(08Dh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1153
	
l4372:	
;PR28.c: 1153: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1154
	
l4374:	
;PR28.c: 1154: delay(2000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	07h
	movwf	(?_delay+1)
	movlw	0D0h
	movwf	(?_delay)

	fcall	_delay
	line	1155
;PR28.c: 1155: PR2 = 0x7D;
	movlw	(07Dh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1156
;PR28.c: 1156: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1157
	
l4376:	
;PR28.c: 1157: delay(2000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	07h
	movwf	(?_delay+1)
	movlw	0D0h
	movwf	(?_delay)

	fcall	_delay
	line	1158
	
l4378:	
;PR28.c: 1158: PR2 = 0x76;
	movlw	(076h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1159
	
l4380:	
;PR28.c: 1159: CCPR1L = 50;
	movlw	(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	1160
	
l4382:	
;PR28.c: 1160: delay(4000);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	0Fh
	movwf	(?_delay+1)
	movlw	0A0h
	movwf	(?_delay)

	fcall	_delay
	line	1163
	
l4384:	
;PR28.c: 1163: CCP1CON = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(23)	;volatile
	line	1164
	
l4386:	
;PR28.c: 1164: T2CON=0b01110110;
	movlw	(076h)
	movwf	(18)	;volatile
	line	1165
	
l4388:	
;PR28.c: 1165: PR2 = 0xB4;
	movlw	(0B4h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	1166
	
l4390:	
;PR28.c: 1166: CCPR1L = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(21)	;volatile
	line	1168
	
l4392:	
;PR28.c: 1168: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	1169
	
l4394:	
;PR28.c: 1169: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	1170
;PR28.c: 1170: T1CON = 0b11000101;
	movlw	(0C5h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(16)	;volatile
	line	1171
;PR28.c: 1171: T1GCON = 0b11100010;
	movlw	(0E2h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	line	1172
	
l4396:	
;PR28.c: 1172: TMR1GIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(103/8),(103)&7
	line	1173
	
l4398:	
;PR28.c: 1173: TMR1GIE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1127/8)^080h,(1127)&7
	line	1175
	
l4400:	
;PR28.c: 1175: RestartTimer1();
	fcall	_RestartTimer1
	line	1176
	
l4402:	
;PR28.c: 1176: GIE = 1;
	bsf	(95/8),(95)&7
	line	1177
	
l1192:	
	return
	opt stack 0
GLOBAL	__end_of_PIEZO_S
	__end_of_PIEZO_S:
;; =============== function _PIEZO_S ends ============

	signat	_PIEZO_S,88
	global	___bmul
psect	text713,local,class=CODE,delta=2
global __ptext713
__ptext713:

;; *************** function ___bmul *****************
;; Defined at:
;;		line 3 in file "bmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      1    wreg     unsigned char 
;;  multiplicand    1    0[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  multiplier      1    3[BANK0 ] unsigned char 
;;  product         1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       1       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_CapInit
;;		_winlose
;; This function uses a non-reentrant model
;;
psect	text713
	file	"C:\Program Files\HI-TECH Software\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt	stack 3
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(___bmul@multiplier)
	line	4
	
l4312:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(___bmul@product)
	goto	l4314
	line	6
	
l1212:	
	line	7
	
l4314:	
	btfss	(___bmul@multiplier),(0)&7
	goto	u6391
	goto	u6390
u6391:
	goto	l4318
u6390:
	line	8
	
l4316:	
	movf	(___bmul@multiplicand),w
	movwf	(??___bmul+0)+0
	movf	(??___bmul+0)+0,w
	addwf	(___bmul@product),f
	goto	l4318
	
l1213:	
	line	9
	
l4318:	
	clrc
	rlf	(___bmul@multiplicand),f

	line	10
	
l4320:	
	clrc
	rrf	(___bmul@multiplier),f

	line	11
	
l4322:	
	movf	(___bmul@multiplier),f
	skipz
	goto	u6401
	goto	u6400
u6401:
	goto	l4314
u6400:
	goto	l4324
	
l1214:	
	line	12
	
l4324:	
	movf	(___bmul@product),w
	goto	l1215
	
l4326:	
	line	13
	
l1215:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
;; =============== function ___bmul ends ============

	signat	___bmul,8313
	global	_led_display3
psect	text714,local,class=CODE,delta=2
global __ptext714
__ptext714:

;; *************** function _led_display3 *****************
;; Defined at:
;;		line 772 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;  value3          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  value3          1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DisplayLEDs
;;		_draw
;;		_led_off
;; This function uses a non-reentrant model
;;
psect	text714
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	772
	global	__size_of_led_display3
	__size_of_led_display3	equ	__end_of_led_display3-_led_display3
	
_led_display3:	
	opt	stack 2
; Regs used in _led_display3: [wreg+status,2+status,0]
;led_display3@value3 stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(led_display3@value3)
	line	773
	
l4280:	
;PR28.c: 773: if((value3&0b00000001)==1) RA1=1;
	btfss	(led_display3@value3),(0)&7
	goto	u6241
	goto	u6240
u6241:
	goto	l1128
u6240:
	
l4282:	
	bsf	(41/8),(41)&7
	goto	l1129
	line	774
	
l1128:	
;PR28.c: 774: else RA1=0;
	bcf	(41/8),(41)&7
	
l1129:	
	line	775
;PR28.c: 775: RA3=1;
	bsf	(43/8),(43)&7
	line	776
;PR28.c: 776: RA3=0;
	bcf	(43/8),(43)&7
	line	778
	
l4284:	
;PR28.c: 778: if(((value3&0b00000010)>>1)==1) RA1=1;
	movf	(led_display3@value3),w
	movwf	(??_led_display3+0)+0
	movlw	01h
u6255:
	clrc
	rrf	(??_led_display3+0)+0,f
	addlw	-1
	skipz
	goto	u6255
	btfss	0+(??_led_display3+0)+0,(0)&7
	goto	u6261
	goto	u6260
u6261:
	goto	l1130
u6260:
	
l4286:	
	bsf	(41/8),(41)&7
	goto	l1131
	line	779
	
l1130:	
;PR28.c: 779: else RA1=0;
	bcf	(41/8),(41)&7
	
l1131:	
	line	780
;PR28.c: 780: RA3=1;
	bsf	(43/8),(43)&7
	line	781
;PR28.c: 781: RA3=0;
	bcf	(43/8),(43)&7
	line	783
	
l4288:	
;PR28.c: 783: if(((value3&0b00000100)>>2)==1) RA1=1;
	movf	(led_display3@value3),w
	movwf	(??_led_display3+0)+0
	movlw	02h
u6275:
	clrc
	rrf	(??_led_display3+0)+0,f
	addlw	-1
	skipz
	goto	u6275
	btfss	0+(??_led_display3+0)+0,(0)&7
	goto	u6281
	goto	u6280
u6281:
	goto	l1132
u6280:
	
l4290:	
	bsf	(41/8),(41)&7
	goto	l1133
	line	784
	
l1132:	
;PR28.c: 784: else RA1=0;
	bcf	(41/8),(41)&7
	
l1133:	
	line	785
;PR28.c: 785: RA3=1;
	bsf	(43/8),(43)&7
	line	786
;PR28.c: 786: RA3=0;
	bcf	(43/8),(43)&7
	line	788
	
l4292:	
;PR28.c: 788: if(((value3&0b00001000)>>3)==1) RA1=1;
	movf	(led_display3@value3),w
	movwf	(??_led_display3+0)+0
	movlw	03h
u6295:
	clrc
	rrf	(??_led_display3+0)+0,f
	addlw	-1
	skipz
	goto	u6295
	btfss	0+(??_led_display3+0)+0,(0)&7
	goto	u6301
	goto	u6300
u6301:
	goto	l1134
u6300:
	
l4294:	
	bsf	(41/8),(41)&7
	goto	l1135
	line	789
	
l1134:	
;PR28.c: 789: else RA1=0;
	bcf	(41/8),(41)&7
	
l1135:	
	line	790
;PR28.c: 790: RA3=1;
	bsf	(43/8),(43)&7
	line	791
;PR28.c: 791: RA3=0;
	bcf	(43/8),(43)&7
	line	793
	
l4296:	
;PR28.c: 793: if(((value3&0b00010000)>>4)==1) RA1=1;
	movf	(led_display3@value3),w
	movwf	(??_led_display3+0)+0
	movlw	04h
u6315:
	clrc
	rrf	(??_led_display3+0)+0,f
	addlw	-1
	skipz
	goto	u6315
	btfss	0+(??_led_display3+0)+0,(0)&7
	goto	u6321
	goto	u6320
u6321:
	goto	l1136
u6320:
	
l4298:	
	bsf	(41/8),(41)&7
	goto	l1137
	line	794
	
l1136:	
;PR28.c: 794: else RA1=0;
	bcf	(41/8),(41)&7
	
l1137:	
	line	795
;PR28.c: 795: RA3=1;
	bsf	(43/8),(43)&7
	line	796
;PR28.c: 796: RA3=0;
	bcf	(43/8),(43)&7
	line	798
	
l4300:	
;PR28.c: 798: if(((value3&0b00100000)>>5)==1) RA1=1;
	movf	(led_display3@value3),w
	movwf	(??_led_display3+0)+0
	movlw	05h
u6335:
	clrc
	rrf	(??_led_display3+0)+0,f
	addlw	-1
	skipz
	goto	u6335
	btfss	0+(??_led_display3+0)+0,(0)&7
	goto	u6341
	goto	u6340
u6341:
	goto	l1138
u6340:
	
l4302:	
	bsf	(41/8),(41)&7
	goto	l1139
	line	799
	
l1138:	
;PR28.c: 799: else RA1=0;
	bcf	(41/8),(41)&7
	
l1139:	
	line	800
;PR28.c: 800: RA3=1;
	bsf	(43/8),(43)&7
	line	801
;PR28.c: 801: RA3=0;
	bcf	(43/8),(43)&7
	line	803
	
l4304:	
;PR28.c: 803: if(((value3&0b01000000)>>6)==1) RA1=1;
	movf	(led_display3@value3),w
	movwf	(??_led_display3+0)+0
	movlw	06h
u6355:
	clrc
	rrf	(??_led_display3+0)+0,f
	addlw	-1
	skipz
	goto	u6355
	btfss	0+(??_led_display3+0)+0,(0)&7
	goto	u6361
	goto	u6360
u6361:
	goto	l1140
u6360:
	
l4306:	
	bsf	(41/8),(41)&7
	goto	l1141
	line	804
	
l1140:	
;PR28.c: 804: else RA1=0;
	bcf	(41/8),(41)&7
	
l1141:	
	line	805
;PR28.c: 805: RA3=1;
	bsf	(43/8),(43)&7
	line	806
;PR28.c: 806: RA3=0;
	bcf	(43/8),(43)&7
	line	808
	
l4308:	
;PR28.c: 808: if(((value3&0b10000000)>>7)==1) RA1=1;
	movf	(led_display3@value3),w
	movwf	(??_led_display3+0)+0
	movlw	07h
u6375:
	clrc
	rrf	(??_led_display3+0)+0,f
	addlw	-1
	skipz
	goto	u6375
	btfss	0+(??_led_display3+0)+0,(0)&7
	goto	u6381
	goto	u6380
u6381:
	goto	l1142
u6380:
	
l4310:	
	bsf	(41/8),(41)&7
	goto	l1143
	line	809
	
l1142:	
;PR28.c: 809: else RA1=0;
	bcf	(41/8),(41)&7
	
l1143:	
	line	810
;PR28.c: 810: RA3=1;
	bsf	(43/8),(43)&7
	line	811
;PR28.c: 811: RA3=0;
	bcf	(43/8),(43)&7
	line	813
;PR28.c: 813: RA2=1;
	bsf	(42/8),(42)&7
	line	814
;PR28.c: 814: RA2=0;
	bcf	(42/8),(42)&7
	line	815
	
l1144:	
	return
	opt stack 0
GLOBAL	__end_of_led_display3
	__end_of_led_display3:
;; =============== function _led_display3 ends ============

	signat	_led_display3,4216
	global	_led_display2
psect	text715,local,class=CODE,delta=2
global __ptext715
__ptext715:

;; *************** function _led_display2 *****************
;; Defined at:
;;		line 722 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;  value2          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  value2          1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DisplayLEDs
;;		_draw
;;		_led_off
;; This function uses a non-reentrant model
;;
psect	text715
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	722
	global	__size_of_led_display2
	__size_of_led_display2	equ	__end_of_led_display2-_led_display2
	
_led_display2:	
	opt	stack 2
; Regs used in _led_display2: [wreg+status,2+status,0]
;led_display2@value2 stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(led_display2@value2)
	line	723
	
l4248:	
;PR28.c: 723: if((value2&0b00000001)==1) RA5=1;
	btfss	(led_display2@value2),(0)&7
	goto	u6091
	goto	u6090
u6091:
	goto	l1109
u6090:
	
l4250:	
	bsf	(45/8),(45)&7
	goto	l1110
	line	724
	
l1109:	
;PR28.c: 724: else RA5=0;
	bcf	(45/8),(45)&7
	
l1110:	
	line	725
;PR28.c: 725: RC0=1;
	bsf	(56/8),(56)&7
	line	726
;PR28.c: 726: RC0=0;
	bcf	(56/8),(56)&7
	line	728
	
l4252:	
;PR28.c: 728: if(((value2&0b00000010)>>1)==1) RA5=1;
	movf	(led_display2@value2),w
	movwf	(??_led_display2+0)+0
	movlw	01h
u6105:
	clrc
	rrf	(??_led_display2+0)+0,f
	addlw	-1
	skipz
	goto	u6105
	btfss	0+(??_led_display2+0)+0,(0)&7
	goto	u6111
	goto	u6110
u6111:
	goto	l1111
u6110:
	
l4254:	
	bsf	(45/8),(45)&7
	goto	l1112
	line	729
	
l1111:	
;PR28.c: 729: else RA5=0;
	bcf	(45/8),(45)&7
	
l1112:	
	line	730
;PR28.c: 730: RC0=1;
	bsf	(56/8),(56)&7
	line	731
;PR28.c: 731: RC0=0;
	bcf	(56/8),(56)&7
	line	733
	
l4256:	
;PR28.c: 733: if(((value2&0b00000100)>>2)==1) RA5=1;
	movf	(led_display2@value2),w
	movwf	(??_led_display2+0)+0
	movlw	02h
u6125:
	clrc
	rrf	(??_led_display2+0)+0,f
	addlw	-1
	skipz
	goto	u6125
	btfss	0+(??_led_display2+0)+0,(0)&7
	goto	u6131
	goto	u6130
u6131:
	goto	l1113
u6130:
	
l4258:	
	bsf	(45/8),(45)&7
	goto	l1114
	line	734
	
l1113:	
;PR28.c: 734: else RA5=0;
	bcf	(45/8),(45)&7
	
l1114:	
	line	735
;PR28.c: 735: RC0=1;
	bsf	(56/8),(56)&7
	line	736
;PR28.c: 736: RC0=0;
	bcf	(56/8),(56)&7
	line	738
	
l4260:	
;PR28.c: 738: if(((value2&0b00001000)>>3)==1) RA5=1;
	movf	(led_display2@value2),w
	movwf	(??_led_display2+0)+0
	movlw	03h
u6145:
	clrc
	rrf	(??_led_display2+0)+0,f
	addlw	-1
	skipz
	goto	u6145
	btfss	0+(??_led_display2+0)+0,(0)&7
	goto	u6151
	goto	u6150
u6151:
	goto	l1115
u6150:
	
l4262:	
	bsf	(45/8),(45)&7
	goto	l1116
	line	739
	
l1115:	
;PR28.c: 739: else RA5=0;
	bcf	(45/8),(45)&7
	
l1116:	
	line	740
;PR28.c: 740: RC0=1;
	bsf	(56/8),(56)&7
	line	741
;PR28.c: 741: RC0=0;
	bcf	(56/8),(56)&7
	line	743
	
l4264:	
;PR28.c: 743: if(((value2&0b00010000)>>4)==1) RA5=1;
	movf	(led_display2@value2),w
	movwf	(??_led_display2+0)+0
	movlw	04h
u6165:
	clrc
	rrf	(??_led_display2+0)+0,f
	addlw	-1
	skipz
	goto	u6165
	btfss	0+(??_led_display2+0)+0,(0)&7
	goto	u6171
	goto	u6170
u6171:
	goto	l1117
u6170:
	
l4266:	
	bsf	(45/8),(45)&7
	goto	l1118
	line	744
	
l1117:	
;PR28.c: 744: else RA5=0;
	bcf	(45/8),(45)&7
	
l1118:	
	line	745
;PR28.c: 745: RC0=1;
	bsf	(56/8),(56)&7
	line	746
;PR28.c: 746: RC0=0;
	bcf	(56/8),(56)&7
	line	748
	
l4268:	
;PR28.c: 748: if(((value2&0b00100000)>>5)==1) RA5=1;
	movf	(led_display2@value2),w
	movwf	(??_led_display2+0)+0
	movlw	05h
u6185:
	clrc
	rrf	(??_led_display2+0)+0,f
	addlw	-1
	skipz
	goto	u6185
	btfss	0+(??_led_display2+0)+0,(0)&7
	goto	u6191
	goto	u6190
u6191:
	goto	l1119
u6190:
	
l4270:	
	bsf	(45/8),(45)&7
	goto	l1120
	line	749
	
l1119:	
;PR28.c: 749: else RA5=0;
	bcf	(45/8),(45)&7
	
l1120:	
	line	750
;PR28.c: 750: RC0=1;
	bsf	(56/8),(56)&7
	line	751
;PR28.c: 751: RC0=0;
	bcf	(56/8),(56)&7
	line	753
	
l4272:	
;PR28.c: 753: if(((value2&0b01000000)>>6)==1) RA5=1;
	movf	(led_display2@value2),w
	movwf	(??_led_display2+0)+0
	movlw	06h
u6205:
	clrc
	rrf	(??_led_display2+0)+0,f
	addlw	-1
	skipz
	goto	u6205
	btfss	0+(??_led_display2+0)+0,(0)&7
	goto	u6211
	goto	u6210
u6211:
	goto	l1121
u6210:
	
l4274:	
	bsf	(45/8),(45)&7
	goto	l1122
	line	754
	
l1121:	
;PR28.c: 754: else RA5=0;
	bcf	(45/8),(45)&7
	
l1122:	
	line	755
;PR28.c: 755: RC0=1;
	bsf	(56/8),(56)&7
	line	756
;PR28.c: 756: RC0=0;
	bcf	(56/8),(56)&7
	line	758
	
l4276:	
;PR28.c: 758: if(((value2&0b10000000)>>7)==1) RA5=1;
	movf	(led_display2@value2),w
	movwf	(??_led_display2+0)+0
	movlw	07h
u6225:
	clrc
	rrf	(??_led_display2+0)+0,f
	addlw	-1
	skipz
	goto	u6225
	btfss	0+(??_led_display2+0)+0,(0)&7
	goto	u6231
	goto	u6230
u6231:
	goto	l1123
u6230:
	
l4278:	
	bsf	(45/8),(45)&7
	goto	l1124
	line	759
	
l1123:	
;PR28.c: 759: else RA5=0;
	bcf	(45/8),(45)&7
	
l1124:	
	line	760
;PR28.c: 760: RC0=1;
	bsf	(56/8),(56)&7
	line	761
;PR28.c: 761: RC0=0;
	bcf	(56/8),(56)&7
	line	763
;PR28.c: 763: RE2=1;
	bsf	(74/8),(74)&7
	line	764
;PR28.c: 764: RE2=0;
	bcf	(74/8),(74)&7
	line	765
	
l1125:	
	return
	opt stack 0
GLOBAL	__end_of_led_display2
	__end_of_led_display2:
;; =============== function _led_display2 ends ============

	signat	_led_display2,4216
	global	_led_display1
psect	text716,local,class=CODE,delta=2
global __ptext716
__ptext716:

;; *************** function _led_display1 *****************
;; Defined at:
;;		line 672 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;  value1          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  value1          1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DisplayLEDs
;;		_draw
;;		_led_off
;; This function uses a non-reentrant model
;;
psect	text716
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	672
	global	__size_of_led_display1
	__size_of_led_display1	equ	__end_of_led_display1-_led_display1
	
_led_display1:	
	opt	stack 2
; Regs used in _led_display1: [wreg+status,2+status,0]
;led_display1@value1 stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(led_display1@value1)
	line	673
	
l4216:	
;PR28.c: 673: if((value1&0b00000001)==1) RC1=1;
	btfss	(led_display1@value1),(0)&7
	goto	u5941
	goto	u5940
u5941:
	goto	l1090
u5940:
	
l4218:	
	bsf	(57/8),(57)&7
	goto	l1091
	line	674
	
l1090:	
;PR28.c: 674: else RC1=0;
	bcf	(57/8),(57)&7
	
l1091:	
	line	675
;PR28.c: 675: RC3=1;
	bsf	(59/8),(59)&7
	line	676
;PR28.c: 676: RC3=0;
	bcf	(59/8),(59)&7
	line	678
	
l4220:	
;PR28.c: 678: if(((value1&0b00000010)>>1)==1) RC1=1;
	movf	(led_display1@value1),w
	movwf	(??_led_display1+0)+0
	movlw	01h
u5955:
	clrc
	rrf	(??_led_display1+0)+0,f
	addlw	-1
	skipz
	goto	u5955
	btfss	0+(??_led_display1+0)+0,(0)&7
	goto	u5961
	goto	u5960
u5961:
	goto	l1092
u5960:
	
l4222:	
	bsf	(57/8),(57)&7
	goto	l1093
	line	679
	
l1092:	
;PR28.c: 679: else RC1=0;
	bcf	(57/8),(57)&7
	
l1093:	
	line	680
;PR28.c: 680: RC3=1;
	bsf	(59/8),(59)&7
	line	681
;PR28.c: 681: RC3=0;
	bcf	(59/8),(59)&7
	line	683
	
l4224:	
;PR28.c: 683: if(((value1&0b00000100)>>2)==1) RC1=1;
	movf	(led_display1@value1),w
	movwf	(??_led_display1+0)+0
	movlw	02h
u5975:
	clrc
	rrf	(??_led_display1+0)+0,f
	addlw	-1
	skipz
	goto	u5975
	btfss	0+(??_led_display1+0)+0,(0)&7
	goto	u5981
	goto	u5980
u5981:
	goto	l1094
u5980:
	
l4226:	
	bsf	(57/8),(57)&7
	goto	l1095
	line	684
	
l1094:	
;PR28.c: 684: else RC1=0;
	bcf	(57/8),(57)&7
	
l1095:	
	line	685
;PR28.c: 685: RC3=1;
	bsf	(59/8),(59)&7
	line	686
;PR28.c: 686: RC3=0;
	bcf	(59/8),(59)&7
	line	688
	
l4228:	
;PR28.c: 688: if(((value1&0b00001000)>>3)==1) RC1=1;
	movf	(led_display1@value1),w
	movwf	(??_led_display1+0)+0
	movlw	03h
u5995:
	clrc
	rrf	(??_led_display1+0)+0,f
	addlw	-1
	skipz
	goto	u5995
	btfss	0+(??_led_display1+0)+0,(0)&7
	goto	u6001
	goto	u6000
u6001:
	goto	l1096
u6000:
	
l4230:	
	bsf	(57/8),(57)&7
	goto	l1097
	line	689
	
l1096:	
;PR28.c: 689: else RC1=0;
	bcf	(57/8),(57)&7
	
l1097:	
	line	690
;PR28.c: 690: RC3=1;
	bsf	(59/8),(59)&7
	line	691
;PR28.c: 691: RC3=0;
	bcf	(59/8),(59)&7
	line	693
	
l4232:	
;PR28.c: 693: if(((value1&0b00010000)>>4)==1) RC1=1;
	movf	(led_display1@value1),w
	movwf	(??_led_display1+0)+0
	movlw	04h
u6015:
	clrc
	rrf	(??_led_display1+0)+0,f
	addlw	-1
	skipz
	goto	u6015
	btfss	0+(??_led_display1+0)+0,(0)&7
	goto	u6021
	goto	u6020
u6021:
	goto	l1098
u6020:
	
l4234:	
	bsf	(57/8),(57)&7
	goto	l1099
	line	694
	
l1098:	
;PR28.c: 694: else RC1=0;
	bcf	(57/8),(57)&7
	
l1099:	
	line	695
;PR28.c: 695: RC3=1;
	bsf	(59/8),(59)&7
	line	696
;PR28.c: 696: RC3=0;
	bcf	(59/8),(59)&7
	line	698
	
l4236:	
;PR28.c: 698: if(((value1&0b00100000)>>5)==1) RC1=1;
	movf	(led_display1@value1),w
	movwf	(??_led_display1+0)+0
	movlw	05h
u6035:
	clrc
	rrf	(??_led_display1+0)+0,f
	addlw	-1
	skipz
	goto	u6035
	btfss	0+(??_led_display1+0)+0,(0)&7
	goto	u6041
	goto	u6040
u6041:
	goto	l1100
u6040:
	
l4238:	
	bsf	(57/8),(57)&7
	goto	l1101
	line	699
	
l1100:	
;PR28.c: 699: else RC1=0;
	bcf	(57/8),(57)&7
	
l1101:	
	line	700
;PR28.c: 700: RC3=1;
	bsf	(59/8),(59)&7
	line	701
;PR28.c: 701: RC3=0;
	bcf	(59/8),(59)&7
	line	703
	
l4240:	
;PR28.c: 703: if(((value1&0b01000000)>>6)==1) RC1=1;
	movf	(led_display1@value1),w
	movwf	(??_led_display1+0)+0
	movlw	06h
u6055:
	clrc
	rrf	(??_led_display1+0)+0,f
	addlw	-1
	skipz
	goto	u6055
	btfss	0+(??_led_display1+0)+0,(0)&7
	goto	u6061
	goto	u6060
u6061:
	goto	l1102
u6060:
	
l4242:	
	bsf	(57/8),(57)&7
	goto	l1103
	line	704
	
l1102:	
;PR28.c: 704: else RC1=0;
	bcf	(57/8),(57)&7
	
l1103:	
	line	705
;PR28.c: 705: RC3=1;
	bsf	(59/8),(59)&7
	line	706
;PR28.c: 706: RC3=0;
	bcf	(59/8),(59)&7
	line	708
	
l4244:	
;PR28.c: 708: if(((value1&0b10000000)>>7)==1) RC1=1;
	movf	(led_display1@value1),w
	movwf	(??_led_display1+0)+0
	movlw	07h
u6075:
	clrc
	rrf	(??_led_display1+0)+0,f
	addlw	-1
	skipz
	goto	u6075
	btfss	0+(??_led_display1+0)+0,(0)&7
	goto	u6081
	goto	u6080
u6081:
	goto	l1104
u6080:
	
l4246:	
	bsf	(57/8),(57)&7
	goto	l1105
	line	709
	
l1104:	
;PR28.c: 709: else RC1=0;
	bcf	(57/8),(57)&7
	
l1105:	
	line	710
;PR28.c: 710: RC3=1;
	bsf	(59/8),(59)&7
	line	711
;PR28.c: 711: RC3=0;
	bcf	(59/8),(59)&7
	line	713
;PR28.c: 713: RC4=1;
	bsf	(60/8),(60)&7
	line	714
;PR28.c: 714: RC4=0;
	bcf	(60/8),(60)&7
	line	715
	
l1106:	
	return
	opt stack 0
GLOBAL	__end_of_led_display1
	__end_of_led_display1:
;; =============== function _led_display1 ends ============

	signat	_led_display1,4216
	global	_RestartTimer1
psect	text717,local,class=CODE,delta=2
global __ptext717
__ptext717:

;; *************** function _RestartTimer1 *****************
;; Defined at:
;;		line 544 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_PIEZO
;;		_PIEZO_D
;;		_PIEZO_S
;; This function uses a non-reentrant model
;;
psect	text717
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	544
	global	__size_of_RestartTimer1
	__size_of_RestartTimer1	equ	__end_of_RestartTimer1-_RestartTimer1
	
_RestartTimer1:	
	opt	stack 3
; Regs used in _RestartTimer1: [status,2]
	line	545
	
l4208:	
;PR28.c: 545: TMR1L = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(14)	;volatile
	line	546
;PR28.c: 546: TMR1H = 0;
	clrf	(15)	;volatile
	line	547
;PR28.c: 547: TMR2 = 0;
	clrf	(17)	;volatile
	line	548
	
l4210:	
;PR28.c: 548: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	549
	
l4212:	
;PR28.c: 549: TMR1ON = 1;
	bsf	(128/8),(128)&7
	line	550
	
l4214:	
;PR28.c: 550: TMR2ON = 1;
	bsf	(146/8),(146)&7
	line	551
	
l957:	
	return
	opt stack 0
GLOBAL	__end_of_RestartTimer1
	__end_of_RestartTimer1:
;; =============== function _RestartTimer1 ends ============

	signat	_RestartTimer1,88
	global	_store
psect	text718,local,class=CODE,delta=2
global __ptext718
__ptext718:

;; *************** function _store *****************
;; Defined at:
;;		line 331 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_checkstatus
;; This function uses a non-reentrant model
;;
psect	text718
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	331
	global	__size_of_store
	__size_of_store	equ	__end_of_store-_store
	
_store:	
	opt	stack 1
; Regs used in _store: [wreg+status,2+status,0]
	line	332
	
l4140:	
;PR28.c: 332: if (flag ==0){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_flag),f
	skipz
	goto	u5641
	goto	u5640
u5641:
	goto	l4162
u5640:
	line	333
	
l4142:	
;PR28.c: 333: if(Buttons.BTN0 == 1) { matrix[0][0] = 'X';}
	movf	(_Buttons),w
	xorlw	01h
	skipz
	goto	u5651
	goto	u5650
u5651:
	goto	l821
u5650:
	
l4144:	
	movlw	(058h)
	movwf	(??_store+0)+0
	movf	(??_store+0)+0,w
	movwf	(_matrix)
	
l821:	
	line	334
;PR28.c: 334: if(Buttons.BTN1 == 1) { matrix[0][1] = 'X';}
	movf	0+(_Buttons)+01h,w
	xorlw	01h
	skipz
	goto	u5661
	goto	u5660
u5661:
	goto	l822
u5660:
	
l4146:	
	movlw	(058h)
	movwf	(??_store+0)+0
	movf	(??_store+0)+0,w
	movwf	0+(_matrix)+01h
	
l822:	
	line	335
;PR28.c: 335: if(Buttons.BTN2 == 1) { matrix[0][2] = 'X';}
	movf	0+(_Buttons)+02h,w
	xorlw	01h
	skipz
	goto	u5671
	goto	u5670
u5671:
	goto	l823
u5670:
	
l4148:	
	movlw	(058h)
	movwf	(??_store+0)+0
	movf	(??_store+0)+0,w
	movwf	0+(_matrix)+02h
	
l823:	
	line	336
;PR28.c: 336: if(Buttons.BTN3 == 1) { matrix[1][0] = 'X';}
	movf	0+(_Buttons)+03h,w
	xorlw	01h
	skipz
	goto	u5681
	goto	u5680
u5681:
	goto	l824
u5680:
	
l4150:	
	movlw	(058h)
	movwf	(??_store+0)+0
	movf	(??_store+0)+0,w
	movwf	0+(_matrix)+03h
	
l824:	
	line	337
;PR28.c: 337: if(Buttons.BTN4 == 1) { matrix[1][1] = 'X';}
	movf	0+(_Buttons)+04h,w
	xorlw	01h
	skipz
	goto	u5691
	goto	u5690
u5691:
	goto	l825
u5690:
	
l4152:	
	movlw	(058h)
	movwf	(??_store+0)+0
	movf	(??_store+0)+0,w
	movwf	0+(_matrix)+04h
	
l825:	
	line	338
;PR28.c: 338: if(Buttons.BTN5 == 1) { matrix[1][2] = 'X';}
	movf	0+(_Buttons)+05h,w
	xorlw	01h
	skipz
	goto	u5701
	goto	u5700
u5701:
	goto	l826
u5700:
	
l4154:	
	movlw	(058h)
	movwf	(??_store+0)+0
	movf	(??_store+0)+0,w
	movwf	0+(_matrix)+05h
	
l826:	
	line	339
;PR28.c: 339: if(Buttons.BTN6 == 1) { matrix[2][0] = 'X';}
	movf	0+(_Buttons)+06h,w
	xorlw	01h
	skipz
	goto	u5711
	goto	u5710
u5711:
	goto	l827
u5710:
	
l4156:	
	movlw	(058h)
	movwf	(??_store+0)+0
	movf	(??_store+0)+0,w
	movwf	0+(_matrix)+06h
	
l827:	
	line	340
;PR28.c: 340: if(Buttons.BTN7 == 1) { matrix[2][1] = 'X';}
	movf	0+(_Buttons)+07h,w
	xorlw	01h
	skipz
	goto	u5721
	goto	u5720
u5721:
	goto	l828
u5720:
	
l4158:	
	movlw	(058h)
	movwf	(??_store+0)+0
	movf	(??_store+0)+0,w
	movwf	0+(_matrix)+07h
	
l828:	
	line	341
;PR28.c: 341: if(Buttons.BTN8 == 1) { matrix[2][2] = 'X';}
	movf	0+(_Buttons)+08h,w
	xorlw	01h
	skipz
	goto	u5731
	goto	u5730
u5731:
	goto	l841
u5730:
	
l4160:	
	movlw	(058h)
	movwf	(??_store+0)+0
	movf	(??_store+0)+0,w
	movwf	0+(_matrix)+08h
	goto	l841
	
l829:	
	line	342
;PR28.c: 342: }
	goto	l841
	line	343
	
l820:	
	
l4162:	
;PR28.c: 343: else if(flag == 1){
	movf	(_flag),w
	xorlw	01h
	skipz
	goto	u5741
	goto	u5740
u5741:
	goto	l841
u5740:
	line	344
	
l4164:	
;PR28.c: 344: if(Buttons.BTN0 == 1) { matrix[0][0] = 'O';}
	movf	(_Buttons),w
	xorlw	01h
	skipz
	goto	u5751
	goto	u5750
u5751:
	goto	l832
u5750:
	
l4166:	
	movlw	(04Fh)
	movwf	(??_store+0)+0
	movf	(??_store+0)+0,w
	movwf	(_matrix)
	
l832:	
	line	345
;PR28.c: 345: if(Buttons.BTN1 == 1) { matrix[0][1] = 'O';}
	movf	0+(_Buttons)+01h,w
	xorlw	01h
	skipz
	goto	u5761
	goto	u5760
u5761:
	goto	l833
u5760:
	
l4168:	
	movlw	(04Fh)
	movwf	(??_store+0)+0
	movf	(??_store+0)+0,w
	movwf	0+(_matrix)+01h
	
l833:	
	line	346
;PR28.c: 346: if(Buttons.BTN2 == 1) { matrix[0][2] = 'O';}
	movf	0+(_Buttons)+02h,w
	xorlw	01h
	skipz
	goto	u5771
	goto	u5770
u5771:
	goto	l834
u5770:
	
l4170:	
	movlw	(04Fh)
	movwf	(??_store+0)+0
	movf	(??_store+0)+0,w
	movwf	0+(_matrix)+02h
	
l834:	
	line	347
;PR28.c: 347: if(Buttons.BTN3 == 1) { matrix[1][0] = 'O';}
	movf	0+(_Buttons)+03h,w
	xorlw	01h
	skipz
	goto	u5781
	goto	u5780
u5781:
	goto	l835
u5780:
	
l4172:	
	movlw	(04Fh)
	movwf	(??_store+0)+0
	movf	(??_store+0)+0,w
	movwf	0+(_matrix)+03h
	
l835:	
	line	348
;PR28.c: 348: if(Buttons.BTN4 == 1) { matrix[1][1] = 'O';}
	movf	0+(_Buttons)+04h,w
	xorlw	01h
	skipz
	goto	u5791
	goto	u5790
u5791:
	goto	l836
u5790:
	
l4174:	
	movlw	(04Fh)
	movwf	(??_store+0)+0
	movf	(??_store+0)+0,w
	movwf	0+(_matrix)+04h
	
l836:	
	line	349
;PR28.c: 349: if(Buttons.BTN5 == 1) { matrix[1][2] = 'O';}
	movf	0+(_Buttons)+05h,w
	xorlw	01h
	skipz
	goto	u5801
	goto	u5800
u5801:
	goto	l837
u5800:
	
l4176:	
	movlw	(04Fh)
	movwf	(??_store+0)+0
	movf	(??_store+0)+0,w
	movwf	0+(_matrix)+05h
	
l837:	
	line	350
;PR28.c: 350: if(Buttons.BTN6 == 1) { matrix[2][0] = 'O';}
	movf	0+(_Buttons)+06h,w
	xorlw	01h
	skipz
	goto	u5811
	goto	u5810
u5811:
	goto	l838
u5810:
	
l4178:	
	movlw	(04Fh)
	movwf	(??_store+0)+0
	movf	(??_store+0)+0,w
	movwf	0+(_matrix)+06h
	
l838:	
	line	351
;PR28.c: 351: if(Buttons.BTN7 == 1) { matrix[2][1] = 'O';}
	movf	0+(_Buttons)+07h,w
	xorlw	01h
	skipz
	goto	u5821
	goto	u5820
u5821:
	goto	l839
u5820:
	
l4180:	
	movlw	(04Fh)
	movwf	(??_store+0)+0
	movf	(??_store+0)+0,w
	movwf	0+(_matrix)+07h
	
l839:	
	line	352
;PR28.c: 352: if(Buttons.BTN8 == 1) { matrix[2][2] = 'O';}
	movf	0+(_Buttons)+08h,w
	xorlw	01h
	skipz
	goto	u5831
	goto	u5830
u5831:
	goto	l841
u5830:
	
l4182:	
	movlw	(04Fh)
	movwf	(??_store+0)+0
	movf	(??_store+0)+0,w
	movwf	0+(_matrix)+08h
	goto	l841
	
l840:	
	goto	l841
	line	353
	
l831:	
	goto	l841
	line	354
	
l830:	
	
l841:	
	return
	opt stack 0
GLOBAL	__end_of_store
	__end_of_store:
;; =============== function _store ends ============

	signat	_store,88
	global	_delay
psect	text719,local,class=CODE,delta=2
global __ptext719
__ptext719:

;; *************** function _delay *****************
;; Defined at:
;;		line 822 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;  data            4    0[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_send_config
;;		_send_char
;;		_e_pulse
;;		_lcd_shift
;;		_lcd_clr
;;		_draw
;;		_PIEZO
;;		_PIEZO_D
;;		_PIEZO_S
;; This function uses a non-reentrant model
;;
psect	text719
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	822
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 3
; Regs used in _delay: [wreg]
	line	823
	
l4064:	
;PR28.c: 823: for( ;data>0;data-=1);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(delay@data+3),w
	iorwf	(delay@data+2),w
	iorwf	(delay@data+1),w
	iorwf	(delay@data),w
	skipz
	goto	u5541
	goto	u5540
u5541:
	goto	l4068
u5540:
	goto	l1149
	
l4066:	
	goto	l1149
	
l1147:	
	
l4068:	
	movlw	01h
	movwf	((??_delay+0)+0)
	movlw	0
	movwf	((??_delay+0)+0+1)
	movlw	0
	movwf	((??_delay+0)+0+2)
	movlw	0
	movwf	((??_delay+0)+0+3)
	movf	0+(??_delay+0)+0,w
	subwf	(delay@data),f
	movf	1+(??_delay+0)+0,w
	skipc
	incfsz	1+(??_delay+0)+0,w
	goto	u5555
	goto	u5556
u5555:
	subwf	(delay@data+1),f
u5556:
	movf	2+(??_delay+0)+0,w
	skipc
	incfsz	2+(??_delay+0)+0,w
	goto	u5557
	goto	u5558
u5557:
	subwf	(delay@data+2),f
u5558:
	movf	3+(??_delay+0)+0,w
	skipc
	incfsz	3+(??_delay+0)+0,w
	goto	u5559
	goto	u5550
u5559:
	subwf	(delay@data+3),f
u5550:

	movf	(delay@data+3),w
	iorwf	(delay@data+2),w
	iorwf	(delay@data+1),w
	iorwf	(delay@data),w
	skipz
	goto	u5561
	goto	u5560
u5561:
	goto	l4068
u5560:
	goto	l1149
	
l1148:	
	line	824
	
l1149:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_isr
psect	text720,local,class=CODE,delta=2
global __ptext720
__ptext720:

;; *************** function _isr *****************
;; Defined at:
;;		line 271 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_GetReading
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text720
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	271
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 0
; Regs used in _isr: [allreg]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	movf	status,w
	movwf	(??_isr+0)
	movf	fsr0,w
	movwf	(??_isr+1)
	movf	pclath,w
	movwf	(??_isr+2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_isr+3)
	ljmp	_isr
psect	text720
	line	273
	
i1l4070:	
;PR28.c: 273: while (TMR1GIF )
	goto	i1l4074
	
i1l795:	
	line	276
;PR28.c: 274: {
;PR28.c: 276: TMR2ON =0;
	bcf	(146/8),(146)&7
	line	277
;PR28.c: 277: TMR1ON = 0;
	bcf	(128/8),(128)&7
	line	278
;PR28.c: 278: TMR1GIF = 0;
	bcf	(103/8),(103)&7
	line	280
	
i1l4072:	
;PR28.c: 280: GetReading();
	fcall	_GetReading
	goto	i1l4074
	line	281
	
i1l794:	
	line	273
	
i1l4074:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(103/8),(103)&7
	goto	u557_21
	goto	u557_20
u557_21:
	goto	i1l795
u557_20:
	goto	i1l797
	
i1l796:	
	line	282
	
i1l797:	
	movf	(??_isr+3),w
	movwf	btemp+1
	movf	(??_isr+2),w
	movwf	pclath
	movf	(??_isr+1),w
	movwf	fsr0
	movf	(??_isr+0),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_isr
	__end_of_isr:
;; =============== function _isr ends ============

	signat	_isr,88
	global	_GetReading
psect	text721,local,class=CODE,delta=2
global __ptext721
__ptext721:

;; *************** function _GetReading *****************
;; Defined at:
;;		line 488 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          7       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_SetNextChannel
;;		i1_RestartTimer1
;; This function is called by:
;;		_isr
;; This function uses a non-reentrant model
;;
psect	text721
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	488
	global	__size_of_GetReading
	__size_of_GetReading	equ	__end_of_GetReading-_GetReading
	
_GetReading:	
	opt	stack 0
; Regs used in _GetReading: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	489
	
i1l4076:	
;PR28.c: 489: bigval = TMR1L + (unsigned int)(TMR1H << 8);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(15),w	;volatile
	movwf	(??_GetReading+0)+0
	clrf	(??_GetReading+0)+0+1
	movlw	08h
	movwf	btemp+1
u558_25:
	clrc
	rlf	(??_GetReading+0)+0,f
	rlf	(??_GetReading+0)+1,f
	decfsz	btemp+1,f
	goto	u558_25
	movf	(14),w	;volatile
	addwf	0+(??_GetReading+0)+0,w
	movwf	(_bigval)
	movf	1+(??_GetReading+0)+0,w
	skipnc
	incf	1+(??_GetReading+0)+0,w
	movwf	((_bigval))+1
	line	490
;PR28.c: 490: bigval = bigval * 16;
	movf	(_bigval+1),w
	movwf	(??_GetReading+0)+0+1
	movf	(_bigval),w
	movwf	(??_GetReading+0)+0
	movlw	04h
	movwf	btemp+1
u559_25:
	clrc
	rlf	(??_GetReading+0)+0,f
	rlf	(??_GetReading+0)+1,f
	decfsz	btemp+1,f
	goto	u559_25
	movf	0+(??_GetReading+0)+0,w
	movwf	(_bigval)
	movf	1+(??_GetReading+0)+0,w
	movwf	(_bigval+1)
	line	491
	
i1l4078:	
;PR28.c: 491: reading[index] = bigval;
	movf	(_index),w
	movwf	(??_GetReading+0)+0
	addwf	(??_GetReading+0)+0,w
	addlw	_reading&0ffh
	movwf	fsr0
	movf	(_bigval),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(_bigval+1),w
	movwf	indf
	line	492
	
i1l4080:	
;PR28.c: 492: smallavg = average[index] / 16;
	movf	(_index),w
	movwf	(??_GetReading+0)+0
	addwf	(??_GetReading+0)+0,w
	addlw	_average&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_GetReading+1)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_GetReading+1)+0+1
	movlw	04h
u560_25:
	clrc
	rrf	(??_GetReading+1)+1,f
	rrf	(??_GetReading+1)+0,f
	addlw	-1
	skipz
	goto	u560_25
	movf	0+(??_GetReading+1)+0,w
	movwf	(_smallavg)
	movf	1+(??_GetReading+1)+0,w
	movwf	(_smallavg+1)
	line	493
	
i1l4082:	
;PR28.c: 493: threshold4 = average[index] >> 2;
	movf	(_index),w
	movwf	(??_GetReading+0)+0
	addwf	(??_GetReading+0)+0,w
	addlw	_average&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_GetReading+1)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_GetReading+1)+0+1
	movlw	02h
u561_25:
	clrc
	rrf	(??_GetReading+1)+1,f
	rrf	(??_GetReading+1)+0,f
	addlw	-1
	skipz
	goto	u561_25
	movf	0+(??_GetReading+1)+0,w
	movwf	(_threshold4)
	movf	1+(??_GetReading+1)+0,w
	movwf	(_threshold4+1)
	line	494
	
i1l4084:	
;PR28.c: 494: threshold = threshold4;
	movf	(_threshold4+1),w
	clrf	(_threshold+1)
	addwf	(_threshold+1)
	movf	(_threshold4),w
	clrf	(_threshold)
	addwf	(_threshold)

	line	495
	
i1l4086:	
;PR28.c: 495: if (bigval < average[index] - threshold)
	movf	(_index),w
	movwf	(??_GetReading+0)+0
	addwf	(??_GetReading+0)+0,w
	addlw	_average&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_GetReading+1)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_GetReading+1)+0+1
	comf	(_threshold),w
	movwf	(??_GetReading+3)+0
	comf	(_threshold+1),w
	movwf	((??_GetReading+3)+0+1)
	incf	(??_GetReading+3)+0,f
	skipnz
	incf	((??_GetReading+3)+0+1),f
	movf	0+(??_GetReading+1)+0,w
	addwf	0+(??_GetReading+3)+0,w
	movwf	(??_GetReading+5)+0
	movf	1+(??_GetReading+1)+0,w
	skipnc
	incf	1+(??_GetReading+1)+0,w
	addwf	1+(??_GetReading+3)+0,w
	movwf	1+(??_GetReading+5)+0
	movf	1+(??_GetReading+5)+0,w
	subwf	(_bigval+1),w
	skipz
	goto	u562_25
	movf	0+(??_GetReading+5)+0,w
	subwf	(_bigval),w
u562_25:
	skipnc
	goto	u562_21
	goto	u562_20
u562_21:
	goto	i1l4132
u562_20:
	goto	i1l4110
	line	497
	
i1l4088:	
;PR28.c: 496: {
;PR28.c: 497: switch (index)
	goto	i1l4110
	line	499
;PR28.c: 498: {
;PR28.c: 499: case 0: Buttons.BTN0 = 1; break;
	
i1l930:	
	
i1l4090:	
	clrf	(_Buttons)
	bsf	status,0
	rlf	(_Buttons),f
	goto	i1l4136
	line	500
;PR28.c: 500: case 1: Buttons.BTN1 = 1; break;
	
i1l932:	
	
i1l4092:	
	clrf	0+(_Buttons)+01h
	bsf	status,0
	rlf	0+(_Buttons)+01h,f
	goto	i1l4136
	line	501
;PR28.c: 501: case 2: Buttons.BTN2 = 1; break;
	
i1l933:	
	
i1l4094:	
	clrf	0+(_Buttons)+02h
	bsf	status,0
	rlf	0+(_Buttons)+02h,f
	goto	i1l4136
	line	502
;PR28.c: 502: case 3: Buttons.BTN3 = 1; break;
	
i1l934:	
	
i1l4096:	
	clrf	0+(_Buttons)+03h
	bsf	status,0
	rlf	0+(_Buttons)+03h,f
	goto	i1l4136
	line	503
;PR28.c: 503: case 4: Buttons.BTN4 = 1; break;
	
i1l935:	
	
i1l4098:	
	clrf	0+(_Buttons)+04h
	bsf	status,0
	rlf	0+(_Buttons)+04h,f
	goto	i1l4136
	line	504
;PR28.c: 504: case 5: Buttons.BTN5 = 1; break;
	
i1l936:	
	
i1l4100:	
	clrf	0+(_Buttons)+05h
	bsf	status,0
	rlf	0+(_Buttons)+05h,f
	goto	i1l4136
	line	505
;PR28.c: 505: case 6: Buttons.BTN6 = 1; break;
	
i1l937:	
	
i1l4102:	
	clrf	0+(_Buttons)+06h
	bsf	status,0
	rlf	0+(_Buttons)+06h,f
	goto	i1l4136
	line	506
;PR28.c: 506: case 7: Buttons.BTN7 = 1; break;
	
i1l938:	
	
i1l4104:	
	clrf	0+(_Buttons)+07h
	bsf	status,0
	rlf	0+(_Buttons)+07h,f
	goto	i1l4136
	line	507
;PR28.c: 507: case 8: Buttons.BTN8 = 1; break;
	
i1l939:	
	
i1l4106:	
	clrf	0+(_Buttons)+08h
	bsf	status,0
	rlf	0+(_Buttons)+08h,f
	goto	i1l4136
	line	509
;PR28.c: 509: default: break;
	
i1l940:	
	goto	i1l4136
	line	510
	
i1l4108:	
;PR28.c: 510: }
	goto	i1l4136
	line	497
	
i1l929:	
	
i1l4110:	
	movf	(_index),w
	; Switch size 1, requested type "space"
; Number of cases is 9, Range of values is 0 to 8
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    28    15 (average)
; direct_byte    46    19 (fixed)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	i1l4090
	xorlw	1^0	; case 1
	skipnz
	goto	i1l4092
	xorlw	2^1	; case 2
	skipnz
	goto	i1l4094
	xorlw	3^2	; case 3
	skipnz
	goto	i1l4096
	xorlw	4^3	; case 4
	skipnz
	goto	i1l4098
	xorlw	5^4	; case 5
	skipnz
	goto	i1l4100
	xorlw	6^5	; case 6
	skipnz
	goto	i1l4102
	xorlw	7^6	; case 7
	skipnz
	goto	i1l4104
	xorlw	8^7	; case 8
	skipnz
	goto	i1l4106
	goto	i1l4136

	line	510
	
i1l931:	
	line	511
;PR28.c: 511: }
	goto	i1l4136
	line	512
	
i1l928:	
	line	515
;PR28.c: 512: else
;PR28.c: 513: {
;PR28.c: 515: switch (index)
	goto	i1l4132
	line	517
;PR28.c: 516: {
;PR28.c: 517: case 0: Buttons.BTN0 = 0; break;
	
i1l943:	
	
i1l4112:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_Buttons)
	goto	i1l4134
	line	518
;PR28.c: 518: case 1: Buttons.BTN1 = 0; break;
	
i1l945:	
	
i1l4114:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(_Buttons)+01h
	goto	i1l4134
	line	519
;PR28.c: 519: case 2: Buttons.BTN2 = 0; break;
	
i1l946:	
	
i1l4116:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(_Buttons)+02h
	goto	i1l4134
	line	520
;PR28.c: 520: case 3: Buttons.BTN3 = 0; break;
	
i1l947:	
	
i1l4118:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(_Buttons)+03h
	goto	i1l4134
	line	521
;PR28.c: 521: case 4: Buttons.BTN4 = 0; break;
	
i1l948:	
	
i1l4120:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(_Buttons)+04h
	goto	i1l4134
	line	522
;PR28.c: 522: case 5: Buttons.BTN5 = 0; break;
	
i1l949:	
	
i1l4122:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(_Buttons)+05h
	goto	i1l4134
	line	523
;PR28.c: 523: case 6: Buttons.BTN6 = 0; break;
	
i1l950:	
	
i1l4124:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(_Buttons)+06h
	goto	i1l4134
	line	524
;PR28.c: 524: case 7: Buttons.BTN7 = 0; break;
	
i1l951:	
	
i1l4126:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(_Buttons)+07h
	goto	i1l4134
	line	525
;PR28.c: 525: case 8: Buttons.BTN8 = 0; break;
	
i1l952:	
	
i1l4128:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(_Buttons)+08h
	goto	i1l4134
	line	527
;PR28.c: 527: default: break;
	
i1l953:	
	goto	i1l4134
	line	528
	
i1l4130:	
;PR28.c: 528: }
	goto	i1l4134
	line	515
	
i1l942:	
	
i1l4132:	
	movf	(_index),w
	; Switch size 1, requested type "space"
; Number of cases is 9, Range of values is 0 to 8
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    28    15 (average)
; direct_byte    46    19 (fixed)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	i1l4112
	xorlw	1^0	; case 1
	skipnz
	goto	i1l4114
	xorlw	2^1	; case 2
	skipnz
	goto	i1l4116
	xorlw	3^2	; case 3
	skipnz
	goto	i1l4118
	xorlw	4^3	; case 4
	skipnz
	goto	i1l4120
	xorlw	5^4	; case 5
	skipnz
	goto	i1l4122
	xorlw	6^5	; case 6
	skipnz
	goto	i1l4124
	xorlw	7^6	; case 7
	skipnz
	goto	i1l4126
	xorlw	8^7	; case 8
	skipnz
	goto	i1l4128
	goto	i1l4134

	line	528
	
i1l944:	
	line	531
	
i1l4134:	
;PR28.c: 531: average[index] += bigval/16 - smallavg;
	comf	(_smallavg),w
	movwf	(??_GetReading+0)+0
	comf	(_smallavg+1),w
	movwf	((??_GetReading+0)+0+1)
	incf	(??_GetReading+0)+0,f
	skipnz
	incf	((??_GetReading+0)+0+1),f
	movf	(_bigval+1),w
	movwf	(??_GetReading+2)+0+1
	movf	(_bigval),w
	movwf	(??_GetReading+2)+0
	movlw	04h
u563_25:
	clrc
	rrf	(??_GetReading+2)+1,f
	rrf	(??_GetReading+2)+0,f
	addlw	-1
	skipz
	goto	u563_25
	movf	0+(??_GetReading+0)+0,w
	addwf	0+(??_GetReading+2)+0,w
	movwf	(??_GetReading+4)+0
	movf	1+(??_GetReading+0)+0,w
	skipnc
	incf	1+(??_GetReading+0)+0,w
	addwf	1+(??_GetReading+2)+0,w
	movwf	1+(??_GetReading+4)+0
	movf	(_index),w
	movwf	(??_GetReading+6)+0
	addwf	(??_GetReading+6)+0,w
	addlw	_average&0ffh
	movwf	fsr0
	movf	0+(??_GetReading+4)+0,w
	bcf	status, 7	;select IRP bank0
	addwf	indf,f
	incfsz	fsr0,f
	movf	indf,w
	skipnc
	incf	indf,w
	movwf	btemp+1
	movf	1+(??_GetReading+4)+0,w
	addwf	btemp+1,w
	movwf	indf
	decf	fsr0,f
	goto	i1l4136
	line	532
	
i1l941:	
	line	533
	
i1l4136:	
;PR28.c: 532: }
;PR28.c: 533: SetNextChannel();
	fcall	_SetNextChannel
	line	534
	
i1l4138:	
;PR28.c: 534: RestartTimer1();
	fcall	i1_RestartTimer1
	line	535
	
i1l954:	
	return
	opt stack 0
GLOBAL	__end_of_GetReading
	__end_of_GetReading:
;; =============== function _GetReading ends ============

	signat	_GetReading,88
	global	i1_RestartTimer1
psect	text722,local,class=CODE,delta=2
global __ptext722
__ptext722:

;; *************** function i1_RestartTimer1 *****************
;; Defined at:
;;		line 544 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_GetReading
;; This function uses a non-reentrant model
;;
psect	text722
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	544
	global	__size_ofi1_RestartTimer1
	__size_ofi1_RestartTimer1	equ	__end_ofi1_RestartTimer1-i1_RestartTimer1
	
i1_RestartTimer1:	
	opt	stack 0
; Regs used in i1_RestartTimer1: [status,2]
	line	545
	
i1l4340:	
;PR28.c: 545: TMR1L = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(14)	;volatile
	line	546
;PR28.c: 546: TMR1H = 0;
	clrf	(15)	;volatile
	line	547
;PR28.c: 547: TMR2 = 0;
	clrf	(17)	;volatile
	line	548
	
i1l4342:	
;PR28.c: 548: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	549
	
i1l4344:	
;PR28.c: 549: TMR1ON = 1;
	bsf	(128/8),(128)&7
	line	550
	
i1l4346:	
;PR28.c: 550: TMR2ON = 1;
	bsf	(146/8),(146)&7
	line	551
	
i1l957:	
	return
	opt stack 0
GLOBAL	__end_ofi1_RestartTimer1
	__end_ofi1_RestartTimer1:
;; =============== function i1_RestartTimer1 ends ============

	signat	i1_RestartTimer1,88
	global	_SetNextChannel
psect	text723,local,class=CODE,delta=2
global __ptext723
__ptext723:

;; *************** function _SetNextChannel *****************
;; Defined at:
;;		line 560 in file "C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_GetReading
;; This function uses a non-reentrant model
;;
psect	text723
	file	"C:\Users\Phang\Desktop\9.80\PR 28\PR28.c"
	line	560
	global	__size_of_SetNextChannel
	__size_of_SetNextChannel	equ	__end_of_SetNextChannel-_SetNextChannel
	
_SetNextChannel:	
	opt	stack 0
; Regs used in _SetNextChannel: [wreg+status,2+status,0]
	line	561
	
i1l4184:	
;PR28.c: 561: if (++index>= 9)
	movlw	(01h)
	movwf	(??_SetNextChannel+0)+0
	movf	(??_SetNextChannel+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_index),f
	movlw	(09h)
	subwf	((_index)),w
	skipc
	goto	u584_21
	goto	u584_20
u584_21:
	goto	i1l4188
u584_20:
	line	562
	
i1l4186:	
;PR28.c: 562: index = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_index)
	goto	i1l4188
	line	563
	
i1l960:	
	goto	i1l4188
;PR28.c: 563: else;
	
i1l961:	
	line	564
	
i1l4188:	
;PR28.c: 564: if(index==0)
	movf	(_index),f
	skipz
	goto	u585_21
	goto	u585_20
u585_21:
	goto	i1l962
u585_20:
	line	565
	
i1l4190:	
;PR28.c: 565: CPSCON1 = 0b00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(265)^0100h	;volatile
	
i1l962:	
	line	566
;PR28.c: 566: if(index==1)
	bcf	status, 6	;RP1=0, select bank0
	movf	(_index),w
	xorlw	01h
	skipz
	goto	u586_21
	goto	u586_20
u586_21:
	goto	i1l963
u586_20:
	line	567
	
i1l4192:	
;PR28.c: 567: CPSCON1 = 0b00001001;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(265)^0100h	;volatile
	
i1l963:	
	line	568
;PR28.c: 568: if(index==2)
	bcf	status, 6	;RP1=0, select bank0
	movf	(_index),w
	xorlw	02h
	skipz
	goto	u587_21
	goto	u587_20
u587_21:
	goto	i1l964
u587_20:
	line	569
	
i1l4194:	
;PR28.c: 569: CPSCON1 = 0b00001010;
	movlw	(0Ah)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(265)^0100h	;volatile
	
i1l964:	
	line	570
;PR28.c: 570: if(index == 3)
	bcf	status, 6	;RP1=0, select bank0
	movf	(_index),w
	xorlw	03h
	skipz
	goto	u588_21
	goto	u588_20
u588_21:
	goto	i1l965
u588_20:
	line	571
	
i1l4196:	
;PR28.c: 571: CPSCON1 = 0b00001011;
	movlw	(0Bh)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(265)^0100h	;volatile
	
i1l965:	
	line	572
;PR28.c: 572: if(index== 4)
	bcf	status, 6	;RP1=0, select bank0
	movf	(_index),w
	xorlw	04h
	skipz
	goto	u589_21
	goto	u589_20
u589_21:
	goto	i1l966
u589_20:
	line	573
	
i1l4198:	
;PR28.c: 573: CPSCON1 = 0b00001100;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(265)^0100h	;volatile
	
i1l966:	
	line	574
;PR28.c: 574: if(index == 5)
	bcf	status, 6	;RP1=0, select bank0
	movf	(_index),w
	xorlw	05h
	skipz
	goto	u590_21
	goto	u590_20
u590_21:
	goto	i1l967
u590_20:
	line	575
	
i1l4200:	
;PR28.c: 575: CPSCON1 = 0b00001101;
	movlw	(0Dh)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(265)^0100h	;volatile
	
i1l967:	
	line	576
;PR28.c: 576: if(index ==6)
	bcf	status, 6	;RP1=0, select bank0
	movf	(_index),w
	xorlw	06h
	skipz
	goto	u591_21
	goto	u591_20
u591_21:
	goto	i1l968
u591_20:
	line	577
	
i1l4202:	
;PR28.c: 577: CPSCON1 = 0b00001110;
	movlw	(0Eh)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(265)^0100h	;volatile
	
i1l968:	
	line	578
;PR28.c: 578: if (index ==7)
	bcf	status, 6	;RP1=0, select bank0
	movf	(_index),w
	xorlw	07h
	skipz
	goto	u592_21
	goto	u592_20
u592_21:
	goto	i1l969
u592_20:
	line	579
	
i1l4204:	
;PR28.c: 579: CPSCON1 = 0b00001111;
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(265)^0100h	;volatile
	
i1l969:	
	line	580
;PR28.c: 580: if (index == 8)
	bcf	status, 6	;RP1=0, select bank0
	movf	(_index),w
	xorlw	08h
	skipz
	goto	u593_21
	goto	u593_20
u593_21:
	goto	i1l971
u593_20:
	line	581
	
i1l4206:	
;PR28.c: 581: CPSCON1 = 0b00000110;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(265)^0100h	;volatile
	goto	i1l971
	
i1l970:	
	line	582
	
i1l971:	
	return
	opt stack 0
GLOBAL	__end_of_SetNextChannel
	__end_of_SetNextChannel:
;; =============== function _SetNextChannel ends ============

	signat	_SetNextChannel,88
psect	text724,local,class=CODE,delta=2
global __ptext724
__ptext724:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
