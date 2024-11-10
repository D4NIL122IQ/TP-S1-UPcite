/*
 * main.c
 *
 *  Created on: 6 nov. 2024
 *      Author: iq22282
 */


#include <stdlib.h>
#include <stdio.h>

void afficherJour(char *tab[], int nb){

	printf("le jour n°%d est le %s", nb , tab[nb]);
}

int main(){
	char *tabJour[] = {"erreur", "lundi", "mardi" , "mercredi", "jeudi" ,"vendredi", "samedi", "dimanche"};
	int nb =0;

	printf("entrez un chiffre entre 1 et 7 : ");
	scanf("%d", &nb);
	 if(nb>7 || nb<1)
		 nb = 0;

	 afficherJour(tabJour, nb);
	return EXIT_SUCCESS;
}

