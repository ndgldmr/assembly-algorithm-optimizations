section.text

;Performs binary search on a sorted array of integers.
;Parameters:
	;rdi = A pointer to a sorted array of integers
	;rsi = An integer representing the left-most index of the array
	;rdx = An integer representing the right-most index of the array
	;rcx = The target element to be found in the array
;Return: The index of the target element if found, and -1 if otherwise
;Register Usage: 
    ;r10 is used to represent the middle index of the array
    ;r11d is used to represent integer in the middle index
global binarySearch
binarySearch:
	mov rax, -1                ;Set rax = -1
while:
	cmp rsi, rdx               ;While rsi <= rdx
	jle setmiddle              ;Jump to setmiddle
	jmp return                 ;Jump to return
setmiddle:
	mov r10, rsi               ;Set r10 = rsi
	add r10, rdx               ;Set r10 = r10 + rdx
	shr r10, 1                 ;Right-shift r10's contents 1 bit position
	mov r11d, [rdi + 4 * r10]  ;Set r11d = [rdi + 4 * r10]
case1:
	cmp r11d, ecx              ;If r11d != ecx
	jne case2                  ;Jump to case2
	mov rax, r10               ;Set rax = r10
	jmp return                 ;Jump to return
case2:
	cmp r11d, ecx              ;If r11d < ecx
	jl case3                   ;Jump to case3
	mov rdx, r10               ;Set rdx = r10
	dec rdx                    ;Decrement rdx by 1
	jmp binarySearch           ;Jump to binarySearch
case3:
	mov rsi, r10               ;Set rsi = r10
	inc rsi                    ;Increment rsi by 1
	jmp binarySearch           ;Jump to binarySearch
return:
	ret                        ;Return rax