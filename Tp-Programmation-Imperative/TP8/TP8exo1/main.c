/*
 * main.c
 *
 *  Created on: 26 nov. 2024
 *      Author: danil
 */


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct date{
	int annee;
	int mois;
	int jour;
}date;

typedef struct employe{
	char *nom;
	date dateEmbauche;
	date datePoste;
}employe;

void saisie(employe *emp){
	char BUFFER[30];
	char t;
	printf("Nom : ");
	scanf("%s", BUFFER);
	emp->nom = (char *)malloc((strlen(BUFFER)+1) * sizeof(char));
	strcpy(emp->nom , BUFFER);
	printf("Date embauche : ");
	scanf("%d %d %d", &emp->dateEmbauche.jour , &emp->dateEmbauche.mois , &emp->dateEmbauche.annee);
	do{
		printf("Date poste = date embauche ? (o , n)");
		scanf("%s", &t);
	}while(t != 'o' && t != 'O' && t != 'n' && t != 'N');

	if(t == 'n' || t == 'N'){
		printf("Date poste : ");
		scanf("%d %d %d", &emp->datePoste.jour , &emp->datePoste.mois , &emp->datePoste.annee);
	}else{
		emp->datePoste.annee = emp->dateEmbauche.annee;
		emp->datePoste.mois = emp->dateEmbauche.mois;
		emp->datePoste.jour = emp->dateEmbauche.jour;
	}

}

void afficher(employe *emp){
	printf("Nom : %s\n", emp->nom);
	printf("Date embauche : %d/%d/%d\n", emp->dateEmbauche.jour , emp->dateEmbauche.mois , emp->dateEmbauche.annee);
	printf("Date poste : %d/%d/%d\n", emp->datePoste.jour , emp->datePoste.mois , emp->datePoste.annee);
}

int main(){
	employe *emp;
	emp = (employe *)malloc(sizeof(employe));
	saisie(emp);
	afficher(emp);
	free(emp->nom);
	free(emp);
	return EXIT_SUCCESS;
}
