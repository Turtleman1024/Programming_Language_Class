(******************************************************************************
    Author: Kenneth M. Murry
            CptS 355
            Project 2
	Purpose:
	      create_symbol_tbl is responsible for creating a compilied language
	      from the rdp's validated language. The symbol table will be used to 
	      create a compilied Language

	Note:  Thinking of using chaining for the hashtable/symbol table.
		   And then using the LIFO method of retrieving the information later.

			TYPE  |	VARIABLE & BINDING_VALUE
		------------------------------------------
			int   |       a
				  |       5


******************************************************************************)
module CompiliedLanguage =
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

(*******************************************************  
	Function Name: get_program 

	Purpose: This function input argument is a ref list
			 and a symbol table.
			 This function will start to validate if
			 the program is valid for the given language.
			 
********************************************************)	
let rec get_program lexan my_symbol_tbl =
	match lexan with
	  hd::tl -> begin
					match (List.hd lexan) with
					| "{" -> begin
					 			  (*Beginning of scope found*)
					 			  Printf.printf ("Get <decl> called\n");
					 			  get_declaraction tl my_symbol_tbl;
								  						 			  
							 end
					| ";" -> begin
								  (*This could be the sign of the end of a
					 			    declaration or an assignment*)
					 			  (*get_assign*)
					 			  Printf.printf ("<SEMICOLON> found\n");
					 			  0
								 	
					         end
					| "}" -> begin
					 			  (*End of scope program*)
					 			  Printf.printf ("End of scope found\n");
					 			  0
					         end
					| _ -> begin					 			
				     		    Printf.printf ("get_program catch all!\n");
				                get_program tl my_symbol_tbl;											 	
					       end					
	            end 
	| _ -> -1 (*If -1 an error has happened*)
and

(*******************************************************  
	Function Name: get_declaration

	Purpose: This function input argument is a ref list.
			 This function will validate a declaration
			 statement.
			 Should store the declaration in a
			 hash table/symbol table.
	Form   : <type> <variable> = <value>;
********************************************************)
get_declaraction lexan my_symbol_tbl =
	match lexan with
	| hd::tl ->begin
					(*get_type <int> or <float>*)
					Printf.printf ("Get <type> called\n");					
					match get_type hd with
					| true -> begin
								 (*Valid type found Add hd to symbol table *)
								 match get_assign tl with
								 | true -> begin
								 			match tl with
								 			| hd2::tl2 -> begin 
								 							  Printf.printf ("VARIABLE: '%s' found\n") hd2;
								 							  (*Valid variable found ADD hd2 to symbol table*)
								 							  Hashtbl.add my_symbol_tbl hd hd2;
								 							  match tl2 with
								 							  | hd3::tl3 -> begin
								 							  				match hd3 with
								 							  				| "=" -> begin (*Assignment BINOP found call get_value*)
								 							  								  match get_value tl3 with
								 							  								  | true -> begin (*Valid value found bind to variable*)
								 							  								  				match tl3 with
								 							  								  				| hd4::tl4 -> begin								 						 	  								  					
			 							  								  										  		      Printf.printf ("VALUE: '%s' bound to VARIABLE: '%s' ") (String.sub hd4 0 (String.length hd4-1))  hd2;
	 							  								  										                      Hashtbl.add my_symbol_tbl hd (String.sub hd4 0 (String.length hd4-1));
								 							  								  			                      0
								 							  								  			                  end
								 							  								  				| _ -> -1								 							  								  	
								 							  								  		   end
								 							  								  | _ -> begin
								 							  								  			-1
								 							  								  		 end
							
								 							  							  end
								 							  				| _ -> begin
								 							  							-1
								 							  					   end
								 							  			end
								 							  |	_    -> begin
											 								Printf.printf ("no variable found!");
								 											-1					 							  	
								 							  			end						 				
								 			              end
								 			| _ -> begin
								 						Printf.printf ("This called\n");
								 						-1
								 				   end
								 		   end
								 | _ -> begin
								 			Printf.printf ("no variable found!");
								 			-1
								 		end		  								  
							  end
							
					| _    -> -1

					
	           end
	| _ -> -1 (*If -1 an error has happened*)
and
(*******************************************************  
	Function Name: get_type

	Purpose: This function input argument is a string.
			 This function will validate a type
			 statement.
			 Should store the type in a
			 hash table/symbol table.
	
********************************************************)
get_type lexan =
	match lexan with
	| "int" -> begin
				Printf.printf ("TYPE: '%s' found\n") lexan;
				true
			 end
	| "float" -> begin
				Printf.printf ("TYPE: '%s' found\n") lexan;
				true
			 end
    | _ -> false
				
and
(*******************************************************  
	Function Name: get_assign

	Purpose: This function input argument is a ref list.
			 This function will validate a assignment
			 statement.
			 Should store the assignment in a
			 hash table/symbol table.
	Form   : <variable> = <value>;
********************************************************)
get_assign lexan =
	match lexan with
	| hd::tl -> begin
				   Printf.printf ("Get <assign> called\n");
				   true
			   end
	| _ -> false 
and
(*******************************************************  
	Function Name: get_value

	Purpose: This function input argument is a ref list.
			 This function will validate a value.
			 Should store the value in a
			 hash table/symbol table.
	Form   : <variable> = <value>;
********************************************************)
get_value lexan =
	match lexan with
	| hd::tl -> begin
					Printf.printf ("Get <value> called\n");
					true
				end
	| _ -> false

end;;