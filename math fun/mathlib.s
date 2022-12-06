;The product and power routines are to be called from mathfun.cpp, so they are declared as global. 
global product
global power
;Executable Instructions
section .text
;The product routine iteratively computes the product of two positive integers. 
;1st parameter x is in rdi (repeatedly incremented by itself).
;2nd parameter y is in rsi (the last valid index of the loop n).
product:
	xor rax, rax	;Set the contents of rax (the return register) equal to 0
	xor r10, r10	;Set the contents of r10 (the loop index i) equal to 0
beginLoop:
	cmp r10, rsi 	;If the contents of r10 and rsi are equal (if i = n)
	je endLoop		;	Then jump the endLoop operand
	add rax, rdi	;Increment the contents of rax by the contents in rdi
	inc r10			;Increment the contents of r10 (i) by 1
	jmp beginLoop	;Jump to the beginLoop operand
endLoop:
	ret 			;Return to the address on the top of the stack

;The power routine recursively computes x (1st parameter) raised to the power y (2nd parameter).
;1st parameter x is in rdi (repeatedly multiplied by itself).
;2nd parameter y is in rsi (the power to be decremented in the recursiveCase).
power:
	xor rax, rax	;Set the contents of rax (the return register) equal to 0
	mov rax, 1 		;Set the contents of rax (the return register) equal to 1
baseCase:
	cmp rsi, 0 		;If the contents of rsi (2nd parameter y) equal 0
	je endRecursion	;	Then jump to the endRecursion operand
recursiveCase:
	dec rsi 		;Decrement the contents of rsi (2nd parameter y) by 1
	call power		;Compute power(rdi, rsi - 1)
	mov rsi, rax	;Move the contents of rax into rsi
	call product	;Compute product(rdi, power(rdi, rsi - 1))
endRecursion:
	ret 			;Return to the address on the top of the stack