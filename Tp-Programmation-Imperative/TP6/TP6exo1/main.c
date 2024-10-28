/*
 * main.c
 *
 *  Created on: 23 oct. 2024
 *      Author: iq22282
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


void convertir(char *s, char *resultat){
	int i=0;
	while(s[i] != '\0'){
		if((s[i]>='A') && (s[i]<='Z')){
			resultat[i] = s[i]+32;
		}else{
			if((s[i]>='a') && (s[i]<='z'))
				resultat[i] = s[i]-32;
		}
		i++;
	}
}

int main(){
	char chaine[30];
	char result[30];
	printf("entrez une chaine de caractere : ");
	scanf("%s", chaine);
	convertir(chaine, result);
	printf("le resultat : %s", result);
	return EXIT_SUCCESS;
}
