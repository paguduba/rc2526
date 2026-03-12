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

ordenada_burbuja(A, A):- ordenada(A).

ordenada_burbuja(A, L):- append(L1, [Elem1, Elem2 | Res],A), 
						Elem1 > Elem2,
						append(L1, [Elem2, Elem1 | Res], Sig),
						ordenada_burbuja(Sig, L).
