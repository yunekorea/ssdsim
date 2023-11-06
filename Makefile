# ssdsim linux support
CFLAGS = \
				-DDEBUG

all:ssd 
	
clean:
	rm -f ssd *.o *~
.PHONY: clean

ssd: ssd.o avlTree.o flash.o initialize.o pagemap.o     
	cc $(CFLAGS) -g -o ssd ssd.o avlTree.o flash.o initialize.o pagemap.o
	rm *.o
ssd.o: flash.h initialize.h pagemap.h
	gcc $(CFLAGS) -c -g ssd.c
flash.o: pagemap.h
	gcc $(CFLAGS) -c -g flash.c
initialize.o: avlTree.h pagemap.h
	gcc $(CFLAGS) -c -g initialize.c
pagemap.o: initialize.h
	gcc $(CFLAGS) -c -g pagemap.c
avlTree.o: 
	gcc $(CFLAGS) -c -g avlTree.c
