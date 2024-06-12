	;      Batronix Assembler File
	;      -------------------------------------------------------------
	;      Version:       1.0
	;      Revision:      1
	;      Author:        tiesen243
	;      Creation Time: 12-Jun-24 23:40:43
	;      Description:   Print "Hello World!" to the serial port
	;      -------------------------------------------------------------
	;      Program Start
	;      -------------------------------------------------------------
	global _start
	extern _GetStdHandle@4
	extern _WriteFile@20
	extern _ExitProcess@4

	section .text

_start:
	MOV A, #0C8H
	MOV 20H, #0D0H
	MOV R0, #20H
	ADD A, R0
