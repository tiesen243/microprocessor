	; Batronix Assembler File
	; -------------------------------------------------------------
	; Version:       1.0
	; Revision:
	; Author:         tiesen243
	; Creation Time:  20-Jun-24 05:43:17
	; Description:    lorem
	; -------------------------------------------------------------

	$INCLUDE "Common\89C52.mc"
	;        -------------------------------------------------------------
	;        Batronix Assembler Source Generator
	;        -------------------------------------------------------------

	; ------------------------s-------------------------------------
	; Program start
	; -------------------------------------------------------------

	ORG 0h
	JMP Initialize

	; -------------------------------------------------------------
	; Interrupts
	; -------------------------------------------------------------

	;        -------------------------------------------------------------
	;        Includes
	;        -------------------------------------------------------------
	ORG      0FFFFF800H; here begins the usabe memory of the community version
	$INCLUDE declarations.asm

	; -------------------------------------------------------------
	; Initialize program
	; -------------------------------------------------------------

Initialize:
	MOV SP, #40H

	; -------------------------------------------------------------
	; Main program
	; -------------------------------------------------------------

Main:
	MOV R0, #00H
	CLR P2.0
	CLR P2.1

SUB:
	LCALL HEX_BCD
	LCALL BCD_LED7
	LCALL DELAY_DISPLAY
	INC   R0
	CJNE  R0, #60, SUB
	SJMP  Main

HEX_BCD:
	MOV A, R0
	MOV B, #10
	DIV AB
	MOV 20H, B
	MOV 21H, A
	RET

BCD_LED7:
	MOV  DPTR, #TABLE
	MOV  A, 20H
	MOVC A, @A+DPTR
	MOV  30H, A
	MOV  A, 21H
	MOVC A, @A+DPTR
	MOV  31H, A
	RET

DISPLAY:
	MOV   P0, 31H
	SETB  P2.0
	CLR   P2.0
	MOV   P0, #0FFH
	SETB  P2.1
	CLR   P2.1
	LCALL DELAY
	MOV   P0, #0FFH
	SETB  P2.1
	CLR   P2.1

	MOV   P0, 30H
	SETB  P2.0
	CLR   P2.0
	MOV   P0, #77H
	SETB  P2.1
	CLR   P2.1
	LCALL DELAY
	MOV   P0, #0FFH
	SETB  P2.1
	CLR   P2.1
	RET

DELAY_DISPLAY:
	MOV R7, #3

DEL1:
	MOV R6, #200

DEL:
	LCALL DISPLAY
	DJNZ  R6, DEL
	DJNZ  R7, DEL1
	RET

DELAY:
	MOV  R2, #200
	DJNZ R2, $
	RET

TABLE:
	DB 5BH, 4FH, 6DH, 7FH
	;  0     1    2    3    4    5    6    7    8    9

	End

	; -------------------------------------------------------------
	; End of program
	; -------------------------------------------------------------

Finalize:
	JMP finalize

	; -------------------------------------------------------------
	; Data
	; -------------------------------------------------------------
