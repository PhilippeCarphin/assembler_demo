.global main
.global add
add:
	pushq %rbp
	movq %rsp, %rbp

	movl $8, %eax

	popq %rbp
	ret

main:
	push $88
	push $77
	call add
	subq $16, %rsp

	cmp $165, %eax
	jne test_failed
test_passed:
	movl $0, %eax
	jmp done
test_failed:
	movl $123, %eax
done:
	ret
