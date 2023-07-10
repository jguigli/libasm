#include "test.h"

int compare_ints(void *a, void *b) {
    int num1 = *((int*)a);
    int num2 = *((int*)b);
    
    if (num1 < num2)
        return -1;
    else if (num1 > num2)
        return 1;
    else
        return 0;
}

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

    // Test atoi_base
    // char str[] = "FF";
    // char base[] = "0123456789ABCDEF";
    // int result = ft_atoi_base(str, base);
    // printf("Le résultat de ft_atoi_base est : %d\n", result);

    // Test list_push_front
    t_list *list = NULL;
    int data1 = 10;
    int data2 = 20;
    int data3 = 30;
    
    ft_list_push_front(&list, &data1);
    ft_list_push_front(&list, &data2);
    ft_list_push_front(&list, &data3);
    
    t_list *current = list;
    while (current != NULL) {
        printf("%d\n", *((int*)current->data));
        current = current->next;
    }

    // Test list_size
    int size = ft_list_size(list);
    printf("La taille de la liste est : %d\n", size);

    // Test list_sort
    // ft_list_sort(&list, compare_ints);
    
    // current = list;
    // while (current != NULL) {
    //     printf("%d\n", *((int*)current->data));
    //     current = current->next;
    // }

    // Test list_remove_if
    // int data_to_remove = 20;
    // ft_list_remove_if(&list, &data_to_remove, compare_ints);
    
    // current = list;
    // while (current != NULL) {
    //     printf("%d\n", *((int*)current->data));
    //     current = current->next;
    // }

    return 0;
}