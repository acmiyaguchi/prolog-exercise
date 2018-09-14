% P25 (*) Generate a random permutation of the elements of a list.

:- consult(p23).

rnd_permu(L, R) :-
    length(L, Len),
    rnd_select(L, Len, R).

test1 :-
    rnd_permu([a,b,c,d,e,f],L),
    L = [b,a,d,c,e,f].