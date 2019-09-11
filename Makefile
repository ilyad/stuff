all: exe

a.o: a.c
	gcc -x c -c a.c -o a.o

b.o: b.c++
	gcc -x c++ -c b.c++ -o b.o

main.o: main.c
	gcc -x c -c main.c -o main.o

clean:
	rm -f a.o b.o blah.a main.o

blah.a: a.o
	rm -f $@
	ar rc $@ $^
	ar -t blah.a
	nm -C blah.a

exe: blah.a main.o
	gcc blah.a main.o -o exe
	./exe