let f = open_in "n4.UTF8";;
let rec a ()= try 
                  let x = input_byte f in (if x = 224 then 1
                                                      else 0)+ a ()
              with _->0;;
print_int (a ());;