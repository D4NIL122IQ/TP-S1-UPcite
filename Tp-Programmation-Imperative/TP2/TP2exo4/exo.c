/*
 * exo.c
 *
 *  Created on: 25 sept. 2024
 *      Author: iq22282
 */


#include <stdio.h>

int main(){
	int a,b;

	printf("entrez a :");
	scanf(" %d", &a);
	printf("entrez b :");
	scanf("%d", &b);

	if(a>b)
		if(a>10)
			printf(" premier choix\n") ;
		else if(b<10)
				printf("deuxième choix\n") ;
			else
				if(a==b)
					printf("troisième choix\n") ;
				else
					printf("quatrième choix\n") ;
}
