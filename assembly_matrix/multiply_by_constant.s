.global multiply_by_constant

multiply_by_constant:
push	%rbp               #save %rbp
mov     %rsp,%rbp          #update %rpb (new stack frame)
subq	$16,%rsp           #allocate 16 bytes of space on the stack
mov     %rcx,16(%rbp)      #copy a
mov     %edx,24(%rbp)      #copy n
mov 	%r8d, 32(%rbp)     #copy c
movl    $0,-4(%rbp)        #copy 0 to i

.for_loop_begin:
movl    24(%rbp),%eax      #copy n to %ebx
imull   %eax,%eax          #n*n
cmpl    %eax,-4(%rbp)      #compare n*n and i
jge     .for_loop_end      #if n*n - i < 0 end for loop
movl    -4(%rbp),%eax
leaq    0(,%rax,8),%rdx    #copy i*8 to %rdx
movq    16(%rbp),%rax      #copy a to %rax
addq    %rdx,%rax          #store i*8 in %rax
vmovsd   (%rax),%xmm1       #copy a[i] to %xmm1
mov 32(%rbp),%edx
vcvtsi2sd   %edx, %xmm0, %xmm0  #copy c to %xmm0
vmulsd   %xmm1,%xmm0,%xmm0        #a[i]*c
vmovsd   %xmm0,(%rax)
addl    $1,-4(%rbp)        #++i
jmp     .for_loop_begin    #jump to the beginning of the loop

.for_loop_end:
addq	 $16,%rsp          #give back 16 bytes of stack space
popq     %rbp              #else prepare to leave the function
ret
