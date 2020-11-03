

list_max([P|T], O) :- list_max(T, P, O).

list_max([], P, P).
list_max([H|T], P, O) :-
    (    H > P
    ->   list_max(T, H, O)
    ;    list_max(T, P, O)).

clone([], []).
clone([H|T], [H|Z]) :- clone(T,Z).

remove_max(L, ANS) :-
    clone(L, CLONE),
	list_max(CLONE, MAX),
	remove_occurance(L, MAX, ANS).

remove_occurance([], _, []).
remove_occurance([VAL|T], VAL, RES) :- remove_occurance(T, VAL, RES).
remove_occurance([H|T], VAL, [H|T1]) :- remove_occurance(T,VAL, T1).



