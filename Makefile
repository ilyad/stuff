.NOTPARALLEL:

rebuild: clean all

all: exe

a.o: a.c
	gcc -x c -c a.c -o a.o -save-temps=obj

b.o: b.c++
	gcc -x c++ -c b.c++ -o b.o -save-temps=obj

main.o: main.c
	gcc -x c -c main.c -o main.o -save-temps=obj

clean: SHELL:=/bin/bash
clean:
	rm -f blah.a exe {a,b,main}.{o,i,s,ii}

blah.a: a.o b.o
	rm -f $@
	ar rc $@ $^
	ar -t blah.a
	nm -C blah.a

exe: main.o blah.a
	gcc $^ -o exe
	./exe
