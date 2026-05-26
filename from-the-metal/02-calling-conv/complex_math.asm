; complex_math.asm - Deep dive into Windows x64 Calling Convention
section .text
    global complex_math

; Function Signature (C):
; int64_t complex_math(int64_t a, int64_t b, int64_t c, int64_t d, int64_t e, int64_t f);
;
; Windows x64 ABI Mapping:
; RCX = a
; RDX = b
; R8  = c
; R9  = d
; [RSP + 48] = e (passed on stack)
; [RSP + 56] = f (passed on stack)

complex_math:
    ; --- Prologue ---
    push rbp            ; Save the caller's Base Pointer
    mov rbp, rsp        ; Set our Base Pointer to the current Stack Pointer
    
    ; --- Register Preservation ---
    ; We must preserve non-volatile registers if we use them (RBX, RSI, RDI, R12-R15)
    push rbx
    push rsi

    ; --- Core Logic ---
    ; Calculate: (a + b + c + d + e + f)
    mov rax, rcx        ; RAX = a
    add rax, rdx        ; RAX += b
    add rax, r8         ; RAX += c
    add rax, r9         ; RAX += d
    
    ; Accessing arguments from the stack:
    ; [rbp]     = saved rbp
    ; [rbp+8]   = return address
    ; [rbp+16]  = shadow rcx
    ; [rbp+24]  = shadow rdx
    ; [rbp+32]  = shadow r8
    ; [rbp+40]  = shadow r9
    ; [rbp+48]  = argument e
    ; [rbp+56]  = argument f
    
    add rax, [rbp + 48] ; RAX += e
    add rax, [rbp + 56] ; RAX += f

    ; Multiply by a constant stored in a preserved register
    mov rbx, 10
    imul rax, rbx       ; RAX *= 10

    ; --- Epilogue ---
    pop rsi             ; Restore non-volatile registers in reverse order
    pop rbx
    pop rbp             ; Restore caller's Base Pointer
    ret
