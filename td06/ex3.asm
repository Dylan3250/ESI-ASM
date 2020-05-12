global _start

section .data
    tab     times    100    DQ    0      ; 100 * 8 bytes à 0
    lgTab   DQ       (($ - tab) / 8) - 1 ; taille maximum du tableau

section .text
_start:
    mov rax, 0                       ; compteur
    mov rcx, [lgTab]                 ; maximum

 repeter:
    cmp rax, [lgTab]
    jz _end
    mov qword [tab + rax * 8], rcx  ; change le i-eme élément en 99-i
    inc rax
    dec rcx
    jmp repeter

_end:
    mov rax, 60
    mov rdi, 0
    syscall