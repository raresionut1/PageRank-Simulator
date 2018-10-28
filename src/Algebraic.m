% Constantin Rares 311CD

function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
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
    
   % Inversa matricei K
    for (i = 1:n)
        K(i,i) = 1/K(i,i);
    end
    
   M = (K*A)';
   part1 = GramSchmidt(eye(n) - d.*M); % Calculul inversei
   part2 = ((1-d)/n).*ones(n,1);
   R = part1 * part2; % Solutia
   
   fclose(file);
end