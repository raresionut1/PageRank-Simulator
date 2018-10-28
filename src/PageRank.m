% Constantin Rares 311CD

function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out


R1 = Iterative(nume, d, eps); % Prima metoda
R2 = Algebraic(nume, d); % A doua metoda

file = fopen(nume, 'r');

values = fscanf(file, '%f'); % Vectorul coloana al tuturor valorilor din fisier

n = values(1); % Prima valoare din fisier
val1 = values(length(values)-1); % Penultima valoare din fisier
val2 = values(length(values)); % Ultima valoare din fisier

fclose(file);

nume = strcat(nume, '.out'); % Numele noului fisier de output

file = fopen(nume, 'w'); % Crearea unui fisier de output

% Printarea in fisier a vectorilor R1 si R2
fprintf(file, '%d\n', n);
R1
fprintf(file, '%f\n', R1);
fprintf(file, '\n');
R2
fprintf(file, '%f\n', R2);
fprintf(file, '\n');

PR = R2;
v = [1:n]'; % Indicii initiali ai nodurilor

% Sortarea vectorului PR (impreuna cu indicii)
for (i = 1:n-1)
  for (j = i+1:n)
    
    if ( PR(i) < PR(j) )
      [PR(i), PR(j)] = swap(PR(i), PR(j));
      [v(i), v(j)] = swap(v(i), v(j));
    
    % Testul de referinta avea indicii a doua valori egale inversati, iar
    % verificarea egalitatii a doua numere de tip float cu zecimale infinite
    % nu este posibila, asa ca a trebuit sa verific daca numerele sunt
    % aproximativ egale (cu o eroare de 10^(-15))
    elseif(abs(PR(i)-PR(j)) < 1e-15)
        [PR(i), PR(j)] = swap(PR(i), PR(j));
        [v(i), v(j)] = swap(v(i), v(j));
    end
    
  end
end

for (i = 1:n)
  
  % Calculul functiei F = u(PR(i))
  PR(i) = Apartenenta(PR(i), val1, val2);
  
  % Printarea in fisier a indicilor actuali, a indicilor initiali si a
  % elementelor vectorului PR
  fprintf(file, '%d %d %f\n', i, v(i), PR(i));
end

fclose(file);
end
	