/*
 * main.c
 *
 *  Created on: 2 oct. 2024
 *      Author: iq22282
 */


#include <stdio.h>
#include <stdlib.h>

int main(){
	int nb = 0,i;
	float *suiteNbr;
	int min , max;
	printf("entrez le nombre d'element : ");
	scanf("%d",&nb);

	suiteNbr = (float *)malloc(nb * sizeof(float));

	if(suiteNbr == NULL){
		return EXIT_FAILURE;
	}

	for(i=0 ; i<nb ; i++){
		printf("entrez un nombre pour la case %d : ", i+1);
		scanf("%f", &suiteNbr[i]);
	}
	min = max = suiteNbr[0];

	for(i=0 ; i<nb ; i++){
		printf("adresse de la valeur %d: %p  valeur reelle: %.2f \n",i+1, &suiteNbr[i] , suiteNbr[i]);
		if(suiteNbr[i]<min){
			min = i;
		}
		if(suiteNbr[i]>max){
			max = i;
		}
	}

	printf("l'adresse du min: %p      sa valeur: %.2f \n",suiteNbr[min] , suiteNbr[min]);
	printf("l'adresse du max: %p      sa valeur: %.2f \n",suiteNbr[max] , suiteNbr[max]);


	free(suiteNbr);
	return EXIT_SUCCESS;
}
