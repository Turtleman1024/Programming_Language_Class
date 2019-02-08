(*****************************************************************************
    Author: Kenneth M. Murry
            CptS 355
            Project 1
	 Purpose:
	      Get_token is responsible for extracting one lexeme from the file on each
	      request. The lexeme is converted to a token and returned.

*****************************************************************************)

let get_token token =

			 if token = 40 || token = 41 
			    then    (* Checking if a OPEN_PAREN or CLOSING_PAREN*)
			       begin
			    	    Printf.printf ("Token found: %c\n") (char_of_int token)
			       end
			 else if token > 64 && token < 91 || token > 96 && token < 123 
			 	     then    (* Checking if a APLHA was found *)
			 	        begin
			 	        	Printf.printf("Token alpha found: %c\n") (char_of_int token);
			 	        end
			else if token = 32
			        then    (* Checking for WHITE_SPACE*)
			           begin
			           	   Printf.printf("White space found\n");
			           end
			else if token > 41 && token < 44 || token = 45 || token = 47
					then    (* Checking if a BINOP was found*)
					   begin
					   	   Printf.printf("Token BinOp found: %c\n") (char_of_int token);
					   end
			else if token > 47 && token < 58 
					then    (* Checking if a Digit was found*)
					   begin
					   	   Printf.printf("Token Digit found: %c\n") (char_of_int token);
					   end		   
			else	(* If NO_TOK found *)
				Printf.printf("Non-Valid Token found: %c\n") (char_of_int token);



(* type pair_of_ints = { a : int; b : int };;*)(* This is an example of typedef in OCaml not related but good to know*)