		org		$4
		
Vector_001	dc.l	Main

		org		$500
		
Main	movea.l	#STRING,a0

StrLen	move.b (a0)+,d1  ; on met caractere par caractere dans d1
		tst.b	d1
		beq quit ; si dans d1 ya aucun caractere -> quit
		addq.l	#$1,d0 ; ajout de 1 dans d0 pour chaque caractere
		bra	StrLen




quit	illegal
		
		org	$550
		
STRING	dc.b	"Cette chaine comporte 35 caracteres",0
