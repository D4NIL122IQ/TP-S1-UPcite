		org $4
Vecrtor_001	dc.l	Main

		org	$500
						
Main	move.b	N1,d0	; flags ->
		add.b	N2,d0	; C=1 | V=0 | Z=1 | N=0
		move.w	N3,d1
		add.w	N4,d1	; C=0 | V=0 | Z=0 | N=0
		move.w	N7,d2
		add.w	N8,d2	; C=1 | V=0 | Z=0 | N=0
		move.l	N5,d3
		add.l	N6,d3	;C=1 | V=0 | Z=0 | N=0
		
		illegal
		
		org $550
		
N1		dc.b	$B4
N2		dc.b	$4C
N3		dc.w	$B4
N4		dc.w	$4C
N5		dc.l	$FFFFFFFF
N6		dc.l	$00000015
N7		dc.w	$4AC9
N8		dc.w	$D841
