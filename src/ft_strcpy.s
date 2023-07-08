global ft_strcpy
section .text

ft_strcpy :

mov		rax, 0
mov		rdx, rdi
mov		rcx, rsi

loop :

mov		al, [rcx]
cmp		al, 0
je		end

mov		[rdx], al
inc		rdx
inc		rcx
jmp		loop

end :

mov		byte [rdx], 0
ret