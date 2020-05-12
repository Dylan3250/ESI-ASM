global _start

section .data

    var1 DB 1
    var2 DB 2
    var3 DW 0x03_04
    var4 DQ 0x00_00_00_00_80_00_FF_FF
    ; la section des données occupe 12 bytes
    ; son contenu est : var1 var2 var3      var4
    ; ................. | 01 | 02 | 04 | 03 | FF | FF | 00 | 80 | 00 | 00 | 00 | 00 | ...


section .text

_start:
    mov rax, var1 ; rax contient l'adresse de rax
    mov al, [var1] ; al contient 0x01
    mov ax, [var1] ; ax contient 0x02_01 (registre plus grand, donc récupère les données suivantes)
    mov al, [var3] ; al contient 0x04
    mov ax, [var3] ; ax contient 0x03_04
    mov rax, -1 ; rax contient 0xFF_FF_FF_FF_FF_FF_FF_FF
    mov eax, [var4] ; rax contient 0x00_00_00_00_80_00_FF_FF

mov rax, 60
mov rdi, 0
syscall
