let x = 3232235776;;
let rec f x = (x/256,x mod 256);;
let rec make_list x i =if i > 0 then (let y = f x in (snd y)::(make_list (fst y) (i-1)))
                                else [] ;;
let l = make_list x 4;;
let rec make_string l = match l with a::[]->string_of_int a
                                    |a::b->(make_string b)^"."^(string_of_int a);;
print_string (make_string l);;