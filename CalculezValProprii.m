% Intrari:
% -> d: diagonala principala a matricei tridiagonale simetrice;
% -> s: supradiagonala matricei tridiagonale simetrice;
% -> m: limita pentru numarul de valori proprii;
% -> tol: precizia determinarii.
% Iesiri:
% -> vp: vector de valori proprii, de dimensiune m.

function vp = CalculezValProprii(d, s, m, tol)

	if m > length(d)
		m = length(d);
	endif

	r = IntervaleValProprii(d, s, m);
	i = 1;

	
	while i <= m
		
		a = r(i);
		b = r(i+1);
		f = ValoriPolinoame(d,s,a);
		g = ValoriPolinoame(d,s,b);
		n = length(d);

		while f(n+1)*g(n+1) < 0

			sol = (a+b)/2;
			h = ValoriPolinoame(d,s,sol);

			if f(n+1)*h(n+1) < 0
				b = sol;
			endif

			if g(n+1)*h(n+1) < 0
				a = sol;
			endif

			if abs(h(n+1)) < tol
				break;
			endif

			f = ValoriPolinoame(d,s,a);
			g = ValoriPolinoame(d,s,b);

		endwhile

		vp(i) = sol;
		i++;

	endwhile	

endfunction


