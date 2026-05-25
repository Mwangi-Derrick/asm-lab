# Makefile for Windows x64 Assembly Lab

# Compilers and Assemblers
ASM="C:/Program Files/NASM/nasm.exe"
CC=gcc
ASM_FLAGS=-f win64
CC_FLAGS=-O3

# Build Targets
all: basics simd into-metal-asm

basics: from-the-metal/01-basics/exit.asm from-the-metal/01-basics/hello.asm from-the-metal/01-basics/math.asm
	$(ASM) $(ASM_FLAGS) from-the-metal/01-basics/exit.asm -o from-the-metal/01-basics/exit.obj
	$(CC) from-the-metal/01-basics/exit.obj -o from-the-metal/01-basics/exit.exe
	$(ASM) $(ASM_FLAGS) from-the-metal/01-basics/hello.asm -o from-the-metal/01-basics/hello.obj
	$(CC) from-the-metal/01-basics/hello.obj -o from-the-metal/01-basics/hello.exe
	$(ASM) $(ASM_FLAGS) from-the-metal/01-basics/math.asm -o from-the-metal/01-basics/math.obj
	$(CC) from-the-metal/01-basics/math.obj -o from-the-metal/01-basics/math.exe

simd: from-the-metal/03-simd-vectors/simd_add.asm from-the-metal/03-simd-vectors/main.c
	$(ASM) $(ASM_FLAGS) from-the-metal/03-simd-vectors/simd_add.asm -o from-the-metal/03-simd-vectors/simd_add.obj
	$(CC) $(CC_FLAGS) from-the-metal/03-simd-vectors/main.c from-the-metal/03-simd-vectors/simd_add.obj -o from-the-metal/03-simd-vectors/simd_add.exe

# Pipeline A: Emitting Assembly from High-Level Languages
into-metal-asm: go-asm rust-asm c-asm

go-asm: into-the-metal/go/stack.go
	go build -gcflags="-S" into-the-metal/go/stack.go 2> into-the-metal/go/stack.s

rust-asm: into-the-metal/rust/bounds.rs
	rustc --emit asm -C opt-level=3 into-the-metal/rust/bounds.rs -o into-the-metal/rust/bounds.s

c-asm: into-the-metal/c-cpp/square.c
	$(CC) -S -O3 -mavx2 -masm=intel into-the-metal/c-cpp/square.c -o into-the-metal/c-cpp/square.s

clean:
	del /s *.obj *.exe *.s