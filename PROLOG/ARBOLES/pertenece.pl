/*

	pertenece(+Elem, +Arbol)
	es cierto si el Elem pertenece en Arbol, como etiqueta

*/

pertenece(E, a(E,_,_)).
pertenece(E, a(_, Hi, _)):- pertenece(E, Hi).

pertenece(E, a(_, _, Hd)):-pertenece(E, Hd).


arbol1(a(1,a(2,nil,nil),a(3, nil, a(4,nil,nil)))).
