
NO_WARNING=-Wno-implicit-function-declaration
all: phil.out
	./phil.out

phil.out:main.phil.s
	gcc -o $@ $<
gnu: gnuasm gnu.out

gnuasm:main.gnu.s

main.gnu.s:main.gnu.c
	gcc -S $< -o $@ $(NO_WARNING)

gnu.out:main.gnu.c
	gcc -o $@ $<

clean:
	$(RM) *.gnu.s *.o *.out
