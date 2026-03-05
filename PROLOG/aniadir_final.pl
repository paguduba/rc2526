/*
	aniadir_final(+Elem, +Lista, - ListaR)
	Es cierto cuando listaR unifica con una lista que contiene los mismos elementos que lista con el 
	elemento Elem añadido al final.
*/

	aniadir_final(A, [], [A]).
	aniadir_final(A, [Cab|Res], [Cab|R2]) :- aniadir_final(A, Res, R2 ).
	
	