% P27 (**) Group the elements of a set into disjoint subsets.
%     a) In how many ways can a group of 9 people work in 3
%       disjoint subgroups of 2, 3 and 4 persons? Write a
%       predicate that generates all the possibilities via backtracking.


group3([], [0, 0, 0], [], [], []) :- !.
group3([H|T], [I, J, K], [H|T1], G2, G3) :-
    I > 0,
    I1 is I - 1,
    group3(T, [I1, J, K], T1, G2, G3).
group3([H|T], [I, J, K], G1, [H|T2], G3) :-
    J > 0,
    J1 is J - 1,
    group3(T, [I, J1, K], G1, T2, G3).
group3([H|T], [I, J, K], G1, G2, [H|T3]) :-
    K > 0,
    K1 is K - 1,
    group3(T, [I, J, K1], G1, G2, T3).

group3(L, G1, G2, G3) :- group3(L, [2, 3, 4], G1, G2, G3).

% ?- group3([aldo,beat,carla,david,evi,flip,gary,hugo,ida],G1,G2,G3).
% G1 = [aldo,beat], G2 = [carla,david,evi], G3 = [flip,gary,hugo,ida]


% b) Generalize the above predicate in a way that we can specify a list of
% group sizes and the predicate will return a list of groups.

% input, L: lengths, R: results

% base-case
group([], [], []) :- !.

% go to the next size if the current element is 0
group(In, [0|Ls], [[]|Rs]) :- group(In, Ls, Rs).

% Xs is the sublist that's currently being added to
group([H|T], [L|Ls], [[H|Xs]|Rs]) :-
    L > 0,
    L1 is L - 1,
    group(T, [L1|Ls], [Xs|Rs]).

% we can also skip over an element, see p26 for similar logic
group([H|T], [N,L|Ls], [X,[H|Xs]|Rs]) :-
    L > 0,
    L1 is L - 1,
    group(T, [N,L1|Ls], [X,Xs|Rs]).
% we can skip within



% Example:
% ?- group([aldo,beat,carla,david,evi,flip,gary,hugo,ida],[2,2,5],Gs).
% Gs = [[aldo,beat],[carla,david],[evi,flip,gary,hugo,ida]]
% ...