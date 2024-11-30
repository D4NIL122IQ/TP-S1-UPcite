		org		$4
		
vector_001	dc.l	Main

		org		$500
		
Main	movea.l	#String1,a0
		jsr		LowerCount
		
		movea.l	#String2,a0
		jsr		LowerCount

		illegal
			
			;sous programme 
			
LowerCount	movem.l	d1/a0,-(a7)
			
			clr.l		d0
			
\loop		move.b	(a0)+,d1
			
			beq		\quit
			
			cmp.b	#'z',d1
			bhi		\loop
			cmp.b	#'a',d1
			blo		\loop
			
			addq.l	#1,d0
			bra 	\loop
			
\quit		movem.l	(a7)+,d1/a0
			rts
			
			;données
			
String1		dc.b	"Ca contient que 12",0
String2		dc.b	"et la que 7",0
