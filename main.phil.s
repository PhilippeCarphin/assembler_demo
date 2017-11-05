.global main
.global add
add:
	pushq %rbp
	movq %rsp, %rbp

	movl $43, %eax

	popq %rbp
	ret

main:
	call add

	ret
