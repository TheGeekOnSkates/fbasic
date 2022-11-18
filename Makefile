all:
	clear && gcc -DUNALIGNED_DOUBLES=1 -Os -Wall -Wextra -o fbasic fbasic.c -lcurses -lm
