section .bss
    sum resd 1                ; Reserve space for 'sum' to store the 10th Fibonacci number

section .text
    global _start

_start:
    mov ecx, 9                ; Counter for the remaining 8 Fibonacci numbers
    mov eax, 0                ; EAX will hold the current Fibonacci number (0)
    mov ebx, 1                ; EBX will hold the next Fibonacci number (1)

calculate_fib:
    add eax, ebx              ; Calculate next Fibonacci number
    xchg eax, ebx             ; Swap EAX and EBX to move the new Fibonacci number to EBX
                              ; and the previous one to EAX for the next iteration

    loop calculate_fib        ; Decrement ECX and repeat if not zero

    ; At this point, EBX contains the 10th Fibonacci number
    mov [sum], ebx            ; Store the 10th Fibonacci number in 'sum'

    ; Exit sequence
    mov eax, 1                
    xor ebx, ebx              
    int 0x80                  

; I found it a little confusing as to what fibonacci number 10 was referring to
; originally I had ECX at 8, but it would result in 34, until I noticed that 0 
; was counted as the zeroth number of fibonacci, so I changed it to 9
