% P12 (**) Decode a run-length encoded list.
% Given a run-length code list generated as specified in problem P11. Construct its uncompressed version.

:- consult(p11).

decode_h(_, 0, Acc, Acc).
decode_h(El, Len, Acc, Y) :-
    Len_p is Len - 1,
    decode_h(El, Len_p, [El|Acc], Y).

decode([], []).

decode([[Len, El]|Xs], Y) :-
    decode_h(El, Len, [], X),
    append(X, Ys, Y),
    decode(Xs, Ys).

decode([X|Xs], [X|Ys]) :- decode(Xs, Ys).

test1 :-
    decode([[4,a],b,[2,c],[2,a],d,[4,e]], X),
    X = [a,a,a,a,b,c,c,a,a,d,e,e,e,e].