

% lenght of list%

lenght([], 0).
lenght([_|T], X) :-
	lenght(T, X1), X is X1 + 1.

%A) Substitute in a list a value with all the elements of another list %

concat([],L2,L2). 
concat([Head|Tail],L2,[Head|L3]) :- concat(Tail,L2,L3). 

repl(_, _, [], []).
repl(O, R, [O|T], NEW_LIST) :- 
	concat(R, T2, NEW_LIST),
	repl(O, R, NEW_LIST, T2).
repl(O, R, [H|T], [H|T2]) :- H \= O, repl(O, R, T, T2).

%B) Remove element at position n%

dele(1,[_|T],T).

dele(X, A, B):-
	lenght(A, L),
	X > L,
    !, 
    dele(L, A, B).

dele(X, A, B) :-
	X < 0,
    !,
	dele(1, A, B).

dele(X,[H|T],[H|S]):-
	X1 is X-1, 
	dele(X1,T,S).
