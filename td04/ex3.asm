global _start

section .bss

var    RESQ    1

section .text

_start:
    mov qword [var], 42

mov rax, 60
mov rdi, 0
syscall
