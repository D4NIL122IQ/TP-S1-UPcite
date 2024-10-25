/*
 * main.c
 *
 *  Created on: 25 sept. 2024
 *      Author: iq22282
 */


#include <stdio.h>
#include <stdlib.h>

int main(){
	int nbr1, nbr2;

	printf("entrez le premier nombre : ");
	scanf("%i", &nbr1);

	do{
	printf("entrez le deuxieme nombre (different de 0) : ");
	scanf("%i", &nbr2);
	}while(nbr2 == 0);

	printf("la division : %i\n", nbr1/nbr2);
	printf("le quotient : %i\n", nbr1%nbr2);
	printf("le quotient rationel : %f",  float(nbr1) % float(nbr2));
	return 0;
}
