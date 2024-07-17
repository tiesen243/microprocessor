Main:
    MOV A, #0FFH
    MOV P1, A
    LCALL DELAY
    MOV A, #077H
    MOV P1, A
    LCALL DELAY
    MOV A, #0BBH
    MOV P1, A
    LCALL DELAY
    MOV A, #0DDH
    MOV P1, A
    LCALL DELAY
    MOV A, #0EEH
    MOV P1, A
    LCALL DELAY
    SJMP Main

	; ----- Delay function ----

DELAY:
    MOV R4, #0FFH
    MOV R5, #0FFH
    MOV R6, #0FFH
    L1:
        DJNZ R4, L1
    L2:
        DJNZ R5, L2
    RET

End