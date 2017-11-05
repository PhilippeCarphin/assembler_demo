.global main
passed_str:
	.string "Test passed"
failed_str:
	.string "Test failed"
fmt_address:
	.string	"An address : %p\n"
fmt_int:
	.string "An int : %d\n"

main:
	# pushq %rbp
	# movq %rsp, %rbp

	# add(77,88) function call
	push $88
	push $77
	call add # jump to function add
	addq $16, %rsp


	# Copy format sting in first parameter
	# make the functo`
	movq $fmt_int, %rdi
	# put return value of add in second parameter
	movq %rax, %rsi

	# Make function call, (saving and restoring %rax because printf
	# may do something to it.
	pushq %rax
	call printf
	popq %rax

	# Compare eax to expected return value
	cmp $77, %rax

	# main program returns 123 if different and 0 if equal
	jne test_failed
test_passed:
	movq $passed_str, %rdi
	call puts
	jmp done
test_failed:
	movq $failed_str, %rdi
	call puts
done:
	# popq %rbp
	movl $0, %eax
	ret

add:
	pushq %rbp
	movq %rsp, %rbp

	movq 16(%rbp), %rax

	popq %rbp
	ret
