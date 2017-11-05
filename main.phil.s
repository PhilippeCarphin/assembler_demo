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
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp

	# a = add(77, 88) : ...
	push $88 # 88)
	push $77 # 77,
	call add # add(
	addq $16, %rsp # cleanup
	movq %rax, -8(%rbp) # a =

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
	movq $0, %rax
	ret

add:
	movq (%rsp), %rax
	addq 8(%rsp), %rax
	ret
