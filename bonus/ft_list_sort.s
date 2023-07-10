global ft_list_sort
extern	__errno_location

section .text

ft_list_sort:

mov     rax, [rdi]
cmp 	rax, 0
je		end

outer_loop :

mov     rax, [rax]
cmp 	rax, 0
je		end

inner_loop :

mov     rcx, 


end :

mov     rsp, rbp
pop     rbp