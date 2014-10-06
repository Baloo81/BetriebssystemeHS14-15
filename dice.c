#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int get_zufallszahl(int max_randomnummer){
	int randomnummer = rand() % max_randomnummer + 1;
	return randomnummer;
}


int main(int argc, char *argv[]) 
{
	int i = 1;
	int k = 1;
	int j1 = 0;
	int j2 = 0;
	int j3 = 0;
	int j4 = 0;
	int j5 = 0;
	int j6 = 0;
	srand(time(NULL));
	// while(i <= 18){
	// 	int randomnummer;
	// 	randomnummer = get_zufallszahl(6);
	// 	printf ("Würfel %d ist %d\n", i, randomnummer) ;
	// 	i++;
	// }
	while(i<=180000){
		int randomnummer;
		randomnummer = get_zufallszahl(6);
		if(randomnummer == 1){
			j1++;	
		} 
		else if(randomnummer == 2){
			j2++;
		}
		else if(randomnummer == 3){
			j3++;
		}
		else if(randomnummer == 4){
			j4++;
		}
		else if(randomnummer == 5){
			j5++;
		}
		else{
			j6++;
		}

		i++;
	} 
	printf ("Anzahl der Würfel mit einer 1 ist %d\n", j1);
	printf ("Anzahl der Würfel mit einer 2 ist %d\n", j2);
	printf ("Anzahl der Würfel mit einer 3 ist %d\n", j3);
	printf ("Anzahl der Würfel mit einer 4 ist %d\n", j4);
	printf ("Anzahl der Würfel mit einer 5 ist %d\n", j5);
	printf ("Anzahl der Würfel mit einer 6 ist %d\n", j6);
	
	return 0;
}