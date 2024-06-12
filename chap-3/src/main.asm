	; Batronix Assembler File
	; -------------------------------------------------------------
	; Version:       1.0
	; Revision:
	; Author:         tiesen243
	; Creation Time:  13-Jun-24 02:03:38
	; Description:    This is a simple program that demonstrates the use of the 89C51 microcontroller.
	; -------------------------------------------------------------

	$INCLUDE "Common\8052.mc"
	;        -------------------------------------------------------------
	;        Batronix Assembler Source Generator
	;        -------------------------------------------------------------

	; -------------------------------------------------------------
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
	$Include declarations.asm

	; -------------------------------------------------------------
	; Initialize program
	; -------------------------------------------------------------

Initialize:
	MOV SP, #40H

	; -------------------------------------------------------------
	; Main program
	; -------------------------------------------------------------

Main:
	ORG  0000H
	MOV  A, #07FH
	SETB C
	RLC  A
	MOV  R1, #30H
	MOV  30H, #89H
	MOV  @R1, A
	ADD  A, R1
	ORL  A, 30H
	SWAP A
	END

	; -------------------------------------------------------------
	; End of program
	; -------------------------------------------------------------

Finalize:
	JMP finalize

	; -------------------------------------------------------------
	; Data
	; -------------------------------------------------------------
