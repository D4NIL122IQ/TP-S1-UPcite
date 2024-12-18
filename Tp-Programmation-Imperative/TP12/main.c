/*
 * main.c
 *
 *  Created on: 18 déc. 2024
 *      Author: iq22282
 */


#include <stdio.h>
#include <stdlib.h>

typedef struct noeud{
	char contenu;
	int num;
	struct noeud *fg;
	struct noeud *fd;
}noeud;

noeud *nouvNoeud(char c){
	noeud *temp = NULL;
	static int numero = 0;
	temp = (noeud *)malloc(sizeof(noeud));
	if(temp == NULL){
		printf("erreur d'allocation");
		exit(EXIT_FAILURE);
	}
	temp->contenu = c;
	temp->num = numero;
	numero++;
	temp->fd = temp->fg = NULL;

	return (temp);
}

noeud * rechercheNoeud( noeud *n, int numNoeud){
	noeud *tmpNoeud;
	if(n == NULL)
		return(NULL);
	if(n->num == numNoeud)
		return(n);

	tmpNoeud = rechercheNoeud(n->fg, numNoeud);
	if(tmpNoeud!=NULL)
		return(tmpNoeud);

	return(rechercheNoeud(n->fd, numNoeud));
}

void insererFG(noeud *arbre, noeud *newNoeud, int num){
	noeud *rechTemp;
	rechTemp = rechercheNoeud(arbre, num);

	if(rechTemp == NULL){
		printf("erreur numero noeud indisponible");
	}else{
			newNoeud->fg = rechTemp->fg;
			rechTemp->fg = newNoeud;
	}
}

void insererFD(noeud *arbre, noeud *newNoeud, int num){
	noeud *rechTemp;
	rechTemp = rechercheNoeud(arbre, num);

	if(rechTemp == NULL){
		printf("erreur numero noeud indisponible");
	}else{
			newNoeud->fd = rechTemp->fd;
			rechTemp->fd = newNoeud;
	}
}

void prefixe(noeud *arbre){
	if(arbre != NULL){
		printf("%c \t", arbre->contenu);
		prefixe(arbre->fg);
		prefixe(arbre->fd);
	}
}

void infixe(noeud *arbre){
	if(arbre != NULL){
			infixe(arbre->fg);
			printf("%c \t", arbre->contenu);
			infixe(arbre->fd);
		}
}

void suffixe(noeud *arbre){
	if(arbre != NULL){
		suffixe(arbre->fg);
		suffixe(arbre->fd);
		printf("%c \t", arbre->contenu);
	}
}

int main(){
	noeud *arbre;

	arbre = nouvNoeud('B'); //numero 0

	insererFG(arbre , nouvNoeud('B'), 0); //numero 1
	insererFD(arbre , nouvNoeud('A'), 0); //numero 2

	insererFG(arbre , nouvNoeud('D'), 1); //fils gauche de num 1
	insererFD(arbre , nouvNoeud('N'), 1); // fils droit de num 1


	printf("*** PREFIXE ***\n");
	prefixe(arbre);

	printf("\n*** INFIXE ***\n");
	infixe(arbre);

	printf("\n*** SUFFIXE ***\n");
	suffixe(arbre);


	return EXIT_SUCCESS;
}
