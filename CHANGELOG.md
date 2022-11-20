## Change log

### Version 2.4

From @xet7:

* Added linux-arm64 binary to bin/
* Added garbage collection back
* Added dependencies for Ubuntu and Debian to Makefile

### Version 2.3

From @TheGeekOnSkates:

* Added a pre-compiled binary for 64-bit Linux (x86)
* Added documentation to the README (for anyone who doesn't know C well enough to read the comments)
* Added some tests demoing what fbasic can do
* Temporarily removed references to a garbage collection library that was a part of the original build, but wasn't included on GitHub; this introduced memory leaks we plan to fix in future versions.
* Other minor tweaks (comments in code, indent changes etc.) that are barely worth mentioning :)


### Version 2.2

From @TheGeekOnSkates:

* Zero-trip FOR/NEXT rather than one-trip
* Reformat braces
* WIDTH 255 as per MBASIC 5.21
* Skip OPTION statements. We currently do OPTION BASE 0, and ZEROTRIP FOR/NEXT loops
