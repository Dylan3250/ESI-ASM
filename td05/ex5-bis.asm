global _start

section .data
    fd            DW      0

section .rodata
    msgPair       DB      `Pair !\n`
    lMsgPair      DQ      $ - msgPair
    msgImpair     DB      `Impair !\n`
    lMsgImpair    DQ      $ - msgImpair
    nomFichier    DB      `statusFile`, 0

section .text

_start:
    mov rcx, 11

    ; ouverture du fichier en écriture seule avec placement
    ; de la tête d'écriture en fin de fichier
    mov     rax, 2               ; open
    mov     rdi, nomFichier      ; /adresse/ du 1er caractère du nom
    mov rsi,  1q | 100q  | 2000q ; WRONLY + 0_CREAT + 0_APPEND
    mov rdx, 755q                ; droits du fichier créé
    syscall

    mov [fd], rax                ; sauvegarde le file descripter

    ; écrit dans le fichier ouvert
    mov rax, 1                   ; write
    mov rdi, [fd]                ; stdout, sortie standard

    bt rcx, 0
    jnc isEven

    ; affichage si rcx est impair
    mov     rsi, msgImpair       ; adresse du 1er caractère
    mov     rdx, [lMsgImpair]    ; nombre de caractères
    syscall
    jmp close

isEven:
    ; affichage si rcx est pair
    mov     rsi, msgPair        ; adresse du 1er caractère
    mov     rdx, [lMsgPair]     ; nombre de caractères
    syscall

close:
    ; ferme le fichier
    mov rax, 3
    mov rdi, [fd]
    syscall

    mov rax, 60            ; exit
    mov rdi, 0             ; sans erreur
    syscall