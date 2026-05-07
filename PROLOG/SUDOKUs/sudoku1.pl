:- use_module(library(clpfd)).

/*
problem2(2,R), sudoku2(R), maplist(labeling([ff]), R),maplist(portray_clause,R).
*/

sudoku(Rows):- 
			length(Rows,9),
			maplist(same_length(Rows),Rows),
			append(Rows,Vs),
			Vs ins 1..9,
			maplist(all_distinct,Rows),
			transpose(Rows, Columns),
			maplist(all_distinct,Columns),
			Rows = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
			blocks(As,Bs,Cs),
			blocks(Ds,Es,Fs),
			blocks(Gs,Hs,Is).
			
blocks([],[],[]).
blocks([A,B,C|R1],[D,E,F|R2],[G,H,I|R3]):-
	all_distinct([A,B,C,D,E,F,G,H,I]),
	blocks(R1,R2,R3).
			
			
			
			
			
	problem(1, [[_,_,_,_,_,_,_,_,_],
            [_,_,_,_,_,3,_,8,5],
            [_,_,1,_,2,_,_,_,_],
            [_,_,_,5,_,7,_,_,_],
            [_,_,4,_,_,_,1,_,_],
            [_,9,_,_,_,_,_,_,_],
            [5,_,_,_,_,_,_,7,3],
            [_,_,2,_,1,_,_,_,_],
            [_,_,_,_,4,_,_,_,9]]).	
				
	problem(2, [[_,_,_,_,_,_,_,_,_],
				[_,_,_,_,_,_,_,_,_],
				[_,_,_,_,_,_,_,_,_],
				[_,_,_,_,_,_,_,_,_],
				[_,_,_,_,_,_,_,_,_],
				[_,_,_,_,_,_,_,_,_],
				[_,_,_,_,_,_,_,_,_],
				[_,_,_,_,_,_,_,_,_],
				[_,_,_,_,_,_,_,_,_]]).	
						
	problem(3, [[1,_,_,_,_,_,_,_,_],
				[_,1,_,_,_,_,_,_,_],
				[_,_,1,_,_,_,_,_,_],
				[_,_,_,_,_,_,_,_,_],
				[_,_,_,_,1,_,_,_,_],
				[_,_,_,_,_,1,_,_,_],
				[_,_,_,_,_,_,1,_,_],
				[_,_,_,_,_,_,_,1,_],
				[_,_,_,_,_,_,_,_,1]]).	
				
			
			
			
