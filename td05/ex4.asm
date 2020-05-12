global _start

section .rodata
    msgPair       DB      `Pair !\n`
    lMsgPair      DQ      $ - msgPair
    msgImpair     DB      `Impair !\n`
    lMsgImpair    DQ      $ - msgImpair

section .text

_start:
    mov rcx, 11

    mov     rax, 1              ; write
    mov     rdi, 1              ; stdout, sortie standard
    bt rcx, 0
    jnc isEven

    ; affichage si rcx est impair
    mov     rsi, msgImpair      ; adresse du 1er caractère
    mov     rdx, [lMsgImpair]   ; nombre de caractères
    jmp end

isEven:
    ; affichage si rcx est pair
     mov     rsi, msgPair       ; adresse du 1er caractère
     mov     rdx, [lMsgPair]    ; nombre de caractères

end:
     syscall
     mov rax, 60                ; exit
     mov rdi, 0                 ; sans erreur
     syscall