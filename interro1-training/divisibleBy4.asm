global _start

section .text

_start:
    mov rax, 37
    mov rbx, 20

    mov rcx, rax
    and rcx, 111b
    cmp rcx, 100b

    jnz noDiv4
    xor rax, rbx
    xor rbx, rax
    xor rax, rbx
    jmp end

noDiv4:
    mov rax, 0
    mov rbx, 0

end:

mov rax, 60
mov rdi, 0
syscall
