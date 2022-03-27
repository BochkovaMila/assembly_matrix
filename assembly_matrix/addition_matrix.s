.global	addition_matrix

addition_matrix:
        pushq	%rbp                    #save %rbp
        movq	%rsp, %rbp              #update %rpb (new stack frame)
        subq	$16, %rsp               #substract 16 from %rsp to reserve space in the stack
        movq	%rcx, 16(%rbp)          #copy a to 16(%rbp)
        movq	%rdx, 24(%rbp)          #copy b to 24(%rbp)
        movq	%r8, 32(%rbp)           #copy c to 32(%rbp)
        movl	%r9d, 40(%rbp)          #copy n to 40(%rbp)
        movl	$0, -4(%rbp)            #copy 0 to -4(%rbp) (i=0)
.L3:
        movl	40(%rbp), %eax          #copy n to %eax
        imull	%eax, %eax              #multiply n by n
        cmpl	%eax, -4(%rbp)          #compare logical i to n^2
        jge	.L4                     #jump to .L4 if i >= n^2
        movl	-4(%rbp), %eax          #copy i to %eax
        cltq                            #convert i to a 64-bit integer
        leaq	0(,%rax,8), %rdx        #copy i*8 to %rdx
        movq	16(%rbp), %rax          #copy a to %rax
        addq	%rdx, %rax              #add %rdx to %rax
        movsd	(%rax), %xmm1           #move %rax to 128 bit register %xmm1
        movl	-4(%rbp), %eax          #copy i to %eax
        cltq                            #convert i to a 64-bit integer
        leaq	0(,%rax,8), %rdx        #copy i*8 to %rdx
        movq	24(%rbp), %rax          #copy b to %rax
        addq	%rdx, %rax              #add %rdx to %rax
        movsd	(%rax), %xmm0           #move %rax to 128 bit register %xmm0
        movl	-4(%rbp), %eax          #copy i to %eax
        cltq                            #convert i to a 64-bit integer
        leaq	0(,%rax,8), %rdx        #copy i*8 to %rdx
        movq	32(%rbp), %rax          #copy c to %rax
        addq	%rdx, %rax              #add %rdx to %rax
        addsd	%xmm1, %xmm0            #add scalar double value %xmm1 to %xmm0
        movsd	%xmm0, (%rax)           #move %xmm0 to %rax
        addl	$1, -4(%rbp)            #add 1 to i
        jmp	.L3                     #jump to .L3
.L4:
        nop
        addq	$16, %rsp               #add 16 to %rsp
        popq	%rbp                    #prepare to leave the function
        ret                             #pop return address from stack and jump there
