global ft_list_size
extern	__errno_location

section .text

ft_list_size:

push    rbp
mov     rbp, rsp
push 	rdi
mov 	rax, 0

mov 	rsi, [rdi]
cmp		rsi, 0
je		end

inc 	rax

loop:

mov     rsi, [rsi + 8]
cmp 	rsi, 0
je		end

inc		rax

end:

mov     rsp, rbp
pop     rbp
pop 	rdi

ret