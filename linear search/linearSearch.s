;Performs linear search on an array n integers.
;Parameter 1 is a pointer to an array of integers (rdi = array*).
;Parameter 2 is an integer representing the size of the array (rsi = n).
;Parameter 3 is an integer representing the target element to find in the array (rdx = target).
;Returns the index i of the target if found in the array, and -1 if otherwise. 
global _linearSearch
_linearSearch:
	mov rax, -1 				;Set rax = -1
	mov r10, 0 					;Set r10 (i) = 0
loop:						
	cmp r10, rsi 				;If r10 (i) = rsi (n), then return rax (-1)
	je return 
	mov r11d, [rdi + 4 * r10]	;Set r11d (temp) = [rdi + 4 * r10] (&array[i])
	cmp r11d, edx 				;If r11d (temp) = edx (target), then return r10 (i)
	je returnIndex 	
	inc r10 					;Incement r10 (i) by 1
	jmp loop 					;Iterate once more
returnIndex:					 
	mov rax, r10 				;Set rax = r10 (i)
	ret 						;Return rax
return:							
	ret 						;Return rax