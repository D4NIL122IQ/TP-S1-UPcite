/*
 * main.c
 *
 *  Created on: 16 oct. 2024
 *      Author: iq22282
 */

#include <stdio.h>
#include <stdlib.h>

void Min_Max(int a , int b, int c, int *min , int *max){
	if((a<b) && (a<c)){
		*min = a;
	}else{
		if((b<a) && (b<c)){
			*min = b;
		}else{
			*min = c;
		}
	}

	if((a>b) && (a>c)){
		*max = a;
	}else{
		if((b>a) && (b>c)){
			*max = b;
		}else{
			*max = c;
		}
	}
}

int main(){
	int a, b, c;
	int min , max;
	printf("entrez une valuer : ");
	scanf("%d", &a);
	printf("entrez une autre valuer : ");
	scanf("%d", &b);
	printf("entrez une derniere valuer : ");
	scanf("%d", &c);

	Min_Max(a,b,c, &min ,&max);
	printf("le min = %d et le max = %d", min , max);

	return EXIT_SUCCESS;
}
