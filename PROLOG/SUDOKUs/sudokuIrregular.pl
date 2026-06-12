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
			
			
			sudoku_vacio([
    [_, 3, _, _, _, _, _, _, _],
    [_, _, _, _, _, _, _, _, _],
    [_, _, _, _, _, _, _, 5, _],
    [_, _, _, _, _, _, _, _, _],
    [_, _, _, _, _, _, _, _, _],
    [_, _, _, _, _, _, 9, _, _],
    [_, _, _, _, _, _, _, _, _],
    [_, _, _, 2, _, _, _, _, _],
    [_, _, _, _, _, _, _, _, _]
]).

/*
sudoku_vacio(K), sudoku(K),  maplist(labeling([ff]), K), maplist(portray_clause,K).
labeling realiza un backtracking en cada fila, empezando con el que tenga el 
dominio mas pequeño
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
		
		append(S, Ds),				
		Ds ins 1..9,				
		
		maplist(all_distinct, S),	% comprueba que, en cada fila solo existan numeros distintos
		transpose(S,K2), 
		maplist(all_distinct, K2),
		
		% DIFERENCIA EN SUDOKU IRREGULAR: los grupos se tendran que ponerse de manera manual en el all_distinct
		
		S = [[P11, P12, P13, P14, P15, P16, P17, P18, P19],
			[P21, P22, P23, P24, P25, P26, P27, P28, P29],
			[P31, P32, P33, P34, P35, P36, P37, P38, P39],
			[P41, P42, P43, P44, P45, P46, P47, P48, P49],
			[P51, P52, P53, P54, P55, P56, P57, P58, P59],
			[P61, P62, P63, P64, P65, P66, P67, P68, P69],
			[P71, P72, P73, P74, P75, P76, P77, P78, P79],
			[P81, P82, P83, P84, P85, P86, P87, P88, P89],
			[P91, P92, P93, P94, P95, P96, P97, P98, P99]],
			
			
			 all_distinct([P11,P12,P21,P31,P32,P41,P51,P52,P62]),
					     all_distinct([P61,P71,P72,P81,P84,P91,P92,P93,P94]),
					     all_distinct([P13,P14,P15,P22,P23,P33,P34,P42,P43]),
					     all_distinct([P53,P63,P73,P74,P75,P82,P83,P85,P95]),
					     all_distinct([P16,P17,P18,P19,P24,P25,P26,P29,P39]),
					     all_distinct([P35,P44,P45,P54,P64,P65,P66,P76,P86]),
					     all_distinct([P27,P28,P36,P37,P46,P55,P56,P57,P58]),
					     all_distinct([P38,P47,P48,P49,P59,P68,P69,P78,P88]),
					     all_distinct([P67,P77,P79,P87,P89,P96,P97,P98,P99])

			
			
			
			.
