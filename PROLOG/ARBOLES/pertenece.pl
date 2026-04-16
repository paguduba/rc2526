/*

	pertenece(+Elem, +Arbol)
	es cierto si el Elem pertenece en Arbol, como etiqueta

*/
pertenece_abb(E,a(E,_,_)).
pertenece_abb(E,a(N,Hi,_)):- E < N, pertenece_abb(E,Hi). 
pertenece_abb(E,a(N, _,Hd)):- E > N, pertenece_abb(E,Hd). 

arbol1(a(1,a(2,nil,nil),a(3, nil, a(4,nil,nil)))).
