/*

altura_ag(+ArbolG, -ALtura).
	es cierto si altura unifica con la altura de ArbolG

*/

altura_ag(a(_,Lista), R2 ) :- altura_ag_L(Lista,R), R2 is R + 1.

altura_ag_L([], 0 ).
altura_ag_L([Cab|Res], R2 ):- altura_ag(Cab, R), altura_ag_L(Res, RR), R2 is max(R,RR) .