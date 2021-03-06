# Project: realtimeStreamFS

## Description

The program searches the biggest free square on a map with obstacles.
The task required us to use exclusively the low level functions "exit, open, close, write, read, malloc and free".

## Compile and run

There is a precompiled version included.
#### Download the software:

###### Linux:  

	wget https://github.com/teicheld/realtimeStreamFS/archive/refs/heads/master.zip && unzip master.zip && rm master.zip

###### Windows:  

	download the file using your browser: Click on "Code" and choose "Download Zip", extract it.

#### Installing build dependencies and build it

###### Linux:  

	cd realtimeStreamFS-master
	[ ! -f /usr/bin/make ] && sudo apt install make
	make

###### Windows:  

	Open the command prompt inside of the directory.
	Do nothing. Use the precompiled version in the next step.

#### run it:

###### Linux:  

reads from stdin:  

	./tests/grid_generator.perl 60 30 3 | ./realtimeStreamFS  

reads from file(s):  

	./tests/grid_generator.perl 30 15 3 > map1
	./tests/grid_generator.perl 30 15 3 > map2 
	./realtimeStreamFS map1 map2

###### Windows:  

reads from file(s):  

	perl .\tests\grid_generator.perl 30 15 3 > map1
	perl .\tests\grid_generator.perl 30 15 3 > map2 
	.\realtimeStreamFS map1 map2

##### Additional tips

- grid_generator arguments: <xMax> <yMax> <densityOfObstacles>
- Run the script in a loop:

###### Linux:  

- let the program pass a bunch of executions with increasing field-width.

	for i in {1..100}; do echo execution $i; ./tests/grid_generator.perl $i 13 3 | ./realtimeStreamFS; done

###### Linux:

	make check

##### Screenshots:

	./grid_generator.perl 40 20 3 | ./realtimeStreamFS  
	...............o.......................o
	..........o...................o....o....
	....o.............................o.....
	....o..................o...o............
	..................o.....................
	.......o.....o.........o.........o......
	.........o......o.o.oo.......o..........
	.........o.o.......o..........o..o......
	..oo...................o................
	....................o..o................
	....o.....o........................o....
	..o...................o......xxxxxxxx...
	.o..........................oxxxxxxxx..o
	.............o............o..xxxxxxxx...
	.............................xxxxxxxx...
	..............o...o....o.....xxxxxxxx...
	..........o.o........o......oxxxxxxxx...
	...................o.........xxxxxxxxo..
	.............o.o.............xxxxxxxx...
	...o..........o..o....o.........o.......
	  
	./grid_generator.perl 40 20 4 | ./realtimeStreamFS  
	......o...o......o..o........o.........o
	..o.o...o.........................o..o..
	..o.o..............oo.o.......o.........
	.....................o...oxxxxxx........
	.o.....o..................xxxxxxo.o.....
	.o..........o..........o..xxxxxx......o.
	.............o.o..........xxxxxx.......o
	o.........................xxxxxx...o....
	...............o..........xxxxxx........
	........o.......o.......o....o.....o.o..
	.............o.................o........
	...o..................o...o......o...o..
	..................o.............o.o.....
	...................o.o................o.
	.....o....ooo..o.........o.......o......
	..............o........o................
	...............o......o....o.o..........
	..o.o...o....................o..........
	.........o.....o...o........o...........
	...o......o.........oo..................
