Virtual simulation of Google's PageRank algorithm, on a smaller scale.

% Constantin Rares 311CD

Tema 1 MN - PageRank

Voi incerca sa explic pe scurt cum am gandit sa implementez fiecare
functie, deoarece fiecare dintre acestea sunt explicate, pe bucati, sub forma 
de commenturi, in fisierele sursa.

  [Iterative]:
    - Am construit matricea de adiacenta si matricea diagonala a gradurilor
    de iesire a nodurilor grafului pe baza informatiilor din fisier
    - Am ales sa folosesc metoda matriceala, deoarece mi s-a parut a fi mai
    eficienta si mai apropiata de limbajul Matlab
    - La fiecare iteratie se verifica eroarea, si daca este suficient de mica,
    functia se opreste
    
    *Personal consider ca ar fi trebuit sa fie intors R(t+1), deoarece a fost
    deja calculat si este o aproximare mai apropiata de solutie decat R(t),
    insa in testele de referinta se intoarce R(t)*
  
  [Algebraic]:
    - Am construit matricea de adiacenta si matricea diagonala a gradurilor
    de iesire a nodurilor grafului pe baza informatiilor din fisier
    - Se foloseste functia GramSchmidt pentru calculul inversei, si se afla
    solutia
  
  [GramSchmidt]:
    - Factorizez matricea A intr-o matrice ortogolana Q si o matrice superior
    triunghiulara R, prin procedeul Gram-Schmidt
    - Bazandu-ma pe egalitatea cunoscuta A*inv(A) = eye(n), descompunand
    matricea A in Q*R, si trecand matricea Q in membrul drept, ajung la
    egalitatea: R*inv(A) = Q'
    - Folosesc functia SST pentru a calcula cele n sisteme superior
    triunghiulare ale vectorilor coloana din matricea inv(A)
  
  [SST]:
    - Functie simpla care calculeaza un sistem superior triunghiular
  
  [PageRank]:
    - Calculez vectorii R1 si R2, prin metodele Iterative si Algebraic
    - Salvez toate valorile din fisier intr-un vector coloana, pentru a avea
    acces usor la val1 si val2
    - Sortez descrescator vectorul PR(O copie a vectorului R2), tinand cont ca
    trebuie sa inversez si elementele egale (datorita indicilor initiali)
    - Deoarece nu se poate verifica egalitatea intre 2 valori float cu un numar
    infinit de zecimale, a trebuit sa verific aceasta cu aproximatie, cu o
    eroare de 10^(-15)
    - Aplic functia u asupra vectorului PR
    
  [Apartenenta]:
    - Daca x-ul este mai mic decat val1, intorc 0
    - Daca x-ul este mai mare decat val2, intorc 1
    - Altfel, calculez valoarea functiei, cu formulele coeficientilor a si b
    calculate pe hartie
    
  [swap]:
    - functie goala, care doar inverseaza cele doua argumente
    - folosita pentru a interschimba 2 valori
    - folosita in sortarea vectorului PR