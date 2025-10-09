.386
.model flat, stdcall
.stack 4096
GetStdHandle PROTO,a1:DWORD
WriteConsoleA PROTO, a1:DWORD, a2: PTR BYTE, a3: Dword, a4: ptr dword, a5: dword
ReadConsoleA PROTO, a1:DWORD, a2: PTR BYTE, a3: Dword, a4: ptr dword, a5: dword



.data
msg db "Enter the number of rows of the diamond: "
counter dd ?
extract dd ?
star db '*',0
space db ' ',0
enterr db 0Ah,0
track dd ?

.code

main proc
mov eax, 0
mov ebx, 0
mov ecx, 0
mov edx, 0


invoke GetStdHandle, -11
invoke WriteConsoleA, eax, offset msg, lengthof msg, offset counter, 0

invoke GetStdHandle, -10
invoke ReadConsoleA, eax, offset extract, lengthof extract, offset counter, 0 

sub extract, 48

mov ecx, extract
mov track, 1

L1:
mov ebx, ecx
		L2:
		push ecx
		invoke GetStdHandle, -11
		invoke WriteConsoleA, eax, offset space, lengthof space, offset counter, 0
		pop ecx
		Loop L2


		mov ecx, track
		add track, 2
		
		L3:
		push ecx
		invoke GetStdHandle, -11
		invoke WriteConsoleA, eax, offset star, lengthof star, offset counter, 0
		pop ecx
		Loop L3

		
mov ecx, ebx
push ecx
invoke GetStdHandle, -11
invoke WriteConsoleA, eax, offset enterr, lengthof enterr, offset counter, 0
pop ecx
Loop L1









mov ecx, extract
mov track, 1

L4:
mov ebx, ecx


		mov ecx, track
		inc track

		L5:
		push ecx
		invoke GetStdHandle, -11
		invoke WriteConsoleA, eax, offset space, lengthof space, offset counter, 0
		pop ecx
		Loop L5

		mov ecx, ebx
		add ecx, ecx
		sub ecx,1

		L6:
		push ecx
		invoke GetStdHandle, -11
		invoke WriteConsoleA, eax, offset star, lengthof star, offset counter, 0
		pop ecx
		Loop L6

		
mov ecx, ebx
push ecx
invoke GetStdHandle, -11
invoke WriteConsoleA, eax, offset enterr, lengthof enterr, offset counter, 0
pop ecx
Loop L4

main endp
end main