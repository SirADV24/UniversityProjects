
% 14

% a. Define a predicate to determine the longest sequences of consecutive
%    even numbers (if exist more maximal sequences one of them).
% b. For a heterogeneous list, formed from integer numbers and list of numbers, 
% 	define a predicate to replace every sublist with the longest sequences of even 
% 	numbers from that sublist.
% Eg.: [1, [2, 1, 4, 6, 7], 5, [1, 2, 3, 4], 2, [1, 4, 6, 8, 3], 2, [1, 5], 3] =>
%						 [1, [4, 6], 5, [2], 2, [4, 6, 8], 2, [], 3]

% Auxiliary functions

lenght([], 0).
lenght([_|T], ANS):- lenght(T, ANS2), ANS is ANS2 + 1.

append([], VAL, [VAL]).
append([H|T], VAL, [H|T1]) :- append(T, VAL, T1).

% A).


% Mathematical model

% longest_even_sequence(l1,l2..ln, c1,c2..ck, m1,m2...mp){
%		c1,c2..ck, if n = 0 and k > p,
%		m1,m2..mk, if n = 0 and p >= k,
%       longest_even_sequence(l2..ln, c1,c2..ck,l1, m1,m2...mp), l1 mod 2 == 0,
%       longest_even_sequence(l2..ln, [], c1,c2..ck), l1 mod 2 == 1 and k > p,
%		longest_even_sequence(l2..ln, [], m1,m2..mp), otherwise
% }

% longest_even_sequence(L1:list, C_MAX:list, MAX:list, ANS:list)
% flow (i, i, i, o)

% shortcut
longest_even_sequence(L, ANS):- longest_even_sequence(L, [], [], ANS).

longest_even_sequence([], C_MAX, MAX, MAX):-
	lenght(C_MAX, CL),
	lenght(MAX, CM),
	CM >= CL.

longest_even_sequence([], C_MAX, MAX, C_MAX):-
	lenght(C_MAX, CL),
	lenght(MAX, CM),
	CM < CL.

longest_even_sequence([H|T], C_MAX, MAX, ANS):-
	H mod 2 =:= 0,
	append(C_MAX, H, NEW_C_MAX),
	!,
	longest_even_sequence(T, NEW_C_MAX, MAX, ANS).

longest_even_sequence([_|T], C_MAX, MAX, ANS):-
	lenght(C_MAX, CL),
	lenght(MAX, CM),
	CM >= CL,
	!,
	longest_even_sequence(T, [], MAX, ANS).

longest_even_sequence([_|T], C_MAX, MAX, ANS):-
	lenght(C_MAX, CL),
	lenght(MAX, CM),
	CM < CL,
	!,
	longest_even_sequence(T, [], C_MAX, ANS).


% B)

% Mathematical model

% change_list(l1,l2..ln) = {
%				[] if n = 0,
%	longest_even_sequence(l1) ∩ change_list(l2..ln) if is_list(l1) = True,
%	l ∩ change_list(l2..ln) otherwise					
% }


% Auxiliary functions

is_list([], true).
is_list(X, false):- var(X).
is_list([_|T], ANS):- is_list(T, ANS).


change_list([], []).

change_list([H|T], [H1|L]):-
	is_list(H, RES),
	RES,
	!,
	longest_even_sequence(H, H1),
	change_list(T, L).

change_list([H|T], [H|L]):-
	change_list(T, L).



