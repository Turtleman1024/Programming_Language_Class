(* 
	Language used : OCaml
	Version       : 4.02.3
	Author        : Kenneth M. Murry
	Course        : CptS 355
	Purpose       : This program will find the factorial of a user inputed integer.

	Note: 
		To run this program:
		$ make factorial

*)

let n = ref 0;;				(* Declaring a variable to store user factorial number to find.*)
let user_input = ref 0;;	(* Declaring a variable to store user factorial number.*)

(* 
	Creating a function named "factorial" that will recursively find the factorial
	of a user inputed integer.
*)
let rec factorial n =
	if n == 1 then
	(	
		1
	)
	else n * factorial(n-1)
;;

print_newline ();
print_string "Finding the factorial of a number in ocaml\n";


(* Prompt user for n *)
print_string "Enter a integer value: ";
n := read_int ();

(*Storing user value of 'n' for printf *)
user_input := !n;

(* Calling function "factorial" and passing it the value stored in 'n' and storing the return value to "n". *)
n := factorial !n;

(* Print result to the screen.*)
Printf.printf("The factorial of %d is %d\n") !user_input !n;

(* Printing exit message *)
print_string "\nIt is not what technolgy can do for you,";
print_string "\n    it is what can you do with technology.\n";