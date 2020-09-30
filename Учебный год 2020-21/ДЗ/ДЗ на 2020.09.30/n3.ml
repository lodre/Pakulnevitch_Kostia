let rec int_of_string s i x = if i<String.length s then int_of_string s (i+1) (x*256 + (int_of_char (s.[i])))
                                                   else x;;

let s = read_line ();;
print_int (int_of_string s 0 0)