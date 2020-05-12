global _start

section .data
    tab    times    10    DW    0 ; 10 bytes à 0

section .text
_start:
    mov word [tab + 2 * 2], 3     ; change le 3eme élément en 3
    mov word [tab + 7 * 2], 8     ; change le 8eme élement en 8

    mov rax, 60
    mov rdi, 0
    syscall