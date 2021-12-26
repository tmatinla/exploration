# Abacan in Ada

## Ada

First in the series of my exploration of different programming languages is [Ada](https://en.wikipedia.org/wiki/Ada_(programming_language)).

Before I started, I had not been exposed to any Ada code. It is somewhat similar to [Pascal](https://en.wikipedia.org/wiki/Pascal_(programming_language)), which I did learn in school in the early 1990s (and not used since), so many structures seem eternally familiar.

## Abacan

I was googling around games that start with letter *A* and stumbled to a quite simple two player board game named Abacan. It's a triangle-shaped board that reminds of an [abacus](https://en.wikipedia.org/wiki/Abacus#School_abacus). The idea of the game is to move beads from one end of the wire to the another so that whoever moves the last bead loses. The rules are simple: in each turn, move one, two or three pieces at a time on one row.

## Abacan in Ada

So, the task is set to create Abacan game using Ada.

### Some initial ideas about implementing the game

Immediately I thought representing the game board with rudimentary ascii graphics, each bead in the wire represented by an asterisk:

    1      *--
    2     ***--
    3    *****--
    4   *******--
    5  *********--

The number of beads in for the each wire is 1, 3, 5, 7, and 9, from the top wire. It's quite easy to notice that the total number of beads on each wire is *2i - 1* for wire index *i* (using index starting from 1).

That actually could give us a starting point for a simple data structure to represent the board. If we say that the board is a list of five integers, each integer can represent how many there are left to move on each wire. So, in the starting position our list would be the same as number of beads for each wire and a list of zeros would then implicate the end of the game. In the middle of the game, list of 0, 2, 3, 0, 1 would look like this:

    1      --*
    2     **--*
    3    ***--**
    4   --*******
    5  *--********

At this point, I have no idea how to implement optimal winning strategy for the game. But, I'm thinking to implement a two player version of the game anyway, so adding a computer player later is optional.

### Installing Ada compiler

I downloaded [GNAT Community Edition](https://www.adacore.com/download/more) for Mac OS X (currently I'm on Monterey as of writing this), ran the installer (after fiddling with permissions, see the accompanied readme from download page) and after adding the installation bin folder to PATH was set to test compiling a hello world program (from Wikipedia). Note that I have XCode and command line tools installed, I think those are required as well. First compilation failed with error

    ld: library not found for -lSystem

After adding ``/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib`` to ``LIBRARY_PATH`` environment variable I was able to compile and run the hello world program.

### Learning Ada

I struggled somewhat to find some resources where to learn about the language (perhaps because it is quite niche language these days), but [The Lovelace Tutorial](https://www.adahome.com/Tutorials/Lovelace/lovelace.htm) was enough to get me started.

### Organization of code

Ada code is organized into *packages* which are like modules in many languages. The GNAT compiler mandates one package per file. ``*.ads`` files acts as interface definitions and ``*.adb`` files contain the actual implementation. Main code is divided to just one package (``Boards``) which defines the behavior of th Abacan board (a plural name is used as a convention since the name ``Board`` is the actual object or type in Ada's terms).

I also borrowed ``Ustrings`` package from the tutorial example code to help with string handling (Ada does include an ``Unbounded_String`` type but no functions for I/O with it).

### Compiling the code and running the game

When the compiler is installed, just ``gnatmake abacan.adb``. After it's compiled, you should be able to start the ``abacan`` executable.

### Example gameplay

    Name of player 1: Ada
    Name of player 2: Byron
              1      *--
              2     ***--
              3    *****--
              4   *******--
              5  *********--
    Turn: Ada
    Select wire [1-5]: 1
    Number of beads to move [1-3]: 1
              1      --*
              2     ***--
              3    *****--
              4   *******--
              5  *********--
    Turn: Byron
    Select wire [1-5]: 2
    Number of beads to move [1-3]: 3
              1      --*
              2     --***
              3    *****--
              4   *******--
              5  *********--

*...after some more turns...*

              1      --*
              2     --***
              3    --*****
              4   *--******
              5  ***--******
    Turn: Ada
    Select wire [1-5]: 5
    Number of beads to move [1-3]: 3
              1      --*
              2     --***
              3    --*****
              4   *--******
              5  --*********
    Turn: Byron
    Select wire [1-5]: 1
    Number of beads to move [1-3]: 1
    Unable to make that move. Try again.
    Select wire [1-5]: 4
    Number of beads to move [1-3]: 1
    Ada wins!

There is some rudimentary checks to see if a move is legal, as you can see from above. It would be of course be possible to check what legal moves are left and only offer those as an option, but I'll leave that for an exercise to some later time or for the reader. Also generalizing the code to handle different sized boards etc should be quite easy.

## Conclusions

All of this was created in one night; most of the time I spent reading the tutorial, some of the time was also spent on fixing some bugs and tweaking the code. All in all, the language itself is quite straightforward although it is somewhat laborious compared to some other languages I'm more familiar with. This was still a nice experience. I might have wished to harness the type system of the language more, but for such a simple problem it would not have made a lot of sense.

Any comments are of course welcome. Please bear in mind this was my first program with this language. :)