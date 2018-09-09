% P19 (**) Rotate a list N places to the left.

% split
:- consult(p17).

rotate(L, N, R) :-
    N > 0,
    split(L, N, L1, L2),
    append(L2, L1, R).

rotate(L, N, R) :-
    % N is negative, rotate the other way
    length(L, Len),
    Mod is Len + N,
    split(L, Mod, L1, L2),
    append(L2, L1, R).

test1 :-
    rotate([a,b,c,d,e,f,g,h],3,X),
    X = [d,e,f,g,h,a,b,c].

test2 :-
    rotate([a,b,c,d,e,f,g,h],-2,X),
    X = [g,h,a,b,c,d,e,f].

% TODO: index is greater than the length of the list