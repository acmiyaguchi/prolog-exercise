% P16 (**) Drop every N'th element from a list.

drop_h([], _, _, []).

drop_h([_|Xs], N, N, Y) :-
    drop_h(Xs, N, 1, Y).

drop_h([X|Xs], N, K, [X|Ys]) :-
    K1 is K + 1,
    drop_h(Xs, N, K1, Ys).

drop(L, N, R) :- drop_h(L, N, 1, R).

test1 :-
    drop([a,b,c,d,e,f,g,h,i,k],3,X),
    X = [a,b,d,e,g,h,k].