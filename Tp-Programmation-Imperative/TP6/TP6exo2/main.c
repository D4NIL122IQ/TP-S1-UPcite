/*
 * main.c
 *
 *  Created on: 11 nov. 2024
 *      Author: danil
 */


#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int retrouvePosition(char tab1[], char lettre){
	for(int i=0; i<7; i++){
		if(lettre == tab1[i]){
			return i;
		}
	}
	return -1;
}

int decrypte(char tabRom[] , int tabVal[], char chifRom[]){
	int taille = strlen(chifRom);
	int valChif = 0;
	int temp;
	int temp2;

	for(int i =0; i<taille ; i++){
		if(i == taille - 1 ){
			temp = retrouvePosition(tabRom, chifRom[i]);
			if(temp != -1){
				valChif += tabVal[temp];
			}else{
				break;
			}

		}else{
			temp = retrouvePosition(tabRom, chifRom[i]);
			temp2 = retrouvePosition(tabRom, chifRom[i+1]);
			if(tabVal[temp] > tabVal[temp2]){
				valChif += tabVal[temp];
			}else{
				valChif -= tabVal[temp];
			}
		}
	}


	return valChif;
}

int main(){
	char tabChifRom[] ={'I', 'V' , 'X' , 'L' , 'C', 'D' , 'M'};
	int tabValChif[] = {1, 5, 10, 50, 100, 500, 1000};
	char chiffRom[30];
	printf("entrez une chiffre romain : ");
	scanf("%s", chiffRom);
	printf("le chiffre romain que vous avez saisie est : %s\n", chiffRom);

	printf("la valeur du chiffre est : %d", decrypte(tabChifRom, tabValChif, chiffRom));
	return EXIT_SUCCESS;
}
