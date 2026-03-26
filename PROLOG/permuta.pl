/*
	permuta(+Lista, -ListaR)
	es cierto cuando listaR unifica con una lista que contiene los elementos de lista en orden distinto
	genera todas las permutaciones posibles al solicitar mas soluciones con ;

	insertar_todas(+Elem,+Lista,-ListaR)
	es cierto si ListaR unifica con una lista que contiene los elementos de Lista y el Elem en cualquier posicion
*/ 



permuta([],[]).
permuta([C|R],LR):- permuta(R,Res), insertar_todas(C,Res,LR).

insertar_todas(Elem, Lista, [Elem|Lista]).
insertar_todas(Elem, [Cab|Resto],[Cab|R] ):- insertar_todas(Elem,Resto,R).

%-.-.-.-.-.-.-.-.-.--.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
