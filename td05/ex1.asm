; 01_open_exercice.asm

; Ex1.1 :
; 1. : avec droits en écriture, rax : 11b
; 2. : sans droits en écriture, rax : 11...11b
; 3. : le fichier n'existe pas, rax : 11...11b

global    main

section .rodata
    nomFichier      DB      `brol.txt`, 0   ; ne pas oublier le 0

section .text

main:
    ; ouverture de brol en écriture seule avec placement
    ; de la tête d'écriture en fin de fichier
    mov     rax, 2          ; open
    mov     rdi, nomFichier ; /adresse/ du 1er caractère du nom

    ; Ex1.2
    ; 1. : avec droits en écriture, rax : 11b
    ; 2. : sans droits en écriture, rax : 11...11b
    ; 3. : le fichier n'existe pas, rax : 11b car le crée en chmod 755
    ;  mov     rsi, 1q | 2000q ; WRONLY + O_APPEND
    mov rsi, 1q | 100q  | 2000q ; WRONLY + 0_CREAT + 0_APPEND
    mov rdx, 755q ; droits du fichier créé
    syscall

    mov     rax, 60
    mov     rdi,0
    syscall