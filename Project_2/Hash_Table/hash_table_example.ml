(*
	Language used : OCaml
	Version       : 4.02.3
	Author        : Kenneth M. Murry
	Course        : CptS 355
	Purpose       : Learning Hash Tables in OCAML


*)

print_string "\nHash Tables in OCaml\n";;
print_string "Implemented by Kenneth Murry\n";;
print_string "For CptS 355";;
print_string "\n---------------------------------\n";;


(* Creating a hash table with the size of 100*)
let my_hash_tbl = Hashtbl.create 100;;

(* Adding two things to the hash table with the same key
   Collision example.
*)
Hashtbl.add my_hash_tbl "R" "Richland";;
Hashtbl.add my_hash_tbl "R" "Richmond";;

(* Adding two things to the hash table with the same key
   Collision example.
*)
Hashtbl.add my_hash_tbl "W" "West Richland";;
Hashtbl.add my_hash_tbl "W" "Westwood";;

(* Adding a single item to the hash table*)
Hashtbl.add my_hash_tbl "L" "London";;

(* Print the length of the hash table *)
Printf.printf ("Length of hash table: %d\n") (Hashtbl.length my_hash_tbl);;

(* Find a value in the hash table 
   This will only return the last value of the key.
   LIFO
*)
Printf.printf ("\nFirst value found key \"R\": %s\n") (Hashtbl.find my_hash_tbl "R");;


(* To find all value associated with the given key.
   This will return a list of all the values associated 
   with the given key. 
*)
let find_all = Hashtbl.find_all my_hash_tbl "R";;

(* Print the values stored in find_all function *)
Printf.printf ("\nValues found at key \"R\":");;

(*Recursively print the list returned from find_all *)
let rec print_hash find_all = 
	match find_all with
	| [] -> begin
				Printf.printf ("\nAll values found\n");
			end 
	| hd::tl -> begin
				Printf.printf (" %s") hd;
				print_hash tl;
				end 
;;

print_hash find_all;;



(* Remove element for the hash table
   This only removes the last value at the current 
   key location. LIFO
*)
Hashtbl.find my_hash_tbl "R";;



print_string "\n------------------------------------------\n";
print_string "It is not what technolgy can do for you,\n";
print_string "    it is what can you do with technology.\n\n";


