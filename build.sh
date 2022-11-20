sudo apt-get -y install build-essential libgc-dev
mkdir bin
gcc -Os -o bin/fbasic -DUNALIGNED_DOUBLES=1 fbasic.c -lcurses -lm -lgc
strip bin/fbasic
echo "Done. Executeable at bin/fbasic."
