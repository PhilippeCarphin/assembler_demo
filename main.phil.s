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
	subq $8, %rsp # Allocate stack space for int a at -8(%rbp)

	# a = add(77, 88);
	push $88 # 88)
	push $77 # 77,
	call add # add(
	addq $16, %rsp # cleanup
	movq %rax, (%rsp) # a =

	cmpl $165, (%rsp)
	jne test_failed
test_passed:
	movq $passed_str, %rdi
	call puts
	jmp done
test_failed:
	movq $failed_str, %rdi
	call puts
done:
	addq $8, %rsp
	movq $0, %rax
	ret

add:
	movq 8(%rsp), %rax
	addq 16(%rsp), %rax
	ret
