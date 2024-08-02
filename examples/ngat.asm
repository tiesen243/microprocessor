Main:
        MOV     P1,#00H
		MOV	    R0,#00H

TD1:	JNB     P3.0,INCR
		SJMP    TD1

INCR:	JNB	    P3.0,$
		INC	    R0

KT1:	CJNE	R0,#1,KT
		LCALL	CHOPTAT
KT:		CJNE	R0,#2,KT1
	    LCALL	STP
    
STP:	
        MOV	    P1,#00H
		MOV	    R0,#0
		SJMP	TD1
		RET

CHOPTAT:	
        MOV	    P1,#00H
        LCALL	DELAY
        MOV	    P1,#0FFH
        LCALL	DELAY
        SJMP	CHOPTAT
        RET
            
DELAY:	
    MOV	    R7,#2
    DEL:	MOV	R6,#255
    DEL1:	MOV	R5,#255
    DEL2:	JNB	P3.0,INCR
            DJNZ	R5,DEL2
            DJNZ	R6,DEL1
            DJNZ	R7,DEL
    RET
    
End