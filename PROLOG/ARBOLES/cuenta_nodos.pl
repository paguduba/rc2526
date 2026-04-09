/*

cuenta_nodos(+Arbol, ?Num).
es cierto cuando Num unnifica con el numero de nodos de Arbol
*/

%el arbol es nulo, (nil)
cuenta_nodos(nil, 0). 

cuenta_nodos(a(_,Hi,Hd), R0 ):- cuenta_nodos(Hi, Ri), cuenta_nodos(Hd, Rd), R0 is Ri + Rd + 1.


arbol1(a(1,a(2,nil,nil),a(3, nil, a(4,nil,nil)))).

