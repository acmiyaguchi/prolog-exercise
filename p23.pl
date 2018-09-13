% P23 (**) Extract a given number of randomly selected elements from a list.
% The selected items shall be put into a result list.

:- consult(p20).

rnd_select(_, 0, []).
rnd_select(List, N, [Elem|Rest]) :-
    N > 0,
    length(List, Len),
    Pos is random(Len) + 1,
    remove_at(Elem, List, Pos, Res),
    N1 is N - 1,
    rnd_select(Res, N1, Rest).

% TODO: all possible List's can't be generated from this predicate
test1 :-
    rnd_select([a,b,c,d,e,f,g,h],3,L),
    L = [e,d,a].
