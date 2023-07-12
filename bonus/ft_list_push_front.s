global ft_list_push_front
extern	__errno_location
extern	malloc

section .text

ft_list_push_front:

push    rbx
push    rsi
push 	rdi
xor		rax, rax

mov 	rdi, 16
call 	malloc wrt ..plt
cmp 	rax, 0
je		error

pop 	rdi
pop		rsi

mov		rbx, [rdi]

mov 	[rax], rsi
mov 	[rax + 8], rbx
mov 	[rdi], rax

jmp		end


error:

pop		rdi
pop		rsi
pop     rbx

neg		rax
mov		rdi, rax
call	__errno_location wrt ..plt
mov		[rax], rdi
mov		rax, -1
ret

end:

pop     rbx

ret