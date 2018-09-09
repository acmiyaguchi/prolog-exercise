% P11 (*) Modified run-length encoding.
% Modify the result of problem P10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as [N,E] terms.

:- consult(p10).

transform([], []).
transform([[1, X]|Xs], [X|Ys]) :- transform(Xs, Ys).
transform([X|Xs], [X|Ys]) :- transform(Xs, Ys).

encode_modified(L, R) :-
    encode(L, Enc),
    transform(Enc, R).

test1 :-
    encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X),
    X = [[4,a],b,[2,c],[2,a],d,[4,e]].