global ft_list_size
extern	__errno_location

section .text

ft_list_size:

xor		rax, rax

cmp		rdi, 0
je		end

mov 	rsi, rdi

loop:

inc		rax

mov     rsi, [rsi + 8]
cmp 	rsi, 0
je		end

jmp		loop


end:

ret