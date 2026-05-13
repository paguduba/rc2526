:- use_module(library(clpfd)).



sudoku2(Rows):- 
			length(Rows,9),
			maplist(same_length(Rows),Rows),
			append(Rows,Vs),
			Vs ins 1..9,
			maplist(all_distinct,Rows),
			transpose(Rows, Columns),
			maplist(all_distinct,Columns),
			Rows = [[P11,P12,P13,P14,P15,P16,P17,P18,P19],
					[P21,P22,P23,P24,P25,P26,P27,P28,P29],
					[P31,P32,P33,P34,P35,P36,P37,P38,P39],
					[P41,P42,P43,P44,P45,P46,P47,P48,P49],
					[P51,P52,P53,P54,P55,P56,P57,P58,P59],
					[P61,P62,P63,P64,P65,P66,P67,P68,P69],
					[P71,P72,P73,P74,P75,P76,P77,P78,P79],
					[P81,P82,P83,P84,P85,P86,P87,P88,P89],
					[P91,P92,P93,P94,P95,P96,P97,P98,P99]],
			all_distinct([P11,P12,P13,P14,P15,P16,P17,P18,P19]),
			all_distinct([P21,P22,P23,P24,P25,P26,P27,P28,P29]),
			all_distinct([P31,P32,P33,P34,P35,P36,P37,P38,P39]),
			all_distinct([P41,P42,P43,P44,P45,P46,P47,P48,P49]),
			all_distinct([P51,P52,P53,P54,P55,P56,P57,P58,P59]),
			all_distinct([P61,P62,P63,P64,P65,P66,P67,P68,P69]),
			all_distinct([P71,P72,P73,P74,P75,P76,P77,P78,P79]),
			all_distinct([P81,P82,P83,P84,P85,P86,P87,P88,P89]),
			all_distinct([P91,P92,P93,P94,P95,P96,P97,P98,P99]).
			
			
	problem2(1, [[_,_,_,_,_,_,_,_,_],
            [_,_,_,_,_,3,_,8,5],
            [_,_,1,_,2,_,_,_,_],
            [_,_,_,5,_,7,_,_,_],
            [_,_,4,_,_,_,1,_,_],
            [_,9,_,_,_,_,_,_,_],
            [5,_,_,_,_,_,_,7,3],
            [_,_,2,_,1,_,_,_,_],
            [_,_,_,_,4,_,_,_,9]]).	
				
	problem2(2, [[1,2,_,_,_,_,_,_,_],
				[_,1,_,_,_,_,_,_,_],
				[_,_,1,_,_,_,_,_,_],
				[_,_,_,1,_,_,_,_,_],
				[_,_,_,_,1,_,_,_,_],
				[_,_,_,_,_,1,_,_,_],
				[_,_,_,_,_,_,1,_,_],
				[_,_,_,_,_,_,_,1,_],
				[_,_,_,_,_,_,_,_,1]]).	
				
			
			
			
