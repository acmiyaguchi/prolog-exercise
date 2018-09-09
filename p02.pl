% Find the last but one element of a list

helper(X, X, [_]).
helper(X, _, [H|T]) :- helper(X, H, T).

last_but_one(X, [H|T]) :- helper(X, H, T).


test1 :- last_but_one(X, [a, b]), X = a.
test2 :- last_but_one(X, [a, b, c]), X = b.
test3 :- last_but_one(X, [a, b, c, d]), X = c.

runtests :-
    test1,
    test2,
    test3.
