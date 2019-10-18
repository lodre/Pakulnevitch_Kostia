let n = "2";; (* 1 - crime and punishment; 2 - The folk book of Faust; 3 - Anna Karenina; 4 - forsythe saga *)
let f = open_in ("n"^n^".txt");;                            
let rec print_list l = match l with a::b->print_string a;print_string "; ";print_list b
                                   |[]->();;            
let rec remove l x = match l with a::b->if a = x then b 
                                                 else a :: (remove b x)
                                 |[]->[];;
let rec pmax l (s,n) = match l with (s1,n1)::b->if n1>n then pmax b (s1,n1)
                                                        else pmax b (s,n)
                                   |[]->(print_string s; (s,n));;
let rec first n l = if n > 0 then (print_string " ";(first (n-1) (remove l (pmax l ("",0)))))
                             else ();; 
let rec words s i = if i < String.length s then (if (s.[i]=' '||s.[i]='\n') then ""
                                                                            else (String.make 1 (s.[i]))^(words s (i+1)))
                                           else "";;
let rec next1 s i= if i < String.length s then (if (s.[i]=' '||s.[i]='\n') then next1 s (i+1)
                                                                            else i)
                                           else i;;
let rec next s i = if i < String.length s then (if (s.[i]=' '||s.[i]='\n') then next1 s (i+1)
                                                                           else next s (i+1))
                                          else i;;
let rec words_list s i = if i < String.length s then (words s i)::(words_list s (next s i))
                                                else [];;    
let rec split_string l s = match l with (a,n)::b->if a = s then (a,(n+1)):: b
                                                           else (a,n):: (split_string b s)
                                       |[]->(s,1)::[];;
let rec map l f x = match l with a::b->map b f (f x a)
                                |[]->x;;
let rec length l = match l with a::b-> 1 + (length b)
                               |[]-> 0;;
let rec read1 g s = try
                        let y = input_line f in let x = map (words_list y 0) g s in
                        read1 g x
                    with end_of_file->s;;
let l = read1 split_string [];;
first 50 l;;                                             