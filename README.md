# ASM Lab

A structured environment for exploring the relationship between high-level languages and assembly.

## Repository Structure

### [into-the-metal/](./into-the-metal/)
**Pipeline A: High-Level Language ──> Assembly**
Inspect how compilers (GCC, Go, Rust) translate code into machine instructions.
- `c-cpp/`: GCC/Clang output analysis.
- `go/`: Plan9 assembly generation.
- `rust/`: LLVM to ASM emission.

### [from-the-metal/](./from-the-metal/)
**Pipeline B: Hand-Written Assembly ──> Object File ──> Executable**
Write raw assembly and link it with C harnesses.
- `01-basics/`: Entry points and system calls.
- `02-calling-conv/`: Register management and stack frames.
- `03-simd-vectors/`: Performance optimization with AVX/SSE.

### [notes/](./notes/)
**Engineering Field Logs**
- `windows_x64_abi.md`: Reference for Windows calling conventions.
- `avx_cheat_sheet.md`: SIMD instruction guide.
- `toolchain_setup.md`: Compiler and assembler flags.

## Getting Started

Use the provided `Makefile` to build targets:

```bash
# Build all basic and SIMD targets
make

# Clean up binaries
make clean
```
