global main
section .text

main:
    mov rax, 2 ; defines a value in rax (is not null)

    cmp rax, 0
    jz isNull
    mov rax, 1

isNull:

mov rax, 60
mov rdi, 0
syscall
