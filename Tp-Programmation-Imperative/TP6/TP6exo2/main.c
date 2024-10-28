/*
 * main.c
 *
 *  Created on: 23 oct. 2024
 *      Author: iq22282
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int  valeurChiffRom(char *chiffRom, int tab[]){
	int somme = 0;
	int i=0;
	for(int i=0; i< strlen(chiffRom); i++){
		if(chiffRom[i]>= 'a' && chiffRom[i] <= 'z'){
			chiffRom[i] = chiffRom[i] + ('A' -'a');
		}
	}

	while(chiffRom[i] != '\0' && somme != -1){
		switch(chiffRom[i]){
		case 'I':
			somme += tab[1];
			break;
		case 'V':
			somme+= tab[2];
			break;
		case 'X':
			somme += tab[3];
			break;
		case 'L':
			somme += tab[4];
			break;
		case 'C':
			somme += tab[5];
			break;

		case 'D':
			somme += tab[7];
			break;
		case 'M':
			somme += tab[8];
			break;
		default:
			somme = -1;
		}
		i++;
	}
}

int main(){
	int tabRef[] = {1,5,10,50,100,500,1000};
	char chiffRom[15];
	int valeur;
	printf("entrez un chiffre romain : ");
	scanf("%s", chiffRom);
	valeur = valeurChiffRom(chiffRom, tabRef);
	if(valeur != -1){
		printf("la valeur du chiffre romain %s : %d", chiffRom, valeur);
	}else{
		printf("erreur");
	}
	return EXIT_SUCCESS;
}
