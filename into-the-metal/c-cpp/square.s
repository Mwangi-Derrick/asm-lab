	.file	"square.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	square_array
	.def	square_array;	.scl	2;	.type	32;	.endef
	.seh_proc	square_array
square_array:
	.seh_endprologue
	test	r8d, r8d
	jle	.L1
	lea	eax, -1[r8]
	cmp	eax, 1
	jbe	.L3
	mov	rax, rcx
	sub	rax, rdx
	cmp	rax, 8
	je	.L3
	mov	r9d, r8d
	xor	eax, eax
	shr	r9d
	sal	r9, 4
	.p2align 5
	.p2align 4
	.p2align 3
.L4:
	movupd	xmm0, XMMWORD PTR [rdx+rax]
	mulpd	xmm0, xmm0
	movups	XMMWORD PTR [rcx+rax], xmm0
	add	rax, 16
	cmp	r9, rax
	jne	.L4
	test	r8b, 1
	je	.L1
	and	r8d, -2
	movsd	xmm0, QWORD PTR [rdx+r8*8]
	mulsd	xmm0, xmm0
	movsd	QWORD PTR [rcx+r8*8], xmm0
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	movsx	r8, r8d
	xor	eax, eax
	sal	r8, 3
	.p2align 5
	.p2align 4
	.p2align 3
.L6:
	movsd	xmm0, QWORD PTR [rdx+rax]
	mulsd	xmm0, xmm0
	movsd	QWORD PTR [rcx+rax], xmm0
	add	rax, 8
	cmp	r8, rax
	jne	.L6
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC2:
	.ascii "%f \0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	call	__main
	movupd	xmm0, XMMWORD PTR .LC0[rip]
	lea	rbx, 32[rsp]
	movups	XMMWORD PTR 32[rsp], xmm0
	movupd	xmm0, XMMWORD PTR .LC1[rip]
	movups	XMMWORD PTR 48[rsp], xmm0
.L15:
	movsd	xmm1, QWORD PTR [rbx]
	lea	rcx, .LC2[rip]
	add	rbx, 8
	movq	rdx, xmm1
	call	printf
	lea	rax, 64[rsp]
	cmp	rbx, rax
	jne	.L15
	mov	ecx, 10
	call	putchar
	xor	eax, eax
	add	rsp, 64
	pop	rbx
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 16
.LC0:
	.long	0
	.long	1072693248
	.long	0
	.long	1074790400
	.align 16
.LC1:
	.long	0
	.long	1075970048
	.long	0
	.long	1076887552
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev8, Built by MSYS2 project) 15.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef
