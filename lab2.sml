(*---Task1---------------------------------------------------------------------------*)
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

fun test1() =
    if is_older((2003, 1, 5),(2004, 1, 5)) = true andalso
    is_older((2003, 1, 4),(2003, 2, 5)) = true andalso
    is_older((2006, 1, 5),(2003, 1, 5)) = false
    then print("Test 1 passed!\n")
    else print("Test 1 failed!\n");
(*---Task2---------------------------------------------------------------------------*)		
fun number_in_month (dateList : (int * int * int) list, month:int) = 
	if null dateList
		then 0
	else if #2 (hd dateList) = month
			then 1 + number_in_month (tl dateList, month)
		 else number_in_month (tl dateList, month);

fun test2() =
    if number_in_month([(2003,10,10),(2012,10,11),(2015,11,10)], 10) = 2 andalso
       number_in_month([(2021,10,9),(2009,10,11)], 9) = 0  andalso
       number_in_month([], 5) = 0
    then print("Test 2 passed!\n")
    else print("Test 2 failed!\n");
		
(*---Task3---------------------------------------------------------------------------*)
fun number_in_months(dates : (int * int * int) list, months : int list) =
    if (null dates) orelse (null months) then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months);


fun test3() =
    if number_in_months([(2020,9,10),(2019,10,10),(2011,11,20),(2014,11,21)],[10,11]) = 3 andalso
       number_in_months([],[10,11]) = 0 andalso
       number_in_months([(2012,9,9),(2009,8,8)],[]) = 0 andalso
       number_in_months([],[]) = 0
    then print("Test 3 passed!\n")
    else print("Test 3 failed!\n");

(*---Task4---------------------------------------------------------------------------*)
fun dates_in_month(dates : (int * int * int) list, month : int) =
    if null dates then []
    else 
        if #2 (hd dates) = month then (hd dates)::dates_in_month(tl dates, month)
        else dates_in_month(tl dates, month);


fun test4() =
    if dates_in_month([(2000,10,9),(2020,2,20),(2022,1,22),(2031,10,23)], 10) = [(2000,10,9),(2031,10,23)] andalso
       dates_in_month([],1) = [] andalso
       dates_in_month([(2021,9,10),(2020,10,10)], 8) = [] then print("Test 4 passed!\n")
    else print("Test 4 failed!\n");

(*---Task5---------------------------------------------------------------------------*)
fun dates_in_months(dates : (int * int * int) list, months : int list) =
    if (null dates) orelse (null months)
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months);


fun test5() =
    if dates_in_months([(2002,2,8),(2000,3,12),(1920,1,7)], [1,2]) = [(1920,1,7), (2002,2,8)] andalso
        dates_in_months([(2020,10,10)], []) = [] andalso dates_in_months([], [10]) = [] then print("Test 5 passed!\n")
    else print("Test 5 failed!\n");
(*-----------------------------------------------------------------------------------*)

(*---Task6---------------------------------------------------------------------------*)
fun get_nth(text : string list, n : int) =
    if (null text) orelse (n <= 0) then ""
    else 
        if n = 1 then hd text
        else get_nth(tl text, n-1);


fun test6() =
    if get_nth(["str1", "str2", "str3", "str4"], 1) = "str1" andalso
       get_nth(["str1", "str2", "str3", "str4"], 4) = "str4" andalso
       get_nth([], 4) = "" andalso get_nth(["str1"], 0) = ""  then print("Test 6 passed!\n")
    else print("Test 6 failed!\n");
(*-----------------------------------------------------------------------------------*)

(*---Task7---------------------------------------------------------------------------*)
fun date_to_string(date : (int * int * int)) =
    let 
        val months : string list = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in
        get_nth(months, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
    end;


fun test7() =
    if date_to_string(2003,01,06) = "January 6, 2003" then print("Test 7 passed!\n")
    else print("Test 7 failed!\n"); 
(*-----------------------------------------------------------------------------------*)

(*---Task8---------------------------------------------------------------------------*)
fun number_before_reaching_sum(sum : int, pos_nums : int list) =
    if null pos_nums then 0
    else
        let
            fun check_sum(n : int, count : int, pos_nums : int list) =
                if (hd pos_nums + count) >= sum then n
                else check_sum(n + 1, count + hd pos_nums, tl pos_nums)
        in
            check_sum(0, 0, pos_nums)
        end;



fun test8() =
    if number_before_reaching_sum(105, [10, 20, 30, 40, 50]) = 4 andalso 
       number_before_reaching_sum(24, []) = 0 then print("Test 8 passed!\n")
    else print("Test 8 failed!\n"); 

test8();
(*-----------------------------------------------------------------------------------*)

(*---Task9---------------------------------------------------------------------------*)
fun what_month(day : int) =
    let 
        val days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
        number_before_reaching_sum(day, days) + 1
    end;


fun test9() =
    if what_month(130) = 5 andalso what_month(365) = 12 then print("Test 9 passed!\n")
    else print("Test 9 failed!\n");


test9();
(*-----------------------------------------------------------------------------------*)

(*---Task10---------------------------------------------------------------------------*)
fun month_range(day1 : int, day2 : int) =
    if day1 > day2 then []
    else what_month(day1)::month_range(day1 + 1, day2)


fun test10() =
    if month_range(1, 9) = [1, 1, 1, 1, 1, 1, 1, 1, 1] andalso month_range(100,100) <> [] then print("Test 10 passed!\n")
    else print("Test 10 failed!\n");


test10();
(*-----------------------------------------------------------------------------------*)

(*---Task11---------------------------------------------------------------------------*)
fun oldest_date(dates : (int * int * int) list) =
    if null dates then NONE
    else
        let
            fun check_oldest(oldest : (int * int * int), dates : (int * int * int) list) =
                if null dates then oldest
                else
                    if is_older(hd dates, oldest) then check_oldest(oldest, tl dates) 
                    else check_oldest(hd dates, tl dates)
        in
            SOME(check_oldest(hd dates, tl dates))
        end;


fun test11() =
    if oldest_date([(2021,8,8), (2030,1,1), (2021,12,12)]) = SOME (2030,1,1) andalso oldest_date([]) = NONE 
    then print("Test 11 passed!\n")
    else print("Test 11 failed!\n");


test11();


(*Tests*)
val general_test = fn x => (test1(), test2(), test3(), test4(), test5(), test6(), test7(), test8(), test9(), test10(), test11());
general_test();
(*-----------------------------------------------------------------------------------*)