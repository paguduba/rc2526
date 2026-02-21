%comentarios

/* listing(X) devolvera los elementos de la lista X
	
	Principio de induccion:
	sea S un conjunto y N0 el mas pequeño de seaDemostramos que la propiedad P 
	se cumple para todo el conjunto de S.
*/

natural(1).
natural(N) :- N>1, N2 is N-1, natural(N2).

