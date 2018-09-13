% P22 (*) Create a list containing all integers within a given range.

range(X, X, [X]).
range(X, Y, [X|Xs]) :-
    X < Y,
    X1 is X + 1,
    range(X1, Y, Xs).
% the range is backwards
range(X, Y, L) :-
    range(Y, X, L1),
    reverse(L1, L).

test1 :-
    range(4,9,L),
    L = [4,5,6,7,8,9].

test2 :-
    range(9,7,L),
    L = [9,8,7].

runtests :- test1, test2.