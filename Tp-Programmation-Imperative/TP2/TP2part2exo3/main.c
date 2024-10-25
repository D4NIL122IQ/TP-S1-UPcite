/*
 * main.c
 *
 *  Created on: 25 sept. 2024
 *      Author: iq22282
 */

#include <stdio.h>
#include <stdlib.h>

int main(){
	int cote;
	float rayon;
	float air;

	printf("entrez la longeur du cote : ");
	scanf("%i", &cote);
	rayon = cote / 2;

	air = (cote * cote) - (rayon * rayon * 3.14);
	printf("l'air du carre est : %d\n", cote * cote);
	printf("l'air de la zone noir : %.2f" , air);
}
