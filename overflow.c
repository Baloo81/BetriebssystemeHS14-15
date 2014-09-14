#include <stdio.h>


int main(int argc, char *argv[]) 
{
	int x = 7000000000;
	int y = 80000000;
	printf ("Overflow = %d\n", x+y) ;
	
	float a = 44.1111111;
	float b = 11.4444444;
	printf ("Rundungsfehler = %f\n", (a+b)*1000);

	return 0;
}

