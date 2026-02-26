/*
	
	dos terminos se unifican cuando... 
		Si no tienen variable.... son exactamente iguales sin contar los caracteres
		Si tienen variables.... cuando podemos encontrar una sustitucion de variables que nos lleve al valor final
	
	
	member(?A, ?B) 		% el ? indica que puede ser un elemento sin o con valor
	
	
	pertenece(?Elem, ?Lista) Cierto si Elem es contenido por la lista
	
	1. P(n0)
	2. Para todo n>n0, si P(n-1) -> P(n)
*/
	pertenece( Elem , [Elem|_]).
	pertenece(Elem, [_|Resto]):- pertenece(Elem, Resto).		%Elem estará dentro de la lista, sin ser el primer elemento, si pertenece en el Resto de la lista (tomando a esta como una lista nueva)
	
	
	
	
	
	
	
	
%	bagof(Elem, pertenece(Elem, [1, 2, 3, 4]), Lista).	Dame todas las soluciones de este problema