	GD /000		; AC = X1_X2
	SB CTE3030	; AC = X1_X2 - 0x3030
	MM VAR_X	; VAR_X = X1_X2 - 0x3030
	GD /000		; AC = ' '_' '
	MM PRESUM	; PRESUM = ' '_' '
	GD /000		; AC = Y1_Y2
	SB CTE3030	; AC = Y1_Y2 - 0x3030
	MM VAR_Y	; VAR_Y = Y1_Y2 - 0x3030
	
	LD VAR_X	; AC = VAR_X
	AD VAR_Y	; AC = VAR_X + VAR_Y
	ML CTE0100	; AC = (VAR_X + VAR_Y) << 2
	MM PRESUM	; Escreve o valor da soma shiftada
	LD CTE0900	; AC = 0900
	SB PRESUM;	; AC = 0900 - ((VAR_X + VAR_Y) << 2)
	JN CARRY	; Se der negativo, Jump para lidar com o carry
	
	LD VAR_X	; AC = VAR_X
	AD VAR_Y	; AC = VAR_X + VAR_Y
	AD CTE3030	; AC = VAR_X + VAR_Y + 0x3030
	MM PRESUM	; PRESUM = VAR_X + VAR_Y + 0x3030
	PD /100		; Printa na tela o valor em ASCII
	HM =0;		; Termina execucao
@ /200
CARRY	LD VAR_X	; AC = VAR_X
	AD VAR_Y	; AC = VAR_X + VAR_Y
	SB CTE000A	; AC = VAR_X + VAR_Y - 0x000A
	AD CTE0100	; AC = VAR_X + VAR_Y - 0x000A + 0x0100
	AD CTE3030	; AC = VAR_X + VAR_Y - 0x000A + 0x0100 + 0x3030
	MM PRESUM	; PRESUM = VAR_X + VAR_Y - 0x000A + 0x0100 + 0x3030
	PD /100		; Printa na tela o valor em ASCII
	HM =0		; Termina execucao
@ /300
VAR_X 	K =0;
PRESUM 	K =0;
VAR_Y 	K =0;
CTE3030 K /3030;
CTE0100	K /0100;
CTE0900	K /0900;
CTE000A K /000A;
	


