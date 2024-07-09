; initialize variables a, b, c, d as integers [ double words ]

section .data
    a dd 1
    b dd 2
    c dd 3
    d dd 4

; un-initialized variable x to store result

section .bss
    x resd 1

section .text
    global _start

_start:

    mov eax, [a]    ; move a's value to eax register
    mov ebx, [b]    ; move b's value to ebx register
    imul eax, ebx   ; multiply eax by ebx [ store in eax register ]

    mov ecx, [c]    ; move c's value to ecx register
    mov edx, [d]    ; move d's value to edx register
    imul ecx, edx   ; multiply ecx by edx [ store in ecx register ]

    add eax, ecx    ; add eax by ecx [ store in eax register ]

    mov [x], eax    ; move eax to memory address of x

    mov eax, 1
    int 0x80        ; exit program
