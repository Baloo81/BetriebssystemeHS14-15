/* To do:
- delete this coments (after reading it to the end)
- change name to a usefull name
- push to git
- send Email to teacher
*/
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <pthread.h>

int head_index = 0;
int tail_index = 0;
int hw_buffer[1000];

pthread_t p1, p2, p3;
pthread_t k1, k2, k3;
pthread_mutex_t p_lock;
pthread_mutex_t k_lock;

int get_zufallszahl(int max_randomnummer){
	int randomnummer = rand() % max_randomnummer + 1;
	return randomnummer;
}

void put_rand_in_hw_buffer(int rand_nr){
	hw_buffer[head_index] = rand_nr;
	head_index = (head_index + 1) % 1000;
}


int get_rand_from_hw_buffer(){
	int temp_index = tail_index;
	tail_index = (tail_index + 1) % 1000;
	return hw_buffer[temp_index];
}


void *produzent (){
	
	while(1){
		pthread_mutex_lock(&p_lock);
		if (tail_index - head_index != 1 && tail_index - head_index != 999 ){
			// int z = get_zufallszahl(1000);
			// printf("Einfügen in Puffer %d\n", z);
			// put_rand_in_hw_buffer(z);
			put_rand_in_hw_buffer(get_zufallszahl(1000));
		} 
		pthread_mutex_unlock(&p_lock);
		sleep(get_zufallszahl(5));
	}
	return NULL;
}

void *konsument (){
	while(1){
		pthread_mutex_lock(&k_lock);
		if (head_index - tail_index != 0){
			printf("Auslesen aus Puffer: %d\n", get_rand_from_hw_buffer());
		} 
		pthread_mutex_unlock(&k_lock);
		sleep(get_zufallszahl(5));
	}
	return NULL;
}


int main(int argc, char *argv[]) {
	srand(time(NULL));



	pthread_create (&p1, NULL, produzent, NULL);
	pthread_create (&p2, NULL, produzent, NULL);
	pthread_create (&p3, NULL, produzent, NULL);
	sleep(10);
	pthread_create (&k1, NULL, konsument, NULL);
	pthread_create (&k2, NULL, konsument, NULL);
	pthread_create (&k3, NULL, konsument, NULL);
	
	pthread_join (p1, NULL);
	pthread_join (p2, NULL);
	pthread_join (p3, NULL);
	pthread_join (k1, NULL);
	pthread_join (k2, NULL);
	pthread_join (k3, NULL);
	pthread_mutex_destroy(&p_lock);
	pthread_mutex_destroy(&k_lock);


	return 0;
}