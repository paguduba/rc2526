/*
	invertir listas
	invertir(+ lista, -listaR)
	cierto cuando listaR unifiuca con una lista que continiene los mismos elementos que lista en orden inverso
	0. empezar con el principio de induccion
	1. P(n0).
	2. Para todo n > n0, P(n-1)-> P(n)
*/

	
	invertir([],[]).
	invertir([Cab1|Resto] , R2) :- invertir(Resto,R), append(R, [Cab1], R2).