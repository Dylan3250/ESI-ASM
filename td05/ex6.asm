global _start

section .data
    fd            DW      0

section .rodata
    nomFichier    DB      `brol.txt`, 0

section .text

_start:
    ; ouverture du fichier
    mov rax, 2              ; open
    mov rdi, nomFichier     ; adresse du fichier
    syscall

    mov [fd], rax           ; sauvegarde le file descriptor


    ; lseek pour calculer le nombre de byte dans un fichier
    mov rax, 8              ; lseek
    mov rdi, [fd]           ; file descriptor
    mov rsi,  0             ; position de départ
    mov rdx, 2              ; jusqu'à la fin
    syscall

    mov rcx, rax            ; sauvegarde le résultat dans un registre
                            ; mais se reset avec le prochain appel system

    ; ferme le fichier
    mov rax, 3
    mov rdi, [fd]
    syscall

    mov rax, 60             ; exit

    cmp rcx, 0
    js withError
    mov rdi, 0              ; sans erreur
    jmp end

withError:
    mov rdi, 3

end:
    syscall