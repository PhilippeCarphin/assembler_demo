#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void)
{
	int c = add(88,77);

	if(c == 165){
		printf("Testing add : passed\n");
	} else {
		printf("Testing add failed : got %d\n", c);
	}

	void *p;
	printf("An address : %p\n", p);

	return 0;
}

