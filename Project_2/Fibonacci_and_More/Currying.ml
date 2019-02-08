(* 
	Language used : OCaml
	Version       : 4.02.3
	Author        : Kenneth M. Murry
	Course        : CptS 355
	Purpose       : Learning functions in OCAML


To compile and run this code

ocamlopt -o start Currying.ml
./start

*)

(* Declaring a function named multiple that takes two parameters x & y and then
   multiples x & y. This is integar arithmetic and will not take floats as passed in values.
*)
let multiple x y = x * y;;

(* Declaring a variable results the will store the result of multiplie 5 & 6*)

let result = multiple 5 6;;

(* Printing the integar result to the screen*)
print_int result;;

(* Print a newline to move command prompt to correct position*)
print_newline ();;

(* Proof of currying*)
let multiple_five = multiple 5;;

let result_two = multiple_five 6;;

print_int result_two;;

print_string "\n\nForget Lab safety, I want superpowers\n";;
