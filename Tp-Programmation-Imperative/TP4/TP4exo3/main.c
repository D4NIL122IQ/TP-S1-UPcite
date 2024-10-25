/*
 * main.c
 *
 *  Created on: 9 oct. 2024
 *      Author: iq22282
 */

#include <stdio.h>
#include <stdlib.h>
#define NBMAX 10

int main(){
	int mat[NBMAX][NBMAX];
	int mat2[NBMAX][NBMAX];
	int col=0, lig=0;
	int i, j;

	do{
		printf("entrez le nombre de ligne (inf a 10): ");
		scanf("%d",&lig);
	}while(lig<0 || lig>10);

	do{
		printf("entrez le nombre de colonne (inf a 10): ");
		scanf("%d",&col);
	}while(col<0 || col>10);

	for(i=0; i<lig ; i++){
		for(j=0; j<col; j++){
			printf("entrez la valeur pour la ligne %d et colonne %d: ", i+1 ,j+1);
			scanf("%d", &mat[i][j]);
		}
	}

	for(i=0; i<lig ; i++){
		for(j=0; j<col; j++){
			mat2[j][i] = mat[i][j];
		}
	}

	printf("les valeur de la matrice : \n");
	for(i=0; i<lig ; i++){
		for(j=0; j<col; j++){
			printf("%d ", mat[i][j]);
		}
		printf("\n");
	}

	printf("les valeur de la matrice transpose : \n");

	for(i= 0 ; i<col ;i++){
		for(j=0 ;j<lig; j++){
			printf("%d  ", mat2[i][j]);
		}
		printf("\n");
	}

	return EXIT_SUCCESS;
}
