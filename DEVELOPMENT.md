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

The easiest way to build and generate assembly for all languages is using the root `Makefile`:

```bash
# Build all targets (basics, SIMD, and Go/Rust/C ASM emission)
make
```

### 1. Hand-Written Assembly (Pipeline B)
To manually compile a `.asm` file and link it with a C runner:

```powershell
# 1. Assemble the .asm into a Windows x64 object file
& "C:\Program Files\NASM\nasm.exe" -f win64 path/to/file.asm -o path/to/file.obj

# 2. Compile the C runner and link the object file
gcc path/to/main.c path/to/file.obj -o path/to/output.exe
```

### 2. High-Level to Assembly (Pipeline A)
You can use individual `make` targets to generate assembly files for specific experiments:

```bash
make go-asm    # Generates into-the-metal/go/stack.s
make rust-asm  # Generates into-the-metal/rust/bounds.s
make c-asm     # Generates into-the-metal/c-cpp/square.s
```

Or manually:

**GCC (Intel Syntax):**
```powershell
gcc -S -O3 -mavx2 -masm=intel input.c -o output.s
```

**Go (Plan9 Syntax):**
```powershell
go build -gcflags="-S" input.go 2> output.s
```

**Rust:**
```powershell
rustc --emit asm -C opt-level=3 input.rs -o output.s
```

## 🧪 Verification Checklists

When adding a new experiment, always:
1.  **Document the ABI**: Note which registers are being used (RCX, RDX, R8, R9 for Windows).
2.  **Verify Vectorization**: Use `grep` or `Select-String` to look for `ymm` or `v` prefixes in the generated `.s` files.
3.  **Clean Up**: Use `make clean` to remove intermediate `.obj` and `.exe` files to ensure a fresh build.

## 📂 Makefile Automation
The root `Makefile` is the single source of truth for builds. Run `make` to rebuild all verified lab targets.
