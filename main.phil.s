.global main
.global add
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
	movq 16(%rbp), %rax
	# popq %rbp
	ret

main:
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
	ret
