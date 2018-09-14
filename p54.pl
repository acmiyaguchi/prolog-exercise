% P54 (*) Check whether a given term represents a binary tree
%     Write a predicate istree/1 which succeeds if and only if its argument is a Prolog term representing a binary tree.

istree(nil).
istree(t(_, L, R)) :- istree(L), istree(R).

test1 :- istree(
    t(a,t(b,t(d,nil,nil),
        t(e,nil,nil)),
    t(c,nil,
        t(f,t(g,nil,nil),nil)))).
test2 :- istree(t(a,nil,nil)).
test3 :- istree(nil).