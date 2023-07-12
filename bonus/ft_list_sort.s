global ft_list_sort
extern	__errno_location

section .text

ft_list_sort:

push	rcx
push	rsi
push	rdi

cmp		rdi, 0
je		end

cmp		rsi, 0
je		end

mov     rax, [rdi] ; ptr boucle outer
mov		r15, [rdi] ; garde ptr begin pour ptr 2
mov		rdx, rsi ; rdi garde ptr fct

outer_loop :

cmp 	rax, 0 ; ptr1 = null ?
je		end

mov		rbx, r15 ; ptr 2
push	rax

jmp		inner_loop

inner_loop :

cmp		qword [rbx + 8], 0 ; ptr2->next = null ?
je		iter_outer

xor		rax, rax

mov		rcx, [rbx + 8]
mov		rdi, [rbx] ; premier argument pr la fonction cmp
mov		rsi, [rcx] ; deuxieme argument pr la fonction cmp

call	rdx ; appel fct cmp
cmp		rax, 1
jne		iter_inner

mov		r9, [rbx + 8] 
mov		r10, [r9]

mov		r8, [rbx]
mov		[rbx], r10
mov		[r9], r8

jmp		iter_inner


iter_inner:

mov		rbx, [rbx + 8] ; ptr2 = ptr2->next
jmp		inner_loop

iter_outer :

pop		rax
mov		rax, [rax + 8] ; ptr = ptr->next
jmp		outer_loop


end :

pop		rdi
pop		rsi
pop		rcx

ret