% Constantin Rares 311CD

function x = SST(A, b)
  %functie care rezolva un sistem superior triunghiular
  
  n = length(b);
  
  x = zeros(n, 1);
  
  for i = n:-1:1
    x(i,1) = b(i);
    for j = i+1:n
      x(i,1) = x(i,1) - A(i,j)*x(j,1);
    end
    x(i,1) =  x(i,1) / A(i,i);
    end
endfunction