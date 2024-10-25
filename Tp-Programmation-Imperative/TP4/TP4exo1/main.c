/*
 * main.c
 *
 *  Created on: 9 oct. 2024
 *      Author: iq22282
 */

#include <stdio.h>
#include <stdlib.h>

int taille(int tab[]){
	int i=0;
	while (tab[i]){
		i++;
	}
	return i;
}

int present(int x, int tab2[]){
	int t = taille(tab2);
	for(int j=0 ; j<t; j++){
		if(x == tab2[j]){
			return 0;
		}
	}
	return 1;
}

int main(){
	int nb = 0, i;
	int tab[50];
	int t1[50] , effectif[50];
	int temp;
	int c=0,z,j;
	do{
		printf("entrez une valeur inferieur ou egal a 50 et sup a 0 : ");
		scanf("%d",&nb);
	}while(nb<0 || nb>50);

	for(i=0; i<nb ; i++){
		printf("entrez la valeur %d: ", i+1);
		scanf("%d", &tab[i]);
	}
	printf("vos valeur : ");
	for(i=0; i<nb ; i++){
		printf("%d  ", tab[i]);
	}

	printf("\n***********************\n");

	for(i=0;i<nb;i++){
		temp = 0;
		if(present(tab[i], t1) == 1 ){
			t1[c] = tab[i] ;
			z=tab[i];
			for(j=0;j<nb;j++){
				if(tab[j] == z){
					temp++;
				}
			}
			effectif[c] = temp;
			c++;
		}
	}

	printf("tab occu : ");
	for(i=0; i<taille(t1) ; i++){
		printf("%d  ", t1[i]);
	}
	printf("\ntab efct : ");
	for(i=0; i<taille(effectif) ; i++){
		printf("%d  ", effectif[i]);
	}


	return EXIT_SUCCESS;
}
