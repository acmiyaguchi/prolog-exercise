:- consult(p05).

is_palindrome(X) :-
    reversed(X, R),
    X == R.

test1 :- is_palindrome([a]).
test2 :- not(is_palindrome([a, b])).
test3 :- is_palindrome([a,b,a]).
test4 :- is_palindrome([a,b,b,a]).

runtests :- test1, test2, test3, test4.
