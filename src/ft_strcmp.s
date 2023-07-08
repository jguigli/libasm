global ft_strcmp
section .text

ft_strcmp :

mov		rax, 0
mov		rdx, rdi
mov		rcx, rsi

loop :

cmp		byte [rdx], 0
je		end
cmp		byte [rcx], 0
je		end

mov		al, [rdx]
mov		bl, [rcx]
cmp		al, bl
jne		end

inc		rdx
inc		rcx
jmp		loop

end :

sub al, bl
movsx rax, al
ret