section .text
    global simd_add

; void simd_add(double* res, double* a, double* b, int n)
; Windows x64 Calling Convention:
; RCX = res (Destination pointer)
; RDX = a   (Source A pointer)
; R8  = b   (Source B pointer)
; R9  = n   (Number of elements)
simd_add:
    ; 1. Check if n is zero
    test r9, r9
    jz .done

    ; 2. Calculate how many bytes to process
    ; n * 8 (since each double is 8 bytes)
    ; We'll use RAX as our byte offset (starting at 0)
    xor rax, rax

.loop:
    ; 3. Load 4 doubles from 'a' into ymm0
    vmovupd ymm0, [rdx + rax]
    
    ; 4. Load 4 doubles from 'b' into ymm1
    vmovupd ymm1, [r8 + rax]

    ; 5. Add them together: ymm2 = ymm0 + ymm1
    vaddpd ymm2, ymm0, ymm1

    ; 6. Store result into 'res'
    vmovupd [rcx + rax], ymm2

    ; 7. Advance offset by 32 bytes (4 doubles * 8 bytes)
    add rax, 32

    ; 8. Simplified loop: assume n is a multiple of 4 for this first lab
    ; We'll compare current byte offset (RAX) with total bytes needed
    ; To keep it simple, let's just decrement R9 by 4 each time
    sub r9, 4
    jnz .loop

.done:
    vzeroupper  ; Clean up AVX state
    ret
