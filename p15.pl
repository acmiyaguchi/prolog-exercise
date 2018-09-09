% P15 (**) Duplicate the elements of a list a given number of times.

dupli_h([], _, _, []).

dupli_h([X|Xs], N, N, [X|Ys]) :-
    dupli_h(Xs, N, 1, Ys).

dupli_h([X|Xs], N, K, [X|Ys]) :-
    K1 is K + 1,
    dupli_h([X|Xs], N, K1, Ys).

dupli(L, N, R) :- dupli_h(L, N, 1, R).

test1 :-
    dupli([a,b,c],3,X),
    X = [a,a,a,b,b,b,c,c,c].

test2 :-
    dupli([a,b,c], 1, X),
    X = [a,b,c].

runtests :- test1, test2.