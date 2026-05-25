; math.asm - Demonstrates basic arithmetic and register usage
section .data
    fmt db 'Result: %lld', 0xA, 0

section .text
    global main
    extern printf
    extern ExitProcess

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32          ; Shadow space

    ; --- Addition ---
    mov rax, 100         ; Load 100 into RAX
    add rax, 50          ; RAX = 100 + 50 = 150

    ; --- Subtraction ---
    sub rax, 25          ; RAX = 150 - 25 = 125

    ; --- Multiplication ---
    mov rbx, 2
    imul rax, rbx        ; RAX = 125 * 2 = 250

    ; --- Print Result using C library ---
    mov rcx, fmt         ; 1st arg: format string
    mov rdx, rax         ; 2nd arg: the result
    call printf

    ; --- Exit ---
    xor ecx, ecx
    call ExitProcess

    add rsp, 32
    pop rbp
    ret
