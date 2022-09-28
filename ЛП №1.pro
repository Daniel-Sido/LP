predicates
	nondeterm child(symbol,symbol).
	nondeterm father(symbol, symbol).
	nondeterm mother(symbol, symbol).
	nondeterm grandfather(symbol, symbol).
	nondeterm grandmother(symbol, symbol).
	nondeterm greatGrandMother(symbol, symbol).
	nondeterm greatGrandFather(symbol, symbol).
	nondeterm male(symbol).
	nondeterm female(symbol).
	nondeterm sister(symbol,symbol).
	nondeterm brother(symbol,symbol).
	nondeterm brotherOrSister(symbol).
	nondeterm uncle(symbol,symbol).
	nondeterm aunt(symbol,symbol).
	nondeterm son(symbol,symbol).
	nondeterm daughter(symbol,symbol).
	nondeterm doubleSister(symbol,symbol).
	nondeterm doubleBrother(symbol,symbol).
	nondeterm sisterAndBrother(symbol,symbol).
	nondeterm shurin(symbol,symbol).
	nondeterm dever(symbol,symbol).
	nondeterm zolovka(symbol,symbol).
	nondeterm testb(symbol,symbol).
	nondeterm tesha(symbol,symbol).
	nondeterm zyatb(symbol,symbol).
	nondeterm snoxa(symbol,symbol).
	nondeterm nevestka(symbol,symbol).
	nondeterm svoyachenitsa(symbol,symbol).
	nondeterm nephew(symbol,symbol).
	nondeterm married(symbol,symbol).
	nondeterm niece(symbol,symbol).
	nondeterm grandSon(symbol, symbol).
	nondeterm grandDaughter(symbol, symbol).
	nondeterm greatGrandSon(symbol, symbol).
	nondeterm greatGrandDaughter(symbol, symbol).
	nondeterm manyChilds(symbol).
	nondeterm predok(symbol,symbol).
clauses
	father(Child, Parent) :-child(Child, Parent),male(Parent).
	mother(Child, Parent) :-child(Child,Parent),female(Parent).
	grandFather(Person,TheGrandFather):-child(Person,ParentOfPerson),father(ParentOfPerson,TheGrandFather).
	grandMother(Person,TheGrandMother):-child(Person,ParentOfPerson),mother(ParentOfPerson,TheGrandMother).
	grandSon(Person,Grandson):-child(Grandson,Parent),child(Parent,Person) and male(Grandson).
	grandDaughter(Person,Granddaughter):-child(Granddaughter,Parent),child(Parent,Person) and female(Granddaughter).
	greatGrandFather(Person,TheGreatGrandFather):-child(Person,ParentOfPerson),grandFather(ParentOfPerson,TheGreatGrandFather).
	greatGrandMother(Person,TheGreatGrandMother):-child(Person,ParentOfPerson),grandMother(ParentOfPerson,TheGreatGrandMother).
	greatGrandSon(Person,TheGreatGrandSon):-child(TheGreatGrandSon,Parent) and child(Parent,GrandFather) and child(GrandFather,Person) and male(TheGreatGrandSon).
	greatGrandDaughter(Person,TheGreatGrandDaughter):-child(TheGreatGrandDaughter,Parent) and child(Parent,GrandFather) and child(GrandFather,Person) and female(TheGreatGrandDaughter).
	female(Person):- not(male(Person)).
	married(Husband,Spouse):-child(Child,Spouse) and child(Child,Husband) and Husband<>Spouse and !.
	sister(Person,Sister):-child(Person,Parent) and child(Sister,Parent) and female(Sister) and female(Parent) and Person<>Sister.
	brother(Person,Brother):-child(Person,Parent) and child(Brother,Parent) and male(Brother) and female(Parent) and Person<>Brother.
	brotherOrSister(Person):-child(Person, Parent) and child(Person2, Parent) and Person <> Person2.
	sisterAndBrother(Person,SisterOrBrother):-child(Person,Parent) and child(SisterOrBrother,Parent) and female(Parent) and Person<>SisterOrBrother.
	uncle(Uncle,Person):-child(Person,Parent) and brother(Parent,Uncle).
	aunt(Aunt,Person):-child(Person,Parent) and sister(Parent,Aunt).
	nephew(Person,Nephew):-child(Nephew,Parent) and sisterAndBrother(Parent,Person) and male(Nephew).
	niece(Person,Niece):-child(Niece,Parent) and sisterAndBrother(Parent,Person) and female(Niece).
	son(Person,Parent):-child(Person,Parent) and male(Person).
	daughter(Person,Parent):-child(Person,Parent) and female(Person).
	doubleSister(Person,DSister):- child(Person,Parent) and sisterAndBrother(Parent,SisterOrBrother) and daughter(DSister,SisterOrBrother).
	doubleBrother(Person,DBrother):- child(Person,Parent) and sisterAndBrother(Parent,SisterOrBrother) and son(DBrother,SisterOrBrother).
	shurin(Person,Shurin):- married(Person,Spouse) and brother(Spouse,Shurin).
	dever(Person,Dever):- married(Husband,Person) and brother(Husband,Dever).
	zolovka(Person,Zolovka):-married(Husband,Person) and sister(Husband,Zolovka).
	svoyachenitsa(Person,Svoyachenitsa):-married(Person,Spouse) and sister(Spouse,Svoyachenitsa).
	testb(Person,Testb):-married(Person,Spouse) and father(Spouse,Testb).
	tesha(Person,Tesha):-married(Person,Spouse) and mother(Spouse,Tesha).
	zyatb(Person,Zyatb):- daughter(Daughter,Person) and married(Zyatb,Daughter).
	snoxa(Person,Snoxa):- son(Son,Person) and married(Son,Snoxa).
	nevestka(Person,Nevestka):- brother(Person,Brother) and married(Brother,Nevestka).
	manyChilds(Person):-child(Child,Person) and brotherOrSister(Child).
	predok(Person, Predok):- child(Person, Predok).
    	predok(Person, Predok):-child(Person, Parent), predok(Parent, Predok) and Predok<>Person.
    	predok(Predok, Person):- child(Person, Predok).
    	predok(Predok, Person):-child(Person, Parent), predok(Parent, Predok) and Predok<>Person.
    	
	
	male(the_force).
	male(anakin).
	male(luke).
	male(ben).
	male(han).
	male(jasen).
	male(jagged).
	male(fel).
	male(anakin_solo).

	child(anakin,the_force).
	child(anakin,shmi).
	child(luke,anakin).
	child(luke,padme).
	child(leia,anakin).
	child(leia,padme).
	child(ben,luke).
	child(ben,mara).
	child(jasen,leia).
	child(jasen,han).
	child(jaina,leia).
	child(jaina,han).
	child(anakin_solo,leia).
	child(anakin_solo,han).
	child(allana,jasen).
	child(allana,tenel_ka).
	child(fel,jaina).
	child(fel,jagged).
	
goal
	/*zolovka(mara,X).*/
	greatGrandMother(allana,X).
	/*predok(the_force,X).*/
	

	

