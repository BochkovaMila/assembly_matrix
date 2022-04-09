.global	init_alloc_matrix
.def	_Z17init_alloc_matrixi;	.endef

_Z17init_alloc_matrixi:
        pushq	%rbp                #save %rbp
        movq	%rsp, %rbp          #update %rpb (new stack frame)
        subq	$48, %rsp           #substract 48 from %rsp to reserve space in the stack
        movl	%ecx, 16(%rbp)      #copy n to 16(%rbp)
        movl	16(%rbp), %eax      #move 16(%rbp) to %eax
        imull	%eax, %eax          #multiply n by n
        cltq                        #convert n to a 64-bit integer
        salq	$3, %rax            #left shift %rax by 3 bits
        movq	%rax, %rcx          #copy %rax to %rcx
	call	malloc
        movq	%rax, -16(%rbp)     #move %rax to -16(%rbp)
        movl	$0, -4(%rbp)        #copy 0 to -4(%rbp) (i=0)
.L3:
        movl	16(%rbp), %eax      #move 16(%rbp) to %eax
        imull	%eax, %eax          #multiply n by n
        cmpl	%eax, -4(%rbp)      #compare n^2 and i
        jge	.L2                     #if i >= n*n jump to .L2
        call	rand
        cvtsi2sdl	%eax, %xmm0     #convert doubleword integer to scalar double-precision floating-point value
        movsd	.LC0(%rip), %xmm1   #move .LC0 to %xmm1
        divsd	%xmm1, %xmm0        #divide xmm1 by xmm0
        movapd	%xmm0, %xmm1        #move xmm1 to xmm0
        movsd	.LC1(%rip), %xmm0   #move .LC1 to %xmm0
        mulsd	%xmm1, %xmm0        #multiply xmm1 by xmm0
        movl	-4(%rbp), %eax      #move i to %eax
        cltq                        #convert i to a 64-bit integer
        leaq	0(,%rax,8), %rdx    #copy i*8 to %rdx
        movq	-16(%rbp), %rax     #move -16(%rbp) to %rax
        addq	%rdx, %rax          #add %rdx to %rax
        movsd	.LC2(%rip), %xmm1   #move .LC2 to %xmm1
        subsd	%xmm1, %xmm0        #substract %xmm1 from %xmm0
        movsd	%xmm0, (%rax)       #move %xmm0 to %rax
        addl	$1, -4(%rbp)        #i += 1
        jmp	.L3                     #jump to .L3
.L2:
        movq	-16(%rbp), %rax     #move -16(%rbp) to %rax
        addq	$48, %rsp           #add 48 to %rsp
        popq	%rbp                #prepare to leave the function
        ret                         #pop return address from stack and jump there
        .section .rdata,"dr"        #put the following data into the section named ".rdata"
        .align 8                    #ensure that your data and code is aligned to 8-byte boundary
.LC0:
	.long	0
	.long	1088421824
	.align 8
.LC1:
	.long	0
        .long	1077936128          #=0x40400000
	.align 8
.LC2:
	.long	0
        .long	1076363264          #=0x40280000

.def	malloc;	.endef
.def	rand;	.endef
