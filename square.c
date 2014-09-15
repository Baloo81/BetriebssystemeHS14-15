#include <stdio.h>
#include <stdlib.h>



int main(int argc, char *argv[]) 
{
	int i = 0;

	while(i <= 100){
		printf ("%d ist die Quadratzahl von %d\n", i*i, i);
		i++;
		int r = rand() % 5000000;
		usleep (r);
	}

	return 0;


}

