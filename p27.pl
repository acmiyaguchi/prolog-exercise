% P27 (**) Group the elements of a set into disjoint subsets.
%     a) In how many ways can a group of 9 people work in 3
%       disjoint subgroups of 2, 3 and 4 persons? Write a
%       predicate that generates all the possibilities via backtracking.


group3([], _, _, _) :- !.
group3([H|T], [H|T1], G2, G3) :-
    length([H|T1], 2),
    group3(T, T1, G2, G3).
group3([H|T], G1, [H|T2], G3) :-
    length([H|T2], 3),
    group3(T, G1, T2, G3).
group3([H|T], G1, G2, [H|T3]) :-
    length([H|T3], 4),
    group3(T, G1, G2, T3).

