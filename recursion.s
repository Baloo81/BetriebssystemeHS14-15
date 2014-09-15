	.section	__TEXT,__text,regular,pure_instructions
	.globl	_fac_intern
	.align	4, 0x90
_fac_intern:
Leh_func_begin1:
	pushq	%rbp
Ltmp0:
	movq	%rsp, %rbp
Ltmp1:
	subq	$16, %rsp
Ltmp2:
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	$0, %eax
	jne	LBB1_2
	movl	-8(%rbp), %eax
	movl	%eax, -16(%rbp)
	jmp	LBB1_3
LBB1_2:
	movl	-4(%rbp), %eax
	movl	-8(%rbp), %ecx
	imull	%ecx, %eax
	movl	-4(%rbp), %ecx
	subl	$1, %ecx
	movl	%ecx, %edi
	movl	%eax, %esi
	callq	_fac_intern
	movl	%eax, %ecx
	movl	%ecx, -16(%rbp)
LBB1_3:
	movl	-16(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
Leh_func_end1:

	.globl	_fac
	.align	4, 0x90
_fac:
Leh_func_begin2:
	pushq	%rbp
Ltmp3:
	movq	%rsp, %rbp
Ltmp4:
	subq	$16, %rsp
Ltmp5:
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1, %ecx
	movl	%eax, %edi
	movl	%ecx, %esi
	callq	_fac_intern
	movl	%eax, %ecx
	movl	%ecx, -12(%rbp)
	movl	-12(%rbp), %ecx
	movl	%ecx, -8(%rbp)
	movl	-8(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
Leh_func_end2:

	.globl	_fac_nontailrec
	.align	4, 0x90
_fac_nontailrec:
Leh_func_begin3:
	pushq	%rbp
Ltmp6:
	movq	%rsp, %rbp
Ltmp7:
	subq	$16, %rsp
Ltmp8:
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	cmpl	$0, %eax
	jg	LBB3_2
	movl	$1, -12(%rbp)
	jmp	LBB3_3
LBB3_2:
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	callq	_fac_nontailrec
	movl	%eax, %ecx
	movl	-4(%rbp), %edx
	imull	%edx, %ecx
	movl	%ecx, -12(%rbp)
LBB3_3:
	movl	-12(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
Leh_func_end3:

	.globl	_fac_loop
	.align	4, 0x90
_fac_loop:
Leh_func_begin4:
	pushq	%rbp
Ltmp9:
	movq	%rsp, %rbp
Ltmp10:
	movl	%edi, -4(%rbp)
	movl	$1, -16(%rbp)
	movl	-4(%rbp), %eax
	cmpl	$0, %eax
	jg	LBB4_2
	movl	$1, -12(%rbp)
	jmp	LBB4_6
LBB4_2:
	jmp	LBB4_4
LBB4_3:
	movl	-16(%rbp), %eax
	movl	-4(%rbp), %ecx
	imull	%ecx, %eax
	movl	%eax, -16(%rbp)
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -4(%rbp)
LBB4_4:
	movl	-4(%rbp), %eax
	cmpl	$1, %eax
	jg	LBB4_3
	movl	-16(%rbp), %eax
	movl	%eax, -12(%rbp)
LBB4_6:
	movl	-12(%rbp), %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	popq	%rbp
	ret
Leh_func_end4:

	.globl	_main
	.align	4, 0x90
_main:
Leh_func_begin5:
	pushq	%rbp
Ltmp11:
	movq	%rsp, %rbp
Ltmp12:
	subq	$32, %rsp
Ltmp13:
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$4, %eax
	movl	%eax, %edi
	movl	%eax, -28(%rbp)
	callq	_fac_loop
	movl	%eax, %ecx
	xorb	%dl, %dl
	leaq	L_.str(%rip), %rdi
	movl	%ecx, %esi
	movb	%dl, %al
	callq	_printf
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	callq	_fac_nontailrec
	movl	%eax, %ecx
	xorb	%dl, %dl
	leaq	L_.str1(%rip), %rdi
	movl	%ecx, %esi
	movb	%dl, %al
	callq	_printf
	movl	-28(%rbp), %eax
	movl	%eax, %edi
	callq	_fac
	movl	%eax, %ecx
	xorb	%dl, %dl
	leaq	L_.str2(%rip), %rdi
	movl	%ecx, %esi
	movb	%dl, %al
	callq	_printf
	movl	$0, -24(%rbp)
	movl	-24(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	addq	$32, %rsp
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
Ltmp14:
	.quad	Leh_func_begin1-Ltmp14
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
Ltmp15:
	.quad	Leh_func_begin2-Ltmp15
Lset8 = Leh_func_end2-Leh_func_begin2
	.quad	Lset8
	.byte	0
	.byte	4
Lset9 = Ltmp3-Leh_func_begin2
	.long	Lset9
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset10 = Ltmp4-Ltmp3
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
Ltmp16:
	.quad	Leh_func_begin3-Ltmp16
Lset13 = Leh_func_end3-Leh_func_begin3
	.quad	Lset13
	.byte	0
	.byte	4
Lset14 = Ltmp6-Leh_func_begin3
	.long	Lset14
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset15 = Ltmp7-Ltmp6
	.long	Lset15
	.byte	13
	.byte	6
	.align	3
Leh_frame_end3:

	.globl	_fac_loop.eh
_fac_loop.eh:
Lset16 = Leh_frame_end4-Leh_frame_begin4
	.long	Lset16
Leh_frame_begin4:
Lset17 = Leh_frame_begin4-Leh_frame_common
	.long	Lset17
Ltmp17:
	.quad	Leh_func_begin4-Ltmp17
Lset18 = Leh_func_end4-Leh_func_begin4
	.quad	Lset18
	.byte	0
	.byte	4
Lset19 = Ltmp9-Leh_func_begin4
	.long	Lset19
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset20 = Ltmp10-Ltmp9
	.long	Lset20
	.byte	13
	.byte	6
	.align	3
Leh_frame_end4:

	.globl	_main.eh
_main.eh:
Lset21 = Leh_frame_end5-Leh_frame_begin5
	.long	Lset21
Leh_frame_begin5:
Lset22 = Leh_frame_begin5-Leh_frame_common
	.long	Lset22
Ltmp18:
	.quad	Leh_func_begin5-Ltmp18
Lset23 = Leh_func_end5-Leh_func_begin5
	.quad	Lset23
	.byte	0
	.byte	4
Lset24 = Ltmp11-Leh_func_begin5
	.long	Lset24
	.byte	14
	.byte	16
	.byte	134
	.byte	2
	.byte	4
Lset25 = Ltmp12-Ltmp11
	.long	Lset25
	.byte	13
	.byte	6
	.align	3
Leh_frame_end5:


.subsections_via_symbols
