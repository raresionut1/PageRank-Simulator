% Constantin Rares 311CD

function B = GramSchmidt(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	n = length(A);
  B = zeros(n);
 
 % Factorizarea matricei A in matricele 
 % Q (ortogonala) si R (superior triunghiulara)
  for j = 1:n
    aux = A(:,j);
    for i = 1:j-1
      R(i,j) = Q(:,i)' * A(:,j);
      aux = aux - R(i,j) * Q(:,i);
    end
    R(j,j) = norm(aux);
    Q(:,j) = aux / R(j,j);
    end
    
    Qt = Q'; % Inversa matricei ortogonale
    
    % Rezolvarea celor n sisteme superior triunghiulare
    for i = 1:n
      B(:,i) = SST(R, Qt(:,i));
    end
end
      
	