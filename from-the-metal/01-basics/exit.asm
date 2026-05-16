; exit.asm - A minimal Windows assembly program that just exits with code 42
section .text
global main
extern ExitProcess

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32          ; Reserve shadow space for the Windows API call

    mov ecx, 42          ; 1st argument for ExitProcess (Exit Code = 42)
    call ExitProcess     ; Call the Windows API function

    ; The program will exit here, so the lines below are just standard hygiene
    add rsp, 32          ; Clean up shadow space
    pop rbp
    ret