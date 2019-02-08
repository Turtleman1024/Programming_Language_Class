(*****************************************************************************

        Author: Kenneth M. Murry
                CptS 355
                Project 1
		 Purpose:
		 		    The rdp.c (Recursive Decent Parser) validates input strings from the
		            language listed below.

 Language
      <expr> -> <term> + <expr>
      <expr> -> <term> - <expr>
      <expr> -> <term> * <expr>
      <expr> -> <term> / <expr>
      <expr> -> <term>

      <term> -> ( <expr> )
      <term> -> id

      <id>   -> [a..z, A..Z] [a..z, A..Z, 0..9]
      
*****************************************************************************)
(* Found this online not sure how to use yet but it looks promising *)
type expr =
    | Plus of expr * expr        (* means a + b *)
    | Minus of expr * expr       (* means a - b *)
    | Times of expr * expr       (* means a * b *)
    | Divide of expr * expr      (* means a / b *)
    | Value of string            (* "x", "y", "n", etc. *)
;;

(**************************************************************  
	Function Name: rdp

	Purpose: The rdp (Recursive Decent Parser) validates input 
			 strings from the language listed above.
***************************************************************)
let rdp lexan =	
	let error_tok = Get_token.get_expression !lexan in 
			
			if error_tok != 0 then
			 begin
					-1
		 	 end
			else
					error_tok;;


(* (*Attempting a recusive solution *)

let rec get_expression myList = 
	match myList with
	(*Needs to be exhuastive [] -> something not sure what*)
	| hd::tl -> begin
				    Get_token.get_token hd;
	                get_expression tl
				end
;;

let rdp lexan =	
	let error_tok = get_expression !lexan in 


*)

(* (*Original code*)
let rdp lexan =	
	let error_tok = ref 0 in 			
		(* 
			Iterating through the lexan list and getting each token
			and pass it to get_expression
		*)

		let get_expression (token : char) =					 
			Get_token.get_token token (*Calling calling function get_token*) in
			(*	Printf.printf "Looking at token %c now\n" elem in *)
			List.iter get_expression !lexan;
			
			if !error_tok != 0 then
			 begin
					-1
		 	 end
			else
					!error_tok;;

*)

(* (*Mod function that is no longer using(Who knows what I was thinking*)
let valid x =  
	match x with
		0 -> print_string "MOD CORRECT"
		| _ -> print_string "MODE Invalid";;

valid (4 mod 2);;
*)
