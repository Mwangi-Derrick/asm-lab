# 02-Calling Convention & Stack Frames

This module explores the Windows x64 ABI, focusing on how data moves between functions.

## Key Concepts

### 1. Register Assignment
Windows uses a specific set of registers for the first four integer/pointer arguments:
1.  **RCX**: Argument 1
2.  **RDX**: Argument 2
3.  **R8**: Argument 3
4.  **R9**: Argument 4

### 2. The Stack for 5+ Arguments
Arguments beyond the fourth are pushed onto the stack. However, the caller must still reserve 32 bytes of "Shadow Space" (also called Home Space) even if there are fewer than 4 arguments.

### 3. Volatile vs. Non-Volatile
- **Volatile (Caller-saved)**: `RAX`, `RCX`, `RDX`, `R8`, `R9`, `R10`, `R11`. You can use these freely, but their value isn't guaranteed after a `call`.
- **Non-Volatile (Callee-saved)**: `RBX`, `RBP`, `RDI`, `RSI`, `RSP`, `R12-R15`. If your function uses these, you **must** save their original values (usually via `push`) and restore them (`pop`) before returning.

### 4. Stack Alignment
The stack must be **16-byte aligned** before any `call` instruction. This is a common source of crashes in assembly.

## Experiment: `complex_math.asm`
This function takes **6 arguments**. It sums them up and multiplies by 10.
- It demonstrates reading arguments 5 and 6 from the stack.
- It demonstrates saving and restoring `RBX` and `RSI`.
- It uses a standard Prologue (`push rbp`, `mov rbp, rsp`) and Epilogue.

## Build and Run
```bash
make conv
```
