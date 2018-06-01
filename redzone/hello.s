
hello.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <test_red>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	c7 45 fc 0a 00 00 00 	movl   $0xa,-0x4(%rbp) // cause rezone no need   allocate stack
   b:	c7 45 f8 14 00 00 00 	movl   $0x14,-0x8(%rbp)
  12:	c7 45 f4 10 00 00 00 	movl   $0x10,-0xc(%rbp)
  19:	8b 45 f8             	mov    -0x8(%rbp),%eax
  1c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  1f:	01 c2                	add    %eax,%edx
  21:	8b 45 f4             	mov    -0xc(%rbp),%eax
  24:	01 d0                	add    %edx,%eax
  26:	5d                   	pop    %rbp
  27:	c3                   	retq   

0000000000000028 <test_red_zone>:
  28:	55                   	push   %rbp
  29:	48 89 e5             	mov    %rsp,%rbp
  2c:	48 83 ec 10          	sub    $0x10,%rsp  // need allocate stack 
  30:	c7 45 fc 0a 00 00 00 	movl   $0xa,-0x4(%rbp)
  37:	c7 45 f8 14 00 00 00 	movl   $0x14,-0x8(%rbp)
  3e:	c7 45 f4 10 00 00 00 	movl   $0x10,-0xc(%rbp)
  45:	b8 00 00 00 00       	mov    $0x0,%eax
  4a:	e8 00 00 00 00       	callq  4f <test_red_zone+0x27>
  4f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  52:	8b 55 fc             	mov    -0x4(%rbp),%edx
  55:	01 c2                	add    %eax,%edx
  57:	8b 45 f4             	mov    -0xc(%rbp),%eax
  5a:	01 d0                	add    %edx,%eax
  5c:	c9                   	leaveq 
  5d:	c3                   	retq   

000000000000005e <main>:
  5e:	55                   	push   %rbp
  5f:	48 89 e5             	mov    %rsp,%rbp
  62:	b8 00 00 00 00       	mov    $0x0,%eax
  67:	e8 00 00 00 00       	callq  6c <main+0xe>
  6c:	89 c6                	mov    %eax,%esi
  6e:	bf 00 00 00 00       	mov    $0x0,%edi
  73:	b8 00 00 00 00       	mov    $0x0,%eax
  78:	e8 00 00 00 00       	callq  7d <main+0x1f>
  7d:	5d                   	pop    %rbp
  7e:	c3                   	retq   
