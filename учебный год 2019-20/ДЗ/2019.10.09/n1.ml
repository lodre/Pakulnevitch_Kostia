let rec make_string s i j = if i < j then (String.make 1 s.[i])^(make_string s (i+1) j)
                                     else "";;
let rec next s i = if i = String.length s then i
                                          else (if s.[i] = '.' then i
                                                               else next s (i+1));; 
let rec number s i = int_of_string (make_string s i (next s i));;
let rec numbers s i j = if j > 0 then ((number s i):: numbers s ((next s i) + 1) (j-1))
                                 else [];;
let rec in_int l x = match l with a::b->in_int b ((x*256) + a)
                                 |[]->x;;
let ii s = in_int (numbers s 0 4) 0;; 
let rec f x = (x/256,x mod 256);;
let rec make_list x i =if i > 0 then (let y = f x in (snd y)::(make_list (fst y) (i-1)))
                                else [] ;;
let l = make_list x 4;;
let rec make_string l = match l with a::[]->string_of_int a
                                    |a::b->(make_string b)^"."^(string_of_int a);;
let is x = (make_string (make_list x 0));;
let f = open_in "config.txt";;
let ip = read_line f;;
let m = read_line f;;
let ip = ii ip;;
let m = ii m;;
let rec mask ip m =
let rec find_ip ip_old m ip_new = if (mask ip_old m = mask ip_new m) then () else ();; 