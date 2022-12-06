global _mergeSort
global _merge

section .text

;Parameter 1 is a pointer to the int array (rdi = array)
;Parameter 2 is the left index in the array (rsi = left)
;Parameter 3 is the right index in the array (rdx = right)
;Return type is void 
_mergeSort:			
	cmp rsi, rdx		;If left >= right (rsi >= rdx)
	jge endMergeSort	;Then jump to endMergeSort

setMiddle:
	xor r10, r10 		;Set middle = 0 (r10 = 0)
	add r10, rsi 		;Set middle = middle + left (r10 = r10 + rsi)
	add r10, rdx		;Set middle = middle + right (r10 = r10 + rdx)
	shr r10, 1 			;Set middle = middle / 2 (shift bits in r10 left)

recurseLeft:
	push rdx			;Push right onto the stack (save rdx)
	mov rdx, r10 		;Set right = middle (rdx = r10)
	call _mergeSort 	;Call mergeSort(array, left, right = middle)
	pop rdx 			;Pop right from the stack (restore rdx to original value)

recurseRight:
	inc r10 			;Increment middle by 1 (r10 = r10 + 1)
	push rsi 			;Push left onto the stack (save rsi)
	mov rsi, r10 		;Set left = middle (rsi = r10)
	call _mergeSort 	;Call mergeSort(array, left = middle, right)
	pop rsi 			;Pop left from the stack (restore rsi to original value)
	dec r10 			;Decrement middle by 1 (r10 = r10 - 1)

updateParameters:
	mov rcx, rdx 		;Set rcx = right (rcx = rdx)
	push rdx 			;Push right onto the stack (save rdx)
	mov rdx, r10 		;Set rdx = middle = r10
	push r10 			;Push r10 onto the stack (save r10)
	call _merge 		;Call merge(array, left, middle, right)
	pop r10 			;Pop r10 from the stack
	pop rdx 			;Pop rdx from the stack

endMergeSort:
	ret 				;Return to the address on the top of the stack

; Parameter 1 is a pointer to the int array 
; Parameter 2 is the left index in the array
; Parameter 3 is the middle index in the array 
; Parameter 4 is the right index in the array
; Return type is void 
_merge:
	; Save callee-save registers
	; Store local variables 
	push rbx			; int i
	push r12			; int j
	push r13			; int k
	push r14			; int n1
	push r15			; int n2
	
	mov r14, rdx			; n1 = mid - left + 1
	sub r14, rsi
	inc r14

	mov r15, rcx			; n2 = right - mid 
	sub r15, rdx

	lea r11, [r14+r15]		; r11 = rsp offset = 4(n1 + n2)
	lea r11, [4*r11]		
	sub rsp, r11			; allocate space for temp arrays

	mov rbx, 0			; i = 0
	mov r12, 0			; j = 0
	
; Copy elements of arr[] into L[]	
copyLloop:
	cmp rbx, r14			; is i >= n1?
	jge copyRloop
					; L[i] = arr[left + i]
	lea r10, [rsi+rbx]		
	mov r10d, DWORD [rdi+4*r10]	; r10 = arr[left + i]
	mov DWORD [rsp+4*rbx], r10d	; L[i] = r10
	inc rbx				; i++
	jmp copyLloop

; Copy elements of arr[] into R[]
copyRloop:
	cmp r12, r15			; is j >= n2?
	jge endcopyR
 					; R[j] = arr[mid + 1 + j]
	lea r10, [rdx+r12+1]	
	mov r10d, DWORD [rdi+4*r10]	; r10 = arr[mid + 1 + j]
	lea rax, [r12+r14]		
	mov DWORD [rsp+4*rax], r10d	; R[j] = r10
	inc r12				; j++
	jmp copyRloop

endcopyR:	
	mov rbx, 0			; i = 0
	mov r12, 0			; j = 0
	mov r13, rsi			; k = left

; Merge L[] and R[] into arr[]
mergeLoop:
	cmp rbx, r14			; is i >= n1 or j >= n2?
	jge loopL
	cmp r12, r15
	jge loopL
	lea r10, [r12+r14]
	mov r10d, DWORD [rsp+4*r10] 	; r10d = R[j]
	cmp DWORD [rsp+4*rbx], r10d	; is L[i] <= R[j]?
	jle if
	mov DWORD [rdi+4*r13], r10d	; arr[k] = R[j]
	inc r12				; j++
	jmp endif 
if:
	mov r10d, DWORD [rsp+4*rbx] 
	mov DWORD [rdi+4*r13], r10d	; arr[k] = L[i] 
	inc rbx				; i++
endif:	
	inc r13				; k++	
	jmp mergeLoop
	
; Copy elements of L[] into arr[]
loopL:				
	cmp rbx, r14			; is i >= n1?
	jge loopR
	mov r10d, DWORD [rsp+4*rbx] 
	mov DWORD [rdi+4*r13], r10d	; arr[k] = L[i]
	inc rbx				; i++
	inc r13				; k++
	jmp loopL

; Copy elements of R[] into arr[]
loopR:	
	cmp r12, r15			; is j >= n2?
	jge endR
	lea r10, [r12+r14]
	mov r10d, DWORD [rsp+4*r10] 	
	mov DWORD [rdi+4*r13], r10d	; arr[k] = R[j]

	inc r12				; j++
	inc r13				; k++
	jmp loopR
	
endR:
	; deallocate temp arrays
	; restore callee-save registers
	add rsp, r11	
	pop r15			
	pop r14
	pop r13
	pop r12
	pop rbx
	ret
