	MOV	    P1,#00H

TD1:	
	JNB	P3.0, Main
	SJMP	TD1

Main:	
	MOV	P1, #00H
	LCALL	DELAY
	MOV	P1, #0FFH
	LCALL	DELAY
	SJMP	Main

STOP:	
	MOV	P1, #00H
	SJMP	TD1

DELAY:	
	MOV	R7,#2
	DEL:	MOV	    R6, #255
	DEL1:	MOV	    R5, #255
	DEL2:	JNB	    P3.1, STOP
		DJNZ	R5, DEL2
		DJNZ	R6, DEL1
		DJNZ	R7, DEL
	RET
    
End