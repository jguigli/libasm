#include "test.h"


int main() {
    // Test strcmp
    const char *str1 = "Hello";
    const char *str2 = "World";
	int cmp_result = strcmp(str1, str2);
    printf("strcmp result: %d\n", cmp_result);
    cmp_result = ft_strcmp(str1, str2);
    printf("ft_strcmp result: %d\n", cmp_result);

    // Test strcpy
    char dest[20];
	strcpy(dest, str1);
    printf("strcpy result: %s\n", dest);
    ft_strcpy(dest, str1);
    printf("ft_strcpy result: %s\n", dest);

    // Test strdup
	char *duplicate = strdup(str1);
    printf("strdup result: %s\n", duplicate);
    free(duplicate);
    duplicate = ft_strdup(str1);
    printf("ft_strdup result: %s\n", duplicate);
    free(duplicate);

    // Test strlen
	size_t len = strlen(str1);
    printf("strlen result: %zu\n", len);
    len = ft_strlen(str1);
    printf("ft_strlen result: %zu\n", len);

    // Test read
	char buffer[100];
    printf("Enter a string for read: \n");
    ssize_t bytes_read = read(STDIN_FILENO, buffer, sizeof(buffer));
    buffer[bytes_read - 1] = '\0';
    printf("read result: %s\n", buffer);

    printf("Enter a string for ft_read: \n");
    bytes_read = ft_read(STDIN_FILENO, buffer, sizeof(buffer));
    buffer[bytes_read - 1] = '\0';
    printf("ft_read result: %s\n", buffer);

    // Test write
	const char *message = "Hello from write!\n";
    write(STDOUT_FILENO, message, strlen(message));
    message = "Hello from ft_write!\n";
    ft_write(STDOUT_FILENO, message, strlen(message));

    return 0;
}