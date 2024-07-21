; my approach to this assignment was starting with one number
; and moving to the next while storing in the EAX register the
; largest number so far encountered until the end of the 
; psuedo-array

; if any number is larger than that in the EAX register,
; the EAX register is the updated until there are no numbers
; to compare

section .data
    num1 dd 1
    num2 dd 2
    num3 dd 3
    num4 dd 4
    num5 dd 5

section .bss
    largest resd 1

section .text
    global _start

_start:
    mov eax, [num1]
    mov ebx, [num2]
    cmp eax, ebx
    jge next1
    mov eax, ebx

next1:
    mov ebx, [num3]
    cmp eax, ebx
    jge next2
    mov eax, ebx

next2:
    mov ebx, [num4]
    cmp eax, ebx
    jge next3
    mov eax, ebx

next3:
    mov ebx, [num5]
    cmp eax, ebx
    jge finish
    mov eax, ebx

finish:
    mov [largest], eax

    mov eax, 1
    xor ebx, ebx
    int 0x80
