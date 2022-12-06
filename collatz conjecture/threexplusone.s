global threexplusone
section .text

;Implements the collatz conjecture for a positive integer rdi.
;Returns an integer representing the number of operations needed for rdi to converge to 1.
;Optimizations - (1) shr for even recursive case (2) lea for odd recursive case.
threexplusone:
	xor rax, rax                    ;Set rax = 0
	cmp rdi, 1                      ;If rdi = 1
	je done                             ;Jump to done
	mov r10, rdi                    ;Let r10 = rdi
	and r10, 1                      ;If the last bit of r10 = 0	
	jz even                             ;Jump to even
	jmp odd                         ;Else jump to odd
even:
	shr rdi, 1                      ;Shift rdi 1 position to the right (divide rdi by 2)
	call threexplusone              ;Call threexplusone(rdi)
	inc rax                         ;Increment rax by 1
	jmp done                        ;Jump to done
odd:
	lea rdi, [rdi + rdi + rdi + 1]  ;Let rdi = (3 * rdi) + 1
	call threexplusone              ;Call threexplusone(rdi)
	inc rax                         ;Increment rax by 1
	jmp done                        ;Jump to done
done:
	ret                             ;Return to address on top of stack