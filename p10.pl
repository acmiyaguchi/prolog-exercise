% P10 (*) Run-length encoding of a list.
% Use the result of problem P09 to implement the so-called run-length encoding data compression method. 
% Consecutive duplicates of elements are encoded as terms [N,E] where N is the number of duplicates of the element E.

:- consult(p09).

with_length(List, [Len, El]) :-
    last(List, El),
    length(List, Len).

encode(List, Result) :-
    pack(List, Packed),
    maplist(with_length, Packed, Result).

test1 :-
    encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e],X),
    X = [[4,a],[1,b],[2,c],[2,a],[1,d],[4,e]].