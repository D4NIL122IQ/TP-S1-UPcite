		org		$4
		
Vector_001	dc.l	Main

		org		$500
		
Main	movea.l	#STRING,a0	
		addi	#'a',d2		;limite inf
		addi	#'z',d3		;limite sup 
		
LowerCount	move.b (a0)+,d1  ; on met caractere par caractere dans d1
		tst.b	d1		
		beq quit ; si dans d1 ya aucun caractere (d1 == 0)-> quit
		
		cmp.b	d3,d1
		bhi		LowerCount  ; si d1>d3 -> pas de miniscule
		cmp.b	d1,d2
		bhi		LowerCount  ; si d2>d1 -> pas de miniscule 
		
		addq.l	#$1,d0 ; ajout de 1 dans d0 pour chaque espace
		bra		LowerCount

quit	illegal
		
		org	$550
		
STRING	dc.b	"Cette chaine comporte 28 miniscules.",0
