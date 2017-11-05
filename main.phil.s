.global main
.global add
add:
	pushq %rbp
	movq %rsp, %rbp

	movq -8(%rbp), %rax

	popq %rbp
	ret

main:
	push $88
	push $77
	call add
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
