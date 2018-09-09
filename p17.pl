% P17 (*) Split a list into two parts; the length of the first part is given. 

% this can also be done without the helper function

% split the lists into two
split_h([X|Xs], N, N, [X], Xs).
split_h([X|Xs], N, K, [X|L], R) :-
    K1 is K + 1,
    split_h(Xs, N, K1, L, R).

split(List, N, Left, Right) :- split_h(List, N, 1, Left, Right).

test1 :-
    split([a,b,c,d,e,f,g,h,i,k],3,L1,L2),
    L1 = [a,b,c],
    L2 = [d,e,f,g,h,i,k].