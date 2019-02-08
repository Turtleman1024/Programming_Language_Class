(*************************************************************************************
        Author: Kenneth M. Murry
                CptS 355
                Project 1
        
		Purpose:
				This is a test of the get_file_buffer function in OCaml.
                This function will load the contents of a file into a char list.
                This function will return a char list.
        Note:
				Include in this directory is a Makefile to run the test see README file
				for instuctions to run the test.

                
*************************************************************************************)
exception Failure of string (* Creating an exception named Failure that takes a string *)

(* 
   Creating a function that will read all the chars 
   in a file passed in from the command argument.
   And store the results in a char list. 
*)


let get_file_buffer char_List file_name =
    (* Creating a file pointer/in_channel *)
    let char_in = open_in file_name in     
  try
    while true do
      (* Getting char from the file *)
      let c = input_char char_in in
       		  (* Storing the char in the list appending to tail of list *)
            char_List := (!char_List@[c])  
    done
  with Failure "File was not opened"       (* This is not correct not catchig error *)
        | End_of_file -> close_in char_in; (* Closing the file pointer/in_channel *)
;;

let main_fun () =
	(* Getting the filename specified by the command line *)
	let file_name = Sys.argv.(1) in
		(* Storing the result of get_file_buffer to buffer which buffer is a char list reference *)
		let buffer = ref [] in
				(* Calling get_file_buffer function*)
				get_file_buffer buffer file_name;
				(*
				print_string "\nThe length of the buffer is: ";
				print_int (List.length !buffer); (* Printing length of the list *)
				print_string ("\n\n");
				*)
				print_string "\nThe string read was: ";
				List.iter print_char !buffer;    (* Iterating through the list and print each element *)

;;

print_string "\nBegin of test\n";
print_string "------------------\n";

main_fun();



print_string "\n------------------\n";
print_string "End of test\n";





(* Attempt a recursive solution 
let get_file_buffer file_name =
    let rec loop char_in acc =
      match input_char char_in with
      |c -> loop char_in (acc@[c])
      | exception(End_of_file) -> acc
    in
    let char_in = open_in file_name in
    loop char_in []
;;
*)
