; move 0 to ECX register to begin count
; move 2 to ECX register per iteration
; compare ECX with 20 per iteration
; if ECX equals 20, loop again
; else exit program

; biggest issue I had was with ending the loop
; I allowed the loop to run one more time to end the loop
; so the final value of ECX is 22, with the intent to exit out of the loop


section .text
        global _start

_start:
        mov ecx, 0       ; Start counter at 0

generate_sequence:

        add ecx, 2       ; Even sequence
        cmp ecx, 20
        jle generate_sequence ; Loop until 20 is reached

        mov eax, 1       
        xor ebx, ebx     
        int 0x80         
