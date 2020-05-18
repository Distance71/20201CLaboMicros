/*
 * Tp1.asm
 *
 *  Created: 17/04/2020 1:24:25
 *   Author: Agus
 */ 

;Specify device
.device ATmega328P

.ORG 0x0000

start:
        SBI     DDRB,5
/*main:	LDI		r20,250
		CALL	delay_10ms
		SBI		PORTB,5
		LDI		r20,250
		CALL	delay_10ms
		CBI		PORTB,5
		JMP		main*/

main:	LDI		r20,250
		CALL	delay_10ms
		LDI		r18,0b11111111
		OUT		PORTB,r18
		LDI		r20,250
		CALL	delay_10ms
		LDI		r18,0b0
		OUT		PORTB,r18
		JMP		main 

delay_10ms:
; r20(n) 10MS.
; The freq is 16MHz, so need 16000 cycles to take 1 MS
; 
		LDI		r31,30000>>8		; high(60000)
		LDI		r30,30000&255		; low(60000)
delayLoop: ; a prom of 5 cycles
		SBIW	r30,1		;takes 2 cycles ;substract 1
		BRNE	delayLoop	;takes 1 or 2 cycles ;branch if not equal
		SUBI	r20,1		;takes 1 cycle ;substract 1
		BRNE	delay_10ms	;1 or 2 cycles
		RET					