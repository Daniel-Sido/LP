domains
	file = input ; output ; changeInput
	str = string
	list = str*
predicates
	nondeterm substitution(string,string,string)
	nondeterm modifiedStr(list, list)
	nondeterm readChangeWords(file,list)
	nondeterm makeChangeList(list,string)
	nondeterm strToList(str,list)
	nondeterm repeat
	nondeterm substitutionStr(list,list,list)
	pairSearch(list,str, str)
	nondeterm writeStr(list, file)
	nondeterm search(str, list)
	nondeterm reverse(list,list)
	nondeterm append(list,list,list)
	nondeterm add(str,list,list)
clauses

	repeat.
	repeat:-repeat.
	
	substitution(Input,Output,Change) :- makeChangeList(ListChange,Change),openread(input, Input),openwrite(output,Output), writedevice(output),readdevice(input),
	repeat,readln(Str),strToList(Str, List), modifiedStr(List, ListChange),eof(input),closefile(input), closefile(output).
	
	modifiedStr(List,ListChange):-substitutionStr(List, ListChange, []).
	
	substitutionStr([],_,Result):-writeStr(Result,output).
	substitutionStr([Head|Tail],L2,Result):-search(Head,L2),!,pairSearch(L2,Head,Replace),add(Replace,Result,D),substitutionStr(Tail,L2,D);add(Head,Result,K),substitutionStr(Tail,L2,K).

	makeChangeList(List,Change):-openread(changeInput, Change),readdevice(changeInput),readChangeWords(changeInput,List),closefile(changeInput).		
	
	readChangeWords(File,Result) :-not(eof(File)),!,readln(Str),strToList(Str,Result).
	
	strToList("",[]):-!.
	strToList(Str,[Head|Tail]) :- fronttoken(Str,Head,Str1),!, strToList(Str1,Tail).
	
	writeStr([Head|Tail],Output):-write(Head),write(" "),writeStr(Tail,Output).
	writeStr([],_):-nl.
	
	pairSearch([H,H1,_|Tail],X,Y):-H<>X,!,pairSearch(Tail,X,Y);Y=H1.

	search(X,[X,_,_|_]).
	search(X,[_,_,_|Tail]):-search(X,Tail).

	reverse([],[]).
	reverse([Head|Tail],Result):-reverse(Tail,Reverse),append(Reverse,[Head],Result).

	append([],L,L).
	append([Head|L1],L2,[Head|L3]):-append(L1,L2,L3).
	
	add(Str,L1,Result):-reverse(L1,Reverse),reverse([Str|Reverse],Result).
	
	goal
	substitution("C:\\Users\\danys\\Desktop\\6lab\\input.txt","C:\\Users\\danys\\Desktop\\6lab\\output.txt","C:\\Users\\danys\\Desktop\\6lab\\change.txt").