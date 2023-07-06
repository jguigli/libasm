#ifndef TEST_H
#define TEST_H

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int ft_strcmp(const char *s1, const char *s2);
extern char* ft_strcpy(char *dest, const char *src);
extern char* ft_strdup(const char *src);
extern size_t ft_strlen(const char *s);
extern ssize_t ft_read(int fd, void *buf, size_t count);
extern ssize_t ft_write(int fd, const void *buf, size_t count);

#endif
