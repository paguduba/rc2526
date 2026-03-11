/*
	ordena_burbuja(+Lista, -ListaR).
	es cierto cuando ListaR unifica con una lista con los mismos elementos
	que lista ordenados de menor a mayor


	ordenada(Lista).
		es cierto si lista esta ordenada de menor a mayor
		
	EXTRAS:
	en una lista esta permitido hacer [C1, C2, C3....|resto]
*/

ordenada([]).
ordenada([_]).
ordenada([Cab |Rest]):- Rest = [Cab2|_],  Cab =< Cab2, ordenada(Rest).

ordenada_burbuja(A):- ordenada(A).
ordenada_burbuja([Cab1, Cab2|R]):- R2 as [Cab2, Cab1|R], ordenada(R2).