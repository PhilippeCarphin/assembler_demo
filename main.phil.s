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
	# Save stack frame
	pushq %rbp
	movq %rsp, %rbp

	# int a = add(77,88) function call
	push $88 # 88)
	push $77 # 77,
	call add # add(
	addq $16, %rsp # Return
	pushq %rax # int a =

	# Compare eax to expected return value
	cmpl $165, -8(%rbp)
	jne test_failed
test_passed:
	movq $passed_str, %rdi
	call puts
	jmp done
test_failed:
	movq $failed_str, %rdi
	call puts
done:
	# Deallocate memeory
	addq $8, %rsp
	# Set return value
	movq $0, %rax
	# Restore stack frame
	popq %rbp
	# Jump to address after the call
	ret

add:
	pushq %rbp
	movq %rsp, %rbp

	movq 16(%rbp), %rax
	addq 24(%rbp), %rax

	popq %rbp
	ret
