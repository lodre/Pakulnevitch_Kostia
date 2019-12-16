let l = [1;0;-1;0;1];;


let rec print l = match l with a::b-> if a = -1 then (print_char '$';print b)
                                                else (print_int a;print b)
                             |_-> ();;
print l;;