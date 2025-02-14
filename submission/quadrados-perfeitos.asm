	SC QUAD	;
	HM =0	;
CTE2	K /2	; const 2
CTE1	K =1	; const 1
CTE63	K =63	; const 63
I	K =0	; var I
SUM	K =0	; var SUM

@ /200
QUAD	K =0	; Inicio da subrotina
LOOP	LD SAVE	; AC = SAVE
	AD CTE2	; AC = SAVE + 2
	MM SAVE ; SAVE = SAVE + 2
	
	LD SUM	; AC = SUM
	AD I	; AC = SUM + I
	AD I	; AC = SUM + 2 * I
	AD CTE1	; AC = SUM + 2 * I + 1
	MM SUM	; SUM = SUM + 2 * I + 1
	
SAVE	MM /100	; A cada iteracao, salva em lugares diferentes
	
	LD I	; AC = I
	AD CTE1 ; AC = I + 1
	MM I 	; I = I + 1
	
	LD CTE63; AC = 63
	SB I	; AC = 63 - I
	JZ FIM	; Se I == 63, jump pro fim da rotina
	JP LOOP	; Loop enquanto I != 63

FIM	RS QUAD	; Fim da subrotina
