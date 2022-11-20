all:
	sudo apt-get -y install build-essential libgc-dev
	gcc -DUNALIGNED_DOUBLES=1 -Os -o fbasic fbasic.c -lcurses -lm -lgc
	clear && ./fbasic

debug:
	sudo apt-get -y install build-essential libgc-dev
	gcc -DUNALIGNED_DOUBLES=1 -Os -g -Wall -Wextra -o fbasic fbasic.c -lcurses -lm -lgc
