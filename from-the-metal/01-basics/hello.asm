; hello.asm - Prints "Hello, Assembly!" to the console using Windows APIs
section .data
    message db 'Hello, Assembly!', 0xA, 0  ; 0xA is newline, 0 is null terminator
    msg_len equ $ - message                ; Calculate length of message

section .text
    global main
    extern GetStdHandle
    extern WriteFile
    extern ExitProcess

main:
    ; --- Setup Stack Frame ---
    push rbp
    mov rbp, rsp
    sub rsp, 48          ; Shadow space (32) + extra for local variables/alignment

    ; --- Get Handle to Stdout ---
    ; HANDLE GetStdHandle(DWORD nStdHandle);
    ; STD_OUTPUT_HANDLE = -11 (0xFFFFFFF5)
    mov ecx, -11
    call GetStdHandle
    mov r12, rax         ; Save handle in R12 (non-volatile register)

    ; --- Write to Console ---
    ; BOOL WriteFile(HANDLE hFile, LPCVOID lpBuffer, DWORD nNumberOfBytesToWrite,
    ;                LPDWORD lpNumberOfBytesWritten, LPOVERLAPPED lpOverlapped);
    mov rcx, r12         ; 1st: hFile
    lea rdx, [rel message] ; 2nd: lpBuffer (use RIP-relative addressing)
    mov r8d, msg_len     ; 3rd: nNumberOfBytesToWrite
    lea r9, [rbp - 8]    ; 4th: lpNumberOfBytesWritten (points to stack space)
    mov qword [rsp + 32], 0 ; 5th: lpOverlapped (must be on stack after shadow space)
    call WriteFile

    ; --- Exit Program ---
    xor ecx, ecx         ; Exit code 0
    call ExitProcess

    ; --- Cleanup (Unreachable but good practice) ---
    add rsp, 48
    pop rbp
    ret
