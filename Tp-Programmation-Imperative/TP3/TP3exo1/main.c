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

	pInt = &x;

	ptrInt = (int *)malloc(sizeof(int));
	*ptrInt = 100;
	printf("l'adresse de x : %p   sa valeur: %d \n" , &x , x);
	printf("l'adresse de pInt : %p   sa valeur: %p    valeur de la case pointee: %d\n" , &pInt , pInt , *pInt);
	printf("l'adresse de ptrInt : %p   sa valeur: %p     valeur de la case pointee: %d\n" , &ptrInt , ptrInt, *ptrInt);


	printf("============================================\n");
	*pInt = 200;

	printf("l'adresse de x : %p   sa valeur: %d\n" , &x , x );
	printf("l'adresse de pInt : %p   sa valeur: %p    valeur de la case pointee: %d\n" , &pInt , pInt , *pInt);
	printf("l'adresse de ptrInt : %p   sa valeur: %p     valeur de la case pointee: %d\n" , &ptrInt , ptrInt, *ptrInt);

	free(pInt);
	free(ptrInt);
	return EXIT_SUCCESS;
}
