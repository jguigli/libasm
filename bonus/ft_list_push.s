global ft_list_push_front
extern	__errno_location
extern	malloc

section .text

ft_list_push_front:

push    rbx
push    rsi
push 	rdi

mov     rbx, qword [rdi]
cmp 	rbx, 0
je		empty-list

mov 	rdi, 16
call 	malloc wrt ..plt
cmp 	rax, 0
je		error

pop 	rdi
mov 	rsi, rax

mov 	[rsi + 8], rdi
mov 	qword [rdi], rsi
jmp		end


empty-list:

mov 	rdi, 16
call 	malloc wrt ..plt
cmp 	rax, 0
je		error

pop 	rdi
mov 	rsi, rax

mov 	qword [rdi], rsi
jmp		end

error:

pop		rdi
pop     rsi
pop     rbx

neg		rax
mov		rdi, rax
call	__errno_location wrt ..plt
mov		[rax], rdi
mov		rax, -1
ret

end:

pop     rsi
pop     rbx
ret