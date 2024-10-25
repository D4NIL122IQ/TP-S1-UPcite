/*
 * main.c
 *
 *  Created on: 16 oct. 2024
 *      Author: iq22282
 */

#include <stdio.h>
#include <stdlib.h>

void Swap(int *x , int *y){ //pour la question 1 les parms => (int x, int y)
	int c;
	printf("Les valeur avant de swap x = %d et y = %d\n", *x,*y);
	c = *y;
	*y = *x;
	*x = c;
	printf("Les valeur apres le swap x = %d et y = %d\n", *x,*y);
}

int main(){
	int x,y;

	printf("entrez une valeu entiere : ");
	scanf("%d", &x);
	printf("entrez une autre valeur : ");
	scanf("%d", &y);

	printf("Les valeur avant l'appelle de la fonction x = %d et y = %d\n", x,y);
	Swap(&x, &y); //pour la question 2 les parms => swap(x,y)
	printf("Les valeur apres l'appelle de la fonction x = %d et y = %d\n", x,y);

	return EXIT_SUCCESS;
}
