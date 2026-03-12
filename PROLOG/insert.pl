/*
	inserta_ordenada(Lista1,Elem,ListaR).

*/
%tengo dos listas, una ordenada
%voy insertando en la lista ordenada


ordenada([]).
ordenada([_]).
ordenada([Cab |Rest]):- Rest = [Cab2|_],  Cab =< Cab2, ordenada(Rest).



inserta_ordenada([],A,[A]).
inserta_ordenada(Lista1, Elem, ListaR):- 
		ordenada(Lista1),
		append(L, [Cab1|Res1], Lista1),
		Elem =< Cab1,
		append(L, [Elem, Cab1|Res1], ListaR).
		
inserta_ordenada(Lista1, Elem, ListaR):- 
		ordenada(Lista1),
		append(L, [Cab1|Res1], Lista1), 
		Elem > Cab1, 
		inserta_ordenada(Res1, Elem, ListaR).