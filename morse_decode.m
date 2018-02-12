function x = morse_decode(sir)

	j=1;
	mo = morse();
	l = length(sir);
	for k = 1 : l
		if sir(k)=='.'
			mo = mo{2};
		endif
		if sir(k)=='-'
			mo = mo{3};
		endif
		if isempty(mo)
			x(j) = '*'
			return;
		endif
	endfor
	x(j) = mo{1};
	j++;

endfunction
