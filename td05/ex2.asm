global _start

section .data
      fd        DQ      0

section .rodata
    msg       DB      `Echec lors de l'ouverture du fichier !\n`
    lgrMsg    DQ      $ - msg
    msgSuc    DB      `Fichier correctement ouvert !\n`
    lMsgSuc   DQ      $ - msgSuc
    file      DB      `lectureSeule.txt`, 0

section .text

_start:
    ; ouverture du fichier en lecture seule
    mov rax, 2
    mov rdi, file
    mov rsi, 0q ; RONLY
    syscall

    cmp rax, 0
    jns isOpen

    ; affichage s'il y a une erreur
    mov     rax, 1          ; write
    mov     rdi, 1          ; stdout, sortie standard
    mov     rsi, msg        ; adresse du 1er caractère
    mov     rdx, [lgrMsg]   ; nombre de caractères
    syscall

    mov rax, 60             ; exit
    mov rdi, 1              ; avec une erreur
    syscall

isOpen:
    ; affichage s'il n'y a pas d'erreur
    mov     rax, 1         ; write
    mov     rdi, 1         ; stdout, sortie standard
    mov     rsi, msgSuc    ; adresse du 1er caractère
    mov     rdx, [lMsgSuc] ; nombre de caractères
    syscall

    ; ferme le fichier
    mov rax, 3
    mov rdi, [fd]
    syscall


    mov rax, 60            ; exit
    mov rdi, 0             ; sans erreur
    syscall