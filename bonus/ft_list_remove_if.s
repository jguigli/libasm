global ft_list_remove_if
extern	__errno_location
extern	free

section .text

ft_list_remove_if:

push	rax
push	rdi

cmp		rdi, 0
je		end

mov		rcx, rdi
mov		rbx, [rdi]

; rdi begin
; rsi ref
; rdx fct_cmp


jmp		loop

loop :

cmp		rbx, 0
je		next
cmp		qword [rbx + 8], 0
je		next

mov		r9, [rbx + 8]
mov		rdi, [r9]

call	rdx
cmp		rax, 0
jne		iter_loop

mov		rdi, r9 ; to FREE
mov		r10, [r9 + 8]
mov		qword [rbx + 8], r10

call	free wrt ..plt
cmp 	rax, 0
je		error

jmp		iter_loop

iter_loop :

mov		rbx, [rbx + 8]
jmp		loop

next :
pop		rdi
mov		rbx, [rdi]
push	rdi

cmp		rbx, 0
je		end

mov		rdi, [rbx]

call	rdx
cmp		rax, 0
jne		end

mov		rax, qword [rbx + 8]
mov		qword [rcx], rax
mov		rdi, rbx

call	free wrt ..plt
cmp 	rax, 0
je		error

ret

error:
pop		rdi
pop		rax

neg		rax
mov		rdi, rax
call	__errno_location wrt ..plt
mov		[rax], rdi
mov		rax, -1
ret

end :
pop		rdi
pop		rax

ret