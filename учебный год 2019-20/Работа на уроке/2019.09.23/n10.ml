let f = open_in "n10.txt";;                                    
let rec sum_bytes x = try
                         let b = input_byte f in sum_bytes (x+1)
                     with _-> x;;
let rec sum_chars x = try
                         let b = input_byte f in (if x land 0b11000000 = 0b10000000 then sum_chars x
                                                                                    else sum_chars (x+1))
                     with _-> x;;
let x = (float (sum_bytes 0))/.(float (sum_chars 0));;
print_float x;;