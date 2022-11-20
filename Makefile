#/bin/bash

all:
	gcc -DUNALIGNED_DOUBLES=1 -Os -o fbasic fbasic.c -lcurses -lm -lgc
	clear && ./fbasic

debian:
	echo "Debian with gc:"
	sudo apt-get -y install build-essential libgc-dev
	gcc -DUNALIGNED_DOUBLES=1 -Os -o fbasic fbasic.c -lcurses -lm -lgc
	#./fbasic

ubuntu:
	echo "Ubuntu with gc:"
	sudo apt-get -y install build-essential libgc-dev
	gcc -DUNALIGNED_DOUBLES=1 -Os -o fbasic fbasic.c -lcurses -lm -lgc
	#./fbasic

raspbian:
	echo "Raspbian 32-bit with gc:"
	sudo apt-get -y install build-essential libgc-dev
	gcc -Os -o fbasic fbasic.c -lcurses -lm -lgc
	#./fbasic

mac1:
	echo "Mac arm64, no gc:"
	gcc -DUNALIGNED_DOUBLES=1 -Os -o fbasic fbasic.c -lcurses -lm
	#cp fbasic bin/fbasic-mac-arm64
	#./fbasic

mac2:
	echo "Mac amd64, no gc:"
	arch -x86_64 gcc -DUNALIGNED_DOUBLES=1 -Os -o fbasic fbasic.c -lcurses -lm
	#cp fbasic bin/fbasic-mac-amd64
	#./fbasic

debug:
	gcc -DUNALIGNED_DOUBLES=1 -Os -g -Wall -Wextra -o fbasic fbasic.c -lcurses -lm -lgc
