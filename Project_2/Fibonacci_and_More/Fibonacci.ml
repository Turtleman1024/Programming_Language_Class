(* 
	Language used : OCaml
	Version       : 4.02.3
	Author        : Kenneth M. Murry
	Course        : CptS 355
	Purpose       : This program will find the nth fibonacci number of a user inputed integer.
					This program uses both if else and pattern matching methods.

	Note: 
		To run this program:
		$ make fibonacci

*)

let n_if = ref 0;;				(* Declaring a variable to store user fibonacci number for if else function. *)
let user_input = ref 0;;		(* Declaring a variable to store user fibonacci number. *)
let n_match = ref 0;;			(* Declaring a variable to store user fibonacci number for n_match function. *)

(* 
	Creating a recursive function named "fibonacci" that will recursively find the fibonacci
	of a user inputed integer using if else.
*)
let rec fibonacci n =
	if n == 0 then
	(	
		0
	)
	else if n == 1 then
	(
		1
	)
	else fibonacci(n-1) + fibonacci(n-2)
;;

(* 
	Creating a recursive function named "fibonacci_match" that will recursively find the fibonacci
	of a user inputed integer using pattern matching.
*)
let rec fibonacci_match x =
	match x with
		  0 -> 0
		| 1 -> 1
		| x -> fibonacci_match(x-1) + fibonacci_match(x-2)
;;

print_newline ();
print_string "Finding the nth fibonacci number in ocaml\n";


(* Prompt user for n *)
print_string "Enter nth number to find : ";
user_input := read_int ();

(* Storing user value for if else function *)
n_if := !user_input;

(* Storing user value for pattern matching function *)
n_match := !user_input;

(* Calling function "fibonacci" and passing it the value stored in "n_if" and storing the return value to "n_if". *)
n_if := fibonacci !n_if;

(* Calling function "fibonacci_match" and passing it the value stored in "n_match" and storing the return value to "n_match". *)
n_match := fibonacci_match !n_match;

(* Print result of if else fibonacci function to the screen.*)
Printf.printf("\nUsing if else statement.\nThe fibonacci of %d is %d\n") !user_input !n_if;

(* Print result of pattern matching fibonacci_mathc function to the screen.*)
Printf.printf("\nUsing pattern matching statement.\nThe fibonacci of %d is %d\n\n") !user_input !n_match;

(* Printing exit message *)
print_string "\nIt is not what technolgy can do for you,";
print_string "\n    it is what can you do with technology.\n";