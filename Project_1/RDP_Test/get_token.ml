(*****************************************************************************
    Author: Kenneth M. Murry
            CptS 355
            Project 1
	 Purpose:
	      Get_token is responsible for extracting one lexeme from the file on each
	      request. The lexeme is converted to a token and returned.

*****************************************************************************)

(* A function that will validate if the input is a ALPHA *)
let is_alpha alpha = 
		match alpha with 
		  'a' .. 'z' -> true
		| 'A' .. 'Z' -> true 
		| _ -> false;;

(* A function that will validate if the input is a DIGIT *)
let is_digit digit =
		match digit with
		 '0' .. '9' -> true
		| _ -> false;; 

(************************************************** 
	Function Name: get_id

	Purpose: get_id will convert a token to an id
			 and return the id
***************************************************)
let get_id token = (*Not returning a token/id yet just checking to make sure it works*)
	match token with
	 'a' .. 'z' -> begin
						Printf.printf ("Valid ALPHA found: %c\n") token;
						0
	                end 
	| 'A' .. 'Z' -> begin
					    Printf.printf ("Valid ALPHA found: %c\n") token;
					    0
	  				end 
	| '0' .. '9' -> begin
						Printf.printf ("Valid DIGIT found: %c\n") token;
						0
					end	
	|  '(' -> begin
	  			 Printf.printf ("Valid OPEN_PAREN found: %c\n") token;
	  			 0
	         end 
	| ')' -> begin
			     Printf.printf ("Valid CLOSING_PAREN found: %c\n") token;
			     0
	         end  
	| ' '  -> begin
				  Printf.printf ("WHITE_SPACE found\n");
				  0	
			  end 
	| '+'  -> begin
				  Printf.printf ("Valid BINOP found: %c\n") token;
				  0
	          end 
	| '-'  -> begin
				  Printf.printf ("Valid BINOP found: %c\n") token;
				  0
			  end 
	| '*'  -> begin
			      Printf.printf ("Valid BINOP found: %c\n") token;
			      0
			  end 
	| '/'  -> begin
				  Printf.printf ("Valid BINOP found: %c\n") token;
				  0
	  		  end 
	| '\n' -> begin
				  Printf.printf("End of lexan found\n");
				  0
			  end 
	| _ -> begin
			   Printf.printf ("Invalid Token found\n");
			   -1
		   end  
	 ;;

(****************************************************** 
	Function Name: get_token 

	Purpose: get_token will convert a token into a id
			 and return 0 for valid and -1 of invalid.
*******************************************************)
let rec get_token token = 
	match token with
	  [] -> 0 (*Needs to be exhuastive [] -> 0*)
	| hd::tl -> begin
					match (get_id hd) with
					  0 -> 0
					| _ -> -1                
				end
;;


(*************************************
	Function Name: get_term 

	Purpose: 
			get_term will get a term 
**************************************)
let rec get_term myList = 
	match myList with
	  [] -> 0 (*Needs to be exhuastive [] -> 0*)
	| hd::tl -> begin
					match (get_token myList) with
					  0 -> 0
					| _ -> -1
				end

;;

(*******************************************************  
	Function Name: get_erpression 

	Purpose: This function input argument is a ref list.
			 It recursively traverses the list
********************************************************)
let rec get_expression lexan = 
	match lexan with
	[] -> 0 (*Needs to be exhuastive [] -> 0*)
	| hd::tl -> begin
					match (get_term lexan) with
					  0 -> get_expression tl
					| _ -> -1
			end
;;


(* (* This is more a C/C++ style solution for get_id that I origanlly created *)

let return_error = ref 0;; (* Declaring a variable to return a value of the error *)

let get_id token =

			 if token = 40 || token = 41 
			    then    (* Checking if a OPEN_PAREN or CLOSING_PAREN*)
			       begin
			    	    Printf.printf ("Valid Token found: %c\n") (char_of_int token);
			    	    return_error := 0;
			       end
			 (* else if token > 64 && token < 91 || token > 96 && token < 123 *)      
			 else if (is_alpha (char_of_int token)) = true 
			 	     then    (* Checking if a APLHA was found *)
			 	        begin
			 	        	Printf.printf("Valid Token alpha found: %c\n") (char_of_int token);
			 	        	return_error := 0;
			 	        end
			 else if token = 32
			        then    (* Checking for WHITE_SPACE*)
			           begin
			           	   Printf.printf("White space found\n");
			 	           return_error := 0;
			           end
			 else if token > 41 && token < 44 || token = 45 || token = 47
					then    (* Checking if a BINOP was found*)
					   begin
					   	   Printf.printf("Valid Token BinOp found: %c\n") (char_of_int token);
			 	           return_error := 0;
					   end
			 else if (is_digit (char_of_int token)) = true 
					then    (* Checking if a Digit was found*)
					   begin
					   	   Printf.printf("Valid Token Digit found: %c\n") (char_of_int token);
			 	           return_error := 0;
					   end		   
			 else if token = 10
			 		 then
			 		 	begin
			 		 		Printf.printf("End of lexan found\n");
			 		 		return_error := 0;
			 		 	end
			 else	(* If NO_TOK found \0 ASCII value is 10 *)
			 	begin
			 		Printf.printf("Invalid Token found: %d -> %c\n") token (char_of_int token);
			 	    return_error := -1;	
			 	end	

				(* Working on figuring out how to return a value from this function*)
;; *)

(* type pair_of_ints = { a : int; b : int };;*)(* This is an example of typedef in OCaml not related but good to know*)