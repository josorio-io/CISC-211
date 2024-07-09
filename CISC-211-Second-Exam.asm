section .data
    a dd 1
    b dd 2
    c dd 3
    d dd 4

section .bss
    x resd 1

section .text
    global _start

_start:

    mov eax, [a]
    mov ebx, [b]
    imul eax, ebx

    mov ecx, [c]
    mov edx, [d]
    imul ecx, edx

    add eax, ecx

    mov [x], eax

    mov eax, 1
    int 0x80