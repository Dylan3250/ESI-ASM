global main
section .text

main:
    mov bl, 3
    mov bh, bl
    or bh, 0011_0000b

mov rax, 60
mov rdi, 0
syscall
