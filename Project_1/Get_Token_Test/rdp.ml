(*****************************************************************************

        Author: Kenneth M. Murry
                CptS 355
                Project 1
		 Purpose:
		 		    The RDP.c (Recursive Decent Parser) validates input strings from the
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
      Revision
 +-------------+------------+-----------------------------------------------+
 | Rev. Number | Data       | Purpose                                       |
 +-------------+------------+-----------------------------------------------+
 |             |            |                                               |
 +-------------+------------+-----------------------------------------------+
               |            |                                               |
               +------------+-----------------------------------------------+

*****************************************************************************)


let rdp lexan =				
				(* 
					Iterating through the lexan list recursively and getting each element
					and pass it to get_expr
				*)					   
				let get_expresion element =
					Get_token.get_token (int_of_char element) in
				(*	Printf.printf "Looking at element %c now\n" elem in *)
					List.iter get_expresion !lexan;
					
					0;



					   