global _start

section .data
    tab    times    100    DQ    0       ; 100 * 8 bytes à 0
    lgTab   DQ      ($ - tab) / 8        ; taille maximum du tableau

section .text
_start:
    mov rax, 0                     ; compteur

 repeat:
    cmp rax, [lgTab]
    jz _end
    ; lea rcx, [rax*2]             ; multiplie l'élément par 2

    ; calculs pour faire x2 sans utiliser les fonctions pour multiplier
    mov rdx, 0
    mov rcx, rax

  computeDouble:
      cmp rdx, rax
      jz doubleOk
      cmp rcx, 1      ; exeption pour 1 vu que 1*1 = 1 et pas 1+1 = 2
      jz doubleOk
      inc rcx
      inc rdx
      jmp computeDouble

  doubleOk:
     mov qword [tab + rax * 8], rcx ; change le ieme élément en 2 * i
     inc rax
     jmp repeat

_end:
    mov rax, 60
    mov rdi, 0
    syscall
