		org		$4
		
vector_001	dc.l	Main	

		org		$500
		
Main	movea.l	#String1,a0
		jsr		AlphaCount
		
		movea.l	#String2,a0
		jsr		AlphaCount

		illegal

			;sous programme pour calculer le nbr de min
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
			
			;sous programme pour calculer le nbr de maj
UpperCount	movem.l	d1/a0,-(a7)
			
			clr.l		d0
			
\loop		move.b	(a0)+,d1
			
			beq		\quit
			
			cmp.b	#'Z',d1
			bhi		\loop
			cmp.b	#'A',d1
			blo		\loop
			
			addq.l	#1,d0
			bra 	\loop
			
\quit		movem.l	(a7)+,d1/a0
			rts
			
			; sous programme pour calculer le nbr de digit
DigitCount	movem.l	d1/a0,-(a7)
			
			clr.l		d0
			
\loop		move.b	(a0)+,d1
			
			beq		\quit
			
			cmp.b	#'9',d1
			bhi		\loop
			cmp.b	#'0',d1
			blo		\loop
			
			addq.l	#1,d0
			bra 	\loop
			
\quit		movem.l	(a7)+,d1/a0
			rts
			
			;sous programme pour calculer tout ca
			
AlphaCount	jsr		LowerCount
			move.l	d0,d2
			jsr		UpperCount
			add.l	d0,d2
			jsr		DigitCount
			add.l	d2,d0
			clr.l	d2
			
			rts
			

			;données
			
String1		dc.b	"En tout et Pour tout 019",0
String2		dc.b	"En tout 08",0	
