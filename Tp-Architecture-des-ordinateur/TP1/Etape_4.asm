		org		$4
		
Vector_001	dc.l	Main

		org		$500
		
Main	movea.l		#TAB,a0
		move.b	(a0)+,d0	; alternative {on travaille avec les indices}
		add.b	(a0)+,d0	; 1(a0),d0
		add.b	(a0)+,d0	; 2(a0),d0
		add.b	(a0)+,d0	; 3(a0),d0
		add.b	(a0)+,d0	; 4(a0),d0
		
		move.b	d0,SUM
		
		illegal
		
		org		$550
		
TAB		dc.b	18,3,5,9,14
SUM		ds.b	1
