global main
section .text

main:
    mov al, 'd'
    mov bh, al
    btr bx, 13

mov rax, 60
mov rdi, 0
syscall
