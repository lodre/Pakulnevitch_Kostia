let f = open_in "n1.txt";;
let rec read1 i = try
                      let x = input_line f in read1 (i+1)
                  with end_of_file->i;;
print_int (read1 0);;