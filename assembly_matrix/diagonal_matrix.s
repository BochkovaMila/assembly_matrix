.global	diagonal_matrix
.def	_Z15diagonal_matrixiiPdi; .endef
_Z15diagonal_matrixiiPdi:
        pushq	%rbp                #save %rbp
        movq	%rsp, %rbp          #update %rpb (new stack frame)
        subq	$64, %rsp           #substract 64 from %rsp to reserve space in the stack
        movl	%ecx, 16(%rbp)      #copy a to 16(%rbp)
        movl	%edx, 24(%rbp)      #copy n to 24(%rbp)
        movq	%r8, 32(%rbp)       #copy m to 32(%rbp)
        movl	%r9d, 40(%rbp)      #copy N to 40(%rbp)
        movl	40(%rbp), %eax      #copy N to %eax
        cltq                        #convert N to a 64-bit integer
        salq	$3, %rax            #left shift %rax by 3 bits
        movq	%rax, %rcx          #move a quadword %rax to %rcx
	call	malloc
        movq	%rax, -24(%rbp)     #move a quadword %rax to -24(%rbp)
        movl	16(%rbp), %eax      #move n to %eax
        movl	%eax, -4(%rbp)      #j = n
        movl	24(%rbp), %eax      #move m to %eax
        movl	%eax, -8(%rbp)      #i = m
        movl	$0, -12(%rbp)       #count = 0
.L3:
        movl	-12(%rbp), %eax     #move count to %eax
        cmpl	40(%rbp), %eax      #compare count and N
        jge	.L2                 #if count >= N jump to .L2
        movl	-4(%rbp), %eax      #move j to %eax
        cltd                        #convert j to a 64-bit integer
        idivl	40(%rbp)            #divide by N
        movl	%edx, -4(%rbp)      #j = j % N
        movl	-8(%rbp), %eax      #move i to %eax
        cltd                        #convert i to a 64-bit integer
        idivl	40(%rbp)            #divide by N
        movl	%edx, -8(%rbp)      #i = i % N
        movl	-4(%rbp), %eax      #copy j to %eax
        imull	40(%rbp), %eax      #multiply j by N
        movl	%eax, %edx          #copy j*N to %eax
        movl	-8(%rbp), %eax      #move i to %eax
        addl	%edx, %eax          # add i to j*N
        cltq                        #convert i+j*N to a 64-bit integer
        leaq	0(,%rax,8), %rdx    #copy %rax*8 to %rdx
        movq	32(%rbp), %rax      #move 32(%rbp) to %rax
        addq	%rax, %rdx          #add %rax to %rdx
        movl	-12(%rbp), %eax     #move count to %eax
        cltq                        #convert count to a 64-bit integer
        leaq	0(,%rax,8), %rcx    #copy %rax*8 to %rcx
        movq	-24(%rbp), %rax     #copy result to %rax
        addq	%rcx, %rax          #add %rcx to %rax
        movsd	(%rdx), %xmm0       #copy %rdx to %xmm0
        movsd	%xmm0, (%rax)       #copy %xmm0 to %rax
        addl	$1, -8(%rbp)        #i = i +1
        addl	$1, -4(%rbp)        #j = j + 1
        addl	$1, -12(%rbp)       #count = count + 1
        jmp	.L3                 #jump to .L3
.L2:
        movq	-24(%rbp), %rax         #copy result to %rax
        addq	$64, %rsp               #add 64 to %rsp
        popq	%rbp                    #prepare to leave the function
        ret                             #pop return address from stack and jump there
        .def	malloc;	.endef
