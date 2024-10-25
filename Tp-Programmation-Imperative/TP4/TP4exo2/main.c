/*
 * main.c
 *
 *  Created on: 9 oct. 2024
 *      Author: iq22282
 */

#include <stdio.h>
#include <stdlib.h>

int main(){
	int nb = 0;
	int tab[30];
	int i, temp;
	do{
		printf("entrez un nombre tel que nb<=30 : ");
		scanf("%d",&nb);
	}while(nb<0 || nb>30);

	for(i=0; i<nb ;i++){
		printf("entrez la valeur %d: ", i+1);
		scanf("%d", &tab[i]);
	}

	printf("les valeur du tableau : ");
	for(i=0; i<nb ;i++){
		printf("%d  ", tab[i]);
	}

	for(i=0; i<=nb/2 ; i++){
		temp = tab[i];
		tab[i] = tab[nb - i -1];
		tab[nb - i -1] = temp;
	}

	printf("\nles valeur du tab invrs : ");
	for(i=0; i<nb ;i++){
		printf("%d  ", tab[i]);
	}

	return EXIT_SUCCESS;
}
