	; Batronix Assembler File
	; -------------------------------------------------------------
	; Version:       1.0
	; Revision:
	; Author:        [TODO: Enter Your Name]
	; Creation Time:  11-Jul-24 10:47:23
	; Description:   [TODO: Enter a Description]
	; -------------------------------------------------------------

	$INCLUDE "Common\89C52.mc"
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
	ORG      0F800H; here begins the usabe memory of the community version
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
    MOV     TMOD, #01H
    ; so lan quay
    ; 64 banh rang * 64 vong = 4096 = 64 * 64
    MOV     B, #64
    
TD1:	
    MOV 	R5, B
    MOV     R4, B

; quay thuan
X11:	
    LCALL   THUAN
    DJNZ	R5, X11
    MOV 	R6, #4

X13:	
    LCALL   DELAY
	DJNZ	R6, X13

	MOV 	R5, B
    MOV     R4, B

; quay nghich
X12:	
    LCALL   NGHICH
    DJNZ	R5, X12
    MOV 	R6, #6
    
X14:	
    LCALL   DELAY
	DJNZ	R6, X14

    SJMP    TD1

THUAN: 	
    SETB    C
	MOV     A, #00H
    X21: 
        RLC     A
        MOV     P3,A
        LCALL   DELAY
        JNB     P3.3, X21
    RET
    
NGHICH: 	
    CLR     C
	MOV     A, #10H
    X22: 
        RRC     A
        MOV     P3, A
        LCALL   DELAY
        JNC     X22
    RET
    
; delay 0.5s
DELAY:	
    MOV	    R7, #10
    
    DEL:	MOV     TH0, #3CH
            MOV     TL0, #0B0H     
            SETB    TR0
            JNB     TF0, $
            CLR     TR0
            CLR     TF0
            DJNZ    R7, DEL
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
