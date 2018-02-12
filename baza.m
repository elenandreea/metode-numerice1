function r = baza(sursa,b1,b2)

lungime = size(sursa)(2);
p = size(sursa)(2);
p--;
numar = 0;

for i = 1 : lungime 

	if sursa(i)>='0' && sursa(i)<='9'
		numar=numar + (toascii(sursa(i))-'0')*(b1.^p);
	else
		numar = numar + (toascii(sursa(i))-'a'+10)*(b1.^p);
	endif
	p--;

endfor

i = 1;

while numar > 0
	rest = rem(numar,b2);
	if rest >= 0 && rest <=9
		r(i) = char(rest +'0');
	else
		r(i) = char(rest + 'a'-10);
	endif
	i++;
	numar = floor(numar/b2);
endwhile

r = fliplr(r);

endfunction