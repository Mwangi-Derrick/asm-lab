# 01-Basics: Assembly Fundamentals

This directory contains the building blocks of x86_64 assembly on Windows.

## The Progression

1.  **`exit.asm`**: The absolute minimum.
    *   **Goal**: Understand the entry point (`main`), register cleanup, and calling your first Windows API (`ExitProcess`).
    *   **Key Concept**: Shadow Space (32 bytes required before any function call).

2.  **`hello.asm`**: Direct System Interaction.
    *   **Goal**: Print text without using a C library.
    *   **Key Concept**: Using `GetStdHandle` and `WriteFile`. Passing 5 arguments (the 5th goes on the stack).

3.  **`math.asm`**: Registers and Arithmetic.
    *   **Goal**: Manipulate data inside CPU registers.
    *   **Key Concept**: `mov`, `add`, `sub`, `imul`. Linking with the C standard library (`printf`).

## How to Build

Use the `Makefile` in the root directory:

```bash
make basics
```

Or manually:
```bash
nasm -f win64 exit.asm -o exit.obj
gcc exit.obj -o exit.exe
```
