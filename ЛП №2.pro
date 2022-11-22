domains
	size=symbol
	typeOfclothing=symbol
	price=unsigned
	clothing=clothes(typeOfclothing,price,size).
predicates
	nondeterm clothes(typeOfclothing,price,size)
	nondeterm moreExpensive(price)
	nondeterm mostExpensiveClothing(clothing)
	nondeterm nearMostExpensiveClothing(clothing,unsigned)

clauses

    	moreExpensive(Price):-clothes(_, Price2, _), Price2 > Price.	
	mostExpensiveClothing(clothes(TypeOfclothing, Price, Size)):- clothes(TypeOfclothing, Price, Size), not(moreExpensive(Price)).	
	nearMostExpensiveClothing(clothes(Clothing, Price, Size), MaxDifference):-clothes(Clothing, Price, Size), mostExpensiveClothing(clothes(_, Price1, _)), Price1-Price <= MaxDifference.
	
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
	/*clothes(TypeOfclothing,Price,s) and Price<=400.*/
	/*clothes(TypeOfclothing,_,s) and clothes(TypeOfclothing,_,m).*/
	/*clothes(cap,Price,_).*/
	clothes(cap,Price1,_) and clothes(TypeOfclothing,Price2,m) and Price1+Price2<=1000. 
	/*nearMostExpensiveClothing(Clothing,500).*/
	/*clothes(cap,_,Size).*/
	/*clothes(TypeOfclothing,Price,Size) and Price>=0 and Price<=500.*/
	/*clothes(TypeOfclothing,Price,l).*/
	