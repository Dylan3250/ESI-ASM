global main
section .text

main:
    mov al, 'd'
    mov ah, al
    and ah, 1101_1111b

mov rax, 60
mov rdi, 0
syscall
