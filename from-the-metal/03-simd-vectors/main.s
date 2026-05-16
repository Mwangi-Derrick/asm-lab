	.file	"main.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	simd_add_c
	.def	simd_add_c;	.scl	2;	.type	32;	.endef
	.seh_proc	simd_add_c
simd_add_c:
	.seh_endprologue
	test	r9d, r9d
	jle	.L31
	cmp	r9d, 1
	je	.L3
	lea	rax, -8[rcx]
	mov	r10, rax
	sub	r10, rdx
	cmp	r10, 16
	jbe	.L3
	sub	rax, r8
	cmp	rax, 16
	jbe	.L3
	lea	eax, -1[r9]
	mov	r11d, r9d
	cmp	eax, 2
	jbe	.L11
	mov	r10d, r9d
	xor	eax, eax
	shr	r10d, 2
	sal	r10, 5
	.p2align 5
	.p2align 4
	.p2align 3
.L5:
	vmovupd	ymm0, YMMWORD PTR [r8+rax]
	vaddpd	ymm0, ymm0, YMMWORD PTR [rdx+rax]
	vmovupd	YMMWORD PTR [rcx+rax], ymm0
	add	rax, 32
	cmp	rax, r10
	jne	.L5
	mov	eax, r9d
	and	eax, -4
	mov	r10d, eax
	cmp	r9d, eax
	je	.L29
	mov	r11d, r9d
	sub	r11d, eax
	cmp	r11d, 1
	je	.L33
	vzeroupper
.L4:
	mov	r9d, r10d
	vmovupd	xmm0, XMMWORD PTR [r8+r9*8]
	vaddpd	xmm0, xmm0, XMMWORD PTR [rdx+r9*8]
	vmovupd	XMMWORD PTR [rcx+r9*8], xmm0
	test	r11b, 1
	je	.L31
	and	r11d, -2
	add	eax, r11d
.L7:
	cdqe
	vmovsd	xmm0, QWORD PTR [rdx+rax*8]
	vaddsd	xmm0, xmm0, QWORD PTR [r8+rax*8]
	vmovsd	QWORD PTR [rcx+rax*8], xmm0
.L31:
	ret
	.p2align 4,,10
	.p2align 3
.L29:
	vzeroupper
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	movsx	r9, r9d
	xor	eax, eax
	sal	r9, 3
	.p2align 5
	.p2align 4
	.p2align 3
.L9:
	vmovsd	xmm0, QWORD PTR [rdx+rax]
	vaddsd	xmm0, xmm0, QWORD PTR [r8+rax]
	vmovsd	QWORD PTR [rcx+rax], xmm0
	add	rax, 8
	cmp	r9, rax
	jne	.L9
	ret
.L11:
	xor	r10d, r10d
	xor	eax, eax
	jmp	.L4
.L33:
	vzeroupper
	jmp	.L7
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC2:
	.ascii "Starting C-based SIMD addition (auto-vectorized)...\0"
.LC4:
	.ascii "res[%d]: %f + %f = %f\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	push	rbp
	.seh_pushreg	rbp
	push	rdi
	.seh_pushreg	rdi
	push	rsi
	.seh_pushreg	rsi
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 152
	.seh_stackalloc	152
	.seh_endprologue
	call	__main
	lea	rbp, 80[rsp]
	lea	rdi, 48[rsp]
	vmovupd	ymm0, YMMWORD PTR .LC0[rip]
	lea	rcx, .LC2[rip]
	lea	rsi, 112[rsp]
	vmovupd	YMMWORD PTR 48[rsp], ymm0
	vmovupd	ymm0, YMMWORD PTR .LC1[rip]
	vmovupd	YMMWORD PTR 80[rsp], ymm0
	vzeroupper
	call	puts
	vmovupd	ymm0, YMMWORD PTR .LC3[rip]
	xor	ebx, ebx
	vmovupd	YMMWORD PTR 112[rsp], ymm0
	vzeroupper
.L35:
	mov	r9, QWORD PTR 0[rbp+rbx*8]
	mov	r8, QWORD PTR [rdi+rbx*8]
	mov	edx, ebx
	lea	rcx, .LC4[rip]
	vmovsd	xmm0, QWORD PTR [rsi+rbx*8]
	add	rbx, 1
	vmovq	xmm3, r9
	vmovq	xmm2, r8
	vmovsd	QWORD PTR 32[rsp], xmm0
	call	printf
	cmp	rbx, 4
	jne	.L35
	xor	eax, eax
	add	rsp, 152
	pop	rbx
	pop	rsi
	pop	rdi
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 32
.LC0:
	.long	0
	.long	1073217536
	.long	0
	.long	1074003968
	.long	0
	.long	1074528256
	.long	0
	.long	1074921472
	.align 32
.LC1:
	.long	0
	.long	1076101120
	.long	0
	.long	1077149696
	.long	0
	.long	1077805056
	.long	0
	.long	1078198272
	.align 32
.LC3:
	.long	0
	.long	1076297728
	.long	0
	.long	1077313536
	.long	0
	.long	1077985280
	.long	0
	.long	1078345728
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev8, Built by MSYS2 project) 15.2.0"
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
