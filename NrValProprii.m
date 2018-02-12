% Intrari:
% -> d: diagonala principala a matricei tridiagonale simetrice;
% -> s: supradiagonala matricei tridiagonale simetrice;
% -> val_lambda: valoare pentru lambda.
% Iesiri:
% -> numvp: numarul de valori proprii mai mici decit val_lambda.

function numvp = NrValProprii(d, s, val_lambda)

	P = ValoriPolinoame(d,s,val_lambda);
	n = length(d);
	numvp = 0;

	for i = 2 : n+1
		if P(i) < 0 && P(i-1) > 0
			numvp++;
		elseif P(i) > 0 && P(i-1) < 0
			numvp++;
		endif

		if P(i) == 0
			if P(i+1) < 0 && P(i-1) > 0
			numvp++;
			elseif P(i+1) > 0 && P(i-1) < 0
			numvp++;
			endif
		endif
	endfor

endfunction


			
