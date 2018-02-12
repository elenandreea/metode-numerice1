function x = morse_encode(c)

S = morse();
global gasit = 0;
x = '';
x = traverseaza ( S, c, x);

x 
clear('all');

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