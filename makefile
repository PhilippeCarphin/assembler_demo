
NO_WARNING=-Wno-implicit-function-declaration
all: phil gnu

phil.out:main.phil.c
	gcc -o $@ $<
gnu: gnuasm gnu.out

gnuasm:main.gnu.s

main.gnu.s:main.gnu.c
	gcc -S $< -o $@ $(NO_WARNING)

gnu.out:main.gnu.c
	gcc -o $@ $<

clean:
	$(RM) *.gnu.s *.o *.out
