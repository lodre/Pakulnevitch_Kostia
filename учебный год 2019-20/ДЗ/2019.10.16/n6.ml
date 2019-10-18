type prefix =Question of prefix*prefix
            |Answer of int;;

let p =Question (Question (Answer 1,Answer 2),Question (Answer 3,Answer 4));;
let l = [1;0];;
let rec find_answer p l = match (p,l) with Question (x,y),a::b-> find_answer (if a = 0 then x else y) b
                                          |Answer x,a::b-> x
                                          |Question (x,y),[]-> failwith "no answers"
                                          |Answer x,[]-> x;;

let answer = find_answer p l;;
print_int answer;;