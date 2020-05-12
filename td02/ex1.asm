; 1_comprehension_log.asm

global main
section .text

main:
    mov al, 10011101b
    not al              ; al = 0110_0010b, zf = 0, sf = 0

    mov al, 11100101b
    mov ah, 00101010b
    and al, ah          ; al = 0010_0000b, zf = 0, sf = 0

    mov al, 11100101b
    mov ah, 00001010b
    and al, ah          ; al = 0000_0000b, zf = 1, sf = 0

    mov al, 01100101b
    mov ah, 01010101b
    or  al, ah          ; al = 0111_0101b, zf = 0, sf = 0

    mov al, 11100101b
    mov ah, 01010101b
    or  al, ah          ; al = 1111_0101b, zf = 0, sf = 1

    mov dx, 1100010011100101b
    mov si, 0011000001100010b
    xor dx, si          ; dx = 1111_0100_1000_0111b
                        ; zf = 0, sf = 1

    mov al, 11100101b
    mov ah, 11100101b
    xor al, ah          ; al = 0000_0000b, zf = 1, sf = 0

; fin
mov rax, 60
mov rdi, 0
syscall
