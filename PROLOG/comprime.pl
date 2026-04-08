
/*
mas_veces(+Lista,-Elem,-Num)
es cierto cuando Elem unifica con el elemento que se repite mas veces en 
Lista y Num unifica con las veces que se repite el elemento


comprime(+Lista,ListaR), es cierto si ListaR unifica con una lista con el sig. formato
comprime([a,a,b,b,b,c,d,d,a],L).
R = [(a,2),(b,3),(c,1), (d,2), (a,1)]

*/

comprime([],[]).
comprime([Elem], [(Elem,1)]).

comprime([C, C|Resto], [(Elem,N2)|R] ):-
	comprime([C|Resto],[(Elem,N)|R]), N2 is N + 1 .
comprime([C, C2|Resto], [(C,1)|R] ):-  C\= C2,comprime([C2|Resto],R ).

%-----------------------------------------------------
% mas_veces(+Lista, -Elem, -Num)
%es cierto cuando Elem unifica con el elemento
%que se repite más veces en la lista Lista
%y Num unifica con el número de veces que se
%repite dicho elemento.
%-----------------------------------------------------
mas_veces(L,E,N):- msort(L, Lor), comprime(Lor, Lista), mayor_n(Lista,E,N).

mayor_n([(Elem, N )],Elem, N).
mayor_n([(_, N),(E2, N2)|R], Ele,Num):- N2 > N, mayor_n([(E2, N2)|R],Ele,Num). 
mayor_n([(E, N),(_, N2)|R], Ele,Num):- N >= N2, mayor_n([(E, N)|R],Ele,Num). 