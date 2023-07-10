SRC_M = ./src/ft_read.s \
		./src/ft_strcmp.s \
		./src/ft_strcpy.s \
		./src/ft_strdup.s \
		./src/ft_strlen.s \
		./src/ft_write.s \

SRC_B = ./bonus/ft_list_push_front.s \
		./bonus/ft_list_sort.s \

TEST = ./test/test.c \

SOURCES			=	$(SRC_M)
SOURCES_B		= 	$(SRC_B)
TESTFILES		=	$(TEST)

OBJECTS			= 	$(SOURCES:.s=.o)
OBJECTS_B		=	$(SOURCES_B:.s=.o)
OBJECTS_TEST	= 	$(TEST:.c=.o)
DEP_TEST		=	$(TEST:.c=.d)

NAME			=	libasm.a
EXEC			= 	asmtest

CC				=	nasm
RM				=	rm -f

CFLAGS			=	-f elf64 -g

.s.o:
				$(CC) $(CFLAGS) $< -o $(<:.s=.o)
.c.o:
				gcc -g -MMD -c $< -o $@ -I $(DEP_TEST)

all:			$(NAME)

bonus:			$(NAME) $(OBJECTS_B)
				ar -rcs $(NAME) $(OBJECTS) $(OBJECTS_B)

$(NAME):		$(OBJECTS)
				ar -rcs $(NAME) $(OBJECTS)

test:			$(NAME) $(OBJECTS_TEST)
				gcc -g $(OBJECTS_TEST) $(NAME) -o $(EXEC)
				./$(EXEC)

clean:
				$(RM) $(OBJECTS) $(OBJECTS_TEST) $(DEP_TEST)

fclean:			clean
				$(RM) $(NAME) $(EXEC)

re:				fclean all

.PHONY:			all clean fclean re bonus