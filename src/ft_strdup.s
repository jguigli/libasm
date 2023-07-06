global ft_strdup
extern	__errno_location

extern ft_strcpy
extern ft_strlen
extern malloc

section .text

ft_strdup :

mov rax, 0
mov r8, rdi
call ft_strlen
inc rax
mov rdi, rax
call malloc wrt ..plt
cmp rax, 0
jl error

mov rdi, rax
mov rsi, r8
call ft_strcpy
mov rax, rdi
ret

error:

neg rax
mov rdi, rax
call __errno_location wrt ..plt
mov [rax], rdi
mov rax, -1
ret