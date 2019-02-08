(*************************************************************************************
        Author: Kenneth M. Murry
                CptS 355
                Project 1
        Purpose:
                This is the main function for the Recursive Descent Parser (RDP)
                
*************************************************************************************)
 
let main_fun () =            
	(* Getting the filename specified by the command line *)
	let file_name = Sys.argv.(1) in
		(* Storing the result of get_file_buffer to lexan which lexan will be a char list reference *)
		let lexan = ref [] in
				(* Calling get_file_buffer function*)
				Get_file_buffer.get_file_buffer lexan file_name;
				(* Print to the screen the lexan *)
				print_string "\nThe string read was: ";
				List.iter print_char !lexan;    (* Iterating through the list and print each element *)				
				print_endline "";

			let error = Rdp.rdp lexan in
			
			(* print_int error; *)

			if error = 0 
			   then
			      begin
			      	  Printf.printf("\nString is valid for the given language");
			      end
			else
				Printf.printf("\nString is invalid for the given language");


				(* Some debug code *)
			  	(* print_string "\nThe length of the lexan is: ";
				print_int (List.length !lexan); (* Printing length of the list *)
				print_string ("\n\n"); *) 

;;

(* Since everything in OCaml is a function main_fun has to be called to run the program*)

(* Check if enough arguments were entered on the command line*)
let argc = Array.length Sys.argv;;
		if argc != 2
           then (* If anything other than 2 arguments then error*)
              begin
              	Printf.printf("USAGE ERROR: %s <input file name>\n") Sys.argv.(0);
              end
        else
           begin (* Two arguments were entered on the command line run the program*)
           	   (* Print start message *)
           	   print_string "\nRecursive Descent Parser in OCaml\n";
           	   print_string "Implemented by Kenneth Murry\n";
           	   print_string "For CptS 355";
           	   print_string "\n---------------------------------\n";

           	   (* Calling main_fun to run the program *)
        	   main_fun ();

        	   (* Printing exit message *)
			   print_string "\n\n------------------------------------------\n";
			   print_string "It is not what technolgy can do for you,\n";
		       print_string "    it is what can you do with technology.\n";

           end
			
