# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: teicheld <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/07/13 15:11:33 by teicheld          #+#    #+#              #
#    Updated: 2021/07/21 19:57:49 by teicheld         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
C_PURPLE_B=\033[1;95m
C_RESET=\033[0;39m

SRCS	= ./srcs/main.c ./srcs/solution.c ./srcs/utilities.c ./srcs/realtimeStreamFS_parse.c ./srcs/realtimeStreamFS_parse2.c ./srcs/realtimeStreamFS_grid.c 
OBJS	= ${SRCS:.c=.o}
INCS	= includes
NAME	= realtimeStreamFS
CC		= gcc
RM		= rm -f
CFLAGS	= -Wall -Wextra -Werror -g

.c.o :
	${CC} ${CFLAGS} -c $< -o ${<:.c=.o} -I${INCS}

${NAME} : ${OBJS}
	${CC} ${CFLAGS} ${OBJS} -o ${NAME}

all : ${NAME}

run :
	./${NAME}

clean :
	${RM} ${OBJS}

fclean : clean
	${RM} ${NAME}

norm :
	norminette */*.[ch]

check : re
	@echo "[$(C_PURPLE_B)TESTING$(C_RESET)] Testing an empty file" ;
	@./${NAME} ./tests/cases/empty_map || true ;
	@##
	@echo "[$(C_PURPLE_B)TESTING$(C_RESET)] Testing an invalid map" ;
	@./${NAME} ./tests/cases/invalid_map || true ;
	@##
	@echo "[$(C_PURPLE_B)TESTING$(C_RESET)] Testing 1x1 maps" ;
	@./${NAME} ./tests/cases/one_by_one_* || true ;
	@##
	@echo "[$(C_PURPLE_B)TESTING$(C_RESET)] Testing maps with irregular width" ;
	@./${NAME} ./tests/cases/map_with_irregular_width* || true ;
	@##
	@echo "[$(C_PURPLE_B)TESTING$(C_RESET)] Testing maps with invalid header" ;
	@./${NAME} ./tests/cases/map_with_invalid_header* || true ;
	@##
	@echo "[$(C_PURPLE_B)TESTING$(C_RESET)] Testing maps with invalid height" ;
	@./${NAME} ./tests/cases/map_with_invalid_height* || true ;
	@##
	@echo "[$(C_PURPLE_B)TESTING$(C_RESET)] Testing a map without any column" ;
	@./${NAME} ./tests/cases/no_colomn_line || true ;
	@##
	@echo "[$(C_PURPLE_B)TESTING$(C_RESET)] Testing maps with only one column" ;
	@./${NAME} ./tests/cases/one_colomn_line* || true ;
	@##
	@echo "[$(C_PURPLE_B)TESTING$(C_RESET)] Testing maps with only one line" ;
	@./${NAME} ./tests/cases/one_line_colomn* || true ;
	@##
	@echo "[$(C_PURPLE_B)TESTING$(C_RESET)] Testing 2x2 maps:" ;
	@./${NAME} ./tests/cases/two_by_two* || true ;
	@##

re : fclean all

test : re

.PHONY: all clean fclean re .c.o test
