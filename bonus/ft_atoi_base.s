global ft_atoi_base
extern	__errno_location
extern	ft_strlen

section .text

global isInvalidBase
global getIndex
global isSpace

isSpace :

cmp		dil, '\t'
je		good_space
cmp		dil, '\n'
je		good_space
cmp		dil, '\r'
je		good_space
cmp		dil, '\v'
je		good_space
cmp		dil, '\f'
je		good_space
cmp		dil, ' '
je		good_space

mov		rax, 0
ret

good_space :
mov		rax, 1
ret



isInvalidBase :
push	rax
push	rbx
push	rcx
push	rdi
push	rdx
push	r9
push	r10

mov		rbx, rdi

mov		al, byte [rbx]
cmp		al, 0
je		invalid_base

mov		al, byte [rbx + 1]
cmp		al, 0
je		invalid_base

xor		r9, r9

outer_loop :
xor		r10, r10

mov		al, byte [rbx + r9]
cmp		al, 0
je		end_base

cmp		al, '+'
je		invalid_base
cmp		al, '-'
je		invalid_base
cmp		al, ' '
je		invalid_base

mov		r10, r9
inc		r10
jmp		inner_loop

inner_loop :
mov		al, byte [rbx + r10]
cmp		al, 0
je		iter_outer

mov		cl, byte[rbx + r9]

cmp		al, cl
je		invalid_base

jmp		iter_inner

iter_outer :
inc		r9
jmp		outer_loop

iter_inner :
inc		r10
jmp		inner_loop


invalid_base :
pop		r10
pop		r9
pop		rdx
pop		rdi
pop		rcx
pop		rbx
pop		rax

mov		al, 1
ret

end_base :
pop		r10
pop		r9
pop		rdx
pop		rdi
pop		rcx
pop		rbx
pop		rax

mov		al, 0
ret



getIndex :

push	rdi
push	rsi
push	rcx

xor		rcx, rcx

loop :

mov		al, byte [rdi + rcx]
cmp		al, 0
je		not_find

cmp		al, sil
je		find

iter_loop :
inc		rcx
jmp		loop

find :
mov		rax, rcx

pop		rcx
pop		rsi
pop		rdi

ret

not_find :
mov		rax, 1
neg		rax

pop		rcx
pop		rsi
pop		rdi

ret


ft_atoi_base:

push	rax
push	rsi
push	rdi

mov		rdx, rdi
mov		rbx, rsi
mov		rdi, rbx

call	isInvalidBase
cmp		al, 1
je		error_return

mov		r9, 0
mov		r10, 1
xor		rcx, rcx

jmp		loop_is_space

loop_is_space :
mov		al, byte [rdx + rcx]
cmp		al, 0
je		check_sign

mov		dil, al
call	isSpace
cmp		al, 1
je		iter_loop_is_space

jmp		check_sign

iter_loop_is_space :
inc		rcx
jmp		loop_is_space

check_sign :

mov		al, byte [rdx + rcx]
cmp		al, '-'
je		if_neg_sign

cmp		al, '+'
je		if_pos_sign

jmp		conversion

if_neg_sign :
imul	r10, -1
inc		rcx
jmp		check_sign

if_pos_sign :
inc		rcx
jmp		check_sign


conversion :

mov		al, byte [rdx + rcx]
cmp		al, 0
je		end_atoi_base

mov		rdi, rbx
mov		sil, byte [rdx + rcx]
call	getIndex
cmp		rax, -1
je		error_return

mov		r11, rax

call	ft_strlen

imul	r9, rax
add		r9, r11
inc		rcx
jmp		conversion


error_return :
pop		rdi
pop		rsi
pop		rax

mov		rax, 0
ret

end_atoi_base :
pop		rdi
pop		rsi
pop		rax

imul	r9, r10
mov		rax, r9
ret