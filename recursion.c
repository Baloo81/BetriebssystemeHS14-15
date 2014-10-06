#include <stdio.h>



int fac_intern(int n, int akk){
	if (n == 0){
		return akk;
	} else {
		return fac_intern(n-1, n*akk);
	}
}

int fac(int n){

	return fac_intern(n, 1);

}

int fac_nontailrec(int i){
	if (i<=0){
		return 1;
	} else {
		return i*fac_nontailrec(i-1);
	}
}

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
	printf("fac_loop von 4 = %d \n", fac_loop(4));
	printf("fac_nontailrec von 4 = %d \n", fac_nontailrec(4));
	printf("fac von 4 = %d \n", fac(4));

	return 0;
}

