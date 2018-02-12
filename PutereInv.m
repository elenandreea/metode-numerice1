% Intrari:
% -> d: diagonala principala a matricei tridiagonale simetrice;
% -> s: supradiagonala matricei tridiagonale simetrice;
% -> y: aproximatia initiala a vectorului propriu;
% -> h: deplasare;
% -> maxIter: numarul maxim de iteratii;
% -> tol: precizia determinarii.
% Iesiri:
% -> [valp vecp]: valoarea proprie valp, respectiv vectorul propriu vecp.

function [valp vecp] = PutereInv(d, s, h, y, maxIter,tol)
	ok = 1;
	k = 0;
	e = 2*tol;
	n = length(d);
	vecp =y;

	while e > tol 
		k = k+1;
		if k > maxIter
			ok = 0;
			break;
		endif

		for i = 1 : n
			b(i)=d(i)-h;
		endfor

		vecp = Thomas(b,s,vecp);
		vecp = vecp/norm(vecp);

		suma1 = 0;
		suma2 = 0;

		for i = 1 : n
			suma1 = suma1 + vecp(i)*vecp(i)*d(i);
		endfor

		for i = 1 : n-1
			suma2 = suma2 + 2*s(i)*vecp(i)*vecp(i+1);
		endfor


		valp = suma1 + suma2;

		v(1) = vecp(1)*d(1) + vecp(2)*s(1);
		for i = 2 : n-1
			v(i) = s(i-1)*vecp(i-1) + vecp(i)*d(i) + vecp(i+1)*s(i);
		endfor
		v(n) = vecp(n)*d(n) + s(i-1)*vecp(i-1);

		e = norm(v - valp *vecp);
		if e < tol 
			ok = 0;
			break;
		endif
		
		h = valp;
	endwhile
endfunction


function x = Thomas(b, s, y)

	n = length(b);
	s2(1) = s(1)/b(1);
	y2(1) = y(1)/b(1);
	for i = 1 : n
		x(i)=0;
	endfor

	for i = 2 : n-1
		temp = b(i)-s2(i-1)*s(i-1);
		s2(i) = s(i)/temp;
		y2(i) = (y(i)-s(i-1)*y2(i-1))/temp;
	endfor

	if (b(n)-s2(n-1)*s(n-1))~=0

		y2(n) = (y(n)-s(n-1)*y2(n-1))/(b(n)-s2(n-1)*s(n-1));
		x(n) = y2(n);
	
		for i = (n-1) : -1 : 1
			x(i) = y2(i)-s2(i)*x(i+1);
		endfor

	endif

	if (b(n)-s2(n-1)*s(n-1))==0

		for i = (n-2) : -1 : 1
			x(i) = y2(i)-s2(i)*x(i+1);
		endfor

	endif

endfunction
