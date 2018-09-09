% P08 (**) Eliminate consecutive duplicates of list elements.
%    If a list contains repeated elements they should be replaced with a single copy of the element. 
%    The order of the elements should not be changed.

compress_h([], Acc, Acc).

% Skip repeating characters
compress_h([H|T], Acc, Out) :-
    last(Acc, H),
    compress_h(T, Acc, Out).

% append/3 seems like a wasteful solution
compress_h([H|T], Acc, Out) :-
    append(Acc, [H], X),
    compress_h(T, X, Out).

compress(L, R) :- compress_h(L, [], R).

test1 :-
    compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X),
    X = [a,b,c,a,d,e].