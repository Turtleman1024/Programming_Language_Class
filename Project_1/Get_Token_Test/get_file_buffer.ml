(*************************************************************************************
        Author: Kenneth M. Murry
                CptS 355
                Project 1
        Purpose:
                This function will load the contents of a file into a char list.
                This function will return a char list.
 
                
*************************************************************************************)
exception Failure of string (* Creating an exception named Failure that takes a string *)

(* 
   This function will read all the chars 
   in a file passed in from the command line argument.
   Then store the results in a char list. 
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


(* Recursive solution but gives warnings 
let get_file_buffer file =
    let rec loop char_in buffer =
      match input_char char_in with
      |c -> loop char_in (buffer@[c])
      | exception(End_of_file) -> buffer
    in
    let char_in = open_in file in
    loop char_in []
;;
*)


