domains
	size=symbol
	typeOfclothing=symbol
	price=unsigned
	clothing=clothes(typeOfclothing,price,size).
database
	clothes(typeOfclothing,price,size)
predicates
	nondeterm availableSizes(typeOfclothing,size)
	nondeterm availableSizesW(typeOfclothing,size)
	nondeterm allTypeOfSize(typeOfclothing,size)
	nondeterm clothingPrices(typeOfclothing,price)
	nondeterm sortByPriceAndSize(unsigned,size,typeOfclothing)
	nondeterm bothSize(size,size,typeOfclothing)
	nondeterm buyingTwoClothes(typeOfclothing,unsigned,size)
	nondeterm moreExpensive(price)
	nondeterm mostExpensiveClothing(clothing)
	nondeterm mostExpensiveClothingW(clothing)
	nondeterm nearMostExpensiveClothing(clothing,unsigned)
	nondeterm acceptablePriceRange(unsigned,unsigned,clothing)
	nondeterm moreCheap(price)
	nondeterm cheapestClothes(clothing)
	nondeterm choice(integer)
	menu
	nondeterm repeat
clauses
	availableSizesW(TypeOfclothing,Size):- clothes(TypeOfclothing,_,Size) and write(Size),nl.
	availableSizes(TypeOfclothing,Size):- clothes(TypeOfclothing,_,Size).
	allTypeOfSize(TypeOfclothing,Size):- clothes(TypeOfclothing,_,Size) and write(TypeOfclothing),nl.
	
    	clothingPrices(TypeOfclothing,Price):- clothes(TypeOfclothing,Price,_) and write(Price),nl.
    	
    	sortByPriceAndSize(Budget,Size,TypeOfclothing):-clothes(TypeOfclothing,Price,Size) and Budget>=Price and write(TypeOfclothing," ",Price),nl.
    	
    	bothSize(Size1,Size2,TypeOfclothing):- availableSizes(TypeOfclothing,Size1) and availableSizes(TypeOfclothing,Size2) and write(TypeOfclothing),nl.
    	
    	buyingTwoClothes(TypeOfclothing,Budget,Size):- clothes(TypeOfclothing,Price1,Size) and clothes(TypeOfclothingOther,Price2,Size) and Price1 + Price2<=Budget and TypeOfclothing<>TypeOfclothingOther and write(TypeOfclothing," ",Price1," ",TypeOfclothingOther," ",Price2),nl.
    	
    	acceptablePriceRange(Min,Max,clothes(TypeOfclothing, Price, Size)):- clothes(TypeOfclothing,Price,Size) and Price>=Min and Price<=Max and write(TypeOfclothing," ",Size),nl.
    	
    	moreExpensive(Price):-clothes(_, Price2, _), Price2 > Price.	
    	mostExpensiveClothingW(clothes(TypeOfclothing, Price, Size)):- clothes(TypeOfclothing, Price, Size), not(moreExpensive(Price)) and write(TypeOfclothing," ",Size," ",Price),nl.	
	mostExpensiveClothing(clothes(TypeOfclothing, Price, Size)):- clothes(TypeOfclothing, Price, Size), not(moreExpensive(Price)).	
	nearMostExpensiveClothing(clothes(Clothing, Price, Size), MaxDifference):-clothes(Clothing, Price, Size), mostExpensiveClothing(clothes(_, Price1, _)), Price1-Price <= MaxDifference and write(Clothing," ", Price," ", Size),nl.
	
	moreCheap(Price):- clothes(_, Price2, _) and Price2 < Price.
	cheapestClothes(clothes(TypeOfclothing, Price, Size)):- clothes(TypeOfclothing, Price, Size) and not(moreCheap(Price)) and write(TypeOfclothing," ",Size," ",Price),nl.

	
	choice('1'):-
		write("Enter budget: "),
		readint(Budget),
		write("Enter size: "),
		readln(Size),
		sortByPriceAndSize(Budget,Size,_).

	choice('2'):-
		write("Enter first size: "),
		readln(Size1),
		write("Enter second size: "),
		readln(Size2),
		bothSize(Size1,Size2,_).

	choice('3'):-
		write("Enter Type of clothes: "),
		readln(TypeOfclothing),
		clothingPrices(TypeOfclothing,_).

	choice('4'):-
		write("Enter budget: "),
		readint(Budget),
		write("Enter Size: "),
		readln(Size),
		buyingTwoClothes(cap,Budget,Size).
	
	choice('5'):-
		write("Enter max difference: "),
		readint(MaxDifference),
		nearMostExpensiveClothing(_, MaxDifference).
	choice('6'):-
		write("Enter Type of clothing: "),
		readln(TypeOfclothing),
		availableSizesW(TypeOfclothing,_).
	choice('7'):-
		write("Enter Min Price: "),
		readint(Min),
		write("Enter Max Price: "),
		readint(Max),
		acceptablePriceRange(Min,Max,_).
	choice('8'):-
		write("Enter Size: "),
		readln(Size),
		allTypeOfSize(_,Size).
	choice('9'):-
		mostExpensiveClothingW(_).
	choice('0'):-
		cheapestClothes(_).	
	choice('a'):-
		write("Name of adding cloth: "),
		readln(TypeOfclothing),
		write("Price: "),
		readint(Price),
		write("Size: "),
		readln(Size),
		assert(clothes(TypeOfclothing,Price,Size)),
		fail.
	choice('i'):-
		write("The presence of toys in the database:\n"),
		clothes(TypeOfclothing,Price,Size),
		write("Name : ",TypeOfclothing, ";   Price : ",Price,";   Size : ", Size),nl.

	choice('s'):-		
		save("C:\Users\danys\Desktop\database2"),
		write("Information saved successfully\n").

	choice('l'):-
		existfile("C:\Users\danys\Desktop\database2"),!,
		consult("C:\Users\danys\Desktop\database2").

	choice('e'):- !.

	menu:-		
		repeat,		
		write("------------------------------------\n"),
		write("Make your choice:\n"),
		write("1 - task 1\n"),
		write("2 - task 2\n"),
		write("3 - task 3\n"),
		write("4 - task 4\n"),
		write("5 - task 5\n"),
		write("6 - task 6\n"),
		write("7 - task 7\n"),
		write("8 - task 8\n"),
		write("9 - task 9\n"),
		write("0 - task 10\n"),
		write("a - add information about cloth\n"),
		write("i - show all clothes\n"),
		write("s - save database in file\n"),
		write("l - load database from file\n"),
		write("e - exit\n"),
		readchar(Choice),
		choice(Choice),
		Choice='e',
		!.
	repeat.
	repeat :- repeat.	

	clothes(cap,600,s).
	clothes(cap,500,xs).
	clothes(cap,650,m).
	
	clothes(hat,640,l).
	clothes(hat,700,xl).
	clothes(hat,900,m).
	
	clothes(dress,3000,s).
	clothes(dress,5000,m).
	clothes(dress,2500,l).
	clothes(dress,3000,xs).
	
	clothes(skirt,3100,s).
	clothes(skirt,4500,xl).
	clothes(skirt,6000,l).
	clothes(skirt,2700,xs).
	
	clothes(pants,1000,s).
	clothes(pants,1500,m).
	clothes(pants,1600,l).
	clothes(pants,1300,xxl).
	clothes(pants,900,xl).
	
	clothes(t_shirt,2900,m).
	clothes(t_shirt,1400,l).
	clothes(t_shirt,5000,xs).
	clothes(t_shirt,700,s).
	
	clothes(sweater,3000,m).
	clothes(sweater,2200,l).
	clothes(sweater,2500,xl).
	clothes(sweater,4000,xxl).
	
	clothes(shorts,2300,m).
	clothes(shorts,1800,l).
	
	clothes(socks,200,xs).
	clothes(socks,300,m).
	clothes(socks,250,s).
	
	clothes(belt,1000,xs).
	clothes(belt,1500,m).
	clothes(belt,1100,xl).
	
	clothes(jacket,5000,s).
	clothes(jacket,5500,m).
	clothes(jacket,5000,l).
	
	clothes(breeches,1200,xs).
	
goal
	
	menu.
