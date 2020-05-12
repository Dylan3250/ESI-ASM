global _start

section .data

b0   DB   0
b1   DB   0
b2   DB   0
b3   DB   0

section .rodata
nb   DD 0x12345678

section .text

_start:
    mov al, [nb]
    mov byte [b0], al

    mov al, [nb+1]
    mov byte [b1], al

    mov al, [nb+2]
    mov byte [b2], al

    mov al, [nb+3]
    mov byte [b3], al

mov rax, 60
mov rdi, 0
syscall
