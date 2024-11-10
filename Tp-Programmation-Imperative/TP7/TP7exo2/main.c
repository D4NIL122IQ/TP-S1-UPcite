/*
 * main.c
 *
 *  Created on: 6 nov. 2024
 *      Author: iq22282
 */


#include <stdlib.h>
#include <stdio.h>

void saisie(int tab[], int nbr){
	int i=0;
	while(i<nbr){
		printf("entrez la valeur num %d:", i+1);
		scanf("%d", &tab[i]);
		i++;
	}
}

void afficher(int tab[] , int nbr){
	int i=0;
	while(i<nbr){
		printf("la valeur num %d est : %d\n", i + 1, tab[i]);
		i++;
	}
}

void inversion(int tab[] , int nbr){
	int *p1 = &tab[0];
	int *p2 = &tab[nbr-1];
	int temp;
	while (p1 < p2 ){
//		printf("avant : p1 =%d p2 = %d && p1= %p  p2= %p\n", *p1, *p2, p1, p2);
		temp = *p1;
		*p1 = *p2;
		*p2 = temp;
		p1 = p1 +1;
		p2 = p2 -1;
//		printf("apres : p1 =%d p2 = %d && p1= %p  p2= %p\n", *p1, *p2, p1 , p2);
	}


}

int main(){
	int nb = 0;
	int tab[30];

	do{
		printf("entrez un nombre tel que nb<=30 : ");
		scanf("%d",&nb);
	}while(nb<0 || nb>30);

	saisie(tab, nb);
	afficher(tab, nb);

	inversion(tab, nb);
	printf("--------tableau inverse--------\n");
	afficher(tab, nb);
	return EXIT_SUCCESS;
}
