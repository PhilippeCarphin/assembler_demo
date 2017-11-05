
all:

gnu: main.gnu.s gnu.out

main.gnu.s:main.gnu.c
	gcc -S $< -o $@

gnu.out:main.gnu.c
	gcc -o $@ $<
