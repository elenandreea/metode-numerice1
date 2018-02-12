function x = multiple_encode(str)

l1 = length(str);
k = 1;

for i = 1 : l1
	d = morse_encode(str(i))
	l2 = length(d)
	for j = 1 : l2
		x(k)=d(j);
		x(k)++; 
	endfor
	x(k)=' ';
	x(k)++; 
endfor

endfunction




function drum = morse_encode(c)

S = morse();
global gasit = 0;
drum = '';
drum = traverseaza ( S, c, drum);

drum;
%clear('all');

endfunction


function as = traverseaza(S,c,drum)
	as = '';
	global gasit;
	if ( S{1} == c )
		as = drum;
		gasit = 1;
		return
	endif

	if ( !isempty ( S{2} ) )
		drum = strcat ( drum, '.');
		as = traverseaza ( S{2}, c, drum );
	endif

	if ( gasit == 0 && !isempty(S{3}))
		drum(length(drum)) = '-';
		as = traverseaza ( S{3}, c, drum );
	endif

endfunction	
