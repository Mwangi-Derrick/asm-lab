# Deep Dive: The Vectorization Gap (Go vs. Rust vs. C)

This case study analyzes how different compilers translate a simple array addition loop into machine code.

## The Logic
```c
// Functional equivalent in all languages:
for (int i = 0; i < n; i++) {
    res[i] = a[i] + b[i];
}
```

## 1. GCC & Rust (The LLVM/Aggressive Approach)
Both GCC and Rust utilize heavy-duty optimization backends. When provided with `-O3` and `-mavx2`, they perform **Loop Vectorization**.

### Assembly Pattern:
```asm
vmovupd ymm0, [rdx + rax]    ; Load 4 doubles (256-bit)
vaddpd  ymm0, ymm0, [r8 + rax] ; Add 4 doubles in ONE cycle
vmovupd [rcx + rax], ymm0    ; Store 4 results
```

### Key Techniques:
- **Loop Unrolling:** Processing multiple blocks per iteration to reduce branch overhead.
- **Pointer Aliasing Checks:** The compiler generates code to check if `res` overlaps with `a` or `b` at runtime.
- **Instruction Selection:** Uses VEX-encoded instructions (`v` prefix) to leverage the full 256-bit YMM register file.

## 2. Go (The Plan9/Pragmatic Approach)
Go's compiler prioritizes compilation speed and runtime safety (GC) over absolute peak performance for math loops.

### Assembly Pattern:
```asm
MOVSD   X0, (R8)(CX*8)  ; Load 1 double (64-bit)
ADDSD   X1, X0          ; Add 1 double
MOVSD   X1, (R9)(CX*8)  ; Store 1 result
```

### Key Differences:
- **Scalar Execution:** By default, the Go compiler (as of v1.21-1.22) is less aggressive about auto-vectorizing standard loops compared to LLVM.
- **GC Metadata:** The assembly is interspersed with `PCDATA` and `FUNCDATA` directives, which are essential for Go's stack-scanning garbage collector.
- **Bounds Checking:** Go often keeps bounds checks inside the loop unless it can prove they are redundant, which can inhibit certain SIMD optimizations.

## 📈 Engineering Takeaways

1.  **For Performance-Critical Math:** C, C++, and Rust remain the leaders because their backends (LLVM/GCC) are designed to extract every ounce of SIMD throughput from the hardware.
2.  **For System Simplicity:** Go provides highly readable assembly that closely follows the source logic, making it easier to debug and faster to compile, at the cost of "auto-magic" vectorization.
3.  **The "V" Prefix Matters:** In x86_64, the `v` in `vaddpd` signifies AVX. Without the `v`, you are likely looking at legacy SSE code, which may suffer from transition penalties on modern chips if mixed with AVX code.

---
*Log generated on 2026-05-16 - Assembly Lab Experiment #04*
