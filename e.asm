section .data
    count_value db 200 ; The count value
    counter dd 0 ; Initialize counter to 0

section .text
    global _start

_start:
    mov ecx, [count_value] ; Load the count value into ecx

count_loop:
    inc dword [counter] ; Increment the counter
    loop count_loop ; Decrement ecx and repeat if ecx != 0

    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code 0
    int 0x80

; (time ./e) &>> counter_fun.txt 
; time commands
