% P13 (**) Run-length encoding of a list (direct solution).
% Implement the so-called run-length encoding data compression method directly.
% I.e. don't explicitly create the sublists containing the duplicates, as in
% problem P09, but only count them. As in problem P11, simplify the result list
% by replacing the singleton terms [1,X] by X.

% Note: I'm definitely not going to be able to read this 6 months from now,
% so I'll explain. Each case will be followed in turn because of backtracking.

% base case
encode_h([], _, []).

% if the current element is the same as the one we're building, continue
% accumulating the length
encode_h([X|Xs], Acc, [[Len, X]|Ys]) :-
    Acc1 is Acc + 1,
    encode_h(Xs, Acc1, [[Len, X]|Ys]).

% the element is different, move on to the next element and unify the length
encode_h(X, Acc, [[Acc, _]|Ys]) :-
    Acc > 1,
    encode_h(X, 0, Ys).

% the accumulated length was too short, just append it to the result list
encode_h([X|Xs], _, [X|Ys]) :- encode_h(Xs, 0, Ys).

encode_direct(L, R) :- encode_h(L, 0, R).

test1 :-
    encode_direct([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X),
    X = [[4,a],b,[2,c],[2,a],d,[4,e]].