.global main
.global add
add:
	pushq %rbp
	movq %rsp, %rbp

	movl $8, %eax

	popq %rbp
	ret

main:
	call add

	cmp $165, %eax
	jne test_failed
test_passed:
	movl $0, %eax
	jmp done
test_failed:
	movl $123, %eax
done:
	ret
