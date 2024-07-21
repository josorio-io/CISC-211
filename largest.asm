section .data
    array dd 10, 20, 5, 15    ; Define an array with 4 integers

section .bss
    largest resd 1            ; Reserve space for the largest number

section .text
    global _start

_start:
    mov eax, 4                ; Array length
    mov ecx, array            ; Move array's address to ECX
    mov ebx, [ecx]            ; Initialize EBX with the first element of the array

find_largest:
    cmp eax, 0                ; Check if we've gone through all elements
    je end_find               ; If yes, jump to end

    add ecx, 4                ; Move to the next element in the array
    dec eax                   ; Decrement the counter

    mov edx, [ecx]            ; Load the current element
    cmp edx, ebx              ; Compare current element with the largest found
    jle find_largest          ; If current element <= largest, continue loop
    mov ebx, edx              ; Update largest with the current element
    jmp find_largest          ; Continue loop

end_find:
    mov [largest], ebx        ; Store the largest element in 'largest'

    
    mov eax, 1                
    xor ebx, ebx              
    int 0x80                  

; I think the most difficult part was figuring out how to loop through the array
; I approached this by adding a counter the size of the array
; I moved through the array adding the memory to itself
