

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
    
int get_zufallszahl(int max_randomnummer){
	int randomnummer = rand() % max_randomnummer + 1;
	return randomnummer;
}

int main(void)
{
	srand(time(NULL));
	int magic = get_zufallszahl(1000);
	// int magic = 42;
    int guess;
    int schleife = 1;
    int versuche = 1;
    printf("Finde die magische Zahl zwischen 1 und 1000:\n");

    while (schleife == 1)
    {
    	scanf("%d", &guess);
    	if(guess  == magic) 
    	{
    		printf("OK, Du hast es! Es waren %d Versuche notwendig\n", versuche);
	        schleife = 0;
	        versuche++;
	    }
	    else
	    {
	    	if(guess < magic)
	    	{
	    		printf("zu klein\n %d Versuche\n", versuche);
	            versuche++;
	        }
	        if(guess > magic)
	        {
	        	printf("zu groß\n%d Versuche\n", versuche);
	         	versuche++;
	        }
	    }
	}
    
      return 0;
}
