.global addition_matrix

addition_matrix:

push   %rbp
mov    %rsp,%rbp
sub    $0x30,%rsp
mov    %rdi,-0x28(%rbp)
mov    %rsi,-0x20(%rbp)
mov    %rdx,-0x18(%rbp)
mov    %ecx,-0x10(%rbp)
movl   $0x0,-0x30(%rbp)
mov    -0x30(%rbp),%eax
mov    -0x10(%rbp),%edx
cmp    %edx,%eax
jl     40113e <addition_matrix+0x3a>
jmp    4011ab <addition_matrix+0xa7>
mov    $0x1,%eax
add    -0x30(%rbp),%eax
mov    %eax,-0x30(%rbp)
jmp    401122 <addition_matrix+0x1e>
movl   $0x0,-0x2c(%rbp)
mov    -0x2c(%rbp),%eax
mov    -0x10(%rbp),%edx
cmp    %edx,%eax
jge    401131 <addition_matrix+0x2d>
mov    -0x10(%rbp),%eax
imul   -0x2c(%rbp),%eax
add    -0x30(%rbp),%eax
movslq %eax,%rax
imul   $0x8,%rax,%rax
add    -0x28(%rbp),%rax
mov    -0x10(%rbp),%edx
imul   -0x2c(%rbp),%edx
add    -0x30(%rbp),%edx
movslq %edx,%rdx
imul   $0x8,%rdx,%rdx
add    -0x20(%rbp),%rdx
movsd  (%rax),%xmm0
movsd  (%rdx),%xmm1
addsd  %xmm1,%xmm0
mov    -0x10(%rbp),%eax
imul   -0x2c(%rbp),%eax
add    -0x30(%rbp),%eax
movslq %eax,%rax
imul   $0x8,%rax,%rax
add    -0x18(%rbp),%rax
movsd  %xmm0,(%rax)
mov    $0x1,%eax
add    -0x2c(%rbp),%eax
mov    %eax,-0x2c(%rbp)
jmp    401145 <addition_matrix+0x41>
leave
ret
main:
push   %rbp
mov    %rsp,%rbp
mov    $0x0,%eax
leave
ret
nopl   0x0(%rax,%rax,1)
