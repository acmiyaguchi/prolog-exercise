% Find the K'th element of a list

element_at(X, [X|_], 1).
element_at(X, [H|T], K) :-
    Kp is K - 1,
    element_at(X, T, Kp).

test1 :- element_at(X, [a, b], 1), X = a.
test2 :- element_at(X, [a, b, c, d], 3), X = c.

runtests :-
    test1,
    test2.
