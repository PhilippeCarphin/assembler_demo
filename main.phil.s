.global main
.global add
add:
	movq 8(%rsp), %rax
#	+---------+
#	|  RET    | <-rsp
#	+---------+
#	|  77     | 8(%rsp)
#	+---------+
#	|  88     |
#	+---------+
#	|  ...    |
#	+---------+
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
