% P24 (*) Lotto: Draw N different random numbers from the set 1..M.
% The selected numbers shall be put into a result list.

:- consult(p22).
:- consult(p23).

lotto(N, M, R) :-
    range(1, M, Range),
    rnd_select(Range, N, R).

test1 :-
    lotto(6,49,L),
    L = [23,1,17,33,21,37].
