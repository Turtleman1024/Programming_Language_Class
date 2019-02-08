(*****************************************************************************

        Author: Kenneth M. Murry
                CptS 355
                Project 2
		 Purpose:
		 		    The rdp.c (Recursive Decent Parser) validates input strings from the
		            language listed below.

 Language
 	  <pgm>  -> <id> '{' <decl> ';' <assign> '; '}'

 	  <decl>   -> <type> <assign>
 	  <assign> -> <id> = <value>

      <expr> -> <term> + <expr>
      <expr> -> <term> - <expr>
      <expr> -> <term> * <expr>
      <expr> -> <term> / <expr>
      <expr> -> <term>

      <term> -> ( <expr> )
      <term> -> id

	  <type> -> int | float
      <id>   -> [a..z, A..Z] [a..z, A..Z, 0..9]
      
*****************************************************************************)


(**************************************************************  
	Function Name: rdp

	Purpose: The rdp (Recursive Decent Parser) validates input 
			 strings from the language listed above.
***************************************************************)
let rdp lexan =	
	let error_tok = Lexan.LexicalAnalyzer.get_expression !lexan in 
			
			match error_tok with
			  0 -> 0 
			| _ -> -1
			
;;
				
(* Found this online not sure how to use yet but it looks promising *)
type expr =
    | Plus of expr * expr        (* means a + b *)
    | Minus of expr * expr       (* means a - b *)
    | Times of expr * expr       (* means a * b *)
    | Divide of expr * expr      (* means a / b *)
    | Value of string            (* "x", "y", "n", etc. *)
;;

(* (*Mod function that is no longer using(Who knows what I was thinking*)
let valid x =  
	match x with
		0 -> print_string "MOD CORRECT"
		| _ -> print_string "MODE Invalid";;

valid (4 mod 2);;
*)
