num(0,0).
num(N,R) :- N>0, N2 is N - 1, num(N2,R2), R is R2 + N. 