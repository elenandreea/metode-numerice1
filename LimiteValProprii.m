% Intrari:
% -> d: diagonala principala a matricei tridiagonale simetrice;
% -> s: supradiagonala matricei tridiagonale simetrice.
% Iesiri:
% -> [limita_inf limita_sup]: limitele incadratoare pentru valorile proprii ale
%matricei tridiagonale simetrice.

function [limita_inf, limita_sup] = LimiteValProprii(d, s)

	n = length(d);
	t(1)=s(1);

	for i = 2 : n-1
		t(i)=abs(s(i-1))+abs(s(i));
	endfor

	t(n)=s(n-1);

	limita_inf = inf;
	limita_sup = -inf ;

	for i = 1 : n
		lambdamin = d(i) - t(i);
		lambdamax = d(i) + t(i);
		if lambdamin < limita_inf
			limita_inf = lambdamin;
		endif
		if lambdamax > limita_sup
			limita_sup = lambdamax;
		endif
	endfor

endfunction

