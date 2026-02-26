/*
en MAYUSC--> variables
	num_elem(+Lista, -Resultado)
		Es cierto si... Resultado unifica con el numero de elementos de Lista
	PRINCIPIO DE INDUCCION
		1. num_elem([], ).
		2. num_elem(n-1) -> num_elem(n)
*/

num_elem([], 0 ).																	% caso base
num_elem([_|Lista] , R2) :- num_elem(Lista , Resultado), R2 is Resultado + 1 . 		% no se coloca Lista como [Lista], seria lo mismo que decir A = [[a, b, c]]