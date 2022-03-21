	.file	"multiply_alloc_matrix.cpp"
	.text
	.globl	_Z21multiply_alloc_matrixPdS_i
	.def	_Z21multiply_alloc_matrixPdS_i;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z21multiply_alloc_matrixPdS_i
_Z21multiply_alloc_matrixPdS_i:
.LFB34:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	32(%rbp), %eax
	imull	%eax, %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, -24(%rbp)
	movl	$0, -4(%rbp)
.L7:
	movl	-4(%rbp), %eax
	cmpl	32(%rbp), %eax
	jge	.L2
	movl	$0, -8(%rbp)
.L6:
	movl	-8(%rbp), %eax
	cmpl	32(%rbp), %eax
	jge	.L3
	movl	-4(%rbp), %eax
	imull	32(%rbp), %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	movl	$0, -12(%rbp)
.L5:
	movl	-12(%rbp), %eax
	cmpl	32(%rbp), %eax
	jge	.L4
	movl	-4(%rbp), %eax
	imull	32(%rbp), %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movl	32(%rbp), %eax
	imull	-12(%rbp), %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm2
	movl	32(%rbp), %eax
	imull	-8(%rbp), %eax
	movl	%eax, %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	movl	-4(%rbp), %eax
	imull	32(%rbp), %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -12(%rbp)
	jmp	.L5
.L4:
	addl	$1, -8(%rbp)
	jmp	.L6
.L3:
	addl	$1, -4(%rbp)
	jmp	.L7
.L2:
	movq	-24(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 9.2.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
