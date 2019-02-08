(* 
	Language used : OCaml
	Version       : 4.02.3
	Author        : Kenneth M. Murry
	Course        : CptS 355
	Purpose       : This program will use pattern matching to find the month of a year.

	Note: 
		Pattern matching is kind of like a switch in C.
		This program has no exception handling so will crash easily if user does not enter a integar.
		To run this program:
		$ make pattern

*)


 let index = ref  1;;	(* Declaring a condition variable for the while loop. *)
 let month = ref "";;	(* Declaring a variable to store the month .*)

(* Creating a pattern matching function named "int_to_month"
	The input of this function "i" is declared to be an int. 
	The return type is declared to be a string.
*)
let int_to_month (i : int) : string =
	match i with
	1 -> "January"		(* If i equals 1 then return the string "January". *)
	| 2 -> "February"	(* Or if i equals 2 then return the string "February". *)
	| 3 -> "March "
	| 4 -> "April"
	| 5 -> "May"
	| 6 -> "June"
	| 7 -> "July"
	| 8 -> "August"
	| 9 -> "September"
	| 10 -> "October"
	| 11 -> "November"
	| 12 -> "December"
	| _  -> "Not a Valid Month" (* If the value is not in the set return message. *)
	   ;;


print_newline ();
print_string "Finding the month of the year using pattern matching in ocaml\n";
print_string "Entering a number less than 1 or greater than 12 will exit the program.\n\n";


(* While in the set of index = { index >= 1, index < 13 } *)
while !index <= 13 
do
	(* Prompt user for a month *)
	print_string "Enter a month number: ";
	index := read_int ();

	if !index <= 0 || !index >= 13 then
	(
		(* Calling function "int_to_month" and passing it the value stored in "index" and storing the return value to "month". *)
		month := int_to_month !index;

		(* Print result to the screen.*)
		Printf.printf("%d: %s") !index !month;
		print_string "\n\n\"It is not what technolgy can do for you,";
		print_string "\n    it is what can you do with technology.\"";

		(* Change index to a value not in the set to exit the program. *)
		index := 15;
	)
	else
	(
		(* Calling function "int_to_month" and passing it the value stored in "index" and storing the return value to "month". *)
	  	month := int_to_month !index;

	  	(* Print result to the screen.*)
	  	Printf.printf("%d: %s") !index !month; 

		(*Increment index*)
		index := !index + 1;	
		
		print_newline ();
	)
done;;

print_newline ();; (* Move command line prompt to correct position. *)



