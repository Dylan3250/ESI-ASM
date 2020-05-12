global _start

section .data

var1    DB    2
var2    DB    4

section .text

_start:
    mov al, [var1]
    mov bl, [var2]

    mov byte [var1], bl
    mov byte [var2], al

mov rax, 60
mov rdi, 0
syscall
