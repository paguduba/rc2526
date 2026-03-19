/*
 
 
 elegimos un pivote que divida la lista en dos partes iguales.
 Para los ejercicios, elegiremos el primer elemento.
 separamos en una lista los elementos mayores que el pivote y en otra los omenores.
 
 divide(+Elem, +Lista, -Menores,-Mayores):
 es ciereto cuando menores unifica con una lista que contiene los elementos de Lista que son menores o
 iguales que elem y Mayores unifica con una lista que contiene los elementos de Lista que son mayores que elem.
 
 																								19/03/2026
###############################################################################################################
 
 crea_lista(+Tam,+Num, -ListaR)
 Genera una lista ListaR de tamaño Tam, cuyos valores sean aleatorios entre 1 y Num
 
*/

divide(_,[],[],[]).
divide(E, [Cab|Res], [Cab|R2], May) :- Cab =< E, divide(E,Res,R2,May).
divide(E, [Cab|Res], Men, [Cab|R2]) :- Cab > E, divide(E,Res,Men,R2). 

quicksort([],[]).
quicksort([Cab|R],L) :- divide(Cab,R, Men, May), quicksort(Men, Men2), quicksort(May, May2), append(Men2, [Cab|May2], L). 
	

crea_lista(0,_,[]).
crea_lista(Tam,N,[C|R]):- Tam > 0, Tam2 is Tam - 1, crea_lista(Tam2,N,R), random_between(1,N,C).
