global _start

section .rodata

var1    DB    3
var2    DB    1

section .bss

var3    RESB    1

section .text

_start:
    mov al, [var1]
    mov bl, [var2]

    cmp al, bl
    js secondIsBigger
    mov byte [var3], bl
    jmp end

secondIsBigger:
    mov byte [var3], al

end:

mov rax, 60
mov rdx, 0
syscall
