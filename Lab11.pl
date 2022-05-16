%===============================1============================
%Es1
dropAny(X, [X|T], T).
dropAny(X, [H|Xs], [H|L]) :- dropAny(X, Xs, L).

dropFirst(X, [X|T], T) :- !.
dropFirst(X, [H|Xs], [H|L]) :- dropFirst(X, Xs, L).

dropLast(X, [H|Xs], [H|L]) :- dropLast(X, Xs, L), !.
dropLast(X, [X|T], T).

dropAll(X, [], []).
dropAll(X, [X|T], L) :- dropAll(X, T, L), !.
dropAll(X, [H|Xs], [H|L]) :- dropAll(X, Xs, L).

%===============================2============================
% Es1
fromList([_], []) .
fromList([H1, H2 | T], [e(H1 ,H2) | L]) :- fromList([H2|T], L).

% Es2
fromCircList([X], [e(X, X)]).
fromCircList([H|T], R) :- append([H|T], [H], W), fromList(W, R).

%Es3
inDegree([], _, 0) .
inDegree([e(H1, H2)|T], H2, C2) :- inDegree(T, H2, C), C2 is C + 1.
inDegree([e(H1, H2)|T], X, C) :- inDegree(T, X, C).

%Es4
dropNode(G, N, OG) :- dropAll(e(N,_), G, G2), dropAll(e(_,N), G, GO).

%Es5
findAll([], N,[]).
findAll([e(N,X)|T], N, [X|L]) :- findAll(T, N, L).
findAll([e(X,Y)|T], N, L) :- findAll(T, N, L).

reaching(G, N, L) :- member(e(N,_), G), findAll(G, N, L), !.

%Es6
findNode(e(X,Y), [], []).
findNode(e(X,Y), [e(X,Y)|T], R) :- findNode(e(X,Y), T, L), R = [e(X,Y)|L], !.
findNode(e(X,Y), [e(X2,Y2)|T], R) :- findNode(e(X,Y), T, R).

anyPath([], N1, N2, []).
anyPath(G, N1, N2, R) :- findNode(e(N1,N2), G, R).



