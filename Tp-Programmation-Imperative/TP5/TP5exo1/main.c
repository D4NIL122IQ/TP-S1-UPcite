/*
 * main.c
 *
 *  Created on: 16 oct. 2024
 *      Author: iq22282
 */

#include <stdio.h>
#include <stdlib.h>

int Mult_2(int v){
	if(v%2 == 0)
		return 1;
	else
		return 0;
}

int Mult_3(int v){
	if(v%3 == 0)
		return 1;
	else
		return 0;
}

int main(){
	int x;
	printf("entrez un entier : ");
	scanf("%d", &x);
	if(Mult_2(x))
		printf("l'entier %d est pair\n", x);
	else
		printf("l'entier %d est impair\n", x);

	if(Mult_3(x)){
		printf("l'entier %d est multiple de 3\n", x);
		if(Mult_2(x))
			printf("l'entier %d est multiple de 6\n", x);
	}else
		printf("l'entier %d n'est multiple de 3\n", x);


	return EXIT_SUCCESS;
}
