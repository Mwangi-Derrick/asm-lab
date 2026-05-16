	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section .rdata,"dr"
.LC2:
	.ascii "Starting SIMD addition...\0"
.LC3:
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
	vpxor	xmm0, xmm0, xmm0
	vmovdqu	YMMWORD PTR 112[rsp], ymm0
	vzeroupper
	call	puts
	mov	r8, rbp
	mov	rdx, rdi
	mov	r9d, 4
	mov	rcx, rsi
	xor	ebx, ebx
	call	simd_add
.L2:
	mov	r9, QWORD PTR 0[rbp+rbx*8]
	mov	r8, QWORD PTR [rdi+rbx*8]
	mov	edx, ebx
	lea	rcx, .LC3[rip]
	vmovsd	xmm0, QWORD PTR [rsi+rbx*8]
	add	rbx, 1
	vmovq	xmm3, r9
	vmovq	xmm2, r8
	vmovsd	QWORD PTR 32[rsp], xmm0
	call	printf
	cmp	rbx, 4
	jne	.L2
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
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev8, Built by MSYS2 project) 15.2.0"
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	simd_add;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
