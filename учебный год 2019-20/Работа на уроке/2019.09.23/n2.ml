let f = open_in "n2.txt";;
let rec read1 s = try
                      let x = input_line f in (if String.length x > String.length s then read1 x
                                                                                    else read1 s)
                  with end_of_file->s;;
print_string (read1 "");;