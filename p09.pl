% P09 (**) Pack consecutive duplicates of list elements into sublists.
% If a list contains repeated elements they should be placed in separate sublists.

pack_h([], Cur, Acc, Out) :- append(Acc, [Cur], Out).

pack_h([H|T], Cur, Acc, Out) :-
    member(H, Cur),
    pack_h(T, [H|Cur], Acc, Out).

pack_h([H|T], Cur, Acc, Out) :-
    append(Acc, [Cur], X),
    pack_h(T, [H], X, Out).

pack([H|T], R) :- pack_h(T, [H], [], R).

test1 :-
    pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X),
    X = [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]].
