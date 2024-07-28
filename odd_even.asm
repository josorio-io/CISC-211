section .data
    number dd 5                ; Define a number to check
    odd_msg db 'odd', 0xA      ; Message for odd number, followed by newline
    odd_len equ $ - odd_msg    ; Length of odd message
    even_msg db 'even', 0xA    ; Message for even number, followed by newline
    even_len equ $ - even_msg  ; Length of even message

section .text
    global _start

; Define constants
SYS_WRITE equ 4
SYS_EXIT equ 1
STD_OUT equ 1

_start:
    mov eax, [number]          
    call check_odd_even        ; Call the function to check odd/even

    ; Exit sequence
    mov eax, SYS_EXIT          
    xor ebx, ebx               
    int 0x80                    

check_odd_even:
    test eax, 1                ; Test if the least significant bit is set
    jz even                    ; If zero, the number is even
                               ; If odd
    mov ecx, odd_msg           ; Load address of odd message
    mov edx, odd_len           ; Load length of odd message
    jmp display_result         ; Jump to display result

even:
    mov ecx, even_msg          ; Load address of even message
    mov edx, even_len          ; Load length of even message

display_result:
    ; Display the result
    mov eax, SYS_WRITE         
    mov ebx, STD_OUT           
    int 0x80                   
    ret                        

; I found this lab pretty interesting. I think the only struggle I had was figuring out the approach to displaying whether 
; the number was odd or even, but other than that I have a grasp on the functions in Assembly language
