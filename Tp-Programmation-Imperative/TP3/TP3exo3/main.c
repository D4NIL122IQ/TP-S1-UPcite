/*
 * main.c
 *
 *  Created on: 2 oct. 2024
 *      Author: iq22282
 */


#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(){
	int x,n,p;
	int *bits;
	int nbrBits, i,temp;
	printf("entrez une valeur : ");
	scanf("%d",&x);
	printf("combien de bits a changer ?");
	scanf("%d", &n);
	printf("a partir de quel bit ?");
	scanf("%d", &p);

	nbrBits = (int)pow(2,n + p - 1) < x ? 8 : n + p - 1;
    printf("%d",  (int)pow(2,n + p - 1));
	for(i=0; i<nbrBits ; i++){
		temp = x%2;
		bits[i] = temp;
		x = x/2;
	}
	printf("\n");


	for(i=nbrBits-1; i>=0; i--){

		printf("%d",bits[i]);
	}
	printf("\n");

	for (i= n+p-2; i>=p-1; i--){
		bits[i] = !bits[i];
	}

	printf("\n");

	for(i=nbrBits-1; i>=0; i--){

		printf("%d",bits[i]);
	}




	return EXIT_SUCCESS;
}
