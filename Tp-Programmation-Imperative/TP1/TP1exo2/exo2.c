/*
 * main.c
 *
 *  Created on: 2 oct. 2024
 *      Author: iq22282
 */

#include <stdio.h>
#include <stdlib.h>

int main(){
	int x = 15;
	int *pInt;
	int *ptrInt;

	*pInt = x;

	ptrInt = (int *)malloc(sizeof(int));
	*ptrInt = 100;
	printf("l'adresse de x : %p   sa valeur: %d \n" , &x , x);
	printf("l'adresse de pInt : %p   sa valeur: %d \n" , &pInt , *pInt);
	printf("l'adresse de ptrInt : %p   sa valeur: %d \n" , &ptrInt , *ptrInt);


	return EXIT_SUCCESS;
}
