#include <stdio.h>
#include <pthread.h>


int fac_loop(int j){
	int k = 1;
	if (j<=0){
		return 1;
	} else{
		while (j>1){
			k = k*j;
			j--;
		}
	}

	return k;

}


int main(int argc, char *argv[]) 
{
	printf("fac_loop von 16 = %d \n", fac_loop(16));	
	return 0;
}

