; I changed the code from the example to work with an ebx register
; the ECX register was implicitly decrementing
; the EBX register version explicitly increments here

; the ECX register used loop to check if the iteration should continue
; the EBX register version uses jnz to continue jumping until reaching zero

; I did not struggle much here and found it useful to use the example

section .text
        global _start

_start:
        mov ebx, 10     ; Initialize EBX as the counter

loop_start:
        dec ebx         ; Decrement EBX
        jnz loop_start  ; Jump if EBX is not zero

        mov eax, 1   
        xor ebx, ebx 
        int 0x80     
