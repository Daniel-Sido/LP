domains
formula = formula(symbol, formula);  suboperation(formula,formula); letter(symbol); true(); false()
formulalist = formula*
alphabet = symbol*
predicates
nondeterm satisfiable(formula)
nondeterm invalid(formula)
determ isTautology(formula, alphabet)
unification(formula,symbol,formula,formula)
unificationFormula(formulalist,alphabet,formula,formula)
nondeterm value(formula)
length(alphabet,integer,integer)
nondeterm allVariationsOfValues(integer,formulalist)
clauses
value(true()).
value(false()).

satisfiable(formula("&", suboperation(X, Y))):- satisfiable(X), satisfiable(Y),!.
satisfiable(formula("v", suboperation(X, _Y))):- satisfiable(X),!.
satisfiable(formula("v", suboperation(_X, Y))):- satisfiable(Y),!.
satisfiable(formula("-", X)):- invalid(X),!.
satisfiable(true()).

invalid(formula("&", suboperation(X, _Y))):- invalid(X),!.
invalid(formula("&", suboperation(_X, Y))):- invalid(Y),!.
invalid(formula("v", suboperation(X, Y))):- invalid(X), invalid(Y),!.
invalid(formula("-", X)):- satisfiable(X),!.
invalid(false()).

unificationFormula([TrueOrFalse|TrueFalseListTail],[Letter|AlphabetTail],Formula,UnificationFormula):-
!,unification(TrueOrFalse,Letter,Formula,SelfResult), unificationFormula(TrueFalseListTail,AlphabetTail,SelfResult,UnificationFormula).
unificationFormula(_,_,Formula,Formula).   

unification(TrueOrFalse,Letter,letter(Letter),TrueOrFalse):- !.
unification(TrueOrFalse,Letter,suboperation(X,Y),suboperation(X1,Y1)):- !,unification(TrueOrFalse,Letter,X,X1),unification(TrueOrFalse,Letter,Y,Y1).
unification(TrueOrFalse,Letter,formula(Z,X),formula(Z,X1)):- !,unification(TrueOrFalse,Letter,X,X1).
unification(_,_,Formula,Formula).

length([_|AlphabetTail],N,Length):- N1=N+1,length(AlphabetTail,N1,Length).
length([],Length,Length).

allVariationsOfValues(0,[]):- !.
allVariationsOfValues(Length,[TrueOrFalse|TrueFalseListTail]):-value(TrueOrFalse),Length1=Length-1,allVariationsOfValues(Length1,TrueFalseListTail).

isTautology(Formula,Alphabet):-
length(Alphabet,0,Length),allVariationsOfValues(Length,TrueFalseList),unificationFormula(TrueFalseList,Alphabet,Formula,UnificationFormula),not(satisfiable(UnificationFormula)),!,fail;true.

goal
%isTautology(formula("&", suboperation(formula("v", suboperation(formula("-", letter("A")), letter("A"))), formula("v", suboperation(formula("-", letter("B")), letter("B"))))), ["A", "B"]).
/*isTautology(formula("v", suboperation(formula("v", suboperation(formula("&", suboperation(letter("X"), letter("Y"))),
formula("-", letter("X")))), formula("-", formula("&", suboperation(letter("Y"),letter("Z")))))), ["X", "Y", "Z"]).*/
%isTautology(formula("v", suboperation(letter("A"), letter("A"))), ["A"]). 
isTautology(formula("v", suboperation(formula("-", letter("A")), letter("A"))), ["A"]).