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

3. Viết chương trình sáng dồn và tắt dồn led P1,biết thạch anh 12MHZ
