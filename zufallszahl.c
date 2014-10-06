#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int get_zufallszahl(int max_randomnummer){
	int randomnummer = rand() % max_randomnummer + 1;
	// sleep(1);
	return randomnummer;
}


int main(int argc, char *argv[]) 
{
	int i = 1;
	srand(time(NULL));
	while(i <= 18){
		int randomnummer;
		randomnummer = get_zufallszahl(6);
		printf ("Zufallszahl %d ist %d\n", i, randomnummer) ;
		i++;
	}
	return 0;
}