/*
lista_hojas(+Ab, ? lHojas).
es cierto cuando lHojas cocntiene las hojas de Abb
*/

lista_hojas(nil, []).
lista_hojas(a(E,nil,nil), [E]).
lista_hojas(a(_,Hi,Hd), L):- lista_hojas(Hi, L2), lista_hojas(Hd,L3), append(L2,L3,L).

crea_lista(0,[]).
crea_lista(N,[N|L2]):- N > 0, N2 is N - 1, crea_lista(N2,L2).

crea_ab([], nil).
crea_ab([E], a(E,nil,nil)).

crea_ab([C|R], a(C, Hi,Hd)):- length(R, M), T is M div 2, 
				length(R1, T), append(R1,R2,R), 
				crea_ab(R1, Hi), crea_ab(R2,Hd).
				
crea_abN(N,A):- crea_lista(N,Lista), crea_ab(Lista,A).