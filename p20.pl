% P20 (*) Remove the K'th element from a list.

remove_at(E, [E|Xs], 1, Xs).
remove_at(E, [X|Xs], K, [X|Ys]) :-
    K1 is K - 1,
    remove_at(E, Xs, K1, Ys).

test1 :-
    remove_at(X,[a,b,c,d],2,R),
    X = b,
    R = [a,c,d].
