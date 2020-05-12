global _start

section .rodata

palin    DB    1111_1001b

section .text

_start:
    mov al, [palin]
    and al, 0000_1111b

    cmp al, 0000_0000b
    jz palindrome

    cmp al, 0000_1111b
    jz palindrome

    cmp al, 0000_1001b
    jz palindrome

    cmp al, 0000_0110b
    jz palindrome

    mov al, 0
    jmp end

palindrome:
    mov al, 1

end:

mov rax, 60
mov rdi, 0
syscall
