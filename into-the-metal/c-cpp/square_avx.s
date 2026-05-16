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
	jle	.L25
	cmp	r8d, 1
	je	.L3
	lea	rax, -8[rcx]
	sub	rax, rdx
	cmp	rax, 16
	jbe	.L3
	lea	eax, -1[r8]
	mov	r9d, r8d
	cmp	eax, 2
	jbe	.L11
	shr	r9d, 2
	xor	eax, eax
	sal	r9, 5
	.p2align 5
	.p2align 4
	.p2align 3
.L5:
	vmovupd	ymm0, YMMWORD PTR [rdx+rax]
	vmulpd	ymm0, ymm0, ymm0
	vmovupd	YMMWORD PTR [rcx+rax], ymm0
	add	rax, 32
	cmp	rax, r9
	jne	.L5
	mov	eax, r8d
	and	eax, -4
	mov	r10d, eax
	cmp	r8d, eax
	je	.L23
	mov	r9d, r8d
	sub	r9d, eax
	cmp	r9d, 1
	je	.L27
	vzeroupper
.L4:
	mov	r8d, r10d
	vmovupd	xmm0, XMMWORD PTR [rdx+r8*8]
	vmulpd	xmm0, xmm0, xmm0
	vmovupd	XMMWORD PTR [rcx+r8*8], xmm0
	test	r9b, 1
	je	.L25
	and	r9d, -2
	add	eax, r9d
.L7:
	cdqe
	vmovsd	xmm0, QWORD PTR [rdx+rax*8]
	vmulsd	xmm0, xmm0, xmm0
	vmovsd	QWORD PTR [rcx+rax*8], xmm0
.L25:
	ret
	.p2align 4,,10
	.p2align 3
.L23:
	vzeroupper
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
.L9:
	vmovsd	xmm0, QWORD PTR [rdx+rax]
	vmulsd	xmm0, xmm0, xmm0
	vmovsd	QWORD PTR [rcx+rax], xmm0
	add	rax, 8
	cmp	r8, rax
	jne	.L9
	ret
.L11:
	xor	r10d, r10d
	xor	eax, eax
	jmp	.L4
.L27:
	vzeroupper
	jmp	.L7
	.seh_endproc
	.section .rdata,"dr"
.LC1:
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
	vmovupd	ymm0, YMMWORD PTR .LC0[rip]
	lea	rbx, 32[rsp]
	vmovupd	YMMWORD PTR 32[rsp], ymm0
	vzeroupper
.L29:
	vmovsd	xmm1, QWORD PTR [rbx]
	lea	rcx, .LC1[rip]
	add	rbx, 8
	vmovq	rdx, xmm1
	call	printf
	lea	rax, 64[rsp]
	cmp	rbx, rax
	jne	.L29
	mov	ecx, 10
	call	putchar
	xor	eax, eax
	add	rsp, 64
	pop	rbx
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 32
.LC0:
	.long	0
	.long	1072693248
	.long	0
	.long	1074790400
	.long	0
	.long	1075970048
	.long	0
	.long	1076887552
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev8, Built by MSYS2 project) 15.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef
