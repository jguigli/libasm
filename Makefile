SRC_M = ./src/ft_read.s
		./src/ft_strcmp.s
		./src/ft_strcpy.s
		./src/ft_strdup.s
		./src/ft_strlen.s
		./src/ft_write.s

SRC_B = 


HEADER			=	
HEADER_BONUS	=	

SOURCES			=	$(SRC_M)
BONUS_FILES		=	$(SRC_B)

OBJECTS			= 	$(SOURCES:.s=.o)
OBJECTS_BONUS	= 	$(BONUS_FILES:.s=.o)

NAME			=	libasm.a
NAME_BONUS		=	

CC				=	nasm
RM				=	rm -f

CFLAGS			=	-f elf64

.s.o:
				$(CC) $(CFLAGS) -c $< -o $(<:.s=.o)

all:			$(NAME)

bonus:			$(NAME_BONUS)

$(NAME):		$(OBJECTS)
				ar -rcs $(NAME) $(OBJECTS)

$(NAME_BONUS):	$(OBJECTS) $(OBJECTS_BONUS)
				ar -rcs $(NAME) $(OBJECTS) $(OBJECTS_BONUS)

clean:
				$(RM) $(OBJECTS) $(OBJECTS_BONUS)

fclean:			clean
				$(RM) $(NAME) $(NAME_BONUS)

re:				fclean all

.PHONY:			all clean fclean re bonus