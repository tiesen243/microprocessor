# Bai tap chuong 3

## Cau 1

```assembly
ORG 0000H    ; Dia chi bat dau cua chuong trinh
MOV A,#07FH  ; A = 07FH = 0111 1111B
SETB C       ; C = 1
RLC A        ; A = 1111 1111B = 0FFH ; C = 0
MOV R1,#30H  ; R1 = 30H
MOV 30H,#89H ; 30H = 89H
MOV @R1,A    ; 30H = 0FFH
ADD A,R1     ; A = 0FFH + 30H = 2FH , C = 1
ORL A,30H    ; A = 2FH OR 89H = AFH
SWAP A       ; A = FAH
END
```

answer

- A = 0FAH
- R1 = 30H
- 30H = 0FFH
