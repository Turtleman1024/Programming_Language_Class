(*************************************************************************************
        Author: Kenneth M. Murry
                CptS 355
                Project 2
        Purpose:
                c_file will create a C programming source file from the 
                validated Symbol table. The function should take the parameter of a
                Symbol table to convert the symbol table to a C source file. 
                
*************************************************************************************)

(**************************************************************  
	Function Name: file_name

	Purpose: This function will check if main.c exists if it
	         does not exists store the string "main.c" in the 
	         function.
	         If "main.c" does exists create a secondard
	         C source file named "main2.c" to provent
	         overwriting an existing C source file.
***************************************************************)
let file_name = 
	match (Sys.file_exists "main.c") with
		| true -> "main2.c"
		| _    -> "main.c"
(**************************************************************  
	Function Name: header & main.

	Purpose: These two function holds the include and main 
			 function arguments. 
***************************************************************)
let header = "#include <stdio.h>\n\n"
let main   = "int main(int argc, char const *argv[])\n{\n"

(**************************************************************  
	Function Name: print_c_file

	Purpose: This function will create an out channel and
			 create a C source file that can be compiled and 
			 executed.
***************************************************************)
let print_c_file =
	let out_file = open_out file_name in
		Printf.fprintf out_file "%s" header;
		Printf.fprintf out_file "%s" main;
		Printf.fprintf out_file "\t<BODY>\n";
		Printf.fprintf out_file "    return 0;\n";
		Printf.fprintf out_file "}\n\n";
		close_out out_file;;
		


(*
let c_file symbol_tbl =
	let out_file = open_out file_name in
		match symbol_tbl with
		  [] -> -1
		| hd::tl -> begin
						Printf.fprintf out_file "%s" header;
						Printf.fprintf out_file "%s" main;
						Printf.fprintf out_file "\t<BODY>\n";
						Printf.fprintf out_file "    return 0;\n";
						Printf.fprintf out_file "}\n\n";
						close_out out_file;
						0		
					end;;
*)