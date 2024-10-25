/*
 * main.c
 *
 *  Created on: 16 oct. 2024
 *      Author: iq22282
 */

#include <stdlib.h>
#include <stdio.h>

double CoeffBinome(int n, int p){
	if((p == 0) || (p == n))
		return 1;
	return CoeffBinome(n-1, p-1) + CoeffBinome(n-1, p);

}

int facto(int x){
	int temp = 1;
	for(int i=1; i<=x; i++){
		temp *= i;
	}
	return temp;
}

double CoeffBinome_iterative(int n, int p){
	return (facto(n) / (facto(p) * facto(n - p)));
}

double puissance(double c, int puis){
	double res=1;
	if(puis != 0){
		for(int i = 1; i<=puis; i++){
			res*= c;
		}
	}
	return res;
}

int main(){
	int x , y, n;
	double resultat = 0;

	printf("entrez x: ");
	scanf("%d", &x);
	printf("entrez y: ");
	scanf("%d", &y);
	printf("entrez n: ");
	scanf("%d", &n);

	for(int i = 0; i<=n ; i++){
		resultat += CoeffBinome(n,i)* puissance(x,n-i) * puissance(y,i);
	}

	printf("le resultat en mode recursif c(%d,%d) = %lf\n", x,y , resultat);
	resultat = 0;
	for(int i = 0; i<=n ; i++){
		resultat += CoeffBinome_iterative(n,i)* puissance(x,n-i) * puissance(y,i);
	}

	printf("le resultat en mode iteratif c(%d,%d) = %lf", x,y , resultat);

	return EXIT_SUCCESS;
}
