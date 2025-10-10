.386
.model flat, stdcall
.stack 4096

GetStdHandle PROTO,a1:DWORD
WriteConsoleA PROTO, a1:DWORD, a2: PTR BYTE, a3: Dword, a4: ptr dword, a5: dword
ReadConsoleA PROTO, a1:DWORD, a2: PTR BYTE, a3: Dword, a4: ptr dword, a5: dword

.data
arr db 14 dup(' ')
finalarr db 10 dup(' ')

input db "Input the elements of array(max 2 digits, and max 5 length): ",0Ah,0
counter dd ?

.code
main proc

invoke GetStdHandle, -11
invoke WriteConsoleA, eax, offset input, lengthof input, offset counter, 0

invoke GetStdHandle, -10
invoke ReadConsoleA, eax, offset arr, lengthof arr, offset counter, 0

mov esi, offset arr
mov edi, offset finalarr


L1:
	mov al, [esi]
	cmp al, 20h
	je L2
	sub al, 48
	inc esi

	mov [edi], al
	mov bl, [esi]
	cmp bl, 20h
	je L2
	sub bl, 48
	


	mov ecx, 9
	L3:
	add [edi], al
	Loop L3

	add [edi], bl
	inc esi
	inc edi
	mov al, 0
	mov bl, 0
jmp L1

L2:
	inc esi
	cmp byte ptr [esi], 20h
	je EscapedLoop
	cmp byte ptr[edi], 20h
	jne L4
	jmp L1

L4:
	inc edi
	jmp L1

EscapedLoop:




main endp
end main