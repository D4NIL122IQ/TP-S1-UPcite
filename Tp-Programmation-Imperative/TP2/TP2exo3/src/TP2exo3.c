/*
 ============================================================================
 Name        : TP2exo3.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

int main() {
	float a;
	printf("entrez une valeur : ");
	scanf("%f",&a);
	if( (3<=a && a<=6) || (7<=a && a<10) ){
		printf("la valeur %f appartient", a);
	}else{
		printf("la valeur %f n appartient pas", a);
	}
	return 0;
}
