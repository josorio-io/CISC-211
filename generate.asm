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
