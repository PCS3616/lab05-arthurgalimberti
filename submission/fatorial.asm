	SC FAT	; Chamada da subrotina
	HM =0	; Fim do programa
@ /100
N 	K =0	; var N
RES 	K =1	; var RES
CTE1 	K =1	; const 1
@ /200
FAT	K =0	; Inicio da subrotina
	LD N	; AC = N
 	JZ FIM	; Se N == 0, jump pro fim da rotina
 	
LOOP	LD RES	; AC = RES
	ML N	; AC = RES * N
	MM RES	; RES = RES * N
	
	LD N	; AC = N
	SB CTE1	; AC = N - 1
	MM N	; N = N - 1
	
	JZ FIM	; Se N == 0, jump pro fim da rotina
	JP LOOP	; Loop enquanto N != 0
	
FIM 	RS FAT	; Fim da subrotina
