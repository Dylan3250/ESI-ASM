global _start

section .data
    tab    times    100    DQ    0       ; 100 * 8 bytes à 0
    lgTab   DQ      ($ - tab) / 8        ; taille maximum du tableau

section .text
_start:
    mov rax, 0                     ; compteur

 repeter:
    cmp rax, [lgTab]
    jz _end
    mov qword [tab + rax * 8], rax ; change le ieme élément en i
    inc rax
    jmp repeter

_end:
    mov rax, 60
    mov rdi, 0
    syscall
