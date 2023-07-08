global ft_list_size
extern	__errno_location

section .text

ft_list_size:

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

pop 	rdi

ret