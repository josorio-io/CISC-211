section .data
    count_value db 200 ; The count value
    counter dd 0 ; Initialize counter to 0

section .text
    global _start

_start:
    mov ecx, [count_value] ; Load the count value into ecx
    call count_recursive ; Call the recursive function

    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code 0
    int 0x80

count_recursive:
    inc dword [counter] ; Increment the counter
    loop end_recursion ; Decrement ecx and check if ecx == 0
    call count_recursive ; Call the function recursively
end_recursion:
    ret ; Return from the function

; (time ./r) &>> counter_rec.txt 
; time command
