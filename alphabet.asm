section .data
    alphabet db 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 0  ; Null-terminated string
    newline db 0xA                              ; Line feed character

section .bss
    char resb 1  ; Reserve space for one character

section .text
    global _start

; Define constants
SYS_WRITE equ 4
SYS_EXIT equ 1
STD_OUT equ 1

_start:
    mov esi, alphabet         ; Load the address of the alphabet string into ESI

print_loop:
    lodsb                     ; Load the next byte from [ESI] into AL and increment ESI
    cmp al, 0                 ; Compare AL with null terminator
    je end_loop               ; If null terminator, end the loop

    mov [char], al            ; Move the current character to memory
    lea ecx, [char]           ; Load the address of the character into ECX
    call print_char           ; Print the current character
    call print_newline        ; Print a newline

    jmp print_loop            ; Repeat the loop

end_loop:
    ; Exit sequence
    mov eax, SYS_EXIT         ; sys_exit system call number
    xor ebx, ebx              ; Status 0
    int 0x80                  ; Call kernel

print_char:
    ; Print the character in [char]
    mov eax, SYS_WRITE        ; sys_write system call number
    mov ebx, STD_OUT          ; File descriptor 1 (stdout)
    mov edx, 1                ; Length of the character
    int 0x80                  ; Call kernel
    ret                       ; Return to caller

print_newline:
    ; Print the newline character
    mov eax, SYS_WRITE        ; sys_write system call number
    mov ebx, STD_OUT          ; File descriptor 1 (stdout)
    mov ecx, newline          ; Address of newline character
    mov edx, 1                ; Length of the newline character
    int 0x80                  ; Call kernel
    ret                       ; Return to caller
