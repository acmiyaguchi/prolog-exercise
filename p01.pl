% Find the last element of a list
my_last(X, [X]).
my_last(X, [_|T]) :- my_last(X, T).

test1 :- my_last(X, [a]), X = a.
test2 :- my_last(X, [a, b, c]), X = c.

runtests :-
    test1,
    test2.
