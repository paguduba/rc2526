:- use_module(library(clpfd)).

sudoku1(
[[1, 2, 3, 4, 5, 6, 7, 8, 9],
[4, 5, 6, 7, 8, 9, 1, 2, 3],
[7, 8, 9, 1, 2, 3, 4, 5, 6],
[2, 1, 4, 3, 6, 5, 8, 9, 7],
[3, 6, 5, 8, 9, 7, 2, 1, 4],
[8, 9, 7, 2, 1, 4, 3, 6, 5],
[5, 3, 1, 6, 4, 8, 9, 7, 2],
[6, 7, 2, 9, 3, 1, 5, 4, 8],
[9, 4, 8, 5, 7, 2, 6, 3, 1]]).

sudoku2(
[[_, 2, _, 4, _, 6, 7, 8, 9],
 [4, _, 6, 7, 8, 9, _, 2, _],
 [7, 8, 9, _, 2, _, 4, _, 6],
 [2, _, 4, _, 6, _, 8, 9, 7],
 [_, 6, _, 8, 9, 7, 2, _, 4],
 [8, 9, 7, 2, _, 4, _, 6, _],
 [_, _, _, 6, 4, 8, 9, 7, 2],
 [6, 7, 2, 9, _, _, _, 4, 8],
 [9, 4, 8, _, 7, 2, 6, _, _]]).
 
sudoku3( 
[[_,_,_,_,_,_,_,_,_],
 [_,_,_,_,_,3,_,8,5],
 [_,_,1,_,2,_,_,_,_],
 [_,_,_,5,_,7,_,_,_],
 [_,_,4,_,_,_,1,_,_],
 [_,9,_,_,_,_,_,_,_],
 [5,_,_,_,_,_,_,7,3],
 [_,_,2,_,1,_,_,_,_],
 [_,_,_,_,4,_,_,_,9]]).
			

/*
sudoku3(K), sudoku(K),  maplist(labeling([ff]), K), maplist(portray_clause,K).
labeling realiza un backtracking en cada fila, empezando con el que tenga el dominio mas pequeño
 maplist(portray_clause,K) --> imrpmie cada fila de forma limpia

	QUE HACE SUDOKU(+Sudoku):
	-	mira que el numero de filas sea 9
	-	revisa que las filas sean de 9 elementos
	-	revisa que estan dentro del dominio
	-	revisa que las filas y columnas sean numeros distintos

*/

sudoku(S):- 
		length(S, 9),				% comprueba que tenga 9 filas
		maplist(same_length(S), S),	% comprueba que las 9 filas tengan 9 elementos
		
		append(S, Ds),				% recoge todos los elementos y comprueba
		Ds ins 1..9,				% si estan en el dominio
		
		
		maplist(all_distinct, S),	% comprueba que, en cada fila solo existan numeros distintos
		transpose(S,K2), 
		maplist(all_distinct, K2),
		
		S = [A, B, C, D, E, F, G, H, I],	% separa todas las filas
		
		blocks(A, B, C),
		blocks(D, E, F),
		blocks(G, H, I)
		
		.
		
		
blocks([], [], []).
blocks([A,B,C|Resto1], [D,E,F|Resto2], [G,H,I|Resto3]):- 
	all_distinct([A,B,C,D,E,F,G,H,I]),	% los 3 primeros elementos de las 3 filas son distintos
	blocks(Resto1, Resto2, Resto3).
