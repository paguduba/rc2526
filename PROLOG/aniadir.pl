/*
	aniadir(+ListaF, +Lista, - ListaR)
	Es cierto cuando listaR unifica con una lista que contiene los mismos elementos
	que lista con la lista ListaF añadida al final.
*/

	aniadir(A, [], A).
	aniadir(A, [Cab|Res], [Cab|R2]) :- aniadir(A, Res, R2 ).
	