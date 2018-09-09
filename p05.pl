% Reverse a list

helper([], A, A).
helper([H|T], A, R) :- helper(T, [H|A], R).

reversed(L, R) :- helper(L, [], R).

test1 :- reversed([a,b,c], X), X = [c, b, a].
test2 :- reversed([a,b,c,d], X), X = [d, c, b, a].

runtests :-
    test1,
    test2.
