global _start

section .rodata
    tab    DW    0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ; 10 entiers constants
    lgTab  DQ    ($ - tab) / 2                ; taille maximum du tableau

section .text
_start:
    mov r15, 0                     ; compteur de pair
    mov rax, 0                     ; compteur de tour

repeat:
    cmp rax, [lgTab]
    jz _end
    bt dword [tab + rax * 2], 0
    jnc increment
    inc r15

 increment:
    inc rax
    jmp repeat

_end:
    mov rax, 60
    mov rdi, 0
    syscall
