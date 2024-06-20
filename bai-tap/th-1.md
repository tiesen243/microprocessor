1. viết chương trình 1 điểm sáng chạy p1.0 đến p1.7 đến p1.0, với thời gian delay 0.5s sử dụng T0. Biết thạch anh 12Mhz

n = 12M/12 * 0.5 = 500000 = 50 (R7) * 10000 (T0)
 => 16 bit => 0000 0001 => tmod = 01H

```assembly
Main:

    MOV tmod, #01h

TD1:
	MOV A, #0ffh
	CLR C

L1:
	RLC   A
	MOV   P1, A
	LCALL DELAY
	JB    P1.7, L1

L2:
	RRC   A
	MOV   P1, A
	LCALL DELAY
	JB    P1.0, L2
	SJMP  TD1

	; ---------- Delay function ----------

DELAY:
	MOV R7, #50

DEL:
	MOV  th0, #0d8h
	MOV  tl0, #0f0h
	SETB tr0
	JNB  tf0, $
	CLR  tr0
	CLR  tf0
	DJNZ R7, Del
	RET

End
```

2. Viết chương trình tắt dồn led p1 với thời gian delay 0.3s sử dụng T1 biết thạch anh 12Mhz

n = 12M/12 * 0.3 = 300000 = 30 (R7) * 10000(T1)
 => 16 bit => 0001 0000 => tmod = 10H

```assembly
Main:
	TG   EQU 20H
	KQ   EQU 21H
	CK   EQU 22H
	SLDL EQU 23H

TD1:
	MOV KQ, #00H
	MOV CK, #8

X1:
	MOV  SLDL, CK
	MOV  TG, #00H
	SETB C

X0:
	MOV   A, TG
	RLC   A
	MOV   TG, A
	ORL   A, KQ
	MOV   P1, A
	LCALL DELAY
	DJNZ  SLDL, X0
	MOV   KQ, P1
	DJNZ  CK, X1
	SJMP  TD1

	; ---------- Delay function ----------

DELAY:
	MOV R7, #30

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
```

3. Viết chương trình sáng dồn và tắt dồn led P1,biết thạch anh 12MHZ

```assembly
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
```
