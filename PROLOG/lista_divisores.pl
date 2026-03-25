/*
	lista_divisores(+X,+Y,-ListaR).
	A partir de Y, es correcto si ListaR contiene todos los divisores que dan 0 de X, a partir de Y
	
	primo(X).
	es verdad si X es un numero primo.
	
	primosEntrexy(+X,+Y,-ListaR)
	Es cierto si, ListaR contiene todos los primos entre X e Y 

*/
%-----------------------------------------------------------------------
	lista_divisores(_,1,[1]).
	lista_divisores(X,Y,[Y|ListaR]):- X >1, Y>1, Y2 is Y - 1, 
	X mod Y =:= 0, lista_divisores(X,Y2,ListaR).

	lista_divisores(X,Y,ListaR):- X > 1, Y> 1,Y2 is Y - 1, 
	X mod Y =\= 0,lista_divisores(X,Y2,ListaR).

%----------------------------------------------------------------
	primo(X):- lista_divisores(X,X,[X,1]).
%------------------------------------------------------------------
	
	primosEntrexy(X,X,[]):- \+ primo(X).
	primosEntrexy(X,X,[X]):- primo(X).
	primosEntrexy(X,Y,[X|ListaR]):- X>= 1, X < Y,primo(X), X2 is X + 1, primosEntrexy(X2,Y,ListaR).
	primosEntrexy(X,Y,ListaR):- X>=1, X < Y, \+ primo(X), X2 is X + 1, primosEntrexy(X2,Y,ListaR).