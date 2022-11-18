# fbasic

Here is a rare oddity, a BASIC interpreter meant to run MBASIC (and some GWBASIC) applications on Linux and Solaris.  Originally designed as a "quick and dirty hack" by Fred Weigel in 2000-2001, it's a surprisingly robust little BASIC.  The entire interpreter is contained in a single file, and it has most of the stuff you would expect a BASIC to have.  The docs are still very much a work in progress, but if you've used 8-bit BASICs before, then fbasic should be easy to figure out.


## User's manual

### The basics (cheesy pun intended)

Like most languages with "BASIC" in the name, fbasic has two modes: "program mode" and "direct mode".  Direct mode is what you start off in, where you can type commands.  For example, run the program and type this:

`print "Hello, world!"`

Press Enter, and fbasic immediately prints your message on the screen.  That's direct mode.  Now try this:

`10 print "What the fbasic? :) ";`

Nothing happened.  This is because the "10" is a line number.  Imagine you start out with a blank page; that's your program (which is why we call it program mode).  The line of code you typed is now line #10 of that program.  You can overwrite it if you like, or add more lines, and then run your program by typing `run` and pressing Enter.  Hopefully, this is all old news to you (and if you went looking for a BASIC you probably already knew it), but we figured, no harm in reviewing a little.

Now, let's try something a bit goofy. add this to your program:

`20 goto 10`

The text "What the fbasic? :) " should print like crazy!  To stop it, press CTRL-C.  this was a fun little trick beginners used to do (and computer stores used to have running in their front windows) back in the 80s, and it still looks cool (or at least is good for a laugh) in the 2020s.

So how does it work?  Well, the program starts at line zero; there is nothing there.  Then it goes to line 1.  Nothing there either.  Eventually it gets to line 10, sees the "print" instruction and does what it's told.  After skipping a bunch of other blank lines, it finds line 20, which tells it to go back to line 10.  Then it keeps going till it gets to 20 again and repeats itself over and over again.  Easy enough, right?  Well this is only the beginning of what fbasic can do.  From here out we'll just list instructions, but you can see how to do things by loading some of the tests that come with this code.


## Language reference

### PRINT

Prints (displays) text on the screen

### MKDIR "folder name/path"

Creates a folder ("MKDIR" was an ancient expression that meant "make directory".  In this century we call them folders, but since most BASICS call them "directories" we're sticking with MKDIR for compatibility reasons).

### CHDIR "folder name/path"

Changes which folder/directory you're in (like the "cd" command in DOS or Bash or PowerShell).  Again, an easy way to remember this is that it meant "change directory" back when we dinosaurs roamed the earth. :)

### RMDIR "folder name/path"

Deletes a folder ("remove directory")

### FILES

Lists files in the folder you're in

## Building

* If you're on a system that has GNU Make, just run "make".
* If you're not, just copy the gcc command out of the makefile and run that.


## Change log

### Version 2.3

* Added a pre-compiled binary for 64-bit Linux (x86)
* Added documentation to the README (for anyone who doesn't know C well enough to read the comments)
* Added some tests demoing what fbasic can do
* Temporarily removed references to a garbage collection library that was a part of the original build, but wasn't included on GitHub; this introduced memory leaks we plan to fix in future versions.
* Other minor tweaks (comments in code, indent changes etc.) that are barely worth mentioning :)


### Version 2.2

* Zero-trip FOR/NEXT rather than one-trip
* Reformat braces
* WIDTH 255 as per MBASIC 5.21
* Skip OPTION statements. We currently do OPTION BASE 0, and ZEROTRIP FOR/NEXT loops
