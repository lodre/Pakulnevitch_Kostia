let l31 = [3;5;7;8;10;12];;
let l30 = [1;4;6;9;11];;
let l29 = [2];;
let rec find l x = match l with a::b-> if a = x then true else find b x
                               |[]->false;;
let rec f i = if i < 13 then (if (find l31 i) then 31. 
                                              else (if (find l30 i) then 30.
                                                                    else 29.))/.(12.) +. (f (i+1))
                        else 0.;;
print_float (f 1);;