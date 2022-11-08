domains
	type = integer
	list = type*
	listlist = list*
predicates
	nondeterm member(type,list)
	nondeterm dublicates(list)
	nondeterm listWithNumbersOfEachSymbols(list,listlist)
	nondeterm numberOfSymbol(integer,integer,list,list,list)
	nondeterm deleteRepeat(list,list)
	nondeterm insertListAfterX(list,type,list,list)
	nondeterm append(list,list,list)
	nondeterm lastInHead(list,list)
	nondeterm last(list,type)
	nondeterm deleteLast(list, list)
	nondeterm deleteFirst(type,list, list)
	nondeterm firstInTail(list,list)
clauses
	member(Elem, [Elem|_Tail]).%member Of List%
	member(Elem, [_Head|Tail]):-member(Elem, Tail).
	
	listWithNumbersOfEachSymbols([Elem|L],[Result|M]):-numberOfSymbol(1,Elem,L,L1,Result),!,listWithNumbersOfEachSymbols(L1,M).%List With Numbers Of Each Symbols%
	listWithNumbersOfEachSymbols([],[]).

	numberOfSymbol(N,Elem,[Elem|L],L1,Result):-N1=N+1,!,numberOfSymbol(N1,Elem,L,L1,Result).%Number Of Symbols%
	numberOfSymbol(N,Elem,[U|L],[U|L1],Result):-numberOfSymbol(N,Elem,L,L1,Result).
	numberOfSymbol(N,Elem,[],[],[Elem,N]).
	
	deleteRepeat([Head, Head | Tail], Result) :-!,deleteRepeat([Head | Tail], Result).%delete repeat symbols%
	deleteRepeat([Head | Tail], [Head | Result]) :-!,deleteRepeat(Tail, Result).
	deleteRepeat(Result, Result). 
	
	dublicates([]):-!,fail.	%two or more same symbols%
	dublicates([Head|Tail]):-member(Head, Tail); dublicates(Tail).
	
	insertListAfterX(_,_,[],[]):-!.%Insert list after given number%
	insertListAfterX(L,Head,[Head|Z],Result):- !, insertListAfterX(L,Head,Z,Tail), append([Head|L],Tail,Result).
	insertListAfterX(L,Y,[Head|Z],[Head|Result]):- insertListAfterX(L,Y,Z,Result).
	
	append([],L,L).%Insert elements in list%
	append([Head|Tail],L,[Head|Result]):-append(Tail,L,Result).
    	
	deleteLast([X,_],[X]).%Delete last element%
	deleteLast([Head|Tail],[Head|Z]) :- deleteLast(Tail,Z).
	
	deleteFirst(_, [], []).%Delete first occurrence of element%
	deleteFirst(Elem, [Elem | L], L) :- !.
	deleteFirst(Elem, [Y | L], [Y | L1]) :-deleteFirst(Elem, L, L1).
    	
    	iter(Elem):-
		
	
    	last([X], X):-!.%Get last element%
  	last([_Head|Tail], Element):-last(Tail, Element).
  	
	firstInTail(X,Result):-member(Elem, X),!,append(X,[Elem],HalfResult),deleteFirst(Elem,HalfResult,Result).%Move first element to end of list%
  	lastInHead(X,Result):-last(X, Elem),append([Elem],X,HalfResult),deleteLast(HalfResult,Result).%Move the last element of the list to the beginning of the list%
  	
GOAL

	%firstInTail([1,3,5,7,9,11],L).
	%lastInHead([1,3,5,7,9,11],L).
	%insertListAfterX([0,0,0],1,[1,2,1,3,4],L).
	%dublicates([1,2,3,4,5,6]).
	%deleteRepeat([0,1,1,2,2,3,3,3,4,4,4,4,5],L).
	%listWithNumbersOfEachSymbols([1,1,1,4,5,2,1,0,3,3],L).
	
	
