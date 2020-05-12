global _start

section .rodata
    tab    DQ    0, 2, 86, 3, 4, 5, 6, 9, 8, 9 ; 10 entiers constants
    lgTab  DQ    ($ - tab) / 8                 ; taille maximum du tableau

section .text
_start:
    mov rax, 0                    ; indice

repeat:
    cmp rax, [lgTab]              ; limite la boucle
    jz _end
    cmp r8, [tab + rax * 8]       ; vérifie que ça n'est pas plus petit
    jc pasPlusPetit
    mov r8, [tab + rax * 8]

 pasPlusPetit:
    cmp r10, [tab + rax * 8]      ; vérifie que ça n'est pas plus grand 
    jnc endIndice
    mov r10, [tab + rax * 8]

 endIndice:
    inc rax
    jmp repeat

_end:
    mov rax, 60
    mov rdi, 0
    syscall
