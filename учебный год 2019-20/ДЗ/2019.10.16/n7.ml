type prefix =Question of prefix*prefix
            |Answer of int;;

let p =Question (Question (Answer 1,Answer 2),Question (Answer 3,Answer 4));;
let x = 2;;
let rec find_answer p x = match p with Question (a,b)->(find_answer a x||find_answer b x)
                                      |Answer a->x=a;;
let rec make_answers p x = match p with Question (a,b)->(if (find_answer a x) then 0 
                                                                              else (if (find_answer b x) then 1 
                                                                                                         else failwith "invalid value"))::(make_answers (if (find_answer a x) then a 
                                                                                                                                                                              else b) x)
                                       |Answer a->[];;
let l = make_answers p x;;
let rec print_list l = match l with a::b->(print_int a);(print_char ';');(print_list b)
                                   |[]->();;
print_list l;;