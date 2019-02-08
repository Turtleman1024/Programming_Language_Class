(*****************************************************************************

        Author: Kenneth M. Murry
                CptS 355
                Project 2
		Purpose:
		 		    The rdp.c (Recursive Decent Parser) validates input strings from the
		            language listed below.

		Language:
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
module RDParser =
struct

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


(***************************************************************  
	Function Name: run_program

	Purpose: The run_program function will create a symbol table
			 from the validated language listed above.

	Note:    Ran into a problem of passing in the char list.
			 Think to fix the problem change char list to string 
			 list for easer creation of the symbol table.
****************************************************************)
let rec run_program lexan my_symbol_tbl =
	(*Convert the lexan list of chars to a string*)
	let lexan_string = (string_of_chars !lexan) in 
		print_string lexan_string;
		(*Convert the lexan string to a lexan list of strings*)
		let lexan_string_list = split_on_char ' ' lexan_string in 
	let error_tok2 = Create_symbol_tbl.CompiliedLanguage.get_program lexan_string_list my_symbol_tbl in
			match error_tok2 with
			  0 -> 0 
			| _ -> -1


and
(***************************************************************  
	Function Name: string_of_chars

	Purpose: The string_of_chars function take in a parameter 
			 of a list of chars and converts it to a string.
****************************************************************)
string_of_chars chars_list =
    let buf = Buffer.create 16 in
    List.iter (Buffer.add_char buf) chars_list;
    Buffer.contents buf


and
(***************************************************************  
	Function Name: split_on_char

	Purpose: The split_on_char function takes in a parameter 
			 of a specified split char and a string. It returns
			 a list of strings split.

	Note:    I got this function off the internet as of OCaml
			 version 4.04.0 this function is included in the 
			 String module.
****************************************************************)
split_on_char sep s =
  let r = ref [] in
  let j = ref (String.length s) in
  for i = String.length s - 1 downto 0 do
    if s.[i] = sep then begin
      r := String.sub s (i + 1) (!j - i - 1) :: !r;
      j := i
    end
  done;
  String.sub s 0 !j :: !r


(* Found this online not sure how to use yet but it looks promising *)
type expr =
    | Plus of expr * expr        (* means a + b *)
    | Minus of expr * expr       (* means a - b *)
    | Times of expr * expr       (* means a * b *)
    | Divide of expr * expr      (* means a / b *)
    | Value of string            (* "x", "y", "n", etc. *)


end;;