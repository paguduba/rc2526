/*
inserta_en_list_ord(+Elem,+Lista,-ListaR).


inserta_en_list_ord(Elem,Lista, Sol):-
	append(L1,[Cab1| Res],Lista),
	Elem =< Cab1,
	append(L1,[Elem,Cab1|Res],Sol).
	
inserta_en_list_ord(Elem,Lista, Final):-
	append(L1,[Cab1| Res],Lista),
	Elem > Cab1,
	append(L1,Res,Sol),
	inserta_en_list_ord(Elem,Sol, Final).
	
	

*/

inserta_en_list_ord(Elem,[],[Elem]).

inserta_en_list_ord(Elem, [Cab|Res] , [Elem, Cab|Res]):- 
	Elem =< Cab.
	
inserta_en_list_ord(Elem, [Cab|Res], [Cab|R2]):-
	Elem > Cab,
	inserta_en_list_ord(Elem, Res, R2).
	
ordena_insercion([],[]).
ordena_insercion([Cab|Resto],R2):-
	ordena_insercion(Resto, R),
	inserta_en_list_ord(Cab, R, R2).
