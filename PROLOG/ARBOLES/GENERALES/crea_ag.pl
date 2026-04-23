/*

crea_ag(+ListaEtiq, +N, -ArbolG)
es cierto si ArbolG unifica con un arbol generico que contiene todas las etiquetas de ListaEtiq y tiene de maximo N hijos

*/


crea_ag([E], _ , a(E,[]) ).
crea_ag([C|R], N , a(C,ListaA) ):- length(R,L), L=<N, 
						crea_lista_arboles(R, ListaA).

crea_ag([C|L], N , a(C,List)):- N2 is N - 1, length(L3, N2), append(L2,L3,L),
						crea_ag(L2,N, ListaA), crea_lista_arboles(L3,ListaB), append([ListaA], ListaB, List).


/*
crea_lista_arboles(ListaE, ListaA).
es cierto si listaArboles unifica con una lista de arboles genericos sin hijos  y todas las etiquetas de listaEtiquetas
*/


crea_lista_arboles([],[]).
crea_lista_arboles([Cab|Resto], [a(Cab,[])|R]):- crea_lista_arboles(Resto,R).
