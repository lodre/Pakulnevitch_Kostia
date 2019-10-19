let f = open_in "n8.utf8";;
let rec read x = try
                    let b = output_byte f in read (x+1)
                 with _->x;;
print_int x;;