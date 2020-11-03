
list_min([P|T], O) :- list_min(T, P, O).

list_min([], P, P).
list_min([H|T], P, O) :-
    (    H < P
    ->   list_min(T, H, O)
    ;    list_min(T, P, O)).

clone([], []).
clone([H|T], [H|Z]) :- clone(T,Z).

remove_first_min(L, ANS) :-
    clone(L, CLONE),
	list_min(CLONE, MAX),
	remove_first_occurance(L, MAX, ANS).


remove_first_occurance([], _, _,[]).

remove_first_occurance([H|T], VAL, 0, [H|T1]):-
			remove_first_occurance(T, VAL, 0, T1).

remove_first_occurance([VAL|T], VAL, X, RES) :-
			X1 is X-1,
			remove_first_occurance(T,VAL,X1,RES).

remove_first_occurance([H|T], VAL, X,[H|T1]) :-
			 remove_first_occurance(T,VAL,X, T1).



