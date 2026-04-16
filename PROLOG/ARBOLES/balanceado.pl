/*
 sucio_b(+Arbolb)
	es cierto si Arbolb unifica con un arbol binario que para todo nodo, 
	la diferencia entre la altura del arbol izq y derecho es como maximo 1
*/
arbol2(a(1,a(2,a(8,a(9,nil,nil),nil),nil),a(3, nil, a(4,nil,a(5,nil,nil))))). %arbol NO balanceado

sucio_b(a(_,nil,nil)).
sucio_b(a(_,a(_,nil,nil),nil)).
sucio_b(a(_,nil,a(_,nil,nil))).
sucio_b(a(_,H1,H2)):- sucio_b(H1), sucio_b(H2).


altura(nil,0).
altura(a(_,Hi,Hd), Altura):-
	altura(Hi,Ai),
	altura(Hd,Ad),
	A is max(Ai,Ad),
	Altura is A + 1.
	
balanceado(nil).
balanceado(a(_,Hi,Hd)):-
	altura(Hi,Ai),
	altura(Hd,Ad),
	Dif is Ai - Ad, 
	Abs is abs(Dif), Abs =< 1,
	balanceado(Hi),
	balanceado(Hd).
	
	
crea_bin_Busqueda([],nil).
crea_bin_Busqueda(L, A):- sort(L,L2), crea_abb(L2,A).

crea_abb([],nil).
crea_abb([A],a(A,nil,nil)).
crea_abb(L, a(N,Hi,Hd)):-
	length(L, Tam), Pos0 is round(Tam/ 2), Pos is Pos0 - 1,
	length(L1,Pos),
	append(L1,[N|L2], L),
	crea_abb(L1, Hi),
	crea_abb(L2, Hd).
	
