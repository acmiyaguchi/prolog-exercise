% P14 (*) Duplicate the elements of a list.

% base
dupli_h([], _, []).

% On even elements, progress only the right tail
dupli_h([X|Xs], Even, [X|Ys]) :-
    Even,
    dupli_h([X|Xs], not(Even), Ys).

% On odd elements, progress on both tails
dupli_h([X|Xs], Odd, [X|Ys]) :-
    dupli_h(Xs, not(Odd), Ys).

dupli(L, R) :- dupli_h(L, true, R).

test1 :-
    dupli([a,b,c,c,d],X),
    X = [a,a,b,b,c,c,c,c,d,d].