global _start

section .data

nb    DW    1

section .text

_start:
    mov rax, nb
    mov rbx, [nb]

mov rax, 60
mov rdi, 0
syscall
