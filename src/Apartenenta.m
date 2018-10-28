% Constantin Rares 311CD

function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza 
  % valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
	
  %cazul in care valoarea functiei este 0
  if(x < val1)
    y = 0;
    return;
  end
  
  %cazul in care valoarea functiei este 1
  if(x > val2)
    y = 1;
    return;
  end
  
  %formulele coeficientilor a si b au fost deduse in prealabil pe hartie
  a = 1 / (val2 - val1);
  b = -val1 / (val2 - val1);
  
  y = a*x + b;
  
end