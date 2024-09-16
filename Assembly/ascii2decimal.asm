;ascii to decimal converter
;written miserably for x64 nasm by max barkouras

BITS 64

section .text
global _start

extern MessageBoxA
extern ExitProcess
extern GetCommandLineA

_start:

    sub rsp, 0x28
    and rsp, 0FFFFFFFFFFFFFFF0h 

    call GetCommandLineA
    mov bl, byte [rax + 19]
    xor rax, rax
    mov al, bl

    mov rcx, 10
    mov rbx, decimalBuffer + 10
    mov byte [rbx], 0

    ascii_to_decimal:
    xor rdx, rdx
    div rcx
    add dl, '0'
    dec rbx
    mov [rbx], dl
    test rax, rax
    jne ascii_to_decimal

    xor rcx, rcx
    mov rdx, rbx
    mov r8, boxTitle
    mov r9, 0
    call MessageBoxA

    xor rcx, rcx
    mov rcx, 1
    call ExitProcess

section .data
    boxTitle: db "ASCII to Decimal :)", 00h
    decimalBuffer: db 16 dup(0)
    

    