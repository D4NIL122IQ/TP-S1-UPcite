/*
 * main.c
 *
 *  Created on: 26 nov. 2024
 *      Author: danil
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct temps {
	int min;
	int sec;
	int ms;
}temps;

typedef struct concurrent{
	char *nom;
	char *prenom;
	char *nation;
	temps tmp;
}concurrent;

typedef concurrent t_competition[250];

char *saisieChaine(){
	char *s;
	char BUFFER[20];
	scanf("%s", BUFFER);
	s = (char *)malloc((strlen(BUFFER) + 1) * sizeof(char));
	strcpy(s, BUFFER);
	return s;
}

void saisirConcurrent(concurrent *prs){
	printf("Nom : ");
	prs->nom = saisieChaine();
	printf("Prenom : ");
	prs->prenom = saisieChaine();
	printf("Nationalite : ");
	prs->nation = saisieChaine();
	prs->tmp.min = prs->tmp.sec = prs->tmp.ms = 0;
	printf("\n ***********************\n");
}
void inscrir(t_competition tabConcu , int nbrConcu){
	for(int i = 0; i<nbrConcu ; i++){
		printf("Concurrent n°%d - \n", i+1);
		saisirConcurrent(&tabConcu[i]);
	}
}

void saisirPerformance(t_competition tabConcu, int nbrConcu){
	for(int i = 0; i<nbrConcu ; i++){
		printf("DOSSARD n°%d\n", i+1);
		printf("Entrez son temps de cometition mm:ss.ms (si abondant -1:-1.-1) : ");
		scanf("%d:%d.%d", &tabConcu[i].tmp.min , &tabConcu[i].tmp.sec , &tabConcu[i].tmp.ms);
	}
}

void afficherCompetition(t_competition tabConcu, int nbrConcu){
	printf("dossard \t NOM Prenom \t Nationlite \t Temps totale\n");
	for(int i = 0 ; i< nbrConcu ; i++){
		printf("%d \t\t %s %s \t %s \t ", i+1 , tabConcu[i].nom , tabConcu[i].prenom , tabConcu[i].nation);

		if(tabConcu[i].tmp.min == -1  || tabConcu[i].tmp.sec == -1 || tabConcu[i].tmp.ms == -1){
			printf("ABONDON \n");
		}else{
			printf("%d:%d.%d \n", tabConcu[i].tmp.min , tabConcu[i].tmp.sec , tabConcu[i].tmp.ms);
		}
	}
}

int main(){
	int nbrConcu;
	t_competition tabConcu;

	do {
		printf("entrez le nombre de concurrent a ajouter : ");
		scanf("%d" , &nbrConcu);
	}while(nbrConcu < 0 || nbrConcu > 250);

	inscrir(tabConcu , nbrConcu);
	saisirPerformance(tabConcu , nbrConcu);
	afficherCompetition(tabConcu , nbrConcu);
	return EXIT_SUCCESS;
}
