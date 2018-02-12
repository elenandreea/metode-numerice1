function x = morse_decode(sir)

j=i=1;
c = strsplit(sir);
[C,matches] = strsplit(sir,' ');
b = size(matches)(2);
b++;
for s = 1 : b
	d = c{1,s};
	mo = morse();
	l = length(d);
	for k = 1 : l
		if d(k)=='.'
			mo = mo{2};
		endif
		if d(k)=='-'
			mo = mo{3};
		endif
		if isempty(mo)
			x(j) = '*'
			return;
		endif
	endfor
	x(j) = mo{1};
	j++;
endfor

endfunction