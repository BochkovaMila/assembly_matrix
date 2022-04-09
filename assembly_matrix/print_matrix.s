	.file	"print_matrix.cpp"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii " \0"
.LC1:
	.ascii "%6.2f\0"
.LC2:
	.ascii "  \0"
	.text
	.globl	_Z12print_matrixPdi
	.def	_Z12print_matrixPdi;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z12print_matrixPdi
_Z12print_matrixPdi:
.LFB34:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	$0, -4(%rbp)
.L5:
	movl	-4(%rbp), %eax
	cmpl	24(%rbp), %eax
	jge	.L6
	movl	$0, -8(%rbp)
.L4:
	movl	-8(%rbp), %eax
	cmpl	24(%rbp), %eax
	jge	.L3
	movl	-8(%rbp), %eax
	imull	24(%rbp), %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %rdx
	movq	%rdx, %xmm0
	leaq	.LC0(%rip), %r8
	movapd	%xmm0, %xmm1
	movq	%rax, %rdx
	leaq	.LC1(%rip), %rcx
	call	printf
	leaq	.LC2(%rip), %rcx
	call	printf
	addl	$1, -8(%rbp)
	jmp	.L4
.L3:
	leaq	.LC0(%rip), %rcx
	call	puts
	addl	$1, -4(%rbp)
	jmp	.L5
.L6:
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 9.2.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
