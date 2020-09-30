let f = open_in "n3.txt";;
let rec read l s = try
                      let x = input_char f in if int_of_char x < 65 then if s = "" then read l s
                                                                                   else read (s::l) ""                                                                          
                                                                    else read l (s^(String.make 1 x))
                   with end_of_file->s::l;;
let rec print_list l = match l with a::b -> (print_string (a^"\n"); print_list b)
                                   |[] -> ();;
print_list (read [] "");;