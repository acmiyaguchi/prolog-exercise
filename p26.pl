% P26 (**) Generate the combinations of K distinct objects chosen from the N elements of a list
%     In how many ways can a committee of 3 be chosen from a group of 12 people?
%     We all know that there are C(12,3) = 220 possibilities (C(N,K) denotes the
%     well-known binomial coefficients). For pure mathematicians, this result
%     may be great. But we want to really generate all the possibilities
%     (via backtracking).

combination(0, _, []) :- !.
combination(K, [X|Xs], [X|Ys]) :-
    K1 is K - 1,
    combination(K1, Xs, Ys).
combination(K, [_|Xs], Y) :- combination(K, Xs, Y).

% testing helpers
factorial(0, 1).
factorial(K, Res) :-
    K1 is K - 1,
    factorial(K1, R1),
    Res is R1 * K.
binom(N, R, Res) :-
    factorial(N, NFac),
    factorial(R, RFac),
    NmR is N - R,
    factorial(NmR, NRFac),
    Res is NFac / (RFac * NRFac).

test1 :-
    X = 20,
    binom(6, 3, X),
    findall(L, combination(3,[a,b,c,d,e,f],L), R),
    length(R, X).
