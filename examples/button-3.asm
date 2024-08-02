Main:
    MOV     P1, #00H
	MOV     R0, #00H

TD1:	JNB     P3.0,INCR
		SJMP    TD1

INCR:	JNB	    P3.0,$
		INC	    R0

KT1:	CJNE	R0,#1,KT2
		LCALL	CHOPTAT
KT2:	CJNE	R0,#2,KT3
	    LCALL	ST1
KT3:    CJNE    R0, #3, KT1
        LCALL   STP
    
STP:	
    MOV	    P1,#00H
	MOV	    R0,#0
	SJMP	TD1
	RET

ST1: 	
    MOV	    A,#00H
	SETB	C

    X12:		
        RLC	    A
        MOV	    P1,A
        LCALL	DELAY
        JNB	    P1.7,X12
    X13:	
        RRC	    A
        MOV	    P1,A
        LCALL	DELAY
        JNB	    P1.0,X13		
        SJMP	X12
    
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