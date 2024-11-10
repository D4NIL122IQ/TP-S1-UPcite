/*
 * main.c
 *
 *  Created on: 6 nov. 2024
 *      Author: iq22282
 */

#include <stdlib.h>
#include <stdio.h>

void saisieNote(float tab[], int nbrNote){
	int i=0;
	while(i<nbrNote){
		printf("entrez la note num %d:", i+1);
		scanf("%f", &tab[i]);
		i++;
	}
}

void afficherNote(float tabNote[] , int nbrNote){
	int i=0;
	while(i<nbrNote){
		printf("la note num %d est : %.2f\n", i, tabNote[i]);
		i++;
	}
}

void calculeNote(int nbrNote, float tabNote[], float *moyenne, float *min,float *max){
	int i=1;
	*min = tabNote[0];
	*max = tabNote[0];
	*moyenne =tabNote[0];
	while(i<nbrNote){
		*moyenne += tabNote[i];
		if(*max < tabNote[i]){
			*max = tabNote[i];
		}
		if(*min> tabNote[i]){
			*min = tabNote[i];
		}
		i++;
	}
	*moyenne /= nbrNote;
}

int main(){
	int nbrNote =0;
	float tabNote[40];
	float moyenne , max, min;
	do{
		printf("entrez le nobre de note a saisir : ");
		scanf("%d", &nbrNote);
	}while(nbrNote<0 || nbrNote>40);
	saisieNote(tabNote,nbrNote);
	afficherNote(tabNote, nbrNote);
	calculeNote(nbrNote, tabNote, &moyenne, &min, &max);
	printf("la note max : %.2f\n", max);
	printf("la note min : %.2f\n", min);
	printf("la moyenne des notes : %.2f\n", moyenne);
	return EXIT_SUCCESS;
}

