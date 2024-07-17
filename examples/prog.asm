Main:
	MOV TMOD, #01H

TD1:
	MOV R4, #50; Cycle count

x11:
	LCALL FORWARD
	DJNZ  R4, X11
	MOV   R4, #4

X13:
	LCALL DELAY
	DJNZ  R4, X13
	MOV   R4, #50; Cycle count

X12:
	LCALL BACKWARD
	DJNZ  R4, X12
	SJMP  TD1

	; ----- Forward function ----

FORWARD:
	MOV  A, #00H
	SETB C

X21:
	RLC   A
	MOV   P3, A
	LCALL DELAY
	JNB   P3.3, X21
	RET

	; ----- Backward function ----

BACKWARD:
	MOV A, #10H
	CLR C

X22:
	RRC   A
	MOV   P3, A
	LCALL DELAY
	JNB   P3.0, X22
	SJMP  TD1
	RET

	; ----- Delay function ----

DELAY:
	MOV  TH1, #3CH
	MOV  TL1, #0B0H
	SETB TR1
	JNB  TF1, $
	CLR  TR1
	CLR  TF1
	RET

End
