/*
 * main.c
 *
 *  Created on: 6 nov. 2024
 *      Author: iq22282
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>



void saisieVerb(char *verbe){
	char *termin;
	do{
		printf("entrez un verbe du premier group : ");
		scanf("%s", verbe);
		termin = verbe + strlen(verbe) - 2;
	}while(strcmp(termin, "er"));
}

void conjugaison(char * verbe , char *sujet , char *termine){
	int i=0;
	char *termin = verbe + strlen(verbe) - 2;

	while(i<6){
		termin = termine+i;
		printf("%s %s", *sujet+i, verbe );
		printf("\n");
		i++;
	}
}

int main(){
	char verbe[40];
	char *sujet[] = {"Je" , "Tu" ,"Il" , "Nous" , "Vous" , "Ils"};
	char *termine[] = {"e" , "s" , "e", "ons" ,"ez", "ent"};
	saisieVerb(verbe);
	conjugaison(verbe, sujet, termine);
	return EXIT_SUCCESS;
}
