/*
 * main.c
 *
 *  Created on: 25 sept. 2024
 *      Author: iq22282
 */


#include <stdio.h>

int main(){
	int rep;
	printf("question N ? (1 || 2 )");
	scanf("%i", &rep);

	switch(rep){
	case 1:
			int v1, v2, v3, v4, somme;
			printf("entrez la valeur n1 : ");
			scanf("%i",&v1);
			printf("entrez la valeur n2 : ");
			scanf("%i",&v2);
			printf("entrez la valeur n3 : ");
			scanf("%i",&v3);
			printf("entrez la valeur n4 : ");
			scanf("%i",&v4);
			somme = v1 + v2 + v3+ v4;
			printf("la somme de tout les entier entrer est de : %i", somme);
		break;
	case 2:
			int i;
			int som=0 ;
			int temp;
			for(i=0 ; i<4; i++){
				printf("entrez la valeur n%i : ",i);
				scanf("%i",&temp);
				som += temp;
			}
			printf("la somme de tout les entier entrer est de : %i",som);
		break;
	default:
		printf("erreur pas de question n : %i", rep);
	}




	return 0;
}
