# Lab Development & Reproducibility Guide

This document ensures that every experiment in this lab can be reproduced from scratch.

## 🛠️ Toolchain Requirements

To reproduce the results in this lab, you need the following tools installed and configured:

1.  **NASM**: Assembler (Windows x64)
    *   **Path:** `C:\Program Files\NASM\nasm.exe`
2.  **GCC**: Compiler & Linker (via MSYS2/UCRT64)
    *   **Path:** `C:\msys64\ucrt64\bin\gcc.exe`
3.  **Go**: For Plan9 assembly exploration.
4.  **Rust**: For LLVM/ASM emission.

## 🏗️ Build Pipelines

### 1. Hand-Written Assembly (Pipeline B)
To compile a hand-written `.asm` file and link it with a C runner:

```powershell
# 1. Assemble the .asm into a Windows x64 object file
& "C:\Program Files\NASM\nasm.exe" -f win64 path/to/file.asm -o path/to/file.obj

# 2. Compile the C runner and link the object file
gcc path/to/main.c path/to/file.obj -o path/to/output.exe

# 3. Execute
.\path\to\output.exe
```

### 2. High-Level to Assembly (Pipeline A)
To inspect how compilers translate your code:

**GCC (Intel Syntax):**
```powershell
gcc -S -O3 -mavx2 -masm=intel input.c -o output.s
```

**Go (Plan9 Syntax):**
```powershell
go tool compile -S input.go > output.s
```

**Rust:**
```powershell
rustc --emit asm -C opt-level=3 --target x86_64-pc-windows-gnu input.rs
```

## 🧪 Verification Checklists

When adding a new experiment, always:
1.  **Document the ABI**: Note which registers are being used (RCX, RDX, R8, R9 for Windows).
2.  **Verify Vectorization**: Use `grep` or `Select-String` to look for `ymm` or `v` prefixes in the generated `.s` files.
3.  **Clean Up**: Use `make clean` to remove intermediate `.obj` and `.exe` files to ensure a fresh build.

## 📂 Makefile Automation
The root `Makefile` is the single source of truth for builds. Run `make` to rebuild all verified lab targets.
