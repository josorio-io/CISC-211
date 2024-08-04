SECTION .data
    filename db 'quotes.txt', 0h
    initial_contents db 'To be, or not to be, that is the question.', 10, 10, 'A fool thinks himself to be wise, but a wise man knows himself to be a fool.', 10, 10, 0h
    initial_len equ $ - initial_contents
    additional_contents db 'Better three hours too soon than a minute too late.', 10, 10, 'No legacy is so rich as honesty.', 10, 0h
    additional_len equ $ - additional_contents

SECTION .bss
    fd_out resb 1

SECTION .text
    global  _start

_start:
    mov ecx, 0711o
    mov ebx, filename
    mov eax, 8
    int 0x80

    mov eax, 5
    mov ebx, filename
    mov ecx, 1
    mov edx, 0777o
    int 0x80
    mov [fd_out], eax

    mov eax, 4
    mov ebx, [fd_out]
    mov ecx, initial_contents
    mov edx, initial_len
    int 0x80

    mov eax, 6
    mov ebx, [fd_out]
    int 0x80

    mov eax, 5
    mov ebx, filename
    mov ecx, 1025
    mov edx, 0777o
    int 0x80
    mov [fd_out], eax

    mov eax, 4
    mov ebx, [fd_out]
    mov ecx, additional_contents
    mov edx, additional_len
    int 0x80

    mov eax, 6
    mov ebx, [fd_out]
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80

    ; I thought this assignment was pretty interesting. Conceptually I'm familiar with File IO but 
    ; it was a curious feeling doing it in Assembly. It was not difficult other than finding which
    ; file system calls to use, and how file permissions have an effect on how a file may be used
