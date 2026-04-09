/*

crea_ab(+ListaEtiq, -Arbol)
es cierto cuando Arbol unifica con un arbol binario que contiene solo esas etiquetas
ARBOL BALANCEADO ESTA VEZ

*/

arbol1(a(1,a(2,nil,nil),a(3, nil, a(4,nil,nil)))).


crea_ab([], nil).
crea_ab([E], a(E,nil,nil)).

crea_ab([C|R], a(C, Hi,Hd)):- length(R, M), T is M div 2, 
				length(R1, T), append(R1,R2,R), 
				crea_ab(R1, Hi), crea_ab(R2,Hd).
				
				
crea_abN(0,nil).
crea_abN(N, a(N,Hi,Hd)):- N>0, 0 == N mod 2, Ni is N - 1, Nd is N-2 ,crea_abN(Ni, Hi) ,  crea_abN(Nd, Hd).
crea_abN(N, a(N,Hi,nil)):- N>0, Ni is N - 1,crea_abN(Ni, Hi) .