section .data
    x db 6                   

section .bss
    result resd 1            

section .text
    global _start

_start:
    mov eax, [x]             
    mov ecx, eax             ; ECX register will keep track of iterations         
    mov ebx, 1               

factorial_loop:
    cmp ecx, 1               ; Compare ECX with 1
    jle end_factorial        ; If ECX <= 1, exit the loop

    imul ebx, ecx            ; Multiply EBX by ECX (EBX = EBX * ECX)
    dec ecx                  ; Decrement ECX by 1
    jmp factorial_loop       ; Repeat the loop

end_factorial:
    mov [result], ebx        ; Store the result in the result variable

    mov eax, 1
    xor ebx, ebx
    int 0x80
