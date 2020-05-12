global main
section .text

main:
    mov r14, 3 ; defines default value in r14
    mov r15, 2 ; defines other value that r14

    cmp r14, r15
    jnz notSame
    mov r14, 0
    mov r15, 0
    jmp end

notSame:
    ; switches r14 and r15 with xor
    xor r14, r15
    xor r15, r14
    xor r14, r15

    ; switches r14 ans r15 with an other register
    ;mov r13, r14
    ;mov r14, r15
    ;mov r15, r13

end:

mov rax, 60
mov rdi, 0
syscall
