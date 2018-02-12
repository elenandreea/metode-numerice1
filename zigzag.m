function Z = zigzag(n)

i=j=1;
s=d=1;

while s<n
	if mod(j,2)~=0
		j++;
		Z(i,j)=d;
		d++;
		s++;
	endif

	while j>1
		j--;
		i++;
		Z(i,j)=d;
		d++;
	endwhile

	if i~=n
		if mod(i,2)==0
			i++;
			Z(i,j)=d;
			d++;
			s++;
		endif

		while i>1
			i--;
			j++;
			Z(i,j)=d;
			d++;
		endwhile
	endif
endwhile

if mod(n,2)~=0
	while s>1 
		if mod(i,2)~=0
			i++;
			Z(i,j)=d;
			d++;
			s--;
		endif

		while i<n
			i++;
			j--;
			Z(i,j)=d;
			d++;
		endwhile

		if mod(j,2)==0
			j++;
			Z(i,j)=d;
			d++;
			s--;
		endif

		while j<n
			j++;
			i--;
			Z(i,j)=d;
			d++;
			endwhile
	endwhile
else
	while s>0
		if mod(j,2)~=0
			j++;
			Z(i,j)=d;
			d++;
			s--;
		endif

		while j<n
			i--;
			j++;
			Z(i,j)=d;
			d++;
		endwhile

		if mod(i,2)==0
			if i<n
				i++;
			endif
			Z(i,j)=d;
			d++;
			s--;
		endif

		while i<n
			i++;
			j--;
			Z(i,j)=d;
			d++;
		endwhile
	endwhile
endif

