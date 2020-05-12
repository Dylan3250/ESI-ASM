global _start

section .bss
    character    RESQ    1

section .text
_start:
    mov rsi, 2
    or rsi, 0011_0000b
    mov qword [character], rsi

    ; affichage à l'écran
    mov     rax, 1          ; write
    mov     rdi, 1          ; stdout, sortie standard
    mov     rsi, character  ; adresse du 1er caractère
    mov     rdx, 8          ; nombre de caractères
    syscall

    mov rax, 60             ; exit
    mov rdi, 0              ; sans erreur
    syscall