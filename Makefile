SRCS     = $(wildcard *.c)
OBJS     = $(patsubst %.c, %.o, $(SRCS))
#CC=arm-linux-gnueabihf-gcc
CC=gcc
TARGETS +=tinyplay tinycap tinymix tinypcminfo
	
	
all: $(TARGETS)
	chmod 777 tinyplay tinycap tinymix tinypcminfo
	mkdir bin
	mv tinyplay	bin
	mv tinycap	bin
	mv tinymix	bin
	mv tinypcminfo  bin
	
##################
tinyplay: tinyplay.o pcm.o 
	$(CC)  -o tinyplay tinyplay.o pcm.o 

tinycap: tinycap.o pcm.o 
	$(CC) -o tinycap tinycap.o pcm.o 
	
tinymix: tinymix.o mixer.o
	$(CC)  -o tinymix tinymix.o mixer.o 
	
tinypcminfo: tinypcminfo.o pcm.o  
	$(CC)  -o tinypcminfo tinypcminfo.o pcm.o 
	
$(OBJS): %.o: %.c 
	$(CC) -c -o $@ $<

clean:
	rm -rf $(TARGETS) $(OBJS)
	rm -rf bin
