global main
section .text

main:
    mov rdi, 4 ; default value in rdi

    bt rdi, 0
    jnc multiple2
    mov rsi, 0
    jmp end

multiple2:
    bt rdi, 1
    jnc multiple4 ; if there aren't 1 in the second bit
    mov rsi, 1
    jmp end

multiple4:
    bt rdi, 2
    jnc multiple8 ; if there aren't 1 in the thrid bit
    mov rsi, 2
    jmp end

multiple8:
    mov rsi, 4 ; they are multiple of 8

end:

mov rax, 60
mov rdi, 0
syscall
