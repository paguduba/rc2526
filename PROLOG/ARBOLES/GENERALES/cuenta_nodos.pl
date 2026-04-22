/*
arboles genericos a(E,ListaHijos)
a(Et, []) <-- arbol mas pequeño
HAREMOS PREDICADO PARA ARBOLES GENERICOS
		PREDICADO PARA LISTA DE ARBOLES

cuenta_nodos(+ArbolG, -Num)
cierto si Num unifica con el numero de nodos de ArbolG

*/

cuenta_nodos(a(_,Lista), R2 ) :- cuenta_nodos_lista_arboles(Lista,R), R2 is R+1. %OJO NO HAY RECURSIVIDAD

/*
cuenta_nodos_lista_arboles(+Lista, -Num)
cierto si Num unifica con el numero de nodos de la lista de arboles genericos listaArboles
*/
cuenta_nodos_lista_arboles([],0).
cuenta_nodos_lista_arboles([Cab|Res], R2):- cuenta_nodos_lista_arboles(Res,R), cuenta_nodos(Cab, RCab), R2 is RCab +R.



arb(a(1, [a(2, [a(3,[]), a(4,[a(5,[])])]), a(6,[])])).

arr(a(a, [a(b, [a(e,[])]), a(c,[]), a(d,[])])).