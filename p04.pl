% Find the length of a list

my_length([], 0).
my_length([_|T], N) :-
    my_length(T, X),
    N is X + 1.


test1 :- my_length([a], X), X = 1.
test2 :- my_length([a, b], X), X = 2.
test3 :- my_length([a, b, c, d], X), X = 4.
test4 :- my_length([], X), X = 0.

runtests :-
    test1,
    test2,
    test3,
    test4.
