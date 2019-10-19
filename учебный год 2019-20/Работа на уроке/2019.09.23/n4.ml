let f = open_in "n4.UTF8";;
let rec a x = try 
                  let x = input_byte f in (if x = 0b11010000 then a 1
                                                             else (if x = 0b10110000 then (1+a 0)
                                                                                     else a 0)) 
              with _->0;;
print_int (a 0);;