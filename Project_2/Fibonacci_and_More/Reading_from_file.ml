(*
  Language used : OCaml
  Version       : 4.02.3
  Author        : Kenneth M. Murry
  Course        : CptS 355
  Purpose       : This program will open the file specified by the command line
                  argument and print each char to the screen.
        Note:
                To run this program:
                $ make read_file

*)

exception Failure of string (* Declaring a exception named Failure that takes a string *)

(*let buffer = ref [];;*)		    (* Creating a empty List *)

(* 
   Creating a function that will read all the chars 
   in a file passed in from the command. 
*)

let read_file () =
    let char_List = ref [] in 				(* Creating a ref char list *)
    let char_in = open_in Sys.argv.(1) in   (* Creating a file point *)
  try
    while true do
      let c = input_char char_in in 		(* Getting the first char *)
            char_List := c :: !char_List 	(* Storing the char in the list *)
    done
  with End_of_file ->
        char_List := List.rev !char_List;	(* End of file was reaching reversing char list *)
        close_in char_in;					(* Closeing the file pointer*)
        print_string "\nThe length of the list is: ";
        print_int (List.length !char_List);	(* Debug print *)
        print_string ("\n\n");
        List.iter print_char !char_List;	(* Iterating through the list and print each element *)
        print_newline ()
;;

read_file()

