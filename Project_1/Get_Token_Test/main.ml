(*************************************************************************************
        Author: Kenneth M. Murry
                CptS 355
                Project 1
        Purpose:
                This is the main function for the Recursive Descent Parser (RDP)
                1. This file contains the main function for the RDP.
                
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
			      	  Printf.printf("String is valid");
			      end
			else
				Printf.printf("String is invalid");


				(* Some debug code *)
			  	(* print_string "\nThe length of the lexan is: ";
				print_int (List.length !lexan); (* Printing length of the list *)
				print_string ("\n\n"); *) 

;;

print_string "\nBegin of test\n";
print_string "------------------\n";

main_fun ();

print_string "\n------------------\n";
print_string "End of test\n";



