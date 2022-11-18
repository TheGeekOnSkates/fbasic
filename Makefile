all:
	gcc -DUNALIGNED_DOUBLES=1 -Os -o fbasic fbasic.c -lcurses -lm
	clear && ./fbasic

debug:
	gcc -DUNALIGNED_DOUBLES=1 -Os -g -Wall -Wextra -o fbasic fbasic.c -lcurses -lm
