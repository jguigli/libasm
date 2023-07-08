global ft_strlen
section .text

ft_strlen :

mov		rax, 0
mov		rcx, rdi

loop :

cmp		byte [rcx], 0
je		end

inc		rax
inc		rcx
jmp		loop

end :

ret