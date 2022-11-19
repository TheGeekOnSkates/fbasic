# fbasic

Here is a rare oddity, a BASIC interpreter meant to run MBASIC (and some GWBASIC) applications on Linux and Solaris.  Originally designed as a "quick and dirty hack" by Fred Weigel in 2000-2001, it's a surprisingly robust little BASIC.  The entire interpreter is contained in a single file, and it has most of the stuff you would expect a BASIC to have.  The docs are still very much a work in progress, but if you've used 8-bit BASICs before, then fbasic should be easy to figure out.


## User's manual

### Quickstart - The basics (cheesy pun intended)

Like most languages with "BASIC" in the name, fbasic has two modes: "program mode" and "direct mode".  Direct mode is what you start off in, where you can type commands.  For example, run the program and type this:

`print "Hello, world!"`

Press Enter, and fbasic immediately prints your message on the screen.  That's direct mode.  Now try this:

`10 print "What the fbasic? :) ";`

Nothing happened.  This is because the "10" is a line number.  Imagine you start out with a blank page; that's your program (which is why we call it program mode).  The line of code you typed is now line #10 of that program.  You can overwrite it if you like, or add more lines, and then run your program by typing `run` and pressing Enter.  Hopefully, this is all old news to you (and if you went looking for a BASIC you probably already knew it), but we figured, no harm in reviewing a little.

Now, let's try something a bit goofy. add this to your program:

`20 goto 10`

The text "What the fbasic? :) " should print like crazy!  To stop it, press CTRL-C.  this was a fun little trick beginners used to do (and computer stores used to have running in their front windows) back in the 80s, and it still looks cool (or at least is good for a laugh) in the 2020s.

So how does it work?  Well, the program starts at line zero; there is nothing there.  Then it goes to line 1.  Nothing there either.  Eventually it gets to line 10, sees the "print" instruction and does what it's told.  After skipping a bunch of other blank lines, it finds line 20, which tells it to go back to line 10.  Then it keeps going till it gets to 20 again and repeats itself over and over again.  Easy enough, right?  Well this is only the beginning of what fbasic can do.  From here out we'll just list instructions, but you can see how to do things by loading some of the tests that come with this code.

Another important note: this BASIC doesn't care about whether you use uppercase or lowercase (it's not "case-sensitive").  So if you like PRINT like 8-bit systems, Print like in modern "visual" brands of BASIC, whatever - Print and print and PRINT and prInT are all going to do the same thing.


## Language reference

### PRINT

Prints (displays) text on the screen

### GOTO line number

Changes the line number (see the quickstart above for an example).  You can also create a variable and use that.  Like let's say you have a really huge program; you could do...

```
10 WHEREVER = 1000
REM ELSEWHERE IN THE CODE...
GOTO WHEREVER
```

### GOSUB line number (or variable) and RETURN

GOSUB is like GOTO, except that after it goes to a new line, it expects that somewhere else in your program there will be a RETURN statement.  GOSUB and RETURN together make it possible to create your own instructions.  For example, I can do this:

```
10 LET RED = 300
20 GOSUB RED
30 PRINT "THIS TEXT SHOULD BE RED."
299 END
300 REM Set the text color to red
310 PRINT CHR$(27);: PRINT "[1;31m";
320 RETURN
```

Let's look at this program:

* In line 10, I'm assigning the number 300 to a variable named "RED".
* In line 20, I'm saying, go to a "subroutine" (like a made-up instruction) called "RED".  RED = 300, so it jumps down to line 300.
* Line 300 is a comment.
* Line 310 prints an ANSI escape code that (on most terminals) will make the text bright red.
* Line 320 is RETURN; now it "returns" to where we left off before we called GOSUB.  That was line 21.
* Line 30 prints some text, and it should be red.
* Line 299 ends the program.

Of course you don't have to use a variable; you could just run `GOSUB 300` and that would save a little typing.  But if you're writing anything more than 10-20 lines, having human-readable names is a huge help.

### LET variable = value

Sets a variable; the actual "let" word is totally optional.  What is _not_ optional is how variables should be named.  If it's text (if it's a "string" of characters), it has to end with a dollar sign.  So you can do:

```
LET X = 7
LET LANGUAGE$ = "fbasic"
REM or without LET
today$ = "Friday"
y = 1.234
```

We used variables in a lot of examples, so we'll LET you look at those (lol) for more info.

### LOAD "file name"

Loads an fbasic program into memory.  The files don't necessarily have to end with ".bas" (though you can).  These files are really not meant to be used in external editors though.  The instructions are not in plain text, so there's not really any reason they have to be ".bas" files.

### SAVE "file name"

Saves your current program to a file.  These are the files you'll want to LOAD later.

### SYSTEM "program name"

This is what takes fbasic from a fun little toy to a powerful tool.  You can use it for shell scripting!  We'll let the examples speak for themselves. :)

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
