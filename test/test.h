#ifndef TEST_H
#define TEST_H

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* MANDATORY */
extern int ft_strcmp(const char *s1, const char *s2);
extern char* ft_strcpy(char *dest, const char *src);
extern char* ft_strdup(const char *src);
extern size_t ft_strlen(const char *s);
extern ssize_t ft_read(int fd, void *buf, size_t count);
extern ssize_t ft_write(int fd, const void *buf, size_t count);

/* BONUS */
extern int ft_atoi_base(char *str, char *base);
extern void	ft_list_push_front(t_list **begin_list, void *data);
extern int ft_list_size(t_list *begin_list);
extern void	ft_list_sort(t_list **begin_list, int (*cmp)());
extern void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)());

typedef struct s_list
{
	void *data;
	struct s_list *next;
} t_list;

#endif
