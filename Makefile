all:
	gcc -DUNALIGNED_DOUBLES=1 -Os -o fbasic fbasic.c -lcurses -lm -lgc
