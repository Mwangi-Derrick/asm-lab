# Toolchain Setup

## NASM (Assembler)
```bash
# Windows x64 object file
nasm -f win64 <file>.asm -o <file>.obj
```

## GCC (Linker/Compiler)
```bash
# Linking object files
gcc <file>.obj -o <file>.exe

# Emitting assembly from C
gcc -S -O3 -masm=intel <file>.c -o <file>.s
```

## Go
```bash
# Emitting Plan9 assembly
go tool compile -S <file>.go > <file>.s
```

## Rust
```bash
# Emitting assembly
RUSTFLAGS="--emit asm" cargo build --release
# Or for a single file:
rustc --emit asm -O <file>.rs
```
