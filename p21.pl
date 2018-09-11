% P21 (*) Insert an element at a given position into a list.

insert_at(E, X, 1, [E|X]).
insert_at(E, [X|Xs], K, [X|Ys]) :-
    K1 is K - 1,
    insert_at(E, Xs, K1, Ys).

test1 :-
    insert_at(alfa,[a,b,c,d],2,L),
    L = [a,alfa,b,c,d].