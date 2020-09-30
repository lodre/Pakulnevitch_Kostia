let f = open_in "n1.txt";;
let rec read s = try
                    let x = input_char f in read (s^(String.make 1 x))
                 with end_of_file->s;;
print_string (read "");;   
