# Makefile for Windows x64 Assembly Lab

# Compilers and Assemblers
ASM="C:/Program Files/NASM/nasm.exe"
CC=gcc
ASM_FLAGS=-f win64
CC_FLAGS=-O3

# Build Targets
all: basics simd

basics: from-the-metal/01-basics/exit.asm
	$(ASM) $(ASM_FLAGS) from-the-metal/01-basics/exit.asm -o from-the-metal/01-basics/exit.obj
	$(CC) from-the-metal/01-basics/exit.obj -o from-the-metal/01-basics/exit.exe

simd: from-the-metal/03-simd-vectors/simd_add.asm from-the-metal/03-simd-vectors/main.c
	$(ASM) $(ASM_FLAGS) from-the-metal/03-simd-vectors/simd_add.asm -o from-the-metal/03-simd-vectors/simd_add.obj
	$(CC) $(CC_FLAGS) from-the-metal/03-simd-vectors/main.c from-the-metal/03-simd-vectors/simd_add.obj -o from-the-metal/03-simd-vectors/simd_add.exe

clean:
	del /s *.obj *.exe