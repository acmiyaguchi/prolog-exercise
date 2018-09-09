% P18 (**) Extract a slice from a list.
% Given two indices, I and K, the slice is the list containing the elements
% between the I'th and K'th element of the original list (both limits included).
% Start counting the elements with 1.

% This implementation is not particularly robust to malformed inputs.

% base case
slice_h([], _, _, _, []).

% starting condition
slice_h([_|Xs], I, K, Pos, Y) :-
    Pos < I,
    Pos1 is Pos + 1,
    slice_h(Xs, I, K, Pos1, Y).

% ending condition
slice_h([X|_], _, K, K, [X]).

% output building
slice_h([X|Xs], I, K, Pos, [X|Ys]) :-
    Pos1 is Pos + 1,
    slice_h(Xs, I, K, Pos1, Ys).

slice(L, I, K, R) :- slice_h(L, I, K, 1, R).


test1 :-
    slice([a,b,c,d,e,f,g,h,i,k],3,7,L),
    L = [c,d,e,f,g].
