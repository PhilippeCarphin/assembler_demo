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
	subq $8, %rsp # Allocate stack space for int a at -8(%rbp)

	# int a = add(77,88) function call
	push $88 # 88)
	push $77 # 77,
	# call add # add(
	jmp add
	pushq %rip
after_add:
	addq $16, %rsp # cleanup
	movq %rax, -8(%rbp) # a =

	# Compare a to expected return value
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
	# Calculate return value
	movq (%rsp), %rax
	addq 8(%rsp), %rax
	# Jump back to caller
	jmp after_add
