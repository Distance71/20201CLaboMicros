/*
 * Tp2.asm
 *
 *  Created: 19/04/2020 22:47:21
 *   Author: Agus
 */ 

 .device ATmega328P

.ORG 0x0000

;use of 

start:
        CBI     DDRB,0	;PB0, input
	CBI	PORTB,0 ;enables pull up at PORTB0
	SBI	DDRB,1	;PB1, output

main:	CBI	PORTB,1	;led turns off
	SBIC	PINB,0	;is not pressed
	CALL	turnOn
	JMP	main

turnOn:	SBI	PORTB,1
	SBIC	PINB,0 ;is not pressed
	JMP		turnOn
	RET
