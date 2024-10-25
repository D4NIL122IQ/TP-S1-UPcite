/*
 * man.c
 *
 *  Created on: 25 sept. 2024
 *      Author: iq22282
 */

#include <stdio.h>
#include <stdlib.h>

int main(){
	int sommeArgent;
	int billet5 , piece2, piece1;
	int temp;
	do{
		printf("entrez une somme d'argent entre 0 et 15 : ");
		scanf("%d", &sommeArgent);
	}while(sommeArgent<0 || sommeArgent>15);

	if(sommeArgent == 0){
		printf("aucun(e) piece/billet");
	}else{
		billet5 = piece2 = piece1 = 0;
		billet5 = sommeArgent / 5;
		temp = sommeArgent % 5;
		if(temp != 0){
			piece2 = temp / 2;
			temp = temp % 2;
			if(temp != 0)
				piece1 = temp;
		}
		printf("la somme %d peut se decomposer en %d billet de 5 et %d piece de 2 et %d piece de 1", sommeArgent , billet5, piece2, piece1);
	}

	return EXIT_SUCCESS;
}
