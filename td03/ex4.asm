global main
section .text

main:
    mov rax, 2 ; defines the default value in rax
    mov rbx, 5 ; defines the other value in rbx

    cmp rax, rbx
    js secondIsBigger ; if rbx is bigger than rax
    mov r8, rax
    mov r9, rbx
    jmp end

secondIsBigger:
    mov r8, rbx
    mov r9, rax

end:

mov rax, 60
mov rsi, 0
syscall
