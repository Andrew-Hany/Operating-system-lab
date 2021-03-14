	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 1
	.globl	___sputc                ## -- Begin function __sputc
	.p2align	4, 0x90
___sputc:                               ## @__sputc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	12(%rax), %ecx
	addl	$-1, %ecx
	movl	%ecx, 12(%rax)
	cmpl	$0, %ecx
	jge	LBB0_3
## %bb.1:
	movq	-16(%rbp), %rax
	movl	12(%rax), %ecx
	movq	-16(%rbp), %rax
	cmpl	40(%rax), %ecx
	jl	LBB0_4
## %bb.2:
	movl	-8(%rbp), %eax
                                        ## kill: def $al killed $al killed $eax
	movsbl	%al, %ecx
	cmpl	$10, %ecx
	je	LBB0_4
LBB0_3:
	movl	-8(%rbp), %eax
                                        ## kill: def $al killed $al killed $eax
	movq	-16(%rbp), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	%rsi, (%rcx)
	movb	%al, (%rdx)
	movzbl	%al, %edi
	movl	%edi, -4(%rbp)
	jmp	LBB0_5
LBB0_4:
	movl	-8(%rbp), %edi
	movq	-16(%rbp), %rsi
	callq	___swbuf
	movl	%eax, -4(%rbp)
LBB0_5:
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	___darwin_check_fd_set  ## -- Begin function __darwin_check_fd_set
	.p2align	4, 0x90
___darwin_check_fd_set:                 ## @__darwin_check_fd_set
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	___darwin_check_fd_set_overflow@GOTPCREL(%rip), %rax
	testq	%rax, %rax
	je	LBB1_2
	jmp	LBB1_1
LBB1_1:
	xorl	%edx, %edx
	movl	-8(%rbp), %edi
	movq	-16(%rbp), %rsi
	callq	___darwin_check_fd_set_overflow
	movl	%eax, -4(%rbp)
	jmp	LBB1_3
LBB1_2:
	movl	$1, -4(%rbp)
LBB1_3:
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	___darwin_fd_isset      ## -- Begin function __darwin_fd_isset
	.p2align	4, 0x90
___darwin_fd_isset:                     ## @__darwin_fd_isset
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	%edi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	-24(%rbp), %eax
	movq	-32(%rbp), %rcx
	movl	%eax, -8(%rbp)
	movq	%rcx, -16(%rbp)
	movq	___darwin_check_fd_set_overflow@GOTPCREL(%rip), %rcx
	testq	%rcx, %rcx
	je	LBB2_2
	jmp	LBB2_1
LBB2_1:
	xorl	%edx, %edx
	movl	-8(%rbp), %edi
	movq	-16(%rbp), %rsi
	callq	___darwin_check_fd_set_overflow
	movl	%eax, -4(%rbp)
	jmp	LBB2_3
LBB2_2:
	movl	$1, -4(%rbp)
LBB2_3:
	cmpl	$0, -4(%rbp)
	je	LBB2_5
## %bb.4:
	movq	-32(%rbp), %rax
	movslq	-24(%rbp), %rcx
	shrq	$5, %rcx
	movl	(%rax,%rcx,4), %edx
	movslq	-24(%rbp), %rax
	andq	$31, %rax
	movq	%rax, %rcx
                                        ## kill: def $cl killed $rcx
	movl	$1, %eax
	shlq	%cl, %rax
                                        ## kill: def $eax killed $eax killed $rax
	andl	%eax, %edx
	movl	%edx, -20(%rbp)
	jmp	LBB2_6
LBB2_5:
	movl	$0, -20(%rbp)
LBB2_6:
	movl	-20(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	___darwin_fd_set        ## -- Begin function __darwin_fd_set
	.p2align	4, 0x90
___darwin_fd_set:                       ## @__darwin_fd_set
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	-20(%rbp), %eax
	movq	-32(%rbp), %rcx
	movl	%eax, -8(%rbp)
	movq	%rcx, -16(%rbp)
	movq	___darwin_check_fd_set_overflow@GOTPCREL(%rip), %rcx
	testq	%rcx, %rcx
	je	LBB3_2
	jmp	LBB3_1
LBB3_1:
	xorl	%edx, %edx
	movl	-8(%rbp), %edi
	movq	-16(%rbp), %rsi
	callq	___darwin_check_fd_set_overflow
	movl	%eax, -4(%rbp)
	jmp	LBB3_3
LBB3_2:
	movl	$1, -4(%rbp)
LBB3_3:
	cmpl	$0, -4(%rbp)
	je	LBB3_5
## %bb.4:
	movslq	-20(%rbp), %rax
	andq	$31, %rax
	movq	%rax, %rcx
                                        ## kill: def $cl killed $rcx
	movl	$1, %eax
	shlq	%cl, %rax
                                        ## kill: def $eax killed $eax killed $rax
	movq	-32(%rbp), %rdx
	movslq	-20(%rbp), %rsi
	shrq	$5, %rsi
	orl	(%rdx,%rsi,4), %eax
	movl	%eax, (%rdx,%rsi,4)
LBB3_5:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	___darwin_fd_clr        ## -- Begin function __darwin_fd_clr
	.p2align	4, 0x90
___darwin_fd_clr:                       ## @__darwin_fd_clr
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	-20(%rbp), %eax
	movq	-32(%rbp), %rcx
	movl	%eax, -8(%rbp)
	movq	%rcx, -16(%rbp)
	movq	___darwin_check_fd_set_overflow@GOTPCREL(%rip), %rcx
	testq	%rcx, %rcx
	je	LBB4_2
	jmp	LBB4_1
LBB4_1:
	xorl	%edx, %edx
	movl	-8(%rbp), %edi
	movq	-16(%rbp), %rsi
	callq	___darwin_check_fd_set_overflow
	movl	%eax, -4(%rbp)
	jmp	LBB4_3
LBB4_2:
	movl	$1, -4(%rbp)
LBB4_3:
	cmpl	$0, -4(%rbp)
	je	LBB4_5
## %bb.4:
	movslq	-20(%rbp), %rax
	andq	$31, %rax
	movq	%rax, %rcx
                                        ## kill: def $cl killed $rcx
	movl	$1, %eax
	shlq	%cl, %rax
                                        ## kill: def $eax killed $eax killed $rax
	xorl	$-1, %eax
	movq	-32(%rbp), %rdx
	movslq	-20(%rbp), %rsi
	shrq	$5, %rsi
	andl	(%rdx,%rsi,4), %eax
	movl	%eax, (%rdx,%rsi,4)
LBB4_5:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_read_command           ## -- Begin function read_command
	.p2align	4, 0x90
_read_command:                          ## @read_command
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	___stdinp@GOTPCREL(%rip), %rax
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movq	(%rax), %rdx
	movl	$1024, %esi             ## imm = 0x400
	callq	_fgets
	cmpq	$0, %rax
	jne	LBB5_2
## %bb.1:
	movq	$0, -8(%rbp)
	jmp	LBB5_5
LBB5_2:
	movq	-16(%rbp), %rdi
	callq	_strlen
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rcx
	subq	$1, %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$10, %edx
	jne	LBB5_4
## %bb.3:
	movq	-16(%rbp), %rax
	movq	-24(%rbp), %rcx
	subq	$1, %rcx
	movb	$0, (%rax,%rcx)
LBB5_4:
	movq	-16(%rbp), %rdi
	callq	_strlen
	movq	%rax, -8(%rbp)
LBB5_5:
	movq	-8(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_build_args             ## -- Begin function build_args
	.p2align	4, 0x90
_build_args:                            ## @build_args
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	leaq	L_.str(%rip), %rsi
	callq	_strtok
	movq	%rax, -24(%rbp)
	movl	$0, -28(%rbp)
LBB6_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpq	$0, -24(%rbp)
	je	LBB6_3
## %bb.2:                               ##   in Loop: Header=BB6_1 Depth=1
	xorl	%eax, %eax
	movl	%eax, %edi
	movq	-24(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movslq	-28(%rbp), %rsi
	movq	%rcx, (%rdx,%rsi,8)
	leaq	L_.str(%rip), %rsi
	callq	_strtok
	movq	%rax, -24(%rbp)
	movl	-28(%rbp), %r8d
	addl	$1, %r8d
	movl	%r8d, -28(%rbp)
	jmp	LBB6_1
LBB6_3:
	movq	-16(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movq	$0, (%rax,%rcx,8)
	movl	-28(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_set_program_path       ## -- Begin function set_program_path
	.p2align	4, 0x90
_set_program_path:                      ## @set_program_path
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	xorl	%eax, %eax
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rdi
	movl	%eax, %esi
	movl	$1024, %edx             ## imm = 0x400
	movq	$-1, %rcx
	callq	___memset_chk
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	$-1, %rdx
	movq	%rax, -40(%rbp)         ## 8-byte Spill
	callq	___strcpy_chk
	movq	-8(%rbp), %rdi
	movq	-24(%rbp), %rsi
	movq	$-1, %rdx
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	callq	___strcat_chk
	movl	$0, -28(%rbp)
LBB7_1:                                 ## =>This Inner Loop Header: Depth=1
	movslq	-28(%rbp), %rax
	movq	-8(%rbp), %rdi
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	callq	_strlen
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	cmpq	%rax, %rcx
	jae	LBB7_6
## %bb.2:                               ##   in Loop: Header=BB7_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$10, %edx
	jne	LBB7_4
## %bb.3:                               ##   in Loop: Header=BB7_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movb	$0, (%rax,%rcx)
LBB7_4:                                 ##   in Loop: Header=BB7_1 Depth=1
	jmp	LBB7_5
LBB7_5:                                 ##   in Loop: Header=BB7_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB7_1
LBB7_6:
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_change_dir             ## -- Begin function change_dir
	.p2align	4, 0x90
_change_dir:                            ## @change_dir
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$128, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	%rdi, -120(%rbp)
	movq	%rsi, -128(%rbp)
	movq	-128(%rbp), %rdi
	leaq	L_.str.1(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB8_2
## %bb.1:
	leaq	L_.str.2(%rip), %rdi
	callq	_getenv
	movq	%rax, %rdi
	callq	_chdir
	jmp	LBB8_5
LBB8_2:
	movq	-128(%rbp), %rdi
	callq	_chdir
	cmpl	$0, %eax
	je	LBB8_4
## %bb.3:
	leaq	L_.str.3(%rip), %rdi
	callq	_perror
LBB8_4:
	jmp	LBB8_5
LBB8_5:
	leaq	-112(%rbp), %rdi
	movl	$100, %esi
	callq	_getcwd
	leaq	L_.str.4(%rip), %rdi
	movq	%rax, %rsi
	movb	$0, %al
	callq	_printf
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	-8(%rbp), %rdx
	cmpq	%rdx, %rcx
	jne	LBB8_7
## %bb.6:
	addq	$128, %rsp
	popq	%rbp
	retq
LBB8_7:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_check_for_redirection  ## -- Begin function check_for_redirection
	.p2align	4, 0x90
_check_for_redirection:                 ## @check_for_redirection
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movl	$0, -20(%rbp)
LBB9_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	cmpq	$0, (%rax,%rcx,8)
	je	LBB9_5
## %bb.2:                               ##   in Loop: Header=BB9_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	leaq	L_.str.5(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB9_4
## %bb.3:
	movb	$1, -1(%rbp)
	jmp	LBB9_6
LBB9_4:                                 ##   in Loop: Header=BB9_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB9_1
LBB9_5:
	movb	$0, -1(%rbp)
LBB9_6:
	movb	-1(%rbp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_deleteUtil             ## -- Begin function deleteUtil
	.p2align	4, 0x90
_deleteUtil:                            ## @deleteUtil
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
LBB10_1:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB10_3 Depth 2
	movq	-8(%rbp), %rax
	movslq	-12(%rbp), %rcx
	cmpq	$0, (%rax,%rcx,8)
	je	LBB10_6
## %bb.2:                               ##   in Loop: Header=BB10_1 Depth=1
	movl	-12(%rbp), %eax
	movl	%eax, -16(%rbp)
LBB10_3:                                ##   Parent Loop BB10_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	-8(%rbp), %rax
	movslq	-16(%rbp), %rcx
	cmpq	$0, (%rax,%rcx,8)
	je	LBB10_5
## %bb.4:                               ##   in Loop: Header=BB10_3 Depth=2
	movq	-8(%rbp), %rax
	movl	-16(%rbp), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	-8(%rbp), %rdx
	movslq	-16(%rbp), %rsi
	movq	%rax, (%rdx,%rsi,8)
	movl	-16(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -16(%rbp)
	jmp	LBB10_3
LBB10_5:                                ##   in Loop: Header=BB10_1 Depth=1
	jmp	LBB10_1
LBB10_6:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_getfile                ## -- Begin function getfile
	.p2align	4, 0x90
_getfile:                               ## @getfile
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	$-1, -20(%rbp)
	movb	$0, -21(%rbp)
	movl	$0, -28(%rbp)
LBB11_1:                                ## =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	movslq	-28(%rbp), %rcx
	cmpq	$0, (%rax,%rcx,8)
	je	LBB11_7
## %bb.2:                               ##   in Loop: Header=BB11_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	leaq	L_.str.5(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB11_4
## %bb.3:                               ##   in Loop: Header=BB11_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	movb	$1, -21(%rbp)
	movq	-8(%rbp), %rcx
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %rdx
	movq	(%rcx,%rdx,8), %rcx
	movq	%rcx, -16(%rbp)
LBB11_4:                                ##   in Loop: Header=BB11_1 Depth=1
	testb	$1, -21(%rbp)
	je	LBB11_6
## %bb.5:                               ##   in Loop: Header=BB11_1 Depth=1
	movq	-8(%rbp), %rdi
	movl	-28(%rbp), %esi
	callq	_deleteUtil
LBB11_6:                                ##   in Loop: Header=BB11_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB11_1
LBB11_7:
	movq	-16(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_check_for_redirection_input ## -- Begin function check_for_redirection_input
	.p2align	4, 0x90
_check_for_redirection_input:           ## @check_for_redirection_input
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movl	$0, -20(%rbp)
LBB12_1:                                ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	cmpq	$0, (%rax,%rcx,8)
	je	LBB12_5
## %bb.2:                               ##   in Loop: Header=BB12_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	leaq	L_.str.6(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB12_4
## %bb.3:
	movb	$1, -1(%rbp)
	jmp	LBB12_6
LBB12_4:                                ##   in Loop: Header=BB12_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB12_1
LBB12_5:
	movb	$0, -1(%rbp)
LBB12_6:
	movb	-1(%rbp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_deleteUtil_input       ## -- Begin function deleteUtil_input
	.p2align	4, 0x90
_deleteUtil_input:                      ## @deleteUtil_input
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
LBB13_1:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB13_5 Depth 2
	xorl	%eax, %eax
                                        ## kill: def $al killed $al killed $eax
	movq	-8(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	cmpq	$0, (%rcx,%rdx,8)
	movb	%al, -17(%rbp)          ## 1-byte Spill
	je	LBB13_3
## %bb.2:                               ##   in Loop: Header=BB13_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	leaq	L_.str.5(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	setne	%dl
	movb	%dl, -17(%rbp)          ## 1-byte Spill
LBB13_3:                                ##   in Loop: Header=BB13_1 Depth=1
	movb	-17(%rbp), %al          ## 1-byte Reload
	testb	$1, %al
	jne	LBB13_4
	jmp	LBB13_8
LBB13_4:                                ##   in Loop: Header=BB13_1 Depth=1
	movl	-12(%rbp), %eax
	movl	%eax, -16(%rbp)
LBB13_5:                                ##   Parent Loop BB13_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	-8(%rbp), %rax
	movslq	-16(%rbp), %rcx
	cmpq	$0, (%rax,%rcx,8)
	je	LBB13_7
## %bb.6:                               ##   in Loop: Header=BB13_5 Depth=2
	movq	-8(%rbp), %rax
	movl	-16(%rbp), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	-8(%rbp), %rdx
	movslq	-16(%rbp), %rsi
	movq	%rax, (%rdx,%rsi,8)
	movl	-16(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -16(%rbp)
	jmp	LBB13_5
LBB13_7:                                ##   in Loop: Header=BB13_1 Depth=1
	jmp	LBB13_1
LBB13_8:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_getfile_input          ## -- Begin function getfile_input
	.p2align	4, 0x90
_getfile_input:                         ## @getfile_input
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	$-1, -20(%rbp)
	movb	$0, -21(%rbp)
	movl	$0, -28(%rbp)
LBB14_1:                                ## =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	movslq	-28(%rbp), %rcx
	cmpq	$0, (%rax,%rcx,8)
	je	LBB14_7
## %bb.2:                               ##   in Loop: Header=BB14_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	leaq	L_.str.6(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB14_4
## %bb.3:                               ##   in Loop: Header=BB14_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	movb	$1, -21(%rbp)
	movq	-8(%rbp), %rcx
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %rdx
	movq	(%rcx,%rdx,8), %rcx
	movq	%rcx, -16(%rbp)
LBB14_4:                                ##   in Loop: Header=BB14_1 Depth=1
	testb	$1, -21(%rbp)
	je	LBB14_6
## %bb.5:                               ##   in Loop: Header=BB14_1 Depth=1
	movq	-8(%rbp), %rdi
	movl	-28(%rbp), %esi
	callq	_deleteUtil_input
LBB14_6:                                ##   in Loop: Header=BB14_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	LBB14_1
LBB14_7:
	movq	-16(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_input_redirection      ## -- Begin function input_redirection
	.p2align	4, 0x90
_input_redirection:                     ## @input_redirection
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	xorl	%esi, %esi
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movb	$0, %al
	callq	_open
	xorl	%esi, %esi
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %edi
	callq	_dup2
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_Multiple_pipe          ## -- Begin function Multiple_pipe
	.p2align	4, 0x90
_Multiple_pipe:                         ## @Multiple_pipe
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$192, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	%rdi, -16(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -24(%rbp)
LBB16_1:                                ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	cmpq	$0, (%rax,%rcx,8)
	je	LBB16_5
## %bb.2:                               ##   in Loop: Header=BB16_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	leaq	L_.str.7(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB16_4
## %bb.3:                               ##   in Loop: Header=BB16_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
LBB16_4:                                ##   in Loop: Header=BB16_1 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB16_1
LBB16_5:
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %ecx
	shlq	$13, %rcx
	movq	%rcx, %rdi
	callq	_malloc
	movq	%rax, -32(%rbp)
	movl	$0, -24(%rbp)
	movl	$0, -36(%rbp)
	movl	$0, -40(%rbp)
LBB16_6:                                ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	cmpq	$0, (%rax,%rcx,8)
	je	LBB16_11
## %bb.7:                               ##   in Loop: Header=BB16_6 Depth=1
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	leaq	L_.str.7(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	je	LBB16_9
## %bb.8:                               ##   in Loop: Header=BB16_6 Depth=1
	movq	-16(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movq	-32(%rbp), %rcx
	movslq	-36(%rbp), %rdx
	shlq	$13, %rdx
	addq	%rdx, %rcx
	movslq	-40(%rbp), %rdx
	movq	%rax, (%rcx,%rdx,8)
	movl	-40(%rbp), %esi
	addl	$1, %esi
	movl	%esi, -40(%rbp)
	jmp	LBB16_10
LBB16_9:                                ##   in Loop: Header=BB16_6 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	movl	$0, -40(%rbp)
LBB16_10:                               ##   in Loop: Header=BB16_6 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB16_6
LBB16_11:
	movl	-20(%rbp), %eax
	decl	%eax
	movl	%eax, -44(%rbp)
	movl	-44(%rbp), %eax
	movl	%eax, %ecx
	movq	%rsp, %rdx
	movq	%rdx, -56(%rbp)
	leaq	15(,%rcx,8), %rdx
	andq	$-16, %rdx
	movq	%rdx, %rax
	movq	%rcx, -112(%rbp)        ## 8-byte Spill
	callq	____chkstk_darwin
	subq	%rax, %rsp
	movq	%rsp, %rax
	movq	-112(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -64(%rbp)
	movl	-44(%rbp), %esi
	movl	%esi, %edx
	leaq	15(,%rdx,4), %rdi
	andq	$-16, %rdi
	movq	%rax, -120(%rbp)        ## 8-byte Spill
	movq	%rdi, %rax
	movq	%rdx, -128(%rbp)        ## 8-byte Spill
	callq	____chkstk_darwin
	subq	%rax, %rsp
	movq	%rsp, %rax
	movq	-128(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, -72(%rbp)
	movl	$0, -76(%rbp)
	movq	%rax, -136(%rbp)        ## 8-byte Spill
LBB16_12:                               ## =>This Inner Loop Header: Depth=1
	movl	-76(%rbp), %eax
	movl	-44(%rbp), %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jg	LBB16_15
## %bb.13:                              ##   in Loop: Header=BB16_12 Depth=1
	movslq	-76(%rbp), %rax
	shlq	$3, %rax
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	addq	%rax, %rcx
	movq	%rcx, %rdi
	callq	_pipe
## %bb.14:                              ##   in Loop: Header=BB16_12 Depth=1
	movl	-76(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -76(%rbp)
	jmp	LBB16_12
LBB16_15:
	movl	$0, -24(%rbp)
LBB16_16:                               ## =>This Inner Loop Header: Depth=1
	movl	-24(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jge	LBB16_28
## %bb.17:                              ##   in Loop: Header=BB16_16 Depth=1
	callq	_fork
	movslq	-24(%rbp), %rcx
	movq	-136(%rbp), %rdx        ## 8-byte Reload
	movl	%eax, (%rdx,%rcx,4)
	movslq	-24(%rbp), %rcx
	cmpl	$0, (%rdx,%rcx,4)
	jne	LBB16_26
## %bb.18:
	movl	$0, -80(%rbp)
LBB16_19:                               ## =>This Inner Loop Header: Depth=1
	movl	-80(%rbp), %eax
	movl	-44(%rbp), %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jg	LBB16_25
## %bb.20:                              ##   in Loop: Header=BB16_19 Depth=1
	movl	-80(%rbp), %eax
	cmpl	-24(%rbp), %eax
	je	LBB16_22
## %bb.21:                              ##   in Loop: Header=BB16_19 Depth=1
	movslq	-80(%rbp), %rax
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movl	(%rcx,%rax,8), %edi
	callq	_close
LBB16_22:                               ##   in Loop: Header=BB16_19 Depth=1
	movl	-80(%rbp), %eax
	movl	-24(%rbp), %ecx
	addl	$1, %ecx
	cmpl	%ecx, %eax
	je	LBB16_24
## %bb.23:                              ##   in Loop: Header=BB16_19 Depth=1
	movslq	-80(%rbp), %rax
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movl	4(%rcx,%rax,8), %edi
	callq	_close
LBB16_24:                               ##   in Loop: Header=BB16_19 Depth=1
	movl	-80(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -80(%rbp)
	jmp	LBB16_19
LBB16_25:
	movslq	-24(%rbp), %rax
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movl	(%rcx,%rax,8), %edi
	xorl	%esi, %esi
	callq	_dup2
	movslq	-24(%rbp), %rcx
	movq	-120(%rbp), %rdx        ## 8-byte Reload
	movl	12(%rdx,%rcx,8), %edi
	movl	$1, %esi
	movl	%esi, -140(%rbp)        ## 4-byte Spill
	movl	%eax, -144(%rbp)        ## 4-byte Spill
	callq	_dup2
	movq	-32(%rbp), %rcx
	movslq	-24(%rbp), %rdx
	shlq	$13, %rdx
	leaq	8192(%rdx,%rcx), %rsi
	movq	8192(%rdx,%rcx), %rdi
	movl	%eax, -148(%rbp)        ## 4-byte Spill
	callq	_execvp
	movl	-140(%rbp), %edi        ## 4-byte Reload
	movl	%eax, -152(%rbp)        ## 4-byte Spill
	callq	_exit
LBB16_26:                               ##   in Loop: Header=BB16_16 Depth=1
	jmp	LBB16_27
LBB16_27:                               ##   in Loop: Header=BB16_16 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB16_16
LBB16_28:
	movl	$0, -84(%rbp)
LBB16_29:                               ## =>This Inner Loop Header: Depth=1
	movl	-84(%rbp), %eax
	movl	-44(%rbp), %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jg	LBB16_35
## %bb.30:                              ##   in Loop: Header=BB16_29 Depth=1
	movl	-84(%rbp), %eax
	movl	-44(%rbp), %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	je	LBB16_32
## %bb.31:                              ##   in Loop: Header=BB16_29 Depth=1
	movslq	-84(%rbp), %rax
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movl	(%rcx,%rax,8), %edi
	callq	_close
LBB16_32:                               ##   in Loop: Header=BB16_29 Depth=1
	cmpl	$0, -84(%rbp)
	je	LBB16_34
## %bb.33:                              ##   in Loop: Header=BB16_29 Depth=1
	movslq	-84(%rbp), %rax
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movl	4(%rcx,%rax,8), %edi
	callq	_close
LBB16_34:                               ##   in Loop: Header=BB16_29 Depth=1
	movl	-84(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -84(%rbp)
	jmp	LBB16_29
LBB16_35:
	callq	_fork
	movl	%eax, -88(%rbp)
	cmpl	$0, -88(%rbp)
	jne	LBB16_39
## %bb.36:
	leaq	L_.str.8(%rip), %rdi
	movb	$0, %al
	callq	_printf
	leaq	L_.str.8(%rip), %rdi
	movl	%eax, -156(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.8(%rip), %rdi
	movl	%eax, -160(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.8(%rip), %rdi
	movl	%eax, -164(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	movl	4(%rcx), %edi
	movl	$1, %esi
	movl	%eax, -168(%rbp)        ## 4-byte Spill
	callq	_dup2
	xorl	%esi, %esi
	movl	-44(%rbp), %edx
	subl	$1, %edx
	movslq	%edx, %rcx
	movq	-120(%rbp), %r8         ## 8-byte Reload
	movl	(%r8,%rcx,8), %edi
	movl	%eax, -172(%rbp)        ## 4-byte Spill
	callq	_dup2
	movq	-32(%rbp), %rdi
	movl	%eax, -176(%rbp)        ## 4-byte Spill
	callq	_check_for_redirection_input
	testb	$1, %al
	jne	LBB16_37
	jmp	LBB16_38
LBB16_37:
	movq	-32(%rbp), %rdi
	callq	_getfile_input
	movq	%rax, -104(%rbp)
	movq	-104(%rbp), %rdi
	callq	_input_redirection
LBB16_38:
	movq	-32(%rbp), %rax
	movq	(%rax), %rdi
	movq	%rax, %rsi
	callq	_execvp
	movl	$1, %edi
	movl	%eax, -180(%rbp)        ## 4-byte Spill
	callq	_exit
LBB16_39:
	xorl	%eax, %eax
	movl	%eax, %edi
	callq	_wait
## %bb.40:
	movq	-56(%rbp), %rax
	movq	%rax, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB16_42
## %bb.41:
	movq	%rbp, %rsp
	popq	%rbp
	retq
LBB16_42:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_pipe_check             ## -- Begin function pipe_check
	.p2align	4, 0x90
_pipe_check:                            ## @pipe_check
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movl	$0, -20(%rbp)
LBB17_1:                                ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	cmpq	$0, (%rax,%rcx,8)
	je	LBB17_5
## %bb.2:                               ##   in Loop: Header=BB17_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	leaq	L_.str.7(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB17_4
## %bb.3:
	movb	$1, -1(%rbp)
	jmp	LBB17_6
LBB17_4:                                ##   in Loop: Header=BB17_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB17_1
LBB17_5:
	movb	$0, -1(%rbp)
LBB17_6:
	movb	-1(%rbp), %al
	andb	$1, %al
	movzbl	%al, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_Parsing_assignments    ## -- Begin function Parsing_assignments
	.p2align	4, 0x90
_Parsing_assignments:                   ## @Parsing_assignments
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$272, %rsp              ## imm = 0x110
	xorl	%eax, %eax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	%rcx, -8(%rbp)
	movq	%rdi, -232(%rbp)
	movl	$0, -236(%rbp)
	leaq	-112(%rbp), %rcx
	movq	%rcx, %rdi
	movl	%eax, %esi
	movl	$100, %ecx
	movq	%rcx, %rdx
	movl	%eax, -252(%rbp)        ## 4-byte Spill
	movq	%rcx, -264(%rbp)        ## 8-byte Spill
	callq	_memset
	movl	$1, -240(%rbp)
	movl	$0, -244(%rbp)
	leaq	-224(%rbp), %rcx
	movq	%rcx, %rdi
	movl	-252(%rbp), %esi        ## 4-byte Reload
	movq	-264(%rbp), %rdx        ## 8-byte Reload
	callq	_memset
LBB18_1:                                ## =>This Inner Loop Header: Depth=1
	movq	-232(%rbp), %rax
	movslq	-236(%rbp), %rcx
	cmpq	$0, (%rax,%rcx,8)
	je	LBB18_8
## %bb.2:                               ##   in Loop: Header=BB18_1 Depth=1
	movq	-232(%rbp), %rax
	movslq	-236(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	leaq	L_.str.9(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB18_7
## %bb.3:
	movl	-236(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -248(%rbp)
LBB18_4:                                ## =>This Inner Loop Header: Depth=1
	movq	-232(%rbp), %rax
	movslq	-248(%rbp), %rcx
	cmpq	$0, (%rax,%rcx,8)
	je	LBB18_6
## %bb.5:                               ##   in Loop: Header=BB18_4 Depth=1
	leaq	-224(%rbp), %rdi
	movq	-232(%rbp), %rax
	movslq	-248(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	movl	$100, %edx
	callq	___strcat_chk
	leaq	-224(%rbp), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$100, %edx
	movq	%rax, -272(%rbp)        ## 8-byte Spill
	callq	___strcat_chk
	movl	-248(%rbp), %r8d
	addl	$1, %r8d
	movl	%r8d, -248(%rbp)
	jmp	LBB18_4
LBB18_6:
	leaq	-224(%rbp), %rsi
	movq	-232(%rbp), %rax
	movl	-236(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rdx
	movq	(%rax,%rdx,8), %rdi
	movl	$1, %edx
	callq	_setenv
	jmp	LBB18_8
LBB18_7:                                ##   in Loop: Header=BB18_1 Depth=1
	movl	-236(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -236(%rbp)
	jmp	LBB18_1
LBB18_8:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB18_10
## %bb.9:
	addq	$272, %rsp              ## imm = 0x110
	popq	%rbp
	retq
LBB18_10:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_echo_parse             ## -- Begin function echo_parse
	.p2align	4, 0x90
_echo_parse:                            ## @echo_parse
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$8608, %eax             ## imm = 0x21A0
	callq	____chkstk_darwin
	subq	%rax, %rsp
	xorl	%eax, %eax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	%rcx, -8(%rbp)
	movq	%rdi, -8536(%rbp)
	leaq	-112(%rbp), %rcx
	movq	%rcx, %rdi
	movl	%eax, %esi
	movl	$100, %ecx
	movq	%rcx, %rdx
	movl	%eax, -8564(%rbp)       ## 4-byte Spill
	movq	%rcx, -8576(%rbp)       ## 8-byte Spill
	callq	_memset
	leaq	-224(%rbp), %rcx
	movq	%rcx, %rdi
	movl	-8564(%rbp), %esi       ## 4-byte Reload
	movq	-8576(%rbp), %rdx       ## 8-byte Reload
	callq	_memset
	movl	$1, -8548(%rbp)
	movq	-8536(%rbp), %rcx
	movq	(%rcx), %rdi
	leaq	L_.str.10(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB19_18
## %bb.1:
	movq	-8536(%rbp), %rax
	movq	8(%rax), %rax
	movsbl	(%rax), %ecx
	cmpl	$36, %ecx
	jne	LBB19_17
## %bb.2:
	jmp	LBB19_3
LBB19_3:                                ## =>This Inner Loop Header: Depth=1
	movq	-8536(%rbp), %rax
	movq	8(%rax), %rax
	movslq	-8548(%rbp), %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$0, %edx
	je	LBB19_5
## %bb.4:                               ##   in Loop: Header=BB19_3 Depth=1
	movq	-8536(%rbp), %rax
	movq	8(%rax), %rax
	movslq	-8548(%rbp), %rcx
	movb	(%rax,%rcx), %dl
	movl	-8548(%rbp), %esi
	subl	$1, %esi
	movslq	%esi, %rax
	movb	%dl, -112(%rbp,%rax)
	movl	-8548(%rbp), %esi
	addl	$1, %esi
	movl	%esi, -8548(%rbp)
	jmp	LBB19_3
LBB19_5:
	leaq	-112(%rbp), %rdi
	callq	_getenv
	xorl	%esi, %esi
	movq	%rax, -8544(%rbp)
	movl	$1, -8552(%rbp)
	movl	$0, -8556(%rbp)
	leaq	-336(%rbp), %rax
	movq	%rax, %rdi
	movl	$100, %edx
	callq	_memset
	movq	-8544(%rbp), %rax
	movsbl	(%rax), %ecx
	cmpl	$96, %ecx
	jne	LBB19_13
## %bb.6:
	jmp	LBB19_7
LBB19_7:                                ## =>This Inner Loop Header: Depth=1
	movq	-8544(%rbp), %rax
	movslq	-8552(%rbp), %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$96, %edx
	je	LBB19_9
## %bb.8:                               ##   in Loop: Header=BB19_7 Depth=1
	movq	-8544(%rbp), %rax
	movslq	-8552(%rbp), %rcx
	movb	(%rax,%rcx), %dl
	movslq	-8556(%rbp), %rax
	movb	%dl, -336(%rbp,%rax)
	movl	-8552(%rbp), %esi
	addl	$1, %esi
	movl	%esi, -8552(%rbp)
	movl	-8556(%rbp), %esi
	addl	$1, %esi
	movl	%esi, -8556(%rbp)
	jmp	LBB19_7
LBB19_9:
	leaq	-8528(%rbp), %rax
	leaq	-336(%rbp), %rdi
	xorl	%esi, %esi
	movq	%rax, %rcx
	movq	%rdi, -8584(%rbp)       ## 8-byte Spill
	movq	%rcx, %rdi
	movl	$8192, %edx             ## imm = 0x2000
	movq	%rax, -8592(%rbp)       ## 8-byte Spill
	callq	_memset
	movq	-8584(%rbp), %rdi       ## 8-byte Reload
	movq	-8592(%rbp), %rsi       ## 8-byte Reload
	callq	_build_args
	movl	$1, -8560(%rbp)
	movq	-8536(%rbp), %rcx
	leaq	L_.str.7(%rip), %rdx
	movq	%rdx, 8(%rcx)
LBB19_10:                               ## =>This Inner Loop Header: Depth=1
	movl	-8560(%rbp), %eax
	subl	$1, %eax
	movslq	%eax, %rcx
	cmpq	$0, -8528(%rbp,%rcx,8)
	je	LBB19_12
## %bb.11:                              ##   in Loop: Header=BB19_10 Depth=1
	movl	-8560(%rbp), %eax
	subl	$1, %eax
	movslq	%eax, %rcx
	movq	-8528(%rbp,%rcx,8), %rcx
	movq	-8536(%rbp), %rdx
	movl	-8560(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %rsi
	movq	%rcx, (%rdx,%rsi,8)
	movl	-8560(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8560(%rbp)
	jmp	LBB19_10
LBB19_12:
	jmp	LBB19_14
LBB19_13:
	movq	-8536(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8544(%rbp), %rax
	movq	-8536(%rbp), %rcx
	movq	%rax, 8(%rcx)
LBB19_14:
	movq	-8536(%rbp), %rdi
	callq	_pipe_check
	testb	$1, %al
	jne	LBB19_15
	jmp	LBB19_16
LBB19_15:
	leaq	L_.str.11(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movq	-8536(%rbp), %rdi
	movl	%eax, -8596(%rbp)       ## 4-byte Spill
	callq	_Multiple_pipe
LBB19_16:
	jmp	LBB19_17
LBB19_17:
	jmp	LBB19_18
LBB19_18:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB19_20
## %bb.19:
	addq	$8608, %rsp             ## imm = 0x21A0
	popq	%rbp
	retq
LBB19_20:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_equality               ## -- Begin function equality
	.p2align	4, 0x90
_equality:                              ## @equality
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -16(%rbp)
	movl	$0, -20(%rbp)
LBB20_1:                                ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$0, %edx
	je	LBB20_5
## %bb.2:                               ##   in Loop: Header=BB20_1 Depth=1
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movsbl	(%rax,%rcx), %edx
	cmpl	$61, %edx
	jne	LBB20_4
## %bb.3:
	movb	$1, -1(%rbp)
	jmp	LBB20_6
LBB20_4:                                ##   in Loop: Header=BB20_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB20_1
LBB20_5:
	movb	$0, -1(%rbp)
LBB20_6:
	movb	-1(%rbp), %al
	andb	$1, %al
	movzbl	%al, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_parsing_equality       ## -- Begin function parsing_equality
	.p2align	4, 0x90
_parsing_equality:                      ## @parsing_equality
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	leaq	L_.str.9(%rip), %rsi
	callq	_strtok
	movq	%rax, -24(%rbp)
	movl	$0, -28(%rbp)
LBB21_1:                                ## =>This Inner Loop Header: Depth=1
	cmpq	$0, -24(%rbp)
	je	LBB21_3
## %bb.2:                               ##   in Loop: Header=BB21_1 Depth=1
	xorl	%eax, %eax
	movl	%eax, %edi
	movq	-24(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movslq	-28(%rbp), %rsi
	movq	%rcx, (%rdx,%rsi,8)
	leaq	L_.str.9(%rip), %rsi
	callq	_strtok
	movq	%rax, -24(%rbp)
	movl	-28(%rbp), %r8d
	addl	$1, %r8d
	movl	%r8d, -28(%rbp)
	jmp	LBB21_1
LBB21_3:
	movq	-16(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movq	$0, (%rax,%rcx,8)
	movl	-28(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_appending              ## -- Begin function appending
	.p2align	4, 0x90
_appending:                             ## @appending
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, -20(%rbp)
LBB22_1:                                ## =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	cmpq	$0, (%rax,%rcx,8)
	je	LBB22_3
## %bb.2:                               ##   in Loop: Header=BB22_1 Depth=1
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movq	(%rax,%rcx,8), %rsi
	movq	$-1, %rdx
	callq	___strcat_chk
	movq	-8(%rbp), %rdi
	leaq	L_.str(%rip), %rsi
	movq	$-1, %rdx
	movq	%rax, -32(%rbp)         ## 8-byte Spill
	callq	___strcat_chk
	movl	-20(%rbp), %r8d
	addl	$1, %r8d
	movl	%r8d, -20(%rbp)
	jmp	LBB22_1
LBB22_3:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$3056, %rsp             ## imm = 0xBF0
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -2980(%rbp)
	leaq	L_.str.12(%rip), %rax
	movq	%rax, -2992(%rbp)
	leaq	L_.str.2(%rip), %rdi
	callq	_getenv
	movq	%rax, %rdi
	callq	_chdir
LBB23_1:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB23_2 Depth 2
	movl	$0, -3000(%rbp)
LBB23_2:                                ##   Parent Loop BB23_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movslq	-3000(%rbp), %rax
	cmpq	$0, -1840(%rbp,%rax,8)
	je	LBB23_4
## %bb.3:                               ##   in Loop: Header=BB23_2 Depth=2
	movslq	-3000(%rbp), %rax
	movq	$0, -1840(%rbp,%rax,8)
	movl	-3000(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -3000(%rbp)
	jmp	LBB23_2
LBB23_4:                                ##   in Loop: Header=BB23_1 Depth=1
	leaq	L_.str.13(%rip), %rdi
	movb	$0, %al
	callq	_printf
	leaq	-1040(%rbp), %rdi
	movl	%eax, -3032(%rbp)       ## 4-byte Spill
	callq	_read_command
	cmpq	$0, %rax
	jne	LBB23_6
## %bb.5:
	leaq	L_.str.11(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB23_36
LBB23_6:                                ##   in Loop: Header=BB23_1 Depth=1
	leaq	-1040(%rbp), %rdi
	leaq	L_.str.14(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB23_8
## %bb.7:
	jmp	LBB23_36
LBB23_8:                                ##   in Loop: Header=BB23_1 Depth=1
	leaq	-1840(%rbp), %rsi
	leaq	-1040(%rbp), %rdi
	callq	_build_args
	leaq	-2864(%rbp), %rdi
	movl	%eax, -2996(%rbp)
	movq	-2992(%rbp), %rsi
	movq	-1840(%rbp), %rdx
	callq	_set_program_path
	callq	_fork
	movl	%eax, -3028(%rbp)
	cmpl	$0, -3028(%rbp)
	jne	LBB23_34
## %bb.9:                               ##   in Loop: Header=BB23_1 Depth=1
	movq	-1840(%rbp), %rdi
	leaq	L_.str.15(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB23_11
## %bb.10:                              ##   in Loop: Header=BB23_1 Depth=1
	movq	-1840(%rbp), %rdi
	movq	-1832(%rbp), %rsi
	callq	_change_dir
	jmp	LBB23_33
LBB23_11:                               ##   in Loop: Header=BB23_1 Depth=1
	cmpq	$0, -1832(%rbp)
	je	LBB23_14
## %bb.12:                              ##   in Loop: Header=BB23_1 Depth=1
	movq	-1832(%rbp), %rdi
	leaq	L_.str.9(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB23_14
## %bb.13:                              ##   in Loop: Header=BB23_1 Depth=1
	leaq	-1840(%rbp), %rdi
	callq	_Parsing_assignments
	jmp	LBB23_32
LBB23_14:                               ##   in Loop: Header=BB23_1 Depth=1
	movq	-1840(%rbp), %rdi
	callq	_equality
	testb	$1, %al
	jne	LBB23_15
	jmp	LBB23_16
LBB23_15:                               ##   in Loop: Header=BB23_1 Depth=1
	leaq	-1840(%rbp), %rsi
	leaq	-2976(%rbp), %rax
	xorl	%ecx, %ecx
	movq	%rax, %rdx
	movq	%rdx, %rdi
	movq	%rsi, -3040(%rbp)       ## 8-byte Spill
	movl	%ecx, %esi
	movl	$100, %edx
	movq	%rax, -3048(%rbp)       ## 8-byte Spill
	callq	_memset
	movq	-3048(%rbp), %rdi       ## 8-byte Reload
	movq	-3040(%rbp), %rsi       ## 8-byte Reload
	callq	_appending
	leaq	-1840(%rbp), %rsi
	leaq	-2976(%rbp), %rdi
	callq	_parsing_equality
	leaq	-1840(%rbp), %rdi
	movl	%eax, -2996(%rbp)
	movq	-1832(%rbp), %rdx
	movq	%rdx, -1824(%rbp)
	leaq	L_.str.9(%rip), %rdx
	movq	%rdx, -1832(%rbp)
	callq	_Parsing_assignments
	jmp	LBB23_31
LBB23_16:
	leaq	-1840(%rbp), %rdi
	callq	_check_for_redirection
	testb	$1, %al
	jne	LBB23_17
	jmp	LBB23_20
LBB23_17:
	leaq	-1840(%rbp), %rdi
	callq	_getfile
	movq	%rax, -3024(%rbp)
	movq	-3024(%rbp), %rdi
	movl	$1537, %esi             ## imm = 0x601
	movl	$420, %edx              ## imm = 0x1A4
	movb	$0, %al
	callq	_open
	movl	%eax, -3004(%rbp)
	cmpl	$0, %eax
	jge	LBB23_19
## %bb.18:
	movq	-3024(%rbp), %rdi
	callq	_perror
	movl	$1, %edi
	callq	_exit
LBB23_19:
	movq	-1840(%rbp), %rsi
	movq	-3024(%rbp), %rdx
	leaq	L_.str.16(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	-3004(%rbp), %edi
	movl	$1, %esi
	movl	%eax, -3052(%rbp)       ## 4-byte Spill
	callq	_dup2
LBB23_20:
	leaq	-1840(%rbp), %rdi
	callq	_pipe_check
	testb	$1, %al
	jne	LBB23_21
	jmp	LBB23_22
LBB23_21:
	leaq	-1840(%rbp), %rdi
	callq	_Multiple_pipe
	jmp	LBB23_25
LBB23_22:
	leaq	-1840(%rbp), %rdi
	callq	_check_for_redirection_input
	testb	$1, %al
	jne	LBB23_23
	jmp	LBB23_24
LBB23_23:
	leaq	-1840(%rbp), %rdi
	callq	_getfile_input
	movq	%rax, -3016(%rbp)
	movq	-3016(%rbp), %rdi
	callq	_input_redirection
LBB23_24:
	jmp	LBB23_25
LBB23_25:
	leaq	-1840(%rbp), %rdi
	callq	_pipe_check
	testb	$1, %al
	jne	LBB23_28
## %bb.26:
	movq	-1840(%rbp), %rdi
	leaq	L_.str.10(%rip), %rsi
	callq	_strcmp
	cmpl	$0, %eax
	jne	LBB23_28
## %bb.27:
	leaq	-1840(%rbp), %rdi
	callq	_echo_parse
LBB23_28:
	leaq	-1840(%rbp), %rdi
	callq	_pipe_check
	testb	$1, %al
	jne	LBB23_30
## %bb.29:
	xorl	%eax, %eax
	movl	%eax, %edx
	leaq	-1840(%rbp), %rsi
	leaq	-2864(%rbp), %rdi
	callq	_execve
	movq	-1840(%rbp), %rdi
	movl	%eax, -3056(%rbp)       ## 4-byte Spill
	callq	_perror
	movq	___stderrp@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rdi
	leaq	L_.str.17(%rip), %rsi
	movb	$0, %al
	callq	_fprintf
LBB23_30:
	movl	$1, %edi
	callq	_exit
LBB23_31:                               ##   in Loop: Header=BB23_1 Depth=1
	jmp	LBB23_32
LBB23_32:                               ##   in Loop: Header=BB23_1 Depth=1
	jmp	LBB23_33
LBB23_33:                               ##   in Loop: Header=BB23_1 Depth=1
	jmp	LBB23_35
LBB23_34:                               ##   in Loop: Header=BB23_1 Depth=1
	xorl	%eax, %eax
	movl	%eax, %edi
	callq	_wait
LBB23_35:                               ##   in Loop: Header=BB23_1 Depth=1
	jmp	LBB23_1
LBB23_36:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB23_38
## %bb.37:
	xorl	%eax, %eax
	addq	$3056, %rsp             ## imm = 0xBF0
	popq	%rbp
	retq
LBB23_38:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	" "

L_.str.1:                               ## @.str.1
	.asciz	"~"

L_.str.2:                               ## @.str.2
	.asciz	"HOME"

L_.str.3:                               ## @.str.3
	.asciz	"chdir() to /error failed"

L_.str.4:                               ## @.str.4
	.asciz	"current Path:%s\n"

L_.str.5:                               ## @.str.5
	.asciz	">"

L_.str.6:                               ## @.str.6
	.asciz	"<"

L_.str.7:                               ## @.str.7
	.asciz	"|"

L_.str.8:                               ## @.str.8
	.space	1

L_.str.9:                               ## @.str.9
	.asciz	"="

L_.str.10:                              ## @.str.10
	.asciz	"echo"

L_.str.11:                              ## @.str.11
	.asciz	"\n"

L_.str.12:                              ## @.str.12
	.asciz	"/bin/"

L_.str.13:                              ## @.str.13
	.asciz	"My shell>> "

L_.str.14:                              ## @.str.14
	.asciz	"exit"

L_.str.15:                              ## @.str.15
	.asciz	"cd"

L_.str.16:                              ## @.str.16
	.asciz	"writing output of the command %s to \"%s\"\n"

L_.str.17:                              ## @.str.17
	.asciz	"Child process could not do execve\n"

.subsections_via_symbols
