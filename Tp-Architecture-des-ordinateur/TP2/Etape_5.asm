		org		$4
		
Vector_001	dc.l	Main

		org		$500
		
Main	movea.l	#STRING,a0

StrLen	move.b (a0)+,d1  ; on met caractere par caractere dans d1
		tst.b	d1
		beq quit ; si dans d1 ya aucun caractere -> quit
		subi #' ',d1
		tst.b d1
		bne StrLen
		addq.l	#$1,d0 ; ajout de 1 dans d0 pour chaque espace
		bra	StrLen




quit	illegal
		
		org	$550
		
STRING	dc.b	"Cette chaine comporte 4 espaces.",0
