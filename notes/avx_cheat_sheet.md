# AVX Cheat Sheet

## Common Instructions

- `VMOVUPD`: Move unaligned packed double-precision floating-point values.
- `VADDPD`: Add packed double-precision floating-point values.
- `VMULPD`: Multiply packed double-precision floating-point values.
- `VZEROUPPER`: Zero upper halves of YMM registers (prevents performance penalty when switching between AVX and SSE).

## YMM Registers
- 256-bit wide.
- Can hold 4 `double`s (64-bit) or 8 `float`s (32-bit).
- Lower 128 bits are aliased to `XMM` registers.
