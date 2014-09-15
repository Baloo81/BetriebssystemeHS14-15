	.section	__TEXT,__text,regular,pure_instructions
	.globl	_fac_intern
	.align	4, 0x90
_fac_intern:
Leh_func_begin1:
	pushq	%rbp
Ltmp0:
	movq	%rsp, %rbp
Ltmp1:
	jmp	LBB1_1
	.align	4, 0x90
LBB1_3:
	leal	-1(%rdi), %eax
	imull	%eax, %esi
	addl	$-2, %edi
LBB1_1:
	testl	%edi, %edi
	je	LBB1_4
	imull	%edi, %esi
	cmpl	$1, %edi
	jne	LBB1_3
LBB1_4:
	movl	%esi, %eax
	popq	%rbp
	ret
Leh_func_end1:

	.globl	_fac
	.align	4, 0x90
_fac:
Leh_func_begin2:
	pushq	%rbp
Ltmp2:
	movq	%rsp, %rbp
Ltmp3:
	movl	$1, %eax
	jmp	LBB2_1
	.align	4, 0x90
LBB2_3:
	leal	-1(%rdi), %ecx
	imull	%ecx, %eax
	addl	$-2, %edi
LBB2_1:
	testl	%edi, %edi
	je	LBB2_4
	imull	%edi, %eax
	cmpl	$1, %edi
	jne	LBB2_3
LBB2_4:
	popq	%rbp
	ret
Leh_func_end2:

	.globl	_fac_nontailrec
	.align	4, 0x90
_fac_nontailrec:
Leh_func_begin3:
	pushq	%rbp
Ltmp4:
	movq	%rsp, %rbp
Ltmp5:
	pushq	%r14
	pushq	%rbx
Ltmp6:
	testl	%edi, %edi
	jle	LBB3_5
	movl	%edi, %ebx
	leal	-1(%rbx), %r14d
	testl	%r14d, %r14d
	jg	LBB3_3
	movl	$1, %r14d
	jmp	LBB3_4
LBB3_3:
	leal	-2(%rbx), %edi
	callq	_fac_nontailrec
	imull	%eax, %r14d
LBB3_4:
	movl	%r14d, %eax
	imull	%ebx, %eax
	jmp	LBB3_6
LBB3_5:
	movl	$1, %eax
LBB3_6:
	popq	%rbx
	popq	%r14
	popq	%rbp
	ret
Leh_func_end3:

	.globl	_fac_loop
	.align	4, 0x90
_fac_loop:
Leh_func_begin4:
	pushq	%rbp
Ltmp7:
	movq	%rsp, %rbp
Ltmp8:
	testl	%edi, %edi
	jle	LBB4_2
	cmpl	$1, %edi
	jg	LBB4_3
LBB4_2:
	movl	$1, %eax
	popq	%rbp
	ret
LBB4_3:
	movl	$1, %eax
	.align	4, 0x90
LBB4_4:
	imull	%edi, %eax
	decl	%edi
	cmpl	$1, %edi
	jne	LBB4_4
	popq	%rbp
	ret
Leh_func_end4:

	.globl	_main
	.align	4, 0x90
_main:
Leh_func_begin5:
	pushq	%rbp
Ltmp9:
	movq	%rsp, %rbp
Ltmp10:
	leaq	L_.str(%rip), %rdi
	movl	$24, %esi
	xorb	%al, %al
	callq	_printf
	movl	$2, %edi
	callq	_fac_nontailrec
	imull	$12, %eax, %esi
	leaq	L_.str1(%rip), %rdi
	xorb	%al, %al
	callq	_printf
	leaq	L_.str2(%rip), %rdi
	movl	$24, %esi
	xorb	%al, %al
	callq	_printf
	xorl	%eax, %eax
	popq	%rbp
	ret
Leh_func_end5:

	.section	__TEXT,__cstring,cstring_literals
L_.str:
	.asciz	 "fac_loop von 4 = %d \n"

L_.str1:
	.asciz	 "fac_nontailrec von 4 = %d \n"

L_.str2:
	.asciz	 "fac von 4 = %d \n"

	.section	__TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame0:
Lsection_eh_frame:
Leh_frame_common:
Lset0 = Leh_frame_common_end-Leh_frame_common_begin
	.long	Lset0
Leh_frame_common_begin:
	.long	0
	.byte	1
	.asciz	 "zR"
	.byte	1
	.byte	120
	.byte	16
	.byte	1
	.byte	16
	.byte	12
	.byte	7
	.byte	8
	.byte	144
	.byte	1
	.align	3
Leh_frame_common_end:
	.globl	_fac_intern.eh
_fac_intern.eh:
Lset1 = Leh_frame_end1-Leh_frame_begin1
	.long	Lset1
Leh_frame_begin1:
Lset2 = Leh_frame_begin1-Leh_frame_common
	.long	Lset2
Ltmp11:
	.quad	Leh_func_begin1-Ltmp11
Lset3 = Leh_func_end1-Leh_func_begin1
	.quad	Lset3
	.byte	0
	.byte	4
Lset4 = Ltmp0-Leh_func_begin1
	.long	Lset4
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset5 = Ltmp1-Ltmp0
	.long	Lset5
	.byte	13
	.byte	6
	.align	3
Leh_frame_end1:

	.globl	_fac.eh
_fac.eh:
Lset6 = Leh_frame_end2-Leh_frame_begin2
	.long	Lset6
Leh_frame_begin2:
Lset7 = Leh_frame_begin2-Leh_frame_common
	.long	Lset7
Ltmp12:
	.quad	Leh_func_begin2-Ltmp12
Lset8 = Leh_func_end2-Leh_func_begin2
	.quad	Lset8
	.byte	0
	.byte	4
Lset9 = Ltmp2-Leh_func_begin2
	.long	Lset9
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset10 = Ltmp3-Ltmp2
	.long	Lset10
	.byte	13
	.byte	6
	.align	3
Leh_frame_end2:

	.globl	_fac_nontailrec.eh
_fac_nontailrec.eh:
Lset11 = Leh_frame_end3-Leh_frame_begin3
	.long	Lset11
Leh_frame_begin3:
Lset12 = Leh_frame_begin3-Leh_frame_common
	.long	Lset12
Ltmp13:
	.quad	Leh_func_begin3-Ltmp13
Lset13 = Leh_func_end3-Leh_func_begin3
	.quad	Lset13
	.byte	0
	.byte	4
Lset14 = Ltmp4-Leh_func_begin3
	.long	Lset14
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset15 = Ltmp5-Ltmp4
	.long	Lset15
	.byte	13
	.byte	6
	.byte	4
Lset16 = Ltmp6-Ltmp5
	.long	Lset16
	.byte	131
	.byte	4
	.byte	142
	.byte	3
	.align	3
Leh_frame_end3:

	.globl	_fac_loop.eh
_fac_loop.eh:
Lset17 = Leh_frame_end4-Leh_frame_begin4
	.long	Lset17
Leh_frame_begin4:
Lset18 = Leh_frame_begin4-Leh_frame_common
	.long	Lset18
Ltmp14:
	.quad	Leh_func_begin4-Ltmp14
Lset19 = Leh_func_end4-Leh_func_begin4
	.quad	Lset19
	.byte	0
	.byte	4
Lset20 = Ltmp7-Leh_func_begin4
	.long	Lset20
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset21 = Ltmp8-Ltmp7
	.long	Lset21
	.byte	13
	.byte	6
	.align	3
Leh_frame_end4:

	.globl	_main.eh
_main.eh:
Lset22 = Leh_frame_end5-Leh_frame_begin5
	.long	Lset22
Leh_frame_begin5:
Lset23 = Leh_frame_begin5-Leh_frame_common
	.long	Lset23
Ltmp15:
	.quad	Leh_func_begin5-Ltmp15
Lset24 = Leh_func_end5-Leh_func_begin5
	.quad	Lset24
	.byte	0
	.byte	4
Lset25 = Ltmp9-Leh_func_begin5
	.long	Lset25
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset26 = Ltmp10-Ltmp9
	.long	Lset26
	.byte	13
	.byte	6
	.align	3
Leh_frame_end5:


.subsections_via_symbols
