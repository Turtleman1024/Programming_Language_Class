(*****************************************************************************
    Author: Kenneth M. Murry
            CptS 355
            Project 2
	 Purpose:
	      lexan is responsible for extracting one lexeme from the list on each
	      request. The lexeme is converted to a token and returned.

*****************************************************************************)
module LexicalAnalyzer =
struct

(* A function that will validate if the input is a ALPHA *)
let is_alpha alpha = 
	match alpha with 
	 'a' .. 'z' -> true
	|'A' .. 'Z' -> true 
	| _ -> false

(* A function that will validate if the input is a DIGIT *)
let is_digit digit =
	match digit with
	 '0' .. '9' -> true
	| _ -> false 

(* A function that will validate if the input is a BINOP *)
let is_binop binop =
	match binop with
	 '+' -> true
	|'-' -> true
	|'*' -> true
	|'/' -> true
	|'=' -> true
	| _  -> false

(* A recusive function that checks if there is a closing paren *)
let rec find_closing_paren lexan = 
    match lexan with
     []   -> -1
     (*If the lexan has a head(hd) and tail(tl)*)
    | hd::tl -> begin
    				match hd with
    				')' -> 0
					| _ -> find_closing_paren tl    				
    			end

(**************************************************
Uncomment function_check and recompile to see what
each function takes as a parameter and what is the 
return type. Debug information
***************************************************) 
(*let function_check = ref []*) 

(************************************************** 
	Function Name: get_id

	Purpose: get_id will convert a token to an id
			 and return the id or an error of -1
***************************************************)
let get_id token = 
	match token with
	 'a' .. 'z' -> begin
						Printf.printf ("Valid ALPHA found: %c\n") token;
						(int_of_char token)
	                end 
	| 'A' .. 'Z' -> begin
					    Printf.printf ("Valid ALPHA found: %c\n") token;
					    (int_of_char token)
	  				end 
	| '0' .. '9' -> begin
						Printf.printf ("Valid DIGIT found: %c\n") token;
						(int_of_char token)
					end	
	| '(' -> begin
	  			 Printf.printf ("Valid OPEN_PAREN found: %c\n") token;
	  			 (int_of_char token)
	         end 
	| ')' -> begin
			     Printf.printf ("Valid CLOSING_PAREN found: %c\n") token;
			     (int_of_char token)
	         end
	| '{' -> begin
				 Printf.printf ("Valid OPEN_CURLY_BRACE found: %c\n") token;
				 (int_of_char token);
	         end
	| '}' -> begin
				 Printf.printf ("Valid CLOSING_CURLY_BRACE found: %c\n") token;
				 (int_of_char token);
	         end
	| ';' -> begin
				 Printf.printf ("Valid SEMICOLON found: %c\n") token;
				 (int_of_char token);
	         end		 
	| ' ' -> begin
				  Printf.printf ("WHITE_SPACE found\n");
				  (int_of_char token)	
			 end 
	| '+' -> begin
				  Printf.printf ("Valid BINOP found: %c\n") token;
				  (int_of_char token)
	         end 
	| '-' -> begin
				  Printf.printf ("Valid BINOP found: %c\n") token;
				  (int_of_char token)
			 end 
	| '*' -> begin
			      Printf.printf ("Valid BINOP found: %c\n") token;
			      (int_of_char token)
			 end 
	| '/' -> begin
				  Printf.printf ("Valid BINOP found: %c\n") token;
				  (int_of_char token)
	  		 end
	| '=' -> begin
				  Printf.printf ("Valid BINOP found: %c\n") token;
				  (int_of_char token)
	         end
	| '\n' -> begin
				  Printf.printf("End of lexan found\n");
				  (int_of_char token)
			  end
	| '.' -> begin
				  Printf.printf("Valid DECIMAL found: %c\n") token; 
				  (int_of_char token)
			  end	 
	| _ -> begin
			   Printf.printf ("Invalid Token '%c' found\n") token;
			   -1 (*If -1 an error has happened*)
		   end  
	 

(****************************************************** 
	Function Name: get_token 

	Purpose: get_token will convert a token into a id
			 and return 0 for valid and -1 of invalid.
*******************************************************)
let rec get_token token = 
	match token with
	  [] -> 0 (*Needs to be exhuastive [] -> 0*)
	(*If the lexan has a head(hd) and tail(tl*)
	| hd::tl -> begin
					match (get_id hd) with
					  -1 -> -1 (*If -1 an error has happened*)
					| _ ->  0  (*If a valid id then return 0*)              
				end


(**********************************************************
	Function Name: get_term 

	Purpose: This function input argument is a ref list.
			 Will return if a valid term was found.
			 get_term will get a token or get an expression 
************************************************************)
let rec get_term lexan = 
	match lexan with
	  [] -> 0 (*Needs to be exhuastive [] -> 0*)
	(*If the lexan has a head(hd) and tail(tl*)
	| hd::tl -> begin
					match (get_token lexan) with
					  0 -> begin 
					  			match hd with
					  			 (*If a Open_Paren is found then have to get an expression*)
					  			 '(' -> begin
					  			 			
						  			        match (find_closing_paren tl) with
						  			          0 -> begin
						  			          		   (*Debug print*)
						  			          		   (*Printf.printf("Called5\n");*)
						  			          		   (*OCaml is always pass by value*)   
						  			          		   match (get_expression tl) with
						  			          		  (****************************************************
						  			          		    This is were the recursion gets confusing.
						  			          		    If this get_expression tl = 0 then need to return
						  			          		    something other than zero. If 0 is returned
						  			          		    then it will run the tl a second time due to
						  			          		    pass by value so return another case of 1.
						  			          		   ****************************************************)
						  			          		   | 0 -> 1 
						  			          		   | _ -> -1
						  			               end
						  			          		   
						  			        | _ -> begin
													   Printf.printf("No CLOSING_PAREN to match OPEN_PAREN\n");
						  			        		   -1  			        	
						  			               end					  			 	
						  			 	end
					  			| _ -> 0   
					  			(*0*) (*Return valid term of 0*)
					       end 
					| _ -> -1 	(*If anything other than 0 then -1 an error has happened*)
				end

and
(*******************************************************  
	Function Name: get_expression 

	Purpose: This function input argument is a ref list.
			 It recursively traverses the list.
			 get_expression will get a term 
			 or an expression
********************************************************)
get_expression lexan = 
	match lexan with
	(*If the lexan has a head(hd) and tail(tl*)
	| hd::tl -> begin
					match (get_term lexan) with
					  0 -> begin (*If the current position id is valid *)
					  			(* Check what the current position id is *)
							  	match (List.hd lexan) with
					  			(*If a Close_Paren keep it moving*)        
					  			| ')' -> begin
					  			 		     (*Debug print*)
					  					     (*Printf.printf("%c\n") hd;*) 					  			 	
					  						 get_expression tl
					  			         end
					  			(*If a BinOp then have to get an expression*)
					  			| binop when is_binop(List.hd lexan) = true -> begin 
					  															(*Debug print*)
					  															(*Printf.printf("%c\n") hd;*)
					  															get_expression tl
					  														   end
					  			(*If '\n' end of lexan has been found*)											   
					  			| '\n' -> begin 
					  						  (*Debug print*)	
					  			   		      (*Printf.printf("Newline\n");*)
					  			              0					  				
					  			          end
					  			(*If anything else keep it moving*)          					  			
					  			| _ -> begin 
					  					   (*Debug print*)
					  			   		   (*Printf.printf("Called2\n");*)
					  			   		   (*Printf.printf("%c\n") hd;*)
					  			           get_expression tl					  				
					  			       end
					  	   end
					  
					| 1 -> 0  (*The confusing recursion has validated to 0 or valid*)
					| _ -> -1 (*If -1 an error has happened*)
			    end
	| _ -> -1 (*If -1 an error has happened*)

end;;

(* type pair_of_ints = { a : int; b : int };;*)(* This is an example of typedef in OCaml not related but good to know*)