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

    mov eax, SYS_EXIT         
    xor ebx, ebx              
    int 0x80                  

print_char:
    
    mov eax, SYS_WRITE        
    mov ebx, STD_OUT          
    mov edx, 1                
    int 0x80                  
    ret                       

print_newline:

    mov eax, SYS_WRITE        
    mov ebx, STD_OUT          
    mov ecx, newline          
    mov edx, 1                
    int 0x80                  
    ret                       

; I struggled with this lab. I was originally using ASCII values
; and running a loop while incrementing the current character in
; each iteration, but it did not seem to work and would print out
; only the letter A, so I decided to make an array, string, with
; all the characters of the alphabet instead and loop through
; before reaching the null terminator, which worked
