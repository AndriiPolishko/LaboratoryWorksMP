---Task1---------------------------------------------------------------------------
fun is_older (data1 : int * int * int, data2 : int * int * int) =
	if (#1 data1) > (#1 data2)
		then true
	else if (#1 data1) < (#1 data2)
				then false
			else if (#2 data1) > (#2 data2)
					then true
				 else if (#2 data1) < (#2 data2)
					  then false
					  else if (#3 data1) > (#3 data2)
						   then true
						   else false;
			
---Task2---------------------------------------------------------------------------			
fun number_in_month (dateList : (int * int * int) list, month:int) = 
	if null dateList
		then 0
	else if #2 (hd dateList) = month
			then 1 + number_in_month (tl dateList, month)
		 else number_in_month (tl dateList, month);
		
---Task3---------------------------------------------------------------------------
fun size(checkedList: int list) =
	if null checkedList then 0 else
		1 + size(tl checkedList);

fun number_in_months (listOfDates : (int * int * int) list, listOfMonthes: int list) = 
	if null listOfDates then []
	else if size(listOfMonthes) = 1 then [number_in_month(listOfDates, hd listOfMonthes)]
		else number_in_months(listOfDates, tl listOfMonthes);
		
		
