/*

crea_ab(+ListaEtiq, -Arbol)
es cierto cuando Arbol unifica con un arbol binario que contiene solo esas etiquetas
ARBOL BALANCEADO ESTA VEZ

*/
arbol1(a(1,a(2,nil,nil),a(3, nil, a(4,nil,nil)))).

crea_lista(0,[]).
crea_lista(N,[N|L2]):- N > 0, N2 is N - 1, crea_lista(N2,L2).

crea_ab([], nil).
crea_ab([E], a(E,nil,nil)).

crea_ab([C|R], a(C, Hi,Hd)):- length(R, M), T is M div 2, 
				length(R1, T), append(R1,R2,R), 
				crea_ab(R1, Hi), crea_ab(R2,Hd).
				
crea_abN(N,A):- crea_lista(N,Lista), crea_ab(Lista,A).
