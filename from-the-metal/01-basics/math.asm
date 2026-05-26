; math.asm - Demonstrates basic arithmetic and register usage

; RAX - Primary accumulator (holds results)
; RBX - General purpose (holding 2 for multiplication)
; RCX - First argument to functions (format string)
; RDX - Second argument to functions (value to print)
; RBP - Base pointer (stack frame)
; RSP - Stack pointer
section .data ; Data section for storing constants and strings
    fmt db 'Result: %lld', 0xA, 0

section .text ; Code section for executable instructions
    global main
    extern printf
    extern ExitProcess

main: ; Entry point of the program
    push rbp
    mov rbp, rsp
    sub rsp, 32          ; Shadow space

    ; --- Addition ---
    mov rax, 100         ; Load 100 into RAX(primary accumulator) mov moves value into register
    add rax, 50          ; RAX = 100 + 50 = 150 the value in the register is updated with the add which computes an add operation and stores the result back in RAX

    ; --- Subtraction ---
    sub rax, 25          ; RAX = 150 - 25 = 125 sub computes a subtraction operation and stores the result back in RAX

    ; --- Multiplication ---
    mov rbx, 2         ; Load 2 into RBX(general purpose register)
    imul rax, rbx        ; RAX = 125 * 2 = 250 imul performs a signed multiplication of RAX and RBX, storing the result back in RAX

    ; --- Print Result using C library ---
    mov rcx, fmt         ; 1st arg: format string rcx is used to pass the format string to printf cause the assembly will link with gcc compiler which follows the calling convention where the first argument is passed in RCX
    mov rdx, rax         ; 2nd arg: the result rdx is 2nd argument register used to pass the value of RAX which holds the final result of our calculations to printf
    call printf       ; Call printf to print the result of our calculations. The format string in RCX tells printf how to format the output, and the value in RDX is what will be printed according to that format.

    ; --- Exit ---
    xor ecx, ecx ;xor is used to set ECX to 0, which is the exit code for the process. This is a common way to indicate successful termination of a program. ecx and edx are the registers used to pass arguments to the ExitProcess function, with ecx being the first argument (exit code) and edx being the second argument (not used here, so it remains 0).
    call ExitProcess

    add rsp, 32         ; Clean up shadow space rsp is a stack pointer register, and we need to restore it to its original position before returning from the main function. This is done by adding back the 32 bytes of shadow space that we allocated at the beginning of the function.
    pop rbp ;pop stands for "pop base pointer". It restores the previous value of RBP that was saved at the beginning of the function. This is important for maintaining the integrity of the stack frame and ensuring that the calling function's stack frame is correctly restored when we return from main.
    ret ;ret stands for "return". It tells the CPU to return from the current function, which in this case is main. After executing ret, the CPU will jump back to the caller of main (which is typically the operating system's entry point) and continue execution from there.
