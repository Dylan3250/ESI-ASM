global main
section .text

main:
    mov rax, 3 ; defines a odd value in rax

    bt rax, 0
    jnc isEven
    mov r8, 1
    jmp end

isEven:
    mov r8, 0

end:
    mov rax, 60
    mov rdi, 0
    syscall
