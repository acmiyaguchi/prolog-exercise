% P28 (**) Sorting a list of lists according to length of sublists 
%
%     a) We suppose that a list (InList) contains elements that are lists themselves. The
%     objective is to sort the elements of InList according to their length. E.g.
%     short lists first, longer lists later, or vice versa.

%     Example: ?- lsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]],L).
%     L = [[o], [d, e], [d, e], [m, n], [a, b, c], [f, g, h], [i, j, k, l]]

withlength([], []).
withlength([X|Xs], [[Len, X]|Ys]) :-
    length(X, Len),
    withlength(Xs, Ys).

lsort(L, R) :-
    withlength(L, X),
    sort(1, @=<, X, Sorted),
    withlength(R, Sorted).

test1 :-
    lsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]],L),
    L = [[o], [d, e], [d, e], [m, n], [a, b, c], [f, g, h], [i, j, k, l]].


%     b) Again, we suppose that a list (InList) contains elements that are
%     lists themselves. But this time the objective is to sort the elements of
%     InList according to their length frequency; i.e. in the default, where
%     sorting is done ascendingly, lists with rare lengths are placed first,
%     others with a more frequent length come later.

%     Example: ?- lfsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]],L).
%     L = [[i, j, k, l], [o], [a, b, c], [f, g, h], [d, e], [d, e], [m, n]]

%     Note that in the above example, the first two lists in the result L have
%     length 4 and 1, both lengths appear just once. The third and forth list
%     have length 3 which appears, there are two list of this length. And
%     finally, the last three lists have length 2. This is the most frequent
%     length. 

% runlength encoding
:- consult(p10).

second([_,T], T).

% a dictionary would be even better for generating frequency counts
freq(L, Freq) :-
    maplist(length, L, Counts),
    msort(Counts, SortedCounts),
    encode(SortedCounts, RLEncoded),
    sort(1, @=<, RLEncoded, SortedFreq),
    maplist(second, SortedFreq, Freq).

freqOrdering(_, [], []).
freqOrdering(Freqs, [[Len, X]|Xs], [[Idx, X]|Ys]) :-
    % index the current length into the frequency ordering list
    nth1(Idx, Freqs, Len),
    freqOrdering(Freqs, Xs, Ys).

lfsort(L, R) :-
    freq(L, Freqs),    
    withlength(L, WithLength),
    freqOrdering(Freqs, WithLength, WithFrequencyRarity),
    sort(1, @=<, WithFrequencyRarity, Ordered),
    maplist(second, Ordered, R).

% TODO: this does not preserve the original ordering of the lists as a tie-breaker
test2 :-
    lfsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]],L),
    L = [[o], [i, j, k, l], [a, b, c], [f, g, h], [d, e], [d, e], [m, n]].