global _start

section .data
    fd        DQ      0

section .rodata
    msgPair       DB      `Pair !\n`
    lMsgPair      DQ      $ - msgPair
    msgImpair     DB      `Impair !\n`
    lMsgImpair    DQ      $ - msgImpair
    nomFichier    DB      `numberFile-pair`, 0
;    nomFichier    DB      `numberFile-impair`, 0

section .bss
    file_buffer    RESB     2048

section .text

_start:
    ; ouverture du fichier en lecture seule
    mov rax, 2                 ; read
    mov rsi, 0q                ; WRONLY
    mov rdi, nomFichier        ; adresse du 1er caractère du nom
    syscall

    mov [fd], rax              ; sauvegarde le file descriptor du fichier

    ; sauvegarde le contenu du fichier
    mov rax, 0
    mov rdi, [fd]
    mov rsi, file_buffer
    mov rdx, 2048
    syscall

    ; ferme le fichier
    mov rax, 3
    mov rdi, [fd]
    syscall

    bt qword [file_buffer], 0
    mov rax, 1                 ; write
    mov rdi, 1                 ; stdout, sortie standard
    jnc isEven

    ; affichage si result est impair
    mov rsi, msgImpair         ; adresse du 1er caractère
    mov rdx, [lMsgImpair]      ; nombre de caractères
    syscall
    jmp end

isEven:
    ; affichage si rcx est pair
     mov rsi, msgPair            ; adresse du 1er caractère
     mov rdx, [lMsgPair]         ; nombre de caractères
     syscall

end:
     mov rax, 60                 ; exit
     mov rdi, 0                  ; sans erreur
     syscall