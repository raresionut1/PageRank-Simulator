% Constantin Rares 311CD

function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator 
    % sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eroarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
    
    file = fopen(nume, 'r');
    
    numar = [1, 1]; % Folosit pentru citirea unui numar din fisier
    
    n = fscanf(file, '%f', numar);
    
    A = zeros(n);
    K = zeros(n);
    
    % Construirea matricei de adiacenta si a matricei diagonale a gradurilor
    % De iesire ale nodurilor grafului
    for (k = 1:n) 
        i = fscanf(file, '%f', numar);
        K(i,i) = fscanf(file, '%f', numar);
        
        for (p = 1:K(i,i) )
            j = fscanf(file, '%f', numar);
            A(i,j) = 1;
        end
        
        % Cazul in care nodul are legatura cu el insusi
        if( A(i,i) == 1 )
          A(i,i) = 0;
          K(i,i)-- ;
        end
        
    end
    
    % Am folosit metoda matriceala
    R = ones(n,1)./n; % Aproximatia de inceput
    
    % Inversa matricei K
    for (i = 1:n)
        K(i,i) = 1/K(i,i);
    end
    
    M = (K*A)';
    
    for (k = 1:10000) % Numarul maxim de iteratii
      R_old = R; 
      R = d.*M*R + ((1-d)/n).*ones(n,1); %noua aproximare
      
      if(norm(R - R_old) < eps) %verificarea erorii
        % Este nevoie de aceasta deoarece in testul de referinta se pastreaza
        % R(t) in loc de R(t+1)
        R = R_old; 
        break;
      end
    end
      
    fclose(file);
end
	