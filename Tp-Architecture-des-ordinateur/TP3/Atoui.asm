		org		$4
		
vector_001	dc.l	Main	

		org		$500
		
Main	movea.l	#String1,a0
		jsr		Atoui
		
		movea.l	#String2,a0
		jsr		Atoui
	
		movea.l	#String2,a0
		jsr		Atoui
		
		illegal
		
Atoui	movem.l	d1/a0, -(a7)
		
		clr.l	d0

\loop	move.b	(a0)+,d1
		
		beq 	\quit
		
		subi.b	#'0',d1
		add.l	d1 , d0
		roxl.l	#4, d0
		 bra 	\loop
		
\quit	movem.l	(a7)+,d1/d0
		rts		
		
			;données

String1		dc.b	"309",0
String2		dc.b	"2570",0
STring3		dc.b	"52146",0
