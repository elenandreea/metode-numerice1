% Intrari:
% -> d: diagonala principala a matricei tridiagonale simetrice;
% -> s: supradiagonala matricei tridiagonale simetrice;
% -> m: limita pentru numarul de valori proprii.
% Iesiri:
% -> r: un vector r = [r1, r2, ..., rm, rm+1] de dimensiune m+1.

function r = IntervaleValProprii(d, s, m)

	[limita_inf limita_sup] = LimiteValProprii(d, s);
	
	if length(d) < m
		m = length(d);
	endif
	r(1) = limita_inf;
	r(m+2) = limita_sup;

	for k = m : -1 : 1 

		mij = (r(k + 2) + r(1)) / 2;
		h = (r(k + 2) - mij);
		numvp = NrValProprii(d, s, mij);
		
		while numvp ~= k

			h = h / 2;
			if numvp < k
				mij = mij + h;
			endif

			if numvp > k
				mij = mij - h;
			endif

			numvp = NrValProprii(d, s, mij);

		endwhile

		r(k + 1) = mij;

	endfor

	r = r(1:length(r)-1);

endfunction
			
