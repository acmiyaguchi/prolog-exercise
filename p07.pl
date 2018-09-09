% P07 (**) Flatten a nested list structure.
% Transform a list, possibly holding lists as elements into a `flat` list by replacing each list with its elements (recursively).
% Hint: Use the predefined predicates is_list/1 and append/3

my_flatten_h([H|T], A, X) :-
    is_list(H),
    my_flatten_h(H, [], Y),
    append(A, Y, Z),
    my_flatten_h(T, Z, X).

my_flatten_h([H|T], A, X) :-
    append(A, [H], Y),
    my_flatten_h(T, Y, X).

my_flatten_h([], A, A).

my_flatten(L, R) :- my_flatten_h(L, [], R).

test1 :-
    my_flatten([a, [b, [c, d], e]], X),
    X = [a, b, c, d, e].

test2 :-
    my_flatten([[a], [[b], [c, d], e]], X),
    X = [a, b, c, d, e].

runtests :- test1, test2.
