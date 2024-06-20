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
	TG   EQU 20H
	KQ   EQU 21H
	CK   EQU 22H
	SLDL EQU 23H

	; ---------- Sang don ----------

SD1:
	MOV KQ, #0FFH
	MOV CK, #8

LS1:
	MOV SLDL, CK
	MOV TG, #0FFH
	CLR C

LS2:
	MOV   A, TG
	RLC   A
	MOV   TG, A
	ANL   A, KQ
	MOV   P1, A
	LCALL DELAY
	DJNZ  SLDL, LS2
	MOV   KQ, P1
	DJNZ  CK, LS1

	;---------- Tat don ----------

TD1:
	MOV KQ, #00H
	MOV CK, #8

LT1:
	MOV  SLDL, CK
	MOV  TG, #00H
	SETB C

LT2:
	MOV   A, TG
	RRC   A
	MOV   TG, A
	ORL   A, KQ
	MOV   P1, A
	LCALL DELAY
	DJNZ  SLDL, LT2
	MOV   KQ, P1
	DJNZ  CK, LT1

	SJMP SD1

	; ---------- Delay function ----------

DELAY:
	MOV R7, #100

DEL:
	MOV  th1, #0d8h
	MOV  tl1, #0f0h
	SETB tr1
	JNB  tf1, $
	CLR  tr1
	CLR  tf1
	DJNZ R7, Del
	RET

End

	; -------------------------------------------------------------
	; End of program
	; -------------------------------------------------------------

Finalize:
	JMP finalize

	; -------------------------------------------------------------
	; Data
	; -------------------------------------------------------------
