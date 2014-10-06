#include <stdio.h>


int main(int argc, char *argv[]) 
{
	FILE *mpipe;
	int child_pid = fork();
	if (child_pid == 0){
		// in Child
		mpipe = fopen("./mypipe","r");
		write(mpipe, "Hi", sizeof("Hi"));
		fclose(mpipe);

	}
	else{
		// in Parent
		char buf[1024];
		mpipe = fopen("./mypipe","w");
		read(mpipe, buf, 1024);
		fprint("%s\n", buf);
		fclose(mpipe);
	}
	
	return 0;

}

