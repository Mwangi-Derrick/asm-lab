	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 0
	.file	"bounds.b313f5d2154a6840-cgu.0"
	.def	_ZN3std2rt10lang_start17h22d2d52b53e54584E;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	_ZN3std2rt10lang_start17h22d2d52b53e54584E
	.p2align	4
_ZN3std2rt10lang_start17h22d2d52b53e54584E:
.seh_proc _ZN3std2rt10lang_start17h22d2d52b53e54584E
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movq	%r8, %rax
	movq	%rdx, %r8
	movq	%rcx, 48(%rsp)
	movb	%r9b, 32(%rsp)
	leaq	.Lanon.89e5b14009693f1c21637f9a44849c3e.0(%rip), %rdx
	leaq	48(%rsp), %rcx
	movq	%rax, %r9
	callq	_ZN3std2rt19lang_start_internal17he4d198c5bc49b2b7E
	nop
	.seh_startepilogue
	addq	$56, %rsp
	.seh_endepilogue
	retq
	.seh_endproc

	.def	_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17hf0037008a575b3d4E;
	.scl	3;
	.type	32;
	.endef
	.p2align	4
_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17hf0037008a575b3d4E:
.seh_proc _ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17hf0037008a575b3d4E
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movq	(%rcx), %rcx
	callq	_ZN3std3sys9backtrace28__rust_begin_short_backtrace17hd31bfc2bd6a19d5eE
	xorl	%eax, %eax
	.seh_startepilogue
	addq	$40, %rsp
	.seh_endepilogue
	retq
	.seh_endproc

	.def	_ZN3std3sys9backtrace28__rust_begin_short_backtrace17hd31bfc2bd6a19d5eE;
	.scl	3;
	.type	32;
	.endef
	.p2align	4
_ZN3std3sys9backtrace28__rust_begin_short_backtrace17hd31bfc2bd6a19d5eE:
.seh_proc _ZN3std3sys9backtrace28__rust_begin_short_backtrace17hd31bfc2bd6a19d5eE
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	callq	*%rcx
	#APP
	#NO_APP
	nop
	.seh_startepilogue
	addq	$40, %rsp
	.seh_endepilogue
	retq
	.seh_endproc

	.def	_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfdb0a624a010787aE;
	.scl	3;
	.type	32;
	.endef
	.p2align	4
_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfdb0a624a010787aE:
	movq	(%rcx), %rcx
	jmp	_ZN4core3fmt5float50_$LT$impl$u20$core..fmt..Debug$u20$for$u20$f64$GT$3fmt17h56c2885f79a3f110E

	.def	_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17hfd25b144931da2f3E;
	.scl	3;
	.type	32;
	.endef
	.p2align	4
_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17hfd25b144931da2f3E:
.seh_proc _ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17hfd25b144931da2f3E
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	movq	(%rcx), %rcx
	callq	_ZN3std3sys9backtrace28__rust_begin_short_backtrace17hd31bfc2bd6a19d5eE
	xorl	%eax, %eax
	.seh_startepilogue
	addq	$40, %rsp
	.seh_endepilogue
	retq
	.seh_endproc

	.def	_ZN4core5array69_$LT$impl$u20$core..fmt..Debug$u20$for$u20$$u5b$T$u3b$$u20$N$u5d$$GT$3fmt17h255ba4eb5850e262E;
	.scl	3;
	.type	32;
	.endef
	.p2align	4
_ZN4core5array69_$LT$impl$u20$core..fmt..Debug$u20$for$u20$$u5b$T$u3b$$u20$N$u5d$$GT$3fmt17h255ba4eb5850e262E:
.seh_proc _ZN4core5array69_$LT$impl$u20$core..fmt..Debug$u20$for$u20$$u5b$T$u3b$$u20$N$u5d$$GT$3fmt17h255ba4eb5850e262E
	pushq	%r14
	.seh_pushreg %r14
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	pushq	%rbx
	.seh_pushreg %rbx
	subq	$56, %rsp
	.seh_stackalloc 56
	.seh_endprologue
	movq	%rcx, %rdi
	leaq	40(%rsp), %rsi
	movq	%rsi, %rcx
	callq	_ZN4core3fmt9Formatter10debug_list17h542e43378537fbf2E
	movq	%rdi, 32(%rsp)
	leaq	.Lanon.89e5b14009693f1c21637f9a44849c3e.1(%rip), %rbx
	leaq	32(%rsp), %r14
	movq	%rsi, %rcx
	movq	%r14, %rdx
	movq	%rbx, %r8
	callq	_ZN4core3fmt8builders9DebugList5entry17h45796a47c12f6084E
	leaq	8(%rdi), %rax
	movq	%rax, 32(%rsp)
	movq	%rsi, %rcx
	movq	%r14, %rdx
	movq	%rbx, %r8
	callq	_ZN4core3fmt8builders9DebugList5entry17h45796a47c12f6084E
	leaq	16(%rdi), %rax
	movq	%rax, 32(%rsp)
	movq	%rsi, %rcx
	movq	%r14, %rdx
	movq	%rbx, %r8
	callq	_ZN4core3fmt8builders9DebugList5entry17h45796a47c12f6084E
	addq	$24, %rdi
	movq	%rdi, 32(%rsp)
	movq	%rsi, %rcx
	movq	%r14, %rdx
	movq	%rbx, %r8
	callq	_ZN4core3fmt8builders9DebugList5entry17h45796a47c12f6084E
	movq	%rsi, %rcx
	callq	_ZN4core3fmt8builders9DebugList6finish17h437518fb0a9af433E
	nop
	.seh_startepilogue
	addq	$56, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	.seh_endepilogue
	retq
	.seh_endproc

	.def	_ZN6bounds4main17h1503e6a39176505dE;
	.scl	2;
	.type	32;
	.endef
	.section	.rdata,"dr"
	.p2align	4, 0x0
.LCPI6_0:
	.quad	0x3ff0000000000000
	.quad	0x4000000000000000
.LCPI6_1:
	.quad	0x4008000000000000
	.quad	0x4010000000000000
.LCPI6_2:
	.quad	0x4024000000000000
	.quad	0x4034000000000000
.LCPI6_3:
	.quad	0x403e000000000000
	.quad	0x4044000000000000
	.text
	.globl	_ZN6bounds4main17h1503e6a39176505dE
	.p2align	4
_ZN6bounds4main17h1503e6a39176505dE:
.seh_proc _ZN6bounds4main17h1503e6a39176505dE
	pushq	%rsi
	.seh_pushreg %rsi
	subq	$160, %rsp
	.seh_stackalloc 160
	.seh_endprologue
	movaps	.LCPI6_0(%rip), %xmm0
	movaps	%xmm0, 64(%rsp)
	movaps	.LCPI6_1(%rip), %xmm0
	movaps	%xmm0, 80(%rsp)
	movaps	.LCPI6_2(%rip), %xmm0
	movaps	%xmm0, 96(%rsp)
	movaps	.LCPI6_3(%rip), %xmm0
	movaps	%xmm0, 112(%rsp)
	xorps	%xmm0, %xmm0
	movaps	%xmm0, 144(%rsp)
	movaps	%xmm0, 128(%rsp)
	leaq	128(%rsp), %rsi
	movq	%rsi, 32(%rsp)
	movq	$4, 40(%rsp)
	leaq	64(%rsp), %rcx
	leaq	96(%rsp), %r8
	movl	$4, %edx
	movl	$4, %r9d
	callq	add_arrays
	movq	%rsi, 48(%rsp)
	leaq	_ZN4core5array69_$LT$impl$u20$core..fmt..Debug$u20$for$u20$$u5b$T$u3b$$u20$N$u5d$$GT$3fmt17h255ba4eb5850e262E(%rip), %rax
	movq	%rax, 56(%rsp)
	leaq	.Lanon.89e5b14009693f1c21637f9a44849c3e.2(%rip), %rcx
	leaq	48(%rsp), %rdx
	callq	_ZN3std2io5stdio6_print17h1a35dc73fb86a1adE
	nop
	.seh_startepilogue
	addq	$160, %rsp
	popq	%rsi
	.seh_endepilogue
	retq
	.seh_endproc

	.def	add_arrays;
	.scl	2;
	.type	32;
	.endef
	.globl	add_arrays
	.p2align	4
add_arrays:
.seh_proc add_arrays
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$40, %rsp
	.seh_stackalloc 40
	.seh_endprologue
	testq	%rdx, %rdx
	je	.LBB7_7
	movq	%rcx, %rax
	movq	104(%rsp), %rcx
	movq	96(%rsp), %r10
	cmpq	%r9, %rcx
	movq	%r9, %r11
	cmovbq	%rcx, %r11
	leaq	-1(%rdx), %rsi
	cmpq	%rsi, %r11
	cmovaeq	%rsi, %r11
	cmpq	$3, %r11
	ja	.LBB7_8
	xorl	%r11d, %r11d
	jmp	.LBB7_3
.LBB7_8:
	incq	%r11
	movl	%r11d, %esi
	andl	$3, %esi
	movl	$4, %edi
	cmovneq	%rsi, %rdi
	subq	%rdi, %r11
	xorl	%esi, %esi
	.p2align	4
.LBB7_9:
	movupd	(%rax,%rsi,8), %xmm0
	movupd	16(%rax,%rsi,8), %xmm1
	movupd	(%r8,%rsi,8), %xmm2
	addpd	%xmm0, %xmm2
	movupd	16(%r8,%rsi,8), %xmm0
	addpd	%xmm1, %xmm0
	movupd	%xmm2, (%r10,%rsi,8)
	movupd	%xmm0, 16(%r10,%rsi,8)
	addq	$4, %rsi
	cmpq	%rsi, %r11
	jne	.LBB7_9
.LBB7_3:
	movq	%rcx, %rsi
	subq	%r11, %rsi
	movq	%r9, %rdi
	subq	%r11, %rdi
	leaq	(%rax,%r11,8), %rax
	subq	%r11, %rdx
	leaq	(%r8,%r11,8), %r8
	leaq	(%r10,%r11,8), %r10
	xorl	%r11d, %r11d
	.p2align	4
.LBB7_4:
	cmpq	%r11, %rdi
	je	.LBB7_10
	cmpq	%r11, %rsi
	je	.LBB7_11
	movsd	(%rax,%r11,8), %xmm0
	addsd	(%r8,%r11,8), %xmm0
	movsd	%xmm0, (%r10,%r11,8)
	incq	%r11
	cmpq	%r11, %rdx
	jne	.LBB7_4
.LBB7_7:
	.seh_startepilogue
	addq	$40, %rsp
	popq	%rdi
	popq	%rsi
	.seh_endepilogue
	retq
.LBB7_10:
	leaq	.Lanon.89e5b14009693f1c21637f9a44849c3e.4(%rip), %r8
	movq	%r9, %rcx
	movq	%r9, %rdx
	callq	_ZN4core9panicking18panic_bounds_check17hc208fef1f4bcd83fE
.LBB7_11:
	leaq	.Lanon.89e5b14009693f1c21637f9a44849c3e.5(%rip), %r8
	movq	%rcx, %rdx
	callq	_ZN4core9panicking18panic_bounds_check17hc208fef1f4bcd83fE
	int3
	.seh_endproc

	.def	main;
	.scl	2;
	.type	32;
	.endef
	.globl	main
	.p2align	4
main:
.seh_proc main
	pushq	%rbp
	.seh_pushreg %rbp
	pushq	%rsi
	.seh_pushreg %rsi
	pushq	%rdi
	.seh_pushreg %rdi
	subq	$48, %rsp
	.seh_stackalloc 48
	leaq	48(%rsp), %rbp
	.seh_setframe %rbp, 48
	.seh_endprologue
	movq	%rdx, %rsi
	movslq	%ecx, %rdi
	callq	__main
	leaq	_ZN6bounds4main17h1503e6a39176505dE(%rip), %rax
	movq	%rax, -8(%rbp)
	movb	$0, 32(%rsp)
	leaq	.Lanon.89e5b14009693f1c21637f9a44849c3e.0(%rip), %rdx
	leaq	-8(%rbp), %rcx
	movq	%rdi, %r8
	movq	%rsi, %r9
	callq	_ZN3std2rt19lang_start_internal17he4d198c5bc49b2b7E
	nop
	.seh_startepilogue
	addq	$48, %rsp
	popq	%rdi
	popq	%rsi
	popq	%rbp
	.seh_endepilogue
	retq
	.seh_endproc

	.section	.rdata,"dr"
	.p2align	3, 0x0
.Lanon.89e5b14009693f1c21637f9a44849c3e.0:
	.asciz	"\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\b\000\000\000\000\000\000"
	.quad	_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17hfd25b144931da2f3E
	.quad	_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17hf0037008a575b3d4E
	.quad	_ZN3std2rt10lang_start28_$u7b$$u7b$closure$u7d$$u7d$17hf0037008a575b3d4E

	.p2align	3, 0x0
.Lanon.89e5b14009693f1c21637f9a44849c3e.1:
	.asciz	"\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\b\000\000\000\000\000\000"
	.quad	_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfdb0a624a010787aE

.Lanon.89e5b14009693f1c21637f9a44849c3e.2:
	.asciz	"\300\001\n"

.Lanon.89e5b14009693f1c21637f9a44849c3e.3:
	.asciz	"into-the-metal/rust/bounds.rs"

	.p2align	3, 0x0
.Lanon.89e5b14009693f1c21637f9a44849c3e.4:
	.quad	.Lanon.89e5b14009693f1c21637f9a44849c3e.3
	.asciz	"\035\000\000\000\000\000\000\000\005\000\000\000\031\000\000"

	.p2align	3, 0x0
.Lanon.89e5b14009693f1c21637f9a44849c3e.5:
	.quad	.Lanon.89e5b14009693f1c21637f9a44849c3e.3
	.asciz	"\035\000\000\000\000\000\000\000\005\000\000\000\t\000\000"

	.section	.drectve,"yni"
	.ascii	" -exclude-symbols:_ZN3std2rt10lang_start17h22d2d52b53e54584E"
	.ascii	" -exclude-symbols:_ZN6bounds4main17h1503e6a39176505dE"
