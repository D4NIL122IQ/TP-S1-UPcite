	; Programme pour renvoier la valeur absolu de d0
		org		$4
		
Vector_001	dc.l	Main

		org		$500
		
Main	move.l	#-50,d0

Abs		tst.l	d0
		bpl		quit

Tantque	addq.l	#$1,d1
		addq.l	#$1,d0
		bmi		Tantque
		move.l	d1,d0

quit	illegal
