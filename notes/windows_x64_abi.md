# Windows x64 ABI Reference

## Calling Convention (Microsoft x64)

- **First 4 arguments:** `RCX`, `RDX`, `R8`, `R9`.
- **Additional arguments:** Pushed onto the stack (right-to-left).
- **Return value:** `RAX` (integer/pointer) or `XMM0` (float/double).
- **Shadow Space:** 32 bytes of "home space" must be allocated by the caller on the stack before a function call.
- **Stack Alignment:** The stack must be 16-byte aligned before any `call` instruction.

## Volatile Registers (Caller-saved)
- `RAX`, `RCX`, `RDX`, `R8`, `R9`, `R10`, `R11`
- `XMM0` to `XMM5`

## Non-volatile Registers (Callee-saved)
- `RBX`, `RBP`, `RDI`, `RSI`, `RSP`, `R12` to `R15`
- `XMM6` to `XMM15`
