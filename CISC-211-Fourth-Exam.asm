section .data
    x dd 5
    y dd 10
    z dd 15

section .bss
    result resd 1

section .text
    global _start
    global add_three_numbers

_start:
    call add_three_numbers

    mov eax, 1
    int 0x80

add_three_numbers:
    mov eax, [x]
    add eax, [y]
    add eax, [z]
    mov [result], eax

    mov eax, [result]

    ret
