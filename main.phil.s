.global main
main:
	# pushq %rbp
	# movq %rsp, %rbp

	push $88
	push $77
#	+---------+
#	|  77     | <-rsp
#	+---------+
#	|  88     |
#	+---------+
#	|  ...    |
#	+---------+
	call add # jump to function add
	addq $16, %rsp

	cmp $77, %eax
	jne test_failed
test_passed:
	movl $0, %eax
	jmp done
test_failed:
	movl $123, %eax
done:
	# popq %rbp
	ret

add:
#	+---------+
#	|  RET    | <-rsp
#	+---------+
#	|  77     | 8(%rsp)
#	+---------+
#	|  88     |
#	+---------+
#	|  ...    |
#	+---------+
#	|  ...    | 0xFFFFFFFFFFFFFFFF
#	+---------+
	pushq %rbp
#	+---------+
#	| old rbp | <-rsp
#	+---------+
#	|  RET    | 8(%rsp)
#	+---------+
#	|  77     | 16(%rsp)
#	+---------+
#	|  88     |
#	+---------+
#	|  ...    |
#	+---------+
#	|  ...    | 0xFFFFFFFFFFFFFFFF
#	+---------+
	movq %rsp, %rbp
#	+---------+
#	| old rbp | <-rbp, rsp
#	+---------+
#	|  RET    | 8(%rbp)
#	+---------+
#	|  77     | 16(%rbp)
#	+---------+
#	|  88     |
#	+---------+
#	|  ...    |
#	+---------+
#	|  ...    | 0xFFFFFFFFFFFFFFFF
#	+---------+
	movq 16(%rbp), %rax
	# popq %rbp
#	+---------+
#	|  RET    | <--rsp
#	+---------+
#	|  77     |
#	+---------+
#	|  88     |
#	+---------+
#	|  ...    |
#	+---------+
	ret
